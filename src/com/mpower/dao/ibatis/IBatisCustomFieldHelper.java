package com.mpower.dao.ibatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.DefaultedMap;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.mpower.domain.model.customization.CustomField;

/**
 * This class abstracts out the base methods used for working
 * with custom fields so that the logic can be reused by both the
 * CustomizableSqlMapClientTemplate and the IBatisCustomFieldDao.
 * @version 1.0
 */
public class IBatisCustomFieldHelper {

    private SqlMapClientTemplate template;

    public IBatisCustomFieldHelper(SqlMapClientTemplate template) {
        this.template = template;
    }

    /**
     * Read the custom fields for the specified entity type and ID. The combination
     * of these two values uniquely identify a custom field.
     * @param entityId the ID of the entity the custom field is associated with
     * @param entityType the type of the entity
     * @return the Map of CustomFields, keyed by name
     */
    @SuppressWarnings("unchecked")
    public Map<String, CustomField> readCustomFields(Long entityId, String entityType) {

        Map<String, CustomField> ret = new DefaultedMap(new CustomField());
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("entityId", entityId);
        params.put("entityType", entityType);

        List<Map> customFields = template.queryForList("SELECT_CUSTOM_FIELD_BY_ENTITY", params);

        // group the custom fields by name. There could be multiple
        // rows for each combination of entity type, entity ID and field name,
        // which is the case when we normalize a comma-separated list of values
        Map<String, List<Map>> tempMap = new HashMap<String, List<Map>>();
        for(Map<String,Object> map : customFields) {
            String key = (String) map.get("name");
            if(tempMap.containsKey(key)) {
                tempMap.get(key).add(map);
            } else {
                List<Map> list = new ArrayList<Map>();
                list.add(map);
                tempMap.put(key, list);
            }
        }

        // Each key in the map, and its list, represents the contents of a single
        // custom field. We now flatten it out into a single entry
        for(String key : tempMap.keySet()) {

            List<Map> values = tempMap.get(key);

            CustomField customField = new CustomField();
            Map<String, Object> record = values.get(0);

            StringBuilder fieldValue = new StringBuilder();
            // use first item for the basics
            customField.setId( (Long) record.get("id") );
            customField.setName( key );
            customField.setEntityId( (Long) record.get("entityId") );
            customField.setEntityType( (String) record.get("entityType") );
            fieldValue.append( record.get("value") );

            // now the fun; loop over values and append on to the string builder
            // to arrive at the final field value
            if(values.size() > 1) {
                // start at index 1, since we already grabbed zero above
                for(int i=1; i<values.size(); i++) {
                    record = values.get(i);
                    fieldValue.append(",").append( record.get("value") );
                }
            }

            customField.setValue( fieldValue.toString() );
            // put the final object into the map to be returned
            ret.put(key, customField);
        }

        return ret;
    }

    public void maintainCustomFields(Map<String, CustomField> customFields) {

        for (String key : customFields.keySet()) {

            CustomField customField = customFields.get(key);

            // clear out the old values if we're doing an update. Not
            // very elegant but provides a simple solution rather than trying
            // match up rows that have changed
            if (customField.getId() != null && customField.getId() > 0) {
                deleteCustomField(customField);
            }

            String value = customField.getValue();

            // if value is null or zero-length on a new custom field,
            // don't even bother to save it.
            if (value == null || value.trim().equals("")) {
                continue;
            }

            String[] values = value.split(",");
            Long firstValue = null;
            int seq = 0;
            // run through each value and insert it with the correct sequence
            // number. If there is only one value (no commas), this still works just fine
            for (String splitValue : values) {

                String trimmedValue = splitValue.trim();
                if (!trimmedValue.equals("")) {
                    saveSingleCustomField(customField, trimmedValue, seq++);

                    // save the Id value from the element at Sequence 0, which we'll
                    // use for the final Id for the custom field
                    if(firstValue == null) {
                        firstValue = customField.getId();
                    }
                }
            }

            // if we actually saved a new custom field, update the ID
            // with the value from the row at sequence zero
            if(firstValue != null) {
                customField.setId(firstValue);
            }
        }
    }

    /**
     * Deletes all the custom fields associated with the underlying CustomizableAbstractEntity
     * @param customFields
     */
    public void deleteCustomFields(Map<String, CustomField> customFields) {

        for (String key : customFields.keySet()) {

            CustomField customField = customFields.get(key);

            // clear out the old values if we're doing an update. Not
            // very elegant but provides a simple solution rather than trying
            // match up rows that have changed
            if (customField.getId() != null && customField.getId() > 0) {
                deleteCustomField(customField);
            }
        }
    }


    // Helper method to delete a single custom file
    private void deleteCustomField(CustomField customField) {

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("entityType", customField.getEntityType());
        params.put("entityId", customField.getEntityId());

        // Entity exists, but client is clearing the value, so remove the orphans
        template.delete("DELETE_CUSTOM_FIELD", params);

    }

    // Helper method to persist a single value for custom field, include sequence number
    private void saveSingleCustomField(CustomField customField, String value, int sequenceNumber) {

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("entityType", customField.getEntityType());
        params.put("entityId", customField.getEntityId());
        params.put("fieldName", customField.getName());
        params.put("fieldValue", value);
        params.put("sequenceNum", sequenceNumber);

        Long id = (Long) template.insert("INSERT_CUSTOM_FIELD", params);
        customField.setId(id);
    }



}

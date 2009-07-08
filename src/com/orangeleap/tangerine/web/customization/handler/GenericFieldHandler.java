/*
 * Copyright (c) 2009. Orange Leap Inc. Active Constituent
 * Relationship Management Platform.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package com.orangeleap.tangerine.web.customization.handler;

import com.orangeleap.tangerine.domain.customization.FieldRequired;
import com.orangeleap.tangerine.domain.customization.SectionField;
import com.orangeleap.tangerine.service.ConstituentService;
import com.orangeleap.tangerine.service.RelationshipService;
import com.orangeleap.tangerine.service.customization.FieldService;
import com.orangeleap.tangerine.service.customization.MessageService;
import com.orangeleap.tangerine.type.FieldType;
import com.orangeleap.tangerine.type.MessageResourceType;
import com.orangeleap.tangerine.util.OLLogger;
import com.orangeleap.tangerine.web.customization.FieldVO;
import org.apache.commons.logging.Log;
import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.PropertyAccessorFactory;
import org.springframework.context.ApplicationContext;

import java.util.List;
import java.util.Locale;

public class GenericFieldHandler implements FieldHandler {

    /**
     * Logger for this class and subclasses
     */
    protected final Log logger = OLLogger.getLog(getClass());

    protected FieldService fieldService;
    protected MessageService messageService;
    protected ConstituentService constituentService;
    protected RelationshipService relationshipService;

    public GenericFieldHandler(ApplicationContext appContext) {
        constituentService = (ConstituentService) appContext.getBean("constituentService");
        messageService = (MessageService) appContext.getBean("messageService");
        fieldService = (FieldService) appContext.getBean("fieldService");
        relationshipService = (RelationshipService) appContext.getBean("relationshipService");
    }

    public String getFieldLabelName(SectionField sectionField) {
        return sectionField.getFieldLabelName();
    }

    public String getFieldRequiredName(SectionField sectionField) {
        return sectionField.getFieldRequiredName();
    }

    public String getFieldPropertyName(SectionField sectionField) {
        String fieldPropertyName = sectionField.getFieldPropertyName();

        if ((sectionField.isCompoundField() && sectionField.getSecondaryFieldDefinition().isCustom()) ||
                (sectionField.isCompoundField() == false && sectionField.getFieldDefinition().isCustom())) {
            fieldPropertyName += ".value";
        }
        return fieldPropertyName;
    }

    public FieldType getFieldType(SectionField sectionField) {
        return sectionField.getFieldType();
    }

    protected Object getPropertyValue(Object model, FieldVO fieldVO) {
        BeanWrapper modelBeanWrapper = PropertyAccessorFactory.forBeanPropertyAccess(model);
        String fieldProperty = fieldVO.getFieldName();
        Object propertyValue = null;
        if (modelBeanWrapper.isReadableProperty(fieldProperty)) {
            propertyValue = modelBeanWrapper.getPropertyValue(fieldProperty);
        }
        return propertyValue;
    }

    public FieldVO handleField(List<SectionField> sectionFields, SectionField currentField, Locale locale, Object model) {
        FieldVO fieldVO = new FieldVO();

        fieldVO.setModel(model);
        fieldVO.setFieldName(getFieldPropertyName(currentField));
        fieldVO.setFieldType(getFieldType(currentField));

        String fieldLabelName = getFieldLabelName(currentField);
        fieldVO.setHelpText(messageService.lookupMessage(MessageResourceType.FIELD_HELP, fieldLabelName, locale));
        fieldVO.setHelpAvailable(!GenericValidator.isBlankOrNull(fieldVO.getHelpText()));

        String labelText = messageService.lookupMessage(MessageResourceType.FIELD_LABEL, fieldLabelName, locale);
        if (GenericValidator.isBlankOrNull(labelText)) {
            if (!currentField.isCompoundField()) {
                labelText = currentField.getFieldDefinition().getDefaultLabel();
            } else {
                labelText = currentField.getSecondaryFieldDefinition().getDefaultLabel();
            }
        }
        fieldVO.setLabelText(labelText);

        FieldRequired fr = fieldService.lookupFieldRequired(currentField);
        fieldVO.setRequired(fr != null && fr.isRequired());
        fieldVO.setHierarchy(relationshipService.isHierarchy(currentField.getFieldDefinition()));
        fieldVO.setDisabled(fieldService.isFieldDisabled(currentField, model));

        setEntityAttributes(fieldVO, currentField);

        if (!FieldType.SPACER.equals(fieldVO.getFieldType()) && model != null) {
            Object propertyValue = getPropertyValue(model, fieldVO);
            fieldVO.setFieldValue(propertyValue);
            if (propertyValue != null) {
                BeanWrapper propBeanWrappermodel = PropertyAccessorFactory.forBeanPropertyAccess(propertyValue);
                if (propBeanWrappermodel.isReadableProperty("id")) {
                    fieldVO.setId((Long) propBeanWrappermodel.getPropertyValue("id"));
                }
                if (propBeanWrappermodel.isReadableProperty("displayValue")) {
                    fieldVO.setDisplayValue(propBeanWrappermodel.getPropertyValue("displayValue"));
                }
                if (propBeanWrappermodel.isReadableProperty("entityName")) {
                    fieldVO.setEntityName(propBeanWrappermodel.getPropertyValue("entityName").toString());
                }
            }
        }

        return fieldVO;
    }

    protected void setEntityAttributes(FieldVO fieldVO, SectionField currentField) {
        // For fields that depend on an entity attribute being selected to show.
        // For entity attributes like "employee,donor" the entity attribute css classes that activate this field are "ea-employee ea-donor"
        String entityAttributes = currentField.getFieldDefinition().getEntityAttributes();
        StringBuilder entityAttributesStyle = new StringBuilder();
        if (entityAttributes != null) {
            String[] entityAttributesArray = entityAttributes.split(",");
            for (String ea : entityAttributesArray) {
                entityAttributesStyle.append(" ea-" + ea);
            }
        }
        fieldVO.setEntityAttributes(entityAttributesStyle.toString().trim());
    }
}

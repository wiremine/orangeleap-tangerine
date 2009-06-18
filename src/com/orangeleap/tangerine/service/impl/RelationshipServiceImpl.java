package com.orangeleap.tangerine.service.impl;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import com.orangeleap.tangerine.util.OLLogger;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.orangeleap.tangerine.dao.ConstituentDao;
import com.orangeleap.tangerine.dao.CustomFieldDao;
import com.orangeleap.tangerine.dao.FieldDao;
import com.orangeleap.tangerine.dao.util.QueryUtil;
import com.orangeleap.tangerine.domain.Constituent;
import com.orangeleap.tangerine.domain.QueryLookup;
import com.orangeleap.tangerine.domain.customization.CustomField;
import com.orangeleap.tangerine.domain.customization.FieldDefinition;
import com.orangeleap.tangerine.domain.customization.FieldRelationship;
import com.orangeleap.tangerine.service.QueryLookupService;
import com.orangeleap.tangerine.service.RelationshipService;
import com.orangeleap.tangerine.service.exception.ConstituentValidationException;
import com.orangeleap.tangerine.service.relationship.ConstituentTreeNode;
import com.orangeleap.tangerine.service.relationship.RelationshipUtil;
import com.orangeleap.tangerine.service.relationship.TooManyLevelsException;
import com.orangeleap.tangerine.type.FieldType;
import com.orangeleap.tangerine.type.RelationshipDirection;
import com.orangeleap.tangerine.type.RelationshipType;
import com.orangeleap.tangerine.util.StringConstants;

import edu.emory.mathcs.backport.java.util.Collections;

@Service("relationshipService")
@Transactional(propagation = Propagation.REQUIRED)
public class RelationshipServiceImpl extends AbstractTangerineService implements RelationshipService {
	
	public static final int MAX_TREE_DEPTH = 200;
	private static final String CONSTITUENT = "constituent";
 
    /** Logger for this class and subclasses */
    protected final Log logger = OLLogger.getLog(getClass());

    @Resource(name = "constituentDAO")
    private ConstituentDao constituentDao;

    @Resource(name = "fieldDAO")
    private FieldDao fieldDao;
    
    @Resource(name = "customFieldDAO")
    private CustomFieldDao customFieldDao;
    
    @Resource(name="queryLookupService")
    protected QueryLookupService queryLookupService;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = ConstituentValidationException.class)
    public Constituent maintainRelationships(Constituent constituent) throws ConstituentValidationException {
    	if (logger.isTraceEnabled()) {
    	    logger.trace("maintainRelationships: constituent = " + constituent);
    	}
    	if (constituent.getSite() == null) {
            return constituent;
        }
    	ConstituentValidationException ex = new ConstituentValidationException();
    	
    	Map<String, FieldDefinition> map = constituent.getFieldTypeMap();
    	if (map == null) {
    		logger.debug("FieldTypeMap not set, skipping relationship maintenance.");
    		return constituent;
    	}
    	
    	for (Map.Entry<String, FieldDefinition> e: map.entrySet()) {
    		String key = e.getKey();
    		FieldDefinition fd = e.getValue();
    		boolean isReferenceTypeField = fd.getFieldType() == FieldType.QUERY_LOOKUP || fd.getFieldType() == FieldType.MULTI_QUERY_LOOKUP || fd.getFieldType() == FieldType.QUERY_LOOKUP_OTHER;
    		if (isReferenceTypeField && fd.isCustom() && isRelationship(fd)) {
    			
    			String customFieldName = fd.getCustomFieldName();
    			String oldFieldValue = getOldFieldValue(constituent, key);
       			String newFieldValue = getNewFieldValue(constituent, key);  
       		    List<Long> oldids = RelationshipUtil.getIds(oldFieldValue);
    			List<Long> newids = RelationshipUtil.getIds(newFieldValue);
    			validateIds(customFieldName, newids);

    			// Get old and new reference field values for orphan reference deletes 
    			List<Long> deletes = getDeletes(oldids, newids);

    			// Validate and set custom fields for date ranges on this and referenced fields.
    			List<CustomField> list = this.readCustomFieldsByConstituentAndFieldName(constituent.getId(), customFieldName);
    			try {
    				maintainCustomFieldsByConstituentAndFieldDefinition(constituent.getId(), fd.getId(), list, deletes);
    			} catch (ConstituentValidationException ex1) {
    				ex.addValidationResults(ex1.getValidationResults());
    			}
	   			
    		}
    	}
    	if (!ex.getValidationResults().isEmpty()) {
            throw ex;
        }
    	
        return constituent;
    }
    
    private List<Long> getDeletes(List<Long> oldids, List<Long> newids) {
    	List<Long> result = new ArrayList<Long>();
    	for (Long oldid : oldids) {
    		boolean found = false;
        	for (Long newid : newids) {
        		if (oldid.equals(newid)) {
                    found = true;
                }
    		}
        	if (!found) {
                result.add(oldid);
            }
    	}
    	return result;
    }
    
    // Validate id list for import.  They must exist and be on same site.
    private void validateIds(String customFieldName, List<Long> ids) {
    	for (Long id : ids) {
    		Constituent constituent = constituentDao.readConstituentById(id);
    		if (constituent == null || !constituent.getSite().getName().equals(getSiteName())) {
                throw new RuntimeException("Invalid id "+id+" for "+customFieldName);
            }
    	}
    }
    
    // Return the tree reachable from Constituent, using the "parent" field name (e.g. "organization.parent")
    @Override
    @Transactional(readOnly=true, propagation = Propagation.REQUIRED, rollbackFor = ConstituentValidationException.class)
	public ConstituentTreeNode getTree(Constituent constituent, String parentCustomFieldName, boolean oneLevelOnly, boolean fromHeadOfTree) throws ConstituentValidationException {
    	
       	Map<String, FieldDefinition> map = constituent.getFieldTypeMap();
    	for (Map.Entry<String, FieldDefinition> e: map.entrySet()) {
    		FieldDefinition fd = e.getValue();
    		if (fd.getCustomFieldName().equals(parentCustomFieldName)) {
    			List<FieldRelationship> details = fieldDao.readDetailFieldRelationships(fd.getId());  
    			for (FieldRelationship fr : details) {
	    			if (fr.isRecursive()) {
	        			String childrenCustomFieldName = fr.getMasterRecordField().getCustomFieldName();
	            		ConstituentTreeNode tree = getTree(constituent, parentCustomFieldName, childrenCustomFieldName, oneLevelOnly, fromHeadOfTree);
	    				return tree;
	    			}
    			}
    		}
    	}
    	return null;
	}

    private String getNewFieldValue(Constituent constituent, String fieldname) {
    	BeanWrapperImpl bean = new BeanWrapperImpl(constituent);
    	String result = (String) bean.getPropertyValue(fieldname + ".value");
    	return (result == null) ? "" : result;
    }
    
    private String getOldFieldValue(Constituent constituent, String fieldname) {
		String oldFieldValue = (String)constituent.getFieldValueMap().get(fieldname);  
		return (oldFieldValue == null) ? "" : oldFieldValue;
    }
    
	
	private void ensureOtherConstituentAttributeIsSet(FieldDefinition otherFieldDefinition, Constituent otherConstituent) {
		String fieldAttributes = otherFieldDefinition.getEntityAttributes();
		if (fieldAttributes == null) {
            return;
        }
		// If it's a field that applies to only a single attribute, make sure the attribute is set on the other constituent. 
		// For multiple attributes, take the first as the default.
		if (fieldAttributes.contains(",")) {
			fieldAttributes = fieldAttributes.substring(0,fieldAttributes.indexOf(","));
		}
	    otherConstituent.addConstituentRole(fieldAttributes);
	}

	// Field must be a detail (child list) custom field.
	private void getDescendantIds(List<Long> list, Constituent constituent, String customFieldName, int level) throws ConstituentValidationException {
		
		if (level > MAX_TREE_DEPTH) {
			throw new TooManyLevelsException(customFieldName);
		}

		List<Constituent> referencedConstituents = getConstituents(constituent, customFieldName);
		for (Constituent referencedConstituent : referencedConstituents) {
			Long referencedId = referencedConstituent.getId();
			if (list.contains(referencedId)) {
				// This will normally happen if they place a child over a parent or vice-versa.  It is caught in the recursion check logic when the item causing the loop is edited.
				String recursionLoop = "Relationship tree for "+customFieldName+" forms a loop due to reference from " + constituent.getDisplayValue() + " to " + referencedConstituent.getDisplayValue();
				logger.debug(recursionLoop);
				return;
			}
			list.add(referencedId);
			getDescendantIds(list, referencedConstituent, customFieldName, level + 1);
		}
		
	}
	
	// Returns list of constituent Ids in the reference type custom field.
	private List<Long> getIdList(Constituent constituent, String customFieldName) {
		
		CustomField customField = constituent.getCustomFieldMap().get(customFieldName);
		String customFieldValue = customField.getValue();
		List<Long> ids = RelationshipUtil.getIds(customFieldValue);
        return ids;		
        
	}
	
	// Returns list of Constituent objects referenced by the custom field
	private List<Constituent> getConstituents(Constituent constituent, String customFieldName) {
	    List<Constituent> constituents = new ArrayList<Constituent>();
		if (StringUtils.hasText(customFieldName)) {
    	    List<Long> ids = getIdList(constituent, customFieldName);
    	    if (ids != null && ids.isEmpty() == false) {
    	        constituents = constituentDao.readConstituentsByIds(ids);
    	    }
		}
		return constituents;
	}
	
	// Constituent is any member of the tree.  Returns the tree based on the recursive relationship defined by the custom fields.
	@Override
	public ConstituentTreeNode getTree(Constituent constituent, String parentCustomFieldName, String childrenCustomFieldName, boolean oneLevelOnly, boolean fromHeadOfTree) throws ConstituentValidationException {
		if (fromHeadOfTree) {
            constituent = getHeadOfTree(constituent, parentCustomFieldName);
        }
		ConstituentTreeNode constituentNode = new ConstituentTreeNode(constituent, 0);
		getSubTree(constituentNode, childrenCustomFieldName, oneLevelOnly);
		return constituentNode;
	}
	
	// Field must be a master (parent id) custom field.
	@Override
	public Constituent getHeadOfTree(Constituent constituent, String parentCustomFieldName) throws ConstituentValidationException {
		int level = 0;
		while (true) {
			level++;
			if (level > MAX_TREE_DEPTH) {
				throw new TooManyLevelsException(parentCustomFieldName);
			}
			List<Constituent> referencedConstituents = getConstituents(constituent, parentCustomFieldName);
			if (referencedConstituents.size() == 0) {
                return constituent;
            }
			constituent = referencedConstituents.get(0);
		}
	}
	
	public void getSubTree(ConstituentTreeNode constituentNode, String childrenCustomFieldName, boolean oneLevelOnly) throws ConstituentValidationException {
		if (constituentNode.getLevel() > MAX_TREE_DEPTH) {
			throw new TooManyLevelsException(childrenCustomFieldName);
		}

		List<Constituent> referencedConstituents = getConstituents(constituentNode.getConstituent(), childrenCustomFieldName);
		for (Constituent referencedConstituent : referencedConstituents) {
			ConstituentTreeNode child = new ConstituentTreeNode(referencedConstituent, constituentNode.getLevel() + 1);
			constituentNode.getChildren().add(child);
			if (!oneLevelOnly) {
                getSubTree(child, childrenCustomFieldName, oneLevelOnly);
            }
		}
	}
	
	// If constituent is in tree, return the node, otherwise return null.
	public ConstituentTreeNode findConstituentNodeInTree(Constituent constituent, ConstituentTreeNode tree) {
		if (equals(constituent, tree.getConstituent())) {
            return tree;
        }
	    for (ConstituentTreeNode constituentNode: tree.getChildren()) {
	    	ConstituentTreeNode node = findConstituentNodeInTree(constituent, constituentNode);
	    	if (node != null) {
                return node;
            }
	    }
	    return null;
	}

	public Constituent getFirstCommonAncestor(Constituent p1, Constituent p2, String parentCustomFieldName) throws ConstituentValidationException {
		List<Constituent> p1Parents = new ArrayList<Constituent>();
		p1Parents.add(p1);
		List<Constituent> p2Parents = new ArrayList<Constituent>();
		p2Parents.add(p2);
		int level = 0;
		while (true) {
			level++;
			if (level > MAX_TREE_DEPTH) {
				throw new TooManyLevelsException(parentCustomFieldName);
			}
			List<Constituent> referencedConstituents1 = getConstituents(p1, parentCustomFieldName);
			List<Constituent> referencedConstituents2 = getConstituents(p2, parentCustomFieldName);
			if (referencedConstituents1.size() == 0 && referencedConstituents2.size() == 0) {
                return null;
            }
			if (referencedConstituents1.size() > 0) {
                p1 = referencedConstituents1.get(0);
            }
			if (referencedConstituents2.size() > 0) {
                p2 = referencedConstituents2.get(0);
            }
			if (contains(p1Parents, p2)) {
                return p2;
            }
			if (contains(p2Parents, p1)) {
                return p1;
            }
		}
	}
	
	public String debugPrintTree(ConstituentTreeNode tree) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < tree.getLevel(); i++) {
            sb.append("\t");
        }
		sb.append(tree.getConstituent().getDisplayValue()).append("\r\n");
		for (ConstituentTreeNode child: tree.getChildren()) {
            sb.append(debugPrintTree(child));
        }
		return sb.toString();
	}
	
	private boolean contains(List<Constituent> constituents, Constituent constituent) {
		for (Constituent aconstituent: constituents) {
            if (equals(constituent, aconstituent)) {
                return true;
            }
        }
		return false;
	}

	// Don't want to add an equals method to the JPA object
	private boolean equals(Constituent p1, Constituent p2) {
		if (p1 == null && p2 == null) {
            return true;
        }
		if (p1 == null || p2 == null) {
            return false;
        }
		return p1.getId().equals(p2.getId());
	}
	
	private static boolean thisCanBeMultiValued(RelationshipDirection direction, RelationshipType fieldRelationshipType) {
		return fieldRelationshipType.equals(RelationshipType.MANY_TO_MANY) ||
		( fieldRelationshipType.equals(RelationshipType.ONE_TO_MANY) && direction.equals(RelationshipDirection.DETAIL) );
	}
	
    
    @Override
    public boolean isHierarchy(FieldDefinition fd) {
    	// This must be the parent reference field on the detail record.
    	List<FieldRelationship> list = fieldDao.readDetailFieldRelationships(fd.getId());
    	for (FieldRelationship fr : list) {
    		if (fr.isRecursive()) {
    			return true;
    		}
    	}
    	return false;
    }
    
    @Override
    public boolean isRelationship(FieldDefinition fd) {
    	return (fieldDao.readMasterFieldRelationships(fd.getId()).size() > 0 || fieldDao.readDetailFieldRelationships(fd.getId()).size() > 0) ;
    }
    
    @Override
	public List<CustomField> readCustomFieldsByConstituentAndFieldName(Long constituentId, String fieldName) {
	    if (logger.isTraceEnabled()) {
	        logger.trace("ConstituentCustomFieldRelationshipService.readAllCustomFieldsByConstituentAndFieldName: constituentId = " + constituentId);
	    }
	    if (null == constituentDao.readConstituentById(constituentId)) {
            return null;
        }
	    return customFieldDao.readCustomFieldsByEntityAndFieldName(constituentId, CONSTITUENT, fieldName);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = ConstituentValidationException.class)
    public void maintainCustomFieldsByConstituentAndFieldDefinition(Long constituentId, String fieldDefinitionId, List<CustomField> list, List<Long> additionalDeletes) throws ConstituentValidationException 
    {
    	
	    if (logger.isTraceEnabled()) {
	        logger.trace("ConstituentCustomFieldRelationshipService.maintainCustomFieldsByConstituentAndFieldDefinition: constituentId = " + constituentId);
	    }
	    if (null == constituentDao.readConstituentById(constituentId)) {
            throw new RuntimeException("Invalid constituent id");
        }
	    FieldDefinition fieldDefinition = fieldDao.readFieldDefinition(fieldDefinitionId);
	    if (null == fieldDefinition) {
            throw new RuntimeException("Invalid Field Definition id");
        }

	    validateNoSelfReference(constituentId, list, fieldDefinition);
	    // TODO check hierarchy recursion
		validateDateRangesAndSave(constituentId, fieldDefinition, list, additionalDeletes);
	   
    }
    
    private void validateNoSelfReference(Long constituentId, List<CustomField> list, FieldDefinition fieldDefinition) throws ConstituentValidationException {
    	String id = "" + constituentId;
		for (CustomField cf : list) {
			if (cf.getValue().equals(id)) {
				ConstituentValidationException ex = new ConstituentValidationException("Field value cannot reference itself.");
				ex.addValidationResult("fieldSelfReference", new Object[]{fieldDefinition.getDefaultLabel()});
				throw ex;
			}
		}
    }

    private void validateDateRangesAndSave(Long constituentId, FieldDefinition fieldDefinition, List<CustomField> newlist, List<Long> additionalDeletes) throws ConstituentValidationException {

    	FieldDefinition refField = getCorrespondingField(fieldDefinition);
    	
    	// Check date ranges on this entity
		boolean datesvalid = validateDateRanges(fieldDefinition.getId(), newlist);
		if (!datesvalid) {
			ConstituentValidationException ex = new ConstituentValidationException("Date ranges cannot overlap for a single-valued field.");
			ex.addValidationResult("fieldDateOverlap", new Object[]{fieldDefinition.getDefaultLabel()});
			throw ex;
		} 
		
    	// Find any orphaned back references 
		if (refField != null) {
			List<CustomField> deletes = getDeletes(constituentId, fieldDefinition, newlist);
			for (CustomField cf : deletes) { 
				additionalDeletes.add(new Long(cf.getValue()));
			}
			for (Long refid : additionalDeletes) {
				List<CustomField> reflist = customFieldDao.readCustomFieldsByEntityAndFieldName(new Long(refid), CONSTITUENT, refField.getCustomFieldName());
		        for (CustomField refcf: reflist) {
		        	Long backref = new Long(refcf.getValue());
		        	if (backref.equals(constituentId)) {
		        		customFieldDao.deleteCustomField(refcf);
		        	}
		        }
			}
		}
		
	    // Save custom fields on main entity
		customFieldDao.maintainCustomFieldsByEntityAndFieldName(constituentId, CONSTITUENT, fieldDefinition.getCustomFieldName(), newlist);
	    newlist = customFieldDao.readCustomFieldsByEntityAndFieldName(constituentId, CONSTITUENT, fieldDefinition.getCustomFieldName());

    	// Check date ranges on referenced entities
		if (refField != null) {
			
			// Sort by referenced id
			Map<String, List<CustomField>> listsByValues = new HashMap<String, List<CustomField>>();
			for (CustomField cf : newlist) {
				String value = cf.getValue();
				List<CustomField> alist = listsByValues.get(value);
				if (alist == null) {
					alist = new ArrayList<CustomField>();
					listsByValues.put(value, alist);
				}
				alist.add(cf);
			}
				
			// For each referenced id, delete all the back references to this id and re-populate.
			for (Map.Entry<String, List<CustomField>> me: listsByValues.entrySet()) {
				
				List<CustomField> alist = me.getValue();
				CustomField cf1 = alist.get(0);
				
				Long refid = new Long(cf1.getValue());
				List<CustomField> reflist = customFieldDao.readCustomFieldsByEntityAndFieldName(new Long(refid), CONSTITUENT, refField.getCustomFieldName());
				Iterator<CustomField> it = reflist.iterator();
				while (it.hasNext()) {
					CustomField refcf = it.next();
		        	Long backref = new Long(refcf.getValue());
					if (backref.equals(cf1.getEntityId())) {
                        it.remove();
                    }
				}
				
				for (CustomField cf: alist) {
		        	CustomField newcf = new CustomField();
		        	newcf.setEntityId(refid);
		        	newcf.setEntityType("constituent");
		        	newcf.setName(refField.getCustomFieldName());
		        	newcf.setStartDate(cf.getStartDate());
		        	newcf.setEndDate(cf.getEndDate());
		        	newcf.setValue(""+cf.getEntityId());
		        	reflist.add(newcf);
				}
				
		        Constituent refConstituent;
				boolean refdatesvalid = validateDateRanges(refField.getId(), reflist);
				if (!refdatesvalid) {
					refConstituent = constituentDao.readConstituentById(new Long(cf1.getValue()));
					ConstituentValidationException ex = new ConstituentValidationException("Date ranges conflict on corresponding custom field for referenced value " + refConstituent.getFullName());
					ex.addValidationResult("referenceFieldDateOverlap", new Object[]{refConstituent.getFullName()});
					throw ex;
				} 
				
				customFieldDao.maintainCustomFieldsByEntityAndFieldName(refid, CONSTITUENT, refField.getCustomFieldName(), reflist);
			    
			    // Set new roles on refId.
				refConstituent = constituentDao.readConstituentById(new Long(cf1.getValue()));
			    ensureOtherConstituentAttributeIsSet(refField, refConstituent);
				refConstituent = constituentDao.maintainConstituent(refConstituent);
			    
			}
			
		}
		
    }
    
    private void sortByStartDate(List<CustomField> list) {
    	Collections.sort(list, new Comparator<CustomField>() {
			@Override
			public int compare(CustomField o1, CustomField o2) {
				int result = o1.getStartDate().compareTo(o2.getStartDate());
				if (result == 0) {
					result = o1.getSequenceNumber() - o2.getSequenceNumber();
				}
				if (result == 0) {
					result = o1.getValue().compareTo(o2.getValue());
				}
				return result;
			}
    	});
    }
    
    private List<CustomField> getDeletes(Long constituentId, FieldDefinition fieldDefinition, List<CustomField> newlist) {
		List<CustomField> deletes = new ArrayList<CustomField>();
	    List<CustomField> oldlist = customFieldDao.readCustomFieldsByEntityAndFieldName(constituentId, CONSTITUENT, fieldDefinition.getCustomFieldName());
	    for (CustomField oldcf : oldlist) {
	    	boolean found = false;
		    for (CustomField newcf : newlist) {
		    	if (oldcf.getValue().equals(newcf.getValue())) {
		    		found = true;
		    		break;
		    	}
		    }
		    if (!found) {
		    	deletes.add(oldcf);
		    }
	    }
	    return deletes;
    }
    
    
    // Supports one relationship defined per field definition.
    private FieldDefinition getCorrespondingField(FieldDefinition fd) {
		List<FieldRelationship> masters = fieldDao.readMasterFieldRelationships(fd.getId()); 
		FieldDefinition result = searchRelationships(fd, masters);
		if (result != null) {
            return result;
        }
		List<FieldRelationship> details = fieldDao.readDetailFieldRelationships(fd.getId()); 
		result = searchRelationships(fd, details);
		return result;
    }
    
    private FieldDefinition searchRelationships(FieldDefinition fd, List<FieldRelationship> list) {
		for (FieldRelationship fr : list) {
			if (fr.getMasterRecordField().getId().equals(fd.getId())) {
                return fr.getDetailRecordField();
            }
			if (fr.getDetailRecordField().getId().equals(fd.getId())) {
                return fr.getMasterRecordField();
            }
		}
		return null;
    }
    
    private boolean validateDateRanges(String fieldDefinitionId, List<CustomField> list) {
    	
    	boolean isMultiValued = false;

    	List<FieldRelationship> masters = fieldDao.readMasterFieldRelationships(fieldDefinitionId);
    	List<FieldRelationship> details = fieldDao.readDetailFieldRelationships(fieldDefinitionId);
    	if (masters.size() > 0) {
    		isMultiValued = thisCanBeMultiValued(RelationshipDirection.DETAIL, masters.get(0).getRelationshipType());
    	}
    	if (details.size() > 0) {
    		isMultiValued = thisCanBeMultiValued(RelationshipDirection.MASTER, details.get(0).getRelationshipType());
    	}
    	
    	FieldDefinition fd = fieldDao.readFieldDefinition(fieldDefinitionId);
    	FieldType ft = fd.getFieldType();
    	if (ft.equals(FieldType.QUERY_LOOKUP) || ft.equals(FieldType.PICKLIST)) {
            isMultiValued = false;
        }
    	if (ft.equals(FieldType.MULTI_PICKLIST) || ft.equals(FieldType.MULTI_PICKLIST)) {
            isMultiValued = true;
        }
    
    	return validateDateRangesDoNotOverlap(list, isMultiValued);
    	    
    }    
    
    // Date ranges cannot overlap for a single valued field.
    // For a multi-valued field, date ranges still cannot overlap for a single custom field value.
    private boolean validateDateRangesDoNotOverlap(List<CustomField> list, boolean multiValued) {
    	
    	Map<String, List<CustomField>> exclusivelists = new HashMap<String, List<CustomField>>();
    	for (CustomField cf : list) {
    		
    		String value = cf.getValue();
    		if (!multiValued) {
                value = "";
            }
    		
    		List<CustomField> alist = exclusivelists.get(value);
    		if (alist == null) {
    			alist = new ArrayList<CustomField>();
    			exclusivelists.put(value, alist);
    		}
    		alist.add(cf);
    	}
    	
    	for (Map.Entry<String, List<CustomField>> me : exclusivelists.entrySet()) {
    		List<CustomField> alist = me.getValue();
    		if (!checkList(alist)) {
                return false;
            }
    	}
    	
    	
    	return true;
    }
    
    private boolean checkList(List<CustomField> list) {
    	sortByStartDate(list);
    	Date d1 = null;
    	for (CustomField cf : list) {
    		if (!cf.getEndDate().after(cf.getStartDate())) {
    			return false;
    		}
    		if (d1 != null && !cf.getStartDate().after(d1)) {
    			return false;
    		}
    		d1 = cf.getEndDate();
    	}
    	return true;
    }
    
    @Override
    public List<Constituent> executeRelationshipQueryLookup(String fieldType, String searchOption, String searchValue) {
        if (logger.isTraceEnabled()) {
            logger.trace("executeRelationshipQueryLookup: fieldType = " + fieldType + " searchOption = " + searchOption + " searchValue = " + searchValue);
        }
        List<Constituent> constituents = null;
        if (StringConstants.LAST_NAME.equals(searchOption) || 
                StringConstants.FIRST_NAME.equals(searchOption) || 
                StringConstants.ORGANIZATION_NAME.equals(searchOption)) {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put(searchOption, searchValue);
            
            if (StringConstants.INDIVIDUAL.equals(fieldType)) {
                params.put(QueryUtil.ADDITIONAL_WHERE, "constituent_type = 'individual' ");
            }
            else {
                params.put(QueryUtil.ADDITIONAL_WHERE, "constituent_type = 'organization' ");
            }
            constituents = constituentDao.searchConstituents(params);
        }
        else {
            if (logger.isWarnEnabled()) {
                logger.warn("executeRelationshipQueryLookup: Unknown searchOption = " + searchOption);
            }
        }
        return constituents;
    }
    
    @Override
    public String isIndividualOrganizationRelationship(String fieldDefinitionId) {
        if (logger.isTraceEnabled()) {
            logger.trace("isIndividualOrganizationRelationship: fieldDefinitionId = " + fieldDefinitionId);
        }
        String relationship = null;
        if (fieldDefinitionId != null) {
            QueryLookup queryLookup = queryLookupService.readQueryLookup(fieldDefinitionId);
            if (queryLookup != null && queryLookup.getSqlWhere() != null) {
                if (queryLookup.getSqlWhere().indexOf(StringConstants.INDIVIDUAL) > -1) {
                    relationship = StringConstants.INDIVIDUAL;
                }
                else if (queryLookup.getSqlWhere().indexOf(StringConstants.ORGANIZATION) > -1) {
                    relationship = StringConstants.ORGANIZATION;
                }
            }
        }
        if (relationship == null) {
        	// 'AccountMangerFor', for example is only for certain roles ('individual' is not listed in entity attributes).
        	relationship = StringConstants.INDIVIDUAL;
        }
        return relationship;
    }
}

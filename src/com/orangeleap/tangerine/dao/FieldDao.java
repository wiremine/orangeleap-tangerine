package com.orangeleap.tangerine.dao;

import java.util.List;

import com.orangeleap.tangerine.controller.customField.CustomFieldRequest;
import com.orangeleap.tangerine.domain.QueryLookup;
import com.orangeleap.tangerine.domain.QueryLookupParam;
import com.orangeleap.tangerine.domain.customization.FieldDefinition;
import com.orangeleap.tangerine.domain.customization.FieldRelationship;
import com.orangeleap.tangerine.domain.customization.FieldRequired;
import com.orangeleap.tangerine.domain.customization.FieldValidation;

public interface FieldDao {
    
    public FieldRequired readFieldRequired(String sectionName, String fieldDefinitionId, String secondaryFieldDefinitionId);
    public FieldValidation readFieldValidation(String sectionName, String fieldDefinitionId, String secondaryFieldDefinitionId);
    public FieldRelationship readFieldRelationship(Long id);
    public FieldDefinition readFieldDefinition(String id);
    public List<FieldRelationship> readMasterFieldRelationships(String masterFieldDefId);
    public List<FieldRelationship> readDetailFieldRelationships(String detailFieldDefId);
    public FieldDefinition maintainFieldDefinition(FieldDefinition fieldDefinition);
    public FieldValidation maintainFieldValidation(FieldValidation fieldValidation);
    public void maintainCustomFieldGuruData(CustomFieldRequest customFieldRequest);

}

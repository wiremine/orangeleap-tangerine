package com.mpower.web.customization;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.commons.validator.GenericValidator;
import org.springframework.context.ApplicationContext;

import com.mpower.domain.type.FieldType;
import com.mpower.domain.type.MessageResourceType;
import com.mpower.entity.User;
import com.mpower.entity.customization.FieldDefinition;
import com.mpower.entity.customization.SectionField;

public class PreferredPhoneFieldHandler extends GenericFieldHandler {

    public PreferredPhoneFieldHandler(ApplicationContext appContext) {
        super(appContext);
    }

    /**
     * Reads each field on the page to get a list of phones types that are used to build the drop-down.
     */
    public FieldVO handleField(List<SectionField> sectionFields, SectionField currentField, Locale locale, User user, Object model) {
        FieldVO fieldVO = super.handleField(sectionFields, currentField, locale, user, model);
        fieldVO.codes = new ArrayList<String>();
        fieldVO.codes.add("");
        fieldVO.displayValues = new ArrayList<String>();
        fieldVO.displayValues.add("");
        for (SectionField currentSectionField : sectionFields) {
            if (FieldType.PHONE == currentSectionField.getFieldDefinition().getFieldType()) {
                FieldDefinition currentFieldDefinition = currentSectionField.getFieldDefinition();
                String displayValue = messageService.lookupMessage(user.getSite(), MessageResourceType.FIELD_LABEL, currentSectionField.getFieldLabelName(), locale);
                if (GenericValidator.isBlankOrNull(displayValue)) {
                    displayValue = currentField.getFieldDefinition().getDefaultLabel();
                }
                fieldVO.displayValues.add(displayValue);

                fieldVO.codes.add(currentFieldDefinition.getFieldName());
            }
        }
        return fieldVO;
    }
}

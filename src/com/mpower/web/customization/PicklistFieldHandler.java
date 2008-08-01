package com.mpower.web.customization;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.validator.GenericValidator;
import org.springframework.context.ApplicationContext;

import com.mpower.domain.customization.Picklist;
import com.mpower.domain.customization.PicklistItem;
import com.mpower.domain.customization.SectionField;
import com.mpower.type.MessageResourceType;

public class PicklistFieldHandler extends GenericFieldHandler {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

	
    public PicklistFieldHandler(ApplicationContext appContext) {
        super(appContext);
    }

    @Override
    public FieldVO handleField(List<SectionField> sectionFields, SectionField currentField, Locale locale, String siteName, Object model) {
        FieldVO fieldVO = super.handleField(sectionFields, currentField, locale, siteName, model);
        fieldVO.codes = new ArrayList<String>();
        fieldVO.displayValues = new ArrayList<String>();
        fieldVO.referenceValues = new ArrayList<String>();
        Picklist picklist = fieldService.readPicklistBySiteAndFieldName(siteName, currentField.getPicklistName());
        if (picklist != null) {
            for (Iterator<PicklistItem> iterator = picklist.getPicklistItems().iterator(); iterator.hasNext();) {
                PicklistItem item = iterator.next();
                fieldVO.codes.add(item.getItemName());
                String displayValue = messageService.lookupMessage(siteName, MessageResourceType.PICKLIST_VALUE, item.getItemName(), locale);
                if (GenericValidator.isBlankOrNull(displayValue)) {
                    displayValue = item.getDefaultDisplayValue();
                }
                fieldVO.displayValues.add(displayValue);
                fieldVO.referenceValues.add(item.getReferenceValue());
            }
        }
        return fieldVO;
    }
}

package com.mpower.web.customization;

import java.util.List;
import java.util.Locale;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mpower.domain.customization.SectionField;
import com.mpower.type.FieldType;

public class SpacerFieldHandler implements FieldHandler {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

	
    @Override
    public FieldVO handleField(List<SectionField> sectionFields, SectionField currentField, Locale locale, String siteName, Object model) {
        FieldVO fieldVO = new FieldVO();
        fieldVO.setFieldType(FieldType.SPACER);
        return fieldVO;
    }
}

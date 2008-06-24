package com.mpower.web.customization;

import java.util.List;
import java.util.Locale;

import com.mpower.domain.type.FieldType;
import com.mpower.entity.User;
import com.mpower.entity.customization.SectionField;

public class SpacerFieldHandler implements FieldHandler {

    @Override
    public FieldVO handleField(List<SectionField> sectionFields, SectionField currentField, Locale locale, User user, Object model) {
        FieldVO fieldVO = new FieldVO();
        fieldVO.setFieldType(FieldType.SPACER);
        return fieldVO;
    }
}

package com.mpower.web.customization.handler;

import org.springframework.beans.BeanWrapper;
import org.springframework.beans.PropertyAccessorFactory;

import com.mpower.web.customization.FieldVO;

public class OtherFieldHandler {

    public static void handleOtherField(FieldVO fieldVO, Object model) {
        BeanWrapper bw = PropertyAccessorFactory.forBeanPropertyAccess(model);
        
        String fieldName = fieldVO.getFieldName();
        Object propertyValue = bw.getPropertyValue(fieldName);
        
        /* If the property value and ID are not defined, see if the 'other' field is populated and use that value instead */
        if (fieldVO.getId() == null && propertyValue == null) {
            Object otherFieldValue = bw.getPropertyValue(fieldVO.getOtherFieldName());
            if (otherFieldValue != null) {
                fieldVO.setDisplayValue(otherFieldValue);
            }
        }
    }
}

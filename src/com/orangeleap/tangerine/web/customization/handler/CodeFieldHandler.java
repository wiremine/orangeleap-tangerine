package com.orangeleap.tangerine.web.customization.handler;

import java.util.List;
import java.util.Locale;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;

import com.orangeleap.tangerine.domain.customization.PicklistItem;
import com.orangeleap.tangerine.domain.customization.SectionField;
import com.orangeleap.tangerine.service.PicklistItemService;
import com.orangeleap.tangerine.web.customization.FieldVO;

public class CodeFieldHandler extends GenericFieldHandler {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());
    private final PicklistItemService picklistItemService;

    public CodeFieldHandler(ApplicationContext appContext) {
        super(appContext);
        picklistItemService = (PicklistItemService)appContext.getBean("picklistItemService");
    }

    @Override
    public FieldVO handleField(List<SectionField> sectionFields, SectionField currentField, Locale locale, Object model) {
        FieldVO fieldVO = super.handleField(sectionFields, currentField, locale, model);
        Object propertyValue = super.getPropertyValue(model, fieldVO);
        fieldVO.setDisplayValue(resolve(fieldVO.getFieldName(), (String)propertyValue));
        return fieldVO;
    }
    
    private String resolve(String picklistNameId, String defaultDisplayValue) {
        if (logger.isTraceEnabled()) {
            logger.trace("resolve: picklistNameId = " + picklistNameId + " defaultDisplayValue = " + defaultDisplayValue);
        }
        String val = defaultDisplayValue;
        PicklistItem code = picklistItemService.getPicklistItemByDefaultDisplayValue(picklistNameId, defaultDisplayValue);
        if (code != null) {
            val = code.getValueDescription();
        }
        return val;
    }
}

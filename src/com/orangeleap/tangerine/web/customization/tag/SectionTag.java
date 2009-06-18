package com.orangeleap.tangerine.web.customization.tag;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import com.orangeleap.tangerine.util.OLLogger;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.orangeleap.tangerine.domain.customization.SectionDefinition;
import com.orangeleap.tangerine.domain.customization.SectionField;
import com.orangeleap.tangerine.service.customization.PageCustomizationService;

public class SectionTag extends TagSupport {

    /** Logger for this class and subclasses */
    protected final Log logger = OLLogger.getLog(getClass());


    private static final long serialVersionUID = 1L;
    private SectionDefinition sectionDefinition;
    private PageCustomizationService pageCustomizationService;

    @Override
    public int doStartTag() throws JspException {
        pageCustomizationService = (PageCustomizationService) WebApplicationContextUtils.getWebApplicationContext(this.pageContext.getServletContext()).getBean("pageCustomizationService");
        List<SectionField> sectionFields = pageCustomizationService.readSectionFieldsBySection(sectionDefinition);
        pageContext.getRequest().setAttribute("sectionFieldList", sectionFields);
        pageContext.getRequest().setAttribute("sectionFieldCount", sectionFields.size());
        return Tag.EVAL_BODY_INCLUDE;
    }

    public SectionDefinition getSectionDefinition() {
        return sectionDefinition;
    }

    public void setSectionDefinition(SectionDefinition sectionDefinition) {
        this.sectionDefinition = sectionDefinition;
    }
}

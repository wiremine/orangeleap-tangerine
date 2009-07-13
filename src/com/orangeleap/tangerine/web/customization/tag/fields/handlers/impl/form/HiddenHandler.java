package com.orangeleap.tangerine.web.customization.tag.fields.handlers.impl.form;

import com.orangeleap.tangerine.web.customization.tag.fields.handlers.impl.AbstractFieldHandler;
import com.orangeleap.tangerine.domain.customization.SectionDefinition;
import com.orangeleap.tangerine.domain.customization.SectionField;
import com.orangeleap.tangerine.controller.TangerineForm;
import org.springframework.context.ApplicationContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;
import java.util.List;

/**
 * User: alexlo
 * Date: Jul 7, 2009
 * Time: 5:24:06 PM
 */
public class HiddenHandler extends AbstractFieldHandler {

	public HiddenHandler(ApplicationContext applicationContext) {
		super(applicationContext);
	}

	@Override
	public void handleField(HttpServletRequest request, HttpServletResponse response, PageContext pageContext, SectionDefinition sectionDefinition, List<SectionField> sectionFields, SectionField currentField, TangerineForm form, StringBuilder sb) {
		String unescapedFieldName = currentField.getFieldPropertyName();
		Object fieldValue = form.getFieldValue(unescapedFieldName);
		String formFieldName = TangerineForm.escapeFieldName(unescapedFieldName);

		doHandler(request, response, pageContext, sectionDefinition, sectionFields, currentField, form, formFieldName, fieldValue, sb);
	}

	@Override
	protected void doHandler(HttpServletRequest request, HttpServletResponse response, PageContext pageContext,
	                      SectionDefinition sectionDefinition, List<SectionField> sectionFields, SectionField currentField,
	                      TangerineForm form, String formFieldName, Object fieldValue, StringBuilder sb) {
		sb.append("<input value=\"").append(checkForNull(fieldValue)).append("\" class=\"");
		sb.append(resolveEntityAttributes(currentField)).append("\" name=\"");
		sb.append(formFieldName).append("\" id=\"").append(formFieldName).append("\" type=\"hidden\"/>");
	}
}
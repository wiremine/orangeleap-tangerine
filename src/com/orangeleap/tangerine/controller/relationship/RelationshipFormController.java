package com.orangeleap.tangerine.controller.relationship;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.orangeleap.tangerine.dao.FieldDao;
import com.orangeleap.tangerine.domain.Person;
import com.orangeleap.tangerine.domain.customization.CustomField;
import com.orangeleap.tangerine.domain.customization.FieldDefinition;
import com.orangeleap.tangerine.service.ConstituentService;
import com.orangeleap.tangerine.service.RelationshipService;

public class RelationshipFormController extends SimpleFormController {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());
    
    @Resource(name = "constituentService")
    private ConstituentService constituentService;

    @Resource(name = "relationshipService")
    private RelationshipService relationshipService;

    @Resource(name = "fieldDAO")
    private FieldDao fieldDao;

	@Override
    public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = super.handleRequestInternal(request, response);
		
        Long personId = new Long(request.getParameter("personId"));
		Person person = constituentService.readConstituentById(personId);
		if (person == null) return null;

        String fieldDefinitionId = request.getParameter("fieldDefinitionId");
        FieldDefinition fieldDefinition = fieldDao.readFieldDefinition(fieldDefinitionId);
        String fieldname = fieldDefinition.getCustomFieldName();
        String fieldlabel = fieldDefinition.getDefaultLabel();
        
        List<CustomField> list = relationshipService.readCustomFieldsByConstituentAndFieldName(new Long(personId), fieldname);
        
        if (list.size() == 0) {
        	CustomField cf = new CustomField();
        	cf.setName(fieldname);
        	cf.setEntityId(person.getId());
        	cf.setEntityType("person");
        	list.add(cf);
        }
        
        RelationshipForm form = new RelationshipForm();
        form.setCustomFieldList(list);
        form.setPerson(person);
        form.setFieldDefinition(fieldDefinition);
        form.setFieldLabel(fieldlabel);
        
        mav.addObject("form", form);
        return mav;
        
    }

    
	@Override
    protected Object formBackingObject(HttpServletRequest request) throws ServletException {
       return "";
    }
	
	@SuppressWarnings("unchecked")
	private List<CustomField> getMap(HttpServletRequest request, Long personId, String fieldName) {
		List<CustomField> list = new ArrayList<CustomField>();
		Enumeration e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String parm = (String)e.nextElement();
			if (parm.startsWith("cfFieldValue")) {
				String fieldnum = parm.substring("cfFieldValue".length());
				CustomField cf = new CustomField();
				cf.setEntityId(personId);
				cf.setEntityType("person");
				cf.setName(fieldName);
				cf.setValue(request.getParameter(parm).trim());
				if (cf.getValue().length() > 0) {
					try {
						cf.setStartDate(getDate(request.getParameter("cfStartDate"+fieldnum).trim()));
						cf.setEndDate(getDate(request.getParameter("cfEndDate"+fieldnum).trim()));
						list.add(cf);
					} catch (Exception ex) {
					}
				}
			}
		}
		return list;
	}
	
	private Date getDate(String s) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		return sdf.parse(s);
	}
	


    @Override
    // Validate date ranges don't overlap if a single-valued custom field, modify custom field values, and maintain other side of relationships.
    public ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws ServletException {

        ModelAndView mav = new ModelAndView(getSuccessView());

		Long personId = new Long(request.getParameter("personId"));
		Person person = constituentService.readConstituentById(personId);
		if (person == null) return null;
		String fieldDefinitionId = request.getParameter("fieldDefinitionId");
		FieldDefinition fieldDefinition = fieldDao.readFieldDefinition(fieldDefinitionId);
		String fieldName = fieldDefinition.getCustomFieldName();
    	List<CustomField> list = getMap(request, personId, fieldName);

    	try {
    		relationshipService.maintainCustomFieldsByConstituentAndFieldDefinition(person.getId(), fieldDefinitionId, list);
    	} catch (Exception e) {
			mav.addObject("message", e.getMessage());
    	}
    	
        return mav;
        
    }
    
  
    
}

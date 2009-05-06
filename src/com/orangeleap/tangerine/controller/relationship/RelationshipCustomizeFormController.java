package com.orangeleap.tangerine.controller.relationship;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

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
import com.orangeleap.tangerine.domain.AbstractCustomizableEntity;
import com.orangeleap.tangerine.domain.Person;
import com.orangeleap.tangerine.domain.customization.ConstituentCustomFieldRelationship;
import com.orangeleap.tangerine.domain.customization.CustomField;
import com.orangeleap.tangerine.domain.customization.FieldDefinition;
import com.orangeleap.tangerine.service.ConstituentCustomFieldRelationshipService;
import com.orangeleap.tangerine.service.ConstituentService;
import com.orangeleap.tangerine.service.CustomFieldRelationshipService;
import com.orangeleap.tangerine.service.RelationshipService;

public class RelationshipCustomizeFormController extends SimpleFormController {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());
    

    @Resource(name="constituentCustomFieldRelationshipService")
    protected ConstituentCustomFieldRelationshipService constituentCustomFieldRelationshipService;
    
    @Resource(name = "constituentService")
    private ConstituentService constituentService;

    @Resource(name = "relationshipService")
    private RelationshipService relationshipService;
    
    @Resource(name="customFieldRelationshipService")
    protected CustomFieldRelationshipService customFieldRelationshipService;

    @Resource(name = "fieldDAO")
    private FieldDao fieldDao;
 

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        return "";
    }
	
	protected Map<String, String> getMap(Map<String, CustomField> map) {
		Map<String, String> result = new TreeMap<String, String>();
		for (Map.Entry<String, CustomField> entry : map.entrySet()) {
			result.put(entry.getValue().getName(), entry.getValue().getValue());
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	protected Map<String, String> getMap(HttpServletRequest request) {
		Map map = new TreeMap<String, String>();
		Enumeration e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String parm = (String)e.nextElement();
			if (parm.startsWith("cfname")) {
				String fieldnum = parm.substring(6);
				String key = request.getParameter(parm).trim();
				String value = request.getParameter("cfvalue"+fieldnum).trim();
				if (key.length() > 0) map.put(key, value);
			}
		}
		return map;
	}
	
	protected void updateCustomFieldMap(Map<String, String> map, AbstractCustomizableEntity entity) {
		entity.getCustomFieldMap().clear();
		for (Map.Entry<String, String> e : map.entrySet()) {
			entity.setCustomFieldValue(e.getKey(), e.getValue());
		}
	}
	
	private CustomField getCustomField(Person person, Long customFieldId) {
		Iterator<Map.Entry<String, CustomField>> it = person.getCustomFieldMap().entrySet().iterator();
		while (it.hasNext()) {
			CustomField cf = it.next().getValue();
			if (cf.getId().equals(customFieldId)) {
				return cf;
			}
		}
		return null;
	}
	
    @SuppressWarnings("unchecked")
    @Override
    protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors, Map controlModel) throws Exception {
    	
		Long constituentId = new Long(request.getParameter("personId"));
		Person person = constituentService.readConstituentById(constituentId);
		if (person == null) return null;
		String fieldDefinitionId = request.getParameter("fieldDefinitionId");
		FieldDefinition fieldDefinition = fieldDao.readFieldDefinition(fieldDefinitionId);
		Long customFieldId = new Long(request.getParameter("customFieldId"));
		CustomField cf = getCustomField(person, customFieldId);
		

        ConstituentCustomFieldRelationship constituentCustomFieldRelationship = 
        	constituentCustomFieldRelationshipService.readByConstituentFieldDefinitionCustomFieldIds(constituentId, fieldDefinitionId, cf.getValue(), cf.getStartDate());
        
        if (constituentCustomFieldRelationship == null) {
        	constituentCustomFieldRelationship = new ConstituentCustomFieldRelationship();
        	constituentCustomFieldRelationship.setConstituentId(constituentId);
        	constituentCustomFieldRelationship.setCustomFieldStartDate(cf.getStartDate());
        	constituentCustomFieldRelationship.setCustomFieldValue(cf.getValue());
        	constituentCustomFieldRelationship.setMasterFieldDefinitionId(fieldDefinitionId);
        	constituentCustomFieldRelationship = constituentCustomFieldRelationshipService.maintainConstituentCustomFieldRelationship(constituentCustomFieldRelationship);
        }
        
        // TODO add default custom fields and values on constituentCustomFieldRelationship from customFieldRelationship if not exist
        
        Map<String, String> stringmap = getMap(constituentCustomFieldRelationship.getCustomFieldMap());

		if (stringmap.size() == 0) stringmap.put("", "");
		
		ModelAndView mav = super.showForm(request, response, errors, controlModel);
		mav.addObject("map", stringmap);
		mav.addObject("person", person);
		mav.addObject("fieldDefinition", fieldDefinition);
		mav.addObject("customField", cf);
		mav.addObject("constituentCustomFieldRelationship", constituentCustomFieldRelationship);
		mav.addObject("refvalue", request.getParameter("refvalue"));
        return mav;
    }
    
    
    // TODO combine with showform
	@Override
    public ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws ServletException {
    	
		Long constituentId = new Long(request.getParameter("personId"));
		Person person = constituentService.readConstituentById(constituentId);
		if (person == null) return null;
		String fieldDefinitionId = request.getParameter("fieldDefinitionId");
		FieldDefinition fieldDefinition = fieldDao.readFieldDefinition(fieldDefinitionId);
		Long customFieldId = new Long(request.getParameter("customFieldId"));
		CustomField cf = getCustomField(person, customFieldId);

        ConstituentCustomFieldRelationship constituentCustomFieldRelationship = 
        	constituentCustomFieldRelationshipService.readByConstituentFieldDefinitionCustomFieldIds(constituentId, fieldDefinitionId, cf.getValue(), cf.getStartDate());
     
        Map<String, String> stringmap = getMap(request);

        updateCustomFieldMap(stringmap, constituentCustomFieldRelationship);
         
        constituentCustomFieldRelationship = constituentCustomFieldRelationshipService.maintainConstituentCustomFieldRelationship(constituentCustomFieldRelationship);
        
        ModelAndView mav = new ModelAndView(getSuccessView());
        stringmap = getMap(constituentCustomFieldRelationship.getCustomFieldMap());
		
        if (stringmap.size() == 0) stringmap.put("", "");
        
		mav.addObject("map", stringmap);
		mav.addObject("person", person);
		mav.addObject("fieldDefinition", fieldDefinition);
		mav.addObject("customField", cf);
		mav.addObject("constituentCustomFieldRelationship", constituentCustomFieldRelationship);
		mav.addObject("refvalue", request.getParameter("refvalue"));
        return mav;
        
    }
	    

	
}

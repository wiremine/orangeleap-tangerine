package com.mpower.controller.importexport.importers;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;

import com.mpower.domain.Gift;
import com.mpower.domain.Person;
import com.mpower.service.GiftService;
import com.mpower.service.PersonService;
import com.mpower.service.exception.PersonValidationException;
import com.mpower.type.PageType;


public class GiftImporter extends EntityImporter {
	
    protected final Log logger = LogFactory.getLog(getClass());

    private PersonService personservice;
    private GiftService giftservice;

	public GiftImporter(String entity, ApplicationContext applicationContext) {
		super(entity, applicationContext);
		personservice = (PersonService)applicationContext.getBean("personService");
		giftservice = (GiftService)applicationContext.getBean("giftService");
	}
	
	@Override
	public String getIdField() {
		return "accountNumber";
	}
	
	@Override
	protected PageType getPageType() {
	    return PageType.gift;
	}



	@Override
	public void importValueMap(String action, Map<String, String> values) throws PersonValidationException {
		
		if (!action.equals(EntityImporter.ACTION_ADD)) {
			throw new RuntimeException("Gifts can only be ADDed.");
		} 
		
		String id = values.get(getIdField());
		if (id == null) throw new RuntimeException(getIdField() + " field is required.");
	    Person person = personservice.readPersonById(new Long(id));
		if (person == null) throw new RuntimeException(getIdField() + " " + id + " not found.");
		logger.debug("Importing gift for constituent "+id+"...");
		
		Gift gift = giftservice.createDefaultGift(person);
		mapValuesToObject(values, gift);
		
		giftservice.maintainGift(gift);
		
	}
	
	
	
}

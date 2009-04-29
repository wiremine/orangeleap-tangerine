package com.orangeleap.tangerine.service.impl;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.PropertyAccessorFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.orangeleap.tangerine.dao.ConstituentDao;
import com.orangeleap.tangerine.dao.GiftDao;
import com.orangeleap.tangerine.dao.SiteDao;
import com.orangeleap.tangerine.domain.CommunicationHistory;
import com.orangeleap.tangerine.domain.Person;
import com.orangeleap.tangerine.domain.communication.Address;
import com.orangeleap.tangerine.domain.communication.Email;
import com.orangeleap.tangerine.domain.communication.Phone;
import com.orangeleap.tangerine.domain.customization.EntityDefault;
import com.orangeleap.tangerine.service.AddressService;
import com.orangeleap.tangerine.service.AuditService;
import com.orangeleap.tangerine.service.CommunicationHistoryService;
import com.orangeleap.tangerine.service.ConstituentService;
import com.orangeleap.tangerine.service.EmailService;
import com.orangeleap.tangerine.service.PhoneService;
import com.orangeleap.tangerine.service.RelationshipService;
import com.orangeleap.tangerine.service.exception.ConstituentValidationException;
import com.orangeleap.tangerine.type.EntityType;
import com.orangeleap.tangerine.util.StringConstants;
import com.orangeleap.tangerine.util.TangerineUserHelper;
import com.orangeleap.tangerine.web.common.PaginatedResult;
import com.orangeleap.tangerine.web.common.SortInfo;

@Service("constituentService")
public class ConstituentServiceImpl extends AbstractTangerineService implements ConstituentService {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name="tangerineUserHelper")
    protected TangerineUserHelper tangerineUserHelper;

    @Resource(name = "auditService")
    private AuditService auditService;

    @Resource(name = "addressService")
    private AddressService addressService;

    @Resource(name = "phoneService")
    private PhoneService phoneService;

    @Resource(name = "emailService")
    private EmailService emailService;

    @Resource(name = "relationshipService")
    private RelationshipService relationshipService;

    @Resource(name = "constituentDAO")
    private ConstituentDao constituentDao;

    @Resource(name = "siteDAO")
    private SiteDao siteDao;

    @Resource(name = "giftDAO")
    private GiftDao giftDao;
    
    @Resource(name = "communicationHistoryService")
    private CommunicationHistoryService communicationHistoryService;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = ConstituentValidationException.class)
    public Person maintainConstituent(Person constituent) throws ConstituentValidationException {
        if (logger.isTraceEnabled()) {
            logger.trace("maintainConstituent: constituent = " + constituent);
        }
        if (constituent.getSite() == null || tangerineUserHelper.lookupUserSiteName().equals(constituent.getSite().getName()) == false) {
            throw new ConstituentValidationException(); 
        }    	
        constituent = constituentDao.maintainConstituent(constituent);
        maintainCorrespondence(constituent);
        
        Address address = constituent.getPrimaryAddress();
        Phone phone = constituent.getPrimaryPhone();
        Email email = constituent.getPrimaryEmail();
        
        if (address != null) {
        	address.setPersonId(constituent.getId());
        	addressService.save(address);
        }
        if (phone != null) {
        	phone.setPersonId(constituent.getId());
        	phoneService.save(phone);
        }
        if (email != null) {
        	email.setPersonId(constituent.getId());
        	emailService.save(email);
        }

        relationshipService.maintainRelationships(constituent);
        auditService.auditObject(constituent, constituent);
        return constituent;
    }
    
    @Transactional(propagation = Propagation.REQUIRED)
    public void maintainCorrespondence(Person constituent) {
        if (logger.isTraceEnabled()) {
            logger.trace("maintainCorrespondence: constituent.id = " + constituent.getId());
        }
        String communicationPref = constituent.getCustomFieldValue(StringConstants.COMMUNICATION_PREFERENCES);
        if (StringConstants.OPT_OUT_ALL.equals(communicationPref)) {
            addressService.maintainResetReceiveCorrespondence(constituent.getId());
            phoneService.maintainResetReceiveCorrespondence(constituent.getId());
            emailService.maintainResetReceiveCorrespondence(constituent.getId());
            
            addressService.resetReceiveCorrespondence(constituent.getPrimaryAddress());
            phoneService.resetReceiveCorrespondence(constituent.getPrimaryPhone());
            emailService.resetReceiveCorrespondence(constituent.getPrimaryEmail());
        }
        else if (StringConstants.OPT_IN.equals(communicationPref)) {
            // Mail
            if (constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.MAIL_CAMEL_CASE) ||
                    constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.ANY_CAMEL_CASE) || 
                    constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.UNKNOWN_CAMEL_CASE)) {
                // do nothing
            }
            else {
                addressService.maintainResetReceiveCorrespondence(constituent.getId());
                addressService.resetReceiveCorrespondence(constituent.getPrimaryAddress());
            }

            // Phone
            if (constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.PHONE_CAMEL_CASE) ||
                    constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.ANY_CAMEL_CASE) || 
                    constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.UNKNOWN_CAMEL_CASE)) {
                // do nothing
            }
            else {
                phoneService.maintainResetReceiveCorrespondence(constituent.getId());
                phoneService.resetReceiveCorrespondence(constituent.getPrimaryPhone());
            }
            
            // Email
            if (constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.EMAIL_CAMEL_CASE) ||
                    constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.ANY_CAMEL_CASE) || 
                    constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.UNKNOWN_CAMEL_CASE)) {
                // do nothing
            }
            else {
                emailService.maintainResetReceiveCorrespondence(constituent.getId());
                emailService.resetReceiveCorrespondence(constituent.getPrimaryEmail());
            }
        }
    }

    @Override
    public Person readConstituentById(Long id) {
        if (logger.isTraceEnabled()) {
            logger.trace("readConstituentById: id = " + id);
        }
        Person constituent = constituentDao.readConstituentById(id);
        addCommunicationEntities(constituent);
        return constituent;
    }

    @Override
    public Person readConstituentByAccountNumber(String accountNumber) {
        if (logger.isTraceEnabled()) {
            logger.trace("readConstituentByAccountNumber: accountNumber = " + accountNumber);
        }
        Person constituent = constituentDao.readConstituentByAccountNumber(accountNumber);
        addCommunicationEntities(constituent);
        return constituent;
    }
    
    private void addCommunicationEntities(Person constituent) {
        if (constituent != null) {
            constituent.setAddresses(addressService.readByConstituentId(constituent.getId()));
            constituent.setPhones(phoneService.readByConstituentId(constituent.getId()));
            constituent.setEmails(emailService.readByConstituentId(constituent.getId()));
        }
    }

    
    @Override
    public Person readConstituentByLoginId(String loginId) {
        if (logger.isTraceEnabled()) {
            logger.trace("readConstituentByLoginId: loginId = " + loginId);
        }
        return constituentDao.readConstituentByLoginId(loginId);
    }
    

    @Override
    public List<Person> searchConstituents(Map<String, Object> params) {
        if (logger.isTraceEnabled()) {
            logger.trace("searchConstituents: params = " + params);
        }
        return constituentDao.searchConstituents(params, null);
    }

    @Override
    public List<Person> searchConstituents(Map<String, Object> params, List<Long> ignoreIds) {
        if (logger.isTraceEnabled()) {
            logger.trace("searchConstituents: params = " + params + " ignoreIds = " + ignoreIds);
        }
        return constituentDao.searchConstituents(params, ignoreIds);
    }
    
    @Override
    public List<Person> readAllConstituentsByIdRange(String fromId, String toId) {
        if (logger.isTraceEnabled()) {
            logger.trace("readAllConstituentsByIdRange: " + fromId + " " + toId);
        }
        return constituentDao.readAllConstituentsByIdRange(fromId, toId);
    }
    

    @Override
    public Person createDefaultConstituent() {
        if (logger.isTraceEnabled()) {
            logger.trace("createDefaultConstituent:");
        }
        // get initial person with built-in defaults
        Person constituent = new Person();
        constituent.setSite(siteDao.readSite(tangerineUserHelper.lookupUserSiteName()));
        BeanWrapper personBeanWrapper = PropertyAccessorFactory.forBeanPropertyAccess(constituent);

        List<EntityDefault> entityDefaults = siteDao.readEntityDefaults(Arrays.asList(new EntityType[] { EntityType.person }));
        for (EntityDefault ed : entityDefaults) {
            personBeanWrapper.setPropertyValue(ed.getEntityFieldName(), ed.getDefaultValue());
        }

        // TODO: consider caching techniques for the default Person
        return constituent;
    }

    @Override
    public List<Person> analyzeLapsedDonor(Date beginDate, Date currentDate) {
        if (logger.isTraceEnabled()) {
            logger.trace("analyzeLapsedDonor: beginDate = " + beginDate + " currentDate = " + currentDate);
        }
        return giftDao.analyzeLapsedDonor(beginDate, currentDate);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void setLapsedDonor(Long constituentId) {
        if (logger.isTraceEnabled()) {
            logger.trace("setLapsedDonor: constituentId = " + constituentId);
        }
        Person constituent = readConstituentById(constituentId);
        if (constituent != null) {
            constituent.addCustomFieldValue(Person.DONOR_PROFILES, "lapsedDonor");
        }
        constituentDao.maintainConstituent(constituent);
    }

	@Override
    @Transactional(propagation = Propagation.REQUIRED)
	public List<Person> readAllConstituentsBySite() {
        if (logger.isTraceEnabled()) {
            logger.trace("readAllConstituentsBySite:");
        }
        return constituentDao.readAllConstituentsBySite();
	}

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<Person> readAllConstituentsBySite(SortInfo sort) {
        if (logger.isTraceEnabled()) {
            logger.trace("readAllConstituentsBySite:" + sort);
        }

        return constituentDao.readAllConstituentsBySite(sort.getSort(), sort.getDir(), sort.getStart(), sort.getLimit());
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public int getConstituentCountBySite() {

        return constituentDao.getConstituentCountBySite();
    }
    
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
	public boolean hasReceivedCommunication(Long constituentId, String commType) {
    	SortInfo sortInfo = new SortInfo();
    	PaginatedResult results = communicationHistoryService.readCommunicationHistoryByConstituent(constituentId, sortInfo);
    	List<CommunicationHistory> list = results.getRows();
    	
    	for (CommunicationHistory ch: list) {
    		if (ch.getComments().contains(commType)) return true;
    	}
    	
    	return false;
    }
}

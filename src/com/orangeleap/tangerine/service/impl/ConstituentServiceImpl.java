package com.orangeleap.tangerine.service.impl;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeansException;
import org.springframework.beans.PropertyAccessorFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;

import com.orangeleap.tangerine.controller.validator.ConstituentValidator;
import com.orangeleap.tangerine.controller.validator.EntityValidator;
import com.orangeleap.tangerine.dao.ConstituentDao;
import com.orangeleap.tangerine.dao.GiftDao;
import com.orangeleap.tangerine.dao.SiteDao;
import com.orangeleap.tangerine.domain.AbstractEntity;
import com.orangeleap.tangerine.domain.CommunicationHistory;
import com.orangeleap.tangerine.domain.Constituent;
import com.orangeleap.tangerine.domain.communication.Address;
import com.orangeleap.tangerine.domain.communication.Email;
import com.orangeleap.tangerine.domain.communication.Phone;
import com.orangeleap.tangerine.domain.customization.CustomField;
import com.orangeleap.tangerine.domain.customization.EntityDefault;
import com.orangeleap.tangerine.domain.customization.FieldRequired;
import com.orangeleap.tangerine.domain.customization.Picklist;
import com.orangeleap.tangerine.domain.customization.PicklistItem;
import com.orangeleap.tangerine.integration.NewConstituent;
import com.orangeleap.tangerine.service.AddressService;
import com.orangeleap.tangerine.service.AuditService;
import com.orangeleap.tangerine.service.CommunicationHistoryService;
import com.orangeleap.tangerine.service.ConstituentService;
import com.orangeleap.tangerine.service.EmailService;
import com.orangeleap.tangerine.service.ErrorLogService;
import com.orangeleap.tangerine.service.PhoneService;
import com.orangeleap.tangerine.service.PicklistItemService;
import com.orangeleap.tangerine.service.RelationshipService;
import com.orangeleap.tangerine.service.SiteService;
import com.orangeleap.tangerine.service.exception.ConstituentValidationException;
import com.orangeleap.tangerine.type.EntityType;
import com.orangeleap.tangerine.type.FieldType;
import com.orangeleap.tangerine.type.PageType;
import com.orangeleap.tangerine.util.RulesStack;
import com.orangeleap.tangerine.util.StringConstants;
import com.orangeleap.tangerine.util.TangerineUserHelper;
import com.orangeleap.tangerine.web.common.PaginatedResult;
import com.orangeleap.tangerine.web.common.SortInfo;


@Service("constituentService")
public class ConstituentServiceImpl extends AbstractTangerineService implements ConstituentService,ApplicationContextAware {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());
    
    @Resource(name = "errorLogService")
    private ErrorLogService errorLogService;

    @Resource(name="constituentEntityValidator")
    protected EntityValidator entityValidator;
   
    @Resource(name="constituentValidator")
    protected ConstituentValidator constituentValidator;

    
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

	private ApplicationContext context;


    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = {ConstituentValidationException.class, BindException.class})
    public Constituent maintainConstituent(Constituent constituent) throws ConstituentValidationException, BindException {
        if (logger.isTraceEnabled()) {
            logger.trace("maintainConstituent: constituent = " + constituent);
        }
        if (constituent.getSite() == null || tangerineUserHelper.lookupUserSiteName().equals(constituent.getSite().getName()) == false) {
            throw new ConstituentValidationException(); 
        }    	
        
        if (constituent.getFieldLabelMap() != null && !constituent.isSuppressValidation()) {
        	
        	setOptInPrefs(constituent);
        	setPicklistDefaultsForRequiredFields(constituent, PageType.constituent, tangerineUserHelper.lookupUserRoles());
        	
	        BindingResult br = new BeanPropertyBindingResult(constituent, "constituent");
	        BindException errors = new BindException(br);
	      
	        constituentValidator.validate(constituent, errors);
	        if (errors.getAllErrors().size() > 0) {
				throw errors;
			}
	        
	        entityValidator.validate(constituent, errors);
	        if (errors.getAllErrors().size() > 0) {
				throw errors;
			}
        }
        
        
        constituent = constituentDao.maintainConstituent(constituent);
        maintainCorrespondence(constituent);
        
        Address address = constituent.getPrimaryAddress();
        Phone phone = constituent.getPrimaryPhone();
        Email email = constituent.getPrimaryEmail();
        
        if (address != null) {
        	address.setConstituentId(constituent.getId());
        	addressService.save(address);
        }
        if (phone != null) {
        	phone.setConstituentId(constituent.getId());
        	phoneService.save(phone);
        }
        if (email != null) {
        	email.setConstituentId(constituent.getId());
        	emailService.save(email);
        }

        relationshipService.maintainRelationships(constituent);
        auditService.auditObject(constituent, constituent);
        
        routeConstituent(constituent);
        
        return constituent;
    }
    
    private void setOptInPrefs(Constituent constituent) {
    	String communicationPreferences = constituent.getCustomFieldValue("communicationPreferences");
    	String communicationOptInPreferences = constituent.getCustomFieldValue("communicationOptInPreferences");
    	if ("Opt In".equals(communicationPreferences) && StringUtils.trimToNull(communicationOptInPreferences) == null) {
    		constituent.setCustomFieldValue("communicationOptInPreferences", "Unknown");
    	}
    }
    
    
    private final static String ROUTE_METHOD = "ConstituentServiceImpl.routeConstituent";
    void routeConstituent(Constituent constituent) throws ConstituentValidationException {
        
    	RulesStack.push(ROUTE_METHOD);
        try {
        	
	        try {
	            NewConstituent newConstituent = (NewConstituent) context.getBean("newConstituent");
	            newConstituent.routeConstituent(constituent);
	        } 
	        catch (ConstituentValidationException cve) {
	        	throw cve;
	        }
	        catch (Exception ex) {
	            logger.error("RULES_FAILURE: " + ex.getMessage(), ex);
                // Cannot start new transaction to record error when current transaction has timed out waiting on external connection issue.
                String msg = ""+ex.getMessage();
	            if ( !msg.contains("timeout") && !msg.contains("Connection refused") ) {
                    writeRulesFailureLog(ex.getMessage() + "\r\n" + constituent);
                }
	        } 
        } finally {
        	RulesStack.pop(ROUTE_METHOD);
        }
    }
    
    private synchronized void writeRulesFailureLog(String message) {
    	try {
            
    		errorLogService.addErrorMessage(message, "gift.rules");

    	} catch (Exception e) {
    		logger.error("Unable to write to rules error log file: "+message);
    	}
    }
    
    @Transactional(propagation = Propagation.REQUIRED)
    public void maintainCorrespondence(Constituent constituent) {
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

            // Phone (Call)
            if (constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.PHONE_CAMEL_CASE) ||
                    constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.ANY_CAMEL_CASE) || 
                    constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.UNKNOWN_CAMEL_CASE)) {
                // do nothing
            }
            else {
                phoneService.maintainResetReceiveCorrespondence(constituent.getId());
                phoneService.resetReceiveCorrespondence(constituent.getPrimaryPhone());
            }

            // Phone Text (SMS)
            if (constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.TEXT_CAMEL_CASE) ||
                    constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.ANY_CAMEL_CASE) || 
                    constituent.hasCustomFieldValue(StringConstants.COMMUNICATION_OPT_IN_PREFERENCES, StringConstants.UNKNOWN_CAMEL_CASE)) {
                // do nothing
            }
            else {
                phoneService.maintainResetReceiveCorrespondenceText(constituent.getId());
                phoneService.resetReceiveCorrespondenceText(constituent.getPrimaryPhone());
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
    public Constituent readConstituentById(Long id) {
        if (logger.isTraceEnabled()) {
            logger.trace("readConstituentById: id = " + id);
        }
        Constituent constituent = constituentDao.readConstituentById(id);
        addCommunicationEntities(constituent);
        return constituent;
    }


    @Override
    public Constituent readConstituentByAccountNumber(String accountNumber) {
        if (logger.isTraceEnabled()) {
            logger.trace("readConstituentByAccountNumber: accountNumber = " + accountNumber);
        }
        Constituent constituent = constituentDao.readConstituentByAccountNumber(accountNumber);
        addCommunicationEntities(constituent);
        return constituent;
    }
    
    private void addCommunicationEntities(Constituent constituent) {
        if (constituent != null) {
            constituent.setAddresses(addressService.readByConstituentId(constituent.getId()));
            constituent.setPhones(phoneService.readByConstituentId(constituent.getId()));
            constituent.setEmails(emailService.readByConstituentId(constituent.getId()));
        }
    }


    @Override
    public Constituent readConstituentByLoginId(String loginId) {
        if (logger.isTraceEnabled()) {
            logger.trace("readConstituentByLoginId: loginId = " + loginId);
        }
        return constituentDao.readConstituentByLoginId(loginId);
    }
    

    @Override
    public List<Constituent> searchConstituents(Map<String, Object> params) {
        if (logger.isTraceEnabled()) {
            logger.trace("searchConstituents: params = " + params);
        }
        return constituentDao.searchConstituents(params);
    }

    @Override
    public List<Constituent> searchConstituents(Map<String, Object> params, List<Long> ignoreIds) {
        if (logger.isTraceEnabled()) {
            logger.trace("searchConstituents: params = " + params + " ignoreIds = " + ignoreIds);
        }
        return constituentDao.searchConstituents(params, ignoreIds);
    }

    @Override
    public List<Constituent> findConstituents(Map<String, Object> params, List<Long> ignoreIds) {
        if (logger.isTraceEnabled()) {
            logger.trace("findConstituents: params = " + params + " ignoreIds = " + ignoreIds);
        }
        return constituentDao.findConstituents(params, ignoreIds);
    }

    @Override
    public List<Constituent> readAllConstituentsByAccountRange(Long fromId, Long toId) {
        if (logger.isTraceEnabled()) {
            logger.trace("readAllConstituentsByIdRange: " + fromId + " " + toId);
        }
        return constituentDao.readAllConstituentsByAccountRange(fromId, toId);
    }
    
	

    @Override
    public Constituent createDefaultConstituent() {
        if (logger.isTraceEnabled()) {
            logger.trace("createDefaultConstituent:");
        }
        // get initial constituent with built-in defaults
        Constituent constituent = new Constituent();
        constituent.setSite(siteDao.readSite(tangerineUserHelper.lookupUserSiteName()));
        BeanWrapper constituentBeanWrapper = PropertyAccessorFactory.forBeanPropertyAccess(constituent);

        List<EntityDefault> entityDefaults = siteDao.readEntityDefaults(Arrays.asList(new EntityType[] { EntityType.constituent }));
        for (EntityDefault ed : entityDefaults) {
            constituentBeanWrapper.setPropertyValue(ed.getEntityFieldName(), ed.getDefaultValue());
        }

        // TODO: consider caching techniques for the default Constituent
        return constituent;
    }

    @Override
    public List<Constituent> analyzeLapsedDonor(Date beginDate, Date currentDate) {
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
        Constituent constituent = readConstituentById(constituentId);
        if (constituent != null) {
            constituent.addCustomFieldValue(Constituent.DONOR_PROFILES, "lapsedDonor");
        }
        constituentDao.maintainConstituent(constituent);
    }

	@Override
    @Transactional(propagation = Propagation.REQUIRED)
	public List<Constituent> readAllConstituentsBySite() {
        if (logger.isTraceEnabled()) {
            logger.trace("readAllConstituentsBySite:");
        }
        return constituentDao.readAllConstituentsBySite();
	}

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<Constituent> readAllConstituentsBySite(SortInfo sort) {
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
    
 /*   @Override
    @Transactional(propagation = Propagation.REQUIRED)
	public boolean hasReceivedCommunication(Long constituentId, String commType) {
    	SortInfo sortInfo = new SortInfo();
    	PaginatedResult results = communicationHistoryService.readCommunicationHistoryByConstituent(constituentId, sortInfo);
    	List<CommunicationHistory> list = results.getRows();
    	
    	for (CommunicationHistory ch: list) {
			if (ch.getCustomFieldValue("template").compareTo(commType) == 0) return true;
    	}
    	
    	return false;
    }*/
    
    @SuppressWarnings("unchecked")
	@Override
    @Transactional(propagation = Propagation.REQUIRED)
	public boolean hasReceivedCommunication(Long constituentId, String commType,int number,String timeUnit) {
    	SortInfo sortInfo = new SortInfo();
    	Calendar cal = Calendar.getInstance();
    	StringBuilder args = new StringBuilder(timeUnit.toUpperCase());
    	if (args.toString().equals("DAYS") || args.toString().equals("WEEKS") || args.toString().equals("MONTHS") || args.toString().equals("YEARS")) {
    		args.deleteCharAt(args.length()-1);
    	}
    	if (args.toString().equals("DAY")) {
    		cal.add(Calendar.DAY_OF_YEAR, -(number));
    	}
    	if (args.toString().equals("WEEK")) {
    		cal.add(Calendar.WEEK_OF_YEAR, -(number));
    	}
    	if (args.toString().equals("MONTH")) {
    		cal.add(Calendar.MONTH, -(number));
    	}
    	if (args.toString().equals("YEAR")) {
    		cal.add(Calendar.YEAR, -(number));
    	}


    	
    	sortInfo.setSort("p.CONSTITUENT_ID");
    	
    	PaginatedResult results = communicationHistoryService.readCommunicationHistoryByConstituent(constituentId,sortInfo);
    	List<CommunicationHistory> list = results.getRows();
    	
    	
    	while (list != null && list.size() > 0) {
    		for (CommunicationHistory ch: list) {
    			if (ch.getCustomFieldValue("template").compareTo(commType) == 0 &&
					ch.getCreateDate().compareTo(cal.getTime()) > 0) {
                    return true;
                }
    		}
    		sortInfo.setStart(sortInfo.getStart() + sortInfo.getLimit());
    		results = communicationHistoryService.readCommunicationHistoryByConstituent(constituentId, sortInfo);
    		list = results.getRows();
    	}
    	
    	return false;
    }

	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.context = applicationContext;
		
	}
}

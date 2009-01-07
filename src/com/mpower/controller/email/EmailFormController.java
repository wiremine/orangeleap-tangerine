package com.mpower.controller.email;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.mpower.domain.Email;
import com.mpower.domain.Person;
import com.mpower.service.EmailService;
import com.mpower.service.PersonService;
import com.mpower.service.SiteService;
import com.mpower.service.impl.SessionServiceImpl;
import com.mpower.type.PageType;

public class EmailFormController extends SimpleFormController {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    private EmailService emailService;

    private PersonService personService;

    private SiteService siteService;

    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    @Override
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("MM/dd/yyyy"), true));
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws ServletException {
        String personId = request.getParameter("personId");
        String emailId = request.getParameter("emailId");
        Email email = null;
        if (emailId == null) {
            Person person = personService.readPersonById(Long.valueOf(personId));
            email = new Email(person);
        } else {
            email = emailService.readEmail(Long.valueOf(emailId));
        }
        if (isFormSubmission(request)) {
            Map<String, String> fieldLabelMap = siteService.readFieldLabels(SessionServiceImpl.lookupUserSiteName(), PageType.valueOf(getCommandName()), SessionServiceImpl.lookupUserRoles(), request.getLocale());
            email.setFieldLabelMap(fieldLabelMap);

            Map<String, Object> valueMap = siteService.readFieldValues(SessionServiceImpl.lookupUserSiteName(), PageType.valueOf(getCommandName()), SessionServiceImpl.lookupUserRoles(), email);
            email.setFieldValueMap(valueMap);
        }
        return email;
    }

    @SuppressWarnings("unchecked")
    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map refData = new HashMap();
        String personIdString = request.getParameter("personId");
        Long personId = Long.valueOf(personIdString);
        List<Email> emails = emailService.readEmails(personId);
        refData.put("person", personService.readPersonById(personId));
        refData.put("emails", emails);
        if (logger.isDebugEnabled()) {
            for (Email e : emails) {
                logger.debug("### email: " + e.getEmailAddress());
            }
        }
        List<Email> currentEmails = emailService.readCurrentEmails(personId, Calendar.getInstance(), false);
        refData.put("currentEmails", currentEmails);
        List<Email> currentCorrespondenceEmails = emailService.readCurrentEmails(personId, Calendar.getInstance(), true);
        refData.put("currentCorrespondenceEmails", currentCorrespondenceEmails);
        return refData;
    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        emailService.saveEmail((Email) command);
        String personIdString = request.getParameter("personId");
        Long personId = Long.valueOf(personIdString);
        List<Email> emails = emailService.readEmails(personId);
        Person person = personService.readPersonById(personId);
        ModelAndView mav = new ModelAndView("email/emailManager"); // TODO: use redirect: & move to context XML

        // TODO: Remove below
        mav.addObject("emails", emails);
        List<Email> currentEmails = emailService.readCurrentEmails(personId, Calendar.getInstance(), false);
        mav.addObject("currentEmails", currentEmails);
        List<Email> currentCorrespondenceEmails = emailService.readCurrentEmails(personId, Calendar.getInstance(), true);
        mav.addObject("currentCorrespondenceEmails", currentCorrespondenceEmails);
        mav.addObject("person", person);
        mav.addObject("email", new Email(person));
        mav.addObject(personIdString);
        return mav;
    }
}

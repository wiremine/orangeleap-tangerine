package com.mpower.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestDataBinder;

import com.mpower.controller.address.AddressEditor;
import com.mpower.controller.email.EmailEditor;
import com.mpower.controller.payment.PaymentSourceEditor;
import com.mpower.controller.phone.PhoneEditor;
import com.mpower.domain.Address;
import com.mpower.domain.AddressAware;
import com.mpower.domain.Email;
import com.mpower.domain.EmailAware;
import com.mpower.domain.PaymentSource;
import com.mpower.domain.PaymentSourceAware;
import com.mpower.domain.Person;
import com.mpower.domain.Phone;
import com.mpower.domain.PhoneAware;
import com.mpower.domain.Viewable;
import com.mpower.service.AddressService;
import com.mpower.service.EmailService;
import com.mpower.service.PaymentSourceService;
import com.mpower.service.PhoneService;
import com.mpower.util.StringConstants;

public abstract class TangerineConstituentAttributesFormController extends TangerineFormController {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    protected PaymentSourceService paymentSourceService;
    protected AddressService addressService;
    protected PhoneService phoneService;
    protected EmailService emailService;
    
    protected boolean bindPaymentSource = true;
    protected boolean bindAddress = true;
    protected boolean bindPhone = true;
    protected boolean bindEmail = true;
    
    public void setPaymentSourceService(PaymentSourceService paymentSourceService) {
        this.paymentSourceService = paymentSourceService;
    }

    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    public void setPhoneService(PhoneService phoneService) {
        this.phoneService = phoneService;
    }

    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
    }
    
    /**
     * If you do not want to bind to PaymentSources, set to false.  Default is true
     * @param bindPaymentSource
     */
    public void setBindPaymentSource(boolean bindPaymentSource) {
        this.bindPaymentSource = bindPaymentSource;
    }

    /**
     * If you do not want to bind to Addresses, set to false.  Default is true
     * @param bindAddress
     */
    public void setBindAddress(boolean bindAddress) {
        this.bindAddress = bindAddress;
    }

    /**
     * If you do not want to bind to Phones, set to false.  Default is true
     * @param bindPhone
     */
    public void setBindPhone(boolean bindPhone) {
        this.bindPhone = bindPhone;
    }

    /**
     * If you do not want to bind to Emails, set to false.  Default is true
     * @param bindEmail
     */
    public void setBindEmail(boolean bindEmail) {
        this.bindEmail = bindEmail;
    }
    
    protected Person getPerson(HttpServletRequest request) {
        Long personId = getPersonId(request);
        if (personId != null) {
            return personService.readPersonById(personId); // TODO: do we need to check if the user can view this person (authorization)?
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    protected void addPersonToReferenceData(HttpServletRequest request, Map refData) {
        Person person = getPerson(request);
        if (person != null) {
            refData.put(StringConstants.PERSON, getPerson(request));
        }
    }

    @Override
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        super.initBinder(request, binder);
        if (bindPaymentSource) {
            binder.registerCustomEditor(PaymentSource.class, new PaymentSourceEditor(paymentSourceService, personService, this.getPersonIdString(request)));
        }
        if (bindAddress) {
            binder.registerCustomEditor(Address.class, new AddressEditor(addressService, personService, this.getPersonIdString(request)));
        }
        if (bindPhone) {
            binder.registerCustomEditor(Phone.class, new PhoneEditor(phoneService, personService, this.getPersonIdString(request)));
        }
        if (bindEmail) {
            binder.registerCustomEditor(Email.class, new EmailEditor(emailService, personService, this.getPersonIdString(request)));
        }
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws ServletException {
        Viewable viewable = (Viewable)super.formBackingObject(request);        
        if (isFormSubmission(request)) {
            userCreateNew(request, viewable);
        }
        return viewable;
    }
    
    protected void userCreateNew(HttpServletRequest request, Viewable viewable) {
        if (bindAddress && viewable instanceof AddressAware) {
            this.userCreateNewAddress(request, (AddressAware)viewable);
        }
        if (bindPhone && viewable instanceof PhoneAware) {
            this.userCreateNewPhone(request, (PhoneAware)viewable);
        }
        if (bindEmail && viewable instanceof EmailAware) {
            this.userCreateNewEmail(request, (EmailAware)viewable);
        }
        if (bindPaymentSource && viewable instanceof PaymentSourceAware) {
            this.userCreateNewPaymentSource(request, (PaymentSourceAware)viewable);
        }
    }

    @Override
    protected void onBind(HttpServletRequest request, Object command, BindException errors) throws Exception {
        if (bindPaymentSource && command instanceof PaymentSourceAware) {
            PaymentSourceAware obj = (PaymentSourceAware)command;
            PaymentSource selectedPaymentSource = obj.getSelectedPaymentSource();
            if (selectedPaymentSource != null) {
                if (selectedPaymentSource.getId() != null) {
                    obj.setPaymentSource(selectedPaymentSource);
                    obj.setPaymentType(selectedPaymentSource.getType());
                }
                else {
                    // new payment source, set the type
                    obj.getPaymentSource().setType(obj.getPaymentType());                    
                }
            }
        }

        if (bindAddress && command instanceof AddressAware) {
            AddressAware obj = (AddressAware) command;
            Address selectedAddress = obj.getSelectedAddress();
            if (selectedAddress != null && selectedAddress.getId() != null) {
                obj.setAddress(selectedAddress);
            }
        }

        if (bindPhone && command instanceof PhoneAware) {
            PhoneAware obj = (PhoneAware) command;
            Phone selectedPhone = obj.getSelectedPhone();
            if (selectedPhone != null && selectedPhone.getId() != null) {
                obj.setPhone(selectedPhone);
            }
        }

        if (bindEmail && command instanceof EmailAware) {
            EmailAware obj = (EmailAware) command;
            Email selectedEmail = obj.getSelectedEmail();
            if (selectedEmail != null && selectedEmail.getId() != null) {
                obj.setEmail(selectedEmail);
            }
        }
        super.onBind(request, command, errors);
    }

    @Override
    protected void onBindAndValidate(HttpServletRequest request, Object command, BindException errors) throws Exception {
        super.onBindAndValidate(request, command, errors);

        /**
         * If NO address/phone/etc is requested, this must be done AFTER binding and validation
         */
        if (!errors.hasErrors() && isFormSubmission(request)) {
            if (bindAddress && command instanceof AddressAware) {
                this.setAddressToNone(request, (AddressAware)command);
            }
            if (bindPhone && command instanceof PhoneAware) {
                this.setPhoneToNone(request, (PhoneAware)command);
            }
            if (bindEmail && command instanceof EmailAware) {
                this.setEmailToNone(request, (EmailAware)command);
            }
            if (bindPaymentSource && command instanceof PaymentSourceAware) {
                this.setPaymentSourceToNone(request, (PaymentSourceAware)command);
            }
        }        
    }

    @SuppressWarnings("unchecked")
    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map refData = new HashMap();
        this.addPersonToReferenceData(request, refData);

        if (bindPaymentSource) {
            List<PaymentSource> paymentSources = paymentSourceService.readActivePaymentSourcesACHCreditCard(this.getPersonId(request));
            refData.put(StringConstants.PAYMENT_SOURCES, paymentSources);
        }
        if (bindAddress) {
            List<Address> addresses = addressService.filterValidAddresses(this.getPersonId(request));
            refData.put(StringConstants.ADDRESSES, addresses);
        }
        if (bindPhone) {
            List<Phone> phones = phoneService.filterValidPhones(this.getPersonId(request));
            refData.put(StringConstants.PHONES, phones);
        }
        if (bindEmail) {
            List<Email> emails = emailService.filterValidEmails(this.getPersonId(request));
            refData.put(StringConstants.EMAILS, emails);
        }
        return refData;
    }

    protected void userCreateNewAddress(HttpServletRequest request, AddressAware addressAware) {
        if (StringConstants.NEW.equals(request.getParameter(StringConstants.SELECTED_ADDRESS))) {
            Address addr = new Address(this.getPerson(request));
            addr.setUserCreated(true);
            addressAware.setAddress(addr);
        }
    }

    protected void userCreateNewPhone(HttpServletRequest request, PhoneAware phoneAware) {
        if (StringConstants.NEW.equals(request.getParameter(StringConstants.SELECTED_PHONE))) {
            Phone phone = new Phone(this.getPerson(request));
            phone.setUserCreated(true);
            phoneAware.setPhone(phone);
        }
    }

    protected void userCreateNewEmail(HttpServletRequest request, EmailAware emailAware) {
        if (StringConstants.NEW.equals(request.getParameter(StringConstants.SELECTED_EMAIL))) {
            Email email = new Email(this.getPerson(request));
            email.setUserCreated(true);
            emailAware.setEmail(email);
        }
    }

    protected void userCreateNewPaymentSource(HttpServletRequest request, PaymentSourceAware paymentSourceAware) {
        if (StringConstants.NEW.equals(request.getParameter(StringConstants.SELECTED_PAYMENT_SOURCE))) {
            PaymentSource source = new PaymentSource(this.getPerson(request));
            source.setUserCreated(true);
            paymentSourceAware.setPaymentSource(source);
        }
    }
    
    protected void setAddressToNone(HttpServletRequest request, AddressAware addressAware) {
        if (StringConstants.NONE.equals(request.getParameter(StringConstants.SELECTED_ADDRESS))) {
            addressAware.setAddress(new Address(this.getPerson(request))); // this is equivalent to setting it to the dummy (empty) value
        }
    }
    protected void setPhoneToNone(HttpServletRequest request, PhoneAware phoneAware) {
        if (StringConstants.NONE.equals(request.getParameter(StringConstants.SELECTED_PHONE))) {
            phoneAware.setPhone(new Phone(this.getPerson(request))); // this is equivalent to setting it to the dummy (empty) value
        }
    }

    protected void setEmailToNone(HttpServletRequest request, EmailAware emailAware) {
        if (StringConstants.NONE.equals(request.getParameter(StringConstants.SELECTED_EMAIL))) {
            emailAware.setEmail(new Email(this.getPerson(request))); // this is equivalent to setting it to the dummy (empty) value
        }
    }

    protected void setPaymentSourceToNone(HttpServletRequest request, PaymentSourceAware paymentSourceAware) {
        if (StringConstants.NONE.equals(request.getParameter(StringConstants.SELECTED_PAYMENT_SOURCE))) {
            paymentSourceAware.setPaymentSource(new PaymentSource(this.getPerson(request))); // this is equivalent to setting it to the dummy (empty) value
        }
    }
}

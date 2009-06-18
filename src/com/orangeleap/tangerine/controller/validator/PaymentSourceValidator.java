package com.orangeleap.tangerine.controller.validator;

import java.util.Calendar;
import java.util.Date;

import org.apache.commons.logging.Log;
import com.orangeleap.tangerine.util.OLLogger;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.orangeleap.tangerine.domain.PaymentSource;
import com.orangeleap.tangerine.domain.PaymentSourceAware;
import com.orangeleap.tangerine.service.PaymentSourceService;
import com.orangeleap.tangerine.util.CalendarUtils;

public class PaymentSourceValidator implements Validator {

    /** Logger for this class and subclasses */
    protected final Log logger = OLLogger.getLog(getClass());

    private PaymentSourceService paymentSourceService;

    public void setPaymentSourceService(PaymentSourceService paymentSourceService) {
        this.paymentSourceService = paymentSourceService;
    }

    @SuppressWarnings("unchecked")
    @Override
    public boolean supports(Class clazz) {
        return PaymentSource.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        logger.trace("in PaymentSourceValidator");

        validatePaymentProfile(target, errors);
        validatePaymentSource(target, errors);
    }

    public void validatePaymentSource(Object target, Errors errors) {
        PaymentSource source = null;
        String inPath = errors.getNestedPath();
        if (target instanceof PaymentSource) {
            source = (PaymentSource) target;
        }
        else if (target instanceof PaymentSourceAware) {
            source = ((PaymentSourceAware) target).getPaymentSource();
            errors.setNestedPath("paymentSource");
        }

        if (PaymentSource.ACH.equals(source.getPaymentType())) {
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "achAccountNumber", "invalidAchAccountNumber");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "achRoutingNumber", "invalidAchRoutingNumber");
        }
        else if (PaymentSource.CREDIT_CARD.equals(source.getPaymentType())) {
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "creditCardType", "invalidCreditCardNumber");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "creditCardNumber", "invalidCreditCardNumber");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "creditCardExpiration", "invalidCreditCardExpiration");
            Date expirationDate = source.getCreditCardExpiration();
            Calendar today = CalendarUtils.getToday(false);
            if (expirationDate == null || today.getTime().after(expirationDate)) {
                errors.rejectValue("creditCardExpiration", "invalidCreditCardExpiration");
            }
        }
        errors.setNestedPath(inPath);
    }

    public void validatePaymentProfile(Object target, Errors errors) {
        PaymentSource source = null;
        if (target instanceof PaymentSource) {
            source = (PaymentSource) target;
            if (source.getProfile() != null) {
                if (StringUtils.hasText(source.getProfile()) == false) {
                    errors.rejectValue("profile", "blankPaymentProfile");
                }
                else if (source.getId() == null){
                    PaymentSource existingPaymentProfile = paymentSourceService.findPaymentSourceProfile(source.getConstituent().getId(), source.getProfile());

                    // a payment source with this profile name already exists; reject
                    if (existingPaymentProfile != null) {
                        errors.rejectValue("profile", "paymentProfileAlreadyExists");
                    }
                }
            }
        }
    }
}
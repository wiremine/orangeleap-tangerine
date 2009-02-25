package com.mpower.domain.model.communication;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import com.mpower.domain.GeneratedId;
import com.mpower.type.ActivationType;
import com.mpower.util.StringConstants;

public class Phone extends AbstractCommunication implements GeneratedId, Serializable { // SiteAware, ConstituentInfo TODO: put back for IBatis

    private static final long serialVersionUID = 1L;

    private String phoneType = StringConstants.UNKNOWN;
    private String number;
    private String provider;
    private String sms;
    private List<PhoneCustomField> phoneCustomFields;
    
    public Phone() { }

    public Phone(Long personId) {
        this.personId = personId;
        this.phoneType = StringConstants.UNKNOWN; // defaulting to 'home' would change the home phone on the constituent whenever a new payment type is created with a new phone.
        this.activationStatus = ActivationType.permanent;
    }
    
    public Phone(Long personId, String number) {
        this(personId);
        this.number = number;
    }

    public String getPhoneType() {
        return phoneType;
    }

    public void setPhoneType(String phoneType) {
        this.phoneType = phoneType;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public String getSms() {
        return sms;
    }

    public void setSms(String sms) {
        this.sms = sms;
    }

    public List<PhoneCustomField> getPhoneCustomFields() {
        if (phoneCustomFields == null) {
            phoneCustomFields = new ArrayList<PhoneCustomField>();
        }
        return phoneCustomFields;
    }

    /**
     * Check if this is a dummy object; This is not a dummy object all required fields (number) are populated
     * @return true if this Address has all required fields populated
     */
    // @Override
    // TODO: put back for IBatis
    public boolean isValid() {
        return (org.springframework.util.StringUtils.hasText(number));
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Phone)) {
            return false;
        }
        Phone p = (Phone) obj;
        EqualsBuilder eb = new EqualsBuilder();
        eb.append(getPersonId(), p.getPersonId()).append(phoneType, p.getPhoneType()).append(activationStatus, p.getActivationStatus()).append(number, p.getNumber()).append(sms, p.getSms());
        return eb.isEquals();
    }

    @Override
    public int hashCode() {
        HashCodeBuilder hcb = new HashCodeBuilder();
        hcb.append(getPersonId()).append(phoneType).append(activationStatus).append(number).append(sms);
        return hcb.hashCode();
    }
}

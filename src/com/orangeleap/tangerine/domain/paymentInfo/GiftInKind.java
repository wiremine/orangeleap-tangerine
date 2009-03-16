package com.orangeleap.tangerine.domain.paymentInfo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.Factory;
import org.apache.commons.collections.list.LazyList;
import org.springframework.core.style.ToStringCreator;

import com.orangeleap.tangerine.domain.AbstractCustomizableEntity;
import com.orangeleap.tangerine.domain.EmailAware;
import com.orangeleap.tangerine.domain.Person;
import com.orangeleap.tangerine.domain.Site;
import com.orangeleap.tangerine.domain.communication.Email;
import com.orangeleap.tangerine.type.FormBeanType;
import com.orangeleap.tangerine.util.StringConstants;

@SuppressWarnings("unchecked")
public class GiftInKind extends AbstractCustomizableEntity implements EmailAware {
    private static final long serialVersionUID = 1L;
    
    private BigDecimal fairMarketValue;
    private String currencyCode = StringConstants.USD;
    private Date donationDate = new Date();
    private String motivationCode;
    private boolean anonymous = false;
    private String recognitionName;
    private boolean sendAcknowledgment = false;
    private Date acknowledgmentDate;
   
    private Person person;

    private FormBeanType emailType;
    private Email email = new Email();
    private Email selectedEmail = new Email();

    /** Form bean representation of the GiftInKindDetails */
    protected List<GiftInKindDetail> mutableDetails = LazyList.decorate(new ArrayList<GiftInKindDetail>(), new Factory() {
        public Object create() {
            return new GiftInKindDetail();
        }
    });
    
    /** Domain object representation of the GiftInKindDetails */
    private List<GiftInKindDetail> details;
    
    public GiftInKind() {
        super();
    }

    public GiftInKind(BigDecimal fairMarketValue, String currencyCode, Date donationDate, String motivationCode, boolean anonymous, 
                        String recognitionName, boolean sendAcknowledgment, Date acknowledgmentDate, FormBeanType emailType) {
        super();
        this.fairMarketValue = fairMarketValue;
        this.currencyCode = currencyCode;
        this.donationDate = donationDate;
        this.motivationCode = motivationCode;
        this.anonymous = anonymous;
        this.recognitionName = recognitionName;
        this.sendAcknowledgment = sendAcknowledgment;
        this.acknowledgmentDate = acknowledgmentDate;
        this.emailType = emailType;
    }

    public BigDecimal getFairMarketValue() {
        return fairMarketValue;
    }

    public void setFairMarketValue(BigDecimal fairMarketValue) {
        this.fairMarketValue = fairMarketValue;
    }

    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    public Date getDonationDate() {
        return donationDate;
    }

    public void setDonationDate(Date donationDate) {
        this.donationDate = donationDate;
    }

    public String getMotivationCode() {
        return motivationCode;
    }

    public void setMotivationCode(String motivationCode) {
        this.motivationCode = motivationCode;
    }

    public boolean isAnonymous() {
        return anonymous;
    }

    public void setAnonymous(boolean anonymous) {
        this.anonymous = anonymous;
    }

    public String getRecognitionName() {
        return recognitionName;
    }

    public void setRecognitionName(String recognitionName) {
        this.recognitionName = recognitionName;
    }

    public boolean isSendAcknowledgment() {
        return sendAcknowledgment;
    }

    public void setSendAcknowledgment(boolean sendAcknowledgment) {
        this.sendAcknowledgment = sendAcknowledgment;
    }

    public Date getAcknowledgmentDate() {
        return acknowledgmentDate;
    }

    public void setAcknowledgmentDate(Date acknowledgmentDate) {
        this.acknowledgmentDate = acknowledgmentDate;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public FormBeanType getEmailType() {
        return emailType;
    }

    public void setEmailType(FormBeanType emailType) {
        this.emailType = emailType;
    }

    public Email getEmail() {
        return email;
    }

    public void setEmail(Email email) {
        this.email = email;
    }

    public Email getSelectedEmail() {
        if (selectedEmail == null) {
            selectedEmail = new Email(); // created only because spring needs to bind to it
        }
        return selectedEmail;
    }

    public void setSelectedEmail(Email selectedEmail) {
        this.selectedEmail = selectedEmail;
    }

    public List<GiftInKindDetail> getDetails() {
        return details;
    }

    public void setDetails(List<GiftInKindDetail> details) {
        this.details = details;
    }

    public List<GiftInKindDetail> getMutableDetails() {
        return mutableDetails;
    }

    public void setMutableDetails(List<GiftInKindDetail> mutableDetails) {
        this.mutableDetails = mutableDetails;
    }

    public Site getSite() {
        return person != null ? person.getSite() : null;
    }

    @Override
    public String toString() {
        return new ToStringCreator(this).append(super.toString()).append("fairMarketValue", fairMarketValue).append("currencyCode", currencyCode).
            append("donationDate", donationDate).append("sendAcknowledgment", sendAcknowledgment).append("acknowledgmentDate", acknowledgmentDate).
            append("motivationCode", motivationCode).append("anonymous", anonymous).append("recognitionName", recognitionName).
            append("constituent", person).append("selectedEmail", selectedEmail).
            toString();
    }
}
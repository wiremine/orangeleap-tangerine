package com.orangeleap.tangerine.domain.paymentInfo;

import java.math.BigDecimal;

import javax.xml.bind.annotation.XmlType;

import org.springframework.core.style.ToStringCreator;
import org.springframework.util.StringUtils;

import com.orangeleap.tangerine.domain.AbstractCustomizableEntity;
import com.orangeleap.tangerine.domain.Constituent;
import com.orangeleap.tangerine.util.StringConstants;
@XmlType (namespace="http://www.orangeleap.com/orangeleap/schemas")
public class DistributionLine extends AbstractCustomizableEntity {  
 
    private static final long serialVersionUID = 1L;
    private BigDecimal amount;
    private BigDecimal percentage;
    private String projectCode;
    private String motivationCode;
    private String other_motivationCode;
    private Long giftId;
    private Long pledgeId;
    private Long recurringGiftId;
    private Long adjustedGiftId;
    private Constituent constituent;

    public DistributionLine() { }

    public DistributionLine(BigDecimal amount, BigDecimal percentage, String projectCode, String motivationCode, String other_motivationCode) {
        this(amount);
        this.percentage = percentage;
        this.projectCode = projectCode;
        this.motivationCode = motivationCode;
        this.other_motivationCode = other_motivationCode;
    }
    
    public DistributionLine(DistributionLine otherLine, RecurringGift recurringGift) {
        this(otherLine.getAmount(), otherLine.getPercentage(), otherLine.getProjectCode(), otherLine.getMotivationCode(), otherLine.getOther_motivationCode());
        this.constituent = otherLine.getConstituent();
        setCustomFieldMap(otherLine.getCustomFieldMap());
        setCustomFieldValue(StringConstants.ASSOCIATED_RECURRING_GIFT_ID, recurringGift.getId().toString());
    }

    public DistributionLine(Constituent constituent) {
        this();
        this.constituent = constituent;
    }

    public DistributionLine(BigDecimal amount) {
        this();
        this.amount = amount;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getPercentage() {
        return percentage;
    }

    public void setPercentage(BigDecimal percentage) {
        this.percentage = percentage;
    }

    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    public String getMotivationCode() {
        return motivationCode;
    }

    public void setMotivationCode(String motivationCode) {
        this.motivationCode = motivationCode;
    }

    public String getOther_motivationCode() {
        return other_motivationCode;
    }

    public void setOther_motivationCode(String other_motivationCode) {
        this.other_motivationCode = other_motivationCode;
    }

    public Long getGiftId() {
        return giftId;
    }

    public void setGiftId(Long giftId) {
        this.giftId = giftId;
    }

    public Long getPledgeId() {
        return pledgeId;
    }

    public void setPledgeId(Long pledgeId) {
        this.pledgeId = pledgeId;
    }
    
    public Long getRecurringGiftId() {
        return recurringGiftId;
    }

    public void setRecurringGiftId(Long recurringGiftId) {
        this.recurringGiftId = recurringGiftId;
    }

    public Long getAdjustedGiftId() {
        return adjustedGiftId;
    }

    public void setAdjustedGiftId(Long adjustedGiftId) {
        this.adjustedGiftId = adjustedGiftId;
    }

    public Constituent getConstituent() {
        return constituent;
    }

    public void setConstituent(Constituent constituent) {
        this.constituent = constituent;
    }

    public boolean isValid() {
        boolean valid = false;
        if (amount != null) {
            valid = true;
        }
        return valid;
    }
    
    public boolean isFieldEntered() {
        return amount != null || percentage != null || StringUtils.hasText(projectCode) || StringUtils.hasText(motivationCode) || StringUtils.hasText(other_motivationCode);
    }
    
    @Override
    public void prePersist() {
        super.prePersist();
        setDefaultCustomFieldValue(StringConstants.TAX_DEDUCTIBLE, "false");
        if ("true".equals(getCustomFieldValue(StringConstants.ANONYMOUS_LOWER_CASE))) {
            setCustomFieldValue(StringConstants.RECOGNITION_NAME, StringConstants.ANONYMOUS_CAMEL_CASE);
        }
    }

    @Override
    public void setDefaults() {
        super.setDefaults();
        setDefaultCustomFieldValue(StringConstants.TAX_DEDUCTIBLE, "true"); 
        setDefaultCustomFieldValue(StringConstants.RECOGNITION_NAME, constituent == null ? null : constituent.getRecognitionName());
    }

    @Override
    public String toString() {
        return new ToStringCreator(this).append(super.toString()).append("amount", amount).
            append(super.toString()).append("percentage", percentage).append("projectCode", projectCode).
            append(super.toString()).append("motivationCode", motivationCode).append("other_motivationCode", other_motivationCode).
            append(super.toString()).append("giftId", giftId).append("pledgeId", pledgeId).append("recurringGiftId", recurringGiftId).append("adjustedGiftId", adjustedGiftId).
            toString();
    }
}

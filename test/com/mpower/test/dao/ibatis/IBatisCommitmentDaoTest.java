package com.mpower.test.dao.ibatis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import com.mpower.dao.interfaces.CommitmentDao;
import com.mpower.domain.model.Person;
import com.mpower.domain.model.Site;
import com.mpower.domain.model.communication.Email;
import com.mpower.domain.model.paymentInfo.Commitment;
import com.mpower.domain.model.paymentInfo.DistributionLine;
import com.mpower.type.CommitmentType;
import com.mpower.util.StringConstants;

public class IBatisCommitmentDaoTest extends AbstractIBatisTest {
    
    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());
    
    private CommitmentDao commitmentDao;

    @BeforeMethod
    public void setup() {
        commitmentDao = (CommitmentDao)super.applicationContext.getBean("commitmentDAO");
    }
    
    private void setupDistributionLines(Commitment commitment) {
        List<DistributionLine> lines = new ArrayList<DistributionLine>();
        
        DistributionLine line = new DistributionLine();
        line.setAmount(new BigDecimal(100));
        line.setProjectCode("foo");
        line.setCommitmentId(commitment.getId());
        lines.add(line);
        
        line = new DistributionLine();
        line.setAmount(new BigDecimal(50));
        line.setMotivationCode("bar");
        line.setCommitmentId(commitment.getId());
        lines.add(line);
        
        commitment.setDistributionLines(lines);
    }
    
    @Test(groups = { "testMaintainCommitment" }, dependsOnGroups = { "testReadCommitment" })
    public void testMaintainCommitment() throws Exception {
        // Insert
    	Commitment commitment = new Commitment();
    	commitment.setComments("comments");
    	commitment.setNotes("notes");
    	commitment.setCurrencyCode(StringConstants.USD);
    	commitment.setAmountTotal(new BigDecimal(150));
    	commitment.setCommitmentType(CommitmentType.PLEDGE);
    	commitment.setRecurring(false);
    	Email email = new Email();
    	email.setId(100L);
    	commitment.setEmail(email);
        Site site = new Site("company1");
    	Person person = new Person();
        person.setId(100L);
        person.setSite(site);
        commitment.setPerson(person);
        setupDistributionLines(commitment);
        
        commitment = commitmentDao.maintainCommitment(commitment);
        assert commitment.getId() > 0;
        
        Commitment readCommitment = commitmentDao.readCommitmentById(commitment.getId());
        assert readCommitment != null;
        assert commitment.getId().equals(readCommitment.getId());
        assert "comments".equals(readCommitment.getComments());
        assert "notes".equals(readCommitment.getNotes());
        assert readCommitment.isAutoPay() == false;
        assert StringConstants.USD.equals(readCommitment.getCurrencyCode());
        assert 150 == readCommitment.getAmountTotal().intValue();
        assert CommitmentType.PLEDGE.equals(readCommitment.getCommitmentType());
        
        assert readCommitment.getEmail() != null && readCommitment.getEmail().getId() == 100L;
        assert readCommitment.getPerson() != null && readCommitment.getPerson().getId() == 100L;
        assert readCommitment.getDistributionLines() != null && readCommitment.getDistributionLines().size() == 2;
        for (DistributionLine line : readCommitment.getDistributionLines()) {
            assert readCommitment.getId().equals(line.getCommitmentId());
            if (100 == line.getAmount().floatValue()) {
                assert "foo".equals(line.getProjectCode());
                assert line.getMotivationCode() == null;
                assert line.getOther_motivationCode() == null;
                assert line.getGiftId() == null;
            }
            else if (50 == line.getAmount().floatValue()) {
                assert "bar".equals(line.getMotivationCode());
                assert line.getProjectCode() == null;
                assert line.getOther_motivationCode() == null;
                assert line.getGiftId() == null;
            }
            else {
                Assert.assertTrue("Invalid ID = " + line.getId(), false);
            }
        }

        assert readCommitment.getAddress() == null;
        assert readCommitment.getPhone() == null;
        assert readCommitment.getPaymentSource() == null;
        assert readCommitment.getGifts() != null && readCommitment.getGifts().isEmpty();
        assert BigDecimal.ZERO.equals(readCommitment.getAmountPaid());
        assert 150 == readCommitment.getAmountRemaining().intValue();
        assert readCommitment.getAmountPerGift() == null;
        assert readCommitment.getStartDate() == null;
        assert readCommitment.getEndDate() == null;
        assert readCommitment.getPledgeDate() != null;
        assert readCommitment.getPledgeCancelDate() == null;
        assert readCommitment.getPledgeCancelReason() == null;
        assert Commitment.PLEDGE_STATUS_PENDING.equals(readCommitment.getPledgeStatus());
        assert readCommitment.getCreateDate() != null;
        assert readCommitment.getUpdateDate() != null;
        assert readCommitment.getFrequency() == null;
        assert readCommitment.getRecurringGift() == null;
        assert readCommitment.getLastEntryDate() == null;
        assert readCommitment.isRecurring() == false;
        assert readCommitment.getProjectedDate() == null;
        assert readCommitment.getPaymentType() == null;
        assert readCommitment.getCheckNumber() == null;
        assert readCommitment.isSendAcknowledgment() == false;
        assert readCommitment.getAcknowledgmentDate() == null;
        
        // Update
        commitment = readCommitment;
        commitment.setAcknowledgmentDate(new Date());
        commitment.setSendAcknowledgment(true);
        commitment.setRecurring(false);
        commitment.setAmountTotal(null);
        commitment.setAmountPerGift(new BigDecimal(12));
        commitment.setCommitmentType(CommitmentType.RECURRING_GIFT);
        commitment.setRecurring(true);
        commitment.setPhone(null);
        commitment.setEmail(null);
        
        commitment = commitmentDao.maintainCommitment(commitment);
        readCommitment = commitmentDao.readCommitmentById(commitment.getId());
        assert readCommitment != null;
        assert commitment.getId().equals(readCommitment.getId());
        assert "comments".equals(readCommitment.getComments());
        assert "notes".equals(readCommitment.getNotes());
        assert readCommitment.isAutoPay();
        assert 12 == readCommitment.getAmountPerGift().intValue();
        assert StringConstants.USD.equals(readCommitment.getCurrencyCode());
        assert readCommitment.getAmountTotal() == null;
        assert CommitmentType.RECURRING_GIFT.equals(readCommitment.getCommitmentType());
        assert readCommitment.isSendAcknowledgment();
        assert readCommitment.getAcknowledgmentDate() != null;
        assert readCommitment.isRecurring();

        assert readCommitment.getPhone() == null;
        assert readCommitment.getEmail() == null;
        assert readCommitment.getPerson() != null && readCommitment.getPerson().getId() == 100L;
//        assert readCommitment.getDistributionLines() != null && readCommitment.getDistributionLines().size() == 2;
        assert readCommitment.getAddress() == null;
        assert readCommitment.getPaymentSource() == null;
        assert readCommitment.getGifts() != null && readCommitment.getGifts().isEmpty();
        assert BigDecimal.ZERO.equals(readCommitment.getAmountPaid());
        assert readCommitment.getAmountRemaining() == null;
        assert readCommitment.getStartDate() == null;
        assert readCommitment.getEndDate() == null;
        assert readCommitment.getPledgeDate() != null;
        assert readCommitment.getPledgeCancelDate() == null;
        assert readCommitment.getPledgeCancelReason() == null;
        assert Commitment.PLEDGE_STATUS_PENDING.equals(readCommitment.getPledgeStatus());
        assert readCommitment.getCreateDate() != null;
        assert readCommitment.getUpdateDate() != null;
        assert readCommitment.getFrequency() == null;
        assert readCommitment.getRecurringGift() == null;
        assert readCommitment.getLastEntryDate() == null;
        assert readCommitment.getProjectedDate() == null;
        assert readCommitment.getPaymentType() == null;
        assert readCommitment.getCheckNumber() == null;
    } 
    
    public static void testId100L(Commitment commitment) {
        assert commitment != null;
        assert commitment.getId() == 100L;
        assert CommitmentType.RECURRING_GIFT.equals(commitment.getCommitmentType());
        assert "Thank you for your recurring gift".equals(commitment.getNotes());
        assert 550 == commitment.getAmountPerGift().intValue();
        assert Boolean.TRUE.equals(commitment.isAutoPay());
        assert Commitment.STATUS_ACTIVE.equals(commitment.getStatus());

        assert commitment.getEmail() != null && commitment.getEmail().getId() == 100L;
        assert "hobo@gmail.com".equals(commitment.getEmail().getEmailAddress());
        assert "home".equals(commitment.getEmail().getEmailType());
        assert commitment.getEmail().isInactive() == false;

        assert commitment.getPaymentSource() != null && commitment.getPaymentSource().getId() == 100L;
        assert "000001".equals(commitment.getPaymentSource().getAchAccountNumber());
        assert "Joe Blow".equals(commitment.getPaymentSource().getAchHolderName());
        assert "1234".equals(commitment.getPaymentSource().getAchRoutingNumber());
        assert commitment.getPaymentSource().isInactive();
        assert "Joe ACH".equals(commitment.getPaymentSource().getProfile());

        assert commitment.getPerson() != null && commitment.getPerson().getId() == 100L;
        assert "Billy Graham Ministries".equals(commitment.getPerson().getOrganizationName());
        assert "Graham".equals(commitment.getPerson().getLastName());
        assert "Billy".equals(commitment.getPerson().getFirstName());

        assert commitment.getAddress() == null;
        assert commitment.getPhone() == null;
        assert commitment.getGifts() != null && commitment.getGifts().isEmpty();
        assert commitment.getAmountTotal() == null;
        assert BigDecimal.ZERO.equals(commitment.getAmountPaid());
        assert commitment.getAmountRemaining() == null;
        assert commitment.getStartDate() == null;
        assert commitment.getEndDate() == null;
        assert commitment.getPledgeDate() == null;
        assert commitment.getPledgeCancelDate() == null;
        assert commitment.getPledgeCancelReason() == null;
        assert commitment.getPledgeStatus() == null;
        assert commitment.getCreateDate() == null;
        assert commitment.getUpdateDate() == null;
        assert commitment.getFrequency() == null;
        assert commitment.getRecurringGift() == null;
        assert commitment.getLastEntryDate() == null;
        assert commitment.isRecurring() == false;
        assert commitment.getProjectedDate() == null;
        assert commitment.getDistributionLines() != null && commitment.getDistributionLines().isEmpty();
        assert StringConstants.USD.equals(commitment.getCurrencyCode());
        assert commitment.getComments() == null;
        assert commitment.getPaymentType() == null;
        assert commitment.getCheckNumber() == null;
        assert commitment.isSendAcknowledgment() == false;
        assert commitment.getAcknowledgmentDate() == null;
    }

    @Test(groups = { "testReadCommitment" })
    public void testReadCommitmentById() throws Exception {
        Commitment commitment = commitmentDao.readCommitmentById(0L);
        assert commitment == null;
        
        commitment = commitmentDao.readCommitmentById(100L);
        testId100L(commitment);
    }
    
    @Test(groups = { "testReadCommitment" })
    public void testReadCommitmentsByConstituentIdType() throws Exception {
        List<Commitment> commitments = commitmentDao.readCommitmentsByConstituentIdType(0L, CommitmentType.MEMBERSHIP);
        assert commitments != null && commitments.isEmpty();
        
        commitments = commitmentDao.readCommitmentsByConstituentIdType(300L, CommitmentType.PLEDGE);
        assert commitments != null && commitments.size() == 1;
        Commitment commitment = commitments.get(0);
        
        assert commitment.getId() == 200L;
        assert CommitmentType.PLEDGE.equals(commitment.getCommitmentType());
        assert "Thank you for your pledge".equals(commitment.getNotes());
        assert 25 == commitment.getAmountTotal().intValue();
        assert Boolean.FALSE.equals(commitment.isAutoPay());
        assert "pending".equals(commitment.getPledgeStatus());
        assert commitment.isSendAcknowledgment();
        assert commitment.isRecurring();
        assert commitment.getStatus() == null;
        
        assert commitment.getPerson() != null && commitment.getPerson().getId() == 300L;
        assert "Howdy Doody Inc".equals(commitment.getPerson().getOrganizationName());
        assert "Doody".equals(commitment.getPerson().getLastName());
        assert "Howdy".equals(commitment.getPerson().getFirstName());

        assert commitment.getAddress() != null && commitment.getAddress().getId() == 100L;
        assert "3726 THIRD ST".equals(commitment.getAddress().getAddressLine1());
        assert "home".equals(commitment.getAddress().getAddressType());
        assert "Dallas".equals(commitment.getAddress().getCity());
        assert "TX".equals(commitment.getAddress().getStateProvince());
        assert "75554".equals(commitment.getAddress().getPostalCode());
        assert "US".equals(commitment.getAddress().getCountry());
        assert commitment.getAddress().getAddressLine2() == null;
        assert commitment.getAddress().getAddressLine3() == null;
        
        assert commitment.getPhone() != null && commitment.getPhone().getId() == 100L;
        assert "214-443-6829".equals(commitment.getPhone().getNumber());
        assert "home".equals(commitment.getPhone().getPhoneType());
        assert commitment.getPhone().getCreateDate() != null;
        assert commitment.getPhone().getUpdateDate() != null;
        assert 100L == commitment.getPhone().getPersonId();

        assert commitment.getDistributionLines() != null && commitment.getDistributionLines().size() == 2;
        for (DistributionLine line : commitment.getDistributionLines()) {
            assert line.getId() == 500L || line.getId() == 600L;
            switch (line.getId().intValue()) {
                case 500:
                    assert 20 == line.getAmount().intValue();
                    assert "hi mom".equals(line.getOther_motivationCode());
                    assert 200L == line.getCommitmentId();
                    assert line.getGiftId() == null;
                    assert line.getMotivationCode() == null;
                    assert line.getProjectCode() == null;
                    break;
                case 600:
                    assert 5 == line.getAmount().intValue();
                    assert 200L == line.getCommitmentId();
                    assert line.getOther_motivationCode() == null;
                    assert line.getGiftId() == null;
                    assert line.getMotivationCode() == null;
                    assert line.getProjectCode() == null;
                    break;
                default:
                    Assert.assertTrue("Invalid ID = " + line.getId(), false);
            }
        }

        assert commitment.getEmail() == null;
        assert commitment.getPaymentSource() == null;
        assert commitment.getGifts() != null && commitment.getGifts().isEmpty();
        assert commitment.getAmountPerGift() == null;
        assert BigDecimal.ZERO.equals(commitment.getAmountPaid());
        assert 25 == commitment.getAmountRemaining().intValue();
        assert commitment.getStartDate() == null;
        assert commitment.getEndDate() == null;
        assert commitment.getPledgeDate() == null;
        assert commitment.getPledgeCancelDate() == null;
        assert commitment.getPledgeCancelReason() == null;
        assert commitment.getCreateDate() == null;
        assert commitment.getUpdateDate() == null;
        assert commitment.getFrequency() == null;
        assert commitment.getRecurringGift() == null;
        assert commitment.getLastEntryDate() == null;
        assert commitment.getProjectedDate() == null;
        assert StringConstants.USD.equals(commitment.getCurrencyCode());
        assert commitment.getComments() == null;
        assert commitment.getPaymentType() == null;
        assert commitment.getCheckNumber() == null;
        assert commitment.getAcknowledgmentDate() == null;
    }
}

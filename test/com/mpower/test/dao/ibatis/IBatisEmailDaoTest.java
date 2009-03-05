package com.mpower.test.dao.ibatis;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import com.mpower.dao.interfaces.EmailDao;
import com.mpower.domain.model.communication.Email;
import com.mpower.type.ActivationType;
import com.mpower.util.StringConstants;

public class IBatisEmailDaoTest extends AbstractIBatisTest {
    
    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());
    
    private EmailDao emailDao;

    @BeforeMethod
    public void setup() {
        emailDao = (EmailDao)super.applicationContext.getBean("emailDAO");
    }
    
    @Test(groups = { "testMaintainEmail" }, dependsOnGroups = { "testReadEmail" })
    public void testMaintainEmail() throws Exception {
        // Insert
        Email email = new Email(300L, "bow@wow.com");
        email.setEffectiveDate(new Date());
        email = emailDao.maintainEntity(email);
        assert email.getId() > 0;
        Email readEmail = emailDao.readById(email.getId());
        assert readEmail != null;
        assert email.getId().equals(readEmail.getId());
        assert 300L == readEmail.getPersonId();
        assert "bow@wow.com".equals(readEmail.getEmailAddress());
        assert StringConstants.UNKNOWN_LOWER_CASE.equals(readEmail.getEmailType());
        assert ActivationType.permanent.equals(readEmail.getActivationStatus());
        assert readEmail.getEmailDisplay() == null;
        assert readEmail.getCreateDate() != null;
        assert readEmail.getUpdateDate() != null;
        assert readEmail.isReceiveMail() == false;
        assert readEmail.isInactive() == false;
        assert readEmail.getComments() == null;
        assert readEmail.getEffectiveDate() != null;
        assert readEmail.getSeasonalStartDate() == null;
        assert readEmail.getSeasonalEndDate() == null;
        assert readEmail.getTemporaryStartDate() == null;
        assert readEmail.getTemporaryEndDate() == null;
        
        // Update
        email.setEmailType("trash");
        email.setActivationStatus(ActivationType.temporary);
        email.setTemporaryStartDate(new Date());
        email.setTemporaryEndDate(new Date());
        email.setEffectiveDate(null);
        email = emailDao.maintainEntity(email);
        readEmail = emailDao.readById(email.getId());
        assert readEmail != null;
        assert "trash".equals(readEmail.getEmailType());
        assert ActivationType.temporary.equals(readEmail.getActivationStatus());
        assert readEmail.getTemporaryStartDate() != null;
        assert readEmail.getTemporaryEndDate() != null;

        assert email.getId().equals(readEmail.getId());
        assert 300L == readEmail.getPersonId();
        assert "bow@wow.com".equals(readEmail.getEmailAddress());
        assert readEmail.getEmailDisplay() == null;
        assert readEmail.getCreateDate() != null;
        assert readEmail.getUpdateDate() != null;
        assert readEmail.isReceiveMail() == false;
        assert readEmail.isInactive() == false;
        assert readEmail.getComments() == null;
        assert readEmail.getEffectiveDate() == null;
        assert readEmail.getSeasonalStartDate() == null;
        assert readEmail.getSeasonalEndDate() == null;        
    }

    @Test(groups = { "testReadEmail" })
    public void testReadEmail() throws Exception {
        Email email = emailDao.readById(300L);
        assert email != null;
        assert 300L == email.getId();
        assert "brown@aol.com".equals(email.getEmailAddress());
        assert "other".equals(email.getEmailType());
        assert email.getEmailDisplay() == null;
        assert email.getCreateDate() != null;
        assert email.getUpdateDate() != null;
        assert 100L == email.getPersonId();
        assert email.isReceiveMail() == false;
        assert ActivationType.permanent.equals(email.getActivationStatus());
        assert email.isInactive();
        assert email.getComments() == null;
        assert email.getEffectiveDate() == null;
        assert email.getSeasonalStartDate() == null;
        assert email.getSeasonalEndDate() == null;
        assert email.getTemporaryStartDate() == null;
        assert email.getTemporaryEndDate() == null;
    } 

    @Test(groups = { "testReadEmail" })
    public void testReadEmailsByConstituentId() throws Exception {
        List<Email> emails = emailDao.readByConstituentId(100L); 
        assert emails != null && emails.size() == 3;
        for (Email email : emails) {
            if (email.getId() >= 100L && email.getId() <= 300L) {
                assert email.getUpdateDate() != null;
                assert email.getCreateDate() != null;
                assert 100L == email.getPersonId();
                assert email.isReceiveMail() == false;
                assert ActivationType.permanent.equals(email.getActivationStatus());
            }
            switch (email.getId().intValue()) {
                case 100:
                    assert "hobo@gmail.com".equals(email.getEmailAddress());
                    assert "home".equals(email.getEmailType());
                    assert email.isInactive() == false;
                    break;
                case 200:
                    assert "samsam@yahoo.com".equals(email.getEmailAddress());
                    assert "work".equals(email.getEmailType());
                    assert email.isInactive() == false;
                    break;
                case 300:
                    assert "brown@aol.com".equals(email.getEmailAddress());
                    assert "other".equals(email.getEmailType());
                    assert email.isInactive() == true;
                    break;
                default:
                    assert false == true;
            }
        }
        
        emails = emailDao.readByConstituentId(200L);
        assert emails != null && emails.isEmpty();
    }
    
    @Test(groups = { "testReadEmail" })
    public void testReadActiveEmailsByConstituentId() throws Exception {
        List<Email> emails = emailDao.readActiveByConstituentId(100L);
        assert emails != null && emails.size() == 2;
        for (Email email : emails) {
            if (email.getId() >= 100L && email.getId() <= 200L) {
                assert email.getUpdateDate() != null;
                assert email.getCreateDate() != null;
                assert 100L == email.getPersonId();
                assert email.isReceiveMail() == false;
                assert ActivationType.permanent.equals(email.getActivationStatus());
            }
            switch (email.getId().intValue()) {
                case 100:
                    assert "hobo@gmail.com".equals(email.getEmailAddress());
                    assert "home".equals(email.getEmailType());
                    assert email.isInactive() == false;
                    break;
                case 200:
                    assert "samsam@yahoo.com".equals(email.getEmailAddress());
                    assert "work".equals(email.getEmailType());
                    assert email.isInactive() == false;
                    break;
                default:
                    assert false == true;
            }
        }
    }
    
    @Test(groups = { "testInactivateEmail" }, dependsOnGroups = { "testReadEmail", "testMaintainEmail" })
    public void testInactivateEmail() throws Exception {
        Email email = new Email(300L, "jow@jow.com");
        email.setActivationStatus(ActivationType.temporary);
        email.setInactive(false);
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date d = sdf.parse("01/01/1990");
        email.setTemporaryEndDate(d);
        
        email = emailDao.maintainEntity(email);
        assert email.getId() > 0;
        
        Email readEmail = emailDao.readById(email.getId());
        assert readEmail != null;
        assert email.getId().equals(readEmail.getId());
        assert ActivationType.temporary.equals(readEmail.getActivationStatus());
        assert readEmail.isInactive() == false;
        assert d.equals(readEmail.getTemporaryEndDate());
        assert "jow@jow.com".equals(readEmail.getEmailAddress());
        assert 300L == readEmail.getPersonId();
        
        emailDao.inactivateEntities();
        
        readEmail = emailDao.readById(email.getId());
        assert readEmail != null;
        assert email.getId().equals(readEmail.getId());
        assert ActivationType.temporary.equals(readEmail.getActivationStatus());
        assert readEmail.isInactive();
        assert d.equals(readEmail.getTemporaryEndDate());
        assert "jow@jow.com".equals(readEmail.getEmailAddress());
        assert 300L == readEmail.getPersonId();
    }
}

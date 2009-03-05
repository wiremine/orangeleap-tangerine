package com.mpower.dao.ibatis;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.mpower.dao.interfaces.PhoneDao;
import com.mpower.domain.model.communication.Phone;

/** 
 * Corresponds to the PHONE table
 */
@Repository("phoneDAO")
public class IBatisPhoneDao extends AbstractIBatisDao implements PhoneDao {
    
    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    @Autowired
    public IBatisPhoneDao(SqlMapClient sqlMapClient) {
        super(sqlMapClient);
    }
    
    @Override
    public Phone maintainEntity(Phone phone) {
        if (logger.isDebugEnabled()) {
            logger.debug("maintainEntity: phone = " + phone);
        }
        return (Phone)insertOrUpdate(phone, "PHONE");
    }

    @Override
    public Phone readById(Long phoneId) {
        if (logger.isDebugEnabled()) {
            logger.debug("readById: phoneId = " + phoneId);
        }
        return (Phone)getSqlMapClientTemplate().queryForObject("SELECT_PHONE_BY_PHONE_ID", phoneId);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Phone> readByConstituentId(Long constituentId) {
        if (logger.isDebugEnabled()) {
            logger.debug("readByConstituentId: constituentId = " + constituentId);
        }
        return getSqlMapClientTemplate().queryForList("SELECT_ALL_PHONES_BY_CONSTITUENT_ID", constituentId);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Phone> readActiveByConstituentId(Long constituentId) {
        if (logger.isDebugEnabled()) {
            logger.debug("readActiveByConstituentId: constituentId = " + constituentId);
        }
        return getSqlMapClientTemplate().queryForList("SELECT_ACTIVE_PHONES_BY_CONSTITUENT_ID", constituentId);
    }
    
    @Override
    public void inactivateEntities() {
        int rows = getSqlMapClientTemplate().update("INACTIVATE_PHONES");
        if (logger.isInfoEnabled()) {
            logger.info("inactivateEntities: number of phones marked inactive = " + rows);
        }
    }
}
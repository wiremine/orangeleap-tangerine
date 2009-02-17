package com.mpower.dao.ibatis.generated;

import com.mpower.domain.model.EmailCustomField;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class EmailCustomFieldDAOImpl extends SqlMapClientDaoSupport implements EmailCustomFieldDAO {

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EMAIL_CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public EmailCustomFieldDAOImpl() {
        super();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EMAIL_CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int deleteByPrimaryKey(Long emailCustomFieldId) {
        EmailCustomField key = new EmailCustomField();
        key.setEmailCustomFieldId(emailCustomFieldId);
        int rows = getSqlMapClientTemplate().delete("EMAIL_CUSTOM_FIELD.ibatorgenerated_deleteByPrimaryKey", key);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EMAIL_CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public void insert(EmailCustomField record) {
        getSqlMapClientTemplate().insert("EMAIL_CUSTOM_FIELD.ibatorgenerated_insert", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EMAIL_CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public void insertSelective(EmailCustomField record) {
        getSqlMapClientTemplate().insert("EMAIL_CUSTOM_FIELD.ibatorgenerated_insertSelective", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EMAIL_CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public EmailCustomField selectByPrimaryKey(Long emailCustomFieldId) {
        EmailCustomField key = new EmailCustomField();
        key.setEmailCustomFieldId(emailCustomFieldId);
        EmailCustomField record = (EmailCustomField) getSqlMapClientTemplate().queryForObject("EMAIL_CUSTOM_FIELD.ibatorgenerated_selectByPrimaryKey", key);
        return record;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EMAIL_CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int updateByPrimaryKeySelective(EmailCustomField record) {
        int rows = getSqlMapClientTemplate().update("EMAIL_CUSTOM_FIELD.ibatorgenerated_updateByPrimaryKeySelective", record);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table EMAIL_CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int updateByPrimaryKey(EmailCustomField record) {
        int rows = getSqlMapClientTemplate().update("EMAIL_CUSTOM_FIELD.ibatorgenerated_updateByPrimaryKey", record);
        return rows;
    }
}
package com.mpower.dao.ibatis.generated;

import com.mpower.domain.model.CustomField;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class CustomFieldDAOImpl extends SqlMapClientDaoSupport implements CustomFieldDAO {

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public CustomFieldDAOImpl() {
        super();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int deleteByPrimaryKey(Long customFieldId) {
        CustomField key = new CustomField();
        key.setCustomFieldId(customFieldId);
        int rows = getSqlMapClientTemplate().delete("CUSTOM_FIELD.ibatorgenerated_deleteByPrimaryKey", key);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public void insert(CustomField record) {
        getSqlMapClientTemplate().insert("CUSTOM_FIELD.ibatorgenerated_insert", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public void insertSelective(CustomField record) {
        getSqlMapClientTemplate().insert("CUSTOM_FIELD.ibatorgenerated_insertSelective", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public CustomField selectByPrimaryKey(Long customFieldId) {
        CustomField key = new CustomField();
        key.setCustomFieldId(customFieldId);
        CustomField record = (CustomField) getSqlMapClientTemplate().queryForObject("CUSTOM_FIELD.ibatorgenerated_selectByPrimaryKey", key);
        return record;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int updateByPrimaryKeySelective(CustomField record) {
        int rows = getSqlMapClientTemplate().update("CUSTOM_FIELD.ibatorgenerated_updateByPrimaryKeySelective", record);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int updateByPrimaryKeyWithBLOBs(CustomField record) {
        int rows = getSqlMapClientTemplate().update("CUSTOM_FIELD.ibatorgenerated_updateByPrimaryKeyWithBLOBs", record);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CUSTOM_FIELD
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int updateByPrimaryKeyWithoutBLOBs(CustomField record) {
        int rows = getSqlMapClientTemplate().update("CUSTOM_FIELD.ibatorgenerated_updateByPrimaryKey", record);
        return rows;
    }
}
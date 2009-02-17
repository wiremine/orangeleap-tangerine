package com.mpower.dao.ibatis.generated;

import com.mpower.domain.model.Code;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class CodeDAOImpl extends SqlMapClientDaoSupport implements CodeDAO {

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CODE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public CodeDAOImpl() {
        super();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CODE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int deleteByPrimaryKey(Long codeId) {
        Code key = new Code();
        key.setCodeId(codeId);
        int rows = getSqlMapClientTemplate().delete("CODE.ibatorgenerated_deleteByPrimaryKey", key);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CODE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public void insert(Code record) {
        getSqlMapClientTemplate().insert("CODE.ibatorgenerated_insert", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CODE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public void insertSelective(Code record) {
        getSqlMapClientTemplate().insert("CODE.ibatorgenerated_insertSelective", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CODE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public Code selectByPrimaryKey(Long codeId) {
        Code key = new Code();
        key.setCodeId(codeId);
        Code record = (Code) getSqlMapClientTemplate().queryForObject("CODE.ibatorgenerated_selectByPrimaryKey", key);
        return record;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CODE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int updateByPrimaryKeySelective(Code record) {
        int rows = getSqlMapClientTemplate().update("CODE.ibatorgenerated_updateByPrimaryKeySelective", record);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table CODE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int updateByPrimaryKey(Code record) {
        int rows = getSqlMapClientTemplate().update("CODE.ibatorgenerated_updateByPrimaryKey", record);
        return rows;
    }
}
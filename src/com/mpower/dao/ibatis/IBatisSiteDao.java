package com.mpower.dao.ibatis;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.mpower.dao.interfaces.SiteDao;
import com.mpower.domain.customization.EntityDefault;
import com.mpower.domain.model.Site;
import com.mpower.type.EntityType;

/** 
 * Corresponds to the SITE table
 */
@Repository("siteDAO")
public class IBatisSiteDao extends AbstractIBatisDao implements SiteDao {
    
    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    @Autowired
    public IBatisSiteDao(SqlMapClient sqlMapClient) {
        super();
        super.setSqlMapClient(sqlMapClient);
    }

    @Override
    public Site createSite(String siteName, String merchantNumber, Site parentSite) {
        if (logger.isDebugEnabled()) {
            logger.debug("readSite: siteName = " + siteName);
        }
        Site site = new Site();
        site.setName(siteName);
        site.setMerchantNumber(merchantNumber);
        site.setParentSite(parentSite);
        getSqlMapClientTemplate().insert("INSERT_SITE", site);
        return site;
    }

    @Override
    public List<EntityDefault> readEntityDefaults(String siteName, List<EntityType> entityTypes) {
        return null;
    }

    @Override
    public Site readSite(String siteName) {
        if (logger.isDebugEnabled()) {
            logger.debug("readSite: siteName = " + siteName);
        }
        return (Site)getSqlMapClientTemplate().queryForObject("SELECT_BY_SITE_NAME", siteName);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Site> readSites() {
        if (logger.isDebugEnabled()) {
            logger.debug("readSites:");
        }
        return getSqlMapClientTemplate().queryForList("SELECT_ALL_SITES");
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int deleteByPrimaryKey(String siteName) {
        Site key = new Site();
        key.setName(siteName);
        int rows = getSqlMapClientTemplate().delete("SITE.ibatorgenerated_deleteByPrimaryKey", key);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public void insert(Site record) {
        getSqlMapClientTemplate().insert("SITE.ibatorgenerated_insert", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public void insertSelective(Site record) {
        getSqlMapClientTemplate().insert("SITE.ibatorgenerated_insertSelective", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public Site selectByPrimaryKey(String siteName) {
        Site key = new Site();
        key.setName(siteName);
        Site record = (Site) getSqlMapClientTemplate().queryForObject("SITE.ibatorgenerated_selectByPrimaryKey", key);
        return record;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int updateByPrimaryKeySelective(Site record) {
        int rows = getSqlMapClientTemplate().update("SITE.ibatorgenerated_updateByPrimaryKeySelective", record);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    public int updateByPrimaryKey(Site record) {
        int rows = getSqlMapClientTemplate().update("SITE.ibatorgenerated_updateByPrimaryKey", record);
        return rows;
    }
}
package com.mpower.dao.ibatis.generated;

import com.mpower.domain.model.Site;

public interface SiteDAO {
    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    int deleteByPrimaryKey(String siteName);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    void insert(Site record);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    void insertSelective(Site record);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    Site selectByPrimaryKey(String siteName);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    int updateByPrimaryKeySelective(Site record);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table SITE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    int updateByPrimaryKey(Site record);
}
package com.mpower.dao.ibatis.generated;

import com.mpower.domain.model.Gift;

public interface GiftDAO {
    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table GIFT
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    int deleteByPrimaryKey(Long giftId);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table GIFT
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    void insert(Gift record);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table GIFT
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    void insertSelective(Gift record);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table GIFT
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    Gift selectByPrimaryKey(Long giftId);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table GIFT
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    int updateByPrimaryKeySelective(Gift record);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table GIFT
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    int updateByPrimaryKey(Gift record);
}
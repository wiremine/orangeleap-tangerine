package com.mpower.dao.ibatis.generated;

import com.mpower.domain.model.MessageResource;

public interface MessageResourceDAO {
    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table MESSAGE_RESOURCE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    int deleteByPrimaryKey(Long messageResourceId);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table MESSAGE_RESOURCE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    void insert(MessageResource record);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table MESSAGE_RESOURCE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    void insertSelective(MessageResource record);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table MESSAGE_RESOURCE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    MessageResource selectByPrimaryKey(Long messageResourceId);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table MESSAGE_RESOURCE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    int updateByPrimaryKeySelective(MessageResource record);

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table MESSAGE_RESOURCE
     *
     * @ibatorgenerated Mon Feb 16 12:53:27 CST 2009
     */
    int updateByPrimaryKey(MessageResource record);
}
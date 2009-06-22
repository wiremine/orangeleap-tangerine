package com.orangeleap.tangerine.domain;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.springframework.core.style.ToStringCreator;

import javax.xml.bind.annotation.XmlType;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;

@XmlType (namespace="http://www.orangeleap.com/orangeleap/schemas")
public class PostBatch  {

    private static final long serialVersionUID = 1L;

    private Long id;
    private String postBatchDesc;
    private String entity;
    private boolean reviewSetGenerated;
    private Long reviewSetGeneratedById;
    private Date reviewSetGeneratedDate;
    private Long reviewSetSize;
    private boolean posted;
    private Long postedById;
    private Date postedDate;
    private String siteName;
    private Date createDate;
    private Date updateDate;

    private Map<String, String> whereConditions = new TreeMap<String, String>();
    private Map<String, String> updateFields = new TreeMap<String, String>();


    public PostBatch() { }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getPostBatchDesc() {
        return postBatchDesc;
    }

    public void setPostBatchDesc(String postBatchDesc) {
        this.postBatchDesc = postBatchDesc;
    }


    public String getEntity() {
        return entity;
    }

    public void setEntity(String entity) {
        this.entity = entity;
    }


    public boolean getReviewSetGenerated() {
        return reviewSetGenerated;
    }

    public void setReviewSetGenerated(boolean reviewSetGenerated) {
        this.reviewSetGenerated = reviewSetGenerated;
    }


    public Long getReviewSetGeneratedById() {
        return reviewSetGeneratedById;
    }

    public void setReviewSetGeneratedById(Long reviewSetGeneratedById) {
        this.reviewSetGeneratedById = reviewSetGeneratedById;
    }


    public Date getReviewSetGeneratedDate() {
        return reviewSetGeneratedDate;
    }

    public void setReviewSetGeneratedDate(Date reviewSetGeneratedDate) {
        this.reviewSetGeneratedDate = reviewSetGeneratedDate;
    }


    public Long getReviewSetSize() {
        return reviewSetSize;
    }

    public void setReviewSetSize(Long reviewSetSize) {
        this.reviewSetSize = reviewSetSize;
    }


    public boolean getPosted() {
        return posted;
    }

    public void setPosted(boolean posted) {
        this.posted = posted;
    }


    public Long getPostedById() {
        return postedById;
    }

    public void setPostedById(Long postedById) {
        this.postedById = postedById;
    }


    public Date getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(Date postedDate) {
        this.postedDate = postedDate;
    }


    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }


    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }





    /*
     Fields to select on, e.g.:
            status         Paid
            constituentId  123456
            donation_date  >2009-01-01
            txRefNum       !=null
     */
    public Map<String, String> getWhereConditions() {
        return whereConditions;
    }

    public void setWhereConditions(Map<String, String> whereConditions) {
        this.whereConditions = whereConditions;
    }

    /*
     Fields to set. e.g.:
            status         Posted
            acustomfield   somevalue
     */
    public Map<String, String> getUpdateFields() {
        return updateFields;
    }

    public void setUpdateFields(Map<String, String> updateFields) {
        this.updateFields = updateFields;
    }




    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof PostBatch)) {
            return false;
        }
        PostBatch a = (PostBatch) obj;
        EqualsBuilder eb = new EqualsBuilder();
        eb
        .append(id, a.getId())
        .append(postBatchDesc, a.getPostBatchDesc())
        .append(entity, a.getEntity())
        .append(reviewSetGenerated, a.getReviewSetGenerated())
        .append(reviewSetGeneratedById, a.getReviewSetGeneratedById())
        .append(reviewSetGeneratedDate, a.getReviewSetGeneratedDate())
        .append(reviewSetSize, a.getReviewSetSize())
        .append(posted, a.getPosted())
        .append(postedById, a.getPostedById())
        .append(postedDate, a.getPostedDate())
        .append(siteName, a.getSiteName())
		;
        return eb.isEquals();
    }

    @Override
    public int hashCode() {
        HashCodeBuilder hcb = new HashCodeBuilder();
        hcb
        .append(""+id)
        .append(""+postBatchDesc)
        .append(""+entity)
        .append(""+reviewSetGenerated)
        .append(""+reviewSetGeneratedById)
        .append(""+reviewSetGeneratedDate)
        .append(""+reviewSetSize)
        .append(""+posted)
        .append(""+postedById)
        .append(""+postedDate)
        .append(""+siteName)
		;
        return hcb.hashCode();
    }

    @Override
    public String toString() {
        return new ToStringCreator(this)
        .append(super.toString())
        .append("id", ""+id)
        .append("postBatchDesc", ""+postBatchDesc)
        .append("entity", ""+entity)
        .append("reviewSetGenerated", ""+reviewSetGenerated)
        .append("reviewSetGeneratedById", ""+reviewSetGeneratedById)
        .append("reviewSetGeneratedDate", ""+reviewSetGeneratedDate)
        .append("reviewSetSize", ""+reviewSetSize)
        .append("posted", ""+posted)
        .append("postedById", ""+postedById)
        .append("postedDate", ""+postedDate)
        .append("siteName", ""+siteName)
        .toString();
    }

}

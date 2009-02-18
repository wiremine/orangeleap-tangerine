package com.mpower.domain.model.customization;

import java.io.Serializable;

import com.mpower.domain.model.Site;
import com.mpower.type.AccessType;
import com.mpower.type.PageType;

public class PageAccess implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;
    private PageType pageType;
    private Site site;
    private String role;
    private AccessType accessType;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public PageType getPageType() {
        return pageType;
    }

    public void setPageType(PageType pageType) {
        this.pageType = pageType;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public AccessType getAccessType() {
        return accessType;
    }

    public void setAccessType(AccessType accessType) {
        this.accessType = accessType;
    }
}

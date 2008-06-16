package com.mpower.dao;

import java.util.List;

import com.mpower.domain.entity.Site;
import com.mpower.domain.entity.customization.EntityDefault;
import com.mpower.domain.type.EntityType;

public interface SiteDao {

	public Site readSite(Long siteId);

	public List<EntityDefault> readEntityDefaults(Long siteId, List<EntityType> entityTypes);
}

package com.mpower.dao.interfaces;

import java.util.List;

import com.mpower.domain.model.Site;
import com.mpower.domain.model.customization.EntityDefault;
import com.mpower.type.EntityType;

public interface SiteDao {

    public Site createSite(Site site);

    public Site readSite(String siteName);
	
	public List<Site> readSites();

	public int updateSite(Site site);
	
    public EntityDefault createEntityDefault(EntityDefault entityDefault);

    public List<EntityDefault> readEntityDefaults(List<EntityType> entityTypes);
    
    public int updateEntityDefault(EntityDefault entityDefault);
}

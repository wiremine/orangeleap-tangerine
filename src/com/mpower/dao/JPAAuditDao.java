package com.mpower.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import com.mpower.domain.Audit;
import com.mpower.domain.Site;

@Repository("auditDao")
public class JPAAuditDao implements AuditDao {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    @PersistenceContext
    private EntityManager em;

    @Override
    public Audit auditObject(Audit audit) {
        if (audit.getId() == null) {
            em.persist(audit);
            return audit;
        }
        return em.merge(audit);
    }

	@SuppressWarnings("unchecked")
	@Override
	public List<Audit> allAuditHistoryForSite(Site site) {
		
		//Query q = em.createQuery ("SELECT x FROM Magazine x WHERE x.title = :titleParam and x.price > :priceParam");
		//q.setParameter ("titleParam", "JDJ").setParameter ("priceParam", 5.0);
		//List<Magazine> results = q.getResultList ();
		
		Query q =  em.createQuery("SELECT audit FROM com.mpower.domain.Audit audit WHERE audit.site = :site");
		q.setParameter("site", site);
		List<Audit> audits = q.getResultList();
		return audits;
	}
}

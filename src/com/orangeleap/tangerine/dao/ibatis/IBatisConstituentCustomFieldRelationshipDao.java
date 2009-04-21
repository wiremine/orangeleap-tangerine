package com.orangeleap.tangerine.dao.ibatis;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.orangeleap.tangerine.dao.ConstituentCustomFieldRelationshipDao;
import com.orangeleap.tangerine.domain.customization.ConstituentCustomFieldRelationship;

/** 
 * Corresponds to the CONSTITUENT tables
 */
@Repository("constituentCustomFieldRelationshipDAO")
public class IBatisConstituentCustomFieldRelationshipDao extends AbstractIBatisDao implements ConstituentCustomFieldRelationshipDao {
	
	
    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    @Autowired
    public IBatisConstituentCustomFieldRelationshipDao(SqlMapClient sqlMapClient) {
        super(sqlMapClient);
    }
    
    
    @Override
    public ConstituentCustomFieldRelationship readById(Long id) {
        if (logger.isTraceEnabled()) {
            logger.trace("readConstituentById: id = " + id);
        }
        Map<String, Object> params = setupParams();
        params.put("id", id);
        return (ConstituentCustomFieldRelationship)getSqlMapClientTemplate().queryForObject("SELECT_CONSTITUENT_CUSTOM_FIELD_RELATIONSHIP_BY_ID", params);
    }
    
    @Override
    public ConstituentCustomFieldRelationship maintainConstituentCustomFieldRelationship(ConstituentCustomFieldRelationship constituentCustomFieldRelationship) {
        if (logger.isTraceEnabled()) {
            logger.trace("maintainConstituentCustomFieldRelationship: Id = " + constituentCustomFieldRelationship.getId());
        }
        return (ConstituentCustomFieldRelationship)insertOrUpdate(constituentCustomFieldRelationship, "CONSTITUENT_CUSTOM_FIELD_RELATIONSHIP");
    }

    @SuppressWarnings("unchecked")
	@Override
	public List<ConstituentCustomFieldRelationship> readAllByConstituentAndFieldRelationship(Long personId, Long fieldRelationshipId) {
        if (logger.isTraceEnabled()) {
            logger.trace("readAllByConstituentAndFieldRelationship: personid = " + personId);
        }
        Map<String, Object> params = setupParams();
        params.put("personId", personId);
        params.put("fieldRelationshipId", fieldRelationshipId);
        return getSqlMapClientTemplate().queryForList("SELECT_CONSTITUENT_CUSTOM_FIELD_RELATIONSHIP_BY_CONSTITUENT_AND_RELATIONSHIP", params);
	}
   

}
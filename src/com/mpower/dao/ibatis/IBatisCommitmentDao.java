package com.mpower.dao.ibatis;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.mpower.dao.interfaces.CommitmentDao;
import com.mpower.domain.model.paymentInfo.Commitment;
import com.mpower.domain.model.paymentInfo.DistributionLine;
import com.mpower.type.CommitmentType;

@Repository("commitmentDAO")
public class IBatisCommitmentDao extends AbstractIBatisDao implements CommitmentDao {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    @Autowired
    public IBatisCommitmentDao(SqlMapClient sqlMapClient) {
        super(sqlMapClient);
    }
 
    @Override
    public Commitment maintainCommitment(Commitment commitment) {
        if (logger.isDebugEnabled()) {
            logger.debug("maintainCommitment: commitment = " + commitment);
        }
        // TODO: delete distribution lines?
        Commitment aCommitment = (Commitment) insertOrUpdate(commitment, "COMMITMENT");
        if (commitment.getDistributionLines() != null) {
            for (DistributionLine line : commitment.getDistributionLines()) {
                if (line.getCommitmentId() == null || line.getCommitmentId() <= 0) {
                    line.setCommitmentId(commitment.getId());
                }
            }
        }
        batchInsertOrUpdate(commitment.getDistributionLines(), "DISTRO_LINE");
        return aCommitment;
    }

    @Override
    public Commitment readCommitmentById(Long commitmentId) {
        if (logger.isDebugEnabled()) {
            logger.debug("readCommitmentById: commitmentId = " + commitmentId);
        }
        Map<String, Object> params = setupParams();
		params.put("id", commitmentId);
	    return (Commitment)getSqlMapClientTemplate().queryForObject("SELECT_COMMITMENT_BY_ID", params);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Commitment> readCommitmentsByConstituentIdType(Long constituentId, CommitmentType commitmentType) {
        if (logger.isDebugEnabled()) {
            logger.debug("readCommitmentsByConstituentIdType: constituentId = " + constituentId + " commitmentType = " + commitmentType);
        }
        Map<String, Object> params = setupParams();
		params.put("constituentId", constituentId);
		params.put("commitmentType", commitmentType);
		return getSqlMapClientTemplate().queryForList("SELECT_COMMITMENTS_BY_CONSTITUENT_ID_AND_TYPE", params);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Commitment> readCommitments(String siteName, CommitmentType commitmentType, Map<String, Object> params) {
      return null;  // TODO
    }
//        boolean whereUsed = true;
//        StringBuilder queryString = new StringBuilder("SELECT commitment FROM com.mpower.domain.Commitment commitment WHERE commitment.person.site.name = :siteName AND commitment.commitmentType = :commitmentType");
//        Map<String, Object> addressParams = new HashMap<String, Object>();
//        Map<String, String> customParams = new HashMap<String, String>();
//        LinkedHashMap<String, Object> parameterMap = new LinkedHashMap<String, Object>();
//        if (params != null) {
//            String key;
//            Object value;
//            for (Map.Entry<String, Object> pair : params.entrySet()) {
//                key = pair.getKey();
//                value = pair.getValue();
//                boolean isString = true;
//                if (value instanceof String) {
//                    if (GenericValidator.isBlankOrNull((String) value)) {
//                        continue;
//                    }
//                } else {
//                    if (value == null) {
//                        continue;
//                    }
//                    isString = false;
//                }
//                if (key.startsWith("person.addressMap[")) {
//                    addressParams.put(key.substring(key.lastIndexOf('.') + 1), value);
//                } else if (key.startsWith("customFieldMap[")) {
//                    customParams.put(key.substring(key.indexOf('[') + 1, key.indexOf(']')), (String) value);
//                } else {
//                    whereUsed = EntityUtility.addWhereOrAnd(whereUsed, queryString);
//                    queryString.append(" commitment.");
//                    queryString.append(key);
//                    String paramName = key.replace(".", "_");
//                    if (isString) {
//                        queryString.append(" LIKE :");
//                        queryString.append(paramName);
//                        parameterMap.put(paramName, "%" + value + "%");
//                    } else {
//                        queryString.append(" = :");
//                        queryString.append(paramName);
//                        parameterMap.put(paramName, value);
//                    }
//                }
//            }
//        }
//        queryString.append(getAddressString(addressParams, parameterMap));
//        queryString.append(QueryUtil.getCustomString(customParams, parameterMap));
//        
//        for (Map.Entry<String, Object> entry : parameterMap.entrySet()) {
//            query.setParameter(entry.getKey(), entry.getValue());
//        }
//
//        
//        Map<String, Object> ibatisParams = setupParams();
//        ibatisParams.put("sql", queryString);
//        List<Commitment> commitments = getSqlMapClientTemplate().queryForList("SELECT_COMMITMENT_BY_SQL", ibatisParams);
//
//        return commitments;
//    }

    private StringBuilder getAddressString(Map<String, Object> addressParams, LinkedHashMap<String, Object> parameterMap) {
        StringBuilder addressString = new StringBuilder();
        if (addressParams != null && !addressParams.isEmpty()) {
            addressString.append(" AND EXISTS ( SELECT address FROM com.mpower.domain.Address address WHERE address.person.id = commitment.person.id ");
            for (Map.Entry<String, Object> pair : addressParams.entrySet()) {
                String key = pair.getKey();
                Object value = pair.getValue();
                addressString.append("AND address.");
                addressString.append(key);
                addressString.append(" LIKE :");
                String paramName = key.replace(".", "_");
                addressString.append(paramName);
                if (value instanceof String) {
                    parameterMap.put(paramName, "%" + value + "%");
                } else {
                    parameterMap.put(paramName, value);
                }
            }
            addressString.append(")");
        }
        return addressString;
    }
}

package com.mpower.dao.ibatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.mpower.dao.interfaces.CommitmentDao;
import com.mpower.dao.util.QueryUtil;
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
		Commitment aCommitment = (Commitment) insertOrUpdate(commitment,
				"COMMITMENT");
		if (commitment.getDistributionLines() != null) {
			for (DistributionLine line : commitment.getDistributionLines()) {
				if (line.getCommitmentId() == null
						|| line.getCommitmentId() <= 0) {
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
		return (Commitment) getSqlMapClientTemplate().queryForObject("SELECT_COMMITMENT_BY_ID", params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Commitment> readCommitmentsByConstituentIdType(Long constituentId, CommitmentType commitmentType) {
		if (logger.isDebugEnabled()) {
			logger.debug("readCommitmentsByConstituentIdType: constituentId = "	+ constituentId + " commitmentType = " + commitmentType);
		}
		Map<String, Object> params = setupParams();
		params.put("constituentId", constituentId);
		params.put("commitmentType", commitmentType);
		return getSqlMapClientTemplate().queryForList("SELECT_COMMITMENTS_BY_CONSTITUENT_ID_AND_TYPE", params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Commitment> searchCommitments(CommitmentType commitmentType,
			Map<String, Object> searchparams) {
		Map<String, Object> params = setupParams();
		QueryUtil.translateSearchParamsToIBatisParams(searchparams, params,
				fieldMap);

		List<Commitment> commitments = getSqlMapClientTemplate().queryForList(
				"SELECT_COMMITMENT_BY_SEARCH_TERMS", params);
		return commitments;
	}

	// These are the fields we support for searching.
	private Map<String, String> fieldMap = new HashMap<String, String>();
	{

		// Constituent
		fieldMap.put("person.accountNumber", "CONSTITUENT_ID");
		fieldMap.put("person.firstName", "FIRST_NAME");
		fieldMap.put("person.lastName", "LAST_NAME");
		fieldMap.put("person.organizationName", "ORGANIZATION_NAME");

		// Address
		fieldMap.put("postalCode", "POSTAL_CODE");

		// Commitment
		fieldMap.put("referenceNumber", "COMMITMENT_ID");
		fieldMap.put("amountPerGift", "AMOUNT_PER_GIFT");
		fieldMap.put("amountTotal", "AMOUNT_TOTAL");
	}
}

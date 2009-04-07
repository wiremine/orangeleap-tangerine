package com.orangeleap.tangerine.dao;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.orangeleap.tangerine.domain.Person;
import com.orangeleap.tangerine.domain.paymentInfo.Gift;
import com.orangeleap.tangerine.web.common.PaginatedResult;
import com.orangeleap.tangerine.web.common.SortInfo;

public interface GiftDao {

    public Gift maintainGift(Gift gift);

    public Gift readGiftById(Long giftId);

    public List<Gift> readMonetaryGiftsByConstituentId(Long constituentId);

    public List<Gift> searchGifts(Map<String, Object> params);

    public List<Gift> readGiftsByRecurringGiftId(Long recurringGiftId);

    public BigDecimal readGiftsReceivedSumByRecurringGiftId(Long recurringGiftId);
    
    public List<Gift> readGiftsByPledgeId(Long pledgeId);
    
    public BigDecimal readGiftsReceivedSumByPledgeId(Long pledgeId);

	public List<Gift> readAllGiftsBySite();
	
	public List<Gift> readAllGiftsByDateRange(Date fromDate, Date toDate);

	public double analyzeMajorDonor(Long constituentId, Date beginDate, Date currentDate);

	public List<Person> analyzeLapsedDonor(Date beginDate, Date currentDate);

	public PaginatedResult readPaginatedMonetaryGiftsByConstituentId(Long constituentId, SortInfo sortinfo);

	
}

/*
 * Copyright (c) 2009. Orange Leap Inc. Active Constituent
 * Relationship Management Platform.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package com.orangeleap.tangerine.json.controller;

import static com.orangeleap.tangerine.util.StringConstants.ID;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.orangeleap.tangerine.domain.customization.CustomField;
import com.orangeleap.tangerine.domain.paymentInfo.DistributionLine;
import com.orangeleap.tangerine.domain.paymentInfo.Gift;
import com.orangeleap.tangerine.domain.paymentInfo.GiftInKind;
import com.orangeleap.tangerine.domain.paymentInfo.Pledge;
import com.orangeleap.tangerine.domain.paymentInfo.RecurringGift;
import com.orangeleap.tangerine.domain.rollup.RollupAttribute;
import com.orangeleap.tangerine.domain.rollup.RollupSeries;
import com.orangeleap.tangerine.domain.rollup.RollupValue;
import com.orangeleap.tangerine.service.ConstituentService;
import com.orangeleap.tangerine.service.GiftService;
import com.orangeleap.tangerine.service.rollup.RollupHelperService;
import com.orangeleap.tangerine.service.rollup.RollupService;
import com.orangeleap.tangerine.type.GiftType;
import com.orangeleap.tangerine.util.OLLogger;
import com.orangeleap.tangerine.util.StringConstants;

@Controller
@RequestMapping("/giftSummary.json")
public class GiftSummaryController {

    protected final Log logger = OLLogger.getLog(getClass());
    
    @Resource(name = "constituentService")
    private ConstituentService constituentService;

    @Resource(name = "rollupService")
    private RollupService rollupService;

    @Resource(name = "giftService")
    private GiftService giftService;

    
    private final static String CLASS = "class";
    private final static String MAX_LEN = "maxLen";
    
    private final static String ATTRIBUTE = "attribute";
    private final static String SERIES = "series";
    private final static String START_DATE = "startDate";
    private final static String END_DATE = "endDate";
    private final static String CURRENCY_CODE = "currencyCode";
    private final static String COUNT = "count";
    private final static String SUM = "sum";
    private final static String MIN = "min";
    private final static String MAX = "max";
    private final static String AVG = "avg";
    
    private final static String ON_BEHALF_OF = "onBehalfOf";

    @Resource(name = "rollupHelperService")
    private RollupHelperService rollupHelperService;


    @RequestMapping(method = RequestMethod.POST)
    @SuppressWarnings("unchecked")
    public ModelMap getGiftSummary(HttpServletRequest request) throws Exception {
    	
        ModelMap modelMap = new ModelMap();
        
        Long constituentId = new Long(request.getParameter(StringConstants.CONSTITUENT_ID));
        if (null == constituentService.readConstituentById(constituentId)) return null; // checks constituent id is in site.
        String attributeList = StringUtils.trimToEmpty(request.getParameter("attributeList"));
        
        refreshData(constituentId);

        List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();
        addViewData(constituentId, attributeList, returnList);
        modelMap.put(StringConstants.ROWS, returnList);
        modelMap.put(StringConstants.TOTAL_ROWS, returnList.size());
        return modelMap;
        
    }
    
    private void refreshData(Long constituentId) {
    	rollupHelperService.refreshByConstituent(constituentId);
    }
    
    // blank attributeList means retrieve all available
    private boolean requestedAttribute(String attribute, String attributeList) {
    	return attributeList.length() == 0 || attributeList.contains("|"+attribute+"|");
    }

    private static String FIRST_GIFT =  "First Gift";
    private static String LAST_GIFT =  "Last Gift";
    private static String LARGEST_GIFT =  "Largest Gift";
    private static String FIRST_GIFT_IN_KIND =  "First Gift In Kind";
    private static String LAST_GIFT_IN_KIND =  "Last Gift In Kind";
    private static String LARGEST_GIFT_IN_KIND =  "Largest Gift In Kind";
    private static String FIRST_SOFT_GIFT =  "First Soft Gift";
    private static String LAST_SOFT_GIFT =  "Last Soft Gift";
    private static String LARGEST_SOFT_GIFT =  "Largest Soft Gift";
    private static String FIRST_PLEDGE =  "First Pledge";
    private static String LAST_PLEDGE =  "Last Pledge";
    private static String LARGEST_PLEDGE =  "Largest Pledge";
    private static String FIRST_RECURRING_GIFT =  "First Recurring Gift";
    private static String LAST_RECURRING_GIFT =  "Last Recurring Gift";
    private static String LARGEST_RECURRING_GIFT =  "Largest Recurring Gift";
    
    private int addFirstLastAndLargest(Long constituentId, String attributeList, List<Map<String, Object>> returnList, int index) {
    	
    	// Gift
    	if (requestedAttribute(FIRST_GIFT, attributeList)) {
    		Gift firstGift = rollupService.readGiftViewFirstOrLastByConstituentId(constituentId, GiftType.MONETARY_GIFT, "Paid", true);
    		if (firstGift != null) putGift(FIRST_GIFT, firstGift, returnList, index++);
    	}
    	
    	if (requestedAttribute(LAST_GIFT, attributeList)) {
	    	Gift lastGift = rollupService.readGiftViewFirstOrLastByConstituentId(constituentId, GiftType.MONETARY_GIFT, "Paid", false);
	    	if (lastGift != null) putGift(LAST_GIFT, lastGift, returnList, index++);
    	}
    	
    	if (requestedAttribute(LARGEST_GIFT, attributeList)) {
	    	Gift largestGift = rollupService.readGiftViewLargestByConstituentId(constituentId, GiftType.MONETARY_GIFT, "Paid");
	    	if (largestGift != null) putGift(LARGEST_GIFT, largestGift, returnList, index++);
    	}
    	
    	// GIK
    	if (requestedAttribute(FIRST_GIFT_IN_KIND, attributeList)) {
    		GiftInKind firstGiftInKind = rollupService.readGiftInKindViewFirstOrLastByConstituentId(constituentId, true);
    		if (firstGiftInKind != null) putGiftInKind(FIRST_GIFT_IN_KIND, firstGiftInKind, returnList, index++);
    	}
    	
    	if (requestedAttribute(LAST_GIFT_IN_KIND, attributeList)) {
	    	GiftInKind lastGiftInKind = rollupService.readGiftInKindViewFirstOrLastByConstituentId(constituentId, false);
	    	if (lastGiftInKind != null) putGiftInKind(LAST_GIFT_IN_KIND, lastGiftInKind, returnList, index++);
    	}
    	
    	if (requestedAttribute(LARGEST_GIFT_IN_KIND, attributeList)) {
	    	GiftInKind largestGiftInKind = rollupService.readGiftInKindViewLargestByConstituentId(constituentId);
	    	if (largestGiftInKind != null) putGiftInKind(LARGEST_GIFT_IN_KIND, largestGiftInKind, returnList, index++);
    	}
    	
    	// Soft Gift
    	if (requestedAttribute(FIRST_SOFT_GIFT, attributeList)) {
    		Gift firstSoftGift = rollupService.readIndirectGiftViewFirstOrLastByConstituentId(constituentId, GiftType.MONETARY_GIFT, "Paid", true, ON_BEHALF_OF);
    		if (firstSoftGift != null) putSoftGift(FIRST_SOFT_GIFT, firstSoftGift, constituentId, ON_BEHALF_OF, returnList, index++);
    	}
    	
    	if (requestedAttribute(LAST_SOFT_GIFT, attributeList)) {
	    	Gift lastSoftGift = rollupService.readIndirectGiftViewFirstOrLastByConstituentId(constituentId, GiftType.MONETARY_GIFT, "Paid", false, ON_BEHALF_OF);
	    	if (lastSoftGift != null) putSoftGift(LAST_SOFT_GIFT, lastSoftGift, constituentId, ON_BEHALF_OF, returnList, index++);
    	}
    	
    	if (requestedAttribute(LARGEST_SOFT_GIFT, attributeList)) {
	    	Gift largestSoftGift = rollupService.readIndirectGiftViewLargestByConstituentId(constituentId, GiftType.MONETARY_GIFT, "Paid", ON_BEHALF_OF);
	    	if (largestSoftGift != null) putSoftGift(LARGEST_SOFT_GIFT, largestSoftGift, constituentId, ON_BEHALF_OF, returnList, index++);
    	}
    	
    	// Pledge
    	if (requestedAttribute(FIRST_PLEDGE, attributeList)) {
    		Pledge firstPledge = rollupService.readPledgeViewFirstOrLastByConstituentId(constituentId, true);
    		if (firstPledge != null) putPledge(FIRST_PLEDGE, firstPledge, returnList, index++);
    	}
    	
    	if (requestedAttribute(LAST_PLEDGE, attributeList)) {
    		Pledge lastPledge = rollupService.readPledgeViewFirstOrLastByConstituentId(constituentId, false);
	    	if (lastPledge != null) putPledge(LAST_PLEDGE, lastPledge, returnList, index++);
    	}
    	
    	if (requestedAttribute(LARGEST_PLEDGE, attributeList)) {
    		Pledge largestPledge = rollupService.readPledgeViewLargestByConstituentId(constituentId);
	    	if (largestPledge != null) putPledge(LARGEST_PLEDGE, largestPledge, returnList, index++);
    	}
    	
    	// Recurring Gift
    	if (requestedAttribute(FIRST_RECURRING_GIFT, attributeList)) {
    		RecurringGift firstRecurringGift = rollupService.readRecurringGiftViewFirstOrLastByConstituentId(constituentId, true);
    		if (firstRecurringGift != null) putRecurringGift(FIRST_RECURRING_GIFT, firstRecurringGift, returnList, index++);
    	}
    	
    	if (requestedAttribute(LAST_RECURRING_GIFT, attributeList)) {
    		RecurringGift lastRecurringGift = rollupService.readRecurringGiftViewFirstOrLastByConstituentId(constituentId, false);
	    	if (lastRecurringGift != null) putRecurringGift(LAST_RECURRING_GIFT, lastRecurringGift, returnList, index++);
    	}
    	
    	if (requestedAttribute(LARGEST_RECURRING_GIFT, attributeList)) {
    		RecurringGift largestRecurringGift = rollupService.readRecurringGiftViewLargestByConstituentId(constituentId);
	    	if (largestRecurringGift != null) putRecurringGift(LARGEST_RECURRING_GIFT, largestRecurringGift, returnList, index++);
    	}

    	return index;
    }
    
    private void addViewData(Long constituentId, String attributeList, List<Map<String, Object>> returnList) {
    
    	int index = 0;
    	
    	index = addFirstLastAndLargest(constituentId, attributeList, returnList, index);

    	// Add stats
    	Map<RollupAttribute, Map<RollupSeries, List<RollupValue>>> data = rollupService.readGiftViewRollupValuesByConstituentId(constituentId);
    	for (Map.Entry<RollupAttribute, Map<RollupSeries, List<RollupValue>>> me : data.entrySet()) {
    		RollupAttribute ra = me.getKey();
    		if (!requestedAttribute(ra.getAttributeNameId(), attributeList)) continue;
    		Map<RollupSeries, List<RollupValue>> seriesmap = me.getValue();
        	for (Map.Entry<RollupSeries, List<RollupValue>> me2 : seriesmap.entrySet()) {
        		RollupSeries rs = me2.getKey();
        		List<RollupValue> rolluplist = me2.getValue();
            	for (RollupValue rv : rolluplist) {

                    Map<String, Object> map = new HashMap<String, Object>();
                    map.put(ID, "" + index++);
                    map.put(CLASS, "string");
                    map.put(MAX_LEN, "255");

                    map.put(ATTRIBUTE, ra.getAttributeDesc());
                    map.put(SERIES, rs.getSeriesDesc());
                    map.put(START_DATE, rv.getStartDate().equals(CustomField.PAST_DATE)?null:rv.getStartDate());
                    map.put(END_DATE, rv.getEndDate().equals(CustomField.FUTURE_DATE)?null:rv.getEndDate());
                    map.put(CURRENCY_CODE, rv.getCurrencyCode());
                    map.put(COUNT, rv.getCountValue());
                    map.put(SUM, rv.getSumValue());
                    map.put(MIN, rv.getMinValue());
                    map.put(MAX, rv.getMaxValue());
                    BigDecimal avg = rv.getSumValue().movePointRight(2).divideToIntegralValue(rv.getCountValue()).movePointLeft(2);
                    map.put(AVG, avg);
                	returnList.add(map);
            		
            	}
        	}    		
    	}

    }
    
    private void putGift(String title, Gift gift, List<Map<String, Object>> returnList, int index) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(ID, "" + index);
        map.put(CLASS, "string");
        map.put(MAX_LEN, "255");

        map.put(ATTRIBUTE, title);
        map.put(SERIES, "Lifetime");
        map.put(START_DATE, gift.getDonationDate());
        map.put(END_DATE, gift.getDonationDate());
        map.put(CURRENCY_CODE, gift.getCurrencyCode());
        map.put(COUNT, 1);
        map.put(SUM, gift.getAdjustedAmount());
        map.put(MIN, gift.getAdjustedAmount());
        map.put(MAX, gift.getAdjustedAmount());
        map.put(AVG, gift.getAdjustedAmount());
    	
    	returnList.add(map);
    }
    
    private void putSoftGift(String title, Gift gift, Long constituentId, String refcf, List<Map<String, Object>> returnList, int index) {
    	
    	gift = giftService.readGiftById(gift.getId());
    	BigDecimal amt = getSoftAmount(gift, constituentId, refcf);
    	
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(ID, "" + index);
        map.put(CLASS, "string");
        map.put(MAX_LEN, "255");

        map.put(ATTRIBUTE, title);
        map.put(SERIES, "Lifetime");
        map.put(START_DATE, gift.getDonationDate());
        map.put(END_DATE, gift.getDonationDate());
        map.put(CURRENCY_CODE, gift.getCurrencyCode());
        map.put(COUNT, 1);
        map.put(SUM, amt);
        map.put(MIN, amt);
        map.put(MAX, amt);
        map.put(AVG, amt);
    	
    	returnList.add(map);
    }
    
    private BigDecimal getSoftAmount(Gift gift, Long constituentId, String refcf) {
    	BigDecimal result = new BigDecimal(0);
    	for (DistributionLine dl : gift.getDistributionLines()) {
    		String cfvalue = dl.getCustomFieldValue(refcf);
    		if (cfvalue != null && cfvalue.equals(constituentId.toString())) {
    			result = result.add(dl.getAmount());
    		}
    	}
    	return result;
    }
    
    private void putGiftInKind(String title, GiftInKind giftInKind, List<Map<String, Object>> returnList, int index) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(ID, "" + index);
        map.put(CLASS, "string");
        map.put(MAX_LEN, "255");

        map.put(ATTRIBUTE, title);
        map.put(SERIES, "Lifetime");
        map.put(START_DATE, giftInKind.getDonationDate());
        map.put(END_DATE, giftInKind.getDonationDate());
        map.put(CURRENCY_CODE, giftInKind.getCurrencyCode());
        map.put(COUNT, 1);
        map.put(SUM, giftInKind.getFairMarketValue());
        map.put(MIN, giftInKind.getFairMarketValue());
        map.put(MAX, giftInKind.getFairMarketValue());
        map.put(AVG, giftInKind.getFairMarketValue());
    	
    	returnList.add(map);
    }
    
    private void putPledge(String title, Pledge pledge, List<Map<String, Object>> returnList, int index) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(ID, "" + index);
        map.put(CLASS, "string");
        map.put(MAX_LEN, "255");

        map.put(ATTRIBUTE, title);
        map.put(SERIES, "Lifetime");
        map.put(START_DATE, pledge.getPledgeDate());
        map.put(END_DATE, pledge.getPledgeDate());
        map.put(CURRENCY_CODE, pledge.getCurrencyCode());
        map.put(COUNT, 1);
        BigDecimal amt = greatest(pledge.getAmountTotal(), pledge.getAmountPaid());
        map.put(SUM, amt);
        map.put(MIN, amt);
        map.put(MAX, amt);
        map.put(AVG, amt);
    	
    	returnList.add(map);
    }
    
    private void putRecurringGift(String title, RecurringGift recurringGift, List<Map<String, Object>> returnList, int index) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(ID, "" + index);
        map.put(CLASS, "string");
        map.put(MAX_LEN, "255");

        map.put(ATTRIBUTE, title);
        map.put(SERIES, "Lifetime");
        map.put(START_DATE, recurringGift.getStartDate());
        map.put(END_DATE, recurringGift.getEndDate());
        map.put(CURRENCY_CODE, recurringGift.getCurrencyCode());
        map.put(COUNT, 1);
        BigDecimal amt = greatest(recurringGift.getAmountTotal(), recurringGift.getAmountPaid());
        map.put(SUM, amt);
        map.put(MIN, amt);
        map.put(MAX, amt);
        map.put(AVG, amt);
    	
    	returnList.add(map);
    }
    
    private BigDecimal greatest(BigDecimal b1, BigDecimal b2) {
    	if (b1 == null && b2 == null) return new BigDecimal(0);
    	if (b1 == null) return b2;
    	if (b2 == null) return b1;
    	return (b1.compareTo(b2) > 0) ? b1 : b2;
    }
    
}

package com.orangeleap.tangerine.json.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.orangeleap.tangerine.domain.paymentInfo.GiftInKind;
import com.orangeleap.tangerine.service.GiftInKindService;
import com.orangeleap.tangerine.web.common.PaginatedResult;
import com.orangeleap.tangerine.web.common.SortInfo;

/**
 * This controller handles JSON requests for populating the grid of gifts.
 * @version 1.0
 */
@Controller
public class GiftInKindListController {

	/** Logger for this class and subclasses */
	protected final Log logger = LogFactory.getLog(getClass());

	private final static Map<String, Object> NAME_MAP = new HashMap<String, Object>();

	static {
		NAME_MAP.put("id", "gik.GIFT_ID");
		NAME_MAP.put("personId", "gik.CONSTITUENT_ID");
		NAME_MAP.put("fairmarketvalue", "gik.FAIR_MARKET_VALUE");
		NAME_MAP.put("currencycode", "gik.CURRENCY_CODE");
		NAME_MAP.put("donationdate", "gik.DONATION_DATE");
		NAME_MAP.put("motivationcode", "gik.MOTIVATION_CODE");
		NAME_MAP.put("othermotivation", "gik.OTHER_MOTIVATION");
	}

	private Map<String, Object> giftInKindToMap(GiftInKind gik) {

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", gik.getId());
		map.put("personId", gik.getPerson().getId());
		map.put("fairmarketvalue", gik.getFairMarketValue());
		map.put("currencycode", gik.getCurrencyCode());
		map.put("donationdate", formatter.format(gik.getDonationDate()));
		map.put("motivationcode", gik.getMotivationCode());
		map.put("othermotivation", gik.getOther_motivationCode());

		return map;

	}

	@Resource(name = "giftInKindService")
	private GiftInKindService giftInKindService;

	@SuppressWarnings("unchecked")
	@RequestMapping("/giftInKindList.json")
	public ModelMap getGiftList(HttpServletRequest request, SortInfo sortInfo) {

		List<Map> rows = new ArrayList<Map>();

		// if we're not getting back a valid column name, possible SQL injection,
		// so send back an empty list.
		if (!sortInfo.validateSortField(NAME_MAP.keySet())) {
			logger.warn("getGiftInKindList called with invalid sort column: [" + sortInfo.getSort() + "]");
			return new ModelMap("rows", rows);
		}

		// set the sort to the valid column name, based on the map
		sortInfo.setSort((String) NAME_MAP.get(sortInfo.getSort()));

		String personId = request.getParameter("personId");
		PaginatedResult result = giftInKindService.readPaginatedGiftsInKindByConstituentId(Long.valueOf(personId), sortInfo);

		List<GiftInKind> list = result.getRows();

		for (GiftInKind g : list) {
			rows.add(giftInKindToMap(g));
		}

		ModelMap map = new ModelMap("rows", rows);
		map.put("totalRows", result.getRowCount());
		return map;
	}

}

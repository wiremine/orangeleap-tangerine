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

package com.orangeleap.tangerine.controller.gift;

import com.orangeleap.tangerine.controller.TangerineForm;
import com.orangeleap.tangerine.domain.AbstractEntity;
import com.orangeleap.tangerine.domain.customization.Picklist;
import com.orangeleap.tangerine.domain.paymentInfo.Commitment;
import com.orangeleap.tangerine.domain.paymentInfo.Gift;
import com.orangeleap.tangerine.domain.paymentInfo.Pledge;
import com.orangeleap.tangerine.domain.paymentInfo.RecurringGift;
import com.orangeleap.tangerine.service.GiftService;
import com.orangeleap.tangerine.service.PledgeService;
import com.orangeleap.tangerine.service.RecurringGiftService;
import com.orangeleap.tangerine.service.PicklistItemService;
import com.orangeleap.tangerine.type.PaymentType;
import com.orangeleap.tangerine.util.OLLogger;
import com.orangeleap.tangerine.util.StringConstants;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class NewGiftFormController extends AbstractPaymentFormController {//AbstractGiftController {

    /** Logger for this class and subclasses */
    protected final Log logger = OLLogger.getLog(getClass());

    @Resource(name = "pledgeService")
    protected PledgeService pledgeService;

    @Resource(name = "recurringGiftService")
    protected RecurringGiftService recurringGiftService;

	@Resource(name = "picklistItemService")
	protected PicklistItemService picklistItemService;

	// TODO: remove below
	@Resource(name="giftService")
	protected GiftService giftService;

	protected String giftUrl;
	protected String giftViewUrl;

	public void setGiftUrl(String giftUrl) {
		this.giftUrl = giftUrl;
	}

	public void setGiftViewUrl(String giftViewUrl) {
		this.giftViewUrl = giftViewUrl;
	}

	protected String appendGiftParameters(HttpServletRequest request, String viewName, Gift gift) {
		StringBuilder sb = new StringBuilder(viewName).append("?");
		if (gift != null && gift.getId() != null && gift.getId() > 0) {
			sb.append(StringConstants.GIFT_ID).append("=").append(gift.getId()).append("&");
		}
		return sb.append(StringConstants.CONSTITUENT_ID).append("=").append(super.getConstituentId(request)).toString();
	}
	// TODO: remove above

    @Override
    protected AbstractEntity findEntity(HttpServletRequest request) {
        Gift gift = giftService.readGiftByIdCreateIfNull(getConstituent(request), request.getParameter(StringConstants.GIFT_ID));

	    if (!StringUtils.hasText(gift.getCurrencyCode())) {
		    Picklist ccPicklist = picklistItemService.getPicklist("currencyCode");
		    if (ccPicklist != null && !ccPicklist.getActivePicklistItems().isEmpty()) {
			    gift.setCurrencyCode(ccPicklist.getActivePicklistItems().get(0).getItemName());
		    }
	    }

	    return gift;
    }

    private boolean isEnteredGift(Gift gift) {
    	return gift != null && gift.getId() != null && gift.getId() > 0;
    }

    private boolean canReprocessGift(Gift gift) {
    	return isEnteredGift(gift) && (Gift.STATUS_NOT_PAID.equals(gift.getGiftStatus()) || Commitment.STATUS_PENDING.equals(gift.getGiftStatus())) &&
			(Gift.PAY_STATUS_DECLINED.equals(gift.getPaymentStatus()) || Gift.PAY_STATUS_ERROR.equals(gift.getPaymentStatus()));
    }

    private boolean showGiftView(Gift gift) {
    	return isEnteredGift(gift) && (PaymentType.CASH.getPaymentName().equals(gift.getPaymentType()) || PaymentType.CHECK.getPaymentName().equals(gift.getPaymentType()) ||
    			((PaymentType.ACH.getPaymentName().equals(gift.getPaymentType()) || PaymentType.CREDIT_CARD.getPaymentName().equals(gift.getPaymentType())) &&
    					Gift.STATUS_PAID.equals(gift.getGiftStatus()) && Gift.PAY_STATUS_APPROVED.equals(gift.getPaymentStatus())));
    }

	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		ModelAndView mav = super.showForm(request, response, errors);
        TangerineForm form = (TangerineForm) formBackingObject(request);
		Gift gift = (Gift) form.getDomainObject();

//        if (showGiftView(gift)) {
//        	mav = new ModelAndView(appendGiftParameters(request, giftViewUrl, gift));
//        }
		return mav;
	}

    @SuppressWarnings("unchecked")
    @Override
    protected Map referenceData(HttpServletRequest request, Object command, Errors errors) throws Exception {
        Map refMap = super.referenceData(request, command, errors);

        String selectedPledgeId = request.getParameter("selectedPledgeId");
        String selectedRecurringGiftId = request.getParameter("selectedRecurringGiftId");
        if (NumberUtils.isDigits(selectedPledgeId)) {
            Pledge pledge = pledgeService.readPledgeById(Long.parseLong(selectedPledgeId));
            refMap.put("associatedPledge", pledge);
        }
        else if (NumberUtils.isDigits(selectedRecurringGiftId)) {
            RecurringGift recurringGift = recurringGiftService.readRecurringGiftById(Long.parseLong(selectedRecurringGiftId));
            refMap.put("associatedRecurringGift", recurringGift);
        }

        TangerineForm form = (TangerineForm) command;
	    Gift gift = (Gift) form.getDomainObject();
        if (canReprocessGift(gift)) {
        	refMap.put("allowReprocess", Boolean.TRUE);
        }
        return refMap;
    }

	@Override
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        super.initBinder(request, binder);
        binder.registerCustomEditor(List.class, "associatedPledgeIds", new AssociationEditor());
        binder.registerCustomEditor(List.class, "associatedRecurringGiftIds", new AssociationEditor());
    }

	@Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException formErrors) throws Exception {
		TangerineForm form = (TangerineForm) command;
		Gift gift = (Gift) form.getDomainObject();
        checkAssociations(gift);

        boolean saved = true;
        try {
        	if ("true".equals(request.getParameter("doReprocess")) && canReprocessGift(gift)) {
        		gift = giftService.reprocessGift(gift);
        	}
        	else {
        		gift = giftService.maintainGift(gift);
        	}
        }
        catch (BindException domainErrors) {
            saved = false;
	        bindDomainErrorsToForm(formErrors, domainErrors);
        }

        ModelAndView mav;
        if (saved) {
            mav = new ModelAndView(super.appendSaved(appendGiftParameters(request, getSuccessView(), gift)));
        }
        else {
			checkAssociations(gift);
			mav = showForm(request, formErrors, getFormView());
        }
        return mav;
    }

    protected void checkAssociations(Gift gift) {
        giftService.checkAssociatedPledgeIds(gift);
        giftService.checkAssociatedRecurringGiftIds(gift);
    }
}
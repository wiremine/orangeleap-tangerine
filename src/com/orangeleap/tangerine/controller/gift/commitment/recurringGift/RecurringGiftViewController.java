package com.orangeleap.tangerine.controller.gift.commitment.recurringGift;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import com.orangeleap.tangerine.util.OLLogger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;

import com.orangeleap.tangerine.domain.paymentInfo.RecurringGift;
import com.orangeleap.tangerine.util.StringConstants;

public class RecurringGiftViewController extends RecurringGiftFormController {

    /** Logger for this class and subclasses */
    protected final Log logger = OLLogger.getLog(getClass());
    
    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        RecurringGift recurringGift = (RecurringGift)command;
        RecurringGift current = recurringGiftService.editRecurringGift(recurringGift);
        return new ModelAndView(getSuccessView() + "?" + getParamId() + "=" + current.getId() + "&" + StringConstants.CONSTITUENT_ID + "=" + super.getConstituentId(request));
    }
}

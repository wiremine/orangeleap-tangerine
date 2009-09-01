package com.orangeleap.tangerine.controller.payment;

import com.orangeleap.tangerine.controller.TangerineGridController;
import com.orangeleap.tangerine.domain.communication.Address;
import com.orangeleap.tangerine.domain.PaymentSource;
import com.orangeleap.tangerine.util.StringConstants;

import javax.servlet.http.HttpServletRequest;

public class PaymentSourceGridController extends TangerineGridController {

    @Override
    protected Object getDummyEntity(HttpServletRequest request) {
        return new PaymentSource(getConstituent(request));
    }
}
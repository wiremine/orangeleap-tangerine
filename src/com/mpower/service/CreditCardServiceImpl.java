package com.mpower.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.mpower.domain.Gift;

@Service("creditCardService")
public class CreditCardServiceImpl implements CreditCardService {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

	
    @Override
    public Gift processCreditCard(Gift gift) {
        // TODO: implement call to processing system and get a confirmation
        // local validation should already be done to minimize charges
        String confirmation = null;
        gift.setAuthCode(confirmation);
        return gift;
    }
}

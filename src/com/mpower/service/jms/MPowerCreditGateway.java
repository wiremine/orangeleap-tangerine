package com.mpower.service.jms;

import com.mpower.domain.Gift;

public interface MPowerCreditGateway {

	public void sendGiftTransaction(Gift gift);
}

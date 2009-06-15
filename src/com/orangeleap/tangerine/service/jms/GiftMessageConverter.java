package com.orangeleap.tangerine.service.jms;

import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.Session;

import org.springframework.jms.support.converter.MessageConversionException;
import org.springframework.jms.support.converter.MessageConverter;

import com.orangeleap.tangerine.domain.paymentInfo.Gift;

public class GiftMessageConverter implements MessageConverter {

	@Override
	public Object fromMessage(Message message) throws JMSException,
			MessageConversionException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Message toMessage(Object object, Session session)
			throws JMSException, MessageConversionException {

		if ( !(object instanceof Gift) ) {
			throw new MessageConversionException("Object isn't a Gift!");
		}
		
		Gift gift = (Gift) object;
		MapMessage message = session.createMapMessage();
		message.setString("lastName", gift.getConstituent().getLastName());
        message.setString("firstName", gift.getConstituent().getFirstName());
        message.setString("gift amount", gift.getAmount().toString());
        message.setString("merchant acct", gift.getSite().getMerchantNumber());
		
		return message;
	}

}

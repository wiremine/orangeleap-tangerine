package com.orangeleap.tangerine.security;

import java.io.IOException;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.UnsupportedCallbackException;

import org.springframework.security.context.SecurityContextHolder;
import org.springframework.security.providers.UsernamePasswordAuthenticationToken;

import com.orangeleap.tangerine.security.common.OrangeLeapUsernamePasswordLocal;

public class TangerineWsCallbackHandler extends org.springframework.ws.soap.security.callback.AbstractCallbackHandler  {
	

	private TangerineSessionInformationFilter tangerineSessionInformationFilter;
	
	public void setTangerineSessionInformationFilter(TangerineSessionInformationFilter tangerineSessionInformationFilter) {
		this.tangerineSessionInformationFilter = tangerineSessionInformationFilter;
	}
	
	@Override
	protected void handleInternal(Callback cb) throws IOException, UnsupportedCallbackException {
		
		Object obj = OrangeLeapUsernamePasswordLocal.getOrangeLeapAuthInfo().get(OrangeLeapUsernamePasswordLocal.AUTH_TOKEN);
		if (obj instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken)obj;
			SecurityContextHolder.getContext().setAuthentication(token);
			token.setDetails(new TangerineAuthenticationDetails());
			tangerineSessionInformationFilter.loadTangerineDetails(token);
		}
		
	}

	
}

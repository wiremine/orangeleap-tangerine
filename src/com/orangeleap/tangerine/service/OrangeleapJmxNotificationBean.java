package com.orangeleap.tangerine.service;

// internal interface (non-JMX)
public interface OrangeleapJmxNotificationBean extends OrangeleapJmxNotification {
	
	public final static String TOTAL = "total";
	public final static String LOGINS = "logins";
	public final static String AUTHORIZE = "Authorize";
	public final static String CAPTURE = "Capture";
	public final static String AUTHORIZE_AND_CAPTURE = "AuthorizeAndCapture";

	
	public void publishNotification(String type, String message);

	public void incrementStatCount(String sitename, String statname);

 
}
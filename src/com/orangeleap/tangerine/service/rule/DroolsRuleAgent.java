package com.orangeleap.tangerine.service.rule;

import java.util.Properties;
import java.util.Map;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import com.orangeleap.tangerine.util.OLLogger;
import org.drools.agent.RuleAgent;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class DroolsRuleAgent implements ApplicationContextAware {
	private static final Log logger = OLLogger.getLog(DroolsRuleAgent.class);

	private ApplicationContext applicationContext;

	private Properties droolsProperties;
	private Map<String,RuleAgent> agentMap;

    private String pollInterval;
    private String cacheDir;
    private String packageDir;

	public DroolsRuleAgent(final String pollInterval, final String cacheDir, final String packageDir) {
	    if (logger.isDebugEnabled()) {
	        logger.debug("DroolsRuleAgent: pollInterval = " + pollInterval + " cacheDir = " + cacheDir + " packageDir = " + packageDir);
	    }
        this.pollInterval = pollInterval;
        this.cacheDir = cacheDir;
        this.packageDir = packageDir;
        this.droolsProperties = null;
        agentMap = new HashMap<String,RuleAgent>();
	}

    public Properties getDroolsProperties(String siteName) {
        String file = packageDir + "/" + siteName + ".pkg";
        droolsProperties = new Properties();
        droolsProperties.put(RuleAgent.POLL_INTERVAL,pollInterval);
        droolsProperties.put(RuleAgent.FILES,file);
        return droolsProperties;
    }


	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.applicationContext = applicationContext;
	}

    public RuleAgent getRuleAgent(String siteName) {
        RuleAgent agent = null;

        agent = agentMap.get(siteName);
        if (agent != null) return agent;

        agent = RuleAgent.newRuleAgent(getDroolsProperties(siteName));
        agentMap.put(siteName,agent);
        
        return agent;
    }


}

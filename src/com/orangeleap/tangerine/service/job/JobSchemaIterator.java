package com.orangeleap.tangerine.service.job;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.orangeleap.tangerine.service.SchemaService;

public class JobSchemaIterator extends QuartzJobBean {

	/** Logger for this class and subclasses */
	protected final Log logger = LogFactory.getLog(getClass());

	public JobSchemaIterator() {}


	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {

		ApplicationContext applicationContext = null;
		SchemaService schemaService = null;
		try {
			applicationContext = getApplicationContext(context);
			schemaService = (SchemaService)applicationContext.getBean("schemaService");
		} catch (Exception e) {
			e.printStackTrace();
			logger.fatal(e);
			return;
		}

		List<String> schemas = schemaService.readSchemas();
		for (String schema : schemas) {
			schemaService.setSchema(schema);  //  sets tangerine user helper with site name for TangerineDatasource to read.
			executeInternalForSchema(context, applicationContext);
		}
		
	}
	
	// Run list of jobs methods in job map.
	private void executeInternalForSchema(JobExecutionContext context, ApplicationContext applicationContext) {
		JobDataMap map = context.getMergedJobDataMap();
		String [] keys = map.getKeys();
		for (String key : keys) {
			if (key.startsWith("job[")) {
				String value = map.getString(key);
				logger.debug("Running " + key + ": " + value);
				try {
					int i = value.indexOf(".");
					String service = value.substring(0,i);
					String method = value.substring(i+1);
					Object o = applicationContext.getBean(service);
					Method m = o.getClass().getMethod(method, new Class[0]);
					m.invoke(o, new Object[0]);
				} catch (Throwable e) {
					if (e instanceof InvocationTargetException) {
						e = ((InvocationTargetException)e).getTargetException();
					}
					e.printStackTrace();
					logger.error(e);
				}
			}
		}
	}
	
	private static final String APPLICATION_CONTEXT_KEY = "applicationContext";

	private ApplicationContext getApplicationContext(JobExecutionContext context ) throws Exception {
		ApplicationContext applicationContext = null;
		applicationContext = (ApplicationContext)context.getScheduler().getContext().get(APPLICATION_CONTEXT_KEY);
		if (applicationContext == null) {
			throw new JobExecutionException("No application context available in scheduler context for key \"" + APPLICATION_CONTEXT_KEY + "\"");        }
		return applicationContext;    
	}

}

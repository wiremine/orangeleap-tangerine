package com.mpower.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.ParameterizableViewController;

import com.mpower.service.InactivateService;
import com.mpower.util.StringConstants;

public class TangerineDeleteController extends ParameterizableViewController {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    private InactivateService service;
    private String idParameterName;

    public void setService(InactivateService service) {
        this.service = service;
    }

    public void setIdParameterName(String idParameterName) {
        this.idParameterName = idParameterName;
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter(idParameterName);

        if (logger.isDebugEnabled()) {
            logger.debug("handleRequestInternal: " + idParameterName + " = " + id);
        }

        String personId = request.getParameter(StringConstants.PERSON_ID);
        service.inactivate(Long.valueOf(id));
        return new ModelAndView(super.getViewName() + "?" + StringConstants.PERSON_ID + "=" + personId);
    }
}

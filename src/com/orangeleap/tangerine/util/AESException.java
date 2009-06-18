package com.orangeleap.tangerine.util;

import org.apache.commons.logging.Log;
import com.orangeleap.tangerine.util.OLLogger;

public class AESException extends RuntimeException {

    /** Logger for this class and subclasses */
    protected final Log logger = OLLogger.getLog(getClass());

	
    /**
     * Serial Version ID
     */
    private static final long serialVersionUID = 1L;

    public AESException(String msg) {
        super(msg);
    }

    public AESException(String msg, Throwable root) {
        super(msg, root);
    }

}

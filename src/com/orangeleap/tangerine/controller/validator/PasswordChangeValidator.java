package com.orangeleap.tangerine.controller.validator;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.orangeleap.tangerine.domain.PasswordChange;
import com.orangeleap.tangerine.util.TangerineUserHelper;

public class PasswordChangeValidator implements Validator {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    private static final int MINIMUM_PASSWORD_LENGTH = 6;
    
    @Resource(name="tangerineUserHelper")
    private TangerineUserHelper tangerineUserHelper;

    @SuppressWarnings("unchecked")
    @Override
    public boolean supports(Class clazz) {
        return PasswordChange.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        PasswordChange pwChange = (PasswordChange) target;
        String newPw = StringUtils.trimToEmpty(pwChange.getNewPassword());
        String newConfirmPw = StringUtils.trimToEmpty(pwChange.getNewPasswordConfirm());
        String oldPw = StringUtils.trimToEmpty(pwChange.getCurrentPassword());

        // spoke with Jenn and we're starting:
        // old password entered must match current password
        // new password and confirm password must match
        // new password must be different than current password
        // minimum 6 characters
        // TODO: force change password every 60 days
        String authenticatedPw = tangerineUserHelper.lookupUserPassword();
        if (!authenticatedPw.equals(oldPw)) {
            errors.rejectValue("currentPassword", "currentPasswordIncorrect", null, "current password is incorrect");
            logger.trace("current password, " + authenticatedPw + ", didn't match " + oldPw);
        } else if (!newPw.equals(newConfirmPw)) {
            errors.rejectValue("newPasswordConfirm", "newPasswordConfirmIncorrect", null, "new passwords must match");
            logger.trace("new password, " + newPw + ", didn't match confirm password " + newConfirmPw);
        } else if (authenticatedPw.equals(newPw)) {
            errors.rejectValue("newPassword", "newPasswordMatchesCurrent", null, "new password must be different then current password");
            logger.trace("new password, " + newPw + ", must be different then current password");
        } else {
            // TODO: validated password requirements here
            if (newPw.trim().length() < MINIMUM_PASSWORD_LENGTH) {
                errors.rejectValue("newPassword", "newPasswordSizeIncorrect", null, "new password must be at least " + MINIMUM_PASSWORD_LENGTH + " characters");
                logger.trace("new password, " + newPw + ", must be at least " + MINIMUM_PASSWORD_LENGTH + " characters");
            }
        }
    }
}


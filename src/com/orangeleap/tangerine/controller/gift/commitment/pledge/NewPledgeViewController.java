/*
 * Copyright (c) 2009. Orange Leap Inc. Active Constituent
 * Relationship Management Platform.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package com.orangeleap.tangerine.controller.gift.commitment.pledge;

import com.orangeleap.tangerine.controller.gift.commitment.NewCommitmentFormController;
import com.orangeleap.tangerine.domain.paymentInfo.Pledge;
import com.orangeleap.tangerine.service.PledgeService;
import com.orangeleap.tangerine.util.OLLogger;
import com.orangeleap.tangerine.util.StringConstants;
import org.apache.commons.logging.Log;
import org.springframework.validation.BindException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

public class NewPledgeViewController extends NewCommitmentFormController<Pledge> {

    /**
     * Logger for this class and subclasses
     */
    protected final Log logger = OLLogger.getLog(getClass());

    @Resource(name = "pledgeService")
    protected PledgeService pledgeService;

	@Override
	protected Pledge readCommitmentCreateIfNull(HttpServletRequest request) {
		return pledgeService.readPledgeById(getIdAsLong(request, StringConstants.PLEDGE_ID));
	}

    @Override
    protected String getParamId() {
        return StringConstants.PLEDGE_ID;
    }

    @Override
    protected Pledge maintainCommitment(Pledge entity) throws BindException {
		entity = pledgeService.editPledge(entity);
	    return entity;
    }

    @Override
    protected String getReturnView(Pledge entity) {
        return getSuccessView();
    }
}
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

package com.orangeleap.tangerine.service.impl;

import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;

import com.orangeleap.tangerine.service.validator.EntityValidator;
import com.orangeleap.tangerine.dao.GiftDao;
import com.orangeleap.tangerine.dao.GiftInKindDao;
import com.orangeleap.tangerine.domain.Constituent;
import com.orangeleap.tangerine.domain.paymentInfo.Gift;
import com.orangeleap.tangerine.domain.paymentInfo.GiftInKind;
import com.orangeleap.tangerine.domain.paymentInfo.GiftInKindDetail;
import com.orangeleap.tangerine.service.GiftInKindService;
import com.orangeleap.tangerine.service.rollup.RollupHelperService;
import com.orangeleap.tangerine.util.OLLogger;
import com.orangeleap.tangerine.web.common.PaginatedResult;
import com.orangeleap.tangerine.web.common.SortInfo;

@Service("giftInKindService")
@Transactional(propagation = Propagation.REQUIRED)
public class GiftInKindServiceImpl extends AbstractPaymentService implements GiftInKindService {

    /** Logger for this class and subclasses */
    protected final Log logger = OLLogger.getLog(getClass());

    @Resource(name = "giftInKindDAO")
    private GiftInKindDao giftInKindDao;
    
    @Resource(name = "giftDAO")
    private GiftDao giftDao;
    
	@Resource(name = "rollupHelperService")
	private RollupHelperService rollupHelperService;
    
    @Resource(name="giftInKindEntityValidator")
    protected EntityValidator entityValidator;

    @Resource(name="codeValidator")
    protected com.orangeleap.tangerine.service.validator.CodeValidator codeValidator;

    @Resource(name="giftInKindDetailsValidator")
    protected com.orangeleap.tangerine.service.validator.GiftInKindDetailsValidator giftInKindDetailsValidator;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = {BindException.class})
    public GiftInKind maintainGiftInKind(GiftInKind giftInKind) throws BindException {
        if (logger.isTraceEnabled()) {
            logger.trace("maintainGiftInKind: giftInKind = " + giftInKind);
        }
        
        if (giftInKind.getFieldLabelMap() != null && !giftInKind.isSuppressValidation()) {
	        BindingResult br = new BeanPropertyBindingResult(giftInKind, "giftInKind");
	        BindException errors = new BindException(br);
	      
	        entityValidator.validate(giftInKind, errors);
	        codeValidator.validate(giftInKind, errors);
	        giftInKindDetailsValidator.validate(giftInKind, errors);

	        if (errors.hasErrors()) {
		        throw errors;
	        }
        }

        maintainEntityChildren(giftInKind, giftInKind.getConstituent());
        giftInKind.setTransactionDate(Calendar.getInstance().getTime());
        Gift gift = createGiftForGiftInKind(giftInKind);
        gift = giftDao.maintainGift(gift); // save a row in the gift table
        giftInKind.setGiftId(gift.getId());
        giftInKind = giftInKindDao.maintainGiftInKind(giftInKind);
        auditService.auditObject(giftInKind, giftInKind.getConstituent());
        rollupHelperService.updateRollupsForConstituentRollupValueSource(giftInKind);

        return giftInKind;
    }

    @Override
    public GiftInKind readGiftInKindById(Long giftInKindId) {
        if (logger.isTraceEnabled()) {
            logger.trace("readGiftInKindById: giftInKindId = " + giftInKindId);
        }
        return giftInKindDao.readGiftInKindById(giftInKindId);
    }

    @Override
    public List<GiftInKind> readGiftsInKindByConstituentId(Long constituentId) {
        if (logger.isTraceEnabled()) {
            logger.trace("readGiftsInKindByConstituentId: constituentId = " + constituentId);
        }
        return giftInKindDao.readGiftsInKindByConstituentId(constituentId);
    }
    
    @Override
    public PaginatedResult readPaginatedGiftsInKindByConstituentId(Long constituentId, SortInfo sortinfo) {
        if (logger.isTraceEnabled()) {
            logger.trace("readPaginatedGiftsInKindByConstituentId: constituentId = " + constituentId);
        }
        return giftInKindDao.readPaginatedGiftsInKindByConstituentId(constituentId, sortinfo);
    }
    
    @Override
    public GiftInKind readGiftInKindByIdCreateIfNull(String giftInKindId, Constituent constituent) {
        if (logger.isTraceEnabled()) {
            logger.trace("readGiftInKindByIdCreateIfNull: giftInKindId = " + giftInKindId + " constituentId = " + (constituent == null ? null : constituent.getId()));
        }
        GiftInKind giftInKind = null;
        if (giftInKindId == null) {
            giftInKind = createDefaultGiftInKind(constituent); 
        }
        else {
            giftInKind = readGiftInKindById(Long.valueOf(giftInKindId));
        }
        return giftInKind;
    }
    
    private GiftInKind createDefaultGiftInKind(Constituent constituent) {
        if (logger.isTraceEnabled()) {
            logger.trace("createDefaultGiftInKind: constituent = " + (constituent == null ? null : constituent.getId()));
        }
        GiftInKind giftInKind = new GiftInKind();
        giftInKind.setConstituent(constituent);
        giftInKind.addDetail(new GiftInKindDetail());
        return giftInKind;
    }
    
    private Gift createGiftForGiftInKind(GiftInKind giftInKind) {
        if (logger.isTraceEnabled()) {
            logger.trace("createGiftForGiftInKind: giftInKind.giftId = " + giftInKind.getGiftId());
        }
        Gift gift = null;
        if (giftInKind.getGiftId() == null || giftInKind.getGiftId() <= 0) {
            gift = new Gift(giftInKind);
        }
        else {
            gift = giftDao.readGiftById(giftInKind.getGiftId());
            gift.setGiftForGiftInKind(giftInKind);
        }
        return gift;
    }

    @Override
    public List<GiftInKind> readAllGiftsInKindByConstituentId(Long constituentId, SortInfo sort, Locale locale) {
        if (logger.isTraceEnabled()) {
            logger.trace("readAllGiftsInKindByConstituentId: constituentId = " + constituentId + " sort = " + sort);
        }
        return giftInKindDao.readAllGiftsInKindByConstituentId(constituentId, sort.getSort(), sort.getDir(), sort.getStart(),
                sort.getLimit(), locale);
    }

    @Override
    public int readCountByConstituentId(Long constituentId) {
        if (logger.isTraceEnabled()) {
            logger.trace("readCountByConstituentId: constituentId = " + constituentId);
        }
        return giftInKindDao.readCountByConstituentId(constituentId);
    }
}

package com.orangeleap.tangerine.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.orangeleap.tangerine.dao.GiftInKindDao;
import com.orangeleap.tangerine.domain.Person;
import com.orangeleap.tangerine.domain.paymentInfo.GiftInKind;
import com.orangeleap.tangerine.domain.paymentInfo.GiftInKindDetail;
import com.orangeleap.tangerine.service.GiftInKindService;

@Service("giftInKindService")
@Transactional(propagation = Propagation.REQUIRED)
public class GiftInKindServiceImpl extends AbstractPaymentService implements GiftInKindService {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name = "giftInKindDAO")
    private GiftInKindDao giftInKindDao;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public GiftInKind maintainGiftInKind(GiftInKind giftInKind) {
        if (logger.isDebugEnabled()) {
            logger.debug("maintainGiftInKind: giftInKind = " + giftInKind);
        }
        maintainEntityChildren(giftInKind, giftInKind.getPerson());
        giftInKind.filterValidDetails();
        giftInKind = giftInKindDao.maintainGiftInKind(giftInKind);
        auditService.auditObject(giftInKind, giftInKind.getPerson());

        return giftInKind;
    }

    @Override
    public GiftInKind readGiftInKindById(Long giftInKindId) {
        if (logger.isDebugEnabled()) {
            logger.debug("readGiftInKindById: giftInKindId = " + giftInKindId);
        }
        return giftInKindDao.readGiftInKindById(giftInKindId);
    }

    @Override
    public List<GiftInKind> readGiftsInKindByConstituentId(Long constituentId) {
        if (logger.isDebugEnabled()) {
            logger.debug("readGiftsInKindByConstituentId: constituentId = " + constituentId);
        }
        return giftInKindDao.readGiftsInKindByConstituentId(constituentId);
    }
    
    public GiftInKind readGiftInKindByIdCreateIfNull(String giftInKindId, Person constituent) {
        if (logger.isDebugEnabled()) {
            logger.debug("readGiftInKindByIdCreateIfNull: giftInKindId = " + giftInKindId + " constituentId = " + (constituent == null ? null : constituent.getId()));
        }
        GiftInKind giftInKind = null;
        if (giftInKindId == null) {
            
        }
        else {
            giftInKind = readGiftInKindById(Long.valueOf(giftInKindId));
        }
        return giftInKind;
    }
    
    private GiftInKind createDefaultGiftInKind(Person constituent) {
        if (logger.isDebugEnabled()) {
            logger.debug("createDefaultGiftInKind: constituent = " + (constituent == null ? null : constituent.getId()));
        }
        GiftInKind giftInKind = new GiftInKind();
        List<GiftInKindDetail> details = new ArrayList<GiftInKindDetail>(1);
        GiftInKindDetail detail = new GiftInKindDetail();
        details.add(detail);
        giftInKind.setDetails(details);
        return giftInKind;
    }
}
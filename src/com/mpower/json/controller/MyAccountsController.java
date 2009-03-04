package com.mpower.json.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mpower.domain.model.Person;
import com.mpower.domain.model.paymentInfo.Gift;
import com.mpower.security.MpowerAuthenticationToken;
import com.mpower.service.ConstituentService;
import com.mpower.service.GiftService;
import com.mpower.service.SiteService;

/**
 * Controller used by the sidebar to get the accounts for
 * which the current user is the Account Manager
 * @version 1.0
 */
@Controller
public class MyAccountsController {

    @Resource(name="siteService")
    private SiteService siteService;

    @Resource(name="constituentService")
    private ConstituentService constituentService;

    @Resource(name="giftService")
    private GiftService giftService;

    @SuppressWarnings("unchecked")
	@RequestMapping("/myAccounts.json")
    public ModelMap getAllAccounts(HttpSession session) {

        List<Map> response = new ArrayList<Map>();

        MpowerAuthenticationToken mPowerAuthenticationToken = (MpowerAuthenticationToken)SecurityContextHolder.getContext().getAuthentication();
        siteService.createSiteAndUserIfNotExist(mPowerAuthenticationToken.getSite());
        Person constituent = constituentService.readConstituentById(mPowerAuthenticationToken.getPersonId());
        if (constituent == null) {
            return new ModelMap();
        }
        
        String acctString = constituent.getCustomFieldValue("individual.accountManagerFor");

        if (acctString != null) {
            String[] accounts = acctString.split(",");

            for (String account : accounts) {

                Long acctId = Long.parseLong(account);
                Person client = constituentService.readConstituentById(acctId);

                BigDecimal totalGiving = new BigDecimal(0);

                List<Gift> giftList = giftService.readGifts(client.getId());
                for (Gift gft : giftList) {
                    totalGiving = totalGiving.add(gft.getAmount() == null ? BigDecimal.ZERO : gft.getAmount());
                }


                response.add(fromConstituent(client, totalGiving, giftList.size()));
            }
        }

        ModelMap model = new ModelMap("data", response);

        return model;
    }

    @SuppressWarnings("unchecked")
    private Map fromConstituent(Person constituent, BigDecimal amount, int gifts) {

        Map<String,Object> ret = new HashMap<String,Object>();
        ret.put("id", constituent.getId());
        ret.put("first", constituent.getFirstName());
        ret.put("last", constituent.getLastName());
        ret.put("orgName", constituent.getOrganizationName());
        ret.put("majorDonor", constituent.isMajorDonor());
        ret.put("lapsedDonor", constituent.isLapsedDonor());
        ret.put("amount", amount);
        ret.put("gifts", gifts);
        return ret;
    }


}

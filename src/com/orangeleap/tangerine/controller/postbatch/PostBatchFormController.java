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

package com.orangeleap.tangerine.controller.postbatch;

import com.orangeleap.tangerine.dao.FieldDao;
import com.orangeleap.tangerine.domain.PostBatch;
import com.orangeleap.tangerine.domain.paymentInfo.AbstractPaymentInfoEntity;
import com.orangeleap.tangerine.service.ConstituentService;
import com.orangeleap.tangerine.service.GiftService;
import com.orangeleap.tangerine.service.PostBatchService;
import com.orangeleap.tangerine.service.impl.PostBatchServiceImpl;
import com.orangeleap.tangerine.type.AccessType;
import com.orangeleap.tangerine.util.OLLogger;
import org.apache.commons.logging.Log;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.util.WebUtils;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class PostBatchFormController extends SimpleFormController {

    // TODO add batch list with edit existing unposted, view historical and delete

    /**
     * Logger for this class and subclasses
     */
    protected final Log logger = OLLogger.getLog(getClass());

    @Resource(name = "constituentService")
    private ConstituentService constituentService;

    @Resource(name = "giftService")
    private GiftService giftService;

    @Resource(name = "postBatchService")
    private PostBatchService postBatchService;

    @Resource(name = "fieldDAO")
    private FieldDao fieldDao;

    @SuppressWarnings("unchecked")
    public static boolean accessAllowed(HttpServletRequest request) {
        Map<String, AccessType> pageAccess = (Map<String, AccessType>) WebUtils.getSessionAttribute(request, "pageAccess");
        return pageAccess.get("/postbatch.htm") == AccessType.ALLOWED;
    }

    @SuppressWarnings("unchecked")
    @Override
    public ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors, Map controlModel) throws Exception {

        if (!accessAllowed(request)) return null;

        ModelAndView mav = super.showForm(request, response, errors, controlModel);

        PostBatch postbatch = getPostBatch(request);
        List<AbstractPaymentInfoEntity> gifts = postBatchService.getBatchSelectionList(postbatch);

        mav.addObject("gifts", gifts);
        mav.addObject("postbatch", postbatch);
        mav.addObject("allowedSelectFields", postBatchService.readAllowedGiftSelectFields());
        mav.addObject("allowedUpdateFields", postBatchService.readAllowedGiftUpdateFields());
        return mav;

    }

    private PostBatch getNewPostBatch() {
        PostBatch postbatch = new PostBatch();
        postbatch.setEntity("gift");
        DateFormat formatter = new SimpleDateFormat(PostBatchServiceImpl.DATE_FORMAT);
        String sdate = formatter.format(new java.util.Date());
        postbatch.setPostBatchDesc("Batch for " + sdate);
        // Add some default field settings...
        postbatch.getWhereConditions().put("giftStatus", "Paid");
        postbatch.getUpdateFields().put("postedDate", sdate);
        return postbatch;
    }


    @Override
    public Object formBackingObject(HttpServletRequest request) throws ServletException {
        return getPostBatch(request);
    }

    private PostBatch getPostBatch(HttpServletRequest request) {
        String sid = request.getParameter("id");
        PostBatch postbatch = null;
        if (sid != null && sid.trim().length() > 0) {
            postbatch = postBatchService.readBatch(new Long(sid));
        }
        if (postbatch == null) postbatch = getNewPostBatch();
        return postbatch;
    }


    // First they set the selection criteria and "save" which genertes the list of gifts matching the criteria to review.
    // Once they have the criteria they way they want it, they "post" which processes the updates to the list of selected items.
    @Override
    public ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws ServletException {

        if (!accessAllowed(request)) return null;

        boolean post = "true".equals(request.getParameter("post"));
        boolean update = "true".equals(request.getParameter("update"));

        PostBatch requestPostbatch = (PostBatch) command;
        // Read existing
        Long batchId = requestPostbatch.getId();
        PostBatch postbatch = postBatchService.readBatch(batchId);
        if (postbatch == null) postbatch = getNewPostBatch();

        String errormessage = "";
        List<AbstractPaymentInfoEntity> gifts = new ArrayList<AbstractPaymentInfoEntity>();

        try {

            // User can only edit the description/type and the list of select/update fields - the rest of the fields are read-only
            postbatch.setPostBatchDesc(requestPostbatch.getPostBatchDesc());
            postbatch.setEntity(requestPostbatch.getEntity());

            readFields(request, postbatch.getWhereConditions(), "sf");
            readFields(request, postbatch.getUpdateFields(), "uf");
            validatesFields(postbatch);
            validateRanges(postbatch);
            postbatch = postBatchService.maintainBatch(postbatch);

            gifts = postBatchService.createBatchSelectionList(postbatch);  // will throw exception if selection set too large.
            if (update || post) {
                postbatch = postBatchService.updateBatch(postbatch, post);
            }

        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e);
            errormessage = e.getMessage();
        }

        ModelAndView mav = new ModelAndView(getSuccessView());
        mav.addObject("errormessage", errormessage);
        mav.addObject("gifts", gifts);
        mav.addObject("postbatch", postbatch);
        mav.addObject("allowedSelectFields", postBatchService.readAllowedGiftSelectFields());
        mav.addObject("allowedUpdateFields", postBatchService.readAllowedGiftUpdateFields());

        return mav;

    }

    // Validate fields are on allowed select lists.  May allow duplicate fields in list, for example date > and < for a range.
    private void validatesFields(PostBatch postbatch) {
        Map<String, String> select = postBatchService.readAllowedGiftSelectFields();
        Map<String, String> update = postBatchService.readAllowedGiftUpdateFields();
        for (Map.Entry<String, String> me : postbatch.getWhereConditions().entrySet()) {
            if (select.get(me.getKey()) == null)
                throw new RuntimeException("Invalid request."); // this would require a hacked form field.
        }
        for (Map.Entry<String, String> me : postbatch.getUpdateFields().entrySet()) {
            if (update.get(me.getKey()) == null)
                throw new RuntimeException("Invalid request."); // this would require a hacked form field.
        }
    }


    // Allow some basic range matching formats     
    // TODO check based on specific field type
    private void validateRanges(PostBatch postbatch) {
        for (Map.Entry<String, String> me : postbatch.getWhereConditions().entrySet()) {
            String value = me.getValue();
            if (value.startsWith("=") || value.startsWith("!=") || value.startsWith("<") || value.startsWith(">")) {

                String avalue = value.startsWith("!=") ? value.substring(2) : value.substring(1);

                boolean isNull = avalue.equalsIgnoreCase("null");

                boolean isDate = false;
                try {
                    DateFormat formatter = new SimpleDateFormat(PostBatchServiceImpl.DATE_FORMAT);
                    Date adate = formatter.parse(avalue);
                    isDate = avalue.length() == PostBatchServiceImpl.DATE_FORMAT.length();
                } catch (Exception e) {
                }

                boolean isNumber = false;
                try {
                    Double.parseDouble(avalue);
                    isNumber = true;
                } catch (Exception e) {
                }

                if (!(isDate || isNumber || isNull)) {
                    throw new RuntimeException("Invalid matching value \"" + value + "\"");
                }

            }
        }
    }

    private void readFields(HttpServletRequest request, Map conditions, String type) {
        conditions.clear();
        conditions.putAll(getMap(request, type));
    }

    @SuppressWarnings("unchecked")
    protected Map<String, String> getMap(HttpServletRequest request, String type) {
        Map map = new TreeMap<String, String>();
        Enumeration e = request.getParameterNames();
        while (e.hasMoreElements()) {
            String parm = (String) e.nextElement();
            if (parm.startsWith(type + "name")) {
                String fieldnum = parm.substring(6);
                String key = request.getParameter(parm).trim();
                String value = request.getParameter(type + "value" + fieldnum).trim();
                if (key.length() > 0) map.put(key, value);
            }
        }
        return map;
    }


}
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

package com.orangeleap.tangerine.web.customization.handler;

import com.orangeleap.tangerine.domain.customization.SectionField;
import com.orangeleap.tangerine.type.FieldType;
import com.orangeleap.tangerine.util.OLLogger;
import org.apache.commons.logging.Log;
import org.springframework.context.ApplicationContext;

import java.util.HashMap;
import java.util.Map;

@Deprecated
public class FieldHandlerHelper {

    /**
     * Logger for this class and subclasses
     */
    protected final Log logger = OLLogger.getLog(getClass());


    private static Map<FieldType, FieldHandler> fieldTypeToHandlerMap = new HashMap<FieldType, FieldHandler>();
    private static boolean initialized;

    public static FieldHandler lookupFieldHandler(ApplicationContext appContext, SectionField sectionField) {
        if (!initialized) {
            synchronized (fieldTypeToHandlerMap) {
                if (!initialized) {
                    initializeFieldHandlerMap(appContext);
                }
            }
        }
        return fieldTypeToHandlerMap.get(sectionField.getFieldType());
    }

    private static void initializeFieldHandlerMap(ApplicationContext appContext) {
        GenericFieldHandler genericFieldHandler = new GenericFieldHandler(appContext);
        fieldTypeToHandlerMap.put(FieldType.HIDDEN, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.DATE, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.DATE_DISPLAY, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.TEXT, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.READ_ONLY_TEXT, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.PAYMENT_TYPE_READ_ONLY_TEXT, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.LONG_TEXT, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.LOOKUP, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.DATE_TIME, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.CC_EXPIRATION_DISPLAY, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.CHECKBOX, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.NUMBER, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.PERCENTAGE, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.PAYMENT_SOURCE_PICKLIST, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.ADDRESS_PICKLIST, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.PHONE_PICKLIST, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.EMAIL_PICKLIST, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.EXISTING_ADDRESS_PICKLIST, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.EXISTING_PHONE_PICKLIST, genericFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.EXISTING_EMAIL_PICKLIST, genericFieldHandler);

        AssociationFieldHandler associationFieldHandler = new AssociationFieldHandler(appContext);
        fieldTypeToHandlerMap.put(FieldType.ASSOCIATION, associationFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.ASSOCIATION_DISPLAY, associationFieldHandler);

        fieldTypeToHandlerMap.put(FieldType.CC_EXPIRATION, new ExpirationFieldHandler(appContext));
        fieldTypeToHandlerMap.put(FieldType.PHONE, new PhoneFieldHandler(appContext));

        PicklistFieldHandler picklistFieldHandler = new PicklistFieldHandler(appContext);
        fieldTypeToHandlerMap.put(FieldType.PICKLIST, picklistFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.PICKLIST_DISPLAY, picklistFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.MULTI_PICKLIST, picklistFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.MULTI_PICKLIST_DISPLAY, picklistFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.ADJUSTED_GIFT_PAYMENT_SOURCE_PICKLIST, picklistFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.ADJUSTED_GIFT_PAYMENT_TYPE_PICKLIST, picklistFieldHandler);
        PicklistAdditionalFieldsHandler picklistAdditionalFieldsHandler = new PicklistAdditionalFieldsHandler(appContext);
        fieldTypeToHandlerMap.put(FieldType.MULTI_PICKLIST_ADDITIONAL, picklistAdditionalFieldsHandler);
        fieldTypeToHandlerMap.put(FieldType.MULTI_PICKLIST_ADDITIONAL_DISPLAY, picklistAdditionalFieldsHandler);

        fieldTypeToHandlerMap.put(FieldType.PREFERRED_PHONE_TYPES, new PreferredPhoneFieldHandler(appContext));

        LookupFieldHandler lookupFieldHandler = new LookupFieldHandler(appContext);
        fieldTypeToHandlerMap.put(FieldType.QUERY_LOOKUP, lookupFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.MULTI_QUERY_LOOKUP, lookupFieldHandler);
        LookupOtherFieldHandler lookupOtherFieldHandler = new LookupOtherFieldHandler(appContext);
        fieldTypeToHandlerMap.put(FieldType.QUERY_LOOKUP_OTHER, lookupOtherFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.QUERY_LOOKUP_DISPLAY, lookupOtherFieldHandler);

        fieldTypeToHandlerMap.put(FieldType.CODE, new CodeFieldHandler(appContext));
        fieldTypeToHandlerMap.put(FieldType.MULTI_CODE_ADDITIONAL, new CodeAdditionalFieldsHandler(appContext));
        CodeOtherFieldHandler codeOtherFieldHandler = new CodeOtherFieldHandler(appContext);
        fieldTypeToHandlerMap.put(FieldType.CODE_OTHER, codeOtherFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.CODE_OTHER_DISPLAY, codeOtherFieldHandler);

        SelectionFieldHandler selectionFieldHandler = new SelectionFieldHandler(appContext);
        fieldTypeToHandlerMap.put(FieldType.SELECTION, selectionFieldHandler);
        fieldTypeToHandlerMap.put(FieldType.SELECTION_DISPLAY, selectionFieldHandler);

        fieldTypeToHandlerMap.put(FieldType.SPACER, new SpacerFieldHandler());
        initialized = true;

    }
}

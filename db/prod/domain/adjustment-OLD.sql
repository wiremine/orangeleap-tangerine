INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.currentTotalAdjustedAmount', 'adjustedGift', 'currentTotalAdjustedAmount', 'Current Total Adjustment Amount', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.adjustedAmount', 'adjustedGift', 'adjustedAmount', 'This Adjustment Amount', 'NUMBER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.reason', 'adjustedGift', 'adjustedReason', 'Adjustment Reason', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.status', 'adjustedGift', 'adjustedStatus', 'Adjustment Status', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[bank]', 'adjustedGift', 'customFieldMap[bank]', 'Bank', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.currencyCodeReadOnly', 'adjustedGift', 'currencyCode', 'Currency Code', 'CODE_OTHER_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.transactionDate', 'adjustedGift', 'adjustedTransactionDate', 'Adjustment Date', 'DATE_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.type', 'adjustedGift', 'adjustedType', 'Adjustment Type', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.paymentRequired', 'adjustedGift', 'adjustedPaymentRequired', 'Payment Required', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.paymentTo', 'adjustedGift', 'adjustedPaymentTo', 'Payment To', 'giftPayment', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.comments', 'adjustedGift', 'comments', 'Comments', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.originalGiftId', 'adjustedGift', 'gift', 'originalGiftId', 'Original Gift', 'ASSOCIATION_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.paymentType', 'adjustedGift', 'paymentType', 'Payment Method', 'giftPayment', 'ADJUSTED_GIFT_PAYMENT_TYPE_PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedPaymentSource', 'adjustedGift', 'selectedPaymentSource', 'Payment Profile', 'paymentSource', 'ADJUSTED_GIFT_PAYMENT_SOURCE_PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.posted', 'adjustedGift', 'posted', 'Posted', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.postedDate', 'adjustedGift', 'postedDate', 'Posted Date', 'postedDate', 'DATE');

-- Credit Card
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedPaymentSource.creditCardSecurityCode', 'adjustedGift', 'selectedPaymentSource', 'Security Code', '', 'TEXT');

-- Check
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.checkNumber', 'adjustedGift', 'checkNumber', 'Check Number', '', 'TEXT');

-- Address
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedAddress', 'adjustedGift', 'selectedAddress', 'Billing Address', 'address', 'EXISTING_ADDRESS_PICKLIST');

-- Phone
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedPhone', 'adjustedGift', 'selectedPhone', 'Billing Phone', 'phone', 'EXISTING_PHONE_PICKLIST');

-- Distribution Lines
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.lineAmount', 'adjustedGift', 'amount', 'Amt', 'NUMBER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.percentage', 'adjustedGift', 'percentage', 'Pct', 'PERCENTAGE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.projectCodeReadOnly', 'adjustedGift', 'projectCode', 'Designation', 'CODE_OTHER_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.motivationCodeReadOnly', 'adjustedGift', 'motivationCode', 'Motivation', 'CODE_OTHER_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.other_motivationCodeReadOnly', 'adjustedGift', 'other_motivationCode', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[referenceReadOnly]', 'adjustedGift', 'constituent', 'customFieldMap[reference]', 'Reference', 'QUERY_LOOKUP_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[other_referenceReadOnly]', 'adjustedGift', 'constituent', 'customFieldMap[other_reference]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[tributeReadOnly]', 'adjustedGift', 'customFieldMap[tribute]', 'Tribute Type', 'PICKLIST_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[tributeReferenceReadOnly]', 'adjustedGift', 'constituent', 'customFieldMap[tributeReference]', 'Tribute Reference', 'QUERY_LOOKUP_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[other_tributeReferenceReadOnly]', 'adjustedGift', 'constituent', 'customFieldMap[other_tributeReference]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[tributeOccasionReadOnly]', 'adjustedGift', 'customFieldMap[tributeOccasion]', 'Tribute Occasion', 'MULTI_PICKLIST_ADDITIONAL_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[additional_tributeOccasionReadOnly]', 'adjustedGift', 'customFieldMap[additional_tributeOccasion]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[onBehalfOfReadOnly]', 'adjustedGift', 'constituent', 'customFieldMap[onBehalfOf]', 'On Behalf Of', 'QUERY_LOOKUP_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[other_onBehalfOfReadOnly]', 'adjustedGift', 'constituent', 'customFieldMap[other_onBehalfOf]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[anonymousReadOnly]', 'adjustedGift', 'customFieldMap[anonymous]', 'Anonymous', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[recognitionNameReadOnly]', 'adjustedGift', 'customFieldMap[recognitionName]', 'Recognition Name', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[notifiedReadOnly]', 'adjustedGift', 'constituent', 'customFieldMap[notified]', 'To Be Notified', 'QUERY_LOOKUP_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[other_notifiedReadOnly]', 'adjustedGift', 'constituent', 'customFieldMap[other_notified]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[messageReadOnly]', 'adjustedGift', 'customFieldMap[message]', 'Message', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[taxDeductibleReadOnly]', 'adjustedGift', 'customFieldMap[taxDeductible]', 'Tax Ded', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[associatedPledgeIdReadOnly]', 'adjustedGift', 'pledge', 'customFieldMap[associatedPledgeId]', 'Associated Pledge', 'pledge', 'ASSOCIATION_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.customFieldMap[associatedRecurringGiftIdReadOnly]', 'adjustedGift', 'recurringGift', 'customFieldMap[associatedRecurringGiftId]', 'Associated Recurring Gift', 'recurringGift', 'ASSOCIATION_DISPLAY');


-- Read Only Below
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.adjustedAmountReadOnly', 'adjustedGift', 'adjustedAmount', 'This Adjustment Amount', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.reasonReadOnly', 'adjustedGift', 'adjustedReason', 'Adjustment Reason', 'PICKLIST_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.statusReadOnly', 'adjustedGift', 'adjustedStatus', 'Adjustment Status', 'PICKLIST_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.typeReadOnly', 'adjustedGift', 'adjustedType', 'Adjustment Type', 'PICKLIST_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.paymentRequiredReadOnly', 'adjustedGift', 'adjustedPaymentRequired', 'Payment Required', 'PICKLIST_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.paymentToReadOnly', 'adjustedGift', 'adjustedPaymentTo', 'Payment To', 'giftPayment', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.authCodeReadOnly', 'adjustedGift', 'authCode', 'Auth Code', 'wrappable', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.commentsReadOnly', 'adjustedGift', 'comments', 'Comments', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.paymentMessageReadOnly', 'adjustedGift', 'paymentMessage', 'Payment Message', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.paymentStatusReadOnly', 'adjustedGift', 'paymentStatus', 'Payment Status', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.txRefNumReadOnly', 'adjustedGift', 'txRefNum', 'Reference Number', 'wrappable', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.paymentTypeReadOnly', 'adjustedGift', 'paymentType', 'Payment Method', 'giftPayment', 'PAYMENT_TYPE_READ_ONLY_TEXT');


INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.selectedPaymentSource.creditCardHolderNameReadOnly', 'adjustedGift', 'selectedPaymentSource', 'Cardholder Name', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.selectedPaymentSource.creditCardTypeReadOnly', 'adjustedGift', 'selectedPaymentSource', 'Credit Card', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.selectedPaymentSource.creditCardNumberReadOnly', 'adjustedGift', 'selectedPaymentSource', 'Credit Card Number', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.selectedPaymentSource.creditCardExpirationDisplay', 'adjustedGift', 'selectedPaymentSource', 'Expiration', 'CC_EXPIRATION_DISPLAY');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.selectedPaymentSource.achHolderNameReadOnly', 'adjustedGift', 'selectedPaymentSource', 'ACH Holder Name', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.selectedPaymentSource.achRoutingNumberReadOnly', 'adjustedGift', 'selectedPaymentSource', 'Routing Number', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.selectedPaymentSource.achAccountNumberReadOnly', 'adjustedGift', 'selectedPaymentSource', 'Account Number', 'READ_ONLY_TEXT');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.checkNumberReadOnly', 'adjustedGift', 'checkNumber', 'Check Number', '', 'READ_ONLY_TEXT');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedAddress.addressLine1ReadOnly', 'adjustedGift', 'selectedAddress', 'Address Line 1', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedAddress.addressLine2ReadOnly', 'adjustedGift', 'selectedAddress', 'Address Line 2', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedAddress.addressLine3ReadOnly', 'adjustedGift', 'selectedAddress', 'Address Line 3', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedAddress.cityReadOnly', 'adjustedGift', 'selectedAddress', 'City', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedAddress.stateProvinceReadOnly', 'adjustedGift', 'selectedAddress', 'State/Province', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedAddress.postalCodeReadOnly', 'adjustedGift', 'selectedAddress', 'Zip/Postal Code', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedAddress.countryReadOnly', 'adjustedGift', 'selectedAddress', 'Country', 'address', 'READ_ONLY_TEXT');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('adjustedGift.selectedPhone.numberReadOnly', 'adjustedGift', 'selectedPhone', 'Phone Number', 'phone', 'READ_ONLY_TEXT');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.lineAmountReadOnly', 'adjustedGift', 'amount', 'Amount', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustedGift.percentageReadOnly', 'adjustedGift', 'percentage', 'Pct', 'READ_ONLY_TEXT');


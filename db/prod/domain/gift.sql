INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.amount', 'gift', 'amount', 'Amount', 'NUMBER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.currencyCode', 'gift', 'currencyCode', 'Currency Code', 'CODE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.comments', 'gift', 'comments', 'Comments', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.transactionDate', 'gift', 'transactionDate', 'Transaction Date', 'DATE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.donationDate', 'gift', 'donationDate', 'Date of Donation', 'DATE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.posted', 'gift', 'posted', 'Posted', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.postedDate', 'gift', 'postedDate', 'Posted Date', 'postedDate', 'DATE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.postmarkDate', 'gift', 'postmarkDate', 'Postmark Date', 'DATE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.giftStatus', 'gift', 'giftStatus', 'Status', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[bank]', 'gift', 'customFieldMap[bank]', 'Bank', 'PICKLIST');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.associatedPledgeIds', 'gift', 'pledge', 'associatedPledgeIds', 'Pledges', 'pledge', 'SELECTION');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.associatedRecurringGiftIds', 'gift', 'recurringGift', 'associatedRecurringGiftIds', 'Recurring Gifts', 'recurringGift', 'SELECTION');


INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.id', 'gift', 'id', 'Reference Number', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.amountReadOnly', 'gift', 'amount', 'Amount', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.currencyCodeReadOnly', 'gift', 'currencyCode', 'Currency Code', 'CODE_OTHER_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.avsMessageReadOnly', 'gift', 'avsMessage', 'AVS Message', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.paymentMessageReadOnly', 'gift', 'paymentMessage', 'Payment Message', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.paymentStatusReadOnly', 'gift', 'paymentStatus', 'Payment Status', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.txRefNumReadOnly', 'gift', 'txRefNum', 'Reference Number', 'wrappable', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.authCodeReadOnly', 'gift', 'authCode', 'Auth Code', 'wrappable', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.idHidden', 'gift', 'id', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.giftStatusReadOnly', 'gift', 'giftStatus', 'Status', 'PICKLIST_DISPLAY');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.associatedPledgeIdsReadOnly', 'gift', 'pledge', 'associatedPledgeIds', 'Pledges', 'pledge', 'SELECTION_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.associatedRecurringGiftIdsReadOnly', 'gift', 'recurringGift', 'associatedRecurringGiftIds', 'Recurring Gifts', 'recurringGift', 'SELECTION_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.adjustedGiftsReadOnly', 'gift', 'adjustedGift', 'adjustedGifts', 'Adjustments', 'adjustedGift', 'SELECTION_DISPLAY');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.constituentLastName', 'gift', 'constituent.lastName', 'Last Name', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.constituentFirstName', 'gift', 'constituent.firstName', 'First Name', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.commitmentCode', 'gift', 'commitmentCode', 'Commitment', 'CODE');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.paymentType', 'gift', 'paymentType', 'Payment Method', 'giftPayment', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.paymentTypeReadOnly', 'gift', 'paymentType', 'Payment Method', 'giftPayment', 'PAYMENT_TYPE_READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.paymentSource.creditCardType', 'gift', 'paymentSource', 'Credit Card', '', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.paymentSource.creditCardExpiration', 'gift', 'paymentSource', 'Expiration', '', 'CC_EXPIRATION');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.checkNumber', 'gift', 'checkNumber', 'Check Number', '', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.checkNumberReadOnly', 'gift', 'checkNumber', 'Check Number', '', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.paymentSource.creditCardHolderName', 'gift', 'paymentSource', 'Cardholder Name', '', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.paymentSource.creditCardNumber', 'gift', 'paymentSource', 'Credit Card Number', '', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.paymentSource.creditCardSecurityCode', 'gift', 'paymentSource', 'Security Code', '', 'TEXT');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.paymentSource.achHolderName', 'gift', 'paymentSource', 'ACH Holder Name', '', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.paymentSource.achRoutingNumber', 'gift', 'paymentSource', 'Routing Number', '', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.paymentSource.achAccountNumber', 'gift', 'paymentSource', 'Account Number', '', 'TEXT');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPaymentSource.creditCardHolderNameReadOnly', 'gift', 'selectedPaymentSource', 'Cardholder Name', '', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPaymentSource.creditCardTypeReadOnly', 'gift', 'selectedPaymentSource', 'Credit Card', '', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPaymentSource.creditCardNumberReadOnly', 'gift', 'selectedPaymentSource', 'Credit Card Number', '', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPaymentSource.creditCardExpirationDisplay', 'gift', 'selectedPaymentSource', 'Expiration', '', 'CC_EXPIRATION_DISPLAY');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPaymentSource.achHolderNameReadOnly', 'gift', 'selectedPaymentSource', 'ACH Holder Name', '', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPaymentSource.achRoutingNumberReadOnly', 'gift', 'selectedPaymentSource', 'Routing Number', '', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPaymentSource.achAccountNumberReadOnly', 'gift', 'selectedPaymentSource', 'Account Number', '', 'READ_ONLY_TEXT');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPaymentSource', 'gift', 'selectedPaymentSource', 'Payment Profile', 'giftPayment', 'PAYMENT_SOURCE_PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPaymentSource.creditCardSecurityCode', 'gift', 'selectedPaymentSource', 'Security Code', '', 'TEXT');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedAddress', 'gift', 'selectedAddress', 'Billing Address', 'address', 'ADDRESS_PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.address.customFieldMap[addressType]', 'gift', 'address', 'Address Type', 'address', 'MULTI_PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.address.addressLine1', 'gift', 'address', 'Address Line 1', 'address', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.address.addressLine2', 'gift', 'address', 'Address Line 2', 'address', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.address.addressLine3', 'gift', 'address', 'Address Line 3', 'address', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.address.city', 'gift', 'address', 'City', 'address', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.address.stateProvince', 'gift', 'address', 'State/Province', 'address', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.address.postalCode', 'gift', 'address', 'Zip/Postal Code', 'address', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.address.country', 'gift', 'address', 'Country', 'address', 'PICKLIST');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedAddress.customFieldMap[addressTypeReadOnly]', 'gift', 'selectedAddress', 'Address Type', 'address', 'MULTI_PICKLIST_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedAddress.addressLine1ReadOnly', 'gift', 'selectedAddress', 'Address Line 1', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedAddress.addressLine2ReadOnly', 'gift', 'selectedAddress', 'Address Line 2', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedAddress.addressLine3ReadOnly', 'gift', 'selectedAddress', 'Address Line 3', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedAddress.cityReadOnly', 'gift', 'selectedAddress', 'City', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedAddress.stateProvinceReadOnly', 'gift', 'selectedAddress', 'State/Province', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedAddress.postalCodeReadOnly', 'gift', 'selectedAddress', 'Zip/Postal Code', 'address', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedAddress.countryReadOnly', 'gift', 'selectedAddress', 'Country', 'address', 'READ_ONLY_TEXT');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPhone', 'gift', 'selectedPhone', 'Billing Phone', 'phone', 'PHONE_PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.phone.customFieldMap[phoneType]', 'gift', 'phone', 'Phone Type', 'phone', 'MULTI_PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.phone.number', 'gift', 'phone', 'Phone Number', 'phone', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPhone.customFieldMap[phoneTypeReadOnly]', 'gift', 'selectedPhone', 'Phone Type', 'phone', 'MULTI_PICKLIST_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.selectedPhone.numberReadOnly', 'gift', 'selectedPhone', 'Phone Number', 'phone', 'READ_ONLY_TEXT');


INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.lineAmount', 'gift', 'amount', 'Amt', 'NUMBER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.percentage', 'gift', 'percentage', 'Pct', 'PERCENTAGE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.projectCode', 'gift', 'projectCode', 'Designation', 'CODE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.motivationCode', 'gift', 'motivationCode', 'Motivation', 'CODE_OTHER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.other_motivationCode', 'gift', 'other_motivationCode', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[reference]', 'gift', 'constituent', 'customFieldMap[reference]', 'Reference', 'QUERY_LOOKUP_OTHER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[other_reference]', 'gift', 'constituent', 'customFieldMap[other_reference]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[tribute]', 'gift', 'customFieldMap[tribute]', 'Tribute Type', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[tributeReference]', 'gift', 'constituent', 'customFieldMap[tributeReference]', 'Tribute Reference', 'QUERY_LOOKUP_OTHER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[other_tributeReference]', 'gift', 'constituent', 'customFieldMap[other_tributeReference]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[tributeOccasion]', 'gift', 'customFieldMap[tributeOccasion]', 'Tribute Occasion', 'MULTI_PICKLIST_ADDITIONAL');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[additional_tributeOccasion]', 'gift', 'customFieldMap[additional_tributeOccasion]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[onBehalfOf]', 'gift', 'constituent', 'customFieldMap[onBehalfOf]', 'On Behalf Of', 'QUERY_LOOKUP_OTHER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[other_onBehalfOf]', 'gift', 'constituent', 'customFieldMap[other_onBehalfOf]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[anonymous]', 'gift', 'customFieldMap[anonymous]', 'Anonymous', 'CHECKBOX');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[recognitionName]', 'gift', 'customFieldMap[recognitionName]', 'Recognition Name', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[notified]', 'gift', 'constituent', 'customFieldMap[notified]', 'To Be Notified', 'QUERY_LOOKUP_OTHER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[other_notified]', 'gift', 'constituent', 'customFieldMap[other_notified]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[message]', 'gift', 'customFieldMap[message]', 'Message', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[taxDeductible]', 'gift', 'customFieldMap[taxDeductible]', 'Tax Ded', 'CHECKBOX');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.customFieldMap[associatedPledgeId]', 'gift', 'pledge', 'customFieldMap[associatedPledgeId]', 'Associated Pledge', 'pledge', 'ASSOCIATION');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.customFieldMap[associatedRecurringGiftId]', 'gift', 'recurringGift', 'customFieldMap[associatedRecurringGiftId]', 'Associated Recurring Gift', 'recurringGift', 'ASSOCIATION');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.lineAmountReadOnly', 'gift', 'amount', 'Amt', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.percentageReadOnly', 'gift', 'percentage', 'Pct', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.projectCodeReadOnly', 'gift', 'projectCode', 'Designation', 'CODE_OTHER_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.motivationCodeReadOnly', 'gift', 'motivationCode', 'Motivation', 'CODE_OTHER_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.other_motivationCodeReadOnly', 'gift', 'other_motivationCode', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[referenceReadOnly]', 'gift', 'constituent', 'customFieldMap[reference]', 'Reference', 'QUERY_LOOKUP_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[other_referenceReadOnly]', 'gift', 'constituent', 'customFieldMap[other_reference]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[tributeReadOnly]', 'gift', 'customFieldMap[tribute]', 'Tribute Type', 'PICKLIST_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[tributeReferenceReadOnly]', 'gift', 'constituent', 'customFieldMap[tributeReference]', 'Tribute Reference', 'QUERY_LOOKUP_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[other_tributeReferenceReadOnly]', 'gift', 'constituent', 'customFieldMap[other_tributeReference]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[tributeOccasionReadOnly]', 'gift', 'customFieldMap[tributeOccasion]', 'Tribute Occasion', 'MULTI_PICKLIST_ADDITIONAL_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[additional_tributeOccasionReadOnly]', 'gift', 'customFieldMap[additional_tributeOccasion]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[onBehalfOfReadOnly]', 'gift', 'constituent', 'customFieldMap[onBehalfOf]', 'On Behalf Of', 'QUERY_LOOKUP_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[other_onBehalfOfReadOnly]', 'gift', 'constituent', 'customFieldMap[other_onBehalfOf]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[anonymousReadOnly]', 'gift', 'customFieldMap[anonymous]', 'Anonymous', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[recognitionNameReadOnly]', 'gift', 'customFieldMap[recognitionName]', 'Recognition Name', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[notifiedReadOnly]', 'gift', 'constituent', 'customFieldMap[notified]', 'To Be Notified', 'QUERY_LOOKUP_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[other_notifiedReadOnly]', 'gift', 'constituent', 'customFieldMap[other_notified]', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[messageReadOnly]', 'gift', 'customFieldMap[message]', 'Message', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.customFieldMap[taxDeductibleReadOnly]', 'gift', 'customFieldMap[taxDeductible]', 'Tax Ded', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.customFieldMap[associatedPledgeIdReadOnly]', 'gift', 'pledge', 'customFieldMap[associatedPledgeId]', 'Associated Pledge', 'pledge', 'ASSOCIATION_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES ('gift.customFieldMap[associatedRecurringGiftIdReadOnly]', 'gift', 'recurringGift', 'customFieldMap[associatedRecurringGiftId]', 'Associated Recurring Gift', 'recurringGift', 'ASSOCIATION_DISPLAY');

--INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('gift.adjustmentGiftId', 'gift', 'gift', 'adjustmentGiftId', 'Adjustment Reference', 'ASSOCIATION_DISPLAY');
--INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('adjustment.originalAmountReadOnly', 'gift', 'originalAmount', 'Original Amount', 'READ_ONLY_TEXT');

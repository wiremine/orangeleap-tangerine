INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1002450, 'adjustedGift', 'adjustedGift.information', 'Adjustment Information', 1, 'TWO_COLUMN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000200, 'adjustedGift', 'adjustedGift.payment', 'Payment Information', 2, 'ONE_COLUMN', 'ROLE_USER');

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000203, 'adjustedGift', 'adjustedGift.check', 'New Check', 5, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000204, 'adjustedGift', 'adjustedGift.editCreditCard', 'Credit Card', 6, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000205, 'adjustedGift', 'adjustedGift.editAch', 'ACH', 7, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000150, 'adjustedGift', 'adjustedGift.distribution', 'Gift Distribution', 9, 'ADJUSTED_DISTRIBUTION_LINE_GRID', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000160, 'adjustedGift', 'adjustedGift.extendedDistribution', 'Extended Distribution Lines', 10, 'GRID_HIDDEN_ROW', 'ROLE_USER');

-- Adjustment
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002450, 'adjustedGift.originalGiftId', 0);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002450, 'adjustedGift.currentTotalAdjustedAmount', 25);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002450, 'adjustedGift.currencyCodeReadOnly', 50);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002450, 'adjustedGift.adjustedAmount', 100);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002450, 'adjustedGift.transactionDate', 500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002450, 'adjustedGift.reason', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002450, 'adjustedGift.type', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002450, 'adjustedGift.status', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002450, 'adjustedGift.postedReadOnly', 3300);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002450, 'adjustedGift.postedDate', 3600);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002450, 'adjustedGift.customFieldMap[bank]', 4000);

-- Adjustment Payment
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000200, 'adjustedGift.paymentRequired', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000200, 'adjustedGift.paymentTo', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000200, 'adjustedGift.paymentType', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000200, 'adjustedGift.paymentSource.id', 'paymentSource.id', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000200, 'adjustedGift.address.id', 'address.id', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000200, 'adjustedGift.phone.id', 'phone.id', 14000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000200, 'adjustedGift.customFieldMap[additionalInfo]', 15000);

-- Adjustment Check
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000203, 'adjustedGift.checkNumber', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000203, 'adjustedGift.checkDate', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000203, 'adjustedGift.checkRoutingNumber', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000203, 'adjustedGift.checkAccountNumber', 4000);

-- Adjustment Edit Credit Card
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000204, 'adjustedGift.paymentSource.creditCardHolderNameReadOnly', 'paymentSource.creditCardHolderNameReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000204, 'adjustedGift.paymentSource.creditCardTypeReadOnly', 'paymentSource.creditCardTypeReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000204, 'adjustedGift.paymentSource.creditCardNumberReadOnly', 'paymentSource.creditCardNumberReadOnly', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000204, 'adjustedGift.paymentSource.creditCardExpirationDisplay', 'paymentSource.creditCardExpirationDisplay', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000204, 'adjustedGift.paymentSource.creditCardSecurityCode', 'paymentSource.creditCardSecurityCode', 5000);

-- Adjustment Edit ACH
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000205, 'adjustedGift.paymentSource.achHolderNameReadOnly', 'paymentSource.achHolderNameReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000205, 'adjustedGift.paymentSource.achRoutingNumberReadOnly', 'paymentSource.achRoutingNumberReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000205, 'adjustedGift.paymentSource.achAccountNumberReadOnly', 'paymentSource.achAccountNumberReadOnly', 3000);

-- Distribution Lines
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000150, 'adjustedGift.distributionLines.amount', 'distributionLines.amount', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000150, 'adjustedGift.distributionLines.percentage', 'distributionLines.percentage', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000150, 'adjustedGift.distributionLines.projectCodeReadOnly', 'distributionLines.projectCodeReadOnly', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000150, 'adjustedGift.distributionLines.motivationCodeReadOnly', 'distributionLines.motivationCodeReadOnly', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000150, 'adjustedGift.distributionLines.other_motivationCodeReadOnly', 'distributionLines.other_motivationCodeReadOnly', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000150, 'adjustedGift.distributionLines.customFieldMap[referenceReadOnly]', 'distributionLines.customFieldMap[referenceReadOnly]', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000150, 'adjustedGift.distributionLines.customFieldMap[other_referenceReadOnly]', 'distributionLines.customFieldMap[other_referenceReadOnly]', 7000);

INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[associatedPledgeIdReadOnly]', 'distributionLines.customFieldMap[associatedPledgeIdReadOnly]', 0);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[associatedRecurringGiftIdReadOnly]', 'distributionLines.customFieldMap[associatedRecurringGiftIdReadOnly]', 500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[tributeReadOnly]', 'distributionLines.customFieldMap[tributeReadOnly]', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[tributeReferenceReadOnly]', 'distributionLines.customFieldMap[tributeReferenceReadOnly]', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[other_tributeReferenceReadOnly]', 'distributionLines.customFieldMap[other_tributeReferenceReadOnly]', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[tributeOccasionReadOnly]', 'distributionLines.customFieldMap[tributeOccasionReadOnly]', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[additional_tributeOccasionReadOnly]', 'distributionLines.customFieldMap[additional_tributeOccasionReadOnly]', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[onBehalfOfReadOnly]', 'distributionLines.customFieldMap[onBehalfOfReadOnly]', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[other_onBehalfOfReadOnly]', 'distributionLines.customFieldMap[other_onBehalfOfReadOnly]', 7000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[anonymousReadOnly]', 'distributionLines.customFieldMap[anonymousReadOnly]', 8000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[recognitionNameReadOnly]', 'distributionLines.customFieldMap[recognitionNameReadOnly]', 9000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[notifiedReadOnly]', 'distributionLines.customFieldMap[notifiedReadOnly]', 10000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[other_notifiedReadOnly]', 'distributionLines.customFieldMap[other_notifiedReadOnly]', 11000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[messageReadOnly]', 'distributionLines.customFieldMap[messageReadOnly]', 12000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000160, 'adjustedGift.distributionLines.customFieldMap[taxDeductibleReadOnly]', 'distributionLines.customFieldMap[taxDeductibleReadOnly]', 13000);

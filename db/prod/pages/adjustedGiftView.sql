INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1002460, 'adjustedGiftView', 'adjustedGift.information', 'Adjustment Information', 1, 'TWO_COLUMN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1002470, 'adjustedGiftView', 'adjustedGift.payment', 'Payment Information', 2, 'ONE_COLUMN', 'ROLE_USER');

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1002480, 'adjustedGiftView', 'adjustedGift.creditCard', 'Credit Card', 3, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1002490, 'adjustedGiftView', 'adjustedGift.ach', 'ACH', 4, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1002500, 'adjustedGiftView', 'adjustedGift.check', 'Check', 5, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1002510, 'adjustedGiftView', 'adjustedGift.distribution', 'Gift Distribution', 9, 'ADJUSTED_DISTRIBUTION_LINE_GRID', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1002520, 'adjustedGiftView', 'adjustedGift.extendedDistribution', 'Extended Distribution Lines', 10, 'GRID_HIDDEN_ROW', 'ROLE_USER');

-- Adjustment
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002460, 'adjustedGift.originalGiftId', 0);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002460, 'adjustedGift.currentTotalAdjustedAmount', 25);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002460, 'adjustedGift.currencyCodeReadOnly', 50);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002460, 'adjustedGift.adjustedAmountReadOnly', 100);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002460, 'adjustedGift.transactionDate', 500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002460, 'adjustedGift.reasonReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002460, 'adjustedGift.typeReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002460, 'adjustedGift.statusReadOnly', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002460, 'adjustedGift.postedReadOnly', 3300);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002460, 'adjustedGift.postedDateReadOnly', 3600);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002460, 'adjustedGift.customFieldMap[bankReadOnly]', 4000);
                                                                  
-- Adjustment Payment
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002470, 'adjustedGift.paymentRequiredReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002470, 'adjustedGift.paymentToReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002470, 'adjustedGift.paymentTypeReadOnly', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002470, 'adjustedGift.address.addressLine1ReadOnly', 'address.addressLine1ReadOnly', 7000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002470, 'adjustedGift.address.addressLine2ReadOnly', 'address.addressLine2ReadOnly', 8000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002470, 'adjustedGift.address.addressLine3ReadOnly', 'address.addressLine3ReadOnly', 9000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002470, 'adjustedGift.address.cityReadOnly', 'address.cityReadOnly', 10000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002470, 'adjustedGift.address.stateProvinceReadOnly', 'address.stateProvinceReadOnly', 11000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002470, 'adjustedGift.address.postalCodeReadOnly', 'address.postalCodeReadOnly', 12000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002470, 'adjustedGift.address.countryReadOnly', 'address.countryReadOnly', 13000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002470, 'adjustedGift.phone.numberReadOnly', 'phone.numberReadOnly', 15000);

-- Adjustment Credit Card
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002480, 'adjustedGift.paymentSource.creditCardHolderNameReadOnly', 'paymentSource.creditCardHolderNameReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002480, 'adjustedGift.paymentSource.creditCardTypeReadOnly', 'paymentSource.creditCardTypeReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002480, 'adjustedGift.paymentSource.creditCardNumberReadOnly', 'paymentSource.creditCardNumberReadOnly', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002480, 'adjustedGift.paymentSource.creditCardExpirationDisplay', 'paymentSource.creditCardExpirationDisplay', 4000);

-- Adjustment ACH
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002490, 'adjustedGift.paymentSource.achHolderNameReadOnly', 'paymentSource.achHolderNameReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002490, 'adjustedGift.paymentSource.achRoutingNumberReadOnly', 'paymentSource.achRoutingNumberReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002490, 'adjustedGift.paymentSource.achAccountNumberReadOnly', 'paymentSource.achAccountNumberReadOnly', 3000);

-- Adjustment Check
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002500, 'adjustedGift.checkNumberReadOnly', 1000);

-- Distribution Lines
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002510, 'adjustedGift.distributionLines.amountReadOnly', 'distributionLines.amountReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002510, 'adjustedGift.distributionLines.percentageReadOnly', 'distributionLines.percentageReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002510, 'adjustedGift.distributionLines.projectCodeReadOnly', 'distributionLines.projectCodeReadOnly', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002510, 'adjustedGift.distributionLines.motivationCodeReadOnly', 'distributionLines.motivationCodeReadOnly', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002510, 'adjustedGift.distributionLines.other_motivationCodeReadOnly', 'distributionLines.other_motivationCodeReadOnly', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002510, 'adjustedGift.distributionLines.customFieldMap[referenceReadOnly]', 'distributionLines.customFieldMap[referenceReadOnly]', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002510, 'adjustedGift.distributionLines.customFieldMap[other_referenceReadOnly]', 'distributionLines.customFieldMap[other_referenceReadOnly]', 7000);

INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[associatedPledgeIdReadOnly]', 'distributionLines.customFieldMap[associatedPledgeIdReadOnly]', 0);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[associatedRecurringGiftIdReadOnly]', 'distributionLines.customFieldMap[associatedRecurringGiftIdReadOnly]', 500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[tributeReadOnly]', 'distributionLines.customFieldMap[tributeReadOnly]', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[tributeReferenceReadOnly]', 'distributionLines.customFieldMap[tributeReferenceReadOnly]', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[other_tributeReferenceReadOnly]', 'distributionLines.customFieldMap[other_tributeReferenceReadOnly]', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[tributeOccasionReadOnly]', 'distributionLines.customFieldMap[tributeOccasionReadOnly]', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[additional_tributeOccasionReadOnly]', 'distributionLines.customFieldMap[additional_tributeOccasionReadOnly]', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[onBehalfOfReadOnly]', 'distributionLines.customFieldMap[onBehalfOfReadOnly]', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[other_onBehalfOfReadOnly]', 'distributionLines.customFieldMap[other_onBehalfOfReadOnly]', 7000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[anonymousReadOnly]', 'distributionLines.customFieldMap[anonymousReadOnly]', 8000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[recognitionNameReadOnly]', 'distributionLines.customFieldMap[recognitionNameReadOnly]', 9000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[notifiedReadOnly]', 'distributionLines.customFieldMap[notifiedReadOnly]', 10000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[other_notifiedReadOnly]', 'distributionLines.customFieldMap[other_notifiedReadOnly]', 11000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[messageReadOnly]', 'distributionLines.customFieldMap[messageReadOnly]', 12000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1002520, 'adjustedGift.distributionLines.customFieldMap[taxDeductibleReadOnly]', 'distributionLines.customFieldMap[taxDeductibleReadOnly]', 13000);


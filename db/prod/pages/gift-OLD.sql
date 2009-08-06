INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000008, 'gift', 'gift.donation', 'Donation Information', 1, 'TWO_COLUMN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000030, 'gift', 'gift.payment', 'Payment Information', 2, 'ONE_COLUMN', 'ROLE_USER');

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000009, 'gift', 'gift.creditCard', 'New Credit Card', 3, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000010, 'gift', 'gift.ach', 'New ACH', 4, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000011, 'gift', 'gift.check', 'New Check', 5, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000045, 'gift', 'gift.editCreditCard', 'Credit Card', 6, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000083, 'gift', 'gift.editAch', 'ACH', 7, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000015, 'gift', 'gift.paymentStatus', 'Payment Status', 8, 'TWO_COLUMN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000025, 'gift', 'gift.distribution', 'Gift Distribution', 9, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000140, 'gift', 'gift.extendedDistribution', 'Extended Distribution Lines', 10, 'GRID_HIDDEN_ROW', 'ROLE_USER');

-- Donation
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.amount', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.currencyCode', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.giftStatus', 2500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.customFieldMap[bank]', 2600);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.posted', 2700);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.postedDate', 2900);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.donationDate', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.postmarkDate', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.customFieldMap[source]', 4300);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.associatedPledgeIds', 4500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.associatedRecurringGiftIds', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000008, 'gift.comments', 6000);

-- Payment
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.paymentType', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.selectedPaymentSource', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.selectedAddress', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.address.customFieldMap[addressType]', 'address.customFieldMap[addressType]', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.address.addressLine1', 'address.addressLine1', 7000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.address.addressLine2', 'address.addressLine2', 8000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.address.addressLine3', 'address.addressLine3', 9000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.address.city', 'address.city', 10000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.address.stateProvince', 'address.stateProvince', 11000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.address.postalCode', 'address.postalCode', 12000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.address.country', 'address.country', 13000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.selectedPhone', 14000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.phone.customFieldMap[phoneType]', 'phone.customFieldMap[phoneType]', 14500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000030, 'gift.phone.number', 'phone.number', 15000);

-- Credit Card
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000009, 'gift.paymentSource.creditCardHolderName', 'paymentSource.creditCardHolderName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000009, 'gift.paymentSource.creditCardType', 'paymentSource.creditCardType', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000009, 'gift.paymentSource.creditCardNumber', 'paymentSource.creditCardNumber', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000009, 'gift.paymentSource.creditCardExpiration', 'paymentSource.creditCardExpiration', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000009, 'gift.paymentSource.creditCardSecurityCode', 'paymentSource.creditCardSecurityCode', 5000);

-- ACH
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000010, 'gift.paymentSource.achHolderName', 'paymentSource.achHolderName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000010, 'gift.paymentSource.achRoutingNumber', 'paymentSource.achRoutingNumber', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000010, 'gift.paymentSource.achAccountNumber', 'paymentSource.achAccountNumber', 3000);

-- Check
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000011, 'gift.checkNumber', 1000);

-- Edit Credit Card
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000045, 'gift.selectedPaymentSource.creditCardHolderNameReadOnly', 'selectedPaymentSource.creditCardHolderNameReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000045, 'gift.selectedPaymentSource.creditCardTypeReadOnly', 'selectedPaymentSource.creditCardTypeReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000045, 'gift.selectedPaymentSource.creditCardNumberReadOnly', 'selectedPaymentSource.creditCardNumberReadOnly', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000045, 'gift.selectedPaymentSource.creditCardExpirationDisplay', 'selectedPaymentSource.creditCardExpirationDisplay', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000045, 'gift.selectedPaymentSource.creditCardSecurityCode', 'selectedPaymentSource.creditCardSecurityCode', 5000);

-- Edit ACH
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000083, 'gift.selectedPaymentSource.achHolderNameReadOnly', 'selectedPaymentSource.achHolderNameReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000083, 'gift.selectedPaymentSource.achRoutingNumberReadOnly', 'selectedPaymentSource.achRoutingNumberReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000083, 'gift.selectedPaymentSource.achAccountNumberReadOnly', 'selectedPaymentSource.achAccountNumberReadOnly', 3000);

-- Payment Status
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000015, 'gift.paymentStatusReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000015, 'gift.paymentMessageReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000015, 'gift.txRefNumReadOnly', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000015, 'gift.authCodeReadOnly', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000015, 'gift.avsMessageReadOnly', 5000);

-- Distribution
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000025, 'gift.lineAmount', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000025, 'gift.percentage', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000025, 'gift.projectCode', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000025, 'gift.motivationCode', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000025, 'gift.other_motivationCode', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000025, 'gift.customFieldMap[reference]', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000025, 'gift.customFieldMap[other_reference]', 7000);

INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[associatedPledgeId]', 0);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[associatedRecurringGiftId]', 500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[tribute]', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[tributeReference]', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[other_tributeReference]', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[tributeOccasion]', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[additional_tributeOccasion]', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[onBehalfOf]', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[other_onBehalfOf]', 7000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[anonymous]', 8000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[recognitionName]', 9000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[notified]', 10000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[other_notified]', 11000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[message]', 12000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000140, 'gift.customFieldMap[taxDeductible]', 13000);
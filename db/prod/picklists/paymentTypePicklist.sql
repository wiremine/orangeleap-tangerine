INSERT INTO PICKLIST (PICKLIST_ID, PICKLIST_NAME_ID, PICKLIST_NAME, ENTITY_TYPE, PICKLIST_DESC) VALUES (1000019,'gift.paymentType', 'paymentType', 'gift', 'Gift Payment Type');
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000019, 'Credit Card', 'Credit Card', 'li:has(#selectedPaymentSource)', 1);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000019, 'ACH', 'ACH', 'li:has(#selectedPaymentSource)', 2);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000019, 'Check', 'Check', '.gift_check', 3);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000019, 'Cash', 'Cash', '.gift_cash', 4);

INSERT INTO PICKLIST (PICKLIST_ID, PICKLIST_NAME_ID, PICKLIST_NAME, ENTITY_TYPE, PICKLIST_DESC) VALUES (1000020,'recurringGift.paymentType', 'paymentType', 'recurringGift', 'Recurring Gift Payment Type');
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000020, 'Credit Card', 'Credit Card', '.recurringGift_creditCard', 1);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000020, 'ACH', 'ACH', '.recurringGift_ach', 4);

INSERT INTO PICKLIST (PICKLIST_ID, PICKLIST_NAME_ID, PICKLIST_NAME, ENTITY_TYPE, PICKLIST_DESC) VALUES (1000021,'paymentSource.paymentType', 'paymentType', 'paymentSource', 'Payment Source Payment Type');
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000021, 'Credit Card', 'Credit Card', '.paymentSource_creditCard', 1);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000021, 'ACH', 'ACH', '.paymentSource_ach', 2);

INSERT INTO PICKLIST (PICKLIST_ID, PICKLIST_NAME_ID, PICKLIST_NAME, ENTITY_TYPE, PICKLIST_DESC) VALUES (1000049, 'adjustedGift.paymentType', 'paymentType', 'adjustedGift', 'Gift Payment Type');
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000049, 'Credit Card', 'Credit Card', 'li:has(#selectedPaymentSource),.adjustedGift_editCreditCard', 1);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000049, 'ACH', 'ACH', 'li:has(#selectedPaymentSource),.adjustedGift_editAch', 2);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000049, 'Check', 'Check', '.adjustedGift_check', 3);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (1000049, 'Cash', 'Cash', '.adjustedGift_cash', 4);

INSERT INTO PICKLIST (PICKLIST_ID, PICKLIST_NAME_ID, PICKLIST_NAME, PICKLIST_DESC) VALUES (25,'recurring', 'recurring', 'Recurring');
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (25, 'true', 'Yes', 'li:has(#amountPerGift),li:has(#frequency),li:has(#startDate),li:has(#endDate)', 1);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER) VALUES (25, 'false', 'No', 'li:has(#amountTotal),li:has(#projectedDate)', 2);

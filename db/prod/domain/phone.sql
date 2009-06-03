INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.customFieldMap[phoneType]', 'phone', 'customFieldMap[phoneType]', 'Phone Type', 'MULTI_PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.activationStatus', 'phone', 'activationStatus', 'Phone Status', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.effectiveDate', 'phone', 'effectiveDate', 'Effective Date', 'DATE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.seasonalStartDate', 'phone', 'seasonalStartDate', 'Seasonal Start Date', 'DATE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.seasonalEndDate', 'phone', 'seasonalEndDate', 'Seasonal End Date', 'DATE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.temporaryStartDate', 'phone', 'temporaryStartDate', 'Temporary Start Date', 'DATE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.temporaryEndDate', 'phone', 'temporaryEndDate', 'Temporary End Date', 'DATE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.number', 'phone', 'number', 'Phone Number', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.provider', 'phone', 'provider', 'Provider', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.sms', 'phone', 'sms', 'SMS', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.receiveCorrespondence', 'phone', 'receiveCorrespondence', 'Rec Correspondence - Call', 'CHECKBOX');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.receiveCorrespondenceText', 'phone', 'receiveCorrespondenceText', 'Rec Correspondence - Text', 'CHECKBOX');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.comments', 'phone', 'comments', 'Comments', 'LONG_TEXT');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.numberReadOnly', 'phone', 'number', 'Phone Number', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.userCreated', 'phone', 'userCreated', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.primary', 'phone', 'primary', 'Primary Phone', 'CHECKBOX');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.undeliverable', 'phone', 'undeliverable', 'Undeliverable', 'CHECKBOX');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('phone.inactive', 'phone', 'inactive', 'Inactive', 'CHECKBOX');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('selectedPhone.customFieldMap[phoneTypeReadOnly]', 'selectedPhone', 'customFieldMap[phoneType]', 'Phone Type', 'MULTI_PICKLIST_DISPLAY');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('selectedPhone.numberReadOnly', 'selectedPhone', 'number', 'Phone Number', 'READ_ONLY_TEXT');

INSERT INTO PICKLIST (PICKLIST_ID, PICKLIST_NAME_ID, PICKLIST_NAME, PICKLIST_DESC) VALUES (1000033,'customFieldMap[phoneType]', 'customFieldMap[phoneType]', 'Phone Type');
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER, READ_ONLY) VALUES (1000033, 'unknown', 'Unknown', 1, TRUE);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER) VALUES (1000033, 'home', 'Home', 2);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER) VALUES (1000033, 'work', 'Work', 3);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER) VALUES (1000033, 'mobile', 'Mobile', 4);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER) VALUES (1000033, 'fax', 'Fax', 5);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER) VALUES (1000033, 'main', 'Main', 6);

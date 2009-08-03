INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.id', 'giftInKind', 'id', 'Reference Number', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.transactionDate', 'giftInKind', 'transactionDate', 'Transaction Date', 'DATE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.fairMarketValue', 'giftInKind', 'fairMarketValue', 'Fair Market Value', 'NUMBER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.currencyCode', 'giftInKind', 'currencyCode', 'Currency Code', 'CODE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.donationDate', 'giftInKind', 'donationDate', 'Date of Donation', 'DATE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.motivationCode', 'giftInKind', 'motivationCode', 'Motivation', 'CODE_OTHER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.other_motivationCode', 'giftInKind', 'other_motivationCode', ' ', 'HIDDEN');

-- Privacy
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.anonymous', 'giftInKind', 'anonymous', 'Anonymous', 'CHECKBOX');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.recognitionName', 'giftInKind', 'recognitionName', 'Recognition Name', 'TEXT');

-- Detail
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.details.description', 'giftInKind', 'details', 'Description', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.details.detailFairMarketValue', 'giftInKind', 'details', 'FMV', 'NUMBER');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.details.projectCode', 'giftInKind', 'details', 'Designation', 'CODE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.details.taxDeductible', 'giftInKind', 'details', 'Tax Ded', 'CHECKBOX');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.details.fmvMethod', 'giftInKind', 'details', 'Fair Market Value Method', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.details.gikCategory', 'giftInKind', 'details', 'Category', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('giftInKind.details.quantity', 'giftInKind', 'details', 'Quantity', 'NUMBER');
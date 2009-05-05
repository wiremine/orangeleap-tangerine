INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1000049, 'queryLookup', 'person', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000049, 'person.lastName', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1000049, 'person.firstName', 3000);

// Organization employee relationship
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001050, 'queryLookup', 'person.organizations', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001050, 'person.organizationName', 2000);
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001051, 'queryLookup', 'person.employees', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001051, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001051, 'person.firstName', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001051, 'person.middleName', 5000);

// Head of Household relationship
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001052, 'queryLookup', 'person.headofhousehold', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001052, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001052, 'person.firstName', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001052, 'person.middleName', 5000);
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001053, 'queryLookup', 'person.householdMembers', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001053, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001053, 'person.firstName', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001053, 'person.middleName', 5000);

// Organization hierarchy
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001054, 'queryLookup', 'person.organization.subsidiaryList', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001054, 'person.organizationName', 2000);
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001055, 'queryLookup', 'person.organization.parent', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001055, 'person.organizationName', 2000);

// Sibling relationship
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001056, 'queryLookup', 'person.siblings', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001056, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001056, 'person.firstName', 4000);

// Friend relationship
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001058, 'queryLookup', 'person.friends', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001058, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001058, 'person.firstName', 4000);

// Parent child relationship
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001059, 'queryLookup', 'person.parents', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001059, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001059, 'person.firstName', 4000);
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001060, 'queryLookup', 'person.children', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001060, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001060, 'person.firstName', 4000);

// Spouse relationship
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001061, 'queryLookup', 'person.spouse', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001061, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001061, 'person.firstName', 4000);

// Organization contacts
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001062, 'queryLookup', 'person.accountManager', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001062, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001062, 'person.firstName', 4000);
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001063, 'queryLookup', 'person.accountManagerFor', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001063, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001063, 'person.firstName', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001063, 'person.organizationName', 5000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001064, 'queryLookup', 'person.primaryContacts', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001064, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001064, 'person.firstName', 4000);
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001065, 'queryLookup', 'person.primaryContactFor', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001065, 'person.organizationName', 3000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001066, 'queryLookup', 'person.billingContacts', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001066, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001066, 'person.firstName', 4000);
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001067, 'queryLookup', 'person.billingContactFor', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001067, 'person.organizationName', 3000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001068, 'queryLookup', 'person.salesContacts', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001068, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001068, 'person.firstName', 4000);
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001069, 'queryLookup', 'person.salesContactFor', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001069, 'person.organizationName', 3000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001070, 'queryLookup', 'person.publicRelationsContacts', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001070, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001070, 'person.firstName', 4000);
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001080, 'queryLookup', 'person.publicRelationsContactFor', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001080, 'person.organizationName', 3000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001090, 'queryLookup', 'gift.donation', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001090, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001090, 'person.firstName', 2000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001100, 'queryLookup', 'pledge.info', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001100, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001100, 'person.firstName', 2000);

// Communication History reference
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001700, 'queryLookup', 'communicationHistory', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001700, 'person.lastName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001700, 'person.firstName', 4000);

// Matching reference
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001750, 'queryLookup', 'person.programContact', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001750, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001750, 'person.firstName', 2000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001760, 'queryLookup', 'person.programContactFor', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001760, 'person.organizationName', 1000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001770, 'queryLookup', 'gift.tributeReference', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001770, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001770, 'person.firstName', 2000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001780, 'queryLookup', 'gift.onBehalfOf', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001780, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001780, 'person.firstName', 2000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001790, 'queryLookup', 'gift.notified', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001790, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001790, 'person.firstName', 2000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001791, 'queryLookup', 'pledge.tributeReference', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001791, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001791, 'person.firstName', 2000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001792, 'queryLookup', 'pledge.onBehalfOf', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001792, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001792, 'person.firstName', 2000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001793, 'queryLookup', 'pledge.notified', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001793, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001793, 'person.firstName', 2000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001794, 'queryLookup', 'recurringGift.tributeReference', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001794, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001794, 'person.firstName', 2000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001795, 'queryLookup', 'recurringGift.onBehalfOf', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001795, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001795, 'person.firstName', 2000);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1001796, 'queryLookup', 'recurringGift.notified', ' ', 1, 'GRID', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001796, 'person.lastName', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1001796, 'person.firstName', 2000);

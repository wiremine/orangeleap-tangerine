-- Site
INSERT INTO SITE (SITE_NAME, PARENT_SITE_NAME, CREATE_DATE, UPDATE_DATE, MERCHANT_NUMBER) VALUES ('company1', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '1234-4321');
INSERT INTO SITE (SITE_NAME, PARENT_SITE_NAME, CREATE_DATE, UPDATE_DATE, MERCHANT_NUMBER) VALUES ('company2', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'COMP2-1234');

-- Page Access
INSERT INTO PAGE_ACCESS (ACCESS_TYPE, PAGE_TYPE, ROLE, SITE_NAME) VALUES ('DENIED', 'giftList', 'ROLE_USER', 'company1');
INSERT INTO PAGE_ACCESS (ACCESS_TYPE, PAGE_TYPE, ROLE, SITE_NAME) VALUES ('DENIED', 'giftSearchResults', 'ROLE_USER', 'company1');
INSERT INTO PAGE_ACCESS (ACCESS_TYPE, PAGE_TYPE, ROLE, SITE_NAME) VALUES ('DENIED', 'giftSearch', 'ROLE_USER', 'company1');
INSERT INTO PAGE_ACCESS (ACCESS_TYPE, PAGE_TYPE, ROLE, SITE_NAME) VALUES ('READ_ONLY', 'giftList', 'ROLE_SUPER_USER', 'company1');
INSERT INTO PAGE_ACCESS (ACCESS_TYPE, PAGE_TYPE, ROLE, SITE_NAME) VALUES ('READ_ONLY', 'giftSearch', 'ROLE_SUPER_USER', 'company1');
INSERT INTO PAGE_ACCESS (ACCESS_TYPE, PAGE_TYPE, ROLE, SITE_NAME) VALUES ('READ_ONLY', 'giftSearchResults', 'ROLE_SUPER_USER', 'company1');
INSERT INTO PAGE_ACCESS (ACCESS_TYPE, PAGE_TYPE, ROLE, SITE_NAME) VALUES ('READ_WRITE', 'giftList', 'ROLE_SUPER_MANAGER', 'company1');
INSERT INTO PAGE_ACCESS (ACCESS_TYPE, PAGE_TYPE, ROLE, SITE_NAME) VALUES ('READ_WRITE', 'giftSearch', 'ROLE_SUPER_MANAGER', 'company1');
INSERT INTO PAGE_ACCESS (ACCESS_TYPE, PAGE_TYPE, ROLE, SITE_NAME) VALUES ('READ_WRITE', 'giftSearchResults', 'ROLE_SUPER_MANAGER', 'company1');
INSERT INTO PAGE_ACCESS (ACCESS_TYPE, PAGE_TYPE, ROLE) VALUES ('DENIED', 'person', 'ROLE_DOOFUS');

-- Section Definitions
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (100, 'person', 'person.contactInfo', 'Contact Details', 1, 'TWO_COLUMN', 'ROLE_SUPER_MANAGER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (200, 'person', 'person.demographics', 'Demographic Information', 2, 'TWO_COLUMN', 'ROLE_SUPER_MANAGER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (300, 'person', 'person.relationshipInfo', 'Relationship Information', 3, 'TWO_COLUMN', 'ROLE_SUPER_MANAGER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE, SITE_NAME) VALUES (400, 'gift', 'gift.donation', 'Donation Information', 1, 'TWO_COLUMN', 'ROLE_USER', 'company1');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE, SITE_NAME) VALUES (500, 'gift', 'gift.payment', 'Payment Information', 2, 'ONE_COLUMN', 'ROLE_USER', 'company1');

-- Field Definitions
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.title', 'person', 'title', 'Title', 'PICKLIST', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.firstName', 'person', 'firstName', 'First Name', 'TEXT', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.middleName', 'person', 'middleName', 'Middle Name', 'TEXT', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.lastName', 'person', 'lastName', 'Last Name', 'TEXT', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.suffix', 'person', 'suffix', 'Suffix', 'PICKLIST', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES, SITE_NAME) VALUES ('person.recognitionName', 'person', 'recognitionName', 'Recognition Name', 'TEXT', 'individual', 'company1');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, SITE_NAME) VALUES ('person.emailMap[home]', 'person', 'emailMap[home]', 'Email', 'TEXT', 'company2');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('email.emailAddress', 'email', 'emailAddress', 'Email Address', 'TEXT');

-- Section Fields
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (100, 'person.title', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (100, 'person.firstName', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (100, 'person.middleName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (100, 'person.lastName', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (100, 'person.suffix', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (100, 'person.recognitionName', 6000, 'company1');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (100, 'person.emailMap[home]', 'email.emailAddress', 7000, 'company2');

-- Required Fields
INSERT INTO FIELD_REQUIRED (FIELD_REQUIRED_ID, SITE_NAME, SECTION_NAME, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, REQUIRED) VALUES (100, null, 'person.contactInfo', 'person.firstName', null, TRUE);
INSERT INTO FIELD_REQUIRED (FIELD_REQUIRED_ID, SITE_NAME, SECTION_NAME, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, REQUIRED) VALUES (200, null, 'person.contactInfo', 'person.lastName', null, TRUE);
INSERT INTO FIELD_REQUIRED (FIELD_REQUIRED_ID, SITE_NAME, SECTION_NAME, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, REQUIRED) VALUES (300, 'company2', 'person.contactInfo', 'person.emailMap[home]', 'email.emailAddress', TRUE);



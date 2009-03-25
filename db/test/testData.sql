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
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, SITE_NAME) VALUES ('person.primaryEmail', 'person', 'primaryEmail', 'Email', 'TEXT', 'company1');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('email.emailAddress', 'email', 'emailAddress', 'Email Address', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('email.userCreated', 'email', 'userCreated', ' ', 'HIDDEN');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.spouse]', 'person', 'person', 'customFieldMap[individual.spouse]', 'Spouse', 'QUERY_LOOKUP', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.organizations]', 'person', 'person', 'customFieldMap[individual.organizations]', 'Employers', 'MULTI_QUERY_LOOKUP', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.employees]', 'person', 'person', 'customFieldMap[organization.employees]', 'Employee List', 'MULTI_QUERY_LOOKUP', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.headofhousehold]', 'person', 'person', 'customFieldMap[individual.headofhousehold]', 'Head of Household', 'QUERY_LOOKUP', 'individual,not.headofhousehold');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[headofhousehold.householdMembers]', 'person', 'person', 'customFieldMap[headofhousehold.householdMembers]', 'Household Members', 'MULTI_QUERY_LOOKUP', 'headofhousehold');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, REFERENCE_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.siblings]', 'person', 'person', 'customFieldMap[individual.siblings]', 'Siblings', 'MULTI_QUERY_LOOKUP', 'individual');

-- Section Fields
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (100, 'person.title', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (100, 'person.firstName', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (100, 'person.middleName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (100, 'person.lastName', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (100, 'person.suffix', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (100, 'person.primaryEmail', 'email.emailAddress', 7000, 'company1');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (200, 'person.recognitionName', 6000, 'company1');

-- Required Fields
INSERT INTO FIELD_REQUIRED (FIELD_REQUIRED_ID, SITE_NAME, SECTION_NAME, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, REQUIRED) VALUES (100, null, 'person.contactInfo', 'person.firstName', null, 1);
INSERT INTO FIELD_REQUIRED (FIELD_REQUIRED_ID, SITE_NAME, SECTION_NAME, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, REQUIRED) VALUES (200, null, 'person.contactInfo', 'person.lastName', null, 1);
INSERT INTO FIELD_REQUIRED (FIELD_REQUIRED_ID, SITE_NAME, SECTION_NAME, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, REQUIRED) VALUES (300, 'company1', 'person.contactInfo', 'person.primaryEmail', 'email.emailAddress', 1);

-- Field Validation
INSERT INTO FIELD_VALIDATION (VALIDATION_ID, SITE_NAME, SECTION_NAME, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, VALIDATION_REGEX) VALUES (100, 'company1', 'person.contactInfo', 'person.primaryEmail', 'email.emailAddress', 'extensions:isEmail');

-- Field Conditions
INSERT INTO FIELD_CONDITION (DEPENDENT_FIELD_DEFINITION_ID, DEPENDENT_VALUE, FIELD_REQUIRED_ID, VALIDATION_ID) VALUES ('person.firstName', 'Tom', 200, null);
INSERT INTO FIELD_CONDITION (DEPENDENT_FIELD_DEFINITION_ID, DEPENDENT_VALUE, FIELD_REQUIRED_ID, VALIDATION_ID) VALUES ('person.firstName', 'Jerry', 200, null);
INSERT INTO FIELD_CONDITION (DEPENDENT_FIELD_DEFINITION_ID, DEPENDENT_VALUE, FIELD_REQUIRED_ID, VALIDATION_ID) VALUES ('person.firstName', 'Wilma', 200, null);
INSERT INTO FIELD_CONDITION (DEPENDENT_FIELD_DEFINITION_ID, DEPENDENT_VALUE, FIELD_REQUIRED_ID, VALIDATION_ID) VALUES ('person.firstName', 'Betty', 200, null);
INSERT INTO FIELD_CONDITION (DEPENDENT_FIELD_DEFINITION_ID, DEPENDENT_SECONDARY_FIELD_DEFINITION_ID, DEPENDENT_VALUE, FIELD_REQUIRED_ID, VALIDATION_ID) VALUES ('person.primaryEmail', 'email.userCreated', 'true', null, 100);

-- Field Relationships
INSERT INTO FIELD_RELATIONSHIP (RELATIONSHIP_TYPE, CHECK_RECURSION, MASTER_FIELD_DEFINITION_ID, DETAIL_FIELD_DEFINITION_ID, SITE_NAME) VALUES ('ONE_TO_ONE', FALSE, 'person.customFieldMap[individual.spouse]', 'person.customFieldMap[individual.spouse]', null);
INSERT INTO FIELD_RELATIONSHIP (RELATIONSHIP_TYPE, CHECK_RECURSION, MASTER_FIELD_DEFINITION_ID, DETAIL_FIELD_DEFINITION_ID, SITE_NAME) VALUES ('MANY_TO_MANY', FALSE, 'person.customFieldMap[organization.employees]', 'person.customFieldMap[individual.organizations]', null);
INSERT INTO FIELD_RELATIONSHIP (RELATIONSHIP_TYPE, CHECK_RECURSION, MASTER_FIELD_DEFINITION_ID, DETAIL_FIELD_DEFINITION_ID, SITE_NAME) VALUES ('ONE_TO_MANY', FALSE, 'person.customFieldMap[headofhousehold.householdMembers]', 'person.customFieldMap[individual.headofhousehold]', null);
INSERT INTO FIELD_RELATIONSHIP (RELATIONSHIP_TYPE, CHECK_RECURSION, MASTER_FIELD_DEFINITION_ID, DETAIL_FIELD_DEFINITION_ID, SITE_NAME) VALUES ('MANY_TO_MANY', FALSE, 'person.customFieldMap[individual.spouse]', 'person.customFieldMap[individual.siblings]', null);
INSERT INTO FIELD_RELATIONSHIP (RELATIONSHIP_TYPE, CHECK_RECURSION, MASTER_FIELD_DEFINITION_ID, DETAIL_FIELD_DEFINITION_ID, SITE_NAME) VALUES ('MANY_TO_MANY', FALSE, 'person.customFieldMap[individual.siblings]', 'person.customFieldMap[individual.siblings]', null);

-- Query Lookup & Parameters
INSERT INTO QUERY_LOOKUP (QUERY_LOOKUP_ID, ENTITY_TYPE, SQL_WHERE, FIELD_DEFINITION_ID, SECTION_NAME, SITE_NAME) VALUES (100, 'person', 'constituent_type = ''individual'' AND title = ''Rev.''', 'person.customFieldMap[organization.employees]', 'person.contactInfo', 'company1');
INSERT INTO QUERY_LOOKUP_PARAM (PARAM_NAME, QUERY_LOOKUP_ID) VALUES ('lastName', 100);
INSERT INTO QUERY_LOOKUP_PARAM (PARAM_NAME, QUERY_LOOKUP_ID) VALUES ('firstName', 100);
INSERT INTO QUERY_LOOKUP_PARAM (PARAM_NAME, QUERY_LOOKUP_ID) VALUES ('middleName', 100);

-- Picklist & Picklist Items
INSERT INTO PICKLIST (PICKLIST_ID, PICKLIST_NAME_ID, PICKLIST_NAME, SITE_NAME, MULTISELECT, PICKLIST_DESC) VALUES (100,'constituentIndividualRoles', 'constituentIndividualRoles', 'company1', false, 'Individual Roles');
INSERT INTO PICKLIST_ITEM (PICKLIST_ITEM_ID, PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER, INACTIVE) VALUES (1000, 100, 'donor', 'Donor', 'li:has(.ea-donor)', 100, false);
INSERT INTO PICKLIST_ITEM (PICKLIST_ITEM_ID, PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER, INACTIVE) VALUES (2000, 100, 'sponsor', 'Sponsor', 'li:has(.ea-sponsor)', 200, false);
INSERT INTO PICKLIST_ITEM (PICKLIST_ITEM_ID, PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER, INACTIVE) VALUES (3000, 100, 'affiliate', 'Affiliate', 'li:has(.ea-affiliate)', 300, false);
INSERT INTO PICKLIST_ITEM (PICKLIST_ITEM_ID, PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER, INACTIVE) VALUES (4000, 100, 'volunteer', 'Volunteer', 'li:has(.ea-volunteer)', 400, false);
INSERT INTO PICKLIST_ITEM (PICKLIST_ITEM_ID, PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER, INACTIVE) VALUES (5000, 100, 'member', 'Member', 'li:has(.ea-member)', 500, false);
INSERT INTO PICKLIST_ITEM (PICKLIST_ITEM_ID, PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER, INACTIVE) VALUES (6000, 100, 'prospect', 'Prospect', 'li:has(.ea-prospect)', 600, false);
INSERT INTO PICKLIST_ITEM (PICKLIST_ITEM_ID, PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER, INACTIVE) VALUES (7000, 100, 'alumni', 'Alumni', 'li:has(.ea-alumni)', 700, false);
INSERT INTO PICKLIST_ITEM (PICKLIST_ITEM_ID, PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, SUPPRESS_REFERENCE_VALUE, ITEM_ORDER, INACTIVE) VALUES (8000, 100, 'headofhousehold', 'Head of Household', 'li:has(.ea-headofhousehold)', 'li:has(.ea-not.headofhousehold)', 800, false);
INSERT INTO PICKLIST_ITEM (PICKLIST_ITEM_ID, PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER, INACTIVE) VALUES (9000, 100, 'contact', 'Contact', 900, false);
INSERT INTO PICKLIST_ITEM (PICKLIST_ITEM_ID, PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, REFERENCE_VALUE, ITEM_ORDER, INACTIVE) VALUES (10000, 100, 'user', 'User', 'li:has(.ea-user)', 1000, true);

INSERT INTO PICKLIST (PICKLIST_ID, PICKLIST_NAME_ID, PICKLIST_NAME, ENTITY_TYPE, SITE_NAME, MULTISELECT, PICKLIST_DESC) VALUES (101,'creditCardType', 'creditCardType', 'paymentSource', 'company1', true, 'Credit Card Type');
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER) VALUES (101, 'Visa', 'Visa', 1);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER) VALUES (101, 'Master Card', 'Master Card', 2);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER) VALUES (101, 'American Express', 'American Express', 3);
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER) VALUES (101, 'Discover', 'Discover', 4);

INSERT INTO PICKLIST (PICKLIST_ID, PICKLIST_NAME_ID, PICKLIST_NAME, PICKLIST_DESC) VALUES (102,'currencyCode', 'currencyCode', 'Currency Code');
INSERT INTO PICKLIST_ITEM (PICKLIST_ID, ITEM_NAME, DEFAULT_DISPLAY_VALUE, ITEM_ORDER) VALUES (102,'USD', 'United States of America, Dollars', 0); 

-- Constituent
INSERT INTO CONSTITUENT (CONSTITUENT_ID, CONSTITUENT_TYPE, TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, ORGANIZATION_NAME, SITE_NAME, CREATE_DATE, UPDATE_DATE) VALUES (100, 'individual', 'Rev.', 'Billy', null, 'Graham', null, 'Married', 'Billy Graham Ministries', 'company1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO CONSTITUENT (CONSTITUENT_ID, CONSTITUENT_TYPE, TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, ORGANIZATION_NAME, SITE_NAME, CREATE_DATE, UPDATE_DATE, LOGIN_ID) VALUES (200, 'individual', 'Mr.', 'Pablo', null, 'Picasso', 'Sr', 'Single', 'Painters, Inc.', 'company1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'pablo@company1.com');
INSERT INTO CONSTITUENT (CONSTITUENT_ID, CONSTITUENT_TYPE, TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, ORGANIZATION_NAME, SITE_NAME, CREATE_DATE, UPDATE_DATE) VALUES (300, 'individual', 'Mr.', 'Howdy', null, 'Doody', null, 'Single', 'Howdy Doody Inc', 'company1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Custom Fields


-- Message Resource
INSERT INTO MESSAGE_RESOURCE (LANGUAGE_ABBREVIATION, MESSAGE_KEY, MESSAGE_RESOURCE_TYPE, MESSAGE_VALUE, SITE_NAME) values ('en_US', 'fieldRequiredFailure.gift.amount', 'FIELD_VALIDATION', 'Amount is required', null);
INSERT INTO MESSAGE_RESOURCE (LANGUAGE_ABBREVIATION, MESSAGE_KEY, MESSAGE_RESOURCE_TYPE, MESSAGE_VALUE, SITE_NAME) values ('en_US', 'fieldValidationFailure.gift.amount', 'FIELD_VALIDATION', 'Amount is incorrect', null);
INSERT INTO MESSAGE_RESOURCE (LANGUAGE_ABBREVIATION, MESSAGE_KEY, MESSAGE_RESOURCE_TYPE, MESSAGE_VALUE, SITE_NAME) values ('en_US', 'fieldRequiredFailure.gift.amount', 'FIELD_VALIDATION', 'Amount is required for COMPANY1', "company1");

-- Address
INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS_LINE_1, CITY, STATE_PROVINCE, COUNTRY, POSTAL_CODE, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, INACTIVE, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS) VALUES (100, '3726 THIRD ST', 'Dallas', 'TX', 'US', 75554, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, false, false, 'permanent');
INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS_LINE_1, CITY, STATE_PROVINCE, COUNTRY, POSTAL_CODE, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, INACTIVE, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS) VALUES (200, '406 FAIR OAK DR', 'Dallas', 'TX', 'US', 75479, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, false, true, 'temporary');
INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS_LINE_1, CITY, STATE_PROVINCE, COUNTRY, POSTAL_CODE, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, INACTIVE, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS) VALUES (300, '3709 ASPEN BLVD', 'Dallas', 'TX', 'US', 75238, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, true, false, 'seasonal');
INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS_LINE_1, CITY, STATE_PROVINCE, COUNTRY, POSTAL_CODE, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, INACTIVE, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS) VALUES (400, '5908 ELM RD', 'Dallas', 'TX', 'US', 75347, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, true, false, 'permanent');
INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS_LINE_1, CITY, STATE_PROVINCE, COUNTRY, POSTAL_CODE, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, INACTIVE, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS) VALUES (500, '8457 ACORN', 'Dallas', 'TX', 'US', 75149, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 200, false, false, 'seasonal');
INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS_LINE_1, CITY, STATE_PROVINCE, COUNTRY, POSTAL_CODE, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, INACTIVE, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS) VALUES (600, '3980 LOVERS LN', 'Dallas', 'TX', 'US', 75424, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 200, false, false, 'temporary');
INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS_LINE_1, CITY, STATE_PROVINCE, COUNTRY, POSTAL_CODE, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, INACTIVE, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS) VALUES (700, '784 MOCKINGBIRD', 'Dallas', 'TX', 'US', 75738, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 200, false, false, 'temporary');

-- Phone
INSERT INTO PHONE (PHONE_ID, NUMBER, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (100, '214-443-6829', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, false, 'permanent', false);
INSERT INTO PHONE (PHONE_ID, NUMBER, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (200, '214-105-6590', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, false, 'permanent', false);
INSERT INTO PHONE (PHONE_ID, NUMBER, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (300, '214-911-6681', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, false, 'permanent', false);
INSERT INTO PHONE (PHONE_ID, NUMBER, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (400, '214-129-9781', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, false, 'permanent', false);
INSERT INTO PHONE (PHONE_ID, NUMBER, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (500, '214-548-0929', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, false, 'permanent', false);
INSERT INTO PHONE (PHONE_ID, NUMBER, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (600, '214-878-1663', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, false, 'permanent', false);
INSERT INTO PHONE (PHONE_ID, NUMBER, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (700, '214-113-2542', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 200, false, 'permanent', false);
INSERT INTO PHONE (PHONE_ID, NUMBER, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (800, '214-642-3253', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 200, false, 'permanent', true);
INSERT INTO PHONE (PHONE_ID, NUMBER, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (900, '214-918-9851', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 300, false, 'permanent', false);

-- Email
INSERT INTO EMAIL (EMAIL_ID, EMAIL_ADDRESS, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (100, 'hobo@gmail.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, false, 'permanent', false);
INSERT INTO EMAIL (EMAIL_ID, EMAIL_ADDRESS, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (200, 'samsam@yahoo.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, false, 'permanent', false);
INSERT INTO EMAIL (EMAIL_ID, EMAIL_ADDRESS, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (300, 'brown@aol.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, false, 'permanent', true);
INSERT INTO EMAIL (EMAIL_ID, EMAIL_ADDRESS, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (400, 'hookem@utexas.edu', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 300, false, 'permanent', false);
INSERT INTO EMAIL (EMAIL_ID, EMAIL_ADDRESS, CREATE_DATE, UPDATE_DATE, CONSTITUENT_ID, RECEIVE_CORRESPONDENCE, ACTIVATION_STATUS, INACTIVE) VALUES (500, 'dude@dude.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 300, false, 'permanent', false);

-- Payment Source
insert into PAYMENT_SOURCE (PAYMENT_SOURCE_ID, ACH_ACCOUNT_NUMBER, ACH_HOLDER_NAME, ACH_ROUTING_NUMBER, INACTIVE, PAYMENT_PROFILE, PAYMENT_TYPE, ADDRESS_ID, CONSTITUENT_ID, PHONE_ID)	
					VALUES (100, '000001', 'Joe Blow', '1234', true, 'Joe ACH', 'ACH', 100, 100, 100);

insert into PAYMENT_SOURCE (PAYMENT_SOURCE_ID, CREDIT_CARD_EXPIRATION, CREDIT_CARD_HOLDER_NAME, CREDIT_CARD_NUMBER, CREDIT_CARD_TYPE, INACTIVE, PAYMENT_PROFILE, PAYMENT_TYPE, CONSTITUENT_ID)
					VALUES (200, now(), 'Billy Graham', '4222', 'Visa', false, 'Billy Graham Visa', 'Credit Card', 100);

insert into PAYMENT_SOURCE (PAYMENT_SOURCE_ID, INACTIVE, PAYMENT_TYPE, CONSTITUENT_ID)
					VALUES (300, false, 'Cash', 100);

insert into PAYMENT_SOURCE (PAYMENT_SOURCE_ID, INACTIVE, PAYMENT_TYPE, ADDRESS_ID, CONSTITUENT_ID, PHONE_ID)
					VALUES (400, true, 'Check', 100, 100, 100);

insert into PAYMENT_SOURCE (PAYMENT_SOURCE_ID, ACH_ACCOUNT_NUMBER, ACH_HOLDER_NAME, ACH_ROUTING_NUMBER, INACTIVE, PAYMENT_PROFILE, PAYMENT_TYPE, CONSTITUENT_ID)	
					VALUES (500, '999999', 'Ruth Graham', '1234', false, 'Ruth ACH', 'ACH', 100);

insert into PAYMENT_SOURCE (PAYMENT_SOURCE_ID, CREDIT_CARD_EXPIRATION, CREDIT_CARD_HOLDER_NAME, CREDIT_CARD_NUMBER, CREDIT_CARD_TYPE, INACTIVE, PAYMENT_PROFILE, PAYMENT_TYPE, CONSTITUENT_ID)
					VALUES (600, now(), 'Halle Berry', '3111', 'Discover', false, 'Halle Discover', 'Credit Card', 300);

insert into PAYMENT_SOURCE (PAYMENT_SOURCE_ID, CREDIT_CARD_EXPIRATION, CREDIT_CARD_HOLDER_NAME, CREDIT_CARD_NUMBER, CREDIT_CARD_TYPE, INACTIVE, PAYMENT_PROFILE, PAYMENT_TYPE, CONSTITUENT_ID)
					VALUES (700, now(), 'Charlize Theron', '9999', 'American Express', true, 'Charlize Am Ex', 'Credit Card', 300);
		
-- Commitments
INSERT INTO COMMITMENT (COMMITMENT_ID, COMMITMENT_TYPE, NOTES, AMOUNT_PER_GIFT, AUTO_PAY, RECURRING, STATUS, EMAIL_ID, PAYMENT_SOURCE_ID, CONSTITUENT_ID) VALUES (100, 'RECURRING_GIFT', 'Thank you for your recurring gift', 550, true, false, 'active', 100, 100, 100);
INSERT INTO COMMITMENT (COMMITMENT_ID, COMMITMENT_TYPE, NOTES, PLEDGE_STATUS, AMOUNT_TOTAL, AUTO_PAY, RECURRING, SEND_ACKNOWLEDGMENT, ADDRESS_ID, PHONE_ID, CONSTITUENT_ID) VALUES (200, 'PLEDGE', 'Thank you for your pledge', 'pending', 25, false, true, true, 100, 100, 300);
INSERT INTO COMMITMENT (COMMITMENT_ID, COMMITMENT_TYPE, AMOUNT_PER_GIFT, RECURRING, STATUS, CONSTITUENT_ID) VALUES (300, 'RECURRING_GIFT', 10, true, 'active', 200);
INSERT INTO COMMITMENT (COMMITMENT_ID, COMMITMENT_TYPE, AMOUNT_PER_GIFT, RECURRING, STATUS, CONSTITUENT_ID) VALUES (400, 'RECURRING_GIFT', 2, true, 'cancelled', 300);
					
-- Gifts			
INSERT INTO GIFT (GIFT_ID, GIFT_TYPE, COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, ADDRESS_ID, PHONE_ID, EMAIL_ID, DEDUCTIBLE, ENTRY_TYPE) VALUES (100, 'MONETARY_GIFT', 'Thank you for your support', 1000, 1000, 'Cash', '2007-06-06 10:50:57', 100, 100, 100, 100, true, 'MANUAL');
INSERT INTO GIFT (GIFT_ID, GIFT_TYPE, COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE, ENTRY_TYPE) VALUES (200, 'MONETARY_GIFT', 'Who dat', 25, 20, 'Check', '2007-06-05 10:50:57', 100, false, 'MANUAL');
INSERT INTO GIFT (GIFT_ID, GIFT_TYPE, COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE, ENTRY_TYPE, EMAIL_ID, COMMITMENT_ID) VALUES (300, 'MONETARY_GIFT', 'Straight Cash Homey', 300, 300, 'ACH', '2007-06-04 10:50:57', 200, false, 'MANUAL', 200, 300);
INSERT INTO GIFT (GIFT_ID, GIFT_TYPE, COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE, ENTRY_TYPE, ADDRESS_ID, PAYMENT_SOURCE_ID, COMMITMENT_ID) VALUES (400, 'MONETARY_GIFT', 'Rollin', 99999, 99999, 'Credit Card', '2007-06-03 10:50:57', 200, false, 'MANUAL', 100, 200, 300);
INSERT INTO GIFT (GIFT_ID, GIFT_TYPE, COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE, ENTRY_TYPE, PHONE_ID) VALUES (500, 'MONETARY_GIFT', 'Trippin Out', 1, 1, 'Cash', '2007-06-02 10:50:57', 300, false, 'MANUAL', 100);
INSERT INTO GIFT (GIFT_ID, GIFT_TYPE, COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE, ENTRY_TYPE) VALUES (600, 'MONETARY_GIFT', 'Dude', 0, 0, 'Cash', '2007-06-06 09:00:00', 300, false, 'MANUAL');
INSERT INTO GIFT (GIFT_ID, GIFT_TYPE, COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE, ENTRY_TYPE) VALUES (700, 'GIFT_IN_KIND', 'abc', 10, 10, 'Cash', '2007-06-06 09:00:00', 300, false, 'MANUAL');

-- Recurring Gifts
insert into RECURRING_GIFT (RECURRING_GIFT_ID, NEXT_RUN_DATE, COMMITMENT_ID) values (100, '2007-12-25', 100);
insert into RECURRING_GIFT (RECURRING_GIFT_ID, NEXT_RUN_DATE, COMMITMENT_ID) values (200, '2008-02-14', 300);

-- Distribution Lines
insert into DISTRO_LINE (DISTRO_LINE_ID, AMOUNT, PERCENTAGE, PROJECT_CODE, GIFT_ID)	values (100, 150, 50, '01000', 300);
insert into DISTRO_LINE (DISTRO_LINE_ID, AMOUNT, PERCENTAGE, OTHER_MOTIVATION, GIFT_ID) values (200, 75, 25, 'whoa', 300);
insert into DISTRO_LINE (DISTRO_LINE_ID, AMOUNT, PERCENTAGE, MOTIVATION_CODE, GIFT_ID) values (300, 37.5, 12.5, 'foo', 300);
insert into DISTRO_LINE (DISTRO_LINE_ID, AMOUNT, PERCENTAGE, GIFT_ID) values (400, 37.5, 12.5, 300);

insert into DISTRO_LINE (DISTRO_LINE_ID, AMOUNT, OTHER_MOTIVATION, COMMITMENT_ID) values (500, 20, 'hi mom', 200);
insert into DISTRO_LINE (DISTRO_LINE_ID, AMOUNT, COMMITMENT_ID) values (600, 5, 200);

-- Payment History
insert into PAYMENT_HISTORY (PAYMENT_HISTORY_ID, AMOUNT, CURRENCY_CODE, PAYMENT_DESC, PAYMENT_HISTORY_TYPE, PAYMENT_TYPE, TRANSACTION_DATE, TRANSACTION_ID, GIFT_ID, CONSTITUENT_ID) 
values (100, 0, 'USD', 'Paid in full', 'GIFT', 'Cash', now(), 123456789, 600, 300);

-- Communication History
insert into COMMUNICATION_HISTORY (COMMUNICATION_HISTORY_ID, COMMUNICATION_TYPE, CREATE_DATE, RECORD_DATE, SYSTEM_GENERATED, UPDATE_DATE, COMMITMENT_ID, CONSTITUENT_ID, COMMENTS)
values (100, 'GIFT_RECEIPT', now(), '2009-01-01 08:00:00', false, now(), 100, 100, 'hello there');
insert into COMMUNICATION_HISTORY (COMMUNICATION_HISTORY_ID, COMMUNICATION_TYPE, CREATE_DATE, RECORD_DATE, SYSTEM_GENERATED, UPDATE_DATE, GIFT_ID, CONSTITUENT_ID)
values (200, 'MANUAL', now(), '2009-03-15 15:15:55', true, now(), 600, 300);

-- Gift In Kind
insert into GIFT_IN_KIND (GIFT_IN_KIND_ID, FAIR_MARKET_VALUE, CURRENCY_CODE, DONATION_DATE, MOTIVATION_CODE, 
ANONYMOUS, RECOGNITION_NAME, SEND_ACKNOWLEDGMENT, ACKNOWLEDGMENT_DATE, CONSTITUENT_ID, EMAIL_ID)
values (100, 15.59, 'USD', '2009-01-01 00:00:00', '1234',
true, null, false, null, 100, 100);

insert into GIFT_IN_KIND (GIFT_IN_KIND_ID, FAIR_MARKET_VALUE, CURRENCY_CODE, DONATION_DATE, MOTIVATION_CODE, OTHER_MOTIVATION, 
ANONYMOUS, RECOGNITION_NAME, SEND_ACKNOWLEDGMENT, ACKNOWLEDGMENT_DATE, CONSTITUENT_ID, EMAIL_ID, GIFT_ID)
values (200, 0.99, 'USD', null, null, 'blarg', 
false, 'Joe Blow', true, '2009-03-05 12:00:00', 300, 400, 100);

insert into GIFT_IN_KIND (GIFT_IN_KIND_ID, FAIR_MARKET_VALUE, CURRENCY_CODE, DONATION_DATE, MOTIVATION_CODE, 
ANONYMOUS, RECOGNITION_NAME, SEND_ACKNOWLEDGMENT, ACKNOWLEDGMENT_DATE, CONSTITUENT_ID, EMAIL_ID)
values (300, 50, 'USD', '2009-02-01 00:00:00', '4321',
false, null, true, '2009-03-05 12:00:00', 300, 400);

-- Gift In Kind Details
insert into GIFT_IN_KIND_DETAIL (DESCRIPTION, FAIR_MARKET_VALUE, PROJECT_CODE, FMV_METHOD, CATEGORY, QUANTITY, TAX_DEDUCTIBLE, GIFT_IN_KIND_ID)
values ('foo', 10, '12345', null, 'bo', 1, true, 300);

insert into GIFT_IN_KIND_DETAIL (DESCRIPTION, FAIR_MARKET_VALUE, PROJECT_CODE, FMV_METHOD, CATEGORY, QUANTITY, TAX_DEDUCTIBLE, GIFT_IN_KIND_ID)
values ('bar', 40, '987654321', 'risk analysis', 'jackson', 2, false, 300);

-- Dashboard
INSERT INTO DASHBOARD_ITEM (DASHBOARD_ITEM_ID, DASHBOARD_ITEM_TYPE, DASHBOARD_ITEM_TITLE, URL, ITEM_ORDER, ROLES, SITE_NAME) VALUES (1, 'Pie', 'Gifts By Motivation' , NULL, 1, NULL, NULL);
INSERT INTO DASHBOARD_ITEM (DASHBOARD_ITEM_ID, DASHBOARD_ITEM_TYPE, DASHBOARD_ITEM_TITLE, URL, ITEM_ORDER, ROLES, SITE_NAME) VALUES (2, 'Bar', 'Gifts Over Past Week' , NULL, 2, NULL, NULL);
INSERT INTO DASHBOARD_ITEM (DASHBOARD_ITEM_ID, DASHBOARD_ITEM_TYPE, DASHBOARD_ITEM_TITLE, URL, ITEM_ORDER, ROLES, SITE_NAME) VALUES (3, 'Rss', 'From The Orange Leap Blog' , 'http://blogs.mpowersystems.com/feed/', 3, NULL, NULL);
INSERT INTO DASHBOARD_ITEM (DASHBOARD_ITEM_ID, DASHBOARD_ITEM_TYPE, DASHBOARD_ITEM_TITLE, URL, ITEM_ORDER, ROLES, SITE_NAME) VALUES (4, 'Area', 'Donor Trends' , NULL, 4, NULL, NULL);

INSERT INTO DASHBOARD_ITEM_DATASET (DASHBOARD_ITEM_DATASET_ID, DASHBOARD_ITEM_ID, DATASET_NUM, DATASET_LABEL, SQL_TEXT) VALUES (1, 1, 1, '', 'select dl.MOTIVATION_CODE as "LABEL", SUM(g.AMOUNT) as "DATA_VALUE" from GIFT g inner join CONSTITUENT c on c.CONSTITUENT_ID = g. CONSTITUENT_ID inner join DISTRO_LINE dl on g.GIFT_ID = dl.GIFT_ID where g.TRANSACTION_DATE between CURDATE() and adddate(CURDATE(), 1) and c.SITE_NAME = #siteName# group by dl.MOTIVATION_CODE order by g.TRANSACTION_DATE');
INSERT INTO DASHBOARD_ITEM_DATASET (DASHBOARD_ITEM_DATASET_ID, DASHBOARD_ITEM_ID, DATASET_NUM, DATASET_LABEL, SQL_TEXT) VALUES (2, 2, 1, 'Total Gifts ($)', 'select DATE_FORMAT(g.TRANSACTION_DATE, "%b %e" ) as "LABEL", SUM(g.AMOUNT) as "DATA_VALUE" from GIFT g inner join CONSTITUENT c on c.CONSTITUENT_ID = g.CONSTITUENT_ID where g.TRANSACTION_DATE between adddate(CURDATE(), -7) and adddate(CURDATE(), 1) and c.SITE_NAME = #siteName# group by LABEL order by g.TRANSACTION_DATE');
INSERT INTO DASHBOARD_ITEM_DATASET (DASHBOARD_ITEM_DATASET_ID, DASHBOARD_ITEM_ID, DATASET_NUM, DATASET_LABEL, SQL_TEXT) VALUES (3, 2, 2, 'Largest Gift ($)', 'select DATE_FORMAT(g.TRANSACTION_DATE, "%b %e" ) as "LABEL", MAX(g.AMOUNT) as "DATA_VALUE" from GIFT g inner join CONSTITUENT c on c.CONSTITUENT_ID = g.CONSTITUENT_ID where g.TRANSACTION_DATE between adddate(CURDATE(), -7) and adddate(CURDATE(), 1) and c.SITE_NAME = #siteName# group by LABEL order by g.TRANSACTION_DATE');
INSERT INTO DASHBOARD_ITEM_DATASET (DASHBOARD_ITEM_DATASET_ID, DASHBOARD_ITEM_ID, DATASET_NUM, DATASET_LABEL, SQL_TEXT) VALUES (4, 4, 1, 'Active Donors', 'select DATE_FORMAT(g.TRANSACTION_DATE, "%b" ) as "LABEL", SUM(g.AMOUNT) as "DATA_VALUE" from GIFT g inner join CONSTITUENT c on c.CONSTITUENT_ID = g.CONSTITUENT_ID where g.TRANSACTION_DATE between adddate(CURDATE(), -180) and adddate(CURDATE(), 1) and c.SITE_NAME = #siteName# group by LABEL order by g.TRANSACTION_DATE');
INSERT INTO DASHBOARD_ITEM_DATASET (DASHBOARD_ITEM_DATASET_ID, DASHBOARD_ITEM_ID, DATASET_NUM, DATASET_LABEL, SQL_TEXT) VALUES (5, 4, 2, 'Pledge Donors', 'select DATE_FORMAT(g.TRANSACTION_DATE, "%b" ) as "LABEL", SUM(g.AMOUNT) as "DATA_VALUE" from GIFT g inner join CONSTITUENT c on c.CONSTITUENT_ID = g.CONSTITUENT_ID  inner join COMMITMENT ct on ct.COMMITMENT_ID = g.COMMITMENT_ID where ct.COMMITMENT_TYPE = "Pledge"  and g.TRANSACTION_DATE between adddate(CURDATE(), -180) and adddate(CURDATE(), 1) and c.SITE_NAME = #siteName# group by LABEL order by g.TRANSACTION_DATE');





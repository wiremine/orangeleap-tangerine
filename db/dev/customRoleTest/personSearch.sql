-- ROLE_ADMIN view of person search
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE, SITE_NAME) VALUES (15, 'personSearch', 'personSearch.searchInfo', 'Search People', 1, 'TWO_COLUMN', 'ROLE_ADMIN', 'company1');


-- ROLE_MANAGER view of person search
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE, SITE_NAME) VALUES (16, 'personSearch', 'personSearch.searchInfo', 'Search People', 1, 'TWO_COLUMN', 'ROLE_MANAGER', 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (16, 'person.addressMap[primaryAddress]', 'address.postalCode', 0, 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (16, 'person.addressMap[primaryAddress]', 'address.addressLine1', 0, 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (16, 'person.addressMap[primaryAddress]', 'address.city', 0, 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (16, 'person.addressMap[primaryAddress]', 'address.stateProvince', 0, 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (16, 'person.phoneMap[generic]', 0, 'company1');



-- ROLE_USER view of person search
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE, SITE_NAME) VALUES (17, 'personSearch', 'personSearch.searchInfo', 'Search People', 1, 'TWO_COLUMN', 'ROLE_USER', 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (17, 'person.organizationName', 0, 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (17, 'person.email', 0, 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (17, 'person.addressMap[primaryAddress]', 'address.postalCode', 0, 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (17, 'person.addressMap[primaryAddress]', 'address.addressLine1', 0, 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (17, 'person.addressMap[primaryAddress]', 'address.city', 0, 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (17, 'person.addressMap[primaryAddress]', 'address.stateProvince', 0, 'company1');
--INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME) VALUES (17, 'person.phoneMap[generic]', 0, 'company1');

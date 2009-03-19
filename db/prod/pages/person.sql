INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (1, 'person', 'person.contactInfo', 'Contact Details', 1, 'TWO_COLUMN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (2300, 'person', 'person.matching', 'Matching Information', 2, 'TWO_COLUMN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (110, 'person', 'person.demographics', 'Demographic Information', 3, 'TWO_COLUMN', 'ROLE_USER');
INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (120, 'person', 'person.relationshipInfo', 'Relationship Information', 4, 'TWO_COLUMN', 'ROLE_USER');

// Base record fields
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.accountNumber', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.customFieldMap[accountManager]', 1250);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.constituentType', 1500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.constituentIndividualRoles', 1510);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.constituentOrganizationRoles', 1520);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.title', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.firstName', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.middleName', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.lastName', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.suffix', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.recognitionName', 6010);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.organizationName', 6100);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.customFieldMap[formalSalutation]', 6400);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.customFieldMap[informalSalutation]', 6600);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.customFieldMap[headOfHouseholdSalutation]', 6800);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.legalName', 7100);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.primaryEmail', 'email.emailAddress', 8000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.primaryAddress', 'address.addressLine1', 11000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.primaryAddress', 'address.addressLine2', 12000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.primaryAddress', 'address.postalCode', 14000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.primaryAddress', 'address.city', 15000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.primaryAddress', 'address.stateProvince', 16000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.primaryAddress', 'address.country', 17000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.primaryPhone', 20000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.customFieldMap[organization.website]', 30080);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.customFieldMap[organization.taxid]', 30100);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.ncaisCode', 30150);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.customFieldMap[communicationPreferences]', 30160);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (1, 'person.customFieldMap[emailFormat]', 30170);

// Demographics
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (110, 'person.maritalStatus', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (110, 'person.customFieldMap[individual.spouse]', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (110, 'person.customFieldMap[individual.birthDate]', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (110, 'person.customFieldMap[individual.deceased]', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (110, 'person.customFieldMap[individual.gender]', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (110, 'person.customFieldMap[individual.race]', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (110, 'person.customFieldMap[individual.military]', 7000);

-- Matching
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.matching]', 30060);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.percentMatch]', 30070);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.maximumAnnualLimit]', 30071);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.minimumGiftMatch]', 30072);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.maximumGiftMatch]', 30073);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.totalPerEmployeePerYear]', 30074);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.eligibility]', 30075);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.eligibleFields]', 30076);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.eligibleOrganizations]', 30077);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.ineligibleOrganizations]', 30078);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.onlineMatchingGiftForm]', 30079);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.programStartMonth]', 30080);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.programContact]', 30081);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (2300, 'person.customFieldMap[organization.procedureForRequestingMatch]', 30082);

// Relationships
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.organizations]', 30200);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[organization.employees]', 30300);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.employmentTitle]', 30310);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.headofhousehold]', 30600);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[headofhousehold.householdMembers]', 30700);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[organization.parent]', 32000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[organization.subsidiaryList]', 33000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.parents]', 34000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.children]', 35000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.siblings]', 36000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.friends]', 37000);

INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.accountManagerFor]', 40000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.primaryContactFor]', 41000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.billingContactFor]', 42000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.salesContactFor]', 43000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[individual.publicRelationsContactFor]', 44000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[organization.primaryContacts]', 45000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[organization.billingContacts]', 46000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[organization.salesContacts]', 47000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (120, 'person.customFieldMap[organization.publicRelationsContacts]', 48000);

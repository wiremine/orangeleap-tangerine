INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('person.accountNumber', 'person', 'accountNumber', 'Account Number', 'READ_ONLY_TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('person.id', 'person', 'id', 'Account Number', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('person.constituentType', 'person', 'constituentType', 'Constituent Type', 'PICKLIST');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.constituentIndividualRoles', 'person', 'constituentIndividualRoles', 'Constituent Roles', 'MULTI_PICKLIST', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.constituentOrganizationRoles', 'person', 'constituentOrganizationRoles', 'Constituent Roles', 'MULTI_PICKLIST', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.title', 'person', 'title', 'Title', 'PICKLIST', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.firstName', 'person', 'firstName', 'First Name', 'TEXT', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.middleName', 'person', 'middleName', 'Middle Name', 'TEXT', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.lastName', 'person', 'lastName', 'Last Name', 'TEXT', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.suffix', 'person', 'suffix', 'Suffix', 'PICKLIST', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.recognitionName', 'person', 'recognitionName', 'Recognition Name', 'TEXT', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.organizationName', 'person', 'organizationName', 'Organization Name', 'TEXT', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.legalName', 'person', 'legalName', 'Legal Name', 'TEXT', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('person.emailMap[home]', 'person', 'emailMap[home]', 'Email', 'TEXT');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('person.addressMap[home]', 'person', 'addressMap[home]', ' ', 'ADDRESS');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('person.phoneMap[home]', 'person', 'phoneMap[home].number', 'Home Phone', 'PHONE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('person.phoneMap[work]', 'person', 'phoneMap[work].number', 'Work Phone', 'PHONE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('person.phoneMap[mobile]', 'person', 'phoneMap[mobile].number', 'Mobile Phone', 'PHONE');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES ('person.preferredPhoneType', 'person', 'preferredPhoneType', 'Primary Phone', 'PREFERRED_PHONE_TYPES');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.matching]', 'person', 'customFieldMap[organization.matching]', 'Matching', 'PICKLIST', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.percentMatch]', 'person', 'customFieldMap[organization.percentMatch]', 'Percent Match', 'NUMBER', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.maximumMatch]', 'person', 'customFieldMap[organization.maximumMatch]', 'Maximum Match', 'NUMBER', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.website]', 'person', 'customFieldMap[organization.website]', 'Web Site', 'TEXT', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.taxid]', 'person', 'customFieldMap[organization.taxid]', 'Tax Id', 'TEXT', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.ncaisCode', 'person', 'ncaisCode', 'NCAIS Code', 'PICKLIST', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[communicationPreferences]', 'person', 'customFieldMap[communicationPreferences]', 'Communication Preferences', 'PICKLIST', 'individual,organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[emailFormat]', 'person', 'customFieldMap[emailFormat]', 'Email Format', 'PICKLIST', 'individual,organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.employmentTitle]', 'person', 'customFieldMap[individual.employmentTitle]', 'Employment Title', 'TEXT', 'individual');

// Demographics
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.maritalStatus', 'person', 'maritalStatus', 'Marital Status', 'PICKLIST', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.spouse]', 'person', 'customFieldMap[individual.spouse]', 'Spouse', 'QUERY_LOOKUP', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.birthDate]', 'person', 'customFieldMap[individual.birthDate]', 'Birth Date', 'DATE', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.deceased]', 'person', 'customFieldMap[individual.deceased]', 'Deceased', 'CHECKBOX', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.gender]', 'person', 'customFieldMap[individual.gender]', 'Gender', 'PICKLIST', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.race]', 'person', 'customFieldMap[individual.race]', 'Race', 'PICKLIST', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.military]', 'person', 'customFieldMap[individual.military]', 'Military', 'PICKLIST', 'individual');

// Relationships
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.organizations]', 'person', 'customFieldMap[individual.organizations]', 'Employers', 'MULTI_QUERY_LOOKUP', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.employees]', 'person', 'customFieldMap[organization.employees]', 'Employee List', 'MULTI_QUERY_LOOKUP', 'organization');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.headOfHousehold]', 'person', 'customFieldMap[individual.headOfHousehold]', 'Head of Household', 'QUERY_LOOKUP', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[headOfHousehold.householdMembers]', 'person', 'customFieldMap[headOfHousehold.householdMembers]', 'Household members', 'MULTI_QUERY_LOOKUP', 'headOfHousehold');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.parent]', 'person', 'customFieldMap[organization.parent]', 'Parent Organization', 'QUERY_LOOKUP', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.subsidiaryList]', 'person', 'customFieldMap[organization.subsidiaryList]', 'Subsidiary List', 'MULTI_QUERY_LOOKUP', 'organization');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.friends]', 'person', 'customFieldMap[individual.friends]', 'Friends', 'MULTI_QUERY_LOOKUP', 'individual');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.parents]', 'person', 'customFieldMap[individual.parents]', 'Parents', 'MULTI_QUERY_LOOKUP', 'individual');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.children]', 'person', 'customFieldMap[individual.children]', 'Children', 'MULTI_QUERY_LOOKUP', 'individual');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.accountManager]', 'person', 'customFieldMap[organization.accountManager]', 'Account Manager', 'QUERY_LOOKUP', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.accountManagerFor]', 'person', 'customFieldMap[individual.accountManagerFor]', 'Account Manager For', 'MULTI_QUERY_LOOKUP', 'contact');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.primaryContacts]', 'person', 'customFieldMap[organization.primaryContacts]', 'Primary Contacts', 'MULTI_QUERY_LOOKUP', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.primaryContactFor]', 'person', 'customFieldMap[individual.primaryContactFor]', 'Primary Contact For', 'MULTI_QUERY_LOOKUP', 'contact');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.billingContacts]', 'person', 'customFieldMap[organization.billingContacts]', 'Billing Contacts', 'MULTI_QUERY_LOOKUP', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.billingContactFor]', 'person', 'customFieldMap[individual.billingContactFor]', 'Billing Contact For', 'MULTI_QUERY_LOOKUP', 'contact');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.salesContacts]', 'person', 'customFieldMap[organization.salesContacts]', 'Sales Contacts', 'MULTI_QUERY_LOOKUP', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.salesContactFor]', 'person', 'customFieldMap[individual.salesContactFor]', 'Sales Contact For', 'MULTI_QUERY_LOOKUP', 'contact');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[organization.publicRelationsContacts]', 'person', 'customFieldMap[organization.publicRelationsContacts]', 'Public Relations Contacts', 'MULTI_QUERY_LOOKUP', 'organization');
INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE, ENTITY_ATTRIBUTES) VALUES ('person.customFieldMap[individual.publicRelationsContactFor]', 'person', 'customFieldMap[individual.publicRelationsContactFor]', 'Public Relations Contact For', 'MULTI_QUERY_LOOKUP', 'contact');

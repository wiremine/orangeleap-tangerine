-- Create two new sites company1 and company2

INSERT INTO SITE (SITE_NAME, PARENT_SITE_NAME, CREATE_DATE, UPDATE_DATE, MERCHANT_NUMBER,MERCHANT_BIN,ACH_SITE_NUMBER,ACH_MERCHANT_ID,ACH_RULE_NUMBER,ACH_COMPANY_NAME,ACH_TEST_MODE) VALUES ('company1', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '700000007668','000002',853,11229,5000,'Orange Leap','1');
INSERT INTO SITE (SITE_NAME, PARENT_SITE_NAME, CREATE_DATE, UPDATE_DATE, MERCHANT_NUMBER,MERCHANT_BIN,ACH_SITE_NUMBER,ACH_MERCHANT_ID,ACH_RULE_NUMBER,ACH_COMPANY_NAME,ACH_TEST_MODE) VALUES ('company2', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '700000007668','000002',853,11229,5000,'Orange Leap','1');
INSERT INTO SITE (SITE_NAME, PARENT_SITE_NAME, CREATE_DATE, UPDATE_DATE, MERCHANT_NUMBER,MERCHANT_BIN,ACH_SITE_NUMBER,ACH_MERCHANT_ID,ACH_RULE_NUMBER,ACH_COMPANY_NAME,ACH_TEST_MODE) VALUES ('demo', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '700000007668','000002',853,11229,5000,'Orange Leap','1');
INSERT INTO SITE (SITE_NAME, PARENT_SITE_NAME, CREATE_DATE, UPDATE_DATE, MERCHANT_NUMBER,MERCHANT_BIN,ACH_SITE_NUMBER,ACH_MERCHANT_ID,ACH_RULE_NUMBER,ACH_COMPANY_NAME,ACH_TEST_MODE) VALUES ('sandbox', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '700000007668','000002',853,11229,5000,'Orange Leap','1');
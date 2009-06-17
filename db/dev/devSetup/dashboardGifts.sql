update GIFT set TRANSACTION_DATE = adddate(now(), GIFT_ID-200) where GIFT_ID < 200;
update GIFT set DONATION_DATE = adddate(now(), GIFT_ID-200) where GIFT_ID < 200;
update GIFT set AMOUNT = GIFT_ID where GIFT_ID < 200;
update DISTRO_LINE set MOTIVATION_CODE = "020303" where GIFT_ID > 197 and GIFT_ID <= 199;
update DISTRO_LINE set MOTIVATION_CODE = "020302" where GIFT_ID > 196 and GIFT_ID <= 197;
update DISTRO_LINE set MOTIVATION_CODE = "020301" where GIFT_ID > 195 and GIFT_ID <= 196;
update DISTRO_LINE set MOTIVATION_CODE = "0201" where GIFT_ID > 192 and GIFT_ID <= 195;

update DISTRO_LINE set PROJECT_CODE = "001000" where GIFT_ID > 197 and GIFT_ID <= 199;
update DISTRO_LINE set PROJECT_CODE = "001100" where GIFT_ID > 194 and GIFT_ID <= 197;
update DISTRO_LINE set PROJECT_CODE = "001111" where GIFT_ID > 193 and GIFT_ID <= 194;
update DISTRO_LINE set PROJECT_CODE = "001500" where GIFT_ID > 192 and GIFT_ID <= 193;

INSERT INTO DASHBOARD_ITEM (DASHBOARD_ITEM_ID, DASHBOARD_ITEM_TYPE, DASHBOARD_ITEM_TITLE, URL, ITEM_ORDER, ROLES, SITE_NAME) VALUES (6, 'IFrame', 'The Guru' , '/jasperserver/flow.html?_flowId=viewReportFlow&reportUnit=/Reports/company1/THEGURU_10&standAlone=true&ParentFolderUri=/Reports/company1', 6, NULL, NULL);

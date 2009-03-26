INSERT INTO DASHBOARD_ITEM (DASHBOARD_ITEM_ID, DASHBOARD_ITEM_TYPE, DASHBOARD_ITEM_TITLE, URL, ITEM_ORDER, ROLES, SITE_NAME) VALUES (1, 'Pie', 'Gifts By Motivation' , NULL, 1, NULL, NULL);
INSERT INTO DASHBOARD_ITEM (DASHBOARD_ITEM_ID, DASHBOARD_ITEM_TYPE, DASHBOARD_ITEM_TITLE, URL, ITEM_ORDER, ROLES, SITE_NAME) VALUES (2, 'Bar', 'Gifts Over Past Week' , NULL, 2, NULL, NULL);
INSERT INTO DASHBOARD_ITEM (DASHBOARD_ITEM_ID, DASHBOARD_ITEM_TYPE, DASHBOARD_ITEM_TITLE, URL, ITEM_ORDER, ROLES, SITE_NAME) VALUES (3, 'Rss', 'From The Orange Leap Blog' , 'http://blogs.mpowersystems.com/feed/', 3, NULL, NULL);
INSERT INTO DASHBOARD_ITEM (DASHBOARD_ITEM_ID, DASHBOARD_ITEM_TYPE, DASHBOARD_ITEM_TITLE, URL, ITEM_ORDER, ROLES, SITE_NAME) VALUES (4, 'Area', 'Donor Trends' , NULL, 4, NULL, NULL);

INSERT INTO DASHBOARD_ITEM_DATASET (DASHBOARD_ITEM_DATASET_ID, DASHBOARD_ITEM_ID, DATASET_NUM, DATASET_LABEL, SQL_TEXT) VALUES (1, 1, 1, '', 'select dl.MOTIVATION_CODE as "LABEL", SUM(g.AMOUNT) as "DATA_VALUE" from GIFT g inner join CONSTITUENT c on c.CONSTITUENT_ID = g. CONSTITUENT_ID inner join DISTRO_LINE dl on g.GIFT_ID = dl.GIFT_ID where g.TRANSACTION_DATE between adddate(CURDATE(), -7) and adddate(CURDATE(), 1) and c.SITE_NAME = #siteName# group by dl.MOTIVATION_CODE order by g.TRANSACTION_DATE');
-- Using the motivation code description insteand of code value doesn't leave enough room...
--INSERT INTO DASHBOARD_ITEM_DATASET (DASHBOARD_ITEM_DATASET_ID, DASHBOARD_ITEM_ID, DATASET_NUM, DATASET_LABEL, SQL_TEXT) VALUES (1, 1, 1, '', '
--select pi.DEFAULT_DISPLAY_VALUE as "LABEL", SUM(g.AMOUNT) as "DATA_VALUE" 
--from 
--GIFT g 
--inner join CONSTITUENT c on c.CONSTITUENT_ID = g. CONSTITUENT_ID 
--inner join DISTRO_LINE dl on g.GIFT_ID = dl.GIFT_ID 
--inner join PICKLIST_ITEM pi on dl.MOTIVATION_CODE = pi.ITEM_NAME
--inner join PICKLIST p on p.PICKLIST_ID = pi.PICKLIST_ID
--where 
--p.PICKLIST_NAME_ID = ''motivationCode''
--and p.SITE_NAME = c.SITE_NAME
--and g.TRANSACTION_DATE between adddate(CURDATE(), -7) and adddate(CURDATE(), 1) 
--and c.SITE_NAME = #siteName#
--group by dl.MOTIVATION_CODE 
--order by g.TRANSACTION_DATE
--');
INSERT INTO DASHBOARD_ITEM_DATASET (DASHBOARD_ITEM_DATASET_ID, DASHBOARD_ITEM_ID, DATASET_NUM, DATASET_LABEL, SQL_TEXT) VALUES (2, 2, 1, 'Total Gifts ($)', 'select DATE_FORMAT(g.TRANSACTION_DATE, "%b %e" ) as "LABEL", SUM(g.AMOUNT) as "DATA_VALUE" from GIFT g inner join CONSTITUENT c on c.CONSTITUENT_ID = g.CONSTITUENT_ID where g.TRANSACTION_DATE between adddate(CURDATE(), -7) and adddate(CURDATE(), 1) and c.SITE_NAME = #siteName# group by LABEL order by g.TRANSACTION_DATE');
INSERT INTO DASHBOARD_ITEM_DATASET (DASHBOARD_ITEM_DATASET_ID, DASHBOARD_ITEM_ID, DATASET_NUM, DATASET_LABEL, SQL_TEXT) VALUES (3, 2, 2, 'Largest Gift ($)', 'select DATE_FORMAT(g.TRANSACTION_DATE, "%b %e" ) as "LABEL", MAX(g.AMOUNT) as "DATA_VALUE" from GIFT g inner join CONSTITUENT c on c.CONSTITUENT_ID = g.CONSTITUENT_ID where g.TRANSACTION_DATE between adddate(CURDATE(), -7) and adddate(CURDATE(), 1) and c.SITE_NAME = #siteName# group by LABEL order by g.TRANSACTION_DATE');
INSERT INTO DASHBOARD_ITEM_DATASET (DASHBOARD_ITEM_DATASET_ID, DASHBOARD_ITEM_ID, DATASET_NUM, DATASET_LABEL, SQL_TEXT) VALUES (4, 4, 1, 'Active Donors', 'select DATE_FORMAT(g.TRANSACTION_DATE, "%b" ) as "LABEL", SUM(g.AMOUNT) as "DATA_VALUE" from GIFT g inner join CONSTITUENT c on c.CONSTITUENT_ID = g.CONSTITUENT_ID where g.TRANSACTION_DATE between adddate(CURDATE(), -180) and adddate(CURDATE(), 1) and c.SITE_NAME = #siteName# group by LABEL order by g.TRANSACTION_DATE');
INSERT INTO DASHBOARD_ITEM_DATASET (DASHBOARD_ITEM_DATASET_ID, DASHBOARD_ITEM_ID, DATASET_NUM, DATASET_LABEL, SQL_TEXT) VALUES (5, 4, 2, 'Pledge Donors', 'select DATE_FORMAT(g.TRANSACTION_DATE, "%b" ) as "LABEL", SUM(g.AMOUNT) as "DATA_VALUE" from GIFT g inner join CONSTITUENT c on c.CONSTITUENT_ID = g.CONSTITUENT_ID  inner join COMMITMENT ct on ct.COMMITMENT_ID = g.COMMITMENT_ID where ct.COMMITMENT_TYPE = "Pledge"  and g.TRANSACTION_DATE between adddate(CURDATE(), -180) and adddate(CURDATE(), 1) and c.SITE_NAME = #siteName# group by LABEL order by g.TRANSACTION_DATE');


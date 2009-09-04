-- Flag the major donors in the who have donate at at least $5000 in the past year
-- Must be executed AFTER:
	-- CONSTITUENT insertions (constituentSetup.sql)
	-- GIFT insertions (giftSetup.sql)

-- TODO: increment SEQUENCE_NUMBER?
INSERT INTO CUSTOM_FIELD (FIELD_NAME, FIELD_VALUE, ENTITY_TYPE, ENTITY_ID)
SELECT 'donorProfiles', 'majorDonor', 'constituent', CONSTITUENT_ID FROM GIFT WHERE AMOUNT > 0 AND (TRANSACTION_DATE BETWEEN (DATE_ADD(CURRENT_TIMESTAMP, INTERVAL -1 YEAR)) AND CURRENT_TIMESTAMP) GROUP BY CONSTITUENT_ID HAVING (SUM(AMOUNT)>=5000);

-- Flag the lapsed donors in the DB who have not donated in the past two months
-- Must be executed AFTER:
	-- CONSTITUENT insertions (constituentSetup.sql)
	-- GIFT insertions (giftSetup.sql)

--INSERT INTO CUSTOM_FIELD (FIELD_NAME, FIELD_VALUE, ENTITY_TYPE, ENTITY_ID)
--SELECT 'donorProfiles', 'majorDonor', 'constituent', CONSTITUENT_ID FROM CONSTITUENT WHERE CONSTITUENT_ID NOT IN (SELECT CONSTITUENT_ID FROM GIFT WHERE (VALUE > 0) AND (TRANSACTION_DATE BETWEEN (DATE_ADD(CURRENT_TIMESTAMP, INTERVAL -2 MONTH)) AND CURRENT_TIMESTAMP) GROUP BY CONSTITUENT_ID);
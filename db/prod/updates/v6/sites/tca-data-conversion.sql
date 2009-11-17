SET AUTOCOMMIT = 0;

SELECT count(sf.FIELD_DEFINITION_ID) AS REC_COUNT, 6 AS EXPECTED_COUNT
FROM SECTION_FIELD sf
WHERE sf.SECTION_DEFINITION_ID IN (SELECT SECTION_DEFINITION_ID FROM SECTION_DEFINITION WHERE PAGE_TYPE IN ('gift', 'giftView', 'adjustedGift', 'adjustedGiftView'))
AND sf.SITE_NAME IS NOT NULL;



INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME)
SELECT SECTION_DEFINITION_ID, 'tca-gift.customFieldMap[OtherPayMethodReadOnly]', 1200, 'tca' FROM SECTION_DEFINITION WHERE SECTION_NAME='gift.payment' AND PAGE_TYPE='giftPaid';

INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME)
SELECT SECTION_DEFINITION_ID, 'tca-gift.distributionLines.customFieldMap[campaign]', 5500, 'tca' FROM SECTION_DEFINITION WHERE SECTION_NAME='gift.extendedDistribution' AND PAGE_TYPE='giftPaid';

INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME)
SELECT SECTION_DEFINITION_ID, 'tca-gift.distributionLines.customFieldMap[campaignReadOnly]', 14000, 'tca' FROM SECTION_DEFINITION WHERE SECTION_NAME='adjustedGift.extendedDistribution' AND PAGE_TYPE='adjustedGiftPaid';

-- TANGERINE-1494 
UPDATE SECTION_FIELD SET SECONDARY_FIELD_DEFINITION_ID = 'tca-distributionLines.customFieldMap[campaign]'
WHERE FIELD_DEFINITION_ID = 'tca-gift.distributionLines.customFieldMap[campaign]' AND SECONDARY_FIELD_DEFINITION_ID IS NULL;

UPDATE SECTION_FIELD SET SECONDARY_FIELD_DEFINITION_ID = 'tca-distributionLines.customFieldMap[campaignReadOnly]'
WHERE FIELD_DEFINITION_ID = 'tca-gift.distributionLines.customFieldMap[campaignReadOnly]' AND SECONDARY_FIELD_DEFINITION_ID IS NULL;

COMMIT;

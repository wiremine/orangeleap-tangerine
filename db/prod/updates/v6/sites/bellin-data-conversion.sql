SET AUTOCOMMIT = 0;

SELECT count(sf.FIELD_DEFINITION_ID) AS REC_COUNT, 1 AS EXPECTED_COUNT
FROM SECTION_FIELD sf
WHERE sf.SECTION_DEFINITION_ID IN (SELECT SECTION_DEFINITION_ID FROM SECTION_DEFINITION WHERE PAGE_TYPE IN ('gift', 'giftView', 'adjustedGift', 'adjustedGiftView'))
AND sf.SITE_NAME IS NOT NULL;


INSERT INTO `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`,`DEFAULT_LABEL`,`ENTITY_ATTRIBUTES`,`ENTITY_TYPE`,`FIELD_INFO`,`FIELD_NAME`,`FIELD_TYPE`,`REFERENCE_TYPE`,`SITE_NAME`)
VALUES ('bellin-gift.customFieldMap[OtherPayMethodReadOnly]', 'Other Payment Method', 'OtherPayMethod', 'gift', NULL, 'customFieldMap[OtherPayMethod]', 'PICKLIST_DISPLAY', NULL, 'bellin');


INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER, SITE_NAME)
SELECT SECTION_DEFINITION_ID, 'bellin-gift.customFieldMap[OtherPayMethodReadOnly]', 1200, 'bellin' FROM SECTION_DEFINITION WHERE SECTION_NAME='gift.payment' AND PAGE_TYPE='giftPaid';

COMMIT;
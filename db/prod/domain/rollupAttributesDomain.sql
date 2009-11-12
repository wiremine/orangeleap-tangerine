
INSERT INTO ROLLUP_ATTRIBUTE (ROLLUP_ATTRIBUTE_ID, ATTRIBUTE_DESC, ROLLUP_ENTITY_TYPE, ROLLUP_STAT_TYPE, FIELD_NAME, CUSTOM_FIELD_NAME, SITE_NAME) VALUES (1000001, 'Gift Amount', 'constituent' , 'ROLLUP_GIFT_BY_CONSTITUENT', 'AMOUNT', NULL, NULL);

INSERT INTO ROLLUP_SERIES (ROLLUP_SERIES_ID, SERIES_DESC, SERIES_TYPE, MAINTAIN_PERIODS, FUTURE_PERIODS, KEEP_UNMAINTAINED, SITE_NAME) VALUES (2000001, 'Monthly Total', 'MONTH', 12, 0, TRUE, NULL);

INSERT INTO ROLLUP_SERIES_X_ATTRIBUTE (ROLLUP_SERIES_ID, ROLLUP_ATTRIBUTE_ID) VALUES (2000001, 1000001);




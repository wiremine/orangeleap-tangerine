/*
V7 Schema changes
*********************************************************************
*/

ALTER TABLE CUSTOM_FIELD 
    MODIFY COLUMN (`FIELD_VALUE` text NOT NULL);

ALTER TABLE GIFT 
    ADD COLUMN (`ADJUSTED_AMOUNT` decimal(19,2) default NULL);

# Gift Rollup tables (FKs omitted)

DROP TABLE IF EXISTS `ROLLUP_SERIES`;
DROP TABLE IF EXISTS `rollup_series`;
CREATE TABLE `ROLLUP_SERIES` (
`ROLLUP_SERIES_ID` bigint(20) NOT NULL auto_increment,
`SERIES_DESC` varchar(255) NOT NULL,
`SERIES_TYPE` varchar(255) NOT NULL, 
`MAINTAIN_PERIODS` int(5) default 1 NOT NULL,
`FUTURE_PERIODS` int(5) default 0 NOT NULL,
`KEEP_UNMAINTAINED` char(1) default 'N' NOT NULL,
`SITE_NAME` varchar(255), 
PRIMARY KEY  (`ROLLUP_SERIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ROLLUP_ATTRIBUTE`;
CREATE TABLE `ROLLUP_ATTRIBUTE` (
`ROLLUP_ATTRIBUTE_ID` bigint(20) NOT NULL auto_increment,
`ATTRIBUTE_DESC` varchar(255) NOT NULL,
`ROLLUP_ENTITY_TYPE` varchar(255) NOT NULL,
`ROLLUP_STAT_TYPE` varchar(255) NOT NULL,
`FIELD_NAME` varchar(255),
`CUSTOM_FIELD_NAME` varchar(255),
`SITE_NAME` varchar(255), 
PRIMARY KEY  (`ROLLUP_ATTRIBUTE_ID`),
KEY `KEY_ROLLUP_ATTRIBUTE` (`ROLLUP_ENTITY_TYPE`,`ROLLUP_STAT_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ROLLUP_SERIES_X_ATTRIBUTE`;
CREATE TABLE `ROLLUP_SERIES_X_ATTRIBUTE` (
`ROLLUP_SERIES_ID` bigint(20) NOT NULL,
`ROLLUP_ATTRIBUTE_ID` bigint(20) NOT NULL,
KEY `KEY_ROLLUP_ATTRIBUTE_X_SERIES` (`ROLLUP_ATTRIBUTE_ID`),
UNIQUE KEY `KEY_UNQ_SERIES_X_ATTRIBUTE` (`ROLLUP_SERIES_ID`,`ROLLUP_ATTRIBUTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ROLLUP_VALUE`;
CREATE TABLE `ROLLUP_VALUE` (
`ROLLUP_VALUE_ID` bigint(20) NOT NULL auto_increment,
`ROLLUP_SERIES_ID` bigint(20) NOT NULL,
`ROLLUP_ATTRIBUTE_ID` bigint(20) NOT NULL,
`GROUP_BY_VALUE` varchar(255) NOT NULL,
`START_DATE` datetime NOT NULL,
`END_DATE` datetime NOT NULL,
`CURRENCY_CODE` varchar(255) NOT NULL,
`COUNT_VALUE` decimal(19,2) default '0' NOT NULL,
`SUM_VALUE` decimal(19,2) default '0' NOT NULL,
`MIN_VALUE` decimal(19,2) default '0' NOT NULL,
`MAX_VALUE` decimal(19,2) default '0' NOT NULL,
`SITE_NAME` varchar(255) NOT NULL, 
PRIMARY KEY  (`ROLLUP_VALUE_ID`),
KEY `KEY_ROLLUP_VALUE` (`GROUP_BY_VALUE`,`ROLLUP_ATTRIBUTE_ID`,`START_DATE`,`END_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE OR REPLACE VIEW `V_ROLLUP_VALUE` AS
select 
ROLLUP_VALUE_ID,
ROLLUP_VALUE.ROLLUP_SERIES_ID,
ROLLUP_VALUE.ROLLUP_ATTRIBUTE_ID,
GROUP_BY_VALUE,
START_DATE,
END_DATE,
CURRENCY_CODE,
COUNT_VALUE,
SUM_VALUE,
MIN_VALUE,
MAX_VALUE,
ATTRIBUTE_DESC,
ROLLUP_ENTITY_TYPE,
ROLLUP_STAT_TYPE,
FIELD_NAME,
CUSTOM_FIELD_NAME,
SERIES_DESC,
SERIES_TYPE,
MAINTAIN_PERIODS,
FUTURE_PERIODS,
KEEP_UNMAINTAINED,
ROLLUP_VALUE.SITE_NAME
from 
ROLLUP_VALUE, 
ROLLUP_ATTRIBUTE, 
ROLLUP_SERIES 
where 
ROLLUP_VALUE.ROLLUP_SERIES_ID = ROLLUP_SERIES.ROLLUP_SERIES_ID 
and ROLLUP_VALUE.ROLLUP_ATTRIBUTE_ID = ROLLUP_ATTRIBUTE.ROLLUP_ATTRIBUTE_ID;
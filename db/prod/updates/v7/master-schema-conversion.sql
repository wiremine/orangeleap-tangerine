/*
V7 Schema changes
*********************************************************************
*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

ALTER TABLE CUSTOM_FIELD 
    MODIFY COLUMN `FIELD_VALUE` text NOT NULL;

ALTER TABLE GIFT 
    ADD COLUMN (`ADJUSTED_AMOUNT` decimal(19,2) default NULL);

ALTER TABLE SECTION_DEFINITION
    ADD COLUMN (`DISPLAY_COLLAPSED` char(1) NOT NULL default '0');

ALTER TABLE CONSTITUENT
    ADD COLUMN (`RECENT_GIFT` char(1) NOT NULL default '0');

# Gift Rollup tables (FKs omitted)

DROP TABLE IF EXISTS `ROLLUP_SERIES`;
CREATE TABLE `ROLLUP_SERIES` (
`ROLLUP_SERIES_ID` bigint(20) NOT NULL auto_increment,
`SERIES_NAME_ID` varchar(255) NOT NULL,
`SERIES_DESC` varchar(255) NOT NULL,
`SERIES_TYPE` varchar(255) NOT NULL, 
`MAINTAIN_PERIODS` int(5) default 1 NOT NULL,
`FUTURE_PERIODS` int(5) default 0 NOT NULL,
`KEEP_UNMAINTAINED` char(1) default 'N' NOT NULL,
`SITE_NAME` varchar(255), 
PRIMARY KEY  (`ROLLUP_SERIES_ID`),
UNIQUE KEY `IDX_SERIES_NAME_ID` (`SERIES_NAME_ID`,`SITE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ROLLUP_ATTRIBUTE`;
CREATE TABLE `ROLLUP_ATTRIBUTE` (
`ROLLUP_ATTRIBUTE_ID` bigint(20) NOT NULL auto_increment,
`ATTRIBUTE_NAME_ID` varchar(255) NOT NULL,
`ATTRIBUTE_DESC` varchar(255) NOT NULL,
`ROLLUP_ENTITY_TYPE` varchar(255) NOT NULL,
`ROLLUP_STAT_TYPE` varchar(255) NOT NULL,
`FIELD_NAME` varchar(255),
`CUSTOM_FIELD_NAME` varchar(255),
`SITE_NAME` varchar(255), 
PRIMARY KEY  (`ROLLUP_ATTRIBUTE_ID`),
UNIQUE KEY `IDX_SERIES_NAME_ID` (`ATTRIBUTE_NAME_ID`,`SITE_NAME`),
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
ATTRIBUTE_NAME_ID,
ATTRIBUTE_DESC,
ROLLUP_ENTITY_TYPE,
ROLLUP_STAT_TYPE,
FIELD_NAME,
CUSTOM_FIELD_NAME,
SERIES_NAME_ID,
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

/* TANGERINE-1042 & TANGERINE-1583 */
ALTER TABLE POST_BATCH
  DROP FOREIGN KEY FK_POST_BATCH_REVIEW_SET_GENERATED_BY_ID,
  DROP COLUMN REVIEW_SET_GENERATED,
  DROP COLUMN REVIEW_SET_SIZE,
  DROP COLUMN BATCH_UPDATED,
  DROP COLUMN BATCH_UPDATED_BY_ID, 
  DROP COLUMN BATCH_UPDATED_DATE,
  DROP COLUMN REVIEW_SET_GENERATED_BY_ID,
  DROP COLUMN REVIEW_SET_GENERATED_DATE,
  DROP COLUMN POST_BATCH_DESC,
  ADD COLUMN (`BATCH_CREATED_BY_ID` bigint(20) default NULL),
  ADD COLUMN (`BATCH_CREATED_DATE` datetime default NULL),
  ADD COLUMN (`EXECUTED` char(1) NOT NULL default '0'),
  ADD COLUMN (`EXECUTED_BY_ID` bigint(20) default NULL),
  ADD COLUMN (`EXECUTED_DATE` datetime default NULL),
  ADD COLUMN (`IS_ERROR_BATCH` char(1) NOT NULL default '0'),
  ADD COLUMN (`ERROR_BATCH_ID` bigint(20) default NULL),
  ADD COLUMN (`POST_BATCH_DESC` varchar(255) NULL),
  ADD COLUMN (`IS_CURRENTLY_EXECUTING` char(1) NOT NULL default '0'),
  ADD COLUMN (`IS_FOR_TOUCH_POINTS` char(1) NOT NULL default '0'),
  ADD CONSTRAINT `FK_POST_BATCH_CREATED_BY_ID` FOREIGN KEY (`BATCH_CREATED_BY_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`);

ALTER TABLE JOURNAL
  DROP FOREIGN KEY FK_JOURNAL_POST_BATCH_ID;

ALTER TABLE JOURNAL
  DROP COLUMN POST_BATCH_ID;

ALTER TABLE JOURNAL
  ADD COLUMN (POST_BATCH_ID bigint(20) NOT NULL);

DROP TABLE IF EXISTS `POST_BATCH_REVIEW_SET_ITEM`;
DROP TABLE IF EXISTS `POST_BATCH_ENTRY`;
CREATE TABLE `POST_BATCH_ENTRY` (
`POST_BATCH_ENTRY_ID` bigint(20) NOT NULL auto_increment,
`POST_BATCH_ID` bigint(20) NOT NULL,
`SEGMENTATION_ID` bigint(20) NULL,
`CONSTITUENT_ID` bigint(20) NULL,
`GIFT_ID` bigint(20) NULL,
`ADJUSTED_GIFT_ID` bigint(20) NULL,
`PLEDGE_ID` bigint(20) NULL,
`CREATE_DATE` datetime default NULL,
`UPDATE_DATE` datetime default NULL,
PRIMARY KEY  (`POST_BATCH_ENTRY_ID`),
CONSTRAINT `FK_POST_BATCH_ENTRY_BATCH_ID` FOREIGN KEY (`POST_BATCH_ID`) REFERENCES `POST_BATCH` (`POST_BATCH_ID`),
CONSTRAINT `FK_POST_BATCH_ENTRY_CONSTITUENT_ID` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`),
CONSTRAINT `FK_POST_BATCH_ENTRY_GIFT_ID` FOREIGN KEY (`GIFT_ID`) REFERENCES `GIFT` (`GIFT_ID`),
CONSTRAINT `FK_POST_BATCH_ENTRY_ADJ_GIFT_ID` FOREIGN KEY (`ADJUSTED_GIFT_ID`) REFERENCES `ADJUSTED_GIFT` (`ADJUSTED_GIFT_ID`),
CONSTRAINT `FK_POST_BATCH_ENTRY_PLEDGE_ID` FOREIGN KEY (`PLEDGE_ID`) REFERENCES `PLEDGE` (`PLEDGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `POST_BATCH_ENTRY_ERROR`;

CREATE TABLE `POST_BATCH_ENTRY_ERROR` (
`POST_BATCH_ENTRY_ERROR_ID` bigint(20) NOT NULL auto_increment,
`POST_BATCH_ENTRY_ID` bigint(20) NOT NULL,
`ERROR_MSG` text NOT NULL,
PRIMARY KEY  (`POST_BATCH_ENTRY_ERROR_ID`),
CONSTRAINT `FK_POST_BATCH_ENTRY_ID` FOREIGN KEY (`POST_BATCH_ENTRY_ID`) REFERENCES `POST_BATCH_ENTRY` (`POST_BATCH_ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE COMMUNICATION_HISTORY
	ADD COLUMN (`ADJUSTED_GIFT_ID` bigint(20) default NULL);

/* TANGERINE-1592 & 1534 */
ALTER TABLE GIFT
ADD COLUMN (`CHECK_DATE` datetime default NULL);

ALTER TABLE ADJUSTED_GIFT
ADD COLUMN (`CHECK_DATE` datetime default NULL);

ALTER TABLE PAYMENT_SOURCE
ADD COLUMN (`CHECK_HOLDER_NAME` varchar(255) default NULL),
ADD COLUMN (`CHECK_ACCOUNT_NUMBER` varchar(255) DEFAULT NULL),
ADD COLUMN (`CHECK_ROUTING_NUMBER` varchar(255) DEFAULT NULL);


----- START RULES TABLES -----


-- Contains the runnable code generated from rules tables: one live, and optionally one test version of each set of rules for each event type.

DROP TABLE IF EXISTS `RULE_GENERATED_CODE`;
CREATE TABLE `RULE_GENERATED_CODE` (
`RULE_GENERATED_CODE_ID` bigint(20) NOT NULL auto_increment,
`RULE_EVENT_TYPE_NAME_ID` varchar(255),
`IS_TEST_ONLY` char(1) default 'N' NOT NULL,
`GENERATED_CODE_TEXT` text NOT NULL,
`SITE_NAME` varchar(255) NOT NULL, 
`CREATE_DATE` datetime default NULL,
`UPDATE_DATE` datetime default NULL,
PRIMARY KEY  (`RULE_GENERATED_CODE_ID`),
UNIQUE KEY `IDX_RULE_GENERATED_CODE` (`RULE_EVENT_TYPE_NAME_ID`,`IS_TEST_ONLY`,`SITE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Code interceptor points (static list of code events, determines context parms)

DROP TABLE IF EXISTS `RULE_EVENT_TYPE`;
CREATE TABLE `RULE_EVENT_TYPE` (
`RULE_EVENT_TYPE_ID` bigint(20) NOT NULL auto_increment,
`RULE_EVENT_TYPE_NAME_ID` varchar(255) NOT NULL,
`RULE_EVENT_TYPE_DESC` varchar(255),
PRIMARY KEY  (`RULE_EVENT_TYPE_ID`),
UNIQUE KEY `IDX_RULE_EVENT_TYPE` (`RULE_EVENT_TYPE_NAME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DSL (semi-static, not site specific)

DROP TABLE IF EXISTS `RULE_SEGMENT_TYPE`;
CREATE TABLE `RULE_SEGMENT_TYPE` (
`RULE_SEGMENT_TYPE_ID` bigint(20) NOT NULL auto_increment,
`RULE_SEGMENT_TYPE_TYPE` varchar(255), -- condition or consequence
`RULE_SEGMENT_TYPE_PHRASE` varchar(255),
`RULE_SEGMENT_TYPE_TEXT` text,
`SITE_NAME` varchar(255) NOT NULL, 
PRIMARY KEY  (`RULE_SEGMENT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `RULE_SEGMENT_TYPE_PARM`;
CREATE TABLE `RULE_SEGMENT_TYPE_PARM` (
`RULE_SEGMENT_TYPE_PARM_ID` bigint(20) NOT NULL auto_increment,
`RULE_SEGMENT_TYPE_ID` bigint(20) NOT NULL,
`RULE_SEGMENT_TYPE_PARM_SEQ` bigint(20) NOT NULL,
`RULE_SEGMENT_TYPE_PARM_TYPE` varchar(255) NOT NULL, 
`RULE_SEGMENT_TYPE_PARM_PICKLIST_NAME_ID` varchar(255), 
PRIMARY KEY  (`RULE_SEGMENT_TYPE_PARM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE`;
CREATE TABLE `RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE` (
`RULE_EVENT_TYPE_ID` bigint(20) NOT NULL,
`RULE_SEGMENT_TYPE_ID` bigint(20) NOT NULL,
UNIQUE KEY `KEY_UNQ_RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE` (`RULE_EVENT_TYPE_ID`,`RULE_SEGMENT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DSLR (maintained by wizard)

DROP TABLE IF EXISTS `RULE`;
CREATE TABLE `RULE` (
`RULE_ID` bigint(20) NOT NULL auto_increment,
`RULE_EVENT_TYPE_NAME_ID` varchar(255),
`RULE_SEQ` bigint(20) NOT NULL,
`RULE_DESC` varchar(255) NOT NULL,
`RULE_IS_ACTIVE` char(1) default 'N' NOT NULL,
`SITE_NAME` varchar(255) NOT NULL, 
PRIMARY KEY  (`RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `RULE_VERSION`;
CREATE TABLE `RULE_VERSION` (
`RULE_VERSION_ID` bigint(20) NOT NULL auto_increment,
`RULE_ID` bigint(20) NOT NULL,
`RULE_VERSION_SEQ` bigint(20) NOT NULL,
`UPDATED_BY` varchar(255) NOT NULL, 
`CREATE_DATE` datetime default NULL,
`UPDATE_DATE` datetime default NULL,
PRIMARY KEY (`RULE_VERSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `RULE_SEGMENT`;
CREATE TABLE `RULE_SEGMENT` (
`RULE_SEGMENT_ID` bigint(20) NOT NULL auto_increment,
`RULE_VERSION_ID` bigint(20) NOT NULL,
`RULE_SEGMENT_SEQ` bigint(20) NOT NULL,
`RULE_SEGMENT_TYPE_ID` bigint(20) NOT NULL,
PRIMARY KEY (`RULE_SEGMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `RULE_SEGMENT_PARM`;
CREATE TABLE `RULE_SEGMENT_PARM` (
`RULE_SEGMENT_PARM_ID` bigint(20) NOT NULL auto_increment,
`RULE_SEGMENT_ID` bigint(20) NOT NULL,
`RULE_SEGMENT_PARM_SEQ` bigint(20) NOT NULL,
`RULE_SEGMENT_PARM_STRING_VALUE` varchar(255), -- can be alphanumeric string only 
`RULE_SEGMENT_PARM_NUMERIC_VALUE` decimal(19,2), 
`RULE_SEGMENT_PARM_DATE_VALUE` datetime, 
PRIMARY KEY  (`RULE_SEGMENT_PARM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


----- END RULES TABLES -----
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;




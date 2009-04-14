
SET foreign_key_checks = 0;

# Dump of table SITE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SITE`;

CREATE TABLE `SITE` (
  `SITE_NAME` varchar(255) NOT NULL,
  `MERCHANT_NUMBER` varchar(255) default NULL,
  `MERCHANT_BIN` varchar(255) default NULL,
  `LOCALE` varchar(255) default NULL,
  `TIME_ZONE` varchar(255) default NULL,
  `ACTIVE` char(1) default '1',
  `PARENT_SITE_NAME` varchar(255) default NULL,
  `ACH_SITE_NUMBER` bigint(20) default 0,
  `ACH_MERCHANT_ID` bigint(20) default 0,
  `ACH_RULE_NUMBER` bigint(20) default 0,
  `ACH_COMPANY_NAME` varchar(128) default NULL,
  `ACH_TEST_MODE` char(1) default 0,
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`SITE_NAME`),
  KEY `FK_SITE_PARENT_SITE` (`PARENT_SITE_NAME`),
  CONSTRAINT `FK_SITE_PARENT_SITE` FOREIGN KEY (`PARENT_SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table CUSTOM_FIELD
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CUSTOM_FIELD`;

CREATE TABLE `CUSTOM_FIELD` (
  `CUSTOM_FIELD_ID` bigint(20) NOT NULL auto_increment,
  `FIELD_NAME` varchar(255) NOT NULL,
  `FIELD_VALUE` text,
  `ENTITY_TYPE` varchar(255) default NULL,
  `ENTITY_ID` bigint(20) default NULL,
  `SEQUENCE_NUM` int default 0,
  `START_DATE` datetime default '1900-01-01',
  `END_DATE` datetime default '3000-01-01',
  PRIMARY KEY  (`CUSTOM_FIELD_ID`),
  INDEX `CUSTOM_FIELD_ENTITY_IDX` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table CONSTITUENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CONSTITUENT`;

CREATE TABLE `CONSTITUENT` (
  `CONSTITUENT_ID` bigint(20) NOT NULL auto_increment,
  `CONSTITUENT_INDIVIDUAL_ROLES` varchar(255) default NULL,
  `CONSTITUENT_ORGANIZATION_ROLES` varchar(255) default NULL,
  `CONSTITUENT_TYPE` varchar(255) default NULL,
  `FIRST_NAME` varchar(255) default NULL,
  `LAST_NAME` varchar(255) default NULL,
  `LEGAL_NAME` varchar(255) default NULL,
  `LOGIN_ID` varchar(255) default NULL,
  `MARITAL_STATUS` varchar(255) default NULL,
  `MIDDLE_NAME` varchar(255) default NULL,
  `NCAIS_CODE` varchar(255) default NULL,
  `ORGANIZATION_NAME` varchar(255) default NULL,
  `PREFERRED_PHONE_TYPE` varchar(255) default NULL,
  `RECOGNITION_NAME` varchar(255) default NULL,
  `SUFFIX` varchar(255) default NULL,
  `TITLE` varchar(255) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  `CUSTOM_ID` varchar(255) default NULL,
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`CONSTITUENT_ID`),
  UNIQUE KEY `SITE_CUSTOM_ID` (`SITE_NAME`,`CUSTOM_ID`),
  KEY `FK_CONSTITUENT_SITE` (`SITE_NAME`),
  CONSTRAINT `FK_CONSTITUENT_SITE` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


# Dump of table DASHBOARD_ITEM
# Corresponds to a graph on the dashboard
# If site is null applies to all sites.  If role is null applies to all roles.
# Type is "Pie" (can only have one dataset), "Area", "Bar", or "Rss" (uses URL)
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DASHBOARD_ITEM`;

CREATE TABLE `DASHBOARD_ITEM` (
  `DASHBOARD_ITEM_ID` bigint(20) NOT NULL auto_increment,
  `DASHBOARD_ITEM_TYPE` varchar(255) NOT NULL,
  `DASHBOARD_ITEM_TITLE` varchar(255) NOT NULL,
  `URL` varchar(255) default NULL,
  `ITEM_ORDER` int(11) default NULL,
  `ROLES` varchar(255) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`DASHBOARD_ITEM_ID`),
  KEY `FK_DASHBOARD_ITEM` (`SITE_NAME`),
  CONSTRAINT `FK_DASHBOARD_ITEM` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


# Dump of table DASHBOARD_ITEM
# SQL must return "LABEL", "DATA_VALUE" column names in order
# Multiple datasets for display in the same dashboard item must match lables and number of results
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DASHBOARD_ITEM_DATASET`;

CREATE TABLE `DASHBOARD_ITEM_DATASET` (
  `DASHBOARD_ITEM_DATASET_ID` bigint(20) NOT NULL auto_increment,
  `DASHBOARD_ITEM_ID` bigint(20) NOT NULL,
  `DATASET_NUM` int(11) default 0,
  `DATASET_LABEL` varchar(255) NOT NULL,
  `SQL_TEXT` text NOT NULL,
  PRIMARY KEY  (`DASHBOARD_ITEM_DATASET_ID`),
  KEY `FK_DASHBOARD_ITEM_DATASET` (`DASHBOARD_ITEM_ID`),
  CONSTRAINT `FK_DASHBOARD_ITEM_DATASET` FOREIGN KEY (`DASHBOARD_ITEM_ID`) REFERENCES `DASHBOARD_ITEM` (`DASHBOARD_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PICKLIST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PICKLIST`;

CREATE TABLE `PICKLIST` (
  `PICKLIST_ID` bigint(20) NOT NULL auto_increment,
  `PICKLIST_NAME_ID` varchar(255) NOT NULL,
  `PICKLIST_DESC` varchar(255) NOT NULL,
  `ENTITY_TYPE` varchar(255) default NULL,
  `MULTISELECT` char(1) NOT NULL default '0',
  `PICKLIST_NAME` varchar(255) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`PICKLIST_ID`),
  UNIQUE KEY `SITE_NAME` (`SITE_NAME`,`PICKLIST_NAME`,`ENTITY_TYPE`),
  KEY `FK_PICKLIST_SITE` (`SITE_NAME`),
  CONSTRAINT `FK_PICKLIST_SITE` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PICKLIST_ITEM
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PICKLIST_ITEM`;

CREATE TABLE `PICKLIST_ITEM` (
  `PICKLIST_ITEM_ID` bigint(20) NOT NULL auto_increment,
  `DEFAULT_DISPLAY_VALUE` varchar(255) default NULL,
  `INACTIVE` char(1) NOT NULL default '0',
  `READ_ONLY` char(1) NOT NULL default '0',
  `ITEM_NAME` varchar(255) NOT NULL,
  `ITEM_ORDER` int(11) default NULL,
  `REFERENCE_VALUE` varchar(255) default NULL,
  `SUPPRESS_REFERENCE_VALUE` varchar(255) default NULL,
  `PICKLIST_ID` bigint(20) default NULL,
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`PICKLIST_ITEM_ID`),
  UNIQUE KEY `PICKLIST_ITEM_NAME` (`PICKLIST_ID`,`ITEM_NAME`),
  UNIQUE KEY `PICKLIST_ITEM_VALUE` (`PICKLIST_ID`,`DEFAULT_DISPLAY_VALUE`),
  KEY `FK_PICKLIST_ITEM_PICKLIST` (`PICKLIST_ID`),
  CONSTRAINT `FK_PICKLIST_ITEM_PICKLIST` FOREIGN KEY (`PICKLIST_ID`) REFERENCES `PICKLIST` (`PICKLIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ADDRESS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ADDRESS`;

CREATE TABLE `ADDRESS` (
  `ADDRESS_ID` bigint(20) NOT NULL auto_increment,
  `ACTIVATION_STATUS` varchar(255) default NULL,
  `ADDRESS_LINE_1` varchar(255) default NULL,
  `ADDRESS_LINE_2` varchar(255) default NULL,
  `ADDRESS_LINE_3` varchar(255) default NULL,
  `CITY` varchar(255) default NULL,
  `COMMENT` varchar(255) default NULL,
  `COUNTRY` varchar(255) default NULL,
  `EFFECTIVE_DATE` datetime default NULL,
  `INACTIVE` char(1) NOT NULL default '0',
  `POSTAL_CODE` varchar(255) default NULL,
  `RECEIVE_CORRESPONDENCE` char(1) NOT NULL default '0',
  `SEASONAL_END_DATE` datetime default NULL,
  `SEASONAL_START_DATE` datetime default NULL,
  `STATE_PROVINCE` varchar(255) default NULL,
  `TEMPORARY_END_DATE` datetime default NULL,
  `TEMPORARY_START_DATE` datetime default NULL,
  `CONSTITUENT_ID` bigint(20) NOT NULL,
  `IS_PRIMARY` char(1) NOT NULL default '0',
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`ADDRESS_ID`),
  KEY `FK_ADDRESS_CONSTITUENT` (`CONSTITUENT_ID`),
  CONSTRAINT `FK_ADDRESS_CONSTITUENT` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PHONE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PHONE`;

CREATE TABLE `PHONE` (
  `PHONE_ID` bigint(20) NOT NULL auto_increment,
  `ACTIVATION_STATUS` varchar(255) default NULL,
  `COMMENT` varchar(255) default NULL,
  `EFFECTIVE_DATE` datetime default NULL,
  `INACTIVE` char(1) NOT NULL default '0',
  `NUMBER` varchar(255) default NULL,
  `PROVIDER` varchar(255) default NULL,
  `RECEIVE_CORRESPONDENCE` char(1) NOT NULL default '0',
  `SEASONAL_END_DATE` datetime default NULL,
  `SEASONAL_START_DATE` datetime default NULL,
  `SMS` varchar(255) default NULL,
  `TEMPORARY_END_DATE` datetime default NULL,
  `TEMPORARY_START_DATE` datetime default NULL,
  `CONSTITUENT_ID` bigint(20) NOT NULL,
  `IS_PRIMARY` char(1) NOT NULL default '0',
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`PHONE_ID`),
  KEY `FK_PHONE_CONSTITUENT` (`CONSTITUENT_ID`),
  CONSTRAINT `FK_PHONE_CONSTITUENT` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




# Dump of table AUDIT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AUDIT`;

CREATE TABLE `AUDIT` (
  `AUDIT_ID` bigint(20) NOT NULL auto_increment,
  `AUDIT_TYPE` varchar(255) NOT NULL,
  `DATE` datetime NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `OBJECT_ID` bigint(20) NOT NULL,
  `USER` varchar(255) default NULL,
  `CONSTITUENT_ID` bigint(20) default NULL,
  `SITE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY  (`AUDIT_ID`),
  KEY `FK_AUDIT_CONSTITUENT` (`CONSTITUENT_ID`),
  KEY `FK_AUDIT_SITE` (`SITE_NAME`),
  CONSTRAINT `FK_AUDIT_SITE` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`),
  CONSTRAINT `FK_AUDIT_CONSTITUENT` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




# Dump of table EMAIL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EMAIL`;

CREATE TABLE `EMAIL` (
  `EMAIL_ID` bigint(20) NOT NULL auto_increment,
  `ACTIVATION_STATUS` varchar(255) default NULL,
  `COMMENT` varchar(255) default NULL,
  `EFFECTIVE_DATE` datetime default NULL,
  `EMAIL_ADDRESS` varchar(255) default NULL,
  `EMAIL_DISPLAY` varchar(255) default NULL,
  `INACTIVE` char(1) NOT NULL default '0',
  `RECEIVE_CORRESPONDENCE` char(1) NOT NULL default '0',
  `SEASONAL_END_DATE` datetime default NULL,
  `SEASONAL_START_DATE` datetime default NULL,
  `TEMPORARY_END_DATE` datetime default NULL,
  `TEMPORARY_START_DATE` datetime default NULL,
  `CONSTITUENT_ID` bigint(20) NOT NULL,
  `IS_PRIMARY` char(1) NOT NULL default '0',
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`EMAIL_ID`),
  KEY `FK_EMAIL_CONSTITUENT` (`CONSTITUENT_ID`),
  CONSTRAINT `FK_EMAIL_CONSTITUENT` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




# Dump of table ENTITY_DEFAULT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ENTITY_DEFAULT`;

CREATE TABLE `ENTITY_DEFAULT` (
  `ENTITY_DEFAULT_ID` bigint(20) NOT NULL auto_increment,
  `DEFAULT_VALUE` varchar(255) default NULL,
  `ENTITY_FIELD_NAME` varchar(255) default NULL,
  `ENTITY_TYPE` varchar(255) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`ENTITY_DEFAULT_ID`),
  UNIQUE KEY `SITE_NAME` (`SITE_NAME`,`ENTITY_FIELD_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


# Dump of table FIELD_DEFINITION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FIELD_DEFINITION`;

CREATE TABLE `FIELD_DEFINITION` (
  `FIELD_DEFINITION_ID` varchar(255) NOT NULL,
  `DEFAULT_LABEL` varchar(255) NOT NULL,
  `ENTITY_ATTRIBUTES` varchar(255) default NULL,
  `ENTITY_TYPE` varchar(255) default NULL,
  `FIELD_INFO` varchar(255) default NULL,
  `FIELD_NAME` varchar(255) default NULL,
  `FIELD_TYPE` varchar(255) default NULL,
  `REFERENCE_TYPE` varchar(255) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`FIELD_DEFINITION_ID`),
  KEY `FK_FIELD_DEFINITION_SITE` (`SITE_NAME`),
  CONSTRAINT `FK_FIELD_DEFINITION_SITE` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table FIELD_RELATIONSHIP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FIELD_RELATIONSHIP`;

CREATE TABLE `FIELD_RELATIONSHIP` (
  `FIELD_RELATIONSHIP_ID` bigint(20) NOT NULL auto_increment,
  `CHECK_RECURSION` char(1) NOT NULL default '0',
  `RELATIONSHIP_TYPE` varchar(255) default NULL,
  `DETAIL_FIELD_DEFINITION_ID` varchar(255) default NULL,
  `MASTER_FIELD_DEFINITION_ID` varchar(255) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`FIELD_RELATIONSHIP_ID`),
  UNIQUE KEY `SITE_NAME` (`SITE_NAME`,`MASTER_FIELD_DEFINITION_ID`,`DETAIL_FIELD_DEFINITION_ID`),
  KEY `FK_FIELD_RELATIONSHIP_DET_FLD_DEF` (`DETAIL_FIELD_DEFINITION_ID`),
  KEY `FK_FIELD_RELATIONSHIP_SITE` (`SITE_NAME`),
  KEY `FK_FIELD_RELATIONSHIP_MAS_FLD_DEF` (`MASTER_FIELD_DEFINITION_ID`),
  CONSTRAINT `FK_FIELD_RELATIONSHIP_SITE` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`),
  CONSTRAINT `FK_FIELD_RELATIONSHIP_MAS_FLD_DEF` FOREIGN KEY (`MASTER_FIELD_DEFINITION_ID`) REFERENCES `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`),
  CONSTRAINT `FK_FIELD_RELATIONSHIP_DET_FLD_DEF` FOREIGN KEY (`DETAIL_FIELD_DEFINITION_ID`) REFERENCES `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table FIELD_REQUIRED
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FIELD_REQUIRED`;

CREATE TABLE `FIELD_REQUIRED` (
  `FIELD_REQUIRED_ID` bigint(20) NOT NULL auto_increment,
  `REQUIRED` char(1) NOT NULL default '0',
  `SECTION_NAME` varchar(255) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  `FIELD_DEFINITION_ID` varchar(255) default NULL,
  `SECONDARY_FIELD_DEFINITION_ID` varchar(255) default NULL,
  PRIMARY KEY  (`FIELD_REQUIRED_ID`),
  KEY `FK_FIELD_REQUIRED_SEC_FLD_DEF` (`SECONDARY_FIELD_DEFINITION_ID`),
  KEY `FK_FIELD_REQUIRED_FLD_DEF` (`FIELD_DEFINITION_ID`),
  CONSTRAINT `FK_FIELD_REQUIRED_FLD_DEF` FOREIGN KEY (`FIELD_DEFINITION_ID`) REFERENCES `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`),
  CONSTRAINT `FK_FIELD_REQUIRED_SEC_FLD_DEF` FOREIGN KEY (`SECONDARY_FIELD_DEFINITION_ID`) REFERENCES `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table FIELD_VALIDATION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FIELD_VALIDATION`;

CREATE TABLE `FIELD_VALIDATION` (
  `VALIDATION_ID` bigint(20) NOT NULL auto_increment,
  `VALIDATION_REGEX` varchar(255) default NULL,
  `SECTION_NAME` varchar(255) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  `FIELD_DEFINITION_ID` varchar(255) default NULL,
  `SECONDARY_FIELD_DEFINITION_ID` varchar(255) default NULL,
  PRIMARY KEY  (`VALIDATION_ID`),
  UNIQUE KEY `SITE_NAME` (`SITE_NAME`,`SECTION_NAME`,`FIELD_DEFINITION_ID`,`SECONDARY_FIELD_DEFINITION_ID`),
  KEY `FK_FIELD_VALIDATION_SEC_FLD_DEF` (`SECONDARY_FIELD_DEFINITION_ID`),
  KEY `FK_FIELD_VALIDATION_FLD_DEF` (`FIELD_DEFINITION_ID`),
  CONSTRAINT `FK_FIELD_VALIDATION_FLD_DEF` FOREIGN KEY (`FIELD_DEFINITION_ID`) REFERENCES `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`),
  CONSTRAINT `FK_FIELD_VALIDATION_SEC_FLD_DEF` FOREIGN KEY (`SECONDARY_FIELD_DEFINITION_ID`) REFERENCES `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table FIELD_CONDITION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FIELD_CONDITION`;

CREATE TABLE `FIELD_CONDITION` (
  `CONDITION_ID` bigint(20) NOT NULL auto_increment,
  `DEPENDENT_VALUE` varchar(255) default NULL,
  `DEPENDENT_FIELD_DEFINITION_ID` varchar(255) default NULL,
  `DEPENDENT_SECONDARY_FIELD_DEFINITION_ID` varchar(255) default NULL,
  `FIELD_REQUIRED_ID` bigint(20) default NULL,
  `VALIDATION_ID` bigint(20) default NULL,
  PRIMARY KEY  (`CONDITION_ID`),
  KEY `FK_FIELD_CONDITION_FLD_REQ` (`FIELD_REQUIRED_ID`),
  KEY `FK_FIELD_CONDITION_DEP_SEC` (`DEPENDENT_SECONDARY_FIELD_DEFINITION_ID`),
  KEY `FK_FIELD_CONDITION_VALID` (`VALIDATION_ID`),
  KEY `FK_FIELD_CONDITION_DEP_FLD` (`DEPENDENT_FIELD_DEFINITION_ID`),
  CONSTRAINT `FK_FIELD_CONDITION_VALID` FOREIGN KEY (`VALIDATION_ID`) REFERENCES `FIELD_VALIDATION` (`VALIDATION_ID`),
  CONSTRAINT `FK_FIELD_CONDITION_DEP_FLD` FOREIGN KEY (`DEPENDENT_FIELD_DEFINITION_ID`) REFERENCES `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`),
  CONSTRAINT `FK_FIELD_CONDITION_DEP_SEC` FOREIGN KEY (`DEPENDENT_SECONDARY_FIELD_DEFINITION_ID`) REFERENCES `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`),
  CONSTRAINT `FK_FIELD_CONDITION_FLD_REQ` FOREIGN KEY (`FIELD_REQUIRED_ID`) REFERENCES `FIELD_REQUIRED` (`FIELD_REQUIRED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




# Dump of table MESSAGE_RESOURCE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MESSAGE_RESOURCE`;

CREATE TABLE `MESSAGE_RESOURCE` (
  `MESSAGE_RESOURCE_ID` bigint(20) NOT NULL auto_increment,
  `LANGUAGE_ABBREVIATION` varchar(255) NOT NULL,
  `MESSAGE_KEY` varchar(255) default NULL,
  `MESSAGE_RESOURCE_TYPE` varchar(255) default NULL,
  `MESSAGE_VALUE` varchar(255) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`MESSAGE_RESOURCE_ID`),
  UNIQUE KEY `MESSAGE_KEY` (`MESSAGE_KEY`,`LANGUAGE_ABBREVIATION`,`MESSAGE_RESOURCE_TYPE`,`SITE_NAME`),
  KEY `FK_MESSAGE_RESOURCE_SITE` (`SITE_NAME`),
  CONSTRAINT `FK_MESSAGE_RESOURCE_SITE` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PAGE_ACCESS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PAGE_ACCESS`;

CREATE TABLE `PAGE_ACCESS` (
  `PAGE_ACCESS_ID` bigint(20) NOT NULL auto_increment,
  `ACCESS_TYPE` varchar(255) default NULL,
  `PAGE_TYPE` varchar(255) default NULL,
  `ROLE` varchar(255) NOT NULL,
  `SITE_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`PAGE_ACCESS_ID`),
  UNIQUE KEY `PAGE_TYPE` (`PAGE_TYPE`,`SITE_NAME`,`ROLE`),
  KEY `FK_PAGE_ACCESS_SITE` (`SITE_NAME`),
  CONSTRAINT `FK_PAGE_ACCESS_SITE` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PAYMENT_SOURCE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PAYMENT_SOURCE`;

CREATE TABLE `PAYMENT_SOURCE` (
  `PAYMENT_SOURCE_ID` bigint(20) NOT NULL auto_increment,
  `ACH_ACCOUNT_NUMBER` varchar(255) default NULL,
  `ACH_HOLDER_NAME` varchar(255) default NULL,
  `ACH_ROUTING_NUMBER` varchar(255) default NULL,
  `CREDIT_CARD_EXPIRATION` datetime default NULL,
  `CREDIT_CARD_HOLDER_NAME` varchar(255) default NULL,
  `CREDIT_CARD_NUMBER` varchar(255) default NULL,
  `CREDIT_CARD_TYPE` varchar(255) default NULL,
  `INACTIVE` char(1) NOT NULL default '0',
  `PAYMENT_PROFILE` varchar(255) default NULL,
  `PAYMENT_TYPE` varchar(255) default NULL,
  `ADDRESS_ID` bigint(20) default NULL,
  `CONSTITUENT_ID` bigint(20) default NULL,
  `PHONE_ID` bigint(20) default NULL,
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`PAYMENT_SOURCE_ID`),
  KEY `FK_PAYMENT_SOURCE_CONSTITUENT` (`CONSTITUENT_ID`),
  KEY `FK_PAYMENT_SOURCE_PHONE` (`PHONE_ID`),
  KEY `FK_PAYMENT_SOURCE_ADDRESS` (`ADDRESS_ID`),
  CONSTRAINT `FK_PAYMENT_SOURCE_ADDRESS` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `ADDRESS` (`ADDRESS_ID`),
  CONSTRAINT `FK_PAYMENT_SOURCE_CONSTITUENT` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`),
  CONSTRAINT `FK_PAYMENT_SOURCE_PHONE` FOREIGN KEY (`PHONE_ID`) REFERENCES `PHONE` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


# Dump of table RECURRING_GIFT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RECURRING_GIFT`;

CREATE TABLE `RECURRING_GIFT` (
  `RECURRING_GIFT_ID` bigint(20) NOT NULL auto_increment,
  `NEXT_RUN_DATE` datetime default NULL,
  `ACKNOWLEDGMENT_DATE` datetime default NULL,
  `AMOUNT_PER_GIFT` decimal(19,2) default NULL,
  `AMOUNT_TOTAL` decimal(19,2) default NULL,
  `AUTO_PAY` char(1) NOT NULL default '0',
  `CHECK_NUMBER` int(11) default NULL,
  `COMMENTS` varchar(255) default NULL,
  `CURRENCY_CODE` varchar(255) default NULL,
  `END_DATE` datetime default NULL,
  `FREQUENCY` varchar(255) default NULL,
  `LAST_ENTRY_DATE` datetime default NULL,
  `PAYMENT_TYPE` varchar(255) default NULL,
  `RECURRING_GIFT_STATUS` varchar(255) default NULL,
  `SEND_ACKNOWLEDGMENT` char(1) NOT NULL default '0',
  `START_DATE` datetime default NULL,
  `ADDRESS_ID` bigint(20) default NULL,
  `EMAIL_ID` bigint(20) default NULL,
  `PAYMENT_SOURCE_ID` bigint(20) default NULL,
  `CONSTITUENT_ID` bigint(20) default NULL,
  `PHONE_ID` bigint(20) default NULL,
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`RECURRING_GIFT_ID`),
  KEY `FK_RECURRING_GIFT_CONSTITUENT` (`CONSTITUENT_ID`),
  KEY `FK_RECURRING_GIFT_PHONE` (`PHONE_ID`),
  KEY `FK_RECURRING_GIFT_PAY_SRC` (`PAYMENT_SOURCE_ID`),
  KEY `FK_RECURRING_GIFT_ADDRESS` (`ADDRESS_ID`),
  KEY `FK_RECURRING_GIFT_EMAIL` (`EMAIL_ID`),
  CONSTRAINT `FK_RECURRING_GIFT_ADDRESS` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `ADDRESS` (`ADDRESS_ID`),
  CONSTRAINT `FK_RECURRING_GIFT_CONSTITUENT` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`),
  CONSTRAINT `FK_RECURRING_GIFT_PHONE` FOREIGN KEY (`PHONE_ID`) REFERENCES `PHONE` (`PHONE_ID`),
  CONSTRAINT `FK_RECURRING_GIFT_PAY_SRC` FOREIGN KEY (`PAYMENT_SOURCE_ID`) REFERENCES `PAYMENT_SOURCE` (`PAYMENT_SOURCE_ID`),
  CONSTRAINT `FK_RECURRING_GIFT_EMAIL` FOREIGN KEY (`EMAIL_ID`) REFERENCES `EMAIL` (`EMAIL_ID`)  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PLEDGE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PLEDGE`;

CREATE TABLE `PLEDGE` (
  `PLEDGE_ID` bigint(20) NOT NULL auto_increment,
  `ACKNOWLEDGMENT_DATE` datetime default NULL,
  `AMOUNT_PER_GIFT` decimal(19,2) default NULL,
  `AMOUNT_TOTAL` decimal(19,2) default NULL,
  `COMMENTS` varchar(255) default NULL,
  `CURRENCY_CODE` varchar(255) default NULL,
  `END_DATE` datetime default NULL,
  `FREQUENCY` varchar(255) default NULL,
  `LAST_ENTRY_DATE` datetime default NULL,
  `PLEDGE_CANCEL_DATE` datetime default NULL,
  `PLEDGE_CANCEL_REASON` varchar(255) default NULL,
  `PLEDGE_DATE` datetime default NULL,
  `PLEDGE_STATUS` varchar(255) default NULL,
  `PROJECTED_DATE` datetime default NULL,
  `RECURRING` char(1) NOT NULL default '0',
  `SEND_ACKNOWLEDGMENT` char(1) NOT NULL default '0',
  `START_DATE` datetime default NULL,
  `EMAIL_ID` bigint(20) default NULL,
  `CONSTITUENT_ID` bigint(20) default NULL,
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`PLEDGE_ID`),
  KEY `FK_PLEDGE_CONSTITUENT` (`CONSTITUENT_ID`),
  KEY `FK_PLEDGE_EMAIL` (`EMAIL_ID`),
  CONSTRAINT `FK_PLEDGE_CONSTITUENT` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`),
  CONSTRAINT `FK_PLEDGE_EMAIL` FOREIGN KEY (`EMAIL_ID`) REFERENCES `EMAIL` (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table GIFT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GIFT`;

CREATE TABLE `GIFT` (
  `GIFT_ID` bigint(20) NOT NULL auto_increment,
  `GIFT_STATUS` varchar(255) default NULL,
  `GIFT_TYPE` varchar(255) default NULL,
  `ACKNOWLEDGMENT_DATE` datetime default NULL,
  `AMOUNT` decimal(19,2) default NULL,
  `AUTH_CODE` varchar(255) default NULL,
  `CHECK_NUMBER` int(11) default NULL,
  `COMMENTS` varchar(255) default NULL,
  `CURRENCY_CODE` varchar(255) default NULL,
  `DEDUCTIBLE` char(1) NOT NULL default '0',
  `DEDUCTIBLE_AMOUNT` decimal(19,2) default NULL,
  `DONATION_DATE` datetime default NULL,
  `ENTRY_TYPE` varchar(255) default NULL,
  `ORIGINAL_GIFT_ID` bigint(20) default NULL,
  `PAYMENT_MESSAGE` varchar(255) default NULL,
  `PAYMENT_STATUS` varchar(255) default NULL,
  `PAYMENT_TYPE` varchar(255) default NULL,
  `POSTMARK_DATE` datetime default NULL,
  `REFUND_GIFT_ID` bigint(20) default NULL,
  `REFUND_GIFT_TRANSACTION_DATE` datetime default NULL,
  `REFUND_DETAILS` varchar(255) default NULL,
  `SEND_ACKNOWLEDGMENT` char(1) NOT NULL default '0',
  `TRANSACTION_DATE` datetime default NULL,
  `PAYMENT_TXREFNUM` varchar(255) default NULL,
  `ADDRESS_ID` bigint(20) default NULL,
  `PLEDGE_ID` bigint(20) default NULL,
  `RECURRING_GIFT_ID` bigint(20) default NULL,
  `EMAIL_ID` bigint(20) default NULL,
  `PAYMENT_SOURCE_ID` bigint(20) default NULL,
  `CONSTITUENT_ID` bigint(20) default NULL,
  `PHONE_ID` bigint(20) default NULL,
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`GIFT_ID`),
  KEY `FK_GIFT_CONSTITUENT` (`CONSTITUENT_ID`),
  KEY `FK_GIFT_PHONE` (`PHONE_ID`),
  KEY `FK_GIFT_PAY_SRC` (`PAYMENT_SOURCE_ID`),
  KEY `FK_GIFT_ADDRESS` (`ADDRESS_ID`),
  KEY `FK_GIFT_PLEDGE` (`PLEDGE_ID`),
  KEY `FK_GIFT_RECURRING_GIFT` (`RECURRING_GIFT_ID`),
  KEY `FK_GIFT_EMAIL` (`EMAIL_ID`),
  CONSTRAINT `FK_GIFT_ADDRESS` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `ADDRESS` (`ADDRESS_ID`),
  CONSTRAINT `FK_GIFT_CONSTITUENT` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`),
  CONSTRAINT `FK_GIFT_PHONE` FOREIGN KEY (`PHONE_ID`) REFERENCES `PHONE` (`PHONE_ID`),
  CONSTRAINT `FK_GIFT_PAY_SRC` FOREIGN KEY (`PAYMENT_SOURCE_ID`) REFERENCES `PAYMENT_SOURCE` (`PAYMENT_SOURCE_ID`),
  CONSTRAINT `FK_GIFT_PLEDGE` FOREIGN KEY (`PLEDGE_ID`) REFERENCES `PLEDGE` (`PLEDGE_ID`),
  CONSTRAINT `FK_GIFT_RECURRING_GIFT` FOREIGN KEY (`RECURRING_GIFT_ID`) REFERENCES `RECURRING_GIFT` (`RECURRING_GIFT_ID`),
  CONSTRAINT `FK_GIFT_EMAIL` FOREIGN KEY (`EMAIL_ID`) REFERENCES `EMAIL` (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# ------------------------------------------------------------

DROP TABLE IF EXISTS `PLEDGE_GIFT`;

CREATE TABLE `PLEDGE_GIFT` (
  `PLEDGE_GIFT_ID` bigint(20) NOT NULL auto_increment,
  `GIFT_ID` bigint(20) NOT NULL,
  `PLEDGE_ID` bigint(20) NOT NULL,
  PRIMARY KEY  (`PLEDGE_GIFT_ID`),
  KEY `FK_PLEDGE_GIFT_GIFT` (`GIFT_ID`),
  KEY `FK_PLEDGE_GIFT_PLEDGE` (`PLEDGE_ID`),
  CONSTRAINT `FK_PLEDGE_GIFT_GIFT` FOREIGN KEY (`GIFT_ID`) REFERENCES `GIFT` (`GIFT_ID`),
  CONSTRAINT `FK_PLEDGE_GIFT_PLEDGE` FOREIGN KEY (`PLEDGE_ID`) REFERENCES `PLEDGE` (`PLEDGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PAYMENT_HISTORY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PAYMENT_HISTORY`;

CREATE TABLE `PAYMENT_HISTORY` (
  `PAYMENT_HISTORY_ID` bigint(20) NOT NULL auto_increment,
  `AMOUNT` decimal(19,2) default NULL,
  `CURRENCY_CODE` varchar(255) default NULL,
  `PAYMENT_DESC` text,
  `PAYMENT_HISTORY_TYPE` varchar(255) default NULL,
  `PAYMENT_TYPE` varchar(255) default NULL,
  `TRANSACTION_DATE` datetime default NULL,
  `TRANSACTION_ID` varchar(255) default NULL,
  `GIFT_ID` bigint(20) default NULL,
  `CONSTITUENT_ID` bigint(20) default NULL,
  PRIMARY KEY  (`PAYMENT_HISTORY_ID`),
  KEY `FK_PAYMENT_HISTORY_CONSTITUENT` (`CONSTITUENT_ID`),
  KEY `FK_PAYMENT_HISTORY_GIFT` (`GIFT_ID`),
  CONSTRAINT `FK_PAYMENT_HISTORY_CONSTITUENT` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`),
  CONSTRAINT `FK_PAYMENT_HISTORY_GIFT` FOREIGN KEY (`GIFT_ID`) REFERENCES `GIFT` (`GIFT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


# Dump of table QUERY_LOOKUP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QUERY_LOOKUP`;

CREATE TABLE `QUERY_LOOKUP` (
  `QUERY_LOOKUP_ID` bigint(20) NOT NULL auto_increment,
  `ENTITY_TYPE` varchar(255) default NULL,
  `SQL_WHERE` varchar(255) default NULL,
  `SECTION_NAME` varchar(255) default NULL,
  `FIELD_DEFINITION_ID` varchar(255) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`QUERY_LOOKUP_ID`),
  KEY `FK_QUERY_LOOKUP_FLD_DEF` (`FIELD_DEFINITION_ID`),
  KEY `FK_QUERY_LOOKUP_SITE` (`SITE_NAME`),
  CONSTRAINT `FK_QUERY_LOOKUP_SITE` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`),
  CONSTRAINT `FK_QUERY_LOOKUP_FLD_DEF` FOREIGN KEY (`FIELD_DEFINITION_ID`) REFERENCES `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table QUERY_LOOKUP_PARAM
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QUERY_LOOKUP_PARAM`;

CREATE TABLE `QUERY_LOOKUP_PARAM` (
  `QUERY_LOOKUP_PARAM_ID` bigint(20) NOT NULL auto_increment,
  `PARAM_NAME` varchar(255) default NULL,
  `QUERY_LOOKUP_ID` bigint(20) default NULL,
  PRIMARY KEY  (`QUERY_LOOKUP_PARAM_ID`),
  KEY `FK_QUERY_LOOKUP_PARAM_QRY_LOOK` (`QUERY_LOOKUP_ID`),
  CONSTRAINT `FK_QUERY_LOOKUP_PARAM_QRY_LOOK` FOREIGN KEY (`QUERY_LOOKUP_ID`) REFERENCES `QUERY_LOOKUP` (`QUERY_LOOKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table SECTION_DEFINITION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SECTION_DEFINITION`;

CREATE TABLE `SECTION_DEFINITION` (
  `SECTION_DEFINITION_ID` bigint(20) NOT NULL auto_increment,
  `DEFAULT_LABEL` varchar(255) NOT NULL,
  `LAYOUT_TYPE` varchar(255) default NULL,
  `PAGE_TYPE` varchar(255) default NULL,
  `ROLE` varchar(255) default NULL,
  `SECTION_NAME` varchar(255) default NULL,
  `SECTION_ORDER` int(11) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`SECTION_DEFINITION_ID`),
  UNIQUE KEY `SITE_NAME` (`SITE_NAME`,`SECTION_NAME`,`ROLE`),
  KEY `FK_SECTION_DEFINITION_SITE` (`SITE_NAME`),
  CONSTRAINT `FK_SECTION_DEFINITION_SITE` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table SECTION_FIELD
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SECTION_FIELD`;

CREATE TABLE `SECTION_FIELD` (
  `SECTION_FIELD_ID` bigint(20) NOT NULL auto_increment,
  `FIELD_ORDER` int(11) default NULL,
  `FIELD_DEFINITION_ID` varchar(255) default NULL,
  `SECONDARY_FIELD_DEFINITION_ID` varchar(255) default NULL,
  `SECTION_DEFINITION_ID` bigint(20) default NULL,
  `SITE_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`SECTION_FIELD_ID`),
  UNIQUE KEY `SECTION_DEFINITION_ID` (`SECTION_DEFINITION_ID`,`FIELD_DEFINITION_ID`,`SECONDARY_FIELD_DEFINITION_ID`,`SITE_NAME`),
  KEY `FK_SECTION_FIELD_SEC_FLD_DEF` (`SECONDARY_FIELD_DEFINITION_ID`),
  KEY `FK_SECTION_FIELD_FLD_DEF` (`FIELD_DEFINITION_ID`),
  KEY `FK_SECTION_FIELD_SEC_DEF` (`SECTION_DEFINITION_ID`),
  KEY `FK_SECTION_FIELD_SITE` (`SITE_NAME`),
  CONSTRAINT `FK_SECTION_FIELD_SITE` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`),
  CONSTRAINT `FK_SECTION_FIELD_FLD_DEF` FOREIGN KEY (`FIELD_DEFINITION_ID`) REFERENCES `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`),
  CONSTRAINT `FK_SECTION_FIELD_SEC_FLD_DEF` FOREIGN KEY (`SECONDARY_FIELD_DEFINITION_ID`) REFERENCES `FIELD_DEFINITION` (`FIELD_DEFINITION_ID`),
  CONSTRAINT `FK_SECTION_FIELD_SEC_DEF` FOREIGN KEY (`SECTION_DEFINITION_ID`) REFERENCES `SECTION_DEFINITION` (`SECTION_DEFINITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


# Dump of table COMMUNICATION_HISTORY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `COMMUNICATION_HISTORY`;

CREATE TABLE `COMMUNICATION_HISTORY` (
  `COMMUNICATION_HISTORY_ID` bigint(20) NOT NULL auto_increment,
  `COMMENTS` text,
  `COMMUNICATION_TYPE` varchar(255) default NULL,
  `ENTRY_TYPE` varchar(255) default NULL,
  `CREATE_DATE` datetime default NULL,
  `RECORD_DATE` datetime default NULL,
  `SYSTEM_GENERATED` char(1) NOT NULL default '0',
  `UPDATE_DATE` datetime default NULL,
  `PLEDGE_ID` bigint(20) default NULL,
  `RECURRING_GIFT_ID` bigint(20) default NULL,
  `GIFT_ID` bigint(20) default NULL,
  `CONSTITUENT_ID` bigint(20) default NULL,
  PRIMARY KEY  (`COMMUNICATION_HISTORY_ID`),
  KEY `FK_COMMUNICATION_HISTORY_CONSTITUENT` (`CONSTITUENT_ID`),
  KEY `FK_COMMUNICATION_HISTORY_GIFT` (`GIFT_ID`),
  KEY `FK_COMMUNICATION_HISTORY_PLEDGE` (`PLEDGE_ID`),
  KEY `FK_COMMUNICATION_HISTORY_RECURRING_GIFT` (`RECURRING_GIFT_ID`),
  CONSTRAINT `FK_COMMUNICATION_HISTORY_CONSTITUENT` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`),
  CONSTRAINT `FK_COMMUNICATION_HISTORY_GIFT` FOREIGN KEY (`GIFT_ID`) REFERENCES `GIFT` (`GIFT_ID`),
  CONSTRAINT `FK_COMMUNICATION_HISTORY_PLEDGE` FOREIGN KEY (`PLEDGE_ID`) REFERENCES `PLEDGE` (`PLEDGE_ID`),
  CONSTRAINT `FK_COMMUNICATION_HISTORY_RECURRING_GIFT` FOREIGN KEY (`RECURRING_GIFT_ID`) REFERENCES `RECURRING_GIFT` (`RECURRING_GIFT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table DISTRO_LINE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DISTRO_LINE`;

CREATE TABLE `DISTRO_LINE` (
  `DISTRO_LINE_ID` bigint(20) NOT NULL auto_increment,
  `AMOUNT` decimal(19,2) default NULL,
  `MOTIVATION_CODE` varchar(255) default NULL,
  `OTHER_MOTIVATION` varchar(255) default NULL,
  `PERCENTAGE` decimal(19,2) default NULL,
  `PROJECT_CODE` varchar(255) default NULL,
  `PLEDGE_ID` bigint(20) default NULL,
  `RECURRING_GIFT_ID` bigint(20) default NULL,
  `GIFT_ID` bigint(20) default NULL,
  PRIMARY KEY  (`DISTRO_LINE_ID`),
  KEY `FK_DISTRO_LINE_GIFT` (`GIFT_ID`),
  KEY `FK_DISTRO_LINE_PLEDGE` (`PLEDGE_ID`),
  KEY `FK_DISTRO_LINE_RECURRING_GIFT` (`RECURRING_GIFT_ID`),
  CONSTRAINT `FK_DISTRO_LINE_GIFT` FOREIGN KEY (`GIFT_ID`) REFERENCES `GIFT` (`GIFT_ID`),
  CONSTRAINT `FK_DISTRO_LINE_PLEDGE` FOREIGN KEY (`PLEDGE_ID`) REFERENCES `PLEDGE` (`PLEDGE_ID`),
  CONSTRAINT `FK_DISTRO_LINE_RECURRING_GIFT` FOREIGN KEY (`RECURRING_GIFT_ID`) REFERENCES `RECURRING_GIFT` (`RECURRING_GIFT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


# Dump of table GIFT_IN_KIND
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GIFT_IN_KIND`;

CREATE TABLE `GIFT_IN_KIND` (
  `GIFT_IN_KIND_ID` bigint(20) NOT NULL auto_increment,
  `FAIR_MARKET_VALUE` decimal(19,2) default NULL,
  `CURRENCY_CODE` varchar(255) default NULL,
  `DONATION_DATE` datetime default NULL,
  `MOTIVATION_CODE` varchar(255) default NULL,
  `OTHER_MOTIVATION` varchar(255) default NULL,
  `ANONYMOUS` char(1) NOT NULL default '0',
  `RECOGNITION_NAME` varchar(255) default NULL,
  `SEND_ACKNOWLEDGMENT` char(1) NOT NULL default '0',
  `ACKNOWLEDGMENT_DATE` datetime default NULL,
  `TRANSACTION_DATE` datetime default NULL,
  `GIFT_ID` bigint(20) default NULL,
  `CONSTITUENT_ID` bigint(20) default NULL,
  `EMAIL_ID` bigint(20) default NULL,
  `CREATE_DATE` datetime default NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`GIFT_IN_KIND_ID`),
  KEY `FK_GIFT_IN_KIND_GIFT` (`GIFT_ID`),
  KEY `FK_GIFT_IN_KIND_EMAIL` (`EMAIL_ID`),
  KEY `FK_GIFT_IN_KIND_CONSTITUENT` (`CONSTITUENT_ID`),
  CONSTRAINT `FK_GIFT_IN_KIND_GIFT` FOREIGN KEY (`GIFT_ID`) REFERENCES `GIFT` (`GIFT_ID`),
  CONSTRAINT `FK_GIFT_IN_KIND_EMAIL` FOREIGN KEY (`EMAIL_ID`) REFERENCES `EMAIL` (`EMAIL_ID`),
  CONSTRAINT `FK_GIFT_IN_KIND_CONSTITUENT` FOREIGN KEY (`CONSTITUENT_ID`) REFERENCES `CONSTITUENT` (`CONSTITUENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


# Dump of table GIFT_IN_KIND_DETAIL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GIFT_IN_KIND_DETAIL`;

CREATE TABLE `GIFT_IN_KIND_DETAIL` (
  `GIK_DETAIL_ID` bigint(20) NOT NULL auto_increment,
  `FAIR_MARKET_VALUE` decimal(19,2) default NULL,
  `DESCRIPTION` varchar(255) default NULL,
  `PROJECT_CODE` varchar(255) default NULL,
  `TAX_DEDUCTIBLE` char(1) NOT NULL default '0',
  `GIFT_IN_KIND_ID` bigint(20) default NULL,
  `FMV_METHOD` varchar(255) default NULL,
  `CATEGORY` varchar(255) default NULL,
  `QUANTITY` int(11) default NULL,
  PRIMARY KEY  (`GIK_DETAIL_ID`),
  KEY `FK_GIK_DETAIL_GIFT_IN_KIND` (`GIFT_IN_KIND_ID`),
  CONSTRAINT `FK_GIK_DETAIL_GIFT_IN_KIND` FOREIGN KEY (`GIFT_IN_KIND_ID`) REFERENCES `GIFT_IN_KIND` (`GIFT_IN_KIND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


# VERSION of components.  
# Used to check if the program and database are the same database schema versions
# This script is also used to set the version number of this schema in the database.  
# Update the Major version when an incompatible change is made (requires a db conversion script).
# Update the Minor version when a compatible change is made (new program can run with old schema, and old program can run with new schema).
# The Major number should then also be updated in VersionServiceImpl.java.
# -------------------------------------------------------------------------------

DROP TABLE IF EXISTS `VERSION`;

CREATE TABLE `VERSION` (
  `COMPONENT_ID` varchar(255) NOT NULL,
  `COMPONENT_DESC` varchar(255) NOT NULL,
  `SCHEMA_MAJOR_VERSION` bigint(20) default 0,
  `SCHEMA_MINOR_VERSION` bigint(20) default 0,
  PRIMARY KEY  (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `RECENTLY_VIEWED`;

CREATE TABLE `RECENTLY_VIEWED` (
  `SITE_NAME` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `RECENT_ACCOUNTS` varchar(255) NOT NULL,
  PRIMARY KEY (`SITE_NAME`,`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `CUSTOM_ID`;

CREATE TABLE `CUSTOM_ID` (
	`SITE_NAME` varchar(255) primary key,
	`SITE_PREFIX` varchar(255) default '',
	`NEXT_KEY` int default 1,
	CONSTRAINT `FK_CUSTOM_ID` FOREIGN KEY (`SITE_NAME`) REFERENCES `SITE` (`SITE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `CACHE_GROUP`;

CREATE TABLE `CACHE_GROUP` (
  `CACHE_GROUP_ID` varchar(255) NOT NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`CACHE_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


SET foreign_key_checks = 1;

INSERT INTO VERSION (COMPONENT_ID, COMPONENT_DESC, SCHEMA_MAJOR_VERSION, SCHEMA_MINOR_VERSION) VALUES ('ORANGE', 'Orange Leap', 1, 0);

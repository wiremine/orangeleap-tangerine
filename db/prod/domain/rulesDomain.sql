-- RULE_EVENT_TYPE (code entry points for rules)

INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (1,'constituent-save', 'Save Constituent');
INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (2,'gift-save', 'Save Gift');
INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (3,'touchpoint-save', 'Save Touchpoint');
INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (4,'email', 'Email');
INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (5,'payment-processing', 'Payment Processing');
INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (6,'scheduled-one-time', 'Scheduled One Time');
INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (7,'scheduled-daily', 'Scheduled Daily');
INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (8,'scheduled-weekly', 'Scheduled Weekly');
INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (9,'scheduled-monthly', 'Scheduled Monthly');
INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (10,'email-scheduled-daily', 'Email Scheduled Daily');
INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (11,'email-scheduled-weekly', 'Email Scheduled Weekly');
INSERT INTO RULE_EVENT_TYPE (RULE_EVENT_TYPE_ID, RULE_EVENT_TYPE_NAME_ID, RULE_EVENT_TYPE_DESC) VALUES (12,'email-scheduled-monthly', 'Email Scheduled Monthly');

-- RULE_SEGMENT_TYPE and RULE_SEGMENT_TYPE_PARM (code function definitions for rule text phrases)

-- TODO replace with actual list
-- INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES (1,'condition','Constituent is a login user','map.constituent.getCustomFieldValue("constituentIndividualRoles").contains("user")');
-- INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES (2,'condition','Constituent is not a login user','!map.constituent.getCustomFieldValue("constituentIndividualRoles").contains("user")');

-- RULE_EVENT_TYPE_X_SEGMENT_TYPE (what segment types can be used for what event types)

-- TODO replace with actual list
-- INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES (1,1);
-- INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES (1,2);

-- ********************************************************************************************************************************
-- ********************************** Conditions **********************************************************************************
-- ********************************************************************************************************************************

-- *****************************************Custom Fields conditions***************************************************************

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent has a custom field named ?';
SET @CODE_CD = 'map.ruleHelperService.trimToNull(map.constituent.getCustomFieldValue(?)) != null';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');



-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent has a custom field named ? that has a value of ?';
SET @CODE_CD = 'map.constituent.getCustomFieldValue(?) == ?';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent has a custom field named ? that does not have a value of ?';
SET @CODE_CD = 'map.constituent.getCustomFieldValue(?) != ?';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent has a custom field named ? that does not have a value of ?';
SET @CODE_CD = 'map.constituent.getCustomFieldValue(?) != ?';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');


-- *****************************************Roles, Profiles, Profile Types conditions********************************************************
-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent has a donor profile of ?';
SET @CODE_CD = 'map.constituent.getCustomFieldValue(com.orangeleap.tangerine.domain.Constituent.DONOR_PROFILES) != null && map.constituent.getCustomFieldValue(com.orangeleap.tangerine.domain.Constituent.DONOR_PROFILES).contains(?)';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent does not have a donor profile of ?';
SET @CODE_CD = 'map.constituent.getCustomFieldValue(com.orangeleap.tangerine.domain.Constituent.DONOR_PROFILES) == null || map.constituent.getCustomFieldValue(com.orangeleap.tangerine.domain.Constituent.DONOR_PROFILES).contains(?) == false';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent is not a individual of type ?';
SET @CODE_CD = 'map.constituent.getConstituentIndividualRoles() == null || map.constituent.getConstituentIndividualRoles().contains(?) == false';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');


-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent is not a donor';
SET @CODE_CD = 'map.constituent.getConstituentIndividualRoles() == null || map.constituent.getConstituentIndividualRoles().contains("donor") == false';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent is not a individual of type ?';
SET @CODE_CD = 'map.constituent.getConstituentIndividualRoles() == null || map.constituent.getConstituentIndividualRoles().indexOf(?) == -1';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');


-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent is a individual of type ?';
SET @CODE_CD = 'map.constituent.getConstituentIndividualRoles() == null || map.constituent.getConstituentIndividualRoles().indexOf(?) != -1';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');


-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent is not a organization of type ?';
SET @CODE_CD = 'map.constituent.getConstituentOrganizationRoles() == null || map.constituent.getConstituentOrganizationRoles().indexOf(?) == -1';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');


-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent is a organization of type ?';
SET @CODE_CD = 'map.constituent.getConstituentOrganizationRoles() == null || map.constituent.getConstituentOrganizationRoles().indexOf(?) != -1';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');



-- *****************************************Donations, Gifts, Major Donor conditions********************************************************

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent has made a donation in the past ? ?';
SET @CODE_CD = 'map.ruleHelperService.numberOfDonationsMadePerTimeFrame(map.constituent, ?.intValue(), ?) >= 1';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'NUMBER');

SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent has not made a donation in the past ? ?';
SET @CODE_CD = 'map.ruleHelperService.numberOfDonationsMadePerTimeFrame(map.constituent, ?.intValue(), ?) == 0';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'NUMBER');

SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent has donated ? gifts';
SET @CODE_CD = 'map.ruleHelperService.numberOfDonationsMadePerTimeFrame(map.constituent, -1, null) == ?';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'NUMBER');

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Constituent has donated at least ? gifts';
SET @CODE_CD = 'map.ruleHelperService.numberOfDonationsMadePerTimeFrame(map.constituent, -1, null) >= ?';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('condition',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'NUMBER');



-- ********************************************************************************************************************************
-- ********************************** Consequences **********************************************************************************
-- ********************************************************************************************************************************

-- *****************************************Custom Fields Consequences********************************************************
SET @PHRASE_CD = 'Set the constituent custom field ? to ?';
SET @CODE_CD = 'map.constituent.setCustomFieldValue(?,?); map.constituentService.maintainConstituent(map.constituent);';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('consequence',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Unset the individual as a ?';
SET @CODE_CD = 'map.constituent.removeConstituentIndividualRoles(?); map.constituentService.maintainConstituent(map.constituent);';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('consequence',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

-- --------------------------------------------------------------------------------------------------------------------------------
SET @PHRASE_CD = 'Add constituent donor profile of ?';
SET @CODE_CD = 'map.constituent.addCustomFieldValue(com.orangeleap.tangerine.domain.Constituent.DONOR_PROFILES,?);map.constituentService.maintainConstituent(map.constituent);';

-- Insert code
INSERT INTO RULE_SEGMENT_TYPE (RULE_SEGMENT_TYPE_TYPE, RULE_SEGMENT_TYPE_PHRASE, RULE_SEGMENT_TYPE_TEXT) VALUES ('consequence',@PHRASE_CD,@CODE_CD);
SET @RULE_SEGMENT_TYPE_ID = LAST_INSERT_ID();

-- Insert what segment types can be used for what event types (this is for the UI piece)
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'constituent-save'),@RULE_SEGMENT_TYPE_ID);
INSERT INTO RULE_EVENT_TYPE_X_RULE_SEGMENT_TYPE (RULE_EVENT_TYPE_ID,RULE_SEGMENT_TYPE_ID) VALUES ((SELECT RULE_EVENT_TYPE_ID FROM RULE_EVENT_TYPE WHERE RULE_EVENT_TYPE_NAME_ID = 'gift-save'),@RULE_SEGMENT_TYPE_ID);

-- Insert the parameters for the condition
SET @RULE_SEGMENT_TYPE_PARM_SEQ = (SELECT IFNULL( (SELECT MAX(RULE_SEGMENT_TYPE_PARM_SEQ)+1 FROM RULE_SEGMENT_TYPE_PARM WHERE RULE_SEGMENT_TYPE_ID = @RULE_SEGMENT_TYPE_ID), 0));
INSERT INTO RULE_SEGMENT_TYPE_PARM (RULE_SEGMENT_TYPE_ID, RULE_SEGMENT_TYPE_PARM_SEQ, RULE_SEGMENT_TYPE_PARM_TYPE) VALUES (@RULE_SEGMENT_TYPE_ID,@RULE_SEGMENT_TYPE_PARM_SEQ,'STRING');

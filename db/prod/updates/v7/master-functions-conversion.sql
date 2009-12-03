-- ******************* Un-comment out the below line when running this script in mySql Query Browser ***************************************
-- DELIMITER $$

DROP FUNCTION IF EXISTS GENERATEID$$

CREATE DEFINER=`root`@`localhost` FUNCTION GENERATEID(SITENAME VARCHAR(255))
    RETURNS VARCHAR(255)
BEGIN
    DECLARE CUSTOMID VARCHAR(255);

    IF (SELECT COUNT(SITE_NAME) FROM CUSTOM_ID WHERE SITE_NAME = SITENAME) = 0 THEN
    	INSERT CUSTOM_ID(SITE_NAME) VALUES(SITENAME);
    END IF;

    -- Changed per TANGERINE-596; no more prefix or padding with zeros
    -- SELECT CONCAT(SITE_PREFIX,LPAD(CAST(NEXT_KEY as CHAR),6, '0')) INTO CUSTOMID
    SELECT CAST(NEXT_KEY as CHAR) INTO CUSTOMID
    FROM CUSTOM_ID
    WHERE SITE_NAME=SITENAME;

    UPDATE CUSTOM_ID SET NEXT_KEY = NEXT_KEY+1 WHERE SITE_NAME=SITENAME;

    IF CUSTOMID = null THEN SET CUSTOMID = '9999999';
    END IF;

    RETURN CUSTOMID;

END$$

-- Call GENERATEID if inserting a null ACCOUNT_NUMBER
DROP TRIGGER IF EXISTS INSERT_CONSTITUENT_GENERATEID$$

CREATE DEFINER=`root`@`localhost` TRIGGER INSERT_CONSTITUENT_GENERATEID 
BEFORE INSERT ON `CONSTITUENT` 
FOR EACH ROW
BEGIN
	
  IF NEW.ACCOUNT_NUMBER is null THEN SET NEW.ACCOUNT_NUMBER = GENERATEID(NEW.SITE_NAME);
  END IF;

END$$

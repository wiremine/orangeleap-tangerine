/*
SQLyog Job Agent Version 8.14 n2 Copyright(c) Webyog Softworks Pvt. Ltd. All Rights Reserved.

MySQL - 5.1.35-community
*********************************************************************
*/
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/* SYNC DB : company1 */
SET AUTOCOMMIT = 0;


UPDATE VERSION SET SCHEMA_MAJOR_VERSION = 4 WHERE COMPONENT_ID = 'ORANGE' AND COMPONENT_DESC = 'Orange Leap';



/* TANGERINE-867 */
UPDATE SECTION_DEFINITION SET PAGE_TYPE = 'giftPosted' WHERE PAGE_TYPE = 'giftView';

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES
('gift.customFieldMap[bankReadOnly]', 'gift', 'customFieldMap[bank]', 'Bank', 'PICKLIST_DISPLAY');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, ENTITY_ATTRIBUTES, FIELD_TYPE) VALUES
('gift.postedDateReadOnly', 'gift', 'postedDate', 'Posted Date', 'postedDate', 'DATE_DISPLAY');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES
('gift.donationDateReadOnly', 'gift', 'donationDate', 'Date of Donation', 'DATE_DISPLAY');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES
('gift.postmarkDateReadOnly', 'gift', 'postmarkDate', 'Postmark Date', 'DATE_DISPLAY');

INSERT INTO FIELD_DEFINITION (FIELD_DEFINITION_ID, ENTITY_TYPE, FIELD_NAME, DEFAULT_LABEL, FIELD_TYPE) VALUES
('gift.customFieldMap[sourceReadOnly]', 'gift', 'customFieldMap[source]', 'Source', 'PICKLIST_DISPLAY');



UPDATE SECTION_FIELD set FIELD_DEFINITION_ID = 'gift.giftStatusReadOnly' WHERE FIELD_DEFINITION_ID = 'gift.giftStatus'
and SECTION_DEFINITION_ID = (SELECT SECTION_DEFINITION_ID FROM SECTION_DEFINITION WHERE SECTION_NAME='gift.donation' AND PAGE_TYPE='giftPosted');

UPDATE SECTION_FIELD set FIELD_DEFINITION_ID = 'gift.customFieldMap[bankReadOnly]' WHERE FIELD_DEFINITION_ID = 'gift.customFieldMap[bank]'
and SECTION_DEFINITION_ID = (SELECT SECTION_DEFINITION_ID FROM SECTION_DEFINITION WHERE SECTION_NAME='gift.donation' AND PAGE_TYPE='giftPosted');

UPDATE SECTION_FIELD set FIELD_DEFINITION_ID = 'gift.postedDateReadOnly' WHERE FIELD_DEFINITION_ID = 'gift.postedDate'
and SECTION_DEFINITION_ID = (SELECT SECTION_DEFINITION_ID FROM SECTION_DEFINITION WHERE SECTION_NAME='gift.donation' AND PAGE_TYPE='giftPosted');

UPDATE SECTION_FIELD set FIELD_DEFINITION_ID = 'gift.donationDateReadOnly' WHERE FIELD_DEFINITION_ID = 'gift.donationDate'
and SECTION_DEFINITION_ID = (SELECT SECTION_DEFINITION_ID FROM SECTION_DEFINITION WHERE SECTION_NAME='gift.donation' AND PAGE_TYPE='giftPosted');

UPDATE SECTION_FIELD set FIELD_DEFINITION_ID = 'gift.postmarkDateReadOnly' WHERE FIELD_DEFINITION_ID = 'gift.postmarkDate'
and SECTION_DEFINITION_ID = (SELECT SECTION_DEFINITION_ID FROM SECTION_DEFINITION WHERE SECTION_NAME='gift.donation' AND PAGE_TYPE='giftPosted');

UPDATE SECTION_FIELD set FIELD_DEFINITION_ID = 'gift.customFieldMap[sourceReadOnly]' WHERE FIELD_DEFINITION_ID = 'gift.customFieldMap[source]'
and SECTION_DEFINITION_ID = (SELECT SECTION_DEFINITION_ID FROM SECTION_DEFINITION WHERE SECTION_NAME='gift.donation' AND PAGE_TYPE='giftPosted');




SET @Next_ID=(SELECT MAX(SECTION_DEFINITION_ID)+1000 FROM SECTION_DEFINITION);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES
(@Next_ID, 'giftPaid', 'gift.donation', 'Donation Information', 1, 'TWO_COLUMN', 'ROLE_USER');

INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.idHidden', 0);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.amountReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.currencyCodeReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.giftStatus', 2500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.customFieldMap[bank]', 2600);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.posted', 2700);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.postedDate', 2900);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.donationDate', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.postmarkDate', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.customFieldMap[source]', 4300);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.associatedPledgeIdsReadOnly', 4500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.associatedRecurringGiftIdsReadOnly', 5500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.adjustedGiftsReadOnly', 5750);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.comments', 6000);

SET @Next_ID=(SELECT MAX(SECTION_DEFINITION_ID)+1000 FROM SECTION_DEFINITION);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES
(@Next_ID, 'giftPaid', 'gift.payment', 'Payment Information', 2, 'ONE_COLUMN', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.paymentTypeReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.address.id', 'address.id', 1400);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.address.customFieldMap[addressType]', 'address.customFieldMap[addressType]', 1500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.address.addressLine1', 'address.addressLine1', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.address.addressLine2', 'address.addressLine2', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.address.addressLine3', 'address.addressLine3', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.address.city', 'address.city', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.address.stateProvince', 'address.stateProvince', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.address.postalCode', 'address.postalCode', 7000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.address.country', 'address.country', 8000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.phone.id', 'phone.id', 8200);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.phone.customFieldMap[phoneType]', 'phone.customFieldMap[phoneType]', 8500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.phone.number', 'phone.number', 9000);

SET @Next_ID=(SELECT MAX(SECTION_DEFINITION_ID)+1000 FROM SECTION_DEFINITION);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (@Next_ID, 'giftPaid', 'gift.creditCard', 'Credit Card', 3, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.paymentSource.creditCardHolderNameReadOnly', 'paymentSource.creditCardHolderNameReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.paymentSource.creditCardTypeReadOnly', 'paymentSource.creditCardTypeReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.paymentSource.creditCardNumberReadOnly', 'paymentSource.creditCardNumberReadOnly', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.paymentSource.creditCardExpirationDisplay', 'paymentSource.creditCardExpirationDisplay', 4000);

SET @Next_ID=(SELECT MAX(SECTION_DEFINITION_ID)+1000 FROM SECTION_DEFINITION);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (@Next_ID, 'giftPaid', 'gift.ach', 'ACH', 4, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.paymentSource.achHolderNameReadOnly', 'paymentSource.achHolderNameReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.paymentSource.achRoutingNumberReadOnly', 'paymentSource.achRoutingNumberReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.paymentSource.achAccountNumberReadOnly', 'paymentSource.achAccountNumberReadOnly', 3000);

SET @Next_ID=(SELECT MAX(SECTION_DEFINITION_ID)+1000 FROM SECTION_DEFINITION);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (@Next_ID, 'giftPaid', 'gift.check', 'Check', 5, 'ONE_COLUMN_HIDDEN', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.checkNumber', 1000);

SET @Next_ID=(SELECT MAX(SECTION_DEFINITION_ID)+1000 FROM SECTION_DEFINITION);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (@Next_ID, 'giftPaid', 'gift.paymentStatus', 'Payment Status', 6, 'TWO_COLUMN', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.paymentStatusReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.paymentMessageReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.txRefNumReadOnly', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.authCodeReadOnly', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.avsMessageReadOnly', 5000);

SET @Next_ID=(SELECT MAX(SECTION_DEFINITION_ID)+1000 FROM SECTION_DEFINITION);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (@Next_ID, 'giftPaid', 'gift.distribution', 'Gift Distribution', 8, 'DISTRIBUTION_LINE_GRID_DISPLAY', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.amountReadOnly', 'distributionLines.amountReadOnly', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.percentageReadOnly', 'distributionLines.percentageReadOnly', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.projectCode', 'distributionLines.projectCode', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.motivationCode', 'distributionLines.motivationCode', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.other_motivationCode', 'distributionLines.other_motivationCode', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[reference]', 'distributionLines.customFieldMap[reference]', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[other_reference]', 'distributionLines.customFieldMap[other_reference]', 7000);

SET @Next_ID=(SELECT MAX(SECTION_DEFINITION_ID)+1000 FROM SECTION_DEFINITION);

INSERT INTO SECTION_DEFINITION (SECTION_DEFINITION_ID, PAGE_TYPE, SECTION_NAME, DEFAULT_LABEL, SECTION_ORDER, LAYOUT_TYPE, ROLE) VALUES (@Next_ID, 'giftPaid', 'gift.extendedDistribution', 'Extended Distribution Lines', 9, 'GRID_HIDDEN_ROW', 'ROLE_USER');
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[associatedPledgeIdReadOnly]', 'distributionLines.customFieldMap[associatedPledgeIdReadOnly]', 0);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[associatedRecurringGiftIdReadOnly]', 'distributionLines.customFieldMap[associatedRecurringGiftIdReadOnly]', 500);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[tribute]', 'distributionLines.customFieldMap[tribute]', 1000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[tributeReference]', 'distributionLines.customFieldMap[tributeReference]', 2000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[other_tributeReference]', 'distributionLines.customFieldMap[other_tributeReference]', 3000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[tributeOccasion]', 'distributionLines.customFieldMap[tributeOccasion]', 4000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[additional_tributeOccasion]', 'distributionLines.customFieldMap[additional_tributeOccasion]', 5000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[onBehalfOf]', 'distributionLines.customFieldMap[onBehalfOf]', 6000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[other_onBehalfOf]', 'distributionLines.customFieldMap[other_onBehalfOf]', 7000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[anonymous]', 'distributionLines.customFieldMap[anonymous]', 8000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[recognitionName]', 'distributionLines.customFieldMap[recognitionName]', 9000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[notified]', 'distributionLines.customFieldMap[notified]', 10000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[other_notified]', 'distributionLines.customFieldMap[other_notified]', 11000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[message]', 'distributionLines.customFieldMap[message]', 12000);
INSERT INTO SECTION_FIELD (SECTION_DEFINITION_ID, FIELD_DEFINITION_ID, SECONDARY_FIELD_DEFINITION_ID, FIELD_ORDER) VALUES (@Next_ID, 'gift.distributionLines.customFieldMap[taxDeductible]', 'distributionLines.customFieldMap[taxDeductible]', 13000);

COMMIT;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


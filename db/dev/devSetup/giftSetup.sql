-- Create gifts
-- Must be executed AFTER CONSTITUENT insertions (personSetup.sql)

INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2007-06-06 10:50:57', 1, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2007-06-05 10:50:57', 1, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2007-06-04 10:50:57', 1, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2007-06-03 10:50:57', 1, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2007-06-02 10:50:57', 1, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', current_timestamp(), 2, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-07-05', 2, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-06-04', 2, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-05-03', 2, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-04-02', 2, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-06-07 10:50:57', 3, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-06-06 10:50:57', 3, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-06-05 10:50:57', 3, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-06-04 10:50:57', 3, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-06-03 10:50:57', 3, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-05-03 10:50:57', 3, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-07-22 10:50:57', 4, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-06-22 10:50:57', 4, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-05-21 10:50:57', 4, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-07-22 10:50:57', 5, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-05-21 10:50:57', 5, false);
INSERT INTO GIFT (COMMENTS, AMOUNT, DEDUCTIBLE_AMOUNT, PAYMENT_TYPE, TRANSACTION_DATE, CONSTITUENT_ID, DEDUCTIBLE) VALUES ('Thank you for your ministry', 1000, 1000, 'Cash', '2008-04-21 10:50:57', 5, false);

UPDATE GIFT SET ENTRY_TYPE = 'MANUAL';
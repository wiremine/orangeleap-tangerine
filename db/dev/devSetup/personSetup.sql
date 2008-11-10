-- Create a list of people in the database
-- Executing a list of people must come BEFORE executing:
	-- GIFTS insertions (giftSetup.sql)

INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Adam', 'Jay', 'Smith', null, 'Single', 'Eve', 'Alpha Omega Inc.', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Ms.', 'Eve', 'Kay', 'Smith', null, 'Single', null, 'Alpha Omega, Inc.', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Erik', null, 'Weibust', null, 'Married', null, 'Credera', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Jonathan', null, 'Ball', null, 'Married', null, 'Credera', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Ryan', null, 'Smith',  null, 'Single', null, 'Credera', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Ms.', 'Jennifer', null, 'Stephenson', null, 'Single', null, 'MPower Open', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Leo', null, 'D''Angelo', null, 'Married', null, 'MPower Open', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Vincent', null, 'Young', null, 'Single', null, 'The University of Texas at Austin', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Jack', null, 'Jones', null, 'Married', 'Jill', 'Mother Goose', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mrs.', 'Jill', null, 'Jones', null, 'Married', null, 'Mother Goose', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'James', null, 'Hook', null, 'Unknown', null, null, 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Ms.', 'Jane', null, 'Porter', null, 'Single', null, null, 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Tarzan', null, 'Ape', null, 'Single', null, null, 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Frodo', null, 'Baggins', null, 'Single', null, 'Fellowship', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Ms.', 'Pam', null, 'Beesly', null, 'Single', null, 'Dunder Mifflin, Inc.', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Jim', null, 'Halpert', null, 'Single', null, 'Dunder Mifflin, Inc.', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Ms.', 'Angela', null, 'Martin', null, 'Single', null, 'Dunder Mifflin, Inc.', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mrs.', 'Phyllis', null, 'Vance',  null, 'Married', null, 'Dunder Mifflin, Inc.', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Bob', null, 'Vance', null, 'Unknown', null, 'Vance Refrigeration', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Dwight', null, 'Schrute', null, 'Single', null, 'Dunder Mifflin, Inc.', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Ms.', 'Karen', null, 'Filippelli', null, 'Single', null, 'Dunder Mifflin, Inc.', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Jack', null, 'Shephard', null, 'Single', null, 'ABC', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'John', null, 'Locke', null, 'Single', null, 'ABC', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Ms.', 'Kate', null, 'Austen', null, 'Unknown', null, 'ABC', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'James', 'Sawyer', 'Ford', null, 'Single', null, 'ABC', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mrs.', 'Sun', null, 'Kwon', null, 'Married', 'Jin', 'ABC', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Jin', null, 'Kwon', null, 'Married', 'Jin', 'ABC', 'company2', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Homer', 'Jay', 'Simpson', null, 'Married', 'Marge', 'Fox', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mrs.', 'Marge', null, 'Simpson', null, 'Married', null, 'Fox', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Bob', null, 'Incredible', null, 'Married', null, 'Pixar', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mrs.', 'Helen', null, 'Incredible', null, 'Married', null, 'Pixar', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'William', null, 'Fitzpatrick', null, 'Unknown', null, 'O''Reilly''s', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Ms.', 'Mary', null, 'O''Doul', null, 'Widowed', null, 'O''Doul''s', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Tom', null, 'Sawyer', null, 'Single', null, null, 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Huckleberry', null, 'Finn', null, 'Married', null, null, 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Ms.', 'Amy', null, 'Abbott', null, 'Married', 'Aaron', null, 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Oliver', null, 'Twist', null, 'Married', 'Nancy', null, 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'John', 'Doe', 'Kwon', null, 'Married', null, null, 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Ms.', 'Jane', null, 'Doe', null, 'Single', null, null, 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'Colt', null, 'McCoy', null, 'Single', null, 'The University of Texas at Austin', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO PERSON (TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, MARITAL_STATUS, SPOUSE_FIRST_NAME, ORGANIZATION_NAME, SITE_NAME, MAJOR_DONOR, LAPSED_DONOR, CREATE_DATE, UPDATE_DATE) VALUES ('Mr.', 'George', null, 'Washington', null, 'Married', null, 'USA', 'company1', false, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
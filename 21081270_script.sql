DROP SCHEMA IF EXISTS `softwareconsultancy`;

CREATE SCHEMA `softwareconsultancy`;

USE `softwareconsultancy`;

-- -------------------------------------------------------------------------------

DROP TABLE IF EXISTS contractors;

-- create the table contractors that stored the basic details of the contractors

CREATE TABLE contractors (contractorID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
							contractorName VARCHAR(200) NOT NULL,
                            contractorDOB DATE NOT NULL,
                            phoneNo VARCHAR(10) NOT NULL,
                            email VARCHAR(345) NOT NULL,
                            homeAddress VARCHAR (500) NOT NULL,
                            hourRate VARCHAR(45)NOT NULL);
						
-- -------------------------------------------------------------------------------

DROP TABLE IF EXISTS clients;

-- create the table clients that stored the basic details of the clients

CREATE TABLE clients (clientID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
						clientName VARCHAR(300) NOT NULL,
                        contactName VARCHAR(100) NOT NULL,
                        contactNo VARCHAR(10) NOT NULL,
                        contactEmail VARCHAR(345) NOT NULL);
							
-- -------------------------------------------------------------------------------

DROP TABLE IF EXISTS projects;

-- create the table projects that stored the basic details of the projects
CREATE TABLE projects (projectID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
						projectName VARCHAR (300) NOT NULL,
                        startDate DATE NOT NULL,
                        endDate DATE NOT NULL,
                        requiredSkills VARCHAR(300) NOT NULL,
                        noOfContractors INT NOT NULL,
                        certificateLevel VARCHAR(300),
                        clientID INT NOT NULL,
						FOREIGN KEY(clientID) REFERENCES clients(clientID) ON DELETE CASCADE);
                        
-- -------------------------------------------------------------------------------

DROP TABLE IF EXISTS professional_certifications;

-- create the table professional_certifications that stored the certifications that the contractors owned

CREATE TABLE professional_certifications (  certificateName VARCHAR(100) NOT NULL,
                                            startDate DATE,
                                            endDate DATE,
                                            validTime VARCHAR(10),
                                            skills VARCHAR(1000) NOT NULL,
                                            contractorID INT NOT NULL,
                                            FOREIGN KEY(contractorID) REFERENCES contractors(contractorID) ON DELETE CASCADE);
                                            
-- -------------------------------------------------------------------------------

DROP TABLE IF EXISTS previous_works;

-- create the table previous_work that stored the details of the previous work that the contractors have

CREATE TABLE previous_works (companyName VARCHAR(300) PRIMARY KEY NOT NULL,
                            workingPeriod INT NOT NULL,
                            contractorID INT NOT NULL,
                            FOREIGN KEY(contractorID) REFERENCES contractors(contractorID) ON DELETE CASCADE);
                            
-- -------------------------------------------------------------------------------

DROP TABLE IF EXISTS security_clearances;

-- create the table security_clearance that stored the level of security clearance that the contractors owned

CREATE TABLE security_clearances (certificateLevel VARCHAR(300) PRIMARY KEY NOT NULL,
                                  achievedDate DATE,
                                  expireDate DATE,
                                  contractorID INT NOT NULL,
								  FOREIGN KEY(contractorID) REFERENCES contractors(contractorID) ON DELETE CASCADE);

-- -------------------------------------------------------------------------------

DROP TABLE IF EXISTS contractor_has_project;

-- create the table contractor_has_project that stored the project that each contractor has

CREATE TABLE contractor_has_project (contractorID INT NOT NULL,
									 FOREIGN KEY(contractorID) REFERENCES contractors(contractorID) ON DELETE CASCADE,
                                     projectID INT NOT NULL,
                                     FOREIGN KEY(projectID) REFERENCES projects(projectID) ON DELETE CASCADE);
                                     
-- -------------------------------------------------------------------------------
  
-- insert some representative data into the table 'contractors'
  
INSERT INTO contractors VALUES(0001, 'John Smith', '1990-12-07', '0123456789', 'johnsmith@gmail.com', '100 Senghenydd Road, Cardiff', '10.50');
INSERT INTO contractors VALUES(0002, 'Andy Taylor', '1980-07-26', '0983657878', 'andyTaylor@gmail.com', '24 Crwys Road, Cardiff', '20.00');
INSERT INTO contractors VALUES(0003, 'Nancy Cooper', '1998-02-02', '0946766887', 'nancyCopper@gmail.com', '130 Colum Road, Cardiff', '9.80');
INSERT INTO contractors VALUES(0004, 'Fei Liu', '2002-10-02', '0498547241', 'liufei@gmail.com', '70 Miskin Street, Cardiff', '9.00');
INSERT INTO contractors VALUES(0005, 'John Smith', '1985-01-20', '0987654321', 'smithJoHn@gmail.com', '80 Woodville Road, Cardiff', '15.50');
INSERT INTO contractors VALUES(0006, 'Cheng Liu', '2002-10-02', '0946985005', 'liucheng@gmail.com', '130 Kaotan Road, Newport', '10.50');
INSERT INTO contractors VALUES(0007, 'Si Hyun Park', '2003-01-30', '0132354754', 'sihyun@hotmail.com', '23 Park Place, Cardiff', '30.00');
INSERT INTO contractors VALUES(0008, 'Steven Phuc Tam', '2003-07-10', '0985666241', 'stevenphuctam@gmail.com', '235 East Tyndall Street, Cardiff', '18.20');
INSERT INTO contractors VALUES(0009, 'Will Smith', '1970-05-20', '0145345812', 'willSmith@yahoo.com', '02 Corbett Road, Cardiff', '15.20');
INSERT INTO contractors VALUES(0010, 'Aaron An', '1995-03-09', '0454212689', 'AaaRon@gmail.com', '90 Queens Street, Cardiff', '9.50');
INSERT INTO contractors VALUES(0011, 'Kiera Mckillop', '1993-02-14', '0936567981', 'kieraMc@gmail.com', '130 Colum Road, Cardiff', '17.00');
INSERT INTO contractors VALUES(0012, 'Sarah Jones', '1989-06-13', '0398795689', 'saarahJones@gmail.com', '96 Heath Street, Cardiff', '13.00');
INSERT INTO contractors VALUES(0013, 'Nyax Omosa', '1992-07-30', '0984545675', 'nyaxX@gmail.com', '35 Abbey Road, Newport', '11.00');
INSERT INTO contractors VALUES(0014, 'Andy Wood', '1991-09-05', '0246897531', 'andyWood@yahoo.com', '40 Newport Road, Cardiff', '23.10');
INSERT INTO contractors VALUES(0015, 'Ella Austin', '1987-11-20', '0135792468', 'ellaAus@gmail.com', '200 Woodville Road, Cardiff', '19.50');
INSERT INTO contractors VALUES(0016, 'Peter Parker', '2001-08-10', '0935751424', 'spiderman@hotmail.com', '100 Bolton Road, Newport', '12.00');
INSERT INTO contractors VALUES(0017, 'Kevin Yang', '1996-02-28', '0857357457', 'kevYang@gmail.com', '96 Ivy Street, Cardiff', '13.60');
INSERT INTO contractors VALUES(0018, 'Jeong Han Yoon', '1995-10-04', '0367891948', 'jeonghanSVT@gmail.com', '128 Maindy Road, Cardiff', '20.00');
INSERT INTO contractors VALUES(0019, 'Kim Nguyen', '1998-05-28', '0961424782', 'kimnguyen@gmail.com', '200 Bishton Street, Newport', '18.50');
INSERT INTO contractors VALUES(0020, 'Jae Min Na', '2000-08-13', '0698431742', 'jaeminNCT@yahoo.com', '70 Senghenydd Road, Cardiff', '14.50');

-- -------------------------------------------------------------------------------

-- insert some representative data into the table 'clients'

INSERT INTO clients (clientName, contactName, contactNo, contactEmail)
VALUES ('J&F Industries International Co., Ltd', 'Ying Mou Liu', '0946766866', 'bd@jfrack.com');
INSERT INTO clients (clientName, contactName, contactNo, contactEmail)
VALUES ('Cardiff University', 'Jackson Turner', '0245475426', 'cardiff@university.com');
INSERT INTO clients (clientName, contactName, contactNo, contactEmail)
VALUES ('Taiwan Semiconductor Manufacturing Company, Limited (tsmc)', 'Morris Chang', '0618578542', 'tsmc@taiwan.com');
INSERT INTO clients (clientName, contactName, contactNo, contactEmail)
VALUES ('Vietcombank', 'Quang Dung Pham', '0236574962', 'vietcom@bank.com');
INSERT INTO clients (clientName, contactName, contactNo, contactEmail)
VALUES ('ASUSTek Computer Inc.', 'Jonney Shih', '0591344189', 'asus@tech.com');

-- -------------------------------------------------------------------------------

-- insert some representative data into the table 'projects'

INSERT INTO projects (projectName, startDate, endDate, requiredSkills, noOfContractors, certificateLevel, clientID) VALUES ('Microbit Coding', '2018-12-31', '2019-03-31','Python', 2, NULL, 2);
INSERT INTO projects (projectName, startDate, endDate, requiredSkills, noOfContractors, certificateLevel, clientID) VALUES ('Marketing Website Development', '2019-01-15', '2019-06-17', 'HTML, Database', 5, 'SC', 5);
INSERT INTO projects (projectName, startDate, endDate, requiredSkills, noOfContractors, certificateLevel, clientID) VALUES ('Hangman Game', '2019-08-08', '2019-10-02','Python', 2,'BPSS', 3);
INSERT INTO projects (projectName, startDate, endDate, requiredSkills, noOfContractors, certificateLevel, clientID) VALUES ('Java Count Word Application', '2020-02-28', '2022-04-30', 'Java', 3, NULL, 4);
INSERT INTO projects (projectName, startDate, endDate, requiredSkills, noOfContractors, certificateLevel, clientID) VALUES ('Software Consultancy Database', '2020-05-16', '2020-09-01', 'Database', 4, 'SC',1);
INSERT INTO projects (projectName, startDate, endDate, requiredSkills, noOfContractors, certificateLevel, clientID) VALUES ('Vaccination Centre Website Development', '2020-11-24', '2021-01-01', 'HTML, Database', 5, 'DV', 3);
INSERT INTO projects (projectName, startDate, endDate, requiredSkills, noOfContractors, certificateLevel, clientID) VALUES ('Coworking Spaces Database', '2021-03-13', '2021-06-19', 'Database', 4, NULL, 1);  
INSERT INTO projects (projectName, startDate, endDate, requiredSkills, noOfContractors, certificateLevel, clientID) VALUES ('Wormhole Game', '2021-08-23', '2021-10-02', 'Java', 3, 'CTC', 4); 

-- -------------------------------------------------------------------------------

INSERT INTO professional_certifications (certificateName, startDate, endDate, validTime, skills, contractorID)
VALUES ('BSc Computer Science', '2018-06-17', '2021-06-17', '3 years', 'Python, Java, HTML', 1);
INSERT INTO professional_certifications (certificateName, startDate, endDate, validTime, skills, contractorID)
VALUES ('BSc Computer Science', '2000-06-24','2005-06-24', '5 years', 'Swift, Java, SQL, C++', 2);
INSERT INTO professional_certifications (certificateName, startDate, endDate, validTime, skills, contractorID)
VALUES ('BSc Computer Science', '2015-05-30', '2020-05-30', '5 years', 'Python, Java', 3);
INSERT INTO professional_certifications (certificateName, startDate, endDate, validTime, skills, contractorID)
VALUES ('MSc Software Engineering', '2021-06-23', '2024-06-23', '3 years', 'Python, Java, HTML, C#, C++', 1);
INSERT INTO professional_certifications (certificateName, startDate, endDate, validTime, skills, contractorID)
VALUES ('BSc Mathematics', '2018-05-31', '2021-05-31', '3 years', 'Python', 10);

-- -------------------------------------------------------------------------------

-- insert some representative data into the table 'previous_works'

INSERT INTO previous_works VALUES ('Amazon', 4, 1);
INSERT INTO previous_works VALUES ('Microsoft', 6, 20);
INSERT INTO previous_works VALUES ('Facebook', 1, 17);
INSERT INTO previous_works VALUES ('Snapchat', 1, 1);
INSERT INTO previous_works VALUES ('Tesla', 10, 11);

-- -------------------------------------------------------------------------------

-- insert some representative data into the table 'security_clearances'

INSERT INTO security_clearances VALUES ('BPSS', '2020-01-02', '2025-01-02' , 1);
INSERT INTO security_clearances VALUES ('CTC', '2018-05-22', '2023-05-22' , 15);
INSERT INTO security_clearances VALUES ('SC', '2022-03-10', '2027-03-10' , 12);
INSERT INTO security_clearances VALUES ('DV', '2020-11-05', '2025-11-05' , 8);

-- -------------------------------------------------------------------------------

-- insert some representative data into the table 'contractor_has_project'

INSERT INTO contractor_has_project (contractorID, projectID) VALUES (1,1);
INSERT INTO contractor_has_project (contractorID, projectID) VALUES (3,1);
INSERT INTO contractor_has_project (contractorID, projectID) VALUES (10,3);
INSERT INTO contractor_has_project (contractorID, projectID) VALUES (1,1);
INSERT INTO contractor_has_project (contractorID, projectID) VALUES (2,4);
INSERT INTO contractor_has_project (contractorID, projectID) VALUES (2,5);

-- -------------------------------------------------------------------------------

-- This is a view record that shows the certificates that every contractor hold

DROP VIEW IF EXISTS ContractorHasCertificatesRecord;

CREATE VIEW ContractorHasCertificatesRecord AS
SELECT contractorID, contractorName, certificateName, startDate, endDate, validTime, skills FROM contractors c 
JOIN professional_certifications pc
USING(contractorID) ORDER BY contractorID ASC;

SELECT * FROM ContractorHasCertificatesRecord;

-- -------------------------------------------------------------------------------

-- This is a view record that shows the contractors that have security clearances and the level that they have

DROP VIEW IF EXISTS ContractorHasSecurityClearancesRecord;

CREATE VIEW ContractorHasSecurityClearancesRecord AS
SELECT contractorID ,contractorName, certificateLevel, achievedDate, expireDate FROM contractors c 
JOIN security_clearances sc
USING(contractorID) ORDER BY expireDate ASC;

SELECT * FROM ContractorHasSecurityClearancesRecord;

-- -------------------------------------------------------------------------------

-- This is the view report that shows the list of contractors with the previous works that they have
-- Users can use this report when there is no specific contractor that they wants to find

DROP VIEW IF EXISTS ContractorHasPreviousWorksReport;

CREATE VIEW ContractorHasPreviousWorksReport AS
SELECT contractorName, companyName, workingPeriod FROM contractors c 
JOIN previous_works pw 
USING(contractorID) ORDER BY contractorName;

SELECT * FROM ContractorHasPreviousWorksReport;

-- -------------------------------------------------------------------------------

-- This is the stored procedure report of contractors with the previous works
-- The procedure uses IN parameter to get user input
-- Users can use this report when there is specific contractor that they wants to find
-- Users can do this by enter the name of the contractor that they want to find into the IN parameter

DROP PROCEDURE IF EXISTS findContractorHasPreviousWorksReport;

DELIMITER //
CREATE PROCEDURE findContractorHasPreviousWorksReport(conName VARCHAR(100))
BEGIN
SELECT * FROM ContractorHasPreviousWorksReport WHERE conName = contractorName;

END//
DELIMITER ;

-- testing
-- Users can enter the contractor's name that they want to find out about, and it will return only the result about that contractor
CALL findContractorHasPreviousWorksReport('Jae Min Na');
CALL findContractorHasPreviousWorksReport('John Smith');

-- -------------------------------------------------------------------------------

-- This is a view record that shows the projects that every clients had assigned to Fred's software consultancy to find contractors to work on it.

DROP VIEW IF EXISTS ClientHasProjectReport;

CREATE VIEW ClientHasProjectReport AS
SELECT clientID, clientName, projectID, projectName FROM clients JOIN projects USING(clientID);

SELECT * FROM ClientHasProjectReport;

-- -------------------------------------------------------------------------------
-- This is the view report that shows the list of contractors with the project that they are responsible for
-- Users can use this report when there is no specific contractor that they wants to find

DROP VIEW IF EXISTS ContractorHasProject;

CREATE VIEW ContractorHasProject AS
SELECT contractorID, contractorName, projectID, projectName FROM contractor_has_project 
JOIN contractors USING (contractorID)
JOIN projects USING (projectID);

SELECT * FROM ContractorHasProject;

-- -------------------------------------------------------------------------------

-- This is the stored procedure report of contractors with the project that they are responsible for
-- The procedure uses IN parameter to get user input
-- Users can use this report when there is specific contractor that they wants to find
-- Users can do this by enter the name of the contractor that they want to find into the IN parameter

DROP PROCEDURE IF EXISTS FindContractorHasProject;

DELIMITER //
CREATE PROCEDURE FindContractorHasProject(conName VARCHAR(300))
BEGIN
SELECT * FROM ContractorHasProject WHERE conName = contractorName;
END//
DELIMITER ;

-- testing
CALL FindContractorHasProject('Nancy Cooper');
CALL FindContractorHasProject('Aaron An');

-- -------------------------------------------------------------------------------

-- This is a function that uses to count the number of contractors in a project
-- The function will take in the projectID as a parameter and return the number of contractor in that project

DROP FUNCTION IF EXISTS CountContractorsInProject;

DELIMITER //
CREATE FUNCTION CountContractorsInProject(proID INT)
RETURNS INTEGER
BEGIN

RETURN (SELECT COUNT(contractorID) FROM contractor_has_project WHERE proID = projectID);

END//
DELIMITER ;

-- testing
SELECT CountContractorsInProject(1) AS 'Number of contractors in the project';
SELECT CountContractorsInProject(5) AS 'Number of contractors in the project';

-- -------------------------------------------------------------------------------

-- this is a procedure to due with error handling when adding the contractor into the table
-- There will be an error message if the format of the date is wrong

DROP PROCEDURE IF EXISTS AddContractorWithErrorHandling;

DELIMITER //
CREATE PROCEDURE AddContractorWithErrorHandling (conName VARCHAR(300), conDOB DATETIME, 
								phoneNum VARCHAR(10), conEmail VARCHAR(345), 
                                conAddress VARCHAR(345), conHourRate VARCHAR(45))
BEGIN

DECLARE WrongDateFormat CONDITION FOR 1265;
DECLARE EXIT HANDLER FOR WrongDateFormat
SELECT 'The DATE provided is in the wrong format!';
INSERT INTO contractors(contractorName, contractorDOB, phoneNo, email, homeAddress, hourRate)
VALUES(conName, conDOB, phoneNum, conEmail, conAddress, conHourRate);

SELECT COUNT(*) FROM contractors;

END//
DELIMITER ;

-- The date is in the correct format, no error message shown
CALL AddContractorWithErrorHandling('Yu Shan Huang','2002-04-08', '0763242340', 'yushanHuang@gmail.com', '34 Queens Street, Newport', '12.50');
-- The date is in the wrong format, error message shown
CALL AddContractorWithErrorHandling('Jacky Wu','1994-06-05 17:51:43', '0987234587', 'jackywue@gmail.com', '9 Aberdare Road, Cardiff', '10.50');
-- -------------------------------------------------------------------------------

-- This is a transaction that trying to update the details of the clients in the clients table
-- There is no problem with the first SQL query
-- But the second SQL query throws an error since contactEmail cannot be NULL
-- The SQL ROLLBACK, therefore there is no update on the clients table since not all the queries pass

DROP PROCEDURE IF EXISTS update_clients;

DELIMITER //
CREATE PROCEDURE update_clients()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
ROLLBACK;
END;
DECLARE EXIT HANDLER FOR SQLWARNING
BEGIN
ROLLBACK;
END;
START TRANSACTION;
UPDATE clients SET contactName = 'Wang Ching Fen' WHERE clientID = 1;
UPDATE clients SET contactEmail = NULL WHERE clientID = 5;
COMMIT;
END//
DELIMITER ;

CALL update_clients();

-- -------------------------------------------------------------------------------

-- This is another transaction that shows a transaction that is successfully committed
-- There are no problem with both of the query
-- Therefore the transction is sucessfully committed and the projects table is sucessfully updated

DROP PROCEDURE IF EXISTS update_projects;

DELIMITER //
CREATE PROCEDURE update_projects()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
ROLLBACK;
END;
DECLARE EXIT HANDLER FOR SQLWARNING
BEGIN
ROLLBACK;
END;
START TRANSACTION;
UPDATE projects SET clientID = 5 WHERE projectID = 3;
UPDATE projects SET endDate = '2022-01-01' WHERE projectID = 8;
COMMIT;
END//
DELIMITER ;

CALL update_projects();

-- -------------------------------------------------------------------------------

-- this is a trigger that update the noOfContractors in the 'projects' table
-- when a contractor is assigns to a new project or when a contractor is removes from a project in the table 'contractor_has_project'
-- the noOfContractor in the 'projects' table will be updated
DROP TRIGGER IF EXISTS update_noOfContractors;

DELIMITER //
CREATE TRIGGER update_noOfContractors
AFTER UPDATE ON contractor_has_project
FOR EACH ROW

BEGIN

IF OLD.projectID <> NEW.projectID THEN

UPDATE projects SET noOfContractors = noOfContractors+1
WHERE projectID = NEW.projectID;

UPDATE projects SET noOfContractors = noOfContractors-1
WHERE projectID = OLD.projectID;

END IF;

END //
DELIMITER ;

SELECT * FROM contractor_has_project;
SELECT * FROM projects;

UPDATE contractor_has_project SET projectID = 5 WHERE contractorID = 10;

-- -------------------------------------------------------------------------------

-- this a view to store the number of suitable contractors for all the projects that requires security clearances

DROP VIEW IF EXISTS ContractorWithSuitableSecurityClearances;

CREATE VIEW ContractorWithSuitableSecurityClearances AS
SELECT contractorID, contractorName, projectID, p.projectName, p.certificateLevel
FROM ContractorHasSecurityClearancesRecord JOIN projects p USING(certificateLevel);

SELECT * FROM ContractorWithSuitableSecurityClearances;
-- -------------------------------------------------------------------------------

-- this a procedure to fine the contractors for a specific projects that requires security clearances

DROP PROCEDURE IF EXISTS FindContractorWithSuitableSecurityClearances;

DELIMITER //
CREATE PROCEDURE FindContractorWithSuitableSecurityClearances(proID INT)
BEGIN
SELECT * FROM ContractorWithSuitableSecurityClearances WHERE proID = projectID;

END//
DELIMITER ;

-- testing
CALL FindContractorWithSuitableSecurityClearances(8);
CALL FindContractorWithSuitableSecurityClearances(2);

-- -------------------------------------------------------------------------------

-- this is the final management report

DROP VIEW IF EXISTS FinalManagementReport;

CREATE VIEW FinalManagementReport AS
SELECT contractorID, csc.contractorName, c.hourRate, projectID, csc.projectName, certificateLevel, chp.clientID, chp.clientName
FROM ContractorWithSuitableSecurityClearances csc
JOIN ClientHasProjectReport chp USING(projectID)
JOIN contractors c USING (contractorID);

SELECT * FROM FinalManagementReport;

-- JOIN ClientHasProjectReport cp USING (projectID);
-- create the final management report;
-- CREATE VIEW `management_report` AS SELECT * FROM contractors c
-- INNER JOIN previous_work pw USING (contractorID);

-- SELECT * FROM management_report;
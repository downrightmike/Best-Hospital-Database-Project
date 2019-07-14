/*
Downrightmike
Best Hospital Database Project
CIS 182
Created  on: 5/9/2019
This intended to be a demonstration of what would be needed in a hospital database and have methods to 
work with the information stored in the DB.
*/
/*ALTER DATABASE Best_Hospital_Downrightmike_Phase set single_user with rollback immediate
DROP DATABASE Best_Hospital_Downrightmike_Phase;
GO*/
CREATE DATABASE Best_Hospital_Downrightmike_Phase;
GO

USE Best_Hospital_Downrightmike_Phase;

CREATE TABLE Patients
(
ID int NOT NULL PRIMARY KEY,
FirstName varchar(40),
LastName varchar(40),
DateOfBirth date,
SocialSecurityNumber int,
StreetName varchar(40),
City varchar(40),
State varchar(20),
ZipCode varchar(20),
Country varchar(40)
)

CREATE TABLE StaffType
(
ID int NOT NULL PRIMARY KEY,
Type varchar(40),
CHECK (
Type in(
'Physician',
'Surgeon',
'Nurse',
'Lab',
'Administrative',
'IT')))
GO

CREATE TABLE Practitioners
(
ID int NOT NULL PRIMARY KEY,
FirstName varchar(40),
LastName varchar(40),
DateOfBirth date,
SocialSecurityNumber int,
StreetName varchar(40),
City varchar(40),
State varchar(20),
ZipCode varchar(20),
StaffType int FOREIGN KEY(ID) REFERENCES StaffType(ID),
YearlySalary int,
YearlyBonus int)


CREATE TABLE DepartmentType
(
ID int NOT NULL PRIMARY KEY,
Type varchar(40),
CHECK (
Type in(
'Emergency',
'Cardiology',
'Neurology',
'Intensive Care Unit',
'Labor & Delivery',
'Administration',
'Pediatric')))
GO

CREATE TABLE PatientsRecords (
ID int NOT NULL PRIMARY KEY,
PatientID int FOREIGN KEY(ID) REFERENCES Patients(ID),
SubmissionDate Date,
RoomNumber varchar(10),
InsurnacePolicyNumber varchar(40),
DischargeDate Date)

INSERT INTO Patients(ID,
FirstName,
LastName,
DateOfBirth,
SocialSecurityNumber,
StreetName,
City,
State,
ZipCode,
Country)
VALUES
(1, 'A','LNAMEA',GETDATE(),111223344,'BOOKER ST','TUCSON','AZ','85748-1254','USA'), 
(2, 'B','LNAMEB',GETDATE(),111223344,'BOOKER ST','TUCSON','AZ','85748-1254','USA'),
(3, 'C','LNAMEC',GETDATE(),111223344,'BOOKER ST','TUCSON','AZ','85748-1254','USA'),
(4, 'D','LNAMED',GETDATE(),111223344,'BOOKER ST','TUCSON','AZ','85748-1254','USA'),
(5, 'E','LNAMEE',GETDATE(),111223344,'BOOKER ST','TUCSON','AZ','85748-1254','USA'),
(6, 'F','LNAMEF',GETDATE(),111223344,'BOOKER ST','TUCSON','AZ','85748-1254','USA'),
(7, 'G','LNAMEG',GETDATE(),111223344,'BOOKER ST','TUCSON','AZ','85748-1254','USA'),
(8, 'H','LNAMEH',GETDATE(),111223344,'BOOKER ST','TUCSON','AZ','85748-1254','USA'),
(9, 'I','LNAMEI',GETDATE(),111223344,'BOOKER ST','TUCSON','AZ','85748-1254','USA'),
(10, 'J','LNAMEJ',GETDATE(),111223344,'BOOKER ST','TUCSON','AZ','85748-1254','USA');

INSERT INTO StaffType(ID, Type) VALUES
(1, 'Physician'),
(2, 'Surgeon'),
(3, 'Nurse'),
(4, 'Lab'),
(5, 'Administrative'),
(6, 'IT'); 
GO

INSERT INTO Practitioners(ID,
FirstName,
LastName,
DateOfBirth,
SocialSecurityNumber,
StreetName,
City,
State,
ZipCode,
StaffType,
YearlySalary,
YearlyBonus)
VALUES
(1, 'ADoc','LNAMEA',GETDATE(),111223344,'LOOKER ST','TUCSON','AZ','85748-1254',1,50000,5000), 
(2, 'BDoc','LNAMEB',GETDATE(),111223344,'LOOKER ST','TUCSON','AZ','85748-1254',1,50000,5000),
(3, 'CDoc','LNAMEC',GETDATE(),111223344,'LOOKER ST','TUCSON','AZ','85748-1254',1,50000,5000),
(4, 'DDoc','LNAMED',GETDATE(),111223344,'LOOKER ST','TUCSON','AZ','85748-1254',1,50000,5000),
(5, 'EDoc','LNAMEE',GETDATE(),111223344,'LOOKER ST','TUCSON','AZ','85748-1254',1,50000,5000);
/*(6, 'FDoc','LNAMEF',GETDATE(),111223334,'LOOKER ST','TUCSON','AZ','85748-1254',1,50000,5000),-- After adding IT as a stafftype, This row now adds.
(7, 'GDoc','LNAMEG',GETDATE(),111223344,'LOOKER ST','TUCSON','AZ','85748-1254',1,50000,5000),
(8, 'HDoc','LNAMEH',GETDATE(),111223344,'LOOKER ST','TUCSON','AZ','85748-1254',1,50000,5000),
(9, 'IDoc','LNAMEI',GETDATE(),111223344,'LOOKER ST','TUCSON','AZ','85748-1254',1,50000,5000),
(10, 'JDoc','LNAMEJ',GETDATE(),111223344,'LOOKER ST','TUCSON','AZ','85748-1254',1,50000,5000);
SELECT     Practitioners.StaffType, StaffType.Type
FROM         Practitioners INNER JOIN
                      StaffType ON Practitioners.ID = StaffType.ID*/

INSERT INTO PatientsRecords(
ID,
PatientID,
SubmissionDate,
RoomNumber,
InsurnacePolicyNumber,
DischargeDate)
VALUES
(1,1,GETDATE(), 'Room 1', 'ABCDE111', GETDATE()),
(2,2,GETDATE(), 'Room 1', 'ABCDE111', GETDATE()),
(3,3,GETDATE(), 'Room 1', 'ABCDE111', GETDATE()),
(4,4,GETDATE(), 'Room 1', 'ABCDE111', GETDATE()),
(5,5,GETDATE(), 'Room 1', 'ABCDE111', GETDATE()),
(6,6,GETDATE(), 'Room 1', 'ABCDE111', GETDATE()),
(7,7,GETDATE(), 'Room 1', 'ABCDE111', GETDATE()),
(8,8,GETDATE(), 'Room 1', 'ABCDE111', GETDATE()),
(9,9,GETDATE(), 'Room 1', 'ABCDE111', GETDATE()),
(10,10,GETDATE(), 'Room 1', 'ABCDE111', GETDATE());
GO --Phase 3 END

--Phase 4 Start
CREATE TABLE PatientsBillableItems (
ID int NOT NULL PRIMARY KEY,
PatientsRecordsID int FOREIGN KEY(ID) REFERENCES PatientsRecords(ID),
ItemDescription varchar(40),
Price varchar(10),
Quantity int,
NeedsPrescription binary,
AssignedByPractitionerID int FOREIGN KEY(ID) REFERENCES Practitioners(ID),
)

INSERT INTO PatientsBillableItems (
ID,
PatientsRecordsID,
ItemDescription,
Price,
Quantity,
NeedsPrescription,
AssignedByPractitionerID)
VALUES
(1,1,'ItemDescription1','$4.99',99,1,1),
(2,2,'ItemDescription2','$4.99',99,1,1),
(3,3,'ItemDescription3','$4.99',99,1,1),
(4,4,'ItemDescription4','$4.99',99,1,1),
(5,5,'ItemDescription5','$4.99',99,1,1),
(6,6,'ItemDescription6','$4.99',99,1,1),
(7,7,'ItemDescription7','$4.99',99,1,1),
(8,8,'ItemDescription8','$4.99',99,1,1),
(9,9,'ItemDescription9','$4.99',99,1,1),
(10,10,'ItemDescription11','$4.99',99,1,1);
GO

-- Phase 4 Q4
SELECT ItemDescription, SUM(Price), SUM(Quantity)
FROM PatientsBillableItems
GROUP BY 
ROLLUP(ItemDescription);

--Phase 4 Q5
SELECT AVG(Price)
FROM PatientsBillableItems;
--Phase 4 END

--Phase 5 Start

--Phase 5 Q1
INSERT INTO Patients(ID,
FirstName,
LastName,
DateOfBirth,
SocialSecurityNumber,
StreetName,
City,
State,
ZipCode,
Country)
VALUES
(11, 'K','LNAMEK',GETDATE(),111223344,'BOOKER ST','TUCSON','AZ','85748-1254','USA');

--Phase 5 Q2
UPDATE Practitioners
SET YearlySalary = YearlySalary * 1.05
WHERE YearlySalary < 50001;

--Phase 5 Q3
DELETE FROM Patients WHERE ID not IN (SELECT PatientID FROM PatientsRecords WHERE PatientID is not null) 

--Phase 6 Start
--Phase 6 Q1
SELECT P.FirstName, P.LastName, R.RoomNumber, B.ItemDescription,  D.FirstName AS 'Practitioner First Name', D.LastNAme AS 'Practitioner Last Name',  D.StaffType AS 'Practitioner Staff Type'  
FROM Patients P
JOIN PatientsRecords R on P.ID = R.PatientID
JOIN PatientsBillableItems B on P.ID = B.PatientsRecordsID
JOIN Practitioners D on D.ID = B.AssignedByPractitionerID

--Phase 6 Q2
SELECT P.FirstName, P.LastName, DATEDIFF(day, R.SubmissionDate, R.DischargeDate) AS 'Days Stayed'
FROM Patients P
JOIN PatientsRecords R on P.ID = R.PatientID;

--Phase 6 Q3
-- medical item price to 50% if they stayed more than 10 days and if itemQ > 1
BEGIN
	DECLARE @days int, @items int;

	SELECT @days = DATEDIFF(day, R.SubmissionDate, R.DischargeDate)
					FROM Patients P	
					JOIN PatientsRecords R on P.ID = R.PatientID;

	SELECT @items = B.Quantity	
					FROM Patients P
					JOIN PatientsBillableItems B on P.ID = B.PatientsRecordsID;
	IF @days > 10
	
		IF @items > 1
			UPDATE PatientsBillableItems
			SET Price = Price * 0.50
			WHERE PatientsBillableItems.PatientsRecordsID = ID; --
	END
--Query to check changes from above Proceedure:
 SELECT * 
 FROM PatientsBillableItems
 WHERE PatientsBillableItems.PatientsRecordsID = ID;

  --Phase 7 Q1
  -- sort patients into age groups
 	SELECT FirstName, LastName,
	CASE
		WHEN DATEDIFF(HOUR, DateOfBirth, GETDATE())/8766.0  <1 THEN 'INFANT'
		WHEN DATEDIFF(HOUR, DateOfBirth, GETDATE())/8766.0   BETWEEN 1 AND 3 THEN 'TODDLER' 
		WHEN DATEDIFF(HOUR, DateOfBirth, GETDATE())/8766.0   BETWEEN 3 AND 11 THEN 'CHILD'
		WHEN DATEDIFF(HOUR, DateOfBirth, GETDATE())/8766.0   BETWEEN 11 AND 17 THEN 'TEENAGER'
		WHEN DATEDIFF(HOUR, DateOfBirth, GETDATE())/8766.0   BETWEEN 17 AND 62 THEN 'ADULT'
		WHEN DATEDIFF(HOUR, DateOfBirth, GETDATE())/8766.0   >62 THEN 'SENIOR'
		ELSE ''
	END
	FROM Patients

--Phase 7 Q2
--Create a string of patients info
 	SELECT CONCAT(FirstName, ' ', LastName,' ',  StreetName,' ', City,' ', State,' ', ZipCode)
	FROM Patients
 
 --Phase 8 Start
CREATE TABLE Proceedures
(
ID int NOT NULL PRIMARY KEY,
PatientsRecordsID int FOREIGN KEY(ID) REFERENCES PatientsRecords(ID),
ProceedureName varchar(40),
DepartmentName varchar(40),
AssignedByPractitionerID int FOREIGN KEY(ID) REFERENCES Practitioners(ID),
DateOfProceedure date
)

CREATE TABLE Discharges
(
ID int NOT NULL PRIMARY KEY,
PatientsRecordsID int FOREIGN KEY(ID) REFERENCES PatientsRecords(ID),
AppointmentDate date,
AssignedByPractitionerID int FOREIGN KEY(ID) REFERENCES Practitioners(ID),
BloodTestNeeded binary
)

ALTER TABLE PatientsRecords 
ADD IsDischarged binary

BEGIN
	DECLARE @discharge binary, @DateDischarged date;

	SELECT @DateDischarged = '01/01/1901' --Use this variable as the date the patient was discharged on.

	SELECT @discharge = IsDischarged
					FROM PatientsRecords
					
	IF @discharge > 0
			UPDATE PatientsRecords
			SET DischargeDate = @DateDischarged;
	-- Not including a ELSE so it is automatically discarded by failing the IF statement.
	END

--Select all Patients names who have been discharged and have a blood test scheduled
SELECT P.FirstName, P.LastName 
FROM Patients P
JOIN PatientsRecords R on P.ID = R.PatientID
JOIN Discharges B on P.ID = B.PatientsRecordsID
WHERE R.IsDischarged > 0
AND B.BloodTestNeeded > 0
--Phase 8 END

--Phase 9 Start
CREATE VIEW V_DISCHARGED_PATIENTS 
AS SELECT P.FirstName, P.LastName, P.DateOfBirth, R.IsDischarged  
FROM Patients P
JOIN PatientsRecords R on P.ID = R.PatientID
WHERE R.IsDischarged > 0 
GROUP BY P.LastName, P.FirstName, P.DateOfBirth, R.IsDischarged;


CREATE VIEW V_PRACTITIONERS_W_TESTS
AS SELECT P.FIRSTNAME, 
P.LASTNAME, 
P.STAFFTYPE, 
COUNT(SELECT * 
		FROM DISCHARGES D 
		JOIN  PRACTITIONERS P on P.ID = D.AssignedByPractitionerID 
		WHERE D.BloodTestNeeded > 0) AS Count
FROM PRACTITIONERS P

SELECT P.FIRSTNAME
	,COUNT(*) AS iTEMS
	,SUM(CASE WHEN D.BLOODTESTNEEDED > 0 THEN 1 ELSE 0 END) AS [TESTS NEEDED]
FROM PRACTITIONERS P
	LEFT OUTER JOIN DISCHARGES D ON D.AssignedByPractitionerID = P.ID
GROUP BY P.FIRSTNAME 

--Q3
SELECT P.FirstName, P.LastName, R.SubmissionDate, R.DischargeDate 
	,COUNT(*) AS [Items Purchased]
	,SUM(CASE WHEN B.Quantity > 0 THEN B.Price ELSE 0 END) AS [Item Charges]
FROM PATIENTS P
JOIN PatientsRecords R on P.ID = R.PatientID
JOIN Discharges D on P.ID = D.PatientsRecordsID
JOIN PatientsBillableItems B on P.ID = B.PatientsRecordsID
GROUP BY P.FIRSTNAME, P.lastName, R.SubmissionDate, R.DischargeDate  


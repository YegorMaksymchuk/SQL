--DDL - Data Definition language
--Create new db. In MySQL same as db inside RDBMS.
CREATE SCHEMA `GoIT` DEFAULT CHARACTER SET eucjpms  DEFAULT COLLATE eucjpms_bin;
-- Change any parameters in db.
ALTER SCHEMA `GoIT`   DEFAULT CHARACTER SET utf8mb4;
--To delete db.
DROP SCHEMA `GoIT`;

--To create new table
CREATE TABLE `GoIT`.`Students` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC));
  COMMIT;

--To Change table or column.
ALTER TABLE `GoIT`.`Students`
ADD COLUMN `Address` VARCHAR(45) NOT NULL AFTER `Last_Name`;

-- Delete table.
DROP TABLE `GoIT`.`Students`;


--DML - Data Manipulation Language
--To create new records in table.
INSERT INTO `GoIT`.`Students` (`ID`, `First_Name`, `Last_Name`, `Address`) VALUES ('1', 'Ivan', 'Ivanov', 'Kiev');
INSERT INTO `GoIT`.`Students` (`ID`, `First_Name`, `Last_Name`, `Address`) VALUES ('2', 'Vasilisa', 'Vasilivna', 'Kharkov');
INSERT INTO `GoIT`.`Students` (`ID`, `First_Name`, `Last_Name`, `Address`) VALUES ('3', 'Abdula', 'Abdulaev', 'Alexandria');

--TO Select data from table.
SELECT * FROM GoIT.Students;
SELECT * FROM GoIT.Students WHERE ID=3;
SELECT * FROM GoIT.Students WHERE ID=1+2;
SELECT * FROM GoIT.Students WHERE `Address`='Lviv';
SELECT Students.First_Name as STUDENT_NAME FROM GoIT.Students WHERE ID=3;
SELECT count(*) as AMOUNT_OF_SUDENTS FROM GoIT.Students;

--Rewrite any date in table.
UPDATE `GoIT`.`Students` SET `First_Name`='Nazar', `Address`='Lviv' WHERE `ID`='1';


/*
DCL Data Control Language

Data Control Language(DCL) is used to control privilege in Database.
To perform any operation in the database, such as for creating tables, sequences or views we need privileges.
Privileges are of two types,

System : creating session, table etc are all types of system privilege.
Object : any command or query to work on tables comes under object privilege.
DCL defines two commands,

Grant : Gives user access privileges to database.
Revoke : Take back permissions from user.

To Allow a User to create Session
grant create session to username;

To Allow a User to create Table
grant create table to username;

To provide User with some Space on Tablespace to store Table
alter user username quota unlimited on system;

To Grant all privilege to a User
grant sysdba to username;

To Grant permission to Create any Table
grant create any table to username;

To Grant permission to Drop any Table
grant drop any table to username;

To take back Permissions
revoke create table from username;

*/

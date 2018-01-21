-- ACID – Atomicity, Consistency, Isolation, Durability (Атомарность, Согласованность, Изолированность, Долговечность).

--Atomicity.
--In a transaction involving two or more discrete pieces of information, either all of the pieces are committed or none are.

--Consistency.
--A transaction either creates a new and valid state of data, or, if any failure occurs,
--returns all data to its state before the transaction was started.

--Isolation.
--A transaction in process and not yet committed must remain isolated from any other transaction.

--Durability.
--Committed data is saved by the system such that, even in the event of a failure and system restart,
--the data is available in its correct state.

--The ACID concept is described in ISO/IEC 10026-1:1992 Section 4.

START TRANSACTION;
CREATE SCHEMA `GoIT` DEFAULT CHARACTER SET utf8mb4;
COMMIT;

BEGIN;
CREATE TABLE `GoIT`.`Students` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC));
COMMIT;


START TRANSACTION;
ALTER TABLE `GoIT`.`Students`
ADD COLUMN `Address` VARCHAR(45) NOT NULL AFTER `Last_Name`;
COMMIT;

BEGIN;
INSERT INTO `GoIT`.`Students` (`ID`, `First_Name`, `Last_Name`, `Address`) VALUES ('1', 'Ivan', 'Ivanov', 'Kiev');
INSERT INTO `GoIT`.`Students` (`ID`, `First_Name`, `Last_Name`, `Address`) VALUES ('2', 'Vasilisa', 'Vasilivna', 'Kharkov');
INSERT INTO `GoIT`.`Students` (`ID`, `First_Name`, `Last_Name`, `Address`) VALUES ('3', 'Abdula', 'Abdulaev', 'Alexandria');
COMMIT;

SELECT * FROM `GoIT`.`Students`;

BEGIN;
UPDATE `GoIT`.`Students` SET `First_Name`='Nazar', `Address`='Lviv' WHERE `ID`='1';
ROLLBACK;

SELECT * FROM `GoIT`.`Students`;

-- SAVEPOINT create point with saved data
START TRANSACTION;
SAVEPOINT SP1;
DELETE FROM `GoIT`.`Students` WHERE `ID`=3;
SELECT * FROM `GoIT`.`Students`;
ROLLBACK TO SAVEPOINT SP1; --  rolls back a transaction to the named savepoint without terminating the transaction.
SELECT * FROM `GoIT`.`Students`;
RELEASE SAVEPOINT SP1; --  removes the named savepoint from the set of savepoints of the current transaction.
COMMIT;

-- SET TRANSACTION LEVEL - config level of isolation transaction.
-- SET [GLOBAL | SESSION] TRANSACTION
SET TRANSACTION READ ONLY;-- set level read only.
START TRANSACTION;
SELECT * FROM `GoIT`.`Students`;
COMMIT;

SET TRANSACTION READ ONLY;-- set level read only.
START TRANSACTION;
DELETE FROM `GoIT`.`Students`WHERE `ID`=3;
COMMIT;
/*
    With the GLOBAL keyword,
the statement sets the default transaction level globally for all subsequent sessions.
Existing sessions are unaffected.

    With the SESSION keyword,
the statement sets the default transaction level for all subsequent
transactions performed within the current session.

    Without any SESSION or GLOBAL keyword,
the statement sets the isolation level for the next (not started)
transaction performed within the current session.
*/

SET SESSION TRANSACTION READ ONLY;
START TRANSACTION;
SELECT * FROM `GoIT`.`Students`;
DELETE FROM `GoIT`.`Students` WHERE `ID`=3;
SELECT * FROM `GoIT`.`Students`;
COMMIT;


/*
Isolation level	    Phantom read	Nonrepeatable read	Dirty read
Serializable	    Not possible	Not possible	    Not possible
Repeatable read	    Possible	    Not possible	    Not possible
Read committed	    Possible	    Possible	        Not possible
Read uncommitted	Possible	    Possible	        Possible
*/




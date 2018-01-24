/*
Isolation level	    Phantom read	Nonrepeatable read	Dirty read
Serializable	    Not possible	Not possible	    Not possible
Repeatable read	    Possible	    Not possible	    Not possible
Read committed	    Possible	    Possible	        Not possible
Read uncommitted	Possible	    Possible	        Possible
*/

/*Phantom read - The transaction re-executes a query that returns a rowset for a certain condition,
             and finds that the set of rows that satisfy the condition
             has changed due to a transaction that has completed during this time.*/

/*Nonrepeatable read - transaction re-read date after another transaction modify this data;*/

/*Dirty read - transaction can read data from another transaction before commit;*/

/*
Serialization anomaly - The result of successful commit of the transaction
               group is inconsistent with all possible variants of execution
               of these transactions in turn.
*/

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



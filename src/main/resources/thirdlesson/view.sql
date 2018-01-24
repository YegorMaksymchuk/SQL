USE `GoIT`;
START TRANSACTION;
CREATE  OR REPLACE
    ALGORITHM = UNDEFINED
    DEFINER = `root`@`%`
    SQL SECURITY DEFINER
VIEW `GoIT`.`GetAllStudents` AS
    SELECT
        `GoIT`.`Students`.`ID` AS `ID`,
        `GoIT`.`Students`.`First_Name` AS `First_Name`,
        `GoIT`.`Students`.`Last_Name` AS `Last_Name`,
        `GoIT`.`Students`.`Address` AS `Address`
    FROM
        `GoIT`.`Students`;
COMMIT;

USE `GoIT`
SELECT * FROM GoIT.GetAllStudents;
DROP VIEW `GoIT`.`GetAllStudents`;

SELECT * FROM GoIT.Students;
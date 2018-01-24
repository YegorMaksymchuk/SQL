USE `SQL`;
DROP procedure IF EXISTS `myprocedure`;

DELIMITER $$
USE `SQL`$$
CREATE PROCEDURE `myprocedure` (a INT , b INT)
BEGIN
IF a>b THEN DELETE FROM `GoIT``.`Students` WHERE `ID`=1;
ELSEIF a==b DELETE FROM `GoIT`.`Students` WHERE `ID`=2;
ELSE DELETE FROM `GoIT`.`Students` WHERE `ID`=3;
 END IF;
END$$

DELIMITER ;



CALL SQL.myprocedure(1,0);

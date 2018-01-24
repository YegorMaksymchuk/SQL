USE `GoIT`;
DROP procedure IF EXISTS `name_my_new_procedure`;

DELIMITER $$
USE `GoIT`$$
CREATE PROCEDURE `name_my_new_procedure` ()
BEGIN
DELETE FROM `GoIT`.`Students` WHERE `ID`=2;
END$$

DELIMITER ;

CALL GoIT.myprocedure();

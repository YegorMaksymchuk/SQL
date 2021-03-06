CREATE TABLE `GoIT`.`CARS` (
  `MACKER` VARCHAR(45) NOT NULL,
  `MODEL` VARCHAR(45) NULL,
  PRIMARY KEY (`MACKER`));

INSERT INTO `GoIT`.`CARS` (`MACKER`, `MODEL`) VALUES ('BMW', 'X3, X5, X5M');
INSERT INTO `GoIT`.`CARS` (`MACKER`, `MODEL`) VALUES ('NISSAN', 'GT-R');

ALTER TABLE `GoIT`.`CARS`
DROP PRIMARY KEY;

ALTER TABLE `GoIT`.`CARS`
ADD COLUMN `ID` INT NOT NULL AUTO_INCREMENT AFTER `MODEL`,
ADD PRIMARY KEY (`ID`);

UPDATE `GoIT`.`CARS` SET `MODEL`='X3' WHERE `ID`='1';
INSERT INTO `GoIT`.`CARS` (`MACKER`, `MODEL`) VALUES ('BMW', 'X5');
INSERT INTO `GoIT`.`CARS` (`MACKER`, `MODEL`) VALUES ('BMW', 'X5M');

-- First Normal form
SELECT * FROM GoIT.CARS;

COMMIT;


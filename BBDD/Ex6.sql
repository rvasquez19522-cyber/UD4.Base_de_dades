-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex6` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Ex6` ;

-- -----------------------------------------------------
-- Table `Ex6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6`.`Avio` (
  `AvioID` INT NOT NULL,
  `Model` VARCHAR(50) NULL DEFAULT NULL,
  `Capacitat` INT NULL DEFAULT NULL,
  PRIMARY KEY (`AvioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Ex6`.`Passatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6`.`Passatger` (
  `DNI_Passaport` VARCHAR(20) NOT NULL,
  `Nom` VARCHAR(50) NULL DEFAULT NULL,
  `Cognoms` VARCHAR(50) NULL DEFAULT NULL,
  `Telefon` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Adreça` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`DNI_Passaport`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Ex6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6`.`Vol` (
  `NumeroVol` INT NOT NULL,
  `AvioID` INT NULL DEFAULT NULL,
  `Origen` VARCHAR(50) NULL DEFAULT NULL,
  `Desti` VARCHAR(50) NULL DEFAULT NULL,
  `DataSortida` DATE NULL DEFAULT NULL,
  `DataArribada` DATE NULL DEFAULT NULL,
  `HoraSortida` TIME NULL DEFAULT NULL,
  `HoraArribada` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`NumeroVol`),
  INDEX `AvioID` (`AvioID` ASC) VISIBLE,
  CONSTRAINT `Vol_ibfk_1`
    FOREIGN KEY (`AvioID`)
    REFERENCES `Ex6`.`Avio` (`AvioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Ex6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6`.`Reserva` (
  `ReservaID` INT NOT NULL AUTO_INCREMENT,
  `PassatgerDNI` VARCHAR(20) NULL DEFAULT NULL,
  `DataReserva` DATE NULL DEFAULT NULL,
  `NumeroVol` INT NULL DEFAULT NULL,
  `ImportTotal` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ReservaID`),
  INDEX `PassatgerDNI` (`PassatgerDNI` ASC) VISIBLE,
  INDEX `NumeroVol` (`NumeroVol` ASC) VISIBLE,
  CONSTRAINT `Reserva_ibfk_1`
    FOREIGN KEY (`PassatgerDNI`)
    REFERENCES `Ex6`.`Passatger` (`DNI_Passaport`),
  CONSTRAINT `Reserva_ibfk_2`
    FOREIGN KEY (`NumeroVol`)
    REFERENCES `Ex6`.`Vol` (`NumeroVol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

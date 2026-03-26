-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex4` ;
USE `Ex4` ;

-- -----------------------------------------------------
-- Table `Ex4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4`.`Client` (
  `idClient` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Vip` INT(1) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4`.`Venedor` (
  `idVenedor` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  PRIMARY KEY (`idVenedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex4`.`TipusPolisa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4`.`TipusPolisa` (
  `idTipusPolisa` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipusPolisa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex4`.`Polisa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4`.`Polisa` (
  `idPolisa` INT NOT NULL,
  `NumPolisa` VARCHAR(45) NULL,
  `Client_idClient` INT NOT NULL,
  `Venedor_idVenedor` INT NOT NULL,
  `TipusPolisa_idTipusPolisa` INT NOT NULL,
  `PreuAnual` INT NOT NULL,
  `TipusPagament` VARCHAR(45) NULL,
  `DataDeContractacio` VARCHAR(10) NULL,
  `IniciVigencia` VARCHAR(10) NULL,
  `FiVigencia` VARCHAR(10) NULL,
  `NumSS` VARCHAR(45) NULL,
  PRIMARY KEY (`idPolisa`),
  INDEX `fk_Polisa_Client_idx` (`Client_idClient` ASC) VISIBLE,
  INDEX `fk_Polisa_Venedor1_idx` (`Venedor_idVenedor` ASC) VISIBLE,
  INDEX `fk_Polisa_TipusPolisa1_idx` (`TipusPolisa_idTipusPolisa` ASC) VISIBLE,
  CONSTRAINT `fk_Polisa_Client`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `Ex4`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polisa_Venedor1`
    FOREIGN KEY (`Venedor_idVenedor`)
    REFERENCES `Ex4`.`Venedor` (`idVenedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polisa_TipusPolisa1`
    FOREIGN KEY (`TipusPolisa_idTipusPolisa`)
    REFERENCES `Ex4`.`TipusPolisa` (`idTipusPolisa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

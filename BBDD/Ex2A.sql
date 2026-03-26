-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pacient` (
  `idPacient` INT NOT NULL AUTO_INCREMENT,
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(100) NULL,
  `Telefono` VARCHAR(15) NULL,
  `Direccio` VARCHAR(100) NULL,
  `NombreSS` VARCHAR(20) NULL,
  PRIMARY KEY (`idPacient`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Metge` (
  `idMetge` INT NOT NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(100) NULL,
  `Cognoms` VARCHAR(100) NULL,
  `Telefono` VARCHAR(15) NULL,
  `NumColMetge` VARCHAR(20) NULL,
  `Especialitat` VARCHAR(100) NULL,
  `Carrec` VARCHAR(100) NULL,
  PRIMARY KEY (`idMetge`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta` (
  `idConsulta` INT NOT NULL,
  `Pacient` VARCHAR(45) NULL,
  `Metge` VARCHAR(45) NULL,
  `data` DATE NULL,
  `Llit` INT NULL,
  `Planta` INT NULL,
  `Diagnostic` VARCHAR(45) NULL,
  `Pacient_idPacient` INT NOT NULL,
  `Metge_idMetge` INT NOT NULL,
  PRIMARY KEY (`idConsulta`),
  INDEX `fk_Consulta_Pacient1_idx` (`Pacient_idPacient` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_idMetge` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient1`
    FOREIGN KEY (`Pacient_idPacient`)
    REFERENCES `mydb`.`Pacient` (`idPacient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_idMetge`)
    REFERENCES `mydb`.`Metge` (`idMetge`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

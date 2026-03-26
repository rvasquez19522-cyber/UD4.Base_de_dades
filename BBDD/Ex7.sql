-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Ex7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex7` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Ex7` ;

-- -----------------------------------------------------
-- Table `Ex7`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7`.`Empleat` (
  `EmpleatID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(50) NULL DEFAULT NULL,
  `Adreça` VARCHAR(100) NULL DEFAULT NULL,
  `DataNaixement` DATE NULL DEFAULT NULL,
  `Edat` INT NULL DEFAULT NULL,
  PRIMARY KEY (`EmpleatID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Ex7`.`Tiquet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7`.`Tiquet` (
  `TiquetID` INT NOT NULL AUTO_INCREMENT,
  `NumeroFactura` VARCHAR(20) NULL DEFAULT NULL,
  `EmpleatID` INT NULL DEFAULT NULL,
  `DataHoraVenda` DATETIME NULL DEFAULT NULL,
  `TotalIVA` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`TiquetID`),
  INDEX `EmpleatID` (`EmpleatID` ASC) VISIBLE,
  CONSTRAINT `Tiquet_ibfk_1`
    FOREIGN KEY (`EmpleatID`)
    REFERENCES `Ex7`.`Empleat` (`EmpleatID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Ex7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7`.`Producte` (
  `CodiProducte` INT NOT NULL,
  `Descripcio` VARCHAR(100) NULL DEFAULT NULL,
  `CodiBarres` VARCHAR(50) NULL DEFAULT NULL,
  `PreuUnitariSenseIVA` DECIMAL(10,2) NULL DEFAULT NULL,
  `IVA` DECIMAL(5,2) NULL DEFAULT NULL,
  `PreuVendaPublicIVA` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`CodiProducte`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Ex7`.`LiniaTiquet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7`.`LiniaTiquet` (
  `LiniaTiquetID` INT NOT NULL AUTO_INCREMENT,
  `TiquetID` INT NULL DEFAULT NULL,
  `CodiProducte` INT NULL DEFAULT NULL,
  `DescripcioProducte` VARCHAR(100) NULL DEFAULT NULL,
  `Unitats` INT NULL DEFAULT NULL,
  `Descompte` DECIMAL(5,2) NULL DEFAULT NULL,
  `PreuUnitariIVA` DECIMAL(10,2) NULL DEFAULT NULL,
  `PreuTotalLiniaIVA` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`LiniaTiquetID`),
  INDEX `TiquetID` (`TiquetID` ASC) VISIBLE,
  INDEX `CodiProducte` (`CodiProducte` ASC) VISIBLE,
  CONSTRAINT `LiniaTiquet_ibfk_1`
    FOREIGN KEY (`TiquetID`)
    REFERENCES `Ex7`.`Tiquet` (`TiquetID`),
  CONSTRAINT `LiniaTiquet_ibfk_2`
    FOREIGN KEY (`CodiProducte`)
    REFERENCES `Ex7`.`Producte` (`CodiProducte`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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
-- Table `mydb`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cine` (
  `idCine` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `nSales` VARCHAR(45) NULL,
  PRIMARY KEY (`idCine`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pelicula` (
  `idPelicula` INT NOT NULL,
  `Titol` VARCHAR(45) NULL,
  `Clasificacio` VARCHAR(45) NULL,
  `Genere` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `Durada` VARCHAR(45) NULL,
  PRIMARY KEY (`idPelicula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarifa` (
  `idTarifa` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  PRIMARY KEY (`idTarifa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Projeccio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Projeccio` (
  `idCine` INT NOT NULL,
  `hora` VARCHAR(45) NULL,
  `Sala` VARCHAR(45) NULL,
  `Cine_idCine` INT NOT NULL,
  `Pelicula_idPelicula` INT NOT NULL,
  `Tarifa_idTarifa` INT NOT NULL,
  PRIMARY KEY (`idCine`),
  INDEX `fk_Projeccio_Cine1_idx` (`Cine_idCine` ASC) VISIBLE,
  INDEX `fk_Projeccio_Pelicula1_idx` (`Pelicula_idPelicula` ASC) VISIBLE,
  INDEX `fk_Projeccio_Tarifa1_idx` (`Tarifa_idTarifa` ASC) VISIBLE,
  CONSTRAINT `fk_Projeccio_Cine1`
    FOREIGN KEY (`Cine_idCine`)
    REFERENCES `mydb`.`Cine` (`idCine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccio_Pelicula1`
    FOREIGN KEY (`Pelicula_idPelicula`)
    REFERENCES `mydb`.`Pelicula` (`idPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccio_Tarifa1`
    FOREIGN KEY (`Tarifa_idTarifa`)
    REFERENCES `mydb`.`Tarifa` (`idTarifa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

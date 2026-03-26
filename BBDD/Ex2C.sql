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
-- Table `mydb`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumne` (
  `idAlumne` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  PRIMARY KEY (`idAlumne`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departament` (
  `idDepartament` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idDepartament`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesor` (
  `idProfesor` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Titol` VARCHAR(45) NULL,
  `departament` VARCHAR(45) NULL,
  `Profesorcol` VARCHAR(45) NULL,
  `EsCapDepartament` TINYINT NULL,
  `Departament_idDepartament` INT NOT NULL,
  PRIMARY KEY (`idProfesor`),
  INDEX `fk_Profesor_Departament1_idx` (`Departament_idDepartament` ASC) VISIBLE,
  CONSTRAINT `fk_Profesor_Departament1`
    FOREIGN KEY (`Departament_idDepartament`)
    REFERENCES `mydb`.`Departament` (`idDepartament`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Assignatura` (
  `idAssignatura` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `credits` VARCHAR(45) NULL,
  `departament` VARCHAR(45) NULL,
  `profesor` VARCHAR(45) NULL,
  PRIMARY KEY (`idAssignatura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `idMatricula` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Alumne_idAlumne` INT NOT NULL,
  `Assignatura` VARCHAR(45) NULL,
  PRIMARY KEY (`idMatricula`),
  INDEX `fk_Matricula_Alumne1_idx` (`Alumne_idAlumne` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumne1`
    FOREIGN KEY (`Alumne_idAlumne`)
    REFERENCES `mydb`.`Alumne` (`idAlumne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MAP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MAP` (
  `Matricula_idMatricula` INT NOT NULL,
  `Assignatura_idAssignatura` INT NOT NULL,
  `Profesor_idProfesor` INT NOT NULL,
  INDEX `fk_MAP_Matricula1_idx` (`Matricula_idMatricula` ASC) VISIBLE,
  INDEX `fk_MAP_Assignatura1_idx` (`Assignatura_idAssignatura` ASC) VISIBLE,
  INDEX `fk_MAP_Profesor1_idx` (`Profesor_idProfesor` ASC) VISIBLE,
  CONSTRAINT `fk_MAP_Matricula1`
    FOREIGN KEY (`Matricula_idMatricula`)
    REFERENCES `mydb`.`Matricula` (`idMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MAP_Assignatura1`
    FOREIGN KEY (`Assignatura_idAssignatura`)
    REFERENCES `mydb`.`Assignatura` (`idAssignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MAP_Profesor1`
    FOREIGN KEY (`Profesor_idProfesor`)
    REFERENCES `mydb`.`Profesor` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

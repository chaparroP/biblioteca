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
-- Table `mydb`.`LIBRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LIBRO` (
  `idLIBRO` INT NOT NULL,
  `TITULO` VARCHAR(45) NOT NULL,
  `ESTADO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLIBRO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ESTUDIANTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ESTUDIANTE` (
  `id_estudiante` INT NOT NULL,
  `NOMBRES` VARCHAR(45) NOT NULL,
  `APELLIDOS` VARCHAR(45) NOT NULL,
  `CURSO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estudiante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesor` (
  `idProfesor` INT NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `asignatura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProfesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prestamo` (
  `idPrestamo` INT NOT NULL,
  `fechaPrestamo` VARCHAR(10) NOT NULL,
  `horaPrestamo` VARCHAR(10) NOT NULL,
  `fechaEntrega` VARCHAR(10) NOT NULL,
  `horaEntrega` VARCHAR(45) NOT NULL,
  `estudiante_id_estudiante` INT NOT NULL,
  `LIBRO_idLIBRO` INT NOT NULL,
  `Profesor_idProfesor` INT NOT NULL,
  PRIMARY KEY (`idPrestamo`, `estudiante_id_estudiante`, `LIBRO_idLIBRO`, `Profesor_idProfesor`),
  INDEX `fk_Prestamo_estudiante_idx` (`estudiante_id_estudiante` ASC) VISIBLE,
  INDEX `fk_Prestamo_LIBRO1_idx` (`LIBRO_idLIBRO` ASC) VISIBLE,
  INDEX `fk_Prestamo_Profesor1_idx` (`Profesor_idProfesor` ASC) VISIBLE,
  CONSTRAINT `fk_Prestamo_estudiante`
    FOREIGN KEY (`estudiante_id_estudiante`)
    REFERENCES `mydb`.`ESTUDIANTE` (`id_estudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestamo_LIBRO1`
    FOREIGN KEY (`LIBRO_idLIBRO`)
    REFERENCES `mydb`.`LIBRO` (`idLIBRO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestamo_Profesor1`
    FOREIGN KEY (`Profesor_idProfesor`)
    REFERENCES `mydb`.`Profesor` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor` (
  `id_autor` INT NOT NULL,
  `autor` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`librosporautor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`librosporautor` (
  `autor_idautor` INT NOT NULL,
  `LIBRO_idLIBRO` INT NOT NULL,
  PRIMARY KEY (`autor_idautor`, `LIBRO_idLIBRO`),
  INDEX `fk_librosporautor_autor1_idx` (`autor_idautor` ASC) VISIBLE,
  INDEX `fk_librosporautor_LIBRO1_idx` (`LIBRO_idLIBRO` ASC) VISIBLE,
  CONSTRAINT `fk_librosporautor_autor1`
    FOREIGN KEY (`autor_idautor`)
    REFERENCES `mydb`.`autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_librosporautor_LIBRO1`
    FOREIGN KEY (`LIBRO_idLIBRO`)
    REFERENCES `mydb`.`LIBRO` (`idLIBRO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genero` (
  `id_genero` INT NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_genero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`librosporgenero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`librosporgenero` (
  `genero_id_genero` INT NOT NULL,
  `LIBRO_idLIBRO` INT NOT NULL,
  PRIMARY KEY (`genero_id_genero`, `LIBRO_idLIBRO`),
  INDEX `fk_librosporgenero_LIBRO1_idx` (`LIBRO_idLIBRO` ASC) VISIBLE,
  CONSTRAINT `fk_librosporgenero_genero1`
    FOREIGN KEY (`genero_id_genero`)
    REFERENCES `mydb`.`genero` (`id_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_librosporgenero_LIBRO1`
    FOREIGN KEY (`LIBRO_idLIBRO`)
    REFERENCES `mydb`.`LIBRO` (`idLIBRO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO estudiante (id_estudiante,NOMBRES,APELLIDOS,CURSO) VALUES ('123','Jose pablo','cabrera colarte','3°A');
INSERT INTO estudiante (id_estudiante,NOMBRES,APELLIDOS,CURSO) VALUES ('541','fernando alejandro','contreras poblete','5°c');

INSERT INTO libro (idLIBRO,TITULO,ESTADO ) VALUES ('456','IT','Nuevo');
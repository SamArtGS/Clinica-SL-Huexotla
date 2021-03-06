-- MySQL Script generated by MySQL Workbench
-- Wed Dec 18 19:51:24 2019
-- Model: New Model    Version: 1.0
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
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`ANTECEDENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ANTECEDENTES` (
  `PACIENTE_idPACIENTE` INT NOT NULL AUTO_INCREMENT,
  `AntHeredofam` VARCHAR(1000) NULL,
  `AntPNPatolog` VARCHAR(1000) NULL,
  `AntPPatol` VARCHAR(1000) NULL,
  `AntGinobs` VARCHAR(1000) NULL,
  `AntTerap` VARCHAR(1000) NULL,
  PRIMARY KEY (`PACIENTE_idPACIENTE`),
  CONSTRAINT `fk_ANTECEDENTES_PACIENTE1`
    FOREIGN KEY (`PACIENTE_idPACIENTE`)
    REFERENCES `mydb`.`PACIENTE` (`idPACIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`CIRUGIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CIRUGIA` (
  `idCIRUGIA` INT NOT NULL AUTO_INCREMENT,
  `DIAGNOSTICO_idDIAGNOSTICO` INT NOT NULL,
  `FechaHoraInicio` DATETIME NOT NULL,
  `FechaHoraFin` DATETIME NULL,
  PRIMARY KEY (`idCIRUGIA`, `DIAGNOSTICO_idDIAGNOSTICO`),
  CONSTRAINT `fk_CIRUGIA_DIAGNOSTICO1`
    FOREIGN KEY (`DIAGNOSTICO_idDIAGNOSTICO`)
    REFERENCES `mydb`.`DIAGNOSTICO` (`idDIAGNOSTICO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_CIRUGIA_DIAGNOSTICO1_idx` ON `mydb`.`CIRUGIA` (`DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idCIRUGIA_UNIQUE` ON `mydb`.`CIRUGIA` (`idCIRUGIA` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `DIAGNOSTICO_idDIAGNOSTICO_UNIQUE` ON `mydb`.`CIRUGIA` (`DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`CITA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CITA` (
  `idCITA` INT NOT NULL AUTO_INCREMENT,
  `FechaHora` DATETIME NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `PACIENTE_idPACIENTE` INT NOT NULL,
  `MEDICO_CedProf` INT NOT NULL,
  PRIMARY KEY (`idCITA`, `PACIENTE_idPACIENTE`, `MEDICO_CedProf`),
  CONSTRAINT `fk_CITA_PACIENTE1`
    FOREIGN KEY (`PACIENTE_idPACIENTE`)
    REFERENCES `mydb`.`PACIENTE` (`idPACIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CITA_MEDICO1`
    FOREIGN KEY (`MEDICO_CedProf`)
    REFERENCES `mydb`.`MEDICO` (`CedProf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_CITA_PACIENTE1_idx` ON `mydb`.`CITA` (`PACIENTE_idPACIENTE` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_CITA_MEDICO1_idx` ON `mydb`.`CITA` (`MEDICO_CedProf` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`CONSULTAGENERAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONSULTAGENERAL` (
  `idCONSULTAGENERAL` INT NOT NULL AUTO_INCREMENT,
  `DIAGNOSTICO_idDIAGNOSTICO` INT NOT NULL,
  `MEDICO_CedProf` INT NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `FechaHora` DATETIME NOT NULL,
  PRIMARY KEY (`idCONSULTAGENERAL`, `DIAGNOSTICO_idDIAGNOSTICO`, `MEDICO_CedProf`),
  CONSTRAINT `fk_CONSULTAGENERAL_DIAGNOSTICO1`
    FOREIGN KEY (`DIAGNOSTICO_idDIAGNOSTICO`)
    REFERENCES `mydb`.`DIAGNOSTICO` (`idDIAGNOSTICO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTAGENERAL_MEDICO1`
    FOREIGN KEY (`MEDICO_CedProf`)
    REFERENCES `mydb`.`MEDICO` (`CedProf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_CONSULTAGENERAL_DIAGNOSTICO1_idx` ON `mydb`.`CONSULTAGENERAL` (`DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_CONSULTAGENERAL_MEDICO1_idx` ON `mydb`.`CONSULTAGENERAL` (`MEDICO_CedProf` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idCONSULTAGENERAL_UNIQUE` ON `mydb`.`CONSULTAGENERAL` (`idCONSULTAGENERAL` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `DIAGNOSTICO_idDIAGNOSTICO_UNIQUE` ON `mydb`.`CONSULTAGENERAL` (`DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `MEDICO_CedProf_UNIQUE` ON `mydb`.`CONSULTAGENERAL` (`MEDICO_CedProf` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`DIAGNOSTICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DIAGNOSTICO` (
  `idDIAGNOSTICO` INT NOT NULL AUTO_INCREMENT,
  `FechaInicio` DATE NOT NULL,
  `FechaFin` DATE NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  `Descripción` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idDIAGNOSTICO`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idDIAGNOSTICO_UNIQUE` ON `mydb`.`DIAGNOSTICO` (`idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`ESTUDIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ESTUDIO` (
  `idESTUDIO` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NULL,
  `Fecha` DATETIME NOT NULL,
  `Direccion` BLOB NOT NULL,
  `NOTA_MEDICA_idNOTA MEDICA` INT NOT NULL,
  `NOTA_MEDICA_CIRUGIA_idCIRUGIA` INT NOT NULL,
  `NOTA_MEDICA_CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` INT NOT NULL,
  `NOTA_MEDICA_CONSULTAGENERAL_idCONSULTAGENERAL` INT NOT NULL,
  `NOTA_MEDICA_CONSULTAGENERAL_DIAGNOSTICO_idDIAGNOSTICO` INT NOT NULL,
  `NOTA_MEDICA_CONSULTAGENERAL_MEDICO_CedProf` INT NOT NULL,
  PRIMARY KEY (`idESTUDIO`, `NOTA_MEDICA_idNOTA MEDICA`, `NOTA_MEDICA_CIRUGIA_idCIRUGIA`, `NOTA_MEDICA_CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO`, `NOTA_MEDICA_CONSULTAGENERAL_idCONSULTAGENERAL`, `NOTA_MEDICA_CONSULTAGENERAL_DIAGNOSTICO_idDIAGNOSTICO`, `NOTA_MEDICA_CONSULTAGENERAL_MEDICO_CedProf`),
  CONSTRAINT `fk_ESTUDIO_NOTA_MEDICA1`
    FOREIGN KEY (`NOTA_MEDICA_idNOTA MEDICA` , `NOTA_MEDICA_CIRUGIA_idCIRUGIA` , `NOTA_MEDICA_CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` , `NOTA_MEDICA_CONSULTAGENERAL_idCONSULTAGENERAL` , `NOTA_MEDICA_CONSULTAGENERAL_DIAGNOSTICO_idDIAGNOSTICO` , `NOTA_MEDICA_CONSULTAGENERAL_MEDICO_CedProf`)
    REFERENCES `mydb`.`NOTA_MEDICA` (`idNOTA MEDICA` , `CIRUGIA_idCIRUGIA` , `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` , `CONSULTAGENERAL_idCONSULTAGENERAL` , `CONSULTAGENERAL_DIAGNOSTICO_idDIAGNOSTICO` , `CONSULTAGENERAL_MEDICO_CedProf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_ESTUDIO_NOTA_MEDICA1_idx` ON `mydb`.`ESTUDIO` (`NOTA_MEDICA_idNOTA MEDICA` ASC, `NOTA_MEDICA_CIRUGIA_idCIRUGIA` ASC, `NOTA_MEDICA_CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` ASC, `NOTA_MEDICA_CONSULTAGENERAL_idCONSULTAGENERAL` ASC, `NOTA_MEDICA_CONSULTAGENERAL_DIAGNOSTICO_idDIAGNOSTICO` ASC, `NOTA_MEDICA_CONSULTAGENERAL_MEDICO_CedProf` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idESTUDIO_UNIQUE` ON `mydb`.`ESTUDIO` (`idESTUDIO` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `NOTA_MEDICA_idNOTA MEDICA_UNIQUE` ON `mydb`.`ESTUDIO` (`NOTA_MEDICA_idNOTA MEDICA` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `NOTA_MEDICA_CIRUGIA_idCIRUGIA_UNIQUE` ON `mydb`.`ESTUDIO` (`NOTA_MEDICA_CIRUGIA_idCIRUGIA` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `NOTA_MEDICA_CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO_UNIQUE` ON `mydb`.`ESTUDIO` (`NOTA_MEDICA_CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `NOTA_MEDICA_CONSULTAGENERAL_idCONSULTAGENERAL_UNIQUE` ON `mydb`.`ESTUDIO` (`NOTA_MEDICA_CONSULTAGENERAL_idCONSULTAGENERAL` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `NOTA_MEDICA_CONSULTAGENERAL_DIAGNOSTICO_idDIAGNOSTICO_UNIQUE` ON `mydb`.`ESTUDIO` (`NOTA_MEDICA_CONSULTAGENERAL_DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `NOTA_MEDICA_CONSULTAGENERAL_MEDICO_CedProf_UNIQUE` ON `mydb`.`ESTUDIO` (`NOTA_MEDICA_CONSULTAGENERAL_MEDICO_CedProf` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`MEDICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MEDICO` (
  `CedProf` INT NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `ApellidoPat` VARCHAR(30) NOT NULL,
  `ApellidoMat` VARCHAR(30) NOT NULL,
  `Contrasena` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CedProf`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `CedProf_UNIQUE` ON `mydb`.`MEDICO` (`CedProf` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`NOTA_MEDICA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NOTA_MEDICA` (
  `idNOTA MEDICA` INT NOT NULL AUTO_INCREMENT,
  `Padecimiento` VARCHAR(1000) NULL,
  `ExploFisica` VARCHAR(1000) NULL,
  `Tratamiento` VARCHAR(1000) NULL,
  `Plan` VARCHAR(1000) NULL,
  `Temperatura` DECIMAL(2,1) NULL,
  `TA` INT NULL,
  `FC` INT NULL,
  `FR` INT NULL,
  `Oxiometria` INT NULL,
  `Peso` DECIMAL(3,3) NULL,
  `Talla` INT NULL,
  `CIRUGIA_idCIRUGIA` INT NOT NULL,
  `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` INT NOT NULL,
  `CONSULTAGENERAL_idCONSULTAGENERAL` INT NOT NULL,
  `CONSULTAGENERAL_DIAGNOSTICO_idDIAGNOSTICO` INT NOT NULL,
  `CONSULTAGENERAL_MEDICO_CedProf` INT NOT NULL,
  PRIMARY KEY (`idNOTA MEDICA`, `CIRUGIA_idCIRUGIA`, `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO`, `CONSULTAGENERAL_idCONSULTAGENERAL`, `CONSULTAGENERAL_DIAGNOSTICO_idDIAGNOSTICO`, `CONSULTAGENERAL_MEDICO_CedProf`),
  CONSTRAINT `fk_NOTA_MEDICA_CIRUGIA1`
    FOREIGN KEY (`CIRUGIA_idCIRUGIA` , `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO`)
    REFERENCES `mydb`.`CIRUGIA` (`idCIRUGIA` , `DIAGNOSTICO_idDIAGNOSTICO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NOTA_MEDICA_CONSULTAGENERAL1`
    FOREIGN KEY (`CONSULTAGENERAL_idCONSULTAGENERAL` , `CONSULTAGENERAL_DIAGNOSTICO_idDIAGNOSTICO` , `CONSULTAGENERAL_MEDICO_CedProf`)
    REFERENCES `mydb`.`CONSULTAGENERAL` (`idCONSULTAGENERAL` , `DIAGNOSTICO_idDIAGNOSTICO` , `MEDICO_CedProf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_NOTA_MEDICA_CIRUGIA1_idx` ON `mydb`.`NOTA_MEDICA` (`CIRUGIA_idCIRUGIA` ASC, `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_NOTA_MEDICA_CONSULTAGENERAL1_idx` ON `mydb`.`NOTA_MEDICA` (`CONSULTAGENERAL_idCONSULTAGENERAL` ASC, `CONSULTAGENERAL_DIAGNOSTICO_idDIAGNOSTICO` ASC, `CONSULTAGENERAL_MEDICO_CedProf` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`NOTAPOSTCIRUGIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NOTAPOSTCIRUGIA` (
  `idNOTAPOSTCIRUGIA` INT NOT NULL AUTO_INCREMENT,
  `CIRUGIA_idCIRUGIA` INT NOT NULL,
  `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` INT NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Padecimiento` VARCHAR(45) NULL,
  `ExploFisica` VARCHAR(45) NULL,
  `Plan` VARCHAR(45) NULL,
  `Tratamiento` VARCHAR(45) NULL,
  `Notas` VARCHAR(45) NULL,
  PRIMARY KEY (`idNOTAPOSTCIRUGIA`, `CIRUGIA_idCIRUGIA`, `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO`),
  CONSTRAINT `fk_NOTAPOSTCIRUGIA_CIRUGIA1`
    FOREIGN KEY (`CIRUGIA_idCIRUGIA` , `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO`)
    REFERENCES `mydb`.`CIRUGIA` (`idCIRUGIA` , `DIAGNOSTICO_idDIAGNOSTICO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_NOTAPOSTCIRUGIA_CIRUGIA1_idx` ON `mydb`.`NOTAPOSTCIRUGIA` (`CIRUGIA_idCIRUGIA` ASC, `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idNOTAPOSTCIRUGIA_UNIQUE` ON `mydb`.`NOTAPOSTCIRUGIA` (`idNOTAPOSTCIRUGIA` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `CIRUGIA_idCIRUGIA_UNIQUE` ON `mydb`.`NOTAPOSTCIRUGIA` (`CIRUGIA_idCIRUGIA` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO_UNIQUE` ON `mydb`.`NOTAPOSTCIRUGIA` (`CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`NOTAPRECIRUGIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NOTAPRECIRUGIA` (
  `idNOTAPRECIRUGIA` INT NOT NULL AUTO_INCREMENT,
  `CIRUGIA_idCIRUGIA` INT NOT NULL,
  `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` INT NOT NULL,
  `Fecha` DATETIME NOT NULL,
  `Padecimiento` VARCHAR(45) NULL,
  `ExploFisica` VARCHAR(45) NULL,
  `Plan` VARCHAR(45) NULL,
  `Tratamiento` VARCHAR(45) NULL,
  `Notas` VARCHAR(45) NULL,
  PRIMARY KEY (`idNOTAPRECIRUGIA`, `CIRUGIA_idCIRUGIA`, `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO`),
  CONSTRAINT `fk_NOTAPRECIRUGIA_CIRUGIA1`
    FOREIGN KEY (`CIRUGIA_idCIRUGIA` , `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO`)
    REFERENCES `mydb`.`CIRUGIA` (`idCIRUGIA` , `DIAGNOSTICO_idDIAGNOSTICO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_NOTAPRECIRUGIA_CIRUGIA1_idx` ON `mydb`.`NOTAPRECIRUGIA` (`CIRUGIA_idCIRUGIA` ASC, `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idNOTAPRECIRUGIA_UNIQUE` ON `mydb`.`NOTAPRECIRUGIA` (`idNOTAPRECIRUGIA` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `CIRUGIA_idCIRUGIA_UNIQUE` ON `mydb`.`NOTAPRECIRUGIA` (`CIRUGIA_idCIRUGIA` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO_UNIQUE` ON `mydb`.`NOTAPRECIRUGIA` (`CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`OPERANDOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OPERANDOS` (
  `MEDICO_CedProf` INT NOT NULL,
  `CIRUGIA_idCIRUGIA` INT NOT NULL,
  `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` INT NOT NULL,
  PRIMARY KEY (`MEDICO_CedProf`, `CIRUGIA_idCIRUGIA`, `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO`),
  CONSTRAINT `fk_MEDICO_has_CIRUGIA_MEDICO1`
    FOREIGN KEY (`MEDICO_CedProf`)
    REFERENCES `mydb`.`MEDICO` (`CedProf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEDICO_has_CIRUGIA_CIRUGIA1`
    FOREIGN KEY (`CIRUGIA_idCIRUGIA` , `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO`)
    REFERENCES `mydb`.`CIRUGIA` (`idCIRUGIA` , `DIAGNOSTICO_idDIAGNOSTICO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_MEDICO_has_CIRUGIA_CIRUGIA1_idx` ON `mydb`.`OPERANDOS` (`CIRUGIA_idCIRUGIA` ASC, `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_MEDICO_has_CIRUGIA_MEDICO1_idx` ON `mydb`.`OPERANDOS` (`MEDICO_CedProf` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `MEDICO_CedProf_UNIQUE` ON `mydb`.`OPERANDOS` (`MEDICO_CedProf` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `CIRUGIA_idCIRUGIA_UNIQUE` ON `mydb`.`OPERANDOS` (`CIRUGIA_idCIRUGIA` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO_UNIQUE` ON `mydb`.`OPERANDOS` (`CIRUGIA_DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`PACIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PACIENTE` (
  `idPACIENTE` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `ApellidoPat` VARCHAR(45) NOT NULL,
  `ApellidoMat` VARCHAR(45) NOT NULL,
  `Sexo` VARCHAR(45) NULL,
  `FechaNacimiento` VARCHAR(45) NULL,
  `Direccion` VARCHAR(100) NULL,
  `Telefono` BIGINT(20) NOT NULL,
  `EstadoCivil` VARCHAR(45) NULL,
  `Religion` VARCHAR(45) NULL,
  `LugarNacim` VARCHAR(45) NULL,
  PRIMARY KEY (`idPACIENTE`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idPACIENTE_UNIQUE` ON `mydb`.`PACIENTE` (`idPACIENTE` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`PacienteDiagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PacienteDiagnostico` (
  `PACIENTE_idPACIENTE` INT NOT NULL,
  `DIAGNOSTICO_idDIAGNOSTICO` INT NOT NULL,
  PRIMARY KEY (`PACIENTE_idPACIENTE`, `DIAGNOSTICO_idDIAGNOSTICO`),
  CONSTRAINT `fk_PacienteDiagnostico_PACIENTE`
    FOREIGN KEY (`PACIENTE_idPACIENTE`)
    REFERENCES `mydb`.`PACIENTE` (`idPACIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PacienteDiagnostico_DIAGNOSTICO1`
    FOREIGN KEY (`DIAGNOSTICO_idDIAGNOSTICO`)
    REFERENCES `mydb`.`DIAGNOSTICO` (`idDIAGNOSTICO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_PacienteDiagnostico_DIAGNOSTICO1_idx` ON `mydb`.`PacienteDiagnostico` (`DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PACIENTE_idPACIENTE_UNIQUE` ON `mydb`.`PacienteDiagnostico` (`PACIENTE_idPACIENTE` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `DIAGNOSTICO_idDIAGNOSTICO_UNIQUE` ON `mydb`.`PacienteDiagnostico` (`DIAGNOSTICO_idDIAGNOSTICO` ASC) VISIBLE;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


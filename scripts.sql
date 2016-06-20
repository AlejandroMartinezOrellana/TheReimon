-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `Rut_cliente` INT NOT NULL,
  `Clave_cliente` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Fecha_Nacimiento` DATE NULL,
  `E_mail` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`Rut_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehiculo` (
  `idVehiculo` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `Tipo_Vehiculo` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `precio` INT NOT NULL,
  `fotografia` VARCHAR(45) NOT NULL,
  `tipo_vehiculo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVehiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Stock` (
  `idStock` INT NOT NULL,
  `Id_Vehiculo` INT NULL,
  `Cantidad` INT NULL,
  `chasis` VARCHAR(45) NOT NULL,
  `Vehiculo_idVehiculo` INT NOT NULL,
  PRIMARY KEY (`idStock`),
  INDEX `fk_Stock_Vehiculo1_idx` (`Vehiculo_idVehiculo` ASC),
  CONSTRAINT `fk_Stock_Vehiculo1`
    FOREIGN KEY (`Vehiculo_idVehiculo`)
    REFERENCES `mydb`.`Vehiculo` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id_usuario` INT NULL,
  `nom_usuario` VARCHAR(45) NULL,
  `Cargo_usuario` VARCHAR(45) NULL,
  `clave_usuario` VARCHAR(45) NULL,
  `tipo_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reserva` (
  `idReserva` INT NOT NULL,
  `Hora_Inicio` VARCHAR(45) NULL,
  `Hora_Final` VARCHAR(45) NULL,
  `Precio_idPrecio` INT NOT NULL,
  `Cliente_Rut_cliente` INT NOT NULL,
  `Stock_idStock` INT NOT NULL,
  `Usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`idReserva`, `Stock_idStock`, `Usuario_id_usuario`),
  INDEX `fk_Reserva_Cliente1_idx` (`Cliente_Rut_cliente` ASC),
  INDEX `fk_Reserva_Stock1_idx` (`Stock_idStock` ASC),
  INDEX `fk_Reserva_Usuario1_idx` (`Usuario_id_usuario` ASC),
  CONSTRAINT `fk_Reserva_Cliente1`
    FOREIGN KEY (`Cliente_Rut_cliente`)
    REFERENCES `mydb`.`Cliente` (`Rut_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Stock1`
    FOREIGN KEY (`Stock_idStock`)
    REFERENCES `mydb`.`Stock` (`idStock`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Usuario1`
    FOREIGN KEY (`Usuario_id_usuario`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

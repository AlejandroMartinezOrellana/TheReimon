-- -----------------------------------------------------
-- Schema scripts
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `scripts` ;

-- -----------------------------------------------------
-- Schema scripts
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `scripts` DEFAULT CHARACTER SET utf8 ;
USE `scripts` ;

-- -----------------------------------------------------
-- Table `scripts`.`proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scripts`.`proveedor` ;

CREATE TABLE IF NOT EXISTS `scripts`.`proveedor` (
  `nom_proveedor` INT NOT NULL,
  `direccion_proveedor` VARCHAR(45) NOT NULL,
  `telefono_prov` VARCHAR(45) NOT NULL,
  `mail_prov` VARCHAR(45) NOT NULL,
  `direccion_prov` VARCHAR(45) NOT NULL,
  `rut_prov` VARCHAR(35) NOT NULL,
  `email_prov` VARCHAR(45) NULL,
  `reg_prov` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nom_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scripts`.`Vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scripts`.`Vehiculo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Vehiculo` (
  `idVehiculo` INT NOT NULL,
  `detalle_Vehiculo` VARCHAR(45) NOT NULL,
  `nom_Vehiculo` VARCHAR(45) NOT NULL,
  `precio_vehi` VARCHAR(45) NOT NULL,
  `tipo_Vehiculo` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NULL,
  `proveedor_nom_proveedor` INT NOT NULL,
  PRIMARY KEY (`idVehiculo`, `proveedor_nom_proveedor`),
  INDEX `fk_Vehiculo_proveedor1_idx` (`proveedor_nom_proveedor` ASC),
  CONSTRAINT `fk_Vehiculo_proveedor1`
    FOREIGN KEY (`proveedor_nom_proveedor`)
    REFERENCES `mydb`.`proveedor` (`nom_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scripts`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scripts`.`cliente` ;

CREATE TABLE IF NOT EXISTS `scripts`.`cliente` (
  `rut_cliente` INT NOT NULL,
  `apellido_cliente` VARCHAR(45) NOT NULL,
  `nom_cliente` VARCHAR(45) NOT NULL,
  `mail_cliente` VARCHAR(45) NOT NULL,
  `direccion_cliente` VARCHAR(45) NOT NULL,
  `clave_cliente` VARCHAR(35) NOT NULL,
  `num_tarjeta` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rut_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scripts`.`administrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scripts`.`administrador` ;

CREATE TABLE IF NOT EXISTS `scripts`.`administrador` (
  `id_admin` INT NOT NULL,
  `nom_admin` VARCHAR(45) NOT NULL,
  `cargo_admin` VARCHAR(45) NOT NULL,
  `clave_admin` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`id_admin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scripts`.`stock`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scripts`.`stock` ;

CREATE TABLE IF NOT EXISTS `scripts`.`stock` (
  `registro` VARCHAR(35) NOT NULL,
  `Vehiculo_idVehiculo` INT NOT NULL,
  PRIMARY KEY (`Vehiculo_idVehiculo`),
  CONSTRAINT `fk_stock_Vehiculo`
    FOREIGN KEY (`Vehiculo_idVehiculo`)
    REFERENCES `mydb`.`Vehiculo` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scripts`.`Arriendo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scripts`.`Arriendo` ;

CREATE TABLE IF NOT EXISTS `scripts`.`Arriendo` (
  `id_Arriendo` INT NOT NULL,
  `fecha_Arriendo` VARCHAR(45) NOT NULL,
  `num_Arriendo` VARCHAR(45) NOT NULL,
  `cod_Arriendo` VARCHAR(35) NOT NULL,
  `cliente_rut_cliente` INT NOT NULL,
  PRIMARY KEY (`id_Arriendo`, `cliente_rut_cliente`),
  INDEX `fk_Arriendo_cliente1_idx` (`cliente_rut_cliente` ASC),
  CONSTRAINT `fk_Arriendo_cliente1`
    FOREIGN KEY (`cliente_rut_cliente`)
    REFERENCES `mydb`.`cliente` (`rut_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scripts`.`Vehiculo_has_Arriendo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scripts`.`Vehiculo_has_Arriendo` ;

CREATE TABLE IF NOT EXISTS `scripts`.`Vehiculo_has_Arriendo` (
  `Vehiculo_idVehiculo` INT NOT NULL,
  `Arriendo_id_Arriendo` INT NOT NULL,
  PRIMARY KEY (`Vehiculo_idVehiculo`, `Arriendo_id_Arriendo`),
  INDEX `fk_Vehiculo_has_Arriendo_Arriendo1_idx` (`Arriendo_id_Arriendo` ASC),
  INDEX `fk_Vehiculo_has_Arriendo_Vehiculo1_idx` (`Vehiculo_idVehiculo` ASC),
  CONSTRAINT `fk_Vehiculo_has_Arriendo_Vehiculo1`
    FOREIGN KEY (`Vehiculo_idVehiculo`)
    REFERENCES `mydb`.`Vehiculo` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehiculo_has_Arriendo_Arriendo1`
    FOREIGN KEY (`Arriendo_id_Arriendo`)
    REFERENCES `mydb`.`Arriendo` (`id_Arriendo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
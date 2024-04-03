USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Discapacidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Discapacidad` (
  `idDiscapacidad` INT NOT NULL AUTO_INCREMENT COMMENT 'La Llave primaria sera el nombre de las discapacidades',
  `Nombre` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(256) NULL,
  `Imagen` BLOB NULL,
  PRIMARY KEY (`idDiscapacidad`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idDiscapacidad_UNIQUE` ON `mydb`.`Discapacidad` (`idDiscapacidad` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`TipodeDocumento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipodeDocumento` (
  `idTipodeDocumento` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idTipodeDocumento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RolUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RolUsuario` (
  `idRolUsuarioNombre` INT NOT NULL AUTO_INCREMENT COMMENT 'Es El respectivo Rol que se le asigna a cada usuario pueden ser administrador,cliente,agente.',
  PRIMARY KEY (`idRolUsuarioNombre`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idRolUsuario_UNIQUE` ON `mydb`.`RolUsuario` (`idRolUsuarioNombre` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idDocumento` INT NOT NULL COMMENT 'documento del usuario ',
  `Nombre1` VARCHAR(45) NULL COMMENT 'primer nombre del usuario',
  `Nombre2` VARCHAR(45) NULL COMMENT 'segundo nombre del usuario',
  `Apellido1` VARCHAR(45) NULL COMMENT 'primer apellido',
  `Apellido2` VARCHAR(45) NULL COMMENT 'segundo apellido',
  `CorreoElectronico` VARCHAR(45) NULL COMMENT 'correo electronico del usuario',
  `Direccion` VARCHAR(45) NULL COMMENT 'direccion de residencia del usuario',
  `RolUsuario_idRolUsuarioNombre` INT NOT NULL,
  `TipodeDocumento_idTipodeDocumento` INT NOT NULL,
  `Contraseña` VARCHAR(100) NULL,
  PRIMARY KEY (`idDocumento`, `RolUsuario_idRolUsuarioNombre`, `TipodeDocumento_idTipodeDocumento`),
  CONSTRAINT `fk_Usuario_RolUsuario`
    FOREIGN KEY (`RolUsuario_idRolUsuarioNombre`)
    REFERENCES `mydb`.`RolUsuario` (`idRolUsuarioNombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_TipodeDocumento1`
    FOREIGN KEY (`TipodeDocumento_idTipodeDocumento`)
    REFERENCES `mydb`.`TipodeDocumento` (`idTipodeDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idDocumento_UNIQUE` ON `mydb`.`Usuario` (`idDocumento` ASC);

CREATE INDEX `fk_Usuario_RolUsuario_idx` ON `mydb`.`Usuario` (`RolUsuario_idRolUsuarioNombre` ASC) ;

CREATE INDEX `fk_Usuario_TipodeDocumento1_idx` ON `mydb`.`Usuario` (`TipodeDocumento_idTipodeDocumento` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Rutina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rutina` (
  `idRutina` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Ejercicio` VARCHAR(45) NULL COMMENT 'nombre del tipo de ejercicio',
  `DuracionMin` INT NULL COMMENT 'duracion del ejercicio',
  `Series` INT NULL COMMENT 'numero de series por ejercicio',
  `RepeticionesPorSerie` INT NULL COMMENT 'repeticiones por cada serie',
  `Descripcion` VARCHAR(280) NULL COMMENT 'descripcion de la rutina',
  `Imagen1` LONGBLOB NULL COMMENT 'imagen de la rutina',
  `Imagen2` LONGBLOB NULL COMMENT 'imagen de la rutina',
  `Imagen3` LONGBLOB NULL COMMENT 'imagen de la rutina',
  `Discapacidad_idDiscapacidad` INT NOT NULL,
  PRIMARY KEY (`idRutina`, `Discapacidad_idDiscapacidad`),
  CONSTRAINT `fk_Rutina_Discapacidad1`
    FOREIGN KEY (`Discapacidad_idDiscapacidad`)
    REFERENCES `mydb`.`Discapacidad` (`idDiscapacidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idRutina_UNIQUE` ON `mydb`.`Rutina` (`idRutina` ASC) ;

CREATE INDEX `fk_Rutina_Discapacidad1_idx` ON `mydb`.`Rutina` (`Discapacidad_idDiscapacidad` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Notificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Notificacion` (
  `idNotificacion` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(256) NULL COMMENT 'descripcion de la notificacion',
  `FechaNotificacion` DATE NULL COMMENT 'fecha de publicacion de la notificacion',
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idNotificacion`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idNotificacion_UNIQUE` ON `mydb`.`Notificacion` (`idNotificacion` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario_has_Notificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario_has_Notificacion` (
  `Usuario_idDocumento` INT NOT NULL,
  `Usuario_RolUsuario_idRolUsuarioNombre` INT NOT NULL,
  `Usuario_TipodeDocumento_idTipodeDocumento` INT NOT NULL,
  `Notificacion_idNotificacion` INT NOT NULL,
  PRIMARY KEY (`Usuario_idDocumento`, `Usuario_RolUsuario_idRolUsuarioNombre`, `Usuario_TipodeDocumento_idTipodeDocumento`, `Notificacion_idNotificacion`),
  CONSTRAINT `fk_Usuario_has_Notificacion_Usuario1`
    FOREIGN KEY (`Usuario_idDocumento` , `Usuario_RolUsuario_idRolUsuarioNombre` , `Usuario_TipodeDocumento_idTipodeDocumento`)
    REFERENCES `mydb`.`Usuario` (`idDocumento` , `RolUsuario_idRolUsuarioNombre` , `TipodeDocumento_idTipodeDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Notificacion_Notificacion1`
    FOREIGN KEY (`Notificacion_idNotificacion`)
    REFERENCES `mydb`.`Notificacion` (`idNotificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Usuario_has_Notificacion_Notificacion1_idx` ON `mydb`.`Usuario_has_Notificacion` (`Notificacion_idNotificacion` ASC) ;

CREATE INDEX `fk_Usuario_has_Notificacion_Usuario1_idx` ON `mydb`.`Usuario_has_Notificacion` (`Usuario_idDocumento` ASC, `Usuario_RolUsuario_idRolUsuarioNombre` ASC, `Usuario_TipodeDocumento_idTipodeDocumento` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario_has_Discapacidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario_has_Discapacidad` (
  `Usuario_idDocumento` INT NOT NULL,
  `Usuario_RolUsuario_idRolUsuarioNombre` INT NOT NULL,
  `Usuario_TipodeDocumento_idTipodeDocumento` INT NOT NULL,
  `Discapacidad_idDiscapacidad` INT NOT NULL,
  PRIMARY KEY (`Usuario_idDocumento`, `Usuario_RolUsuario_idRolUsuarioNombre`, `Usuario_TipodeDocumento_idTipodeDocumento`, `Discapacidad_idDiscapacidad`),
  CONSTRAINT `fk_Usuario_has_Discapacidad_Usuario1`
    FOREIGN KEY (`Usuario_idDocumento` , `Usuario_RolUsuario_idRolUsuarioNombre` , `Usuario_TipodeDocumento_idTipodeDocumento`)
    REFERENCES `mydb`.`Usuario` (`idDocumento` , `RolUsuario_idRolUsuarioNombre` , `TipodeDocumento_idTipodeDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Discapacidad_Discapacidad1`
    FOREIGN KEY (`Discapacidad_idDiscapacidad`)
    REFERENCES `mydb`.`Discapacidad` (`idDiscapacidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Usuario_has_Discapacidad_Discapacidad1_idx` ON `mydb`.`Usuario_has_Discapacidad` (`Discapacidad_idDiscapacidad` ASC) ;

CREATE INDEX `fk_Usuario_has_Discapacidad_Usuario1_idx` ON `mydb`.`Usuario_has_Discapacidad` (`Usuario_idDocumento` ASC, `Usuario_RolUsuario_idRolUsuarioNombre` ASC, `Usuario_TipodeDocumento_idTipodeDocumento` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario_has_Rutina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario_has_Rutina` (
  `Usuario_idDocumento` INT NOT NULL,
  `Usuario_RolUsuario_idRolUsuarioNombre` INT NOT NULL,
  `Usuario_TipodeDocumento_idTipodeDocumento` INT NOT NULL,
  `Rutina_idRutina` INT NOT NULL,
  PRIMARY KEY (`Usuario_idDocumento`, `Usuario_RolUsuario_idRolUsuarioNombre`, `Usuario_TipodeDocumento_idTipodeDocumento`, `Rutina_idRutina`),
  CONSTRAINT `fk_Usuario_has_Rutina_Usuario1`
    FOREIGN KEY (`Usuario_idDocumento` , `Usuario_RolUsuario_idRolUsuarioNombre` , `Usuario_TipodeDocumento_idTipodeDocumento`)
    REFERENCES `mydb`.`Usuario` (`idDocumento` , `RolUsuario_idRolUsuarioNombre` , `TipodeDocumento_idTipodeDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Rutina_Rutina1`
    FOREIGN KEY (`Rutina_idRutina`)
    REFERENCES `mydb`.`Rutina` (`idRutina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Usuario_has_Rutina_Rutina1_idx` ON `mydb`.`Usuario_has_Rutina` (`Rutina_idRutina` ASC);

CREATE INDEX `fk_Usuario_has_Rutina_Usuario1_idx` ON `mydb`.`Usuario_has_Rutina` (`Usuario_idDocumento` ASC, `Usuario_RolUsuario_idRolUsuarioNombre` ASC, `Usuario_TipodeDocumento_idTipodeDocumento` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
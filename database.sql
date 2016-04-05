SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `restful_api` DEFAULT CHARACTER SET latin1 ;
USE `restful_api` ;

-- -----------------------------------------------------
-- Table `restful_api`.`user_login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restful_api`.`user_login` ;

CREATE TABLE IF NOT EXISTS `restful_api`.`user_login` (
  `user_id` INT(70) NOT NULL AUTO_INCREMENT,
  `user_email` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NULL,
  `user_join_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC))
ENGINE = InnoDB;

INSERT into `user_login` VALUES (1, 'joe@bloggs.com', 'secret', CURRENT_TIMESTAMP);
INSERT into `user_login` VALUES (2, 'homer@simpson.com', 'secret', CURRENT_TIMESTAMP);
INSERT into `user_login` VALUES (3, 'marge@simpson.com', 'secret', CURRENT_TIMESTAMP);
INSERT into `user_login` VALUES (4, 'lisa@simpson.com', 'secret', CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- Table `restful_api`.`user_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restful_api`.`user_info` ;

CREATE TABLE IF NOT EXISTS `restful_api`.`user_info` (
  `user_info_id` INT(70) NOT NULL AUTO_INCREMENT,
  `user_id_fk` INT(70) NOT NULL,
  `user_name` VARCHAR(45) NULL,
  `user_location` VARCHAR(45) NULL,
  PRIMARY KEY (`user_info_id`),
  UNIQUE INDEX `user_id_fk_UNIQUE` (`user_id_fk` ASC),
  CONSTRAINT `user_info_foreign_key`
    FOREIGN KEY (`user_id_fk`)
    REFERENCES `restful_api`.`user_login` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT into `user_info` VALUES (1, 1, 'jbloggs', 'cork');
INSERT into `user_info` VALUES (2, 2, 'hsimpson', 'waterford');
INSERT into `user_info` VALUES (3, 3, 'msimpson', 'dublin');
INSERT into `user_info` VALUES (4, 4, 'lsimpson', 'kilkenny');

-- -----------------------------------------------------
-- Table `restful_api`.`user_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restful_api`.`user_status` ;

CREATE TABLE IF NOT EXISTS `restful_api`.`user_status` (
  `user_status_id` INT(70) NOT NULL AUTO_INCREMENT,
  `user_id_fk` INT(70) NOT NULL,
  `status_text` TEXT NULL DEFAULT NULL,
  `status_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_status_id`),
  UNIQUE INDEX `user_id_fk_UNIQUE` (`user_id_fk` ASC),
  CONSTRAINT `user_status_foreign_key`
    FOREIGN KEY (`user_id_fk`)
    REFERENCES `restful_api`.`user_login` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT into `user_status` VALUES (1, 1, 'single', CURRENT_TIMESTAMP);
INSERT into `user_status` VALUES (2, 2, 'married', CURRENT_TIMESTAMP);
INSERT into `user_status` VALUES (3, 3, 'married', CURRENT_TIMESTAMP);
INSERT into `user_status` VALUES (4, 4, 'single', CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- Table `restful_api`.`electricity_values`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restful_api`.`electricity_values` ;

CREATE TABLE IF NOT EXISTS `restful_api`.`electricity_values` (
  `electricity_values_id` INT(70) NOT NULL AUTO_INCREMENT,
  `user_id_fk` INT(70) NOT NULL,
  `current` FLOAT(7,4) NOT NULL,
  `date_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `voltage` FLOAT(7,4) NOT NULL,
  `power` FLOAT(7,4) NOT NULL,
  PRIMARY KEY (`electricity_values_id`),
  UNIQUE INDEX `user_id_fk_UNIQUE` (`user_id_fk` ASC),
  CONSTRAINT `electricity_values_foreign_key`
    FOREIGN KEY (`user_id_fk`)
    REFERENCES `restful_api`.`user_login` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT into `electricity_values` VALUES (1, 1, 1.23, CURRENT_TIMESTAMP, 230, 282.9);
INSERT into `electricity_values` VALUES (2, 2, 1.01, CURRENT_TIMESTAMP, 230, 232.3);
INSERT into `electricity_values` VALUES (3, 3, 0.75, CURRENT_TIMESTAMP, 230, 172.5);
INSERT into `electricity_values` VALUES (4, 4, 0.97, CURRENT_TIMESTAMP, 230, 223.1);

-- -----------------------------------------------------
-- Table `restful_api`.`daily_readings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restful_api`.`daily_readings` ;

CREATE TABLE IF NOT EXISTS `restful_api`.`daily_readings` (
  `daily_readings_id` INT(70) NOT NULL AUTO_INCREMENT,
  `user_id_fk` INT(70) NOT NULL,
  `daily_readings_name` VARCHAR(45) NULL,
  `average` FLOAT(7,4) NOT NULL,
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`daily_readings_id`),
  UNIQUE INDEX `user_id_fk_UNIQUE` (`user_id_fk` ASC),
  CONSTRAINT `daily_readings_foreign_key`
    FOREIGN KEY (`user_id_fk`)
    REFERENCES `restful_api`.`user_login` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT into `daily_readings` VALUES (1, 1, 'dr1', 10.50, CURRENT_TIMESTAMP);
INSERT into `daily_readings` VALUES (2, 2, 'dr2', 80.30, CURRENT_TIMESTAMP);
INSERT into `daily_readings` VALUES (3, 3, 'dr3', 100.88, CURRENT_TIMESTAMP);
INSERT into `daily_readings` VALUES (4, 4, 'dr4', 300.38, CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- Table `restful_api`.`weekly_readings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restful_api`.`weekly_readings` ;

CREATE TABLE IF NOT EXISTS `restful_api`.`weekly_readings` (
  `weekly_readings_id` INT(70) NOT NULL AUTO_INCREMENT,
  `user_id_fk` INT(70) NOT NULL,
  `weekly_readings_name` VARCHAR(45) NULL,
  `average` FLOAT(7,4) NOT NULL,
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`weekly_readings_id`),
  UNIQUE INDEX `user_id_fk_UNIQUE` (`user_id_fk` ASC),
  CONSTRAINT `weekly_readings_foreign_key`
    FOREIGN KEY (`user_id_fk`)
    REFERENCES `restful_api`.`user_login` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT into `weekly_readings` VALUES (1, 1, 'week1', 102.20, CURRENT_TIMESTAMP);
INSERT into `weekly_readings` VALUES (2, 2, 'week2', 100.01, CURRENT_TIMESTAMP);
INSERT into `weekly_readings` VALUES (3, 3, 'week2', 20.39, CURRENT_TIMESTAMP);
INSERT into `weekly_readings` VALUES (4, 4, 'week3', 300.89, CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- Table `restful_api`.`monitoring_configs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restful_api`.`monitoring_configs` ;

CREATE TABLE IF NOT EXISTS `restful_api`.`monitoring_configs` (
  `monitoring_configs_id` INT(70) NOT NULL AUTO_INCREMENT,
  `user_id_fk` INT(70) NOT NULL,
  `monitoring_configs_name` VARCHAR(45) NULL,
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `current_only` FLOAT(7,4) NOT NULL,
  `power_only` FLOAT(7,4) NOT NULL,
  PRIMARY KEY (`monitoring_configs_id`),
  UNIQUE INDEX `user_id_fk_UNIQUE` (`user_id_fk` ASC),
  CONSTRAINT `monitoring_configs_foreign_key`
    FOREIGN KEY (`user_id_fk`)
    REFERENCES `restful_api`.`user_login` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT into `monitoring_configs` VALUES (1, 1, 'm_config1', CURRENT_TIMESTAMP, 710.50, 102.20);
INSERT into `monitoring_configs` VALUES (2, 2, 'm_config2', CURRENT_TIMESTAMP, 700.30, 100.01);
INSERT into `monitoring_configs` VALUES (3, 3, 'm_config3', CURRENT_TIMESTAMP, 1400.88, 20.39);
INSERT into `monitoring_configs` VALUES (4, 4, 'm_config4', CURRENT_TIMESTAMP, 2100.38, 300.89);

-- -----------------------------------------------------
-- Table `restful_api`.`alarming_configs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restful_api`.`alarming_configs` ;

CREATE TABLE IF NOT EXISTS `restful_api`.`alarming_configs` (
  `alarming_configs_id` INT(70) NOT NULL AUTO_INCREMENT,
  `user_id_fk` INT(70) NOT NULL,
  `alarming_configs_name` VARCHAR(45) NULL,
  `level` VARCHAR(45) NULL,
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`alarming_configs_id`),
  UNIQUE INDEX `user_id_fk_UNIQUE` (`user_id_fk` ASC),
  CONSTRAINT `alarming_configs_foreign_key`
    FOREIGN KEY (`user_id_fk`)
    REFERENCES `restful_api`.`user_login` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT into `alarming_configs` VALUES (1, 1, 'a_config1', 'minor', CURRENT_TIMESTAMP);
INSERT into `alarming_configs` VALUES (2, 2, 'a_config2', 'minor', CURRENT_TIMESTAMP);
INSERT into `alarming_configs` VALUES (3, 3, 'a_config3', 'major', CURRENT_TIMESTAMP);
INSERT into `alarming_configs` VALUES (4, 4, 'a_config4', 'major', CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- Table `restful_api`.`reporting_configs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restful_api`.`reporting_configs` ;

CREATE TABLE IF NOT EXISTS `restful_api`.`reporting_configs` (
  `reporting_configs_id` INT(70) NOT NULL AUTO_INCREMENT,
  `user_id_fk` INT(70) NOT NULL,
  `reporting_configs_name` VARCHAR(45) NULL,
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `email_to`VARCHAR(45) NULL,
  PRIMARY KEY (`reporting_configs_id`),
  UNIQUE INDEX `user_id_fk_UNIQUE` (`user_id_fk` ASC),
  CONSTRAINT `reporting_configs_foreign_key`
    FOREIGN KEY (`user_id_fk`)
    REFERENCES `restful_api`.`user_login` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT into `reporting_configs` VALUES (1, 1, 'r_config1', CURRENT_TIMESTAMP, 'jbloggs@gmail.com');
INSERT into `reporting_configs` VALUES (2, 2, 'r_config2', CURRENT_TIMESTAMP, 'simpsons@gmail.com');
INSERT into `reporting_configs` VALUES (3, 3, 'r_config3', CURRENT_TIMESTAMP, 'simpsons@gmail.com');
INSERT into `reporting_configs` VALUES (4, 4, 'r_config4', CURRENT_TIMESTAMP, 'simpsons@gmail.com');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Script generated by MySQL Workbench
-- Tue Apr 10 14:59:21 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema company
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `company` DEFAULT CHARACTER SET utf8 ;
USE `company` ;

-- -----------------------------------------------------
-- Table `company`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`courses` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`employees` (
  `id` INT(11) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`employees_courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`employees_courses` (
  `e_id` INT(11) NOT NULL,
  `c_id` INT(11) NOT NULL,
  PRIMARY KEY (`e_id`, `c_id`),
  INDEX `fk_course_id_idx` (`c_id` ASC),
  CONSTRAINT `fk_course_id`
    FOREIGN KEY (`c_id`)
    REFERENCES `company`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_course`
    FOREIGN KEY (`e_id`)
    REFERENCES `company`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`languages` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`employees_languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`employees_languages` (
  `e_id` INT(11) NOT NULL,
  `l_id` INT(11) NOT NULL,
  PRIMARY KEY (`e_id`, `l_id`),
  INDEX `fk_language_id_idx` (`l_id` ASC),
  CONSTRAINT `fk_employee_language`
    FOREIGN KEY (`e_id`)
    REFERENCES `company`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_language_id`
    FOREIGN KEY (`l_id`)
    REFERENCES `company`.`languages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`projects` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `data` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`employees_projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`employees_projects` (
  `e_id` INT(11) NOT NULL,
  `p_id` INT(11) NOT NULL,
  PRIMARY KEY (`e_id`, `p_id`),
  INDEX `fk_project_id_idx` (`p_id` ASC),
  CONSTRAINT `fk_employee_project`
    FOREIGN KEY (`e_id`)
    REFERENCES `company`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_id`
    FOREIGN KEY (`p_id`)
    REFERENCES `company`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`skills` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `date` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`employees_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`employees_skills` (
  `e_id` INT(11) NOT NULL,
  `s_id` INT(11) NOT NULL,
  PRIMARY KEY (`e_id`, `s_id`),
  INDEX `fk_skill_id_idx` (`s_id` ASC),
  CONSTRAINT `fk_employee_skill`
    FOREIGN KEY (`e_id`)
    REFERENCES `company`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_skill_id`
    FOREIGN KEY (`s_id`)
    REFERENCES `company`.`skills` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

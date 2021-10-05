-- MySQL Script generated by MySQL Workbench
-- Fri Oct  1 00:13:27 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ohshots
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ohshots
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ohshots` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ohshots` ;

-- -----------------------------------------------------
-- Table `ohshots`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ohshots`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ohshots`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ohshots`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ohshots`.`origenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ohshots`.`origenes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ohshots`.`sections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ohshots`.`sections` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ohshots`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ohshots`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `price` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `imageId` INT NOT NULL,
  `origenId` INT NOT NULL,
  `sectionId` INT NOT NULL,
  `categoryId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_images1_idx` (`imageId` ASC) VISIBLE,
  INDEX `fk_products_origenes1_idx` (`origenId` ASC) VISIBLE,
  INDEX `fk_products_sections1_idx` (`sectionId` ASC) VISIBLE,
  INDEX `fk_products_categories1_idx` (`categoryId` ASC) VISIBLE,
  CONSTRAINT `fk_products_images1`
    FOREIGN KEY (`imageId`)
    REFERENCES `ohshots`.`images` (`id`),
  CONSTRAINT `fk_products_origenes1`
    FOREIGN KEY (`origenId`)
    REFERENCES `ohshots`.`origenes` (`id`),
  CONSTRAINT `fk_products_sections1`
    FOREIGN KEY (`sectionId`)
    REFERENCES `ohshots`.`sections` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ohshots`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ohshots`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ohshots`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ohshots`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `rolId` INT NOT NULL,
  `avatar` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_users_roles1_idx` (`rolId` ASC) VISIBLE,
  CONSTRAINT `fk_users_roles1`
    FOREIGN KEY (`rolId`)
    REFERENCES `ohshots`.`roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

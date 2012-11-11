SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `isi` DEFAULT CHARACTER SET utf8 COLLATE utf8_romanian_ci ;
USE `isi` ;

-- -----------------------------------------------------
-- Table `isi`.`registration_code`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `isi`.`registration_code` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date_created` DATETIME NOT NULL ,
  `token` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_romanian_ci' NOT NULL ,
  `username` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_romanian_ci' NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_romanian_ci;


-- -----------------------------------------------------
-- Table `isi`.`role`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `isi`.`role` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `version` BIGINT(20) NOT NULL ,
  `authority` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_romanian_ci' NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `authority` (`authority` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_romanian_ci;


-- -----------------------------------------------------
-- Table `isi`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `isi`.`user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `version` BIGINT(20) NOT NULL ,
  `account_expired` BIT(1) NOT NULL ,
  `account_locked` BIT(1) NOT NULL ,
  `enabled` BIT(1) NOT NULL ,
  `password` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_romanian_ci' NOT NULL ,
  `password_expired` BIT(1) NOT NULL ,
  `username` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_romanian_ci' NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `username` (`username` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_romanian_ci;


-- -----------------------------------------------------
-- Table `isi`.`user_role`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `isi`.`user_role` (
  `role_id` BIGINT(20) NOT NULL ,
  `user_id` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`role_id`, `user_id`) ,
  INDEX `FK143BF46AE4DFE200` (`role_id` ASC) ,
  INDEX `FK143BF46A8A0AA5E0` (`user_id` ASC) ,
  CONSTRAINT `FK143BF46A8A0AA5E0`
    FOREIGN KEY (`user_id` )
    REFERENCES `isi`.`user` (`id` ),
  CONSTRAINT `FK143BF46AE4DFE200`
    FOREIGN KEY (`role_id` )
    REFERENCES `isi`.`role` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_romanian_ci;


-- -----------------------------------------------------
-- Table `isi`.`Product`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `isi`.`Product` (
  `id` BIGINT(20) NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `price` DECIMAL NULL ,
  `description` VARCHAR(500) NULL ,
  `preparation_time` BIGINT NULL ,
  `code` VARCHAR(45) NULL ,
  `type` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `isi`.`Order`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `isi`.`Order` (
  `id` BIGINT(20) NOT NULL ,
  `table` INT NULL ,
  `Ordercol` VARCHAR(45) NULL ,
  `waiter_id` BIGINT(20) NOT NULL ,
  `cook_id` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`id`, `waiter_id`, `cook_id`) ,
  INDEX `fk_Order_user1_idx` (`waiter_id` ASC) ,
  INDEX `fk_Order_user2_idx` (`cook_id` ASC) ,
  CONSTRAINT `fk_Order_user1`
    FOREIGN KEY (`waiter_id` )
    REFERENCES `isi`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_user2`
    FOREIGN KEY (`cook_id` )
    REFERENCES `isi`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `isi`.`Order_has_Product`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `isi`.`Order_has_Product` (
  `Order_id` BIGINT(20) NOT NULL ,
  `Product_id` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`Order_id`, `Product_id`) ,
  INDEX `fk_Order_has_Product_Product1_idx` (`Product_id` ASC) ,
  INDEX `fk_Order_has_Product_Order1_idx` (`Order_id` ASC) ,
  CONSTRAINT `fk_Order_has_Product_Order1`
    FOREIGN KEY (`Order_id` )
    REFERENCES `isi`.`Order` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_has_Product_Product1`
    FOREIGN KEY (`Product_id` )
    REFERENCES `isi`.`Product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

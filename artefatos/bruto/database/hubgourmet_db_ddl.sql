-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hubgourmet
-- -----------------------------------------------------
-- Esquema do banco de dados a ser aplicado no projeto hubgourmet.

-- -----------------------------------------------------
-- Schema hubgourmet
--
-- Esquema do banco de dados a ser aplicado no projeto hubgourmet.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hubgourmet` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `hubgourmet` ;

-- -----------------------------------------------------
-- Table `hubgourmet`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Usuario` (
  `email` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Expositor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Expositor` (
  `Usuario_email` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(250) NOT NULL,
  `contato` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Usuario_email`),
  INDEX `fk_Expositor_Usuario1_idx` (`Usuario_email` ASC) VISIBLE,
  CONSTRAINT `fk_Expositor_Usuario1`
    FOREIGN KEY (`Usuario_email`)
    REFERENCES `hubgourmet`.`Usuario` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Organizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Organizador` (
  `Usuario_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Usuario_email`),
  INDEX `fk_Organizador_Usuario1_idx` (`Usuario_email` ASC) VISIBLE,
  CONSTRAINT `fk_Organizador_Usuario1`
    FOREIGN KEY (`Usuario_email`)
    REFERENCES `hubgourmet`.`Usuario` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Colaborador` (
  `Usuario_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Usuario_email`),
  CONSTRAINT `fk_Colaborador_Usuario1`
    FOREIGN KEY (`Usuario_email`)
    REFERENCES `hubgourmet`.`Usuario` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Fiscalizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Fiscalizador` (
  `Usuario_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Usuario_email`),
  CONSTRAINT `fk_Fiscalizador_Usuario1`
    FOREIGN KEY (`Usuario_email`)
    REFERENCES `hubgourmet`.`Usuario` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Parceiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Parceiro` (
  `Usuario_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Usuario_email`),
  CONSTRAINT `fk_Parceiro_Usuario1`
    FOREIGN KEY (`Usuario_email`)
    REFERENCES `hubgourmet`.`Usuario` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Produto` (
  `nome` VARCHAR(45) NOT NULL,
  `Expositor_Usuario_email` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `descricao` VARCHAR(250) NULL,
  PRIMARY KEY (`nome`, `Expositor_Usuario_email`),
  INDEX `fk_Produto_Expositor1_idx` (`Expositor_Usuario_email` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_Expositor1`
    FOREIGN KEY (`Expositor_Usuario_email`)
    REFERENCES `hubgourmet`.`Expositor` (`Usuario_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Unidade_federacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Unidade_federacao` (
  `sigla` VARCHAR(2) NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`sigla`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Cidade` (
  `municipio` VARCHAR(45) NOT NULL,
  `Unidade_federacao_sigla` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`municipio`, `Unidade_federacao_sigla`),
  INDEX `fk_Cidade_Unidade_federacao1_idx` (`Unidade_federacao_sigla` ASC) VISIBLE,
  CONSTRAINT `fk_Cidade_Unidade_federacao1`
    FOREIGN KEY (`Unidade_federacao_sigla`)
    REFERENCES `hubgourmet`.`Unidade_federacao` (`sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Local`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Local` (
  `id_local` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `referencia` VARCHAR(45) NULL,
  `Cidade_nome_cidade` VARCHAR(45) NOT NULL,
  `Cidade_Unidade_federacao_sigla` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id_local`, `Cidade_nome_cidade`, `Cidade_Unidade_federacao_sigla`),
  INDEX `fk_Local_Cidade1_idx` (`Cidade_nome_cidade` ASC, `Cidade_Unidade_federacao_sigla` ASC) VISIBLE,
  CONSTRAINT `fk_Local_Cidade1`
    FOREIGN KEY (`Cidade_nome_cidade` , `Cidade_Unidade_federacao_sigla`)
    REFERENCES `hubgourmet`.`Cidade` (`municipio` , `Unidade_federacao_sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Feira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Feira` (
  `nome` VARCHAR(65) NOT NULL,
  `Organizador_Usuario_email` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(250) NULL,
  `data_inicio` DATE NULL,
  `data_termino` DATE NULL,
  `Local_id_local` INT NOT NULL,
  `Local_Cidade_nome_cidade` VARCHAR(45) NOT NULL,
  `Local_Cidade_Unidade_federacao_sigla` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`nome`, `Organizador_Usuario_email`),
  INDEX `fk_Feira_Local1_idx` (`Local_id_local` ASC, `Local_Cidade_nome_cidade` ASC, `Local_Cidade_Unidade_federacao_sigla` ASC) VISIBLE,
  INDEX `fk_Feira_Organizador1_idx` (`Organizador_Usuario_email` ASC) VISIBLE,
  CONSTRAINT `fk_Feira_Local1`
    FOREIGN KEY (`Local_id_local` , `Local_Cidade_nome_cidade` , `Local_Cidade_Unidade_federacao_sigla`)
    REFERENCES `hubgourmet`.`Local` (`id_local` , `Cidade_nome_cidade` , `Cidade_Unidade_federacao_sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feira_Organizador1`
    FOREIGN KEY (`Organizador_Usuario_email`)
    REFERENCES `hubgourmet`.`Organizador` (`Usuario_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Visitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Visitante` (
  `Usuario_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Usuario_email`),
  INDEX `fk_Visitante_Usuario1_idx` (`Usuario_email` ASC) VISIBLE,
  CONSTRAINT `fk_Visitante_Usuario1`
    FOREIGN KEY (`Usuario_email`)
    REFERENCES `hubgourmet`.`Usuario` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Ingresso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Ingresso` (
  `numero` INT(9) ZEROFILL NOT NULL AUTO_INCREMENT,
  `Feira_nome` VARCHAR(65) NOT NULL,
  `Visitante_Usuario_email` VARCHAR(45) NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`numero`, `Feira_nome`, `Visitante_Usuario_email`),
  INDEX `fk_Ingresso_Feira1_idx` (`Feira_nome` ASC) VISIBLE,
  INDEX `fk_Ingresso_Visitante1_idx` (`Visitante_Usuario_email` ASC) VISIBLE,
  CONSTRAINT `fk_Ingresso_Feira1`
    FOREIGN KEY (`Feira_nome`)
    REFERENCES `hubgourmet`.`Feira` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingresso_Visitante1`
    FOREIGN KEY (`Visitante_Usuario_email`)
    REFERENCES `hubgourmet`.`Visitante` (`Usuario_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Lista_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Lista_produto` (
  `id` INT NOT NULL,
  `Expositor_Usuario_email` VARCHAR(45) NOT NULL,
  `apelido` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `Expositor_Usuario_email`),
  INDEX `fk_Lista_produto_Expositor1_idx` (`Expositor_Usuario_email` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_produto_Expositor1`
    FOREIGN KEY (`Expositor_Usuario_email`)
    REFERENCES `hubgourmet`.`Expositor` (`Usuario_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Administrador` (
  `Usuario_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Usuario_email`),
  CONSTRAINT `fk_Administrador_Usuario1`
    FOREIGN KEY (`Usuario_email`)
    REFERENCES `hubgourmet`.`Usuario` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Lista_produto_has_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Lista_produto_has_Produto` (
  `Lista_produto_id` INT NOT NULL,
  `Lista_produto_Expositor_Usuario_email` VARCHAR(45) NOT NULL,
  `Produto_nome` VARCHAR(45) NOT NULL,
  `Produto_Expositor_Usuario_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Lista_produto_id`, `Lista_produto_Expositor_Usuario_email`, `Produto_nome`, `Produto_Expositor_Usuario_email`),
  INDEX `fk_Lista_produto_has_Produto_Produto1_idx` (`Produto_nome` ASC, `Produto_Expositor_Usuario_email` ASC) VISIBLE,
  INDEX `fk_Lista_produto_has_Produto_Lista_produto1_idx` (`Lista_produto_id` ASC, `Lista_produto_Expositor_Usuario_email` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_produto_has_Produto_Lista_produto1`
    FOREIGN KEY (`Lista_produto_id` , `Lista_produto_Expositor_Usuario_email`)
    REFERENCES `hubgourmet`.`Lista_produto` (`id` , `Expositor_Usuario_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lista_produto_has_Produto_Produto1`
    FOREIGN KEY (`Produto_nome` , `Produto_Expositor_Usuario_email`)
    REFERENCES `hubgourmet`.`Produto` (`nome` , `Expositor_Usuario_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Feira_has_Lista_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Feira_has_Lista_produto` (
  `Feira_nome` VARCHAR(65) NOT NULL,
  `Feira_Organizador_Usuario_email` VARCHAR(45) NOT NULL,
  `Lista_produto_id` INT NOT NULL,
  `Lista_produto_Expositor_Usuario_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Feira_nome`, `Feira_Organizador_Usuario_email`, `Lista_produto_id`, `Lista_produto_Expositor_Usuario_email`),
  INDEX `fk_Feira_has_Lista_produto_Lista_produto1_idx` (`Lista_produto_id` ASC, `Lista_produto_Expositor_Usuario_email` ASC) VISIBLE,
  INDEX `fk_Feira_has_Lista_produto_Feira1_idx` (`Feira_nome` ASC, `Feira_Organizador_Usuario_email` ASC) VISIBLE,
  CONSTRAINT `fk_Feira_has_Lista_produto_Feira1`
    FOREIGN KEY (`Feira_nome` , `Feira_Organizador_Usuario_email`)
    REFERENCES `hubgourmet`.`Feira` (`nome` , `Organizador_Usuario_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feira_has_Lista_produto_Lista_produto1`
    FOREIGN KEY (`Lista_produto_id` , `Lista_produto_Expositor_Usuario_email`)
    REFERENCES `hubgourmet`.`Lista_produto` (`id` , `Expositor_Usuario_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

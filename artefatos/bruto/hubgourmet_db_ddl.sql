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
-- Table `hubgourmet`.`Usuário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Usuário` (
  `id_usuário` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuário`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Expositor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Expositor` (
  `Usuário_id_usuário` INT NOT NULL,
  `descricao` VARCHAR(250) NOT NULL,
  `contato` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Usuário_id_usuário`),
  INDEX `fk_Expositor_Usuário_idx` (`Usuário_id_usuário` ASC) VISIBLE,
  CONSTRAINT `fk_Expositor_Usuário`
    FOREIGN KEY (`Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Usuário` (`id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Organizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Organizador` (
  `Usuário_id_usuário` INT NOT NULL,
  PRIMARY KEY (`Usuário_id_usuário`),
  INDEX `fk_Expositor_Usuário_idx` (`Usuário_id_usuário` ASC) VISIBLE,
  CONSTRAINT `fk_Expositor_Usuário0`
    FOREIGN KEY (`Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Usuário` (`id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Colaborador` (
  `Usuário_id_usuário` INT NOT NULL,
  PRIMARY KEY (`Usuário_id_usuário`),
  INDEX `fk_Expositor_Usuário_idx` (`Usuário_id_usuário` ASC) VISIBLE,
  CONSTRAINT `fk_Expositor_Usuário00`
    FOREIGN KEY (`Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Usuário` (`id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Fiscalizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Fiscalizador` (
  `Usuário_id_usuário` INT NOT NULL,
  PRIMARY KEY (`Usuário_id_usuário`),
  INDEX `fk_Expositor_Usuário_idx` (`Usuário_id_usuário` ASC) VISIBLE,
  CONSTRAINT `fk_Expositor_Usuário000`
    FOREIGN KEY (`Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Usuário` (`id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Parceiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Parceiro` (
  `Usuário_id_usuário` INT NOT NULL,
  PRIMARY KEY (`Usuário_id_usuário`),
  INDEX `fk_Expositor_Usuário_idx` (`Usuário_id_usuário` ASC) VISIBLE,
  CONSTRAINT `fk_Expositor_Usuário0000`
    FOREIGN KEY (`Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Usuário` (`id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Produto` (
  `Expositor_Usuário_id_usuário` INT NOT NULL,
  `nome` INT NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `descricao` VARCHAR(250) NULL,
  INDEX `fk_Produto_Expositor1_idx` (`Expositor_Usuário_id_usuário` ASC) VISIBLE,
  PRIMARY KEY (`Expositor_Usuário_id_usuário`, `nome`),
  CONSTRAINT `fk_Produto_Expositor1`
    FOREIGN KEY (`Expositor_Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Expositor` (`Usuário_id_usuário`)
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
  `Organizador_Usuário_id_usuário` INT NOT NULL,
  `nome` VARCHAR(65) NOT NULL,
  `descricao` VARCHAR(250) NULL,
  `data_inicio` DATE NULL,
  `data_termino` DATE NULL,
  `Local_id_local` INT NOT NULL,
  `Local_Cidade_nome_cidade` VARCHAR(45) NOT NULL,
  `Local_Cidade_Unidade_federacao_sigla` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`Organizador_Usuário_id_usuário`, `nome`),
  INDEX `fk_Feira_Local1_idx` (`Local_id_local` ASC, `Local_Cidade_nome_cidade` ASC, `Local_Cidade_Unidade_federacao_sigla` ASC) VISIBLE,
  CONSTRAINT `fk_Feira_Organizador1`
    FOREIGN KEY (`Organizador_Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Organizador` (`Usuário_id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feira_Local1`
    FOREIGN KEY (`Local_id_local` , `Local_Cidade_nome_cidade` , `Local_Cidade_Unidade_federacao_sigla`)
    REFERENCES `hubgourmet`.`Local` (`id_local` , `Cidade_nome_cidade` , `Cidade_Unidade_federacao_sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Visitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Visitante` (
  `Usuário_id_usuário` INT NOT NULL,
  PRIMARY KEY (`Usuário_id_usuário`),
  INDEX `fk_Expositor_Usuário_idx` (`Usuário_id_usuário` ASC) VISIBLE,
  CONSTRAINT `fk_Expositor_Usuário001`
    FOREIGN KEY (`Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Usuário` (`id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Ingresso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Ingresso` (
  `Visitante_Usuário_id_usuário` INT NOT NULL,
  `Feira_Organizador_Usuário_id_usuário` INT NOT NULL,
  `Feira_nome` VARCHAR(65) NOT NULL,
  `numero` INT(9) NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`Visitante_Usuário_id_usuário`, `Feira_Organizador_Usuário_id_usuário`, `Feira_nome`, `numero`),
  INDEX `fk_Ingresso_Feira1_idx` (`Feira_Organizador_Usuário_id_usuário` ASC, `Feira_nome` ASC) VISIBLE,
  CONSTRAINT `fk_Ingresso_Visitante1`
    FOREIGN KEY (`Visitante_Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Visitante` (`Usuário_id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingresso_Feira1`
    FOREIGN KEY (`Feira_Organizador_Usuário_id_usuário` , `Feira_nome`)
    REFERENCES `hubgourmet`.`Feira` (`Organizador_Usuário_id_usuário` , `nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Lista_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Lista_produto` (
  `Expositor_Usuário_id_usuário` INT NOT NULL,
  PRIMARY KEY (`Expositor_Usuário_id_usuário`),
  CONSTRAINT `fk_Lista_produto_Expositor1`
    FOREIGN KEY (`Expositor_Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Expositor` (`Usuário_id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Lista_produto_has_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Lista_produto_has_Produto` (
  `Lista_produto_Expositor_Usuário_id_usuário` INT NOT NULL,
  `Produto_Expositor_Usuário_id_usuário` INT NOT NULL,
  `Produto_nome` INT NOT NULL,
  PRIMARY KEY (`Lista_produto_Expositor_Usuário_id_usuário`, `Produto_Expositor_Usuário_id_usuário`, `Produto_nome`),
  INDEX `fk_Lista_produto_has_Produto_Produto1_idx` (`Produto_Expositor_Usuário_id_usuário` ASC, `Produto_nome` ASC) VISIBLE,
  INDEX `fk_Lista_produto_has_Produto_Lista_produto1_idx` (`Lista_produto_Expositor_Usuário_id_usuário` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_produto_has_Produto_Lista_produto1`
    FOREIGN KEY (`Lista_produto_Expositor_Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Lista_produto` (`Expositor_Usuário_id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lista_produto_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Expositor_Usuário_id_usuário` , `Produto_nome`)
    REFERENCES `hubgourmet`.`Produto` (`Expositor_Usuário_id_usuário` , `nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Feira_has_Lista_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Feira_has_Lista_produto` (
  `Feira_Organizador_Usuário_id_usuário` INT NOT NULL,
  `Feira_nome` VARCHAR(65) NOT NULL,
  `Lista_produto_Expositor_Usuário_id_usuário` INT NOT NULL,
  PRIMARY KEY (`Feira_Organizador_Usuário_id_usuário`, `Feira_nome`, `Lista_produto_Expositor_Usuário_id_usuário`),
  INDEX `fk_Feira_has_Lista_produto_Lista_produto1_idx` (`Lista_produto_Expositor_Usuário_id_usuário` ASC) VISIBLE,
  INDEX `fk_Feira_has_Lista_produto_Feira1_idx` (`Feira_Organizador_Usuário_id_usuário` ASC, `Feira_nome` ASC) VISIBLE,
  CONSTRAINT `fk_Feira_has_Lista_produto_Feira1`
    FOREIGN KEY (`Feira_Organizador_Usuário_id_usuário` , `Feira_nome`)
    REFERENCES `hubgourmet`.`Feira` (`Organizador_Usuário_id_usuário` , `nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feira_has_Lista_produto_Lista_produto1`
    FOREIGN KEY (`Lista_produto_Expositor_Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Lista_produto` (`Expositor_Usuário_id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hubgourmet`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hubgourmet`.`Administrador` (
  `Usuário_id_usuário` INT NOT NULL,
  PRIMARY KEY (`Usuário_id_usuário`),
  INDEX `fk_Expositor_Usuário_idx` (`Usuário_id_usuário` ASC) VISIBLE,
  CONSTRAINT `fk_Expositor_Usuário002`
    FOREIGN KEY (`Usuário_id_usuário`)
    REFERENCES `hubgourmet`.`Usuário` (`id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

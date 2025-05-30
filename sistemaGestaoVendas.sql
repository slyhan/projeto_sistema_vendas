-- MySQL Script generated by MySQL Workbench
-- Sun May 25 13:02:23 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

create database sistemaGestaoVendas;

use sistemaGestaoVendas;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Categoria` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT(200) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idCategoria_UNIQUE` ON `Categoria` (`idCategoria` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Clientes` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(45) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(50) NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idClientes_UNIQUE` ON `Clientes` (`idClientes` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `cpfCliente_UNIQUE` ON `Clientes` (`cpfCliente` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ItensVendas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ItensVendas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ItensVendas` (
  `idItensVendas` INT NOT NULL AUTO_INCREMENT,
  `idVendas` INT NULL,
  `idProdutos` INT NULL,
  `quantidade` INT NOT NULL,
  `precoUnitario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idItensVendas`),
  CONSTRAINT `idVendas`
    FOREIGN KEY (`idVendas`)
    REFERENCES `Vendas` (`idVendas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProdutos`
    FOREIGN KEY (`idProdutos`)
    REFERENCES `Produtos` (`idProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idItensVendas_UNIQUE` ON `ItensVendas` (`idItensVendas` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `idVendas_idx` ON `ItensVendas` (`idVendas` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `idProdutos_idx` ON `ItensVendas` (`idProdutos` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pagamento` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pagamento` (
  `idPagamento` INT NOT NULL AUTO_INCREMENT,
  `idVenda` INT NULL,
  `formaPagamento` VARCHAR(50) NOT NULL,
  `valorPagamento` DECIMAL(10,2) NOT NULL,
  `dataPagamento` DATETIME NOT NULL,
  `statusPagamento` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idPagamento`),
  CONSTRAINT `idVenda`
    FOREIGN KEY (`idVenda`)
    REFERENCES `Vendas` (`idVendas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idPagamento_UNIQUE` ON `Pagamento` (`idPagamento` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `idVendas_idx` ON `Pagamento` (`idVendas` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Produtos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Produtos` (
  `idProdutos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT(200) NOT NULL,
  `preco` DECIMAL NOT NULL,
  `estoque` INT NOT NULL,
  `idCategoria` INT NULL,
  PRIMARY KEY (`idProdutos`),
  CONSTRAINT `idCategoria`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idProdutos_UNIQUE` ON `Produtos` (`idProdutos` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `idCategoria_idx` ON `Produtos` (`idCategoria` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Vendas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vendas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Vendas` (
  `idVendas` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NULL,
  `idVendedor` INT NULL,
  `dataVenda` DATETIME NOT NULL,
  `valorTotal` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idVendas`),
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idVendedor`
    FOREIGN KEY (`idVendedor`)
    REFERENCES `Vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idVendas_UNIQUE` ON `Vendas` (`idVendas` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `idCliente_idx` ON `Vendas` (`idCliente` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `idVendedor_idx` ON `Vendas` (`idVendedor` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vendedor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Vendedor` (
  `idVendedor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `dataAdmissao` DATE NOT NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idVendedor_UNIQUE` ON `Vendedor` (`idVendedor` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `cpf_UNIQUE` ON `Vendedor` (`cpf` ASC) VISIBLE;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema atividade_db_mercado
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema atividade_db_mercado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `atividade_db_mercado` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `atividade_db_mercado` ;

-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`categoria_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`categoria_produto` (
  `ID_Categoria` INT NOT NULL AUTO_INCREMENT,
  `Nome_Categoria` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID_Categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`data_hora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`data_hora` (
  `ID_Data_Hora` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `Dia` VARCHAR(2) NOT NULL,
  `Mes` VARCHAR(2) NOT NULL,
  `Ano` VARCHAR(4) NOT NULL,
  `Hora` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Data_Hora`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`cadastro_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`cadastro_produto` (
  `ID_Produto` INT NOT NULL AUTO_INCREMENT,
  `Marca` VARCHAR(20) NOT NULL,
  `Modelo` VARCHAR(20) NOT NULL,
  `Descricao_Produto` VARCHAR(200) NULL DEFAULT NULL,
  `Data_Hora_ID_Data_Hora` INT NOT NULL,
  `Categoria_Produto_ID_Categoria` INT NOT NULL,
  PRIMARY KEY (`ID_Produto`, `Data_Hora_ID_Data_Hora`, `Categoria_Produto_ID_Categoria`),
  INDEX `fk_Cadastro_Produto_Data_Hora1_idx` (`Data_Hora_ID_Data_Hora` ASC),
  INDEX `fk_Cadastro_Produto_Categoria_Produto1_idx` (`Categoria_Produto_ID_Categoria` ASC),
  CONSTRAINT `fk_Cadastro_Produto_Categoria_Produto1`
    FOREIGN KEY (`Categoria_Produto_ID_Categoria`)
    REFERENCES `atividade_db_mercado`.`categoria_produto` (`ID_Categoria`),
  CONSTRAINT `fk_Cadastro_Produto_Data_Hora1`
    FOREIGN KEY (`Data_Hora_ID_Data_Hora`)
    REFERENCES `atividade_db_mercado`.`data_hora` (`ID_Data_Hora`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`setor_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`setor_funcionario` (
  `ID_Setor_Funcionario` INT NOT NULL AUTO_INCREMENT,
  `Descricao_Setor` VARCHAR(100) NULL DEFAULT NULL,
  `Nome_Setor` VARCHAR(20) NOT NULL,
  `Total_Funcionario` INT NOT NULL,
  PRIMARY KEY (`ID_Setor_Funcionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`funcionario` (
  `ID_Funcionario` INT NOT NULL AUTO_INCREMENT,
  `Setor_Funcionario_ID_Setor_Funcionario` INT NOT NULL,
  `Data_Hora_ID_Data_Hora` INT NOT NULL,
  `Funcao` VARCHAR(45) NOT NULL,
  `CPF_Funcionario` DOUBLE NOT NULL,
  `Nome_Funcionario` VARCHAR(50) NOT NULL,
  `Endereco_Funcionario` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`ID_Funcionario`, `Setor_Funcionario_ID_Setor_Funcionario`, `Data_Hora_ID_Data_Hora`),
  INDEX `fk_Funcionario_Setor_Funcionario1_idx` (`Setor_Funcionario_ID_Setor_Funcionario` ASC),
  INDEX `fk_Funcionario_Data_Hora1_idx` (`Data_Hora_ID_Data_Hora` ASC) ,
  CONSTRAINT `fk_Funcionario_Data_Hora1`
    FOREIGN KEY (`Data_Hora_ID_Data_Hora`)
    REFERENCES `atividade_db_mercado`.`data_hora` (`ID_Data_Hora`),
  CONSTRAINT `fk_Funcionario_Setor_Funcionario1`
    FOREIGN KEY (`Setor_Funcionario_ID_Setor_Funcionario`)
    REFERENCES `atividade_db_mercado`.`setor_funcionario` (`ID_Setor_Funcionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`controle_lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`controle_lote` (
  `ID_Controle_Lote` INT NOT NULL AUTO_INCREMENT,
  `ID_Cadastro_Produto` INT NOT NULL,
  `Lote_Quantidade` INT NOT NULL,
  PRIMARY KEY (`ID_Controle_Lote`, `ID_Cadastro_Produto`),
  INDEX `fk_Controle_Lote_Cadastro_Produto1_idx` (`ID_Cadastro_Produto` ASC) ,
  CONSTRAINT `fk_Controle_Lote_Cadastro_Produto1`
    FOREIGN KEY (`ID_Cadastro_Produto`)
    REFERENCES `atividade_db_mercado`.`cadastro_produto` (`ID_Produto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`estoque` (
  `ID_Estoque` INT NOT NULL AUTO_INCREMENT,
  `Controle_Lote_ID_Controle_Lote` INT NOT NULL,
  `Controle_Lote_ID_Cadastro_Produto` INT NOT NULL,
  `Data_Hora_ID_Data_Hora` INT NOT NULL,
  `Funcionario_ID_Funcionario` INT NOT NULL,
  `Funcionario_Setor_Funcionario_ID_Setor_Funcionario` INT NOT NULL,
  `Estoque_Quantidade` INT NOT NULL,
  `Estoque_Entrada` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Estoque`, `Controle_Lote_ID_Controle_Lote`, `Controle_Lote_ID_Cadastro_Produto`, `Data_Hora_ID_Data_Hora`, `Funcionario_ID_Funcionario`, `Funcionario_Setor_Funcionario_ID_Setor_Funcionario`),
  INDEX `fk_Estoque_Controle_Lote1_idx` (`Controle_Lote_ID_Controle_Lote` ASC, `Controle_Lote_ID_Cadastro_Produto` ASC) ,
  INDEX `fk_Estoque_Data_Hora1_idx` (`Data_Hora_ID_Data_Hora` ASC) ,
  INDEX `fk_Estoque_Funcionario1_idx` (`Funcionario_ID_Funcionario` ASC, `Funcionario_Setor_Funcionario_ID_Setor_Funcionario` ASC) ,
  CONSTRAINT `fk_Estoque_Controle_Lote1`
    FOREIGN KEY (`Controle_Lote_ID_Controle_Lote` , `Controle_Lote_ID_Cadastro_Produto`)
    REFERENCES `atividade_db_mercado`.`controle_lote` (`ID_Controle_Lote` , `ID_Cadastro_Produto`),
  CONSTRAINT `fk_Estoque_Data_Hora1`
    FOREIGN KEY (`Data_Hora_ID_Data_Hora`)
    REFERENCES `atividade_db_mercado`.`data_hora` (`ID_Data_Hora`),
  CONSTRAINT `fk_Estoque_Funcionario1`
    FOREIGN KEY (`Funcionario_ID_Funcionario` , `Funcionario_Setor_Funcionario_ID_Setor_Funcionario`)
    REFERENCES `atividade_db_mercado`.`funcionario` (`ID_Funcionario` , `Setor_Funcionario_ID_Setor_Funcionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`controle_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`controle_estoque` (
  `ID_Controle_Estoque` INT NOT NULL AUTO_INCREMENT,
  `Estoque_ID_Estoque` INT NOT NULL,
  `Produto_Danificado` TINYINT NULL DEFAULT NULL,
  `Validade_Expirada` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Controle_Estoque`, `Estoque_ID_Estoque`),
  INDEX `fk_Controle_Estoque_Estoque1_idx` (`Estoque_ID_Estoque` ASC) ,
  CONSTRAINT `fk_Controle_Estoque_Estoque1`
    FOREIGN KEY (`Estoque_ID_Estoque`)
    REFERENCES `atividade_db_mercado`.`estoque` (`ID_Estoque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`secao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`secao` (
  `ID_Seção` INT NOT NULL AUTO_INCREMENT,
  `Controle_Estoque_ID_Controle_Estoque` INT NOT NULL,
  `Controle_Estoque_Estoque_ID_Estoque` INT NOT NULL,
  `Nome_Secao` VARCHAR(20) NOT NULL,
  `Numero_Corredor` INT NOT NULL,
  PRIMARY KEY (`ID_Seção`, `Controle_Estoque_ID_Controle_Estoque`, `Controle_Estoque_Estoque_ID_Estoque`),
  INDEX `fk_Seção_Controle_Estoque1_idx` (`Controle_Estoque_ID_Controle_Estoque` ASC, `Controle_Estoque_Estoque_ID_Estoque` ASC) ,
  CONSTRAINT `fk_Seção_Controle_Estoque1`
    FOREIGN KEY (`Controle_Estoque_ID_Controle_Estoque` , `Controle_Estoque_Estoque_ID_Estoque`)
    REFERENCES `atividade_db_mercado`.`controle_estoque` (`ID_Controle_Estoque` , `Estoque_ID_Estoque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`prateleira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`prateleira` (
  `ID_Prateleira` INT NOT NULL,
  `Seção_ID_Seção` INT NOT NULL,
  `Seção_Controle_Estoque_ID_Controle_Estoque` INT NOT NULL,
  `Seção_Controle_Estoque_Estoque_ID_Estoque` INT NOT NULL,
  `Preco` FLOAT NULL DEFAULT NULL,
  `Nome_Produto` VARCHAR(30) NULL DEFAULT NULL,
  `Descricao_Prateleira` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Prateleira`, `Seção_ID_Seção`, `Seção_Controle_Estoque_ID_Controle_Estoque`, `Seção_Controle_Estoque_Estoque_ID_Estoque`),
  INDEX `fk_Prateleira_Seção1_idx` (`Seção_ID_Seção` ASC, `Seção_Controle_Estoque_ID_Controle_Estoque` ASC, `Seção_Controle_Estoque_Estoque_ID_Estoque` ASC) ,
  CONSTRAINT `fk_Prateleira_Seção1`
    FOREIGN KEY (`Seção_ID_Seção` , `Seção_Controle_Estoque_ID_Controle_Estoque` , `Seção_Controle_Estoque_Estoque_ID_Estoque`)
    REFERENCES `atividade_db_mercado`.`secao` (`ID_Seção` , `Controle_Estoque_ID_Controle_Estoque` , `Controle_Estoque_Estoque_ID_Estoque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`caixa_atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`caixa_atendimento` (
  `ID_Caixa_Atendimento` INT NOT NULL AUTO_INCREMENT,
  `Prateleira_ID_Prateleira` INT NOT NULL,
  `Prateleira_Seção_ID_Seção` INT NOT NULL,
  `Prateleira_Seção_Controle_Estoque_ID_Controle_Estoque` INT NOT NULL,
  `Prateleira_Seção_Controle_Estoque_Estoque_ID_Estoque` INT NOT NULL,
  `Funcionario_ID_Funcionario` INT NOT NULL,
  `Funcionario_Setor_Funcionario_ID_Setor_Funcionario` INT NOT NULL,
  `Validacao_ID_Produto` TINYINT NOT NULL,
  PRIMARY KEY (`ID_Caixa_Atendimento`, `Prateleira_ID_Prateleira`, `Prateleira_Seção_ID_Seção`, `Prateleira_Seção_Controle_Estoque_ID_Controle_Estoque`, `Prateleira_Seção_Controle_Estoque_Estoque_ID_Estoque`, `Funcionario_ID_Funcionario`, `Funcionario_Setor_Funcionario_ID_Setor_Funcionario`),
  INDEX `fk_Caixa_Atendimento_Funcionario1_idx` (`Funcionario_ID_Funcionario` ASC, `Funcionario_Setor_Funcionario_ID_Setor_Funcionario` ASC) ,
  INDEX `fk_Caixa_Atendimento_Prateleira1` (`Prateleira_ID_Prateleira` ASC, `Prateleira_Seção_ID_Seção` ASC, `Prateleira_Seção_Controle_Estoque_ID_Controle_Estoque` ASC, `Prateleira_Seção_Controle_Estoque_Estoque_ID_Estoque` ASC) ,
  CONSTRAINT `fk_Caixa_Atendimento_Funcionario1`
    FOREIGN KEY (`Funcionario_ID_Funcionario` , `Funcionario_Setor_Funcionario_ID_Setor_Funcionario`)
    REFERENCES `atividade_db_mercado`.`funcionario` (`ID_Funcionario` , `Setor_Funcionario_ID_Setor_Funcionario`),
  CONSTRAINT `fk_Caixa_Atendimento_Prateleira1`
    FOREIGN KEY (`Prateleira_ID_Prateleira` , `Prateleira_Seção_ID_Seção` , `Prateleira_Seção_Controle_Estoque_ID_Controle_Estoque` , `Prateleira_Seção_Controle_Estoque_Estoque_ID_Estoque`)
    REFERENCES `atividade_db_mercado`.`prateleira` (`ID_Prateleira` , `Seção_ID_Seção` , `Seção_Controle_Estoque_ID_Controle_Estoque` , `Seção_Controle_Estoque_Estoque_ID_Estoque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`lista_venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`lista_venda` (
  `ID_Lista_Venda` INT NOT NULL AUTO_INCREMENT,
  `Caixa_Atendimento_ID_Caixa_Atendimento` INT NOT NULL,
  `Caixa_Atendimento_Prateleira_ID_Prateleira` INT NOT NULL,
  `Caixa_Atendimento_Prateleira_Seção_ID_Seção` INT NOT NULL,
  `Prateleira_Seção_Controle_Estoque_ID_Controle_Estoque` INT NOT NULL,
  `Prateleira_Seção_Controle_Estoque_Estoque_ID_Estoque` INT NOT NULL,
  `Quantidade_Total_Item` INT NOT NULL,
  `Valor_Unitário` FLOAT NOT NULL,
  `Valor_Total` FLOAT NOT NULL,
  PRIMARY KEY (`ID_Lista_Venda`, `Caixa_Atendimento_ID_Caixa_Atendimento`, `Caixa_Atendimento_Prateleira_ID_Prateleira`, `Caixa_Atendimento_Prateleira_Seção_ID_Seção`, `Prateleira_Seção_Controle_Estoque_ID_Controle_Estoque`, `Prateleira_Seção_Controle_Estoque_Estoque_ID_Estoque`),
  INDEX `fk_Lista_Venda_Caixa_Atendimento1` (`Caixa_Atendimento_ID_Caixa_Atendimento` ASC, `Caixa_Atendimento_Prateleira_ID_Prateleira` ASC, `Caixa_Atendimento_Prateleira_Seção_ID_Seção` ASC, `Prateleira_Seção_Controle_Estoque_ID_Controle_Estoque` ASC, `Prateleira_Seção_Controle_Estoque_Estoque_ID_Estoque` ASC) ,
  CONSTRAINT `fk_Lista_Venda_Caixa_Atendimento1`
    FOREIGN KEY (`Caixa_Atendimento_ID_Caixa_Atendimento` , `Caixa_Atendimento_Prateleira_ID_Prateleira` , `Caixa_Atendimento_Prateleira_Seção_ID_Seção` , `Prateleira_Seção_Controle_Estoque_ID_Controle_Estoque` , `Prateleira_Seção_Controle_Estoque_Estoque_ID_Estoque`)
    REFERENCES `atividade_db_mercado`.`caixa_atendimento` (`ID_Caixa_Atendimento` , `Prateleira_ID_Prateleira` , `Prateleira_Seção_ID_Seção` , `Prateleira_Seção_Controle_Estoque_ID_Controle_Estoque` , `Prateleira_Seção_Controle_Estoque_Estoque_ID_Estoque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`cliente` (
  `CPF_Cliente` DOUBLE NOT NULL,
  `Lista_Venda_ID_Lista_Venda` INT NOT NULL,
  `Nome_Cliente` VARCHAR(50) NOT NULL,
  `Endereco` VARCHAR(100) NOT NULL,
  `Data_Nascimento` DATE NOT NULL,
  PRIMARY KEY (`CPF_Cliente`, `Lista_Venda_ID_Lista_Venda`),
  INDEX `fk_Cliente_Lista_Venda1_idx` (`Lista_Venda_ID_Lista_Venda` ASC) ,
  CONSTRAINT `fk_Cliente_Lista_Venda1`
    FOREIGN KEY (`Lista_Venda_ID_Lista_Venda`)
    REFERENCES `atividade_db_mercado`.`lista_venda` (`ID_Lista_Venda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`transacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`transacao` (
  `ID_Transacao` INT NOT NULL AUTO_INCREMENT,
  `FK_CPF_Cliente` DOUBLE NOT NULL,
  `FK_ID_Data_Hora` INT NOT NULL,
  `FK_ID_Lista_Venda` INT NOT NULL,
  `Tipo_Pagamento` VARCHAR(45) NOT NULL,
  `Status_Pagamento` TINYINT NOT NULL,
  `Descricao_Pagamento` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Transacao`, `FK_CPF_Cliente`, `FK_ID_Data_Hora`, `FK_ID_Lista_Venda`),
  INDEX `fk_Transacao_Data_Hora1_idx` (`FK_ID_Data_Hora` ASC) ,
  INDEX `fk_Transacao_Lista_Venda1_idx` (`FK_ID_Lista_Venda` ASC) ,
  INDEX `fk_Transacao_Cliente1` (`FK_CPF_Cliente` ASC) ,
  CONSTRAINT `fk_Transacao_Cliente1`
    FOREIGN KEY (`FK_CPF_Cliente`)
    REFERENCES `atividade_db_mercado`.`cliente` (`CPF_Cliente`),
  CONSTRAINT `fk_Transacao_Data_Hora1`
    FOREIGN KEY (`FK_ID_Data_Hora`)
    REFERENCES `atividade_db_mercado`.`data_hora` (`ID_Data_Hora`),
  CONSTRAINT `fk_Transacao_Lista_Venda1`
    FOREIGN KEY (`FK_ID_Lista_Venda`)
    REFERENCES `atividade_db_mercado`.`lista_venda` (`ID_Lista_Venda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`contabilidade_saida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`contabilidade_saida` (
  `ID_Saida` INT NOT NULL AUTO_INCREMENT,
  `FK_ID_Transacao` INT NOT NULL,
  `Deducao_Unitaria` INT NOT NULL,
  `Deducao_Total` INT NOT NULL,
  PRIMARY KEY (`ID_Saida`, `FK_ID_Transacao`),
  INDEX `fk_Contabilidade_Saida_Transacao1_idx` (`FK_ID_Transacao` ASC) ,
  CONSTRAINT `fk_Contabilidade_Saida_Transacao1`
    FOREIGN KEY (`FK_ID_Transacao`)
    REFERENCES `atividade_db_mercado`.`transacao` (`ID_Transacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atividade_db_mercado`.`nota_fiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade_db_mercado`.`nota_fiscal` (
  `ID_Nota_Fiscal` INT NOT NULL AUTO_INCREMENT,
  `FK_ID_Transacao` INT NOT NULL,
  `Descricao_Pagamento` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_Nota_Fiscal`, `FK_ID_Transacao`),
  INDEX `fk_Nota_Fiscal_Transacao1_idx` (`FK_ID_Transacao` ASC) ,
  CONSTRAINT `fk_Nota_Fiscal_Transacao1`
    FOREIGN KEY (`FK_ID_Transacao`)
    REFERENCES `atividade_db_mercado`.`transacao` (`ID_Transacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

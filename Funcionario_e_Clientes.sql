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
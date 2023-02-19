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

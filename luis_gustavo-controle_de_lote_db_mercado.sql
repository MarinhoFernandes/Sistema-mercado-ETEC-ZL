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
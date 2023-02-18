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
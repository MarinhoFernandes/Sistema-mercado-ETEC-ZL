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

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
CREATE TABLE Secao(
    ID_Secao INT NOT NULL AUTO_INCREMENT,
    ID_Controle_Estoque  INT NOT NULL,
    Nome_Secao VARCHAR(20) NOT NULL,
    Numero_Corredor INT(2) NOT NULL,
    PRIMARY KEY(ID_Secao),
    FOREIGN KEY (ID_Controle_Estoque) REFERENCES Controle_Estoque(ID_Controle_Estoque)
);
CREATE TABLE Categoria_Produto (
ID_Categoria INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Nome_Categoria VARCHAR(20) NOT NULL
)

CREATE TABLE Contabilidade_Saida(
    ID_Saida INT PRIMARY KEY NOT NULL,
    ID_Transacao INT NOT NULL,
   Deducao_Unitaria INT(5) NOT NULL,
    Deducao_Total INT(5) NOT NULL,
    FOREIGN KEY(ID_Transacao) REFERENCES Transacao(ID_Transacao)
)
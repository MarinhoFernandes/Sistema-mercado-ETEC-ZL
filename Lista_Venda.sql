CREATE TABLE Lista_Venda
    (
	 ID_Venda INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	 ID_Caixa_Atendimento INT NOT NULL,
	 Quantidade_Total_Item INT NOT NULL,
     Valor_Unitario float(10) NOT NULL,
     Valor_Total float(10) NOT NULL,
	 FOREIGN KEY (ID_Caixa_Atendimento) REFERENCES Caixa_Atendimento (ID_Caixa_Atendimento)
	 );
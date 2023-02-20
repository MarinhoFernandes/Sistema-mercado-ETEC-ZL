CREATE TABLE Caixa_Atendimento(
	 ID_Caixa_Atendimento INT NOT NULL,
	 ID_Prateleira INT NOT NULL,
	 ID_Funcionario INT NOT NULL,
	 Validacao_id_produto BOOLEAN NOT NULL,
	 PRIMARY KEY(ID_Caixa_Atendimento),
	 FOREIGN KEY (ID_Prateleira) REFERENCES Prateleira(ID_Prateleira),
	 FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario);
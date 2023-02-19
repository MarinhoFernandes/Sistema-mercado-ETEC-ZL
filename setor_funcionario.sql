-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Fev-2023 às 23:21
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `teste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `setor_funcionario`
--

CREATE TABLE `setor_funcionario` (
  `Setor_Funcionarios` int(11) NOT NULL,
  `Descricao_Setor` varchar(100) DEFAULT NULL,
  `Nome_Setor` varchar(20) NOT NULL,
  `Total_Funcionario` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `setor_funcionario`
--
ALTER TABLE `setor_funcionario`
  ADD PRIMARY KEY (`Setor_Funcionarios`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `setor_funcionario`
--
ALTER TABLE `setor_funcionario`
  MODIFY `Setor_Funcionarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `setor_funcionario`
--
ALTER TABLE `setor_funcionario`
  ADD CONSTRAINT `setor_funcionario_ibfk_1` FOREIGN KEY (`Setor_Funcionarios`) REFERENCES `funcionario` (`Funcionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

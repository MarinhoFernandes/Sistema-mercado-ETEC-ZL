-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 18-Fev-2023 às 16:57
-- Versão do servidor: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `controle_estoque`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `controle_estoque`
--

CREATE TABLE `controle_estoque` (
  `ID_Controle_Estoque` int(11) NOT NULL,
  `ID_Estoque` int(11) NOT NULL,
  `Produto_Danificado` tinyint(1) DEFAULT NULL,
  `Validade_Expirada` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `controle_estoque`
--
ALTER TABLE `controle_estoque`
  ADD PRIMARY KEY (`ID_Controle_Estoque`),
  ADD KEY `ID_Estoque` (`ID_Estoque`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `controle_estoque`
--
ALTER TABLE `controle_estoque`
  MODIFY `ID_Controle_Estoque` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

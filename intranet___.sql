-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 17-Nov-2015 às 18:19
-- Versão do servidor: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `intranet`
--

-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS `intranet`;
USE `intranet`;

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
`id_aluno` int(11) NOT NULL,
  `ra` varchar(10) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `login_aluno` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telefone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `boletim`
--

CREATE TABLE IF NOT EXISTS `boletim` (
  `id_boletim` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `id_aluno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE IF NOT EXISTS `disciplina` (
`id_disciplina` int(11) NOT NULL,
  `disciplina` varchar(30) NOT NULL,
  `id_professor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `login_aluno` varchar(60) NOT NULL,
  `login_professor` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE IF NOT EXISTS `professor` (
`id_professor` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `id_aluno` int(11) NOT NULL,
  `nota` int(11) NOT NULL,
  `login_professor` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
 ADD PRIMARY KEY (`id_aluno`), ADD UNIQUE KEY `ra` (`ra`), ADD UNIQUE KEY `login` (`login_aluno`);

--
-- Indexes for table `boletim`
--
ALTER TABLE `boletim`
 ADD PRIMARY KEY (`id_boletim`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
 ADD PRIMARY KEY (`id_disciplina`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
 ADD PRIMARY KEY (`login_professor`), ADD UNIQUE KEY `login_aluno` (`login_aluno`,`login_professor`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
 ADD PRIMARY KEY (`id_professor`), ADD UNIQUE KEY `login` (`login_professor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aluno`
--
ALTER TABLE `aluno`
MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disciplina`
--
ALTER TABLE `disciplina`
MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
MODIFY `id_professor` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `professor` (`id_professor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `boletim`
--
ALTER TABLE `boletim`
ADD CONSTRAINT `boletim_ibfk_1` FOREIGN KEY (`id_boletim`) REFERENCES `aluno` (`id_aluno`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limitadores para a tabela `login`
--
ALTER TABLE `login`
ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`login_professor`) REFERENCES `professor` (`login_professor`),
ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`login_aluno`) REFERENCES `aluno` (`login_aluno`);

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`id_professor`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

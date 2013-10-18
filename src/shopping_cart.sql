-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: Dic 20, 2011 alle 15:09
-- Versione del server: 5.5.16
-- Versione PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shopping_cart`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` text NOT NULL,
  `host` text NOT NULL,
  `tipo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `logs`
--

INSERT INTO `logs` (`id`, `ip`, `host`, `tipo`) VALUES
(1, '127.0.0.1', '127.0.0.1', 'Tentativo di accesso all area amministrativa'),
(2, '127.0.0.1', '127.0.0.1', 'Login multipli falliti per username user');

-- --------------------------------------------------------

--
-- Struttura della tabella `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `testo` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `news`
--

INSERT INTO `news` (`id`, `data`, `testo`) VALUES
(1, '2007-12-11', 'Shopping Cart apre i battenti!!'),
(2, '2011-12-08', 'Aggiunta di nuovi prodotti.');

-- --------------------------------------------------------

--
-- Struttura della tabella `ordini`
--

DROP TABLE IF EXISTS `ordini`;
CREATE TABLE IF NOT EXISTS `ordini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` text NOT NULL,
  `prodotto` text NOT NULL,
  `costo` double NOT NULL,
  `pagato` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `ordini`
--

INSERT INTO `ordini` (`id`, `cliente`, `prodotto`, `costo`, `pagato`, `data`) VALUES
(1, 'user', '0001', 160, 1, '2007-12-11'),
(2, 'user', '0001', 160, 0, '2007-12-11'),
(3, 'user', '0002', 79.9, 0, '2007-12-11');

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

DROP TABLE IF EXISTS `prodotti`;
CREATE TABLE IF NOT EXISTS `prodotti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `cod_rep` text NOT NULL,
  `cod_prod` text NOT NULL,
  `disponibilita` int(11) NOT NULL,
  `img` text NOT NULL,
  `prezzo` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`id`, `nome`, `cod_rep`, `cod_prod`, `disponibilita`, `img`, `prezzo`) VALUES
(1, 'cappotto bianco donna', '0002', '0002', 50, 'cappotto_bianco_donna.png', 79.9),
(2, 'cappotto nero uomo', '0001', '0001', 50, 'cappotto_nero_uomo.png', 160),
(3, 'scarpe uomo', '0005', '0003', 50, 'scarpe_uomo_1.png', 60);

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` longtext NOT NULL,
  `nome` text NOT NULL,
  `cognome` text NOT NULL,
  `cod` text NOT NULL,
  `mail` text NOT NULL,
  `rank` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nome`, `cognome`, `cod`, `mail`, `rank`) VALUES
(1, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'admin', 'codicefiscale', 'mail@mail.com', 5),
(2, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user', 'user', 'usercode', 'user@user.com', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

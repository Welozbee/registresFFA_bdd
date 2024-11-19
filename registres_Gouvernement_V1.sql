-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           11.5.2-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour registres_gouvernement
CREATE DATABASE IF NOT EXISTS `registres_gouvernement` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `registres_gouvernement`;

-- Listage de la structure de la table registres_gouvernement. citoyens
CREATE TABLE IF NOT EXISTS `citoyens` (
  `idCitoyen` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(100) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `idUnique` int(11) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `sexe` enum('M','F') DEFAULT NULL,
  PRIMARY KEY (`idCitoyen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table registres_gouvernement. mariages
CREATE TABLE IF NOT EXISTS `mariages` (
  `idMariage` int(11) NOT NULL AUTO_INCREMENT,
  `epoux_1` int(11) DEFAULT NULL,
  `epoux_2` int(11) DEFAULT NULL,
  `dateMariage` date DEFAULT NULL,
  `documentMariage` varchar(255) DEFAULT NULL,
  `dateDivorce` date DEFAULT NULL,
  `documentDivorce` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idMariage`),
  KEY `FK_mariages_citoyens` (`epoux_1`),
  KEY `FK_mariages_citoyens_2` (`epoux_2`),
  CONSTRAINT `FK_mariages_citoyens` FOREIGN KEY (`epoux_1`) REFERENCES `citoyens` (`idCitoyen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mariages_citoyens_2` FOREIGN KEY (`epoux_2`) REFERENCES `citoyens` (`idCitoyen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

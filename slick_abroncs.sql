-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3306
-- Létrehozás ideje: 2022. Jan 08. 14:47
-- Kiszolgáló verziója: 5.7.31
-- PHP verzió: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `slick abroncs`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

DROP TABLE IF EXISTS `felhasznalo`;
CREATE TABLE IF NOT EXISTS `felhasznalo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `felhasznalo_nev` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(150) NOT NULL,
  `teljes_nev` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `szuletesi_datum` date DEFAULT NULL,
  `iranyito_szam` int(4) NOT NULL,
  `cim` varchar(255) NOT NULL,
  `regisztracio_idopontja` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `felhasznalo_nev` (`felhasznalo_nev`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`id`, `felhasznalo_nev`, `email`, `password`, `teljes_nev`, `phone`, `szuletesi_datum`, `iranyito_szam`, `cim`, `regisztracio_idopontja`) VALUES
(137, 'Pali', 'igazi@hu.hu', '$2y$10$3/9urkYfD7OFdulq68RCbeX2AW/s6HdNoOAehyE/KLmxqmoS4.9UC', 'Berecz', '0123456', '1971-12-08', 1141, 'Budapest', '2022-01-07 23:08:18');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

DROP TABLE IF EXISTS `termek`;
CREATE TABLE IF NOT EXISTS `termek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(100) NOT NULL,
  `ar` decimal(10,0) NOT NULL,
  `kep` varchar(255) DEFAULT NULL,
  `leiras` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`id`, `nev`, `ar`, `kep`, `leiras`) VALUES
(6, 'Toyo Proxis 300/680 R19\r\n', '58800', NULL, NULL),
(7, 'Good Year Eagle 320/710 R18\r\n', '88800', NULL, NULL),
(8, 'Michelin Pilot Sport2 320/710 R18\r\n', '108800', NULL, NULL),
(9, 'Michelin Pilot Sport2 300/680 R19\r\n', '98800', NULL, NULL),
(14, 'Dunlop SL1 280/680 R19', '68000', NULL, NULL),
(15, 'Dunlop SL1 320/710 R19', '95000', NULL, NULL),
(16, 'Hankook Ventus F200 170/515 R13\r\n', '39800', 'C:\\wamp\\www\\bereczildiko_webshop\\uploads\\Hankook Ventus F200.JPG', NULL),
(17, 'Dunlop', '76000', 'uploads//Dunlop SL1.JPG20211229025224.jpg', ''),
(18, 'GoodYear', '76000', 'uploads//Eagle Good_Year.JPG20211229032355.jpg', ''),
(19, 'teszt9', '104000', 'uploads//Proxes Toyo.JPG20211229032644.jpg20220101055827.jpg', ''),
(20, 'teszt12', '104000', 'uploads//Proxes Toyo.JPG20220101061828.jpg', ''),
(21, 'teszt13', '104000', 'uploads//Ventus F200 Hankook.JPG20220101062025.jpg', ''),
(22, 'Michelin Pilot Sport2 320/680 R19', '99100', 'uploads//Pilot Sport 2 Michelin.JPG20220101062142.jpg', ''),
(23, 'Toyo Proxis 300/680 R19 ', '63200', 'uploads//Proxes Toyo.JPG20220101062353.jpg', ''),
(24, 'Michelin Pilot Sport2 225/580 R19', '69900', 'uploads//Pilot Sport 2 Michelin.JPG20220101062851.jpg', ''),
(25, 'Michelin Pilot Sport2 315/710 R19', '104000', 'uploads//Pilot Sport 2 Michelin.JPG20220101063030.jpg', ''),
(26, 'Dunlop SL1 220/480 R17', '49900', 'uploads//Dunlop SL1.JPG20220101063659.jpg', ''),
(27, 'Yokohama Advan 300/650 R18', '69000', 'uploads//Yokohama Advan.JPG20220101063920.jpg', ''),
(28, 'Yokohama Advan 280/550 R18', '53000', 'uploads//Yokohama Advan.JPG20220101064109.jpg', ''),
(29, 'teszt15', '0', 'uploads//Proxes Toyo.JPG20220101064323.jpg', ''),
(30, 'Hankook Ventus F200 250/520 R16', '55000', 'uploads//Hankook Ventus F200.JPG20220101104007.jpg', ''),
(31, 'Hankook Ventus F200 280/520 R17', '63200', 'uploads//Hankook Ventus F200.JPG20220101104132.jpg', ''),
(32, 'teszt16', '53000', 'uploads//Proxes Toyo.JPG20220101105128.jpg', ''),
(33, 'teszt17', '56000', 'uploads//Hankook Ventus F200.JPG20220101105756.jpg', ''),
(34, 'teszt18', '104000', 'uploads//Eagle Good_Year.JPG20220101110008.jpg', ''),
(35, 'teszt19', '20', 'uploads//Eagle Good_Year.JPG20220101110406.jpg', ''),
(36, 'teszt20', '20', 'uploads//Eagle Good_Year.JPG20220101110530.jpg', ''),
(37, 'teszt21', '0', 'uploads//Eagle Good_Year.JPG20220101110552.jpg', ''),
(38, 'teszt22', '0', 'uploads//Hankook Ventus F200.JPG20220101111248.jpg', ''),
(39, 'teszt23', '1', 'uploads//Hankook Ventus F200.JPG20220101111416.jpg', ''),
(40, 'teszt24', '1', 'uploads//Hankook Ventus F200.JPG20220101111524.jpg', ''),
(41, 'teszt25', '1', 'uploads//Hankook Ventus F200.JPG20220101111720.jpg', ''),
(42, 'teszt26', '1', 'uploads//Hankook Ventus F200.JPG20220101111808.jpg', ''),
(43, 'Michelin Pilot Sport2 295/580 R19', '104000', 'uploads//Pilot Sport 2 Michelin.JPG20220102013436.jpg', ''),
(44, 'Hankook Ventus F200 295/520 R17', '0', 'uploads//Hankook Ventus F200.JPG20220102081621.jpg', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

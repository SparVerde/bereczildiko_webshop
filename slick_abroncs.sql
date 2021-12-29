-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3306
-- Létrehozás ideje: 2021. Dec 29. 15:59
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
  `password` char(100) NOT NULL,
  `teljes_nev` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `szuletesi_datum` date DEFAULT NULL,
  `iranyito_szam` int(4) NOT NULL,
  `cim` varchar(255) NOT NULL,
  `regisztracio_idopontja` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `felhasznalo_nev` (`felhasznalo_nev`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`id`, `felhasznalo_nev`, `email`, `password`, `teljes_nev`, `phone`, `szuletesi_datum`, `iranyito_szam`, `cim`, `regisztracio_idopontja`) VALUES
(1, 'berecz', 'berecz@berecz.hu', '$2y$10$aKbDR2mhAVM2h.lieFjVy.8OlV9zlZPkqlCvW4yHW7JB3Xh3Z9Cta', 'Berecz', '123456789', '1971-12-08', 1111, 'Budapest', '2021-12-28 11:28:47'),
(2, 'Berecz Ádám', 'adi.berecz@gmail.com', '$2y$10$SVqdFyjAI1r5Ll5Y1AS7v.60l5g0V.kbS0Mq9Op6oZy7msBSCsMUG', 'Berecz Ádám', '123456789', '2012-11-16', 1141, 'Budapest', '2021-12-28 11:46:05'),
(3, 'Berecz Ildikó', 'berecz.ildiko@freemail.com', '$2y$10$AEsRvOzYgGbUACXHHfTPA.tubVIY2mVewVitL.HKGiWhcYnpHylt2', 'Berecz Ildikó', '123456789', '1971-12-08', 2222, 'Budapest', '2021-12-28 14:48:01'),
(4, 'Tátika', 'tatika@mail.hu', '$2y$10$uT09tr8QG/yWXAypWRggDuWcozJ7Px8cQ2T0jYn0TVjis/w96EKSe', 'Tátika', '01234567', '2000-10-10', 2222, 'Budapest', '2021-12-28 15:11:00'),
(5, 'valaki', 'valaki@hu.hu', '$2y$10$1ZWkOss22bMoNhVa3BRugOuYRrf15O5UnDWAHxYNQXhYS8jrhl0dS', 'Valaki', '01234567', '2000-01-01', 3333, 'Budapest', '2021-12-28 15:46:18'),
(8, 'tetszőleges', 'tetszoleges@hu.hu', '$2y$10$8sumU6iC/5a.IWga8OjcbeOJek.WU4FTL9SF48WI1/KA634eoEy/a', 'Tetszőleges', '01234567', '1971-12-08', 1000, 'Budapest', '2021-12-28 16:06:14'),
(9, 'teszt', 'teszt@hu.hu', '$2y$10$GnIetJJAN1lMcNQWfPKqCets1j7l0NyTrVvsdZqIhhCTZcc5wVHeK', 'Teszt Elek', '01234567', '1971-12-08', 1111, 'Budapest', '2021-12-28 16:08:08'),
(11, 'Csilla', 'csilla@hu.hu', '$2y$10$TcJ3bG2Xh7CHIs0nlX88hOrQQ3HXHuWvqvxhuokp7it4mVRe.7cxe', 'Csilla', '12345678', '2000-10-10', 2222, 'Budapest', '2021-12-28 16:14:29'),
(12, 'Csongor', 'csongor@hu.hu', '$2y$10$oBzCEV4Ytm/fQGF9H8rwz.C1hz1eiGWVU27/OQksVQpqo5UEDpOsC', 'Csongor', '12345678', '2001-11-11', 2222, 'Budapest', '2021-12-28 16:15:50'),
(13, 'tünde', 'tunde@hu.hu', '$2y$10$Trk7KNcMReEm.Xz2hdEUTeKzYDukF2BuhOPTxGAfKyQA7GrdSZLT.', 'Tünde', '123456789', '2000-01-01', 1111, 'Budapest', '2021-12-28 16:19:25'),
(15, 'masvalaki', 'masvalaki@hu.hu', '$2y$10$dSJQA0ae303Za0Abj6PyoOE9hYoZeGQID6wL5VfhgJgV1N3.Q4rTm', 'Más Valaki', '01234567', '2000-01-01', 1111, 'Budapest', '2021-12-28 16:22:29'),
(17, 'igazifelhasznalo', 'igazi@hu.hu', '$2y$10$/vYw0u/Us3MNkIhpJgUmXeyZT3jXvBkrUXemNjWvRbrcIktmPin1S', 'Igazi Felhasználó', '12345678', '2000-01-01', 1111, 'Budapest', '2021-12-28 16:27:44'),
(19, 'felhasznalo1', 'felhasznalo1@hu.hu', '$2y$10$p8X6.AcSY0HhgEXzAtiiBO9CZE4aWIav.xAU/gyKoKHfgAShE9.Q2', 'Felhasznalo1', '01234567', '1971-12-08', 1111, 'Budapest', '2021-12-28 16:33:45'),
(21, 'felhasznalo2', 'felhasznalo2@hu.hu', '$2y$10$hGezwE45H2TykeEvBNZ9.u51am0YDPV22lD21/0.tztCMrwskance', 'Felhasznalo2', '01234567', '1971-12-08', 1111, 'Budapest', '2021-12-28 16:35:17'),
(23, 'felhasznalo3', 'felhasznalo3@hu.hu', '$2y$10$8tNdUiUbi6CB6GIEQ81g2ON1WOjf88M5wyScstxlzLDj9QbpbzO/e', 'Felhasznalo3', '01234567', '2000-01-01', 1111, 'Budapest', '2021-12-28 16:41:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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
(18, 'GoodYear', '76000', 'uploads//Eagle Good_Year.JPG20211229032355.jpg', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

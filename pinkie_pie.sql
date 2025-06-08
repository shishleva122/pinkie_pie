-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vytvořeno: Úte 06. kvě 2025, 11:12
-- Verze serveru: 5.7.11
-- Verze PHP: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `pinkie_pie`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `kategorie`
--

CREATE TABLE `kategorie` (
  `kategorie_id` int(11) NOT NULL,
  `nazev` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `nakup`
--

CREATE TABLE `nakup` (
  `nakup_id` int(11) NOT NULL,
  `zakaznik_id` int(11) DEFAULT NULL,
  `obchod_id` int(11) DEFAULT NULL,
  `castka` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `obchod`
--

CREATE TABLE `obchod` (
  `obchod_id` int(11) NOT NULL,
  `nazev` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `kategorie_id` int(11) DEFAULT NULL,
  `patro` int(11) DEFAULT NULL,
  `lokace` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `produkt`
--

CREATE TABLE `produkt` (
  `produkt_id` int(11) NOT NULL,
  `jmeno` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `obchod_id` int(11) DEFAULT NULL,
  `kategorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `udalost`
--

CREATE TABLE `udalost` (
  `id` int(11) NOT NULL,
  `nazev` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `lokace` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `zakaznik`
--

CREATE TABLE `zakaznik` (
  `zakaznik_id` int(11) NOT NULL,
  `jmeno` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `prijmeni` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `zamestnanec`
--

CREATE TABLE `zamestnanec` (
  `zamestnanec_id` int(11) NOT NULL,
  `jmeno` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `prijmeni` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `telefon` varchar(20) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `pozice` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `obchod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`kategorie_id`);

--
-- Klíče pro tabulku `nakup`
--
ALTER TABLE `nakup`
  ADD PRIMARY KEY (`nakup_id`),
  ADD KEY `zakaznik_id` (`zakaznik_id`),
  ADD KEY `obchod_id` (`obchod_id`);

--
-- Klíče pro tabulku `obchod`
--
ALTER TABLE `obchod`
  ADD PRIMARY KEY (`obchod_id`),
  ADD KEY `kategorie_id` (`kategorie_id`);

--
-- Klíče pro tabulku `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`produkt_id`),
  ADD KEY `obchod_id` (`obchod_id`),
  ADD KEY `kategorie_id` (`kategorie_id`);

--
-- Klíče pro tabulku `udalost`
--
ALTER TABLE `udalost`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `zakaznik`
--
ALTER TABLE `zakaznik`
  ADD PRIMARY KEY (`zakaznik_id`);

--
-- Klíče pro tabulku `zamestnanec`
--
ALTER TABLE `zamestnanec`
  ADD PRIMARY KEY (`zamestnanec_id`),
  ADD KEY `obchod_id` (`obchod_id`);

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `nakup`
--
ALTER TABLE `nakup`
  ADD CONSTRAINT `nakup_ibfk_1` FOREIGN KEY (`zakaznik_id`) REFERENCES `zakaznik` (`zakaznik_id`),
  ADD CONSTRAINT `nakup_ibfk_2` FOREIGN KEY (`obchod_id`) REFERENCES `obchod` (`obchod_id`);

--
-- Omezení pro tabulku `obchod`
--
ALTER TABLE `obchod`
  ADD CONSTRAINT `obchod_ibfk_1` FOREIGN KEY (`kategorie_id`) REFERENCES `kategorie` (`kategorie_id`);

--
-- Omezení pro tabulku `produkt`
--
ALTER TABLE `produkt`
  ADD CONSTRAINT `produkt_ibfk_1` FOREIGN KEY (`obchod_id`) REFERENCES `obchod` (`obchod_id`),
  ADD CONSTRAINT `produkt_ibfk_2` FOREIGN KEY (`kategorie_id`) REFERENCES `kategorie` (`kategorie_id`);

--
-- Omezení pro tabulku `zamestnanec`
--
ALTER TABLE `zamestnanec`
  ADD CONSTRAINT `zamestnanec_ibfk_1` FOREIGN KEY (`obchod_id`) REFERENCES `obchod` (`obchod_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

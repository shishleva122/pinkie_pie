-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el8
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost
-- Vytvořeno: Úte 10. čen 2025, 14:05
-- Verze serveru: 8.0.25-15
-- Verze PHP: 8.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `u3114118_shishleva`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `formular_dotaz`
--

CREATE TABLE `formular_dotaz` (
  `dotaz_id` int NOT NULL,
  `jmeno` varchar(100) DEFAULT NULL,
  `prijmeni` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefon` varchar(50) DEFAULT NULL,
  `pozadavek` text,
  `datum` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `kategorie`
--

CREATE TABLE `kategorie` (
  `kategorie_id` int NOT NULL,
  `nazev` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `kategorie`
--

INSERT INTO `kategorie` (`kategorie_id`, `nazev`) VALUES
(1, 'Obecné značky'),
(2, 'Luxusní značky'),
(3, 'Restaurace'),
(4, 'Kino'),
(5, 'Parkování');

-- --------------------------------------------------------

--
-- Struktura tabulky `nakup`
--

CREATE TABLE `nakup` (
  `nakup_id` int NOT NULL,
  `zakaznik_id` int DEFAULT NULL,
  `obchod_id` int DEFAULT NULL,
  `castka` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `nakup`
--

INSERT INTO `nakup` (`nakup_id`, `zakaznik_id`, `obchod_id`, `castka`) VALUES
(1, 1, 1, 299.00),
(2, 2, 2, 499.00),
(3, 3, 3, 3200.00),
(4, 4, 4, 95.00),
(5, 5, 5, 210.00),
(6, 6, 4, 25.00),
(7, 7, 1, 59.00);

-- --------------------------------------------------------

--
-- Struktura tabulky `obchod`
--

CREATE TABLE `obchod` (
  `obchod_id` int NOT NULL,
  `nazev` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `kategorie_id` int DEFAULT NULL,
  `patro` int DEFAULT NULL,
  `lokace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `obchod`
--

INSERT INTO `obchod` (`obchod_id`, `nazev`, `kategorie_id`, `patro`, `lokace`) VALUES
(1, 'Sephora', 1, 1, 'A101'),
(2, 'Zara', 1, 1, 'A102'),
(3, 'Dior', 2, 2, 'B201'),
(4, 'Starbucks', 3, 3, 'C301'),
(5, 'CinemaCity', 4, 3, 'C302'),
(6, 'Parking -1', 5, -1, 'P1'),
(7, 'Parking -2', 5, -2, 'P2');

-- --------------------------------------------------------

--
-- Struktura tabulky `produkt`
--

CREATE TABLE `produkt` (
  `produkt_id` int NOT NULL,
  `jmeno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `obchod_id` int DEFAULT NULL,
  `kategorie_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `produkt`
--

INSERT INTO `produkt` (`produkt_id`, `jmeno`, `cena`, `obchod_id`, `kategorie_id`) VALUES
(1, 'Parfém Dior Sauvage', 3200.00, 3, 2),
(2, 'Tričko Zara', 499.00, 2, 1),
(3, 'Rtěnka Sephora', 299.00, 1, 1),
(4, 'Latte', 95.00, 4, 3),
(5, 'Vstupenka 2D', 210.00, 5, 4),
(6, 'Voda', 25.00, 4, 3),
(7, 'Toaletní papír', 59.00, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `udalost`
--

CREATE TABLE `udalost` (
  `id` int NOT NULL,
  `nazev` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `lokace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `udalost`
--

INSERT INTO `udalost` (`id`, `nazev`, `datum`, `lokace`) VALUES
(1, 'Slevový víkend', '2025-05-10', 'Patro 1'),
(2, 'Filmový festival', '2025-06-01', 'Kino'),
(3, 'Fashion show', '2025-07-15', 'Patro 2'),
(4, 'Food fest', '2025-08-20', 'Restaurace'),
(5, 'Den otevřených dveří', '2025-09-01', 'Celé centrum'),
(6, 'Noční nakupování', '2025-10-31', 'Patro 1–2'),
(7, 'Black Friday', '2025-11-29', 'Všude');

-- --------------------------------------------------------

--
-- Struktura tabulky `zakaznik`
--

CREATE TABLE `zakaznik` (
  `zakaznik_id` int NOT NULL,
  `jmeno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `prijmeni` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `zakaznik`
--

INSERT INTO `zakaznik` (`zakaznik_id`, `jmeno`, `prijmeni`) VALUES
(1, 'Jan', 'Novák'),
(2, 'Petra', 'Dvořáková'),
(3, 'Karel', 'Bartoš'),
(4, 'Iveta', 'Marešová'),
(5, 'Lucie', 'Krejčí'),
(6, 'Tomáš', 'Němec'),
(7, 'Anna', 'Urbanová');

-- --------------------------------------------------------

--
-- Struktura tabulky `zamestnanec`
--

CREATE TABLE `zamestnanec` (
  `zamestnanec_id` int NOT NULL,
  `jmeno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `prijmeni` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `telefon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `pozice` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `obchod_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `zamestnanec`
--

INSERT INTO `zamestnanec` (`zamestnanec_id`, `jmeno`, `prijmeni`, `telefon`, `pozice`, `obchod_id`) VALUES
(1, 'Jana', 'Malá', '777123456', 'prodavačka', 1),
(2, 'Roman', 'Velký', '777234567', 'prodavač', 2),
(3, 'David', 'Klein', '777345678', 'manager', 3),
(4, 'Eva', 'Novotná', '777456789', 'barista', 4),
(5, 'Michal', 'Stará', '777567890', 'pokladní', 5),
(6, 'Lucie', 'Dlouhá', '777678901', 'recepční', 6),
(7, 'Tomáš', 'Krátký', '777789012', 'technik', 7);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `formular_dotaz`
--
ALTER TABLE `formular_dotaz`
  ADD PRIMARY KEY (`dotaz_id`);

--
-- Indexy pro tabulku `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`kategorie_id`);

--
-- Indexy pro tabulku `nakup`
--
ALTER TABLE `nakup`
  ADD PRIMARY KEY (`nakup_id`),
  ADD KEY `zakaznik_id` (`zakaznik_id`),
  ADD KEY `obchod_id` (`obchod_id`);

--
-- Indexy pro tabulku `obchod`
--
ALTER TABLE `obchod`
  ADD PRIMARY KEY (`obchod_id`),
  ADD KEY `kategorie_id` (`kategorie_id`);

--
-- Indexy pro tabulku `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`produkt_id`),
  ADD KEY `obchod_id` (`obchod_id`),
  ADD KEY `kategorie_id` (`kategorie_id`);

--
-- Indexy pro tabulku `udalost`
--
ALTER TABLE `udalost`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `zakaznik`
--
ALTER TABLE `zakaznik`
  ADD PRIMARY KEY (`zakaznik_id`);

--
-- Indexy pro tabulku `zamestnanec`
--
ALTER TABLE `zamestnanec`
  ADD PRIMARY KEY (`zamestnanec_id`),
  ADD KEY `obchod_id` (`obchod_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `formular_dotaz`
--
ALTER TABLE `formular_dotaz`
  MODIFY `dotaz_id` int NOT NULL AUTO_INCREMENT;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

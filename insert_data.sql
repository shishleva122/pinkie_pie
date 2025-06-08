-- Zakaznik
INSERT INTO zakaznik VALUES
(1, 'Jan', 'Novák'),
(2, 'Petra', 'Dvořáková'),
(3, 'Karel', 'Bartoš'),
(4, 'Iveta', 'Marešová'),
(5, 'Lucie', 'Krejčí'),
(6, 'Tomáš', 'Němec'),
(7, 'Anna', 'Urbanová');

-- Kategorie
INSERT INTO kategorie VALUES
(1, 'Obecné značky'),
(2, 'Luxusní značky'),
(3, 'Restaurace'),
(4, 'Kino'),
(5, 'Parkování');

-- Obchod
INSERT INTO obchod VALUES
(1, 'Sephora', 1, 1, 'A101'),
(2, 'Zara', 1, 1, 'A102'),
(3, 'Dior', 2, 2, 'B201'),
(4, 'Starbucks', 3, 3, 'C301'),
(5, 'CinemaCity', 4, 3, 'C302'),
(6, 'Parking -1', 5, -1, 'P1'),
(7, 'Parking -2', 5, -2, 'P2');

-- Zamestnanec
INSERT INTO zamestnanec VALUES
(1, 'Jana', 'Malá', '777123456', 'prodavačka', 1),
(2, 'Roman', 'Velký', '777234567', 'prodavač', 2),
(3, 'David', 'Klein', '777345678', 'manager', 3),
(4, 'Eva', 'Novotná', '777456789', 'barista', 4),
(5, 'Michal', 'Stará', '777567890', 'pokladní', 5),
(6, 'Lucie', 'Dlouhá', '777678901', 'recepční', 6),
(7, 'Tomáš', 'Krátký', '777789012', 'technik', 7);

-- Produkt
INSERT INTO produkt VALUES
(1, 'Parfém Dior Sauvage', 3200.00, 3, 2),
(2, 'Tričko Zara', 499.00, 2, 1),
(3, 'Rtěnka Sephora', 299.00, 1, 1),
(4, 'Latte', 95.00, 4, 3),
(5, 'Vstupenka 2D', 210.00, 5, 4),
(6, 'Voda', 25.00, 4, 3),
(7, 'Toaletní papír', 59.00, 1, 1);

-- Nakup
INSERT INTO nakup VALUES
(1, 1, 1, 299.00),
(2, 2, 2, 499.00),
(3, 3, 3, 3200.00),
(4, 4, 4, 95.00),
(5, 5, 5, 210.00),
(6, 6, 4, 25.00),
(7, 7, 1, 59.00);

-- Udalost
INSERT INTO udalost VALUES
(1, 'Slevový víkend', '2025-05-10', 'Patro 1'),
(2, 'Filmový festival', '2025-06-01', 'Kino'),
(3, 'Fashion show', '2025-07-15', 'Patro 2'),
(4, 'Food fest', '2025-08-20', 'Restaurace'),
(5, 'Den otevřených dveří', '2025-09-01', 'Celé centrum'),
(6, 'Noční nakupování', '2025-10-31', 'Patro 1–2'),
(7, 'Black Friday', '2025-11-29', 'Všude');

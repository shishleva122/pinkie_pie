-- 1. Zákazníci, kteří nakupovali v obchodě s ID 1
SELECT * FROM zakaznik
WHERE zakaznik_id IN (SELECT zakaznik_id FROM nakup WHERE obchod_id = 1);

-- 2. Produkty dražší než 500 Kč
SELECT * FROM produkt
WHERE cena > 500;

-- 3. Zaměstnanci z patra 3
SELECT z.* FROM zamestnanec z
JOIN obchod o ON z.obchod_id = o.obchod_id
WHERE o.patro = 3;

-- 4. Nákupy nad 1000 Kč
SELECT * FROM nakup
WHERE castka > 1000;

-- 5. Všechny produkty v kategorii 'Luxusní značky'
SELECT p.* FROM produkt p
JOIN kategorie k ON p.kategorie_id = k.kategorie_id
WHERE k.nazev = 'Luxusní značky';

-- 6. Seznam všech událostí konaných v roce 2025
SELECT * FROM udalost
WHERE YEAR(datum) = 2025;

-- 7. Jména obchodů, kde pracuje zaměstnanec se jménem 'Eva'
SELECT o.nazev FROM obchod o
JOIN zamestnanec z ON z.obchod_id = o.obchod_id
WHERE z.jmeno = 'Eva';

-- 8. Kolik zákazníků nakoupilo v každém obchodě
SELECT obchod_id, COUNT(*) AS pocet_nakupu
FROM nakup
GROUP BY obchod_id;

-- 9. Obchody s více než 1 nákupem
SELECT obchod_id, COUNT(*) AS pocet
FROM nakup
GROUP BY obchod_id
HAVING COUNT(*) > 1;

-- 10. Výpis produktů a jejich kategorií (JOIN)
SELECT p.jmeno, p.cena, k.nazev AS kategorie
FROM produkt p
JOIN kategorie k ON p.kategorie_id = k.kategorie_id;

-- 11. Výpis všech zaměstnanců včetně obchodních názvů (JOIN)
SELECT z.jmeno, z.prijmeni, o.nazev AS obchod
FROM zamestnanec z
JOIN obchod o ON z.obchod_id = o.obchod_id;

-- 12. Všechny obchody a případné nákupy (LEFT JOIN)
SELECT o.nazev, n.castka
FROM obchod o
LEFT JOIN nakup n ON o.obchod_id = n.obchod_id;

-- 13. Všichni zákazníci a jejich nákupy (LEFT JOIN)
SELECT z.jmeno, z.prijmeni, n.castka
FROM zakaznik z
LEFT JOIN nakup n ON z.zakaznik_id = n.zakaznik_id;

-- 14. Průměrná cena produktů v jednotlivých kategoriích
SELECT k.nazev, AVG(p.cena) AS prumerna_cena
FROM produkt p
JOIN kategorie k ON p.kategorie_id = k.kategorie_id
GROUP BY k.nazev;

-- 15. Všichni zákazníci, kteří nenakoupili v obchodě s názvem 'Dior'
SELECT DISTINCT z.*
FROM zakaznik z
WHERE zakaznik_id NOT IN (
    SELECT zakaznik_id FROM nakup
    WHERE obchod_id = (SELECT obchod_id FROM obchod WHERE nazev = 'Dior')
);

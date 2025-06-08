-- Tabulka zakaznik
CREATE TABLE zakaznik (
    zakaznik_id INT PRIMARY KEY,
    jmeno VARCHAR(50),
    prijmeni VARCHAR(50)
);

-- Tabulka kategorie
CREATE TABLE kategorie (
    kategorie_id INT PRIMARY KEY,
    nazev VARCHAR(50)
);

-- Tabulka obchod
CREATE TABLE obchod (
    obchod_id INT PRIMARY KEY,
    nazev VARCHAR(100),
    kategorie_id INT,
    patro INT,
    lokace VARCHAR(100),
    FOREIGN KEY (kategorie_id) REFERENCES kategorie(kategorie_id)
);

-- Tabulka zamestnanec
CREATE TABLE zamestnanec (
    zamestnanec_id INT PRIMARY KEY,
    jmeno VARCHAR(50),
    prijmeni VARCHAR(50),
    telefon VARCHAR(20),
    pozice VARCHAR(50),
    obchod_id INT,
    FOREIGN KEY (obchod_id) REFERENCES obchod(obchod_id)
);

-- Tabulka produkt
CREATE TABLE produkt (
    produkt_id INT PRIMARY KEY,
    jmeno VARCHAR(100),
    cena DECIMAL(10,2),
    obchod_id INT,
    kategorie_id INT,
    FOREIGN KEY (obchod_id) REFERENCES obchod(obchod_id),
    FOREIGN KEY (kategorie_id) REFERENCES kategorie(kategorie_id)
);

-- Tabulka nakup
CREATE TABLE nakup (
    nakup_id INT PRIMARY KEY,
    zakaznik_id INT,
    obchod_id INT,
    castka DECIMAL(10,2),
    FOREIGN KEY (zakaznik_id) REFERENCES zakaznik(zakaznik_id),
    FOREIGN KEY (obchod_id) REFERENCES obchod(obchod_id)
);

-- Tabulka udalost
CREATE TABLE udalost (
    id INT PRIMARY KEY,
    nazev VARCHAR(100),
    datum DATE,
    lokace VARCHAR(100)
);

-- Erstellen der Datenbank für ein Szenario Physiotherapie
--Gruppe: Bastian Litzmann, Leon Michael Barratt, Moritz Rohleder

--	---------------------------------------------------------------------------------
--				Erstellen der Tabellen für die Datenbank
--	---------------------------------------------------------------------------------

--Datenbank einmal aufräumen
DROP TABLE patient CASCADE CONSTRAINTS;
DROP TABLE qualifikation CASCADE CONSTRAINTS;
DROP TABLE mitabeiter CASCADE CONSTRAINTS;
DROP TABLE kurs CASCADE CONSTRAINTS;
DROP TABLE kursteilnahme CASCADE CONSTRAINTS;

--Tabelle für Patienten
CREATE TABLE patient(
	idPatient 			NUMBER(10) NOT NULL PRIMARY KEY,
	nachname			VARCHAR(45) NOT NULL,
	vorname				VARCHAR(45) NOT NULL,
	geschlecht			VARCHAR(8) CHECK (Geschlecht IN ('männlich','weiblich','divers')),
	geburtsdatum		DATE NOT NULL,
	krankenkasse		VARCHAR(45) NOT NULL,
	versichertennummer	NUMBER(10) NOT NULL,
	tel					VARCHAR(15) NOT NULL,
	mail				VARCHAR(45) NOT NULL,
	wohnort				VARCHAR(45) NOT NULL,
	strasse				VARCHAR(45) NOT NULL,
	plz					CHARACTER(5) CHECK (plz BETWEEN '0' AND '99999'),
	hausnummer			NUMBER(10) NOT NULL
)

--Tabelle für Qualifikationen
CREATE TABLE qualifikation(
	idQuali		NUMBER(10) NOT NULL PRIMARY KEY,
	bezeichnung	VARCHAR(45) NOT NULL,
	idParent	NUMBER(10),
	FOREIGN KEY (idParent) REFERENCES qualifikation(idQuali)
)

--Tabelle für Mitarbeiter
CREATE TABLE mitarbeiter(
	idMitarbeiter	NUMBER(10) NOT NULL PRIMARY KEY,
	nachname		VARCHAR(45) NOT NULL,
	vorname			VARCHAR(45) NOT NULL,
	geschlecht		VARCHAR(8) CHECK (Geschlecht IN ('männlich','weiblich','divers')),
	idQuali			NUMBER(10) NOT NULL,
	FOREIGN KEY (idQuali) REFERENCES qualifikation(idQuali)
)

--Tabelle für Kurse
CREATE TABLE kurs(
	idKurs			NUMBER(10) NOT NULL PRIMARY KEY,
	bezeichnung		VARCHAR(45) NOT NULL,
	beschreibung	VARCHAR (100) NOT NULL,
	idMitarbeiter	NUMBER(10) NOT NULL,
	preis			NUMBER (19) CHECK (preis > 0),
	FOREIGN KEY (idMitarbeiter) REFERENCES mitabeiter(idMitarbeiter)
)

--Tabelle für Kursteilnahmen
CREATE TABLE kursteilnahme(
	idKurs		NUMBER(10) NOT NULL,
	idPatient	NUMBER(10) NOT NULL,
	termin		VARCHAR(45)
	PRIMARY KEY (idKurs, idPatient),
	FOREIGN KEY (idKurs) REFERENCES kurs(idKurs),
	FOREIGN KEY (idPatient) REFERENCES patient(idPatient)
)

--	---------------------------------------------------------------------------------
--				Einfügen der Daten in die Datenbank
--	---------------------------------------------------------------------------------

--Einfügen der Patienten
--idPatient, nachname, vorname, geschlecht, geburtsdatum, krankenkasse, versichertennummer, tel, mail, wohnort, strasse, plz, hausnummer
INSERT INTO patient VALUES (1, 'Liebermensch', 'Ralph', 'männlich', '09.03.1986', 'Techniker Krankenkasse', 6470263707, '02873 6725', 'ralph-liebermensch@web.de', 'Düsseldorf', 'Liebstrasse', 40210,5),
INSERT INTO patient VALUES (2, 'Hans', 'Jasmin', 'weiblich', '31.08.1974', 'AOK', 8765402579, '02634 7680215', 'hans.jasmin@gmail.com', 'Duisburg', 'Stadtallee', 47055, 90),

--Einfügen der Qualifikationen
-- idQuali, bezeichnung, idParent
INSERT INTO qualifikation VALUES (1, Physiotherapeut, NULL),

--Einfügen der Mitarbeiter
-- idMitarbeiter, nachname, vorname, geschlecht, idQuali
INSERT INTO mitarbeiter VALUES (1, 'Risel', 'Hubert', 'männlich', 1),
INSERT INTO mitarbeiter VALUES (2, 'Reinert', 'Melissa', 'weiblich', 1),

--Einfügen der Kurse
-- idKurs, bezeichnung, beschreibung, idMitarbeiter, preis
INSERT INTO kurs VALUES (1, 'Reha', 'Rehabilitations Kurs', 1, 50),
INSERT INTO kurs VALUES (2, 'Krankengymnastic', 'Rücken stärkende Gymnastic', 2, 45),

--Einfügen der Kursteilnahmen
-- idKurs, idPatient, termin
INSERT INTO kursteilnahme VALUES (1, 1, 'Mittwochs 16:00'),
INSERT INTO kursteilnahme VALUES (1, 2, 'Montags 13:00'),
INSERT INTO kursteilnahme VALUES (2, 1, 'Mittwochs 16:00'),

-- Erstellen der Datenbank für ein Szenario Physiotherapie
--Gruppe: Bastian Litzmann, Leon Michael Barratt, Moritz Rohleder

--	---------------------------------------------------------------------------------
--				Erstellen der Tabellen für die Datenbank
--	---------------------------------------------------------------------------------

--Datenbank einmal aufräumen
DROP TABLE patient CASCADE CONSTRAINTS;
DROP TABLE qualifikation CASCADE CONSTRAINTS;
DROP TABLE mitarbeiter CASCADE CONSTRAINTS;
DROP TABLE qualifiziert CASCADE CONSTRAINTS;
DROP TABLE kurs CASCADE CONSTRAINTS;
DROP TABLE kursteilnahme CASCADE CONSTRAINTS;

--Tabelle für Patienten
CREATE TABLE patient (
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
);

--Tabelle für Qualifikationen
CREATE TABLE qualifikation (
	idQuali		NUMBER(10) NOT NULL PRIMARY KEY,
	bezeichnung	VARCHAR(45) NOT NULL,
	idParent	NUMBER(10),
	FOREIGN KEY (idParent) REFERENCES qualifikation(idQuali)
);

--Tabelle für Mitarbeiter
CREATE TABLE mitarbeiter (
	idMitarbeiter	NUMBER(10) NOT NULL PRIMARY KEY,
	nachname		VARCHAR(45) NOT NULL,
	vorname			VARCHAR(45) NOT NULL,
	geschlecht		VARCHAR(8) CHECK (Geschlecht IN ('männlich','weiblich','divers'))
);

CREATE TABLE qualifiziert (
	idMitarbeiter NUMBER(10) NOT NULL,
	idQuali NUMBER(10) NOT NULL,
	PRIMARY KEY (idMitarbeiter, idQuali),
	FOREIGN KEY (idMitarbeiter) REFERENCES mitarbeiter(idMitarbeiter),
	FOREIGN KEY (idQuali) REFERENCES qualifikation(idQuali)
);

--Tabelle für Kurse
CREATE TABLE kurs (
	idKurs			NUMBER(10) NOT NULL PRIMARY KEY,
	bezeichnung		VARCHAR(45) NOT NULL,
	beschreibung	VARCHAR (100) NOT NULL,
	idMitarbeiter	NUMBER(10) NOT NULL,
	preis			NUMBER (19) CHECK (preis > 0),
	FOREIGN KEY (idMitarbeiter) REFERENCES mitarbeiter(idMitarbeiter)
);

--Tabelle für Kursteilnahmen
CREATE TABLE kursteilnahme (
	idKurs		NUMBER(10) NOT NULL,
	idPatient	NUMBER(10) NOT NULL,
	termin		VARCHAR(45),
	PRIMARY KEY (idKurs, idPatient),
	FOREIGN KEY (idKurs) REFERENCES kurs(idKurs),
	FOREIGN KEY (idPatient) REFERENCES patient(idPatient)
);

--	---------------------------------------------------------------------------------
--				Einfügen der Daten in die Datenbank
--	---------------------------------------------------------------------------------

--Einfügen der Patienten
--idPatient, nachname, vorname, geschlecht, geburtsdatum, krankenkasse, versichertennummer, tel, mail, wohnort, strasse, plz, hausnummer
INSERT INTO patient VALUES (1, 'Liebermensch', 'Ralph', 'männlich', '09.03.1986', 'Techniker Krankenkasse', 6470263707, '02873 6725', 'ralph-liebermensch@web.de', 'Düsseldorf', 'Liebstrasse', 40210,5);
INSERT INTO patient VALUES (2, 'Hans', 'Jasmin', 'weiblich', '31.08.1974', 'AOK', 8765402579, '02634 7680215', 'hans.jasmin@gmail.com', 'Duisburg', 'Stadtallee', 47055, 90);
INSERT INTO patient VALUES (3, 'Frank', 'Josephine', 'weiblich', '27.11.2000', 'Barmer', 6481695459, '02578 46239', 'kleine.eule@web.de', 'Frankfurt', 'Bahnhofstraße' , 60306, 10);
INSERT INTO patient VALUES (4, 'Mueller', 'Wolfgang', 'männlich', '24.09.1972', 'Knappschaft', 1798697501, '05602 56294627', 'mueller.muenchen@gmail.de', 'München', 'Tropfstraße', 28947, 87);
INSERT INTO patient VALUES (5, 'Kastell', 'Nina', 'weiblich', '23.08.1964', 'Techniker Krankenkasse', 8998534687, '02489 31729', 'nina@mellis.de', 'Mühlheim', 'Theodorstraße', 45478, 28);

--Einfügen der Qualifikationen
-- idQuali, bezeichnung, idParent
INSERT INTO qualifikation VALUES (1, 'Physiotherapeut', NULL);
INSERT INTO qualifikation VALUES (2, 'Sporttherapeut', NULL);
INSERT INTO qualifikation VALUES (3, 'Sport und Gymnastic Lehrere', 2);
INSERT INTO qualifikation VALUES (4, 'Sport und Fitness Kaufmann', 2);
INSERT INTO qualifikation VALUES (5, 'Sportwissenschaftler', 2);
INSERT INTO qualifikation VALUES (6, 'Manuelle Therapie (MT)', 1);
INSERT INTO qualifikation VALUES (7, 'Manuelle Lymphdrainage (MLD)', 1);
INSERT INTO qualifikation VALUES (8, 'Krankengymnastik nach Bobath (KG-ZNS)', 1);
INSERT INTO qualifikation VALUES (9, 'Propriozeptive Neuromuskuläre Facilitation', 1);
INSERT INTO qualifikation VALUES (10, 'Gerätegestüzte Krankengymnastik (KGG)', 1);

--Einfügen der Mitarbeiter
-- idMitarbeiter, nachname, vorname, geschlecht, idQuali
INSERT INTO mitarbeiter VALUES (1, 'Risel', 'Hubert', 'männlich');
INSERT INTO mitarbeiter VALUES (2, 'Reinert', 'Melissa', 'weiblich');
INSERT INTO mitarbeiter VALUES (3, 'Peters', 'Peter', 'männlich');
INSERT INTO mitarbeiter VALUES (4, 'Janßen', 'Marie', 'weiblich');
INSERT INTO mitarbeiter VALUES (5, 'Liebherr', 'Rudolf', 'männlich');

--Einfügen der Qualifikationen der einzelnen Mitarbeiter
-- idMitarbeiter, idQuali
INSERT INTO qualifiziert VALUES (1, 1);
INSERT INTO qualifiziert VALUES (2, 1);
INSERT INTO qualifiziert VALUES (3, 2);
INSERT INTO qualifiziert VALUES (4, 2);
INSERT INTO qualifiziert VALUES (5, 1);
INSERT INTO qualifiziert VALUES (1, 6);
INSERT INTO qualifiziert VALUES (1,10);
INSERT INTO qualifiziert VALUES (2,7);
INSERT INTO qualifiziert VALUES (2, 9);
INSERT INTO qualifiziert VALUES (3, 3);
INSERT INTO qualifiziert VALUES (4,4);
INSERT INTO qualifiziert VALUES (5,2);
INSERT INTO qualifiziert VALUES (5, 5);

--Einfügen der Kurse
-- idKurs, bezeichnung, beschreibung, idMitarbeiter, preis
INSERT INTO kurs VALUES (1, 'Reha', 'Rehabilitations Kurs', 3, 50);
INSERT INTO kurs VALUES (2, 'Krankengymnastik', 'Rücken stärkende Gymnastik', 4, 45);
INSERT INTO kurs VALUES (3, 'KGG', 'Gerätegestüzte Krankengymnastik', 1, 120);
INSERT INTO kurs VALUES (4, 'Faszien', 'Training mit Rolle', 2, 60);
INSERT INTO kurs VALUES (5, 'Fort. Reha', 'Fortgeschrittener Reha Kurs', 5, 80);

--Einfügen der Kursteilnahmen
-- idKurs, idPatient, termin
INSERT INTO kursteilnahme VALUES (1, 1, 'Mittwochs 16:00');
INSERT INTO kursteilnahme VALUES (1, 2, 'Montags 13:00');
INSERT INTO kursteilnahme VALUES (2, 1, 'Mittwochs 16:00');
INSERT INTO kursteilnahme VALUES (2, 3, 'Mittwochs 16:00');
INSERT INTO kursteilnahme VALUES (3, 5, 'Donnerstags 15:30');
INSERT INTO kursteilnahme VALUES (4, 5, 'Freitags 7:15');
INSERT INTO kursteilnahme VALUES (5, 4, 'Dienstags 20:00');
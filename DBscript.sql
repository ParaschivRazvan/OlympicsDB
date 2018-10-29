CREATE TABLE
locuri_competitii_academice
( id_loc_acad NUMBER(2),
nume VARCHAR2(50) NOT NULL,
adresa VARCHAR2(50) NOT NULL,
oras VARCHAR2(50) NOT NULL, capacitate NUMBER(5) NOT NULL,
descriere VARCHAR2(400),
telefon VARCHAR2(15),
CONSTRAINT pk_acad primary key (id_loc_acad)
);

CREATE TABLE
locuri_competitii_sportive
( id_loc_sport NUMBER(2),
nume VARCHAR2(50) not null,
adresa VARCHAR2(50) not null,
oras VARCHAR2(50) not null,
capacitate NUMBER(5) not null,
descriere VARCHAR2(400),
telefon VARCHAR2(15),
CONSTRAINT pk_sport primary key (id_loc_sport)
);

CREATE TABLE
locuri_competitii_esport
( id_loc_esport NUMBER(2),
nume VARCHAR2(50) NOT NULL,
adresa VARCHAR2(50) NOT NULL,
oras VARCHAR2(50) NOT NULL,
capacitate NUMBER(5) NOT NULL,
descriere VARCHAR2(400),
telefon VARCHAR2(15),
CONSTRAINT pk_esport primary key (id_loc_esport)
);

CREATE TABLE competitii
( id_competitie NUMBER(3),
nume VARCHAR2(50) NOT NULL,
tip VARCHAR2(50) NOT NULL,
organizator VARCHAR2(50) NOT NULL,
domeniu VARCHAR2(50) NOT NULL,
data DATE NOT NULL,
email_organizator VARCHAR(15),
id_loc_acad NUMBER(2),
id_loc_sport NUMBER(2),
id_loc_esport NUMBER(2),
CONSTRAINT pk_competitie primary key (id_competitie),
CONSTRAINT pk_a foreign key (id_loc_acad) 
references locuri_competitii_academice(id_loc_acad),
CONSTRAINT pk_s foreign key (id_loc_sport) 
references locuri_competitii_sportive(id_loc_sport),
CONSTRAINT pk_es foreign key (id_loc_esport) 
references locuri_competitii_esport(id_loc_esport)
);

CREATE TABLE echipe(
id_echipa NUMBER(3),
nume VARCHAR2(50) NOT NULL,
tara VARCHAR 2(50) NOT NULL,
adresa VARCHAR 2(100) NOT NULL,
domeniu VARCHAR 2(50) NOT NULL ,
telefon VARCHAR 2(15),
id_antrenor NUMBER(2) NOT NULL,
CONSTRAINT pk_echipa primary key (id_echipa),
CONSTRAINT pk_ant foreign key (id_antrenor) references antrenori(id_antrenor)
);

CREATE TABLE antrenori(
Id_antrenor NUMBER(2),
Nume VARCHAR2(50) NOT NULL,
preNume VARCHAR2(50) NOT NULL,
Nationalitate VARCHAR2(50) NOT NULL,
Data_debut DATE NOT NULL,
Specializare VARCHAR2(300) NOT NULL,
Email VARCHAR2(50),
CONSTRAINT pk_antrenor primary key (id_antrenor)
);

CREATE TABLE punctaje(
id_punctaj NUMBER(5),
data DATE NOT NULL,
valoare NUMBER(3) NOT NULL,
mentiuni VARCHAR2(300),
id_echipa NUMBER(3),
CONSTRAINT pk_punctaj primary key (id_punctaj),
CONSTRAINT pk_e foreign key (id_echipa) references echipe (id_echipa)
);

CREATE TABLE fise_inscriere (
id_fisa NUMBER(3),
data_inscriere DATE NOT NULL,
cost NUMBER(3),
id_competitie NUMBER(3) NOT NULL,
id_echipa NUMBER(3) NOT NULL,
CONSTRAINT pk_fisa primary key (id_fisa),
CONSTRAINT pk_comp foreign key (id_competitie) references competitii(id_competitie),
CONSTRAINT pk_ec foreign key (id_echipa) references echipe (id_echipa) );
CREATE TABLE premii(
id_premiu NUMBER(3),
nume VARCHAR2(50) NOT NULL,
material  VARCHAR2(50) NOT NULL,
data DATE NOT NULL,
tip_competitie VARCHAR2(50) NOT NULL,
domeniu VARCHAR2(30) NOT NULL,
CONSTRAINT pk_premiu primary key(id_premiu)
);
CREATE TABLE medici (
id_medic NUMBER(3),
nume VARCHAR2(50) NOT NULL,
prenume VARCHAR2(50) NOT NULL,
nationalitate VARCHAR2(50) NOT NULL,
data_debut DATE NOT NULL,
specializare VARCHAR2(50) NOT NULL,
email VARCHAR2(50),
id_echipa NUMBER(3) NOT NULL,
CONSTRAINT pk_medic primary key (id_medic),
CONSTRAINT pk_ech foreign key (id_echipa) references echipe(id_echipa));
CREATE TABLE 
competitori(
id_competitor NUMBER(3),
nume VARCHAR2(50) NOT NULL,
prenume VARCHAR 2(50) NOT NULL,
tara VARCHAR 2(50) NOT NULL,
data_nasterii DATE NOT NULL,
salariu NUMBER(4),
specializare VARCHAR 2(50) NOT NULL,
email VARCHAR 2(50),
id_echipa NUMBER(3) NOT NULL,
id_premiu NUMBER(2),
CONSTRAINT pk_competitor primary key(id_competitor),
CONSTRAINT pk_echi foreign key(id_echipa) references echipe(id_echipa),
CONSTRAINT pk_p foreign key(id_premiu) references premii(id_premiu));

INSERT INTO locuri_competitii_academice (id_loc_acad, nume, adresa, oras, capacitate, telefon) VALUES ('1', 'CN Mihai Viteazul','Pache Protopopescu Nr.6', 'Bucuresti', '300', '07750090022');
INSERT INTO locuri_competitii_academice (id_loc_acad, nume, adresa, oras, capacitate, descriere) VALUES ('2', 'Liceul Mihai Eminescu', 'Str. George Georgescu Nr.7', 'Bucuresti', '230', 'Intrarea se face prin spatele liceului, din cauza unei probleme tehnice a usii');
INSERT INTO locuri_competitii_academice (id_loc_acad, nume, adresa, oras, capacitate, descriere) VALUES('3', 'Cambridge College Building A', 'Huntingdon Road No.15', 'Cambridge', '785', 'CandiDATEs shall wait for a designated person to pick them up and guide them to the building.');
INSERT INTO locuri_competitii_academice (id_loc_acad, nume, adresa, oras, capacitate, telefon) VALUES('4', 'UPB', 'Bulevard Iuliu Maniu Nr.66', 'Bucuresti', '1024', '0728844553');
INSERT INTO locuri_competitii_academice (id_loc_acad, nume, adresa, oras, capacitate) VALUES('5', ’MIT', 'Massachusetts Avenue No.1', 'Massachusetts','2022');
INSERT INTO locuri_competitii_sportive (id_loc_sport, nume, adresa, oras, capacitate, telefon) VALUES ('1', 'Stadion National Arena', 'Str. Sergent Serbanica Vasile', 'Bucuresti', '55600', '0771500453');
INSERT INTO locuri_competitii_sportive (id_loc_sport, nume, adresa, oras, capacitate, descriere) VALUES ('2', 'Quicken Loans Arena ', 'E 6th Road', 'Cleveland', '20562', 'teams shall be at the stadium 5 hours(minimum) before the actual competition starts.');
INSERT INTO locuri_competitii_sportive (id_loc_sport, nume, adresa, oras, capacitate) VALUES ('3', 'Gillette Stadium', '1 Patriot PL', 'Foxborough', '66829');
INSERT INTO locuri_competitii_sportive (id_loc_sport, nume, adresa, oras, capacitate) VALUES ('4','Lieceul Aurel Vlaicu', 'Strada Feroviarilor Nr.35', 'Bucuresti', '30');
INSERT INTO locuri_competitii_sportive (id_loc_sport, nume, adresa, oras, capacitate, telefon) VALUES ('5', 'Patinoarul Flamaropol', 'Bulervardul Flamaropol Nr. 162', 'Bucuresti', '3100', '02125685');
INSERT INTO locuri_competitii_esport (id_loc_esport, nume, adresa, oras, capacitate, telefon) VALUES ('1', 'Nexus Gamers Pub', 'Bulevard Mihail Kogalniceanu' , 'Bucuresti', '50', '0723660912');
INSERT INTO locuri_competitii_esport (id_loc_esport, nume, adresa, oras, capacitate, descriere) VALUES ('2', 'Sala Jocuri Dome', 'Strada Zece Mese','Bucuresti', '120', 'Competitiile se vor tine in salile de la subsol.');
INSERT INTO locuri_competitii_esport (id_loc_esport, nume, adresa, oras, capacitate, telefon) VALUES ('3', 'Gamers Club', 'Soseaua Pantelimon Nr.122','Bucuresti', '42', '071156572');
INSERT INTO locuri_competitii_esport (id_loc_esport,nume,adresa,oras,capacitate) VALUES ('4', 'IDM', 'Bulervardul Basarab Nr.12', 'Bucuresti', '115');
INSERT INTO locuri_competitii_esport (id_loc_esport, nume, adresa, oras, capacitate, descriere) VALUES ('5', 'Discovery Arena-Socului', 'Bulevardul Chisinau 6-8', 'Bucuresti', '112', 'Bucataria localului nu este funtionabila momentan.');
INSERT INTO competitii(id_competitie, nume, tip, organizator, domeniu, data, email_organizator, id_loc_acad) VALUES ('1', 'Olimpiada de Matematica Judet', 'ACADEMIC', 'Marin Ilie', 'matematica', ‘01/22/2018', 'mrni@gmail.com', '1')
INSERT INTO competitii(id_competitie, nume, tip, organizator, domeniu, data, email_organizator, id_loc_acad) VALUES ('2', 'Laborantul', 'ACADEMIC', 'Marin Ilie', 'chimie', '02/15/2018', 'mrni@gmail.com', 4)
INSERT INTO competitii(id_competitie, nume, tip, organizator, domeniu, data, id_loc_sport) VALUES ('3', 'Sport Arena 3x3 International', 'SPORT', 'Jack Smith', 'baschet', '08/05/2018', 2)
INSERT INTO competitii(id_competitie,nume,tip,organizator,domeniu,data,id_loc_esport) VALUES ('4', 'Campionat CS', 'ESPORT', 'Nicu Pirvu', 'counter strike', '05/15/2018', '2')
INSERT INTO competitii(id_competitie, nume, tip, organizator, domeniu, data, id_loc_esport) VALUES (‘5', ‘Super Bowl', 'SPORT', 'NFL', ‘fotbal american', ‘10/12/2018', ‘3')
INSERT INTO competitii(id_competitie, nume, tip, organizator, domeniu, data, id_loc_esport) VALUES (‘6‘, ‘Campionat Hochei', 'SPORT', 'Federatia Romana de Hochei', ‘hochei', ‘01/10/2018', ‘5')
INSERT INTO competitii(id_competitie,nume,tip,organizator,domeniu,data,id_loc_acad) VALUES ('7', 'Olimpiada Judeteana', 'ACADEMIC', 'Ministerul Educatiei', 'logica', '04/17/2018', 1)
INSERT INTO competitii(id_competitie, nume, tip, organizator, domeniu, data, email_organizator, id_loc_acad) VALUES ('1', 'Olimpiada de Matematica Judet', 'ACADEMIC', 'Marin Ilie', 'matematica', ‘01/22/2018', 'mrni@gmail.com', '1')
INSERT INTO competitii(id_competitie, nume, tip, organizator, domeniu, data, email_organizator, id_loc_acad) VALUES ('2', 'Laborantul', 'ACADEMIC', 'Marin Ilie', 'chimie', '02/15/2018', 'mrni@gmail.com', 4)
INSERT INTO competitii(id_competitie, nume, tip, organizator, domeniu, data, id_loc_sport) VALUES ('3', 'Sport Arena 3x3 International', 'SPORT', 'Jack Smith', 'baschet', '08/05/2018', 2)
INSERT INTO competitii(id_competitie,nume,tip,organizator,domeniu,data,id_loc_esport) VALUES ('4', 'Campionat CS', 'ESPORT', 'Nicu Pirvu', 'counter strike', '05/15/2018', '2')
INSERT INTO competitii(id_competitie, nume, tip, organizator, domeniu, data, id_loc_esport) VALUES (‘5', ‘Super Bowl', 'SPORT', 'NFL', ‘fotbal american', ‘10/12/2018', ‘3')
INSERT INTO competitii(id_competitie, nume, tip, organizator, domeniu, data, id_loc_esport) VALUES (‘6‘, ‘Campionat Hochei', 'SPORT', 'Federatia Romana de Hochei', ‘hochei', ‘01/10/2018', ‘5')
INSERT INTO competitii(id_competitie,nume,tip,organizator,domeniu,data,id_loc_acad) VALUES ('7', 'Olimpiada Judeteana', 'ACADEMIC', 'Ministerul Educatiei', 'logica', '04/17/2018', 1)
INSERT INTO antrenori(id_antrenor,nume,prenume,nationalitate,data_debut,experienta,email) VALUES ('1', 'Popescu', 'Virgil', 'roman', '01/22/2006', ‘fost antrenor al echipei de hochei Laguna Bucuresti', 'virgilpop@yahoo.com')
INSERT INTO antrenori(id_antrenor, nume, prenume, nationalitate, data_debut, experienta) VALUES ('2‘, 'Toma', 'Vicentiu', 'roman', '09/15/1986', 'profesor de matematica si fizica la liceul Constantin Brancusi Constanta')
INSERT INTO antrenori(id_antrenor, nume, prenume, nationalitate, data_debut, experienta) VALUES ('3', 'Kerr', 'Steve', 'american', '09/01/2000', 'fost jucator de baschet in cadrul echipei Chicago Bulls')
INSERT INTO antrenori(id_antrenor, nume, prenume, nationalitate, data_debut, experienta, email) VALUES ('4', 'Martin', 'Julius', 'canadian', '06/17/2016', 'antrenor al echipei de fotbal american Patriots intre anii 1999-2004', 'jujumartin@gmail.com')
INSERT INTO antrenori(id_antrenor, nume, prenume, nationalitate, data_debut, experienta) VALUES ('5', 'Gherghe', 'Radu', 'roman', '05/14/2001', 'fost jucator profesionist de hochei')
INSERT INTO antrenori(id_antrenor, nume, prenume, nationalitate, data_debut, experienta) VALUES ('6', 'Lovinschi', 'Dana', 'poloneza', '02/13/1998', 'fosta profesoara de logica la colegiul tehnic din Cluj')
INSERT INTO echipe(id_echipa, nume, tara, adresa, domeniu, id_antrenor) VALUES ('6', 'Dinamo HC','Romania', 'Soseaua Stefan cel Mare Nr.2', 'hochei’, '1‘); 
INSERT INTO echipe(id_echipa, nume, tara, adresa, domeniu, id_antrenor) VALUES ('5', 'Miami Sharks', 'America', 'Saint George No.6', 'baschet', '4');
INSERT INTO echipe(id_echipa, nume, tara, adresa, domeniu, telefon, id_antrenor) VALUES ('4', 'Manchester Trail Blazers', 'Anglia','Manchester, Hills Road', 'baschet', '0341061344432', '3');
INSERT INTO echipe(id_echipa, nume, tara, adresa, domeniu, telefon, id_antrenor) VALUES ('2', 'Fizicienii lui Lazar', 'Romania', 'Liceul Gheorghe Lazar Bucuresti', 'fizica', '0771061344', '2');
INSERT INTO echipe(id_echipa, nume, tara, adresa, domeniu, telefon, id_antrenor) VALUES ('1', 'Echipa de matematica CNMV','Romania', 'CN Mihai Viteazul', 'matematica', '0771061344', '2');
INSERT INTO echipe(id_echipa, nume, tara, adresa, domeniu, telefon,  id_antrenor) VALUES (‘3', ‘Bball Tigers', 'Anglia', ‘South Hampton', 'baschet', '0341061344432', '3');
INSERT INTO echipe(id_echipa, nume, tara, adresa, domeniu, telefon, id_antrenor) VALUES ('7', 'Echipa liceului Mihail Sadoveanu', 'Romania', 'Liceul Mihail Sadoveanu', 'logica', '0771041344', '6');
INSERT INTO echipe(id_echipa, nume, tara, adresa, domeniu, telefon, id_antrenor) VALUES ('8', 'Its Logic', 'Romania', 'Scoala generala Mihai Eminescu Ploiesti', ’logica', '0723331344', '6');
INSERT INTO echipe(id_echipa, nume, tara, adresa, domeniu, telefon, id_antrenor) VALUES ('9', 'Echipa de Logica si Argumentare Pitesti', 'Romania', 'Liceul Ion Barbu Pitesti', ’logica', '0763331109', '6');
INSERT INTO echipe(id_echipa, nume, tara, adresa, domeniu, telefon, id_antrenor) VALUES ('10', 'Logic!', 'Romania', 'Liceul Ion Barbu Pitesti',‘ logica', '0723231009', '6');
INSERT INTO echipe(id_echipa, nume, tara, adresa, domeniu, telefon, id_antrenor) VALUES ('11', 'Echipa de Argumentare', 'Moldova', 'Liceul Spiru Haret Chisinau', 'logica', '0722245809', '6');
INSERT INTO fise_inscriere (id_fisa, data_inscriere, id_competitie, id_echipa) VALUES ('1','12/15/2017','1','1');
INSERT INTO fise_inscriere (id_fisa, data_inscriere, cost,id_competitie, id_echipa) VALUES ('2','01/04/2018','50','2','2');
INSERT INTO fise_inscriere (id_fisa, data_inscriere, cost,id_competitie, id_echipa) VALUES ('3','03/15/2018','120','3','3');
INSERT INTO fise_inscriere (id_fisa, data_inscriere, cost,id_competitie, id_echipa) VALUES ('4','03/30/2018','120','3','4');
INSERT INTO fise_inscriere (id_fisa, data_inscriere, cost,id_competitie, id_echipa) VALUES ('5','04/12/2018','120','3','5');
INSERT INTO fise_inscriere (id_fisa, data_inscriere, cost,id_competitie, id_echipa) VALUES ('6','04/12/2018','900','6','6');
INSERT INTO fise_inscriere (id_fisa, data_inscriere, id_competitie, id_echipa) VALUES ('7','11/20/2017','7','7');
INSERT INTO fise_inscriere (id_fisa, data_inscriere, id_competitie, id_echipa) VALUES ('8','11/20/2017','7','8');
INSERT INTO fise_inscriere (id_fisa, data_inscriere, id_competitie, id_echipa) VALUES ('9','12/06/2017','7','9');
INSERT INTO fise_inscriere (id_fisa, data_inscriere, id_competitie, id_echipa) VALUES ('10','12/03/2017','7','10');
INSERT INTO fise_inscriere (id_fisa, data_inscriere, id_competitie, id_echipa) VALUES ('11','11/29/2017','7','11');
INSERT INTO medici (id_medic, nume, prenume, nationalitate, data_debut, specializare, id_echipa) VALUES ('4', 'Stolz', 'Edmund', 'danez', '11/03/2012', ‘ortopedie', '3');
INSERT INTO medici (id_medic, nume, prenume, nationalitate, data_debut, specializare, email, id_echipa) VALUES ('3', 'Stan', 'Flavia', 'roman', '06/2/2006', 'ortopedie‘ ,'flaviutzaST@yahoo.com', '6');
INSERT INTO medici (id_medic, nume, prenume, nationalitate, data_debut, specializare, email, id_echipa) VALUES ('2', 'Petru', 'Mirela', 'roman', '03/22/2002', 'medicina primara', 'mire25@gmail.com', '6');
INSERT INTO medici (id_medic, nume, prenume, nationalitate, data_debut, specializare, email, id_echipa) VALUES ('1', 'Gherghe', ‘Ionel', 'roman', '01/01/2009', 'radiologie', 'gheionel@gmail.com', '6');
INSERT INTO medici (id_medic, nume, prenume, nationalitate, data_debut, specializare, id_echipa) VALUES ('5', 'Varmouth', 'Daniel', 'danez', '12/02/2006', 'ortopedie', '4');
INSERT INTO medici (id_medic, nume, prenume, nationalitate, data_debut, specializare, id_echipa) VALUES ('6', 'Bennet', 'Mary', 'american', '12/31/2009', 'ortopedie', '5');
INSERT INTO punctaje (id_punctaj, data, valoare, mentiuni, id_echipa) VALUES ('1', '12/11/2017', '100', 'O lucrare extraordinara.O abordare foarte buna a diagramelor Euler si Venn.', '7');
INSERT INTO punctaje (id_punctaj, data, valoare, id_echipa) VALUES ('2', '12/11/2017', '90', '8');
INSERT INTO punctaje (id_punctaj, data, valoare, id_echipa) VALUES ('3', '12/11/2017', '92', '9');
INSERT INTO punctaje (id_punctaj, data, valoare, id_echipa) VALUES ('4', '12/11/2017', '73', '10');
INSERT INTO punctaje (id_punctaj, data, valoare, id_echipa) VALUES ('5', '12/11/2017', '44', '11');
INSERT INTO premii (id_premiu, nume, material, data, tip_competitie, domeniu) VALUES ('1', '3x3 Trofee', ‘aur', '10/11/2008', 'SPORT', 'baschet');
INSERT INTO premii (id_premiu, nume, material, data, tip_competitive, domeniu) VALUES ('2', 'Cupa Romaniei Hochei', 'metal', '12/21/2012', 'SPORT', 'hochei');
INSERT INTO premii (id_premiu, nume, material, data, tip_competitie, domeniu) VALUES ('3', 'Medalie Olimpiada Nationala Fizica', 'aur', '01/02/2014', 'ACADEMIC', 'fizica');
INSERT INTO premii (id_premiu, nume, material, data, tip_competitie, domeniu) VALUES ('4', 'Medalie Olimpiada Interationala Fizica', 'aur', '06/22/2016', 'ACADEMIC', 'fizica');
INSERT INTO premii (id_premiu, nume, material, data, tip_competitie, domeniu) VALUES ('5', 'Medalie Olimpiada Interationala Matematica', 'bronz', '05/03/2015', 'ACADEMIC', 'matematica');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, email, id_echipa, id_premiu) VALUES ('1','Andrei','Cosmin','Romania','06/16/1997','2000','baschet','andreicos@gmail.com','5',‘1');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, email, id_echipa, id_premiu) VALUES ('2','Andrei','Matei','Romania','03/12/1999','2000','baschet',‘mateoandu@gmail.com','5',‘1');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, email, id_echipa, id_premiu) VALUES ('3','Mihalcea','Florian','Romania','11/29/1997','2000','baschet','MfLoRiN@gmail.com','5',‘1');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, email, id_echipa, id_premiu) VALUES ('4','Matache','Ivan','Romania','06/11/1998','2000','baschet','Ivanuuu@gmail.com','5','2');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, email, id_echipa) VALUES ('5','Hill','Grant','America','06/11/1992','3600','baschet','GrantHILL@gmail.com','4');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, email, id_echipa) VALUES ('6','McGrady','Tracy','Marea Britanie','09/22/1994','4100','baschet','Tracy@rocketmail.com','4');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, email, id_echipa) VALUES ('7','Column','Dave','Australia','11/11/1993','2600','baschet','DonDave@rocketmail.com','4');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, id_echipa) VALUES ('8','Davis','AJ','america','02/28/1991','3200','baschet','4');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, specializare,email, id_echipa,id_premiu) VALUES ('17','Dinca','Mariana','Romania','09/30/1997','fizica','Mary97@yahoo.com','2','3');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, specializare,email, id_echipa,id_premiu) VALUES ('18','Visarion','Ana','Romania','05/12/1997','fizica','viviAna@yahoo.com','2','4');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, specializare,id_echipa) VALUES ('19',‘Radu','Maria','Romania','02/13/1998','logica','7');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, specializare,id_echipa) VALUES ('20','Boghian','Bogdan','Romania','12/15/1996','logica','8');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, specializare,id_echipa) VALUES ('21','Doghin','Flavius','Ungaria','02/21/1997','logica','9');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, specializare,id_echipa) VALUES ('22','Pelteacu','Sergiu','Romania','11/17/1996','logica','10');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, specializare,id_echipa) VALUES ('23','Preda','Andrei','Romania','08/25/1997','logica','11');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, id_echipa) VALUES ('9','Beverly','Patrick',‘America','02/28/1984','8300','baschet','3');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, id_echipa) VALUES ('10','Paul','Chris','America','03/31/1986','8400','baschet','3');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, id_echipa) VALUES ('11','Carter','Vince','America','08/17/1982','7200','baschet','3');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, id_echipa) VALUES ('12','Parker','Joe','Canada','12/25/1984','9025','baschet','3');
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, id_echipa id_premiu) VALUES ('13','Schwein','Klaus','Germania','11/16/1988','3500','hochei', '6‘, ‘2’);
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, id_echipa id_premiu) VALUES ('14','Stanculescu','Marin','Romania','10/31/1989','1200','hochei','6' ‘2’);
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, salariu, specializare, id_echipa, id_premiu) VALUES ('15','Arshavin','Igor','Rusia','05/26/1991','1500','hochei','6' ‘2’);
INSERT INTO participanti (id_competitor, nume, prenume, tara, data_nasterii, specializare,email, id_echipa,id_premiu) VALUES ('16','Duna','Alin','Romania','09/26/1998','matematica','DuDuAlin@yahoo.com',‘1','5');

ALTER TABLE competitori RENAME to participanti;
       ALTER TABLE participanti MODIFY(nume VARCHAR(70));
       ALTER TABLE participanti ADD aniExperienta NUMBER(2);
ALTER TABLE participanti MODIFY(email VARCHAR(50) not null );
ALTER TABLE participanti ADD(constraint check_email check(email like ‘%@%.com’));
ALTER TABLE participant DROP COLUMN aniExperienta;
UPDATE participanti 
SET nume = 'Radu' 
WHERE id_competitor = '19‘;
UPDATE competitii
SET data = '01/24/2017'
WHERE nume = 'Concurs Matematica Arhimede‘;
UPDATE medici
SET specializare = 'acupuntura'
WHERE nume = 'Varmouth' AND prenume='Daniel';
UPDATE antrenori
SET email = 'TomaVicentiu@gmail.com'
WHERE nume = 'Toma' AND prenume='Vicentiu';
UPDATE fise_inscriere
SET cost = '842'
WHERE id_echipa = (
SELECT e.id_echipa 
FROM echipe e 
WHERE e.nume='Dinamo HC');
#test queries
SELECT specializare, TRUNC(AVG(NVL2(salariu, salariu, 0 ))) AS "SALARIU MEDIU"
FROM participanti
GROUP BY specializare
ORDER BY 2 desc
SELECT specializare, AVG(salariu)
FROM participanti
GROUP BY specializare
SELECT c.nume, c.data, l.nume, l.adresa
FROM locuri_competitii_sportive l, competitii c
       WHERE c.nume = 'Sport Arena 3x3 International' AND l.id_loc_sport=c.id_loc_sport
      SELECT p.id_premiu, p.nume, p.material, p.data
      FROM premii p
     WHERE p.data > TO_DATE('12/01/2010', 'MM/DD/YYYY') AND
     p.id_premiu in (
    SELECT pa.id_premiu
    FROM participanti pa
    WHERE pa.specializare = 'fizica')
    SELECT e.id_echipa, e.nume
FROM echipe e
WHERE e.id_echipa IN (SELECT f.id_echipa
FROM fise_inscriere f
WHERE f.id_competitie=(
SELECT c.id_competitie
FROM competitii c
WHERE c.nume= 'Sport Arena 3x3 International'))
order by e.id_echipa
SELECT e.id_echipa, e.nume, valoare, mentiuni
FROM echipa e, punctaj p
WHERE e.specializare = 'logica' AND ROWNUM=1 AND e.id_echipa = (
SELECT f.id_echipa
FROM fie_inscriere f
WHERE f.id_competitie=(SELECT c.id_competitie
FROM competitii c
WHERE nume = 'Olimpiada Judeteana' AND domeniu = 'logica') 
ORDER BY valoare
SELECT nume, prenume, tara, salariu, specializare
FROM participanti
WHERE salariu IS NOT NULL AND salariu>2000
SELECT *
FROM participanti
WHERE salariu IS NOT NULL AND salariu>2000
SELECT nume, prenume, specializare, data_debut, TRUNC(TRUNC(MONTHS_BETWEEN (TRUNC(SYSDATE) , data_debut))/12) AS "ANI LUCRATI"
FROM medici
WHERE id_echipa IN (
SELECT id_echipa
FROM echipe
WHERE domeniu = 'baschet') AND  TRUNC(TRUNC(MONTHS_BETWEEN (TRUNC(SYSDATE) , data_debut))/12)>3
ORDER BY nume || prenume
SELECT *
FROM medici
WHERE nationalitate = 'danez'
SELECT nume, prenume, specializare, data_debut, TRUNC(TRUNC(MONTHS_BETWEEN (TRUNC(SYSDATE) , data_debut))/12) AS "ANI LUCRATI"
FROM medici
WHERE id_echipa IN (
SELECT id_echipa
FROM echipe
WHERE domeniu = 'baschet') AND  TRUNC(TRUNC(MONTHS_BETWEEN (TRUNC(SYSDATE) , data_debut))/12)>3
SELECT nume, prenume, specializare, data_debut ,TO_YEAR(sysDATE-data_debut)
FROM medici
SELECT id_competitor, p.nume, prenume, specializare, pr.nume AS PREMIU
FROM participanti p, premii pr
WHERE p.id_premiu IS NOT NULL AND pr.id_premiu=p.id_premiu
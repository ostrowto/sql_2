-- @ "C:\Users\ostrowto\Desktop\database.sql"
CLEAR SCREEN;
SET linesize 250;
SET pagesize 200;
SET serveroutput ON;
alter session SET
    nls_date_format = 'YYYY-MM-DD HH24:MI';
SELECT sysdate FROM dual;
---------------------------
--- --- TABELA OSOBY2 -----
---------------------------
----- DROPY ---------------
DROP TABLE LATA_SPRAW_FUNKCJI_GLOWNEJ;
DROP TABLE NUMER_STRONY;
DROP TABLE DZIELNICA_H;
DROP TABLE DZIELNICA_AKTUALNA;
DROP TABLE OSOBY2;
DROP TABLE TOMY;	
-----------------------------------
CREATE TABLE OSOBY2(
    OSOBA2_ID                       NUMBER(9) NOT NULL,
    OS_PELNA_NAZWA                  VARCHAR2(128) NOT NULL,
	OS_IMIE							VARCHAR2(16),
	OS_NAZWISKO						VARCHAR2(16),
   	TOMY_ID							NUMBER(8)
)
PCTFREE 5
TABLESPACE STUDENT_DATA;
------------------------
	-- PRIMARY KEY
------------------------
	ALTER TABLE OSOBY2 
    ADD CONSTRAINT PK_OSOBY2 
    PRIMARY KEY (OSOBA2_ID);
------------------------
-- SEQUENCE
------------------------		
	drop sequence SEQ_OSOBY2;
	CREATE SEQUENCE SEQ_OSOBY2 
	INCREMENT BY 1 START WITH 1 MINVALUE 1;
------------------------
---------------------------------------------------------
---------------------------------------------------------
--- Triggery
---------------------------------------------------------
---------------------------------------------------------
CREATE OR REPLACE TRIGGER T_BI_OSOBY2
BEFORE INSERT ON OSOBY2
FOR EACH ROW
BEGIN
IF :NEW.OSOBA2_ID IS NULL THEN
SELECT SEQ_OSOBY2.NEXTVAL
INTO :NEW.OSOBA2_ID FROM DUAL;
END IF;
--
 DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz do OSOBY2 - OSOBA2_ID ='||:NEW.OSOBA2_ID);
--
END;
 /
----------------------------
------- CREATE TABLE TOMY --
----------------------------
CREATE TABLE TOMY(
	TOMY_ID NUMBER(8) NOT NULL,
	TOM1 	NUMBER(1) DEFAULT 0,
	TOM2 	NUMBER(1) DEFAULT 0,
	TOM3	NUMBER(1) DEFAULT 0,
	TOM4 	NUMBER(1) DEFAULT 0,
    OSOBY2_ID NUMBER(8) NOT NULL
	)
PCTFREE 5
TABLESPACE STUDENT_DATA;
------------------------
	-- PRIMARY KEY
------------------------
	ALTER TABLE TOMY 
    ADD CONSTRAINT PK_TOMY
    PRIMARY KEY (TOMY_ID);	
------------------------
-- SEQUENCE
------------------------		
	DROP sequence SEQ_TOMY;
	CREATE SEQUENCE SEQ_TOMY 
	INCREMENT BY 1 START WITH 1 MINVALUE 1;	
	ALTER TABLE TOMY
    ADD CONSTRAINT FK1_TOMY_ID
	FOREIGN KEY(OSOBY2_ID) 
	REFERENCES OSOBY2(OSOBA2_ID) ENABLE;
---------------------------------------------------------
---------------------------------------------------------
--- Triggery
---------------------------------------------------------
---------------------------------------------------------
CREATE OR REPLACE TRIGGER T_BI_TOMY
BEFORE INSERT ON TOMY
FOR EACH ROW
BEGIN
IF :NEW.TOMY_ID IS NULL THEN
SELECT SEQ_TOMY.NEXTVAL
INTO :NEW.TOMY_ID FROM DUAL;
END IF;
--
 DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz do OSOBY - OSOBA_ID ='||:NEW.TOMY_ID);
--
END;
 /
----------------------------
----------------------------
--- --- TABELA Numer strony --- ---
----------------------------
----------------------------
CREATE TABLE NUMER_STRONY(
    NUM_STR_ID                      NUMBER(5) NOT NULL,
    NUM_STR_POLACZONE_TOMY          NUMBER(5) NOT NULL,
	TOMY_ID							NUMBER(8)
)
PCTFREE 5
TABLESPACE STUDENT_DATA;
------------------------
-- SEQUENCE
------------------------		
	DROP SEQUENCE SEQ_NUMER_STRONY;
	CREATE SEQUENCE SEQ_NUMER_STRONY 
	INCREMENT BY 1 START WITH 1 MINVALUE 1;
------------------------
	-- PRIMARY KEY
------------------------
ALTER TABLE NUMER_STRONY 
    ADD CONSTRAINT PK_NUMER_STRONY 
    PRIMARY KEY (NUM_STR_ID);
------------------------
	--  FOREIGN Keys w TABELI NUMER STRONY
------------------------
ALTER TABLE NUMER_STRONY
		ADD CONSTRAINT FK1_NUMER_STRONY
		FOREIGN KEY(TOMY_ID) 
		REFERENCES TOMY(TOMY_ID) ENABLE;
---------------------------------------------------------
---------------------------------------------------------
--- Triggery
---------------------------------------------------------
CREATE OR REPLACE TRIGGER T_BI_NUMER_STRONY
BEFORE INSERT ON NUMER_STRONY
FOR EACH ROW
BEGIN
IF :NEW.NUM_STR_ID IS NULL THEN
SELECT SEQ_NUMER_STRONY.NEXTVAL
INTO :NEW.NUM_STR_ID FROM DUAL;
END IF;
--
 DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz do NUMER_STRONY - NUM_STR_ID ='||:NEW.NUM_STR_ID);
--
END;
 /
----------------------------
----------------------------
--- --- TABELA Lata sprawowania funkcji glownej --- ---
----------------------------
----------------------------
CREATE TABLE LATA_SPRAW_FUNKCJI_GLOWNEJ(
    LAT_ROK_ID                      NUMBER(5) NOT NULL,
    LAT_ROK_START                   NUMBER(5),
    LAT_ROK_KONIEC                  NUMBER(5),
    OSOBA2_ID	                    NUMBER(8)
)
PCTFREE 5
TABLESPACE STUDENT_DATA;
------------------------
-- SEQUENCE
------------------------		
	drop sequence SEQ_LATA_S;
	CREATE SEQUENCE SEQ_LATA_S
	INCREMENT BY 1 START WITH 1 MINVALUE 1;
------------------------
------------------------
	-- PRIMARY KEY
------------------------
ALTER TABLE LATA_SPRAW_FUNKCJI_GLOWNEJ 
    ADD CONSTRAINT PK_LATA_SPRAW_FUNKCJI_GLOWNEJ 
    PRIMARY KEY (LAT_ROK_ID);
------------------------
	--  FOREIGN Keys w TABELI LATA_SPRAW_FUNKCJI_GLOWNEJ
------------------------
ALTER TABLE LATA_SPRAW_FUNKCJI_GLOWNEJ
		ADD CONSTRAINT FK1_LATA_SPRAW_FUNKCJI_GLOWNEJ
		FOREIGN KEY(OSOBA2_ID) 
		REFERENCES OSOBY2(OSOBA2_ID) ENABLE;
---------------------------------------------------------
---------------------------------------------------------
--- Triggery
---------------------------------------------------------
CREATE OR REPLACE TRIGGER T_BI_LATA_GLOWNEJ
BEFORE INSERT ON LATA_SPRAW_FUNKCJI_GLOWNEJ
FOR EACH ROW
BEGIN
IF :NEW.LAT_ROK_ID IS NULL THEN
SELECT SEQ_LATA_S.NEXTVAL
INTO :NEW.LAT_ROK_ID FROM DUAL;
END IF;
--
 DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz do LATA_SPRAW_FUNKCJI_GLOWNEJ - LAT_ROK_ID ='||:NEW.LAT_ROK_ID);
--
END;
 /
----------------------------
----------------------------
--- --- TABELA Dzielnica historyczna --- ---
----------------------------
----------------------------
CREATE TABLE DZIELNICA_H(
    DZ_H_ID	                                                NUMBER(2) NOT NULL,
    DZ_H_KLEPARZ_PRZY_KR      	                            NUMBER(1),
    DZ_H_KAZIMIERZ_ZY    								 	NUMBER(1),
    DZ_H_BISKUPICE 	                                        NUMBER(1),
    DZ_H_BLONIE_ZA_KLE      	                            NUMBER(1),
    DZ_H_GARBARY 	                                        NUMBER(1),
    DZ_H_GRAMATYKA	                                        NUMBER(1),
    DZ_H_GROBLE	                                            NUMBER(1),
    DZ_H_LUBICZ_MORSZ       	                            NUMBER(1),
    DZ_H_PEDZICHOW 	                                        NUMBER(1),
    DZ_H_PODZAMCZE 	                                        NUMBER(1),
    DZ_H_RETORYKA_OSS 	                                    NUMBER(1),
    DZ_H_SMOLENSKILOS       	          		 		    NUMBER(1),
    DZ_H_SMOLENSK_WIELK           	                        NUMBER(1),
    DZ_H_SZLAK_SW_FL     	                                NUMBER(1),
    DZ_H_WESOLA_RADZ            	                        NUMBER(1),
    DZ_H_WYGODA_MA            	                            NUMBER(1),
    DZ_H_CZARNA_WIES 	                                    NUMBER(1),
    DZ_H_DABIE 	                                            NUMBER(1),
    DZ_H_DEBNIKI 	                                        NUMBER(1),
    DZ_H_GRZEGORZKI 	                                    NUMBER(1),
    DZ_H_KROWODRZA 	                                        NUMBER(1),
    DZ_H_LUDWINOW 	                                        NUMBER(1),
    DZ_H_LOBZOW 	                                        NUMBER(1),
    DZ_H_NOWA_WIES_NAR      	                            NUMBER(1),
    DZ_H_PLASZOW                                            NUMBER(1),
    DZ_H_POLWSIE_ZW              	                        NUMBER(1),
    DZ_H_ZAKRZOWEK 	                                        NUMBER(1),
    DZ_H_ZWIERZYNIEC 	                                    NUMBER(1),
    DZ_H_BIELANY 	                                        NUMBER(1),
    DZ_H_BIENCZYCE 	                                        NUMBER(1),
    DZ_H_BIEZANOW 	                                        NUMBER(1),
    DZ_H_BODZOW 	                                        NUMBER(1),
    DZ_H_BOREK_FAL   	                                    NUMBER(1),
    DZ_H_BRANICE 	                                        NUMBER(1),
    DZ_H_BRONOWICE_MA   	                                NUMBER(1),
    DZ_H_BRONOWICE_WI     	                                NUMBER(1),
    DZ_H_CHELM 	                                            NUMBER(1),
    DZ_H_CZYZYNY 	                                        NUMBER(1),
    DZ_H_GORKA_NAR      	                                NUMBER(1),
    DZ_H_GREBALOW 	                                        NUMBER(1),
    DZ_H_JUGOWICE 	                                        NUMBER(1),
    DZ_H_KANTOROWICE 	                                    NUMBER(1),
    DZ_H_KOBIERZYN 	                                        NUMBER(1),
    DZ_H_KOSOCICE 	                                        NUMBER(1),
    DZ_H_KOSTRZE 	                                        NUMBER(1),
    DZ_H_KOSCIELNIKI 	                                    NUMBER(1),
    DZ_H_KRZESLAWICE 	                                    NUMBER(1),
    DZ_H_KURDWANOW 	                                        NUMBER(1),
    DZ_H_LUBOCZA 	                                        NUMBER(1),
    DZ_H_LAGIEWNIKI 	                                    NUMBER(1),
    DZ_H_LEG 	                                            NUMBER(1),
    DZ_H_LUCZANOWICE 	                                    NUMBER(1),
    DZ_H_MISTRZEJ    	                                    NUMBER(1),
    DZ_H_MOGILA 	                                        NUMBER(1),
    DZ_H_MYDLNIKI 	                                        NUMBER(1),
    DZ_H_OLSZA 	                                            NUMBER(1),
    DZ_H_OLSZANICA 	                                        NUMBER(1),
    DZ_H_OPATKOWICE 	                                    NUMBER(1),
    DZ_H_PIASKI_WIE     	                                NUMBER(1),
    DZ_H_PLESZOW 	                                        NUMBER(1),
    DZ_H_PRADNIK_BIALY 	                                    NUMBER(1),
    DZ_H_PRADNIK_CZE      	                                NUMBER(1),
    DZ_H_PROKOCIM 	                                        NUMBER(1),
    DZ_H_PRZEGORZALY 	                                    NUMBER(1),
    DZ_H_PRZEWOZ 	                                        NUMBER(1),
    DZ_H_PRZYLASEK_RUS      	                            NUMBER(1),
    DZ_H_PYCHOWICE 	                                        NUMBER(1),
    DZ_H_RAJSKO 	                                        NUMBER(1),
    DZ_H_RAKOWICE 	                                        NUMBER(1),
    DZ_H_RUSZCZA 	                                        NUMBER(1),
    DZ_H_RYBITWY 	                                        NUMBER(1),
    DZ_H_RZAKA 	                                            NUMBER(1),
    DZ_H_SIDZINA 	                                        NUMBER(1),
    DZ_H_SKOTNIKI 	                                        NUMBER(1),
    DZ_H_SOBONIOWICE 	                                    NUMBER(1),
    DZ_H_SWOSZOWICE 	                                    NUMBER(1),
    DZ_H_TONIE 	                                            NUMBER(1),
    DZ_H_TYNIEC 	                                        NUMBER(1),
    DZ_H_WADOW 	                                            NUMBER(1),
    DZ_H_WEGRZYNOWICE 	                                    NUMBER(1),
    DZ_H_WITKOWICE 	                                        NUMBER(1),
    DZ_H_WOLA_DUCHACKA 	                                    NUMBER(1),
    DZ_H_WOLA_JUSTOWSKA 	                                NUMBER(1),
    DZ_H_WOLICA 	                                        NUMBER(1),
    DZ_H_WROBLOWICE 	                                    NUMBER(1),
    DZ_H_WROZENICE 	                                        NUMBER(1),
    DZ_H_WYCIAZE_WYC                                        NUMBER(1),
    DZ_H_ZBYDNIOWICE 	                                    NUMBER(1),
    DZ_H_ZESLAWICE 	                                        NUMBER(1),
	OSOBA2_ID												NUMBER(8)	
)
PCTFREE 5
TABLESPACE STUDENT_DATA;
------------------------
-- SEQUENCE
------------------------		
	drop sequence SEQ_DZIELNICA_H;
	CREATE SEQUENCE SEQ_DZIELNICA_H
	INCREMENT BY 1 START WITH 1 MINVALUE 1;
------------------------
	-- PRIMARY KEY
------------------------
ALTER TABLE DZIELNICA_H 
    ADD CONSTRAINT PK_DZIELNICA_H 
    PRIMARY KEY (DZ_H_ID);
------------------------
	--  FOREIGN Keys w TABELI LATA_SPRAW_FUNKCJI_GLOWNEJ
------------------------
ALTER TABLE DZIELNICA_H
		ADD CONSTRAINT FK1_DZIELNICA_H
		FOREIGN KEY(OSOBA2_ID) 
		REFERENCES OSOBY2(OSOBA2_ID) ENABLE;
---------------------------------------------------------
---------------------------------------------------------
--- Triggery
---------------------------------------------------------
---------------------------------------------------------
CREATE OR REPLACE TRIGGER T_BI_DZIELNICA_H
BEFORE INSERT ON DZIELNICA_H
FOR EACH ROW
BEGIN
IF :NEW.DZ_H_ID IS NULL THEN
SELECT SEQ_DZIELNICA_H.NEXTVAL
INTO :NEW.DZ_H_ID FROM DUAL;
END IF;
--
 DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz do DZIELNICA_H - DZ_H_ID ='||:NEW.DZ_H_ID);
--
END;
 /
----------------------------
----------------------------
--- --- TABELA Dzielnica aktualna --- ---
----------------------------
----------------------------
CREATE TABLE DZIELNICA_AKTUALNA(
    DZ_A_ID                         NUMBER(2) NOT NULL,
    DZ_A_I_STARE_MIASTO             NUMBER(1),
    DZ_A_II_GRZEGORZKI              NUMBER(1),
    DZ_A_III_PRADNIK_CZE            NUMBER(1),
    DZ_A_IV_PRADNIK_BIALY           NUMBER(1),
    DZ_A_V_KROWODRZA                NUMBER(1),
    DZ_A_VI_BRONOWICE               NUMBER(1),
    DZ_A_VII_ZWIERZYNIEC            NUMBER(1),
    DZ_A_VIII_DEBNIKI               NUMBER(1),
    DZ_A_LAG_BOR_FAL                NUMBER(1),
    DZ_A_X_SWOSZOWICE               NUMBER(1),
    DZ_A_XI_PODGORZE_DUCH           NUMBER(1),
    DZ_A_XII_BIEZANOW_PRO           NUMBER(1),
    DZ_A_XIII_PODGORZE              NUMBER(1),
    DZ_A_XIV_CZYZYNY                NUMBER(1),
    DZ_A_XV_MISTRZEJOWICE           NUMBER(1),
    DZ_A_XVI_BIENCZYCE              NUMBER(1),
    DZ_A_XVII_KRZESLA       		NUMBER(1),
    DZ_A_XVIII_NOWA_HUTA            NUMBER(1)
)
PCTFREE 5
TABLESPACE STUDENT_DATA;
------------------------
-- SEQUENCE
------------------------		
	DROP SEQUENCE SEQ_DZIELNICA_AKTUALNA;
	CREATE SEQUENCE SEQ_DZIELNICA_AKTUALNA
	INCREMENT BY 1 START WITH 1 MINVALUE 1;
------------------------
	-- PRIMARY KEY
------------------------
ALTER TABLE DZIELNICA_AKTUALNA 
    ADD CONSTRAINT PK_DZIELNICA_AKTUALNA 
    PRIMARY KEY (DZ_A_ID);
---------------------------------------------------------
---------------------------------------------------------
--- Triggery
---------------------------------------------------------
CREATE OR REPLACE TRIGGER T_BI_DZIELNICA_AKTUALNA
BEFORE INSERT ON DZIELNICA_AKTUALNA
FOR EACH ROW
BEGIN
IF :NEW.DZ_A_ID IS NULL THEN
SELECT SEQ_DZIELNICA_AKTUALNA.NEXTVAL
INTO :NEW.DZ_A_ID FROM DUAL;
END IF;
--
 DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz do DZIELNICA_AKTUALNA - DZ_A_ID ='||:NEW.DZ_A_ID);
--
END;
 /
CREATE OR REPLACE PROCEDURE OSOBA(
inOSO_PELNA IN OSOBY2.OS_PELNA_NAZWA%TYPE,
inOSO_IMIE IN OSOBY2.OS_IMIE%TYPE,
inOSO_NAZWISKO IN OSOBY2.OS_NAZWISKO%TYPE,
inTOMY_TOM1 IN TOMY.TOM1%TYPE,
inTOMY_TOM2 IN TOMY.TOM2%TYPE,
inTOMY_TOM3 IN TOMY.TOM3%TYPE,
inTOMY_TOM4 IN TOMY.TOM4%TYPE
)
IS
	OSO_ID_curr	OSOBY2.OSOBA2_ID%TYPE;
	TOMY_ID_curr TOMY.TOMY_ID%TYPE;
BEGIN
	INSERT INTO OSOBY2(OS_PELNA_NAZWA,OS_IMIE,OS_NAZWISKO)
	VALUES (inOSO_PELNA,inOSO_IMIE,inOSO_NAZWISKO);
	--
	SELECT SEQ_OSOBY2.CURRVAL INTO OSO_ID_curr FROM DUAL;
	--
	INSERT INTO TOMY (TOM1,TOM2,TOM3,TOM4)
	VALUES (inTOMY_TOM1,inTOMY_TOM2,inTOMY_TOM3,inTOMY_TOM4);
	--
		SELECT SEQ_TOMY.CURRVAL INTO TOMY_ID_curr FROM DUAL;
	--
	DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz OSOBA - ID='||OSO_ID_curr);
	--
	DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz TOMY - ID='||TOMY_ID_curr);
END;
/


/*
CREATE OR REPLACE PROCEDURE GEN_OSOBA(ile in number)
	IS
	TYPE OS_IMIE IS VARRAY(255) OF VARCHAR2(10);
	TYPE OS_NAZWISKO IS VARRAY(66) OF VARCHAR2(10);
	lista_imie OS_IMIE:=OS_IMIE('Adalbert', 'Adam', 'Adela', 'Adelajda', 'Adrian', 'Aga', 'Agata', 'Agnieszka', 'Albert', 'Alberta', 'Aldona', 'Aleksander', 'Aleksandra', 'Alfred', 'Alicja', 'Alina', 'Amadeusz', 'Ambroży', 'Amelia', 'Anastazja', 'Anastazy', 'Anatol', 'Andrzej', 'Aneta', 'Angelika', 'Angelina', 'Aniela', 'Anita', 'Anna', 'Antoni', 'Antonina', 'Anzelm', 'Apolinary', 'Apollo', 'Apolonia', 'Apoloniusz', 'Ariadna', 'Arkadiusz', 'Arkady', 'Arlena', 'Arleta', 'Arletta', 'Arnold', 'Arnolf', 'August', 'Augustyna', 'Aurela', 'Aurelia', 'Aurelian', 'Aureliusz', 'Balbina', 'Baltazar', 'Barbara', 'Bartłomiej', 'Bartosz', 'Bazyli', 'Beata', 'Benedykt', 'Benedykta', 'Beniamin', 'Bernadeta', 'Bernard', 'Bernardeta', 'Bernardyn', 'Bernardyna', 'Błażej', 'Bogdan', 'Bogdana', 'Bogna', 'Bogumił', 'Bogumiła', 'Bogusław', 'Bogusława', 'Bohdan', 'Bolesław', 'Bonawentura', 'Bożena', 'Bronisław', 'Bronisława', 'Broniszław', 'Brunon', 'Brygida', 'Cecyl', 'Cecylia', 'Celestyn', 'Celestyna', 'Celina', 'Cezary', 'Cyprian', 'Cyryl', 'Dalia', 'Damian', 'Daniel', 'Daniela', 'Danuta', 'Daria', 'Dariusz', 'Dawid', 'Diana', 'Dianna', 'Dobrawa', 'Dominik', 'Dominika', 'Donata', 'Dorian', 'Dorota', 'Dymitr', 'Edmund', 'Edward', 'Edwin', 'Edyta', 'Egon', 'Eleonora', 'Eliasz', 'Eligiusz', 'Eliza', 'Elwira', 'Elżbieta', 'Emanuel', 'Emanuela', 'Emil', 'Emilia', 'Emilian', 'Emiliana', 'Ernest', 'Ernestyna', 'Erwin', 'Erwina', 'Eryk', 'Eryka', 'Eugenia', 'Eugeniusz', 'Eulalia', 'Eustachy', 'Ewelina', 'Fabian', 'Faustyn', 'Faustyna', 'Felicja', 'Felicjan', 'Felicyta', 'Feliks', 'Ferdynand', 'Filip', 'Franciszek', 'Franciszka', 'Fryderyk', 'Fryderyka', 'Gabriel', 'Gabriela', 'Gaweł', 'Genowefa', 'Gerard', 'Gerarda', 'Gerhard', 'Gertruda', 'Gerwazy', 'Godfryd', 'Gracja', 'Gracjan', 'Grażyna', 'Greta', 'Grzegorz', 'Gustaw', 'Gustawa', 'Gwidon', 'Halina', 'Hanna', 'Helena', 'Henryk', 'Henryka', 'Herbert', 'Hieronim', 'Hilary', 'Hipolit', 'Honorata', 'Hubert', 'Ida', 'Idalia', 'Idzi', 'Iga', 'Ignacy', 'Igor', 'Ildefons', 'Ilona', 'Inga');
	lista_nazwisko OS_NAZWISKO:=OS_NAZWISKO('Wielopolski', 'Lichocki', 'Drdatzki', 'Gollmayer', 'Zarzecki', 'Wodzicki', 'Matecki', 'Grodzicki', 'Michałowski', 'Sołtykowicz', 'Bystrzonowski', 'Sobolewski', 'Kucieński', 'Wasserab', 'Bartl', 'Czajkowski', 'Soczyński', 'Walczyński', 'Szopowicz', 'Girtler', 'Wielogłowski', 'Haller', 'Schindler', 'Kopff', 'Księżarski', 'Krzyżanowski', 'Paprocki', 'Tobiaszek', 'Seidler', 'Dietl', 'Zyblikiewicz', 'Weigel', 'Szlachtowski', 'Friedlein', 'Leo', 'Nowak', 'Federowicz', 'Sare', 'Wawrausch', 'Ostrowski', 'Rolle', 'Belina-Prażmowski', 'Kaplicki', 'Czuchajowski', 'Klimecki', 'Bogdanowski', 'Żaruk-Michalski', 'Fiderkiewicz', 'Wolas', 'Dobrowolski', 'Waligóra', 'Mrugacz', 'Boniecki', 'Skolicki', 'Pękala', 'Barszcz', 'Gajewicz', 'Salwa', 'Rościszewski', 'Piekarz', 'Woźniakowski', 'Bachmiński', 'Lassota', 'Gołaś', 'Nowak', 'Kowalski', 'Wiśniewski', 'Dąbrowski', 'Lewandowski', 'Wójcik', 'Kamiński', 'Kowalczyk', 'Szymański', 'Woźniak', 'Kozłowski', 'Jankowski', 'Wojciechowski', 'Kwiatkowski', 'Kaczmarek', 'Mazur', 'Krawczyk', 'Piotrowski', 'Grabowski', 'Nowakowski', 'Pawłowski', 'Michalski', 'Nowicki', 'Adamczyk', 'Dudek', 'Zając', 'Wieczorek', 'Jabłoński', 'Król', 'Majewski', 'Olszewski', 'Jaworski', 'Wróbel', 'Malinowski', 'Pawlak', 'Witkowski', 'Walczak', 'Stępień', 'Górski', 'Rutkowski', 'Michalak', 'Sikora', 'Ostrowski', 'Baran', 'Duda', 'Szewczyk', 'Tomaszewski', 'Pietrzak', 'Marciniak', 'Wróblewski', 'Zalewski', 'Jakubowski', 'Jasiński', 'Zawadzki', 'Sadowski', 'Bąk', 'Chmielewski', 'Włodarczyk', 'Borkowski', 'Czarnecki', 'Sawicki', 'Sokołowski', 'Urbański', 'Kubiak', 'Maciejewski', 'Szczepański', 'Kucharski', 'Wilk', 'Kalinowski', 'Lis', 'Mazurek', 'Wysocki', 'Adamski', 'Kaźmierczak', 'Wasilewski', 'Sobczak', 'Czerwiński', 'Andrzejewski', 'Cieślak', 'Głowacki', 'Zakrzewski', 'Kołodziej', 'Sikorski', 'Krajewski', 'Gajewski', 'Szymczak', 'Szulc', 'Baranowski', 'Laskowski', 'Brzeziński', 'Makowski', 'Ziółkowski', 'Przybylski','Majchrowski','Woźniakowski');
	vNAZWA OSOBY2.OS_IMIE%TYPE;
	vGEN_WAL OSOBY2.OS_NAZWISKO%TYPE;
	PRAGMA AUTONOMOUS_TRANSACTION; 
	begin
	DBMS_RANDOM.INITIALIZE (123456789);
	SELECT COUNT(*) INTO vOSOBY2 FROM GEN_OSOBA2;
	for i in 1 .. ile
	loop
		vNAZWA:=lista_imie(FLOOR(DBMS_RANDOM.VALUE(1,lista_imie.COUNT+0.99)));
		vGEN_WAL:=lista_nazwisko(FLOOR(DBMS_RANDOM.VALUE(1,lista_nazwisko.COUNT+0.99)));
			 --DBMS_OUTPUT.put_line(i);
		INSERT INTO OSOBY2(OS_IMIE,OS_NAZWISKO) VALUES(vNAZWA,vGEN_WAL);
	end loop
	commit;
	EXCEPTION
		WHEN OTHERS THEN
			dbms_output.put_line('pGEN_OSOBA2: '||SQLERRM);		
		rollback; 	
	end;
	/
*/
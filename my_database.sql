-- my_database.sql
-- @ "D:\sql\my_database.sql"

CLEAR SCREEN;

SET linesize 250;
SET pagesize 200;

SET serveroutput ON;

alter session SET
    nls_date_format = 'YYYY-MM-DD HH24:MI';

SELECT sysdate FROM dual;

----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------





----------------------------
----------------------------

--- --- TABELA Osoby --- ---

----------------------------
----------------------------

CREATE TABLE OSOBY(
    OSOBA_ID                        NUMBER(9) NOT NULL,
    OS_PELNA_NAZWA                  VARCHAR2(64) NOT NULL,
    OS_IMIE_1                       VARCHAR2(16),
    OS_IMIE_2                       VARCHAR2(16),
    OS_IMIE_3                       VARCHAR2(16),
    OS_NAZWISKO                     VARCHAR2(32),
    OS_PRZYDOMEK_SAMOISTNY          VARCHAR2(16),
    OS_IMIE_JAKO_PRZYDOMEK          VARCHAR2(16),
    OS_IMIE_JAKO_NAZWISKO           VARCHAR2(16),
    OS_PRZYDOMEK_2                  VARCHAR2(16),
    OS_ZNAK_ZAPYTANIA               VARCHAR2(1),
    OS_ZNAK_INNY                    VARCHAR2(4),
    OS_CZLON_NAZYWANIA_3            VARCHAR2(32),
    OS_CZLON_NAZYWANIA_4            VARCHAR2(32),
    OS_CZLON_NAZYWANIA_5            VARCHAR2(32),
    OS_NAZYWANIE_WIELOCZLONOWE      VARCHAR2(48),
    OS_NAZWA_FUNKCJI_GLOWNEJ        VARCHAR2(16),
    OS_NAZWA_FUNKCJI_DODATKOWEJ_1   VARCHAR2(16),
    OS_NAZWA_FUNKCJI_DODATKOWEJ_2   VARCHAR2(16)
)
PCTFREE 5
TABLESPACE STUDENT_DATA;

------------------------
	-- PRIMARY KEY
------------------------

ALTER TABLE OSOBY 
    ADD CONSTRAINT PK_OSOBY 
    PRIMARY KEY (OSOBA_ID);

-- ----------------------#
	--  UNIQUE Keys
--	---------------------#
ALTER TABLE OSOBY
    ADD CONSTRAINT UQ_OSOBY
    UNIQUE (OSOBA_ID);

------------------------
	--  FOREIGN Keys w TABELI OSOBY
    --  TABELA OSOBY REFERUJE DO TOM_1, TOM_2, TOM_3, TOM_4, LATA_SPRAW_FUNKCJI_GLOWNEJ,
    --  DZIELNICA_HISTORYCZNA, DZIELNICA_AKTUALNA
------------------------

ALTER TABLE OSOBY
		ADD CONSTRAINT FK1_OSOBY
		FOREIGN KEY(TOM_1_ID_W_OSO) 
		REFERENCES TOM_1(TOM_1_ID) ENABLE;

ALTER TABLE OSOBY
		ADD CONSTRAINT FK2_OSOBY
		FOREIGN KEY(TOM_2_ID_W_OSO) 
		REFERENCES TOM_2(TOM_2_ID) ENABLE;

ALTER TABLE OSOBY
		ADD CONSTRAINT FK3_OSOBY
		FOREIGN KEY(TOM_3_ID_W_OSO) 
		REFERENCES TOM_3(TOM_3_ID) ENABLE;

ALTER TABLE OSOBY
		ADD CONSTRAINT FK4_OSOBY
		FOREIGN KEY(TOM_4_ID_W_OSO) 
		REFERENCES TOM_4(TOM_4_ID) ENABLE;


ALTER TABLE OSOBY
		ADD CONSTRAINT FK5_OSOBY
		FOREIGN KEY(LAT_ROK_ID_W_OSO) 
		REFERENCES LATA_SPRAW_FUNKCJI_GLOWNEJ(LAT_ROK_ID) ENABLE;


ALTER TABLE OSOBY
		ADD CONSTRAINT FK6_OSOBY
		FOREIGN KEY(DZ_H_ID_W_OSO) 
		REFERENCES DZIELNICA_HISTORYCZNA(DZ_H_ID) ENABLE;


ALTER TABLE OSOBY
		ADD CONSTRAINT FK7_OSOBY
		FOREIGN KEY(DZ_A_ID_W_OSO) 
		REFERENCES DZIELNICA_AKTUALNA(DZ_A_ID) ENABLE;










----------------------------
----------------------------

--- --- TABELA LACZACA Tom 1 --- ---

----------------------------
----------------------------
CREATE TABLE TOM_1(
    TOM_1_ID    NUMBER(1) NOT NULL
)
PCTFREE 5
TABLESPACE STUDENT_DATA;


------------------------
	-- PRIMARY KEY
------------------------

ALTER TABLE TOM_1 
    ADD CONSTRAINT PK_TOM_1 
    PRIMARY KEY (TOM_1_ID);
-- ----------------------#
	--  UNIQUE Keys;
--	---------------------#

ALTER TABLE TOM_1
    ADD CONSTRAINT UQ_TOM_1
    UNIQUE (TOM_1_ID);

------------------------
	--  FOREIGN Keys w TABELI LACZACEJ TOM 1
    -- TABELA TOM_1 REFERUJE DO OSOBY, NUMER_STRONY
------------------------

ALTER TABLE TOM_1
		ADD CONSTRAINT FK1_TOM_1
		FOREIGN KEY(OSOBA_ID_W_TOM_1) 
		REFERENCES OSOBY(OSOBA_ID) ENABLE;

ALTER TABLE TOM_1
		ADD CONSTRAINT FK2_TOM_1
		FOREIGN KEY(NUM_STR_ID_W_TOM_1) 
		REFERENCES NUMER_STRONY(NUM_STR_ID) ENABLE;

----------------------------
----------------------------

--- --- TABELA LACZACA Tom 2 --- ---
    -- TABELA TOM_1 REFERUJE DO OSOBY, NUMER_STRONY
----------------------------
----------------------------

CREATE TABLE TOM_2(
    TOM_2_ID    NUMBER(1) NOT NULL
)
PCTFREE 5
TABLESPACE STUDENT_DATA;


------------------------
	-- PRIMARY KEY
------------------------

ALTER TABLE TOM_2 
    ADD CONSTRAINT PK_TOM_2 
    PRIMARY KEY (TOM_2_ID);
-- ----------------------#
	--  UNIQUE Keys;
--	---------------------#

ALTER TABLE TOM_2
    ADD CONSTRAINT UQ_TOM_2
    UNIQUE (TOM_2_ID);



------------------------
	--  FOREIGN Keys w TABELI LACZACEJ TOM 2
------------------------

ALTER TABLE TOM_2
		ADD CONSTRAINT FK1_TOM_2
		FOREIGN KEY(OSOBA_ID_W_TOM_2) 
		REFERENCES OSOBY(OSOBA_ID) ENABLE;

ALTER TABLE TOM_2
		ADD CONSTRAINT FK2_TOM_2
		FOREIGN KEY(NUM_STR_ID_W_TOM_2) 
		REFERENCES NUMER_STRONY(NUM_STR_ID) ENABLE;

----------------------------
----------------------------

--- --- TABELA LACZACA Tom 3 --- ---
    -- TABELA TOM_3 REFERUJE DO OSOBY, NUMER_STRONY

----------------------------
----------------------------

CREATE TABLE TOM_3(
    TOM_3_ID    NUMBER(1) NOT NULL
)
PCTFREE 5
TABLESPACE STUDENT_DATA;


------------------------
	-- PRIMARY KEY
------------------------

ALTER TABLE TOM_3 
    ADD CONSTRAINT PK_TOM_3 
    PRIMARY KEY (TOM_3_ID);

-- ----------------------#
	--  UNIQUE Keys;
--	---------------------#

ALTER TABLE TOM_3
    ADD CONSTRAINT UQ_TOM_3
    UNIQUE (TOM_3_ID);


------------------------
	--  FOREIGN Keys w TABELI LACZACEJ TOM 3
------------------------

ALTER TABLE TOM_3
		ADD CONSTRAINT FK1_TOM_3
		FOREIGN KEY(OSOBA_ID_W_TOM_3) 
		REFERENCES OSOBY(OSOBA_ID) ENABLE;

ALTER TABLE TOM_3
		ADD CONSTRAINT FK2_TOM_3
		FOREIGN KEY(NUM_STR_ID_W_TOM_3) 
		REFERENCES NUMER_STRONY(NUM_STR_ID) ENABLE;


----------------------------
----------------------------

--- --- TABELA LACZACA Tom 4 --- ---
     -- TABELA TOM_4 REFERUJE DO OSOBY, NUMER_STRONY

----------------------------
----------------------------

CREATE TABLE TOM_4(
    TOM_4_ID    NUMBER(1) NOT NULL
)
PCTFREE 5
TABLESPACE STUDENT_DATA;


------------------------
	-- PRIMARY KEY
------------------------

ALTER TABLE TOM_4 
    ADD CONSTRAINT PK_TOM_4 
    PRIMARY KEY (TOM_4_ID);
-- ----------------------#
	--  UNIQUE Keys;
--	---------------------#

ALTER TABLE TOM_4
    ADD CONSTRAINT UQ_TOM_4
    UNIQUE (TOM_4_ID);

------------------------
	--  FOREIGN Keys w TABELI LACZACEJ TOM 4
------------------------

ALTER TABLE TOM_4
		ADD CONSTRAINT FK1_TOM_4
		FOREIGN KEY(OSOBA_ID_W_TOM_4) 
		REFERENCES OSOBY(OSOBA_ID) ENABLE;

ALTER TABLE TOM_4
		ADD CONSTRAINT FK2_TOM_4
		FOREIGN KEY(NUM_STR_ID_W_TOM_4) 
		REFERENCES NUMER_STRONY(NUM_STR_ID) ENABLE;



----------------------------
----------------------------

--- --- TABELA Numer strony --- ---

----------------------------
----------------------------

CREATE TABLE NUMER_STRONY(
    NUM_STR_ID                      NUMBER(5) NOT NULL,
    NUM_STR_POLACZONE_TOMY          NUMBER(5) NOT NULL
)
PCTFREE 5
TABLESPACE STUDENT_DATA;


------------------------
	-- PRIMARY KEY
------------------------

ALTER TABLE NUMER_STRONY 
    ADD CONSTRAINT PK_NUMER_STRONY 
    PRIMARY KEY (NUM_STR_ID);

-- ----------------------#
	--  UNIQUE Keys;
--	---------------------#

ALTER TABLE NUMER_STRONY
    ADD CONSTRAINT UQ_NUMER_STRONY
    UNIQUE (NUM_STR_ID);

------------------------
	--  FOREIGN Keys w TABELI NUMER STRONY
    --  TABELA NUMER STRONY REFERUJE DO TOM_1, TOM_2, TOM_3, TOM_4
------------------------

ALTER TABLE NUMER_STRONY
		ADD CONSTRAINT FK1_NUMER_STRONY
		FOREIGN KEY(TOM_1_ID_W_NUMER_STRONY) 
		REFERENCES TOM_1(TOM_1_ID) ENABLE;

ALTER TABLE NUMER_STRONY
		ADD CONSTRAINT FK2_NUMER_STRONY
		FOREIGN KEY(TOM_2_ID_W_NUMER_STRONY) 
		REFERENCES TOM_2(TOM_2_ID) ENABLE;

ALTER TABLE NUMER_STRONY
		ADD CONSTRAINT FK3_NUMER_STRONY
		FOREIGN KEY(TOM_3_ID_W_NUMER_STRONY) 
		REFERENCES TOM_3(TOM_3_ID) ENABLE;

ALTER TABLE NUMER_STRONY
		ADD CONSTRAINT FK4_NUMER_STRONY
		FOREIGN KEY(TOM_4_ID_W_NUMER_STRONY) 
		REFERENCES TOM_4(TOM_4_ID) ENABLE;


----------------------------
----------------------------

--- --- TABELA Lata sprawowania funkcji glownej --- ---

----------------------------
----------------------------

CREATE TABLE LATA_SPRAW_FUNKCJI_GLOWNEJ(
    LAT_ROK_ID                      NUMBER(5) NOT NULL,
    LAT_ROK_START                   NUMBER(5),
    LAT_ROK_KONIEC                  NUMBER(5),
    LAT_1228	 NUMBER(1),
    LAT_1229	 NUMBER(1),
    LAT_1230	 NUMBER(1),
    LAT_1231	 NUMBER(1),
    LAT_1232	 NUMBER(1),
    LAT_1233	 NUMBER(1),
    LAT_1234	 NUMBER(1),
    LAT_1235	 NUMBER(1),
    LAT_1236	 NUMBER(1),
    LAT_1237	 NUMBER(1),
    LAT_1238	 NUMBER(1),
    LAT_1239	 NUMBER(1),
    LAT_1240	 NUMBER(1),
    LAT_1241	 NUMBER(1),
    LAT_1242	 NUMBER(1),
    LAT_1243	 NUMBER(1),
    LAT_1244	 NUMBER(1),
    LAT_1245	 NUMBER(1),
    LAT_1246	 NUMBER(1),
    LAT_1247	 NUMBER(1),
    LAT_1248	 NUMBER(1),
    LAT_1249	 NUMBER(1),
    LAT_1250	 NUMBER(1),
    LAT_1251	 NUMBER(1),
    LAT_1252	 NUMBER(1),
    LAT_1253	 NUMBER(1),
    LAT_1254	 NUMBER(1),
    LAT_1255	 NUMBER(1),
    LAT_1256	 NUMBER(1),
    LAT_1257	 NUMBER(1),
    LAT_1258	 NUMBER(1),
    LAT_1259	 NUMBER(1),
    LAT_1260	 NUMBER(1),
    LAT_1261	 NUMBER(1),
    LAT_1262	 NUMBER(1),
    LAT_1263	 NUMBER(1),
    LAT_1264	 NUMBER(1),
    LAT_1265	 NUMBER(1),
    LAT_1266	 NUMBER(1),
    LAT_1267	 NUMBER(1),
    LAT_1268	 NUMBER(1),
    LAT_1269	 NUMBER(1),
    LAT_1270	 NUMBER(1),
    LAT_1271	 NUMBER(1),
    LAT_1272	 NUMBER(1),
    LAT_1273	 NUMBER(1),
    LAT_1274	 NUMBER(1),
    LAT_1275	 NUMBER(1),
    LAT_1276	 NUMBER(1),
    LAT_1277	 NUMBER(1),
    LAT_1278	 NUMBER(1),
    LAT_1279	 NUMBER(1),
    LAT_1280	 NUMBER(1),
    LAT_1281	 NUMBER(1),
    LAT_1282	 NUMBER(1),
    LAT_1283	 NUMBER(1),
    LAT_1284	 NUMBER(1),
    LAT_1285	 NUMBER(1),
    LAT_1286	 NUMBER(1),
    LAT_1287	 NUMBER(1),
    LAT_1288	 NUMBER(1),
    LAT_1289	 NUMBER(1),
    LAT_1290	 NUMBER(1),
    LAT_1291	 NUMBER(1),
    LAT_1292	 NUMBER(1),
    LAT_1293	 NUMBER(1),
    LAT_1294	 NUMBER(1),
    LAT_1295	 NUMBER(1),
    LAT_1296	 NUMBER(1),
    LAT_1297	 NUMBER(1),
    LAT_1298	 NUMBER(1),
    LAT_1299	 NUMBER(1),
    LAT_1300	 NUMBER(1),
    LAT_1301	 NUMBER(1),
    LAT_1302	 NUMBER(1),
    LAT_1303	 NUMBER(1),
    LAT_1304	 NUMBER(1),
    LAT_1305	 NUMBER(1),
    LAT_1306	 NUMBER(1),
    LAT_1307	 NUMBER(1),
    LAT_1308	 NUMBER(1),
    LAT_1309	 NUMBER(1),
    LAT_1310	 NUMBER(1),
    LAT_1311	 NUMBER(1),
    LAT_1312	 NUMBER(1),
    LAT_1313	 NUMBER(1),
    LAT_1314	 NUMBER(1),
    LAT_1315	 NUMBER(1),
    LAT_1316	 NUMBER(1),
    LAT_1317	 NUMBER(1),
    LAT_1318	 NUMBER(1),
    LAT_1319	 NUMBER(1),
    LAT_1320	 NUMBER(1),
    LAT_1321	 NUMBER(1),
    LAT_1322	 NUMBER(1),
    LAT_1323	 NUMBER(1),
    LAT_1324	 NUMBER(1),
    LAT_1325	 NUMBER(1),
    LAT_1326	 NUMBER(1),
    LAT_1327	 NUMBER(1),
    LAT_1328	 NUMBER(1),
    LAT_1329	 NUMBER(1),
    LAT_1330	 NUMBER(1),
    LAT_1331	 NUMBER(1),
    LAT_1332	 NUMBER(1),
    LAT_1333	 NUMBER(1),
    LAT_1334	 NUMBER(1),
    LAT_1335	 NUMBER(1),
    LAT_1336	 NUMBER(1),
    LAT_1337	 NUMBER(1),
    LAT_1338	 NUMBER(1),
    LAT_1339	 NUMBER(1),
    LAT_1340	 NUMBER(1),
    LAT_1341	 NUMBER(1),
    LAT_1342	 NUMBER(1),
    LAT_1343	 NUMBER(1),
    LAT_1344	 NUMBER(1),
    LAT_1345	 NUMBER(1),
    LAT_1346	 NUMBER(1),
    LAT_1347	 NUMBER(1),
    LAT_1348	 NUMBER(1),
    LAT_1349	 NUMBER(1),
    LAT_1350	 NUMBER(1),
    LAT_1351	 NUMBER(1),
    LAT_1352	 NUMBER(1),
    LAT_1353	 NUMBER(1),
    LAT_1354	 NUMBER(1),
    LAT_1355	 NUMBER(1),
    LAT_1356	 NUMBER(1),
    LAT_1357	 NUMBER(1),
    LAT_1358	 NUMBER(1),
    LAT_1359	 NUMBER(1),
    LAT_1360	 NUMBER(1),
    LAT_1361	 NUMBER(1),
    LAT_1362	 NUMBER(1),
    LAT_1363	 NUMBER(1),
    LAT_1364	 NUMBER(1),
    LAT_1365	 NUMBER(1),
    LAT_1366	 NUMBER(1),
    LAT_1367	 NUMBER(1),
    LAT_1368	 NUMBER(1),
    LAT_1369	 NUMBER(1),
    LAT_1370	 NUMBER(1),
    LAT_1371	 NUMBER(1),
    LAT_1372	 NUMBER(1),
    LAT_1373	 NUMBER(1),
    LAT_1374	 NUMBER(1),
    LAT_1375	 NUMBER(1),
    LAT_1376	 NUMBER(1),
    LAT_1377	 NUMBER(1),
    LAT_1378	 NUMBER(1),
    LAT_1379	 NUMBER(1),
    LAT_1380	 NUMBER(1),
    LAT_1381	 NUMBER(1),
    LAT_1382	 NUMBER(1),
    LAT_1383	 NUMBER(1),
    LAT_1384	 NUMBER(1),
    LAT_1385	 NUMBER(1),
    LAT_1386	 NUMBER(1),
    LAT_1387	 NUMBER(1),
    LAT_1388	 NUMBER(1),
    LAT_1389	 NUMBER(1),
    LAT_1390	 NUMBER(1),
    LAT_1391	 NUMBER(1),
    LAT_1392	 NUMBER(1),
    LAT_1393	 NUMBER(1),
    LAT_1394	 NUMBER(1),
    LAT_1395	 NUMBER(1),
    LAT_1396	 NUMBER(1),
    LAT_1397	 NUMBER(1),
    LAT_1398	 NUMBER(1),
    LAT_1399	 NUMBER(1),
    LAT_1400	 NUMBER(1),
    LAT_1401	 NUMBER(1),
    LAT_1402	 NUMBER(1),
    LAT_1403	 NUMBER(1),
    LAT_1404	 NUMBER(1),
    LAT_1405	 NUMBER(1),
    LAT_1406	 NUMBER(1),
    LAT_1407	 NUMBER(1),
    LAT_1408	 NUMBER(1),
    LAT_1409	 NUMBER(1),
    LAT_1410	 NUMBER(1),
    LAT_1411	 NUMBER(1),
    LAT_1412	 NUMBER(1),
    LAT_1413	 NUMBER(1),
    LAT_1414	 NUMBER(1),
    LAT_1415	 NUMBER(1),
    LAT_1416	 NUMBER(1),
    LAT_1417	 NUMBER(1),
    LAT_1418	 NUMBER(1),
    LAT_1419	 NUMBER(1),
    LAT_1420	 NUMBER(1),
    LAT_1421	 NUMBER(1),
    LAT_1422	 NUMBER(1),
    LAT_1423	 NUMBER(1),
    LAT_1424	 NUMBER(1),
    LAT_1425	 NUMBER(1),
    LAT_1426	 NUMBER(1),
    LAT_1427	 NUMBER(1),
    LAT_1428	 NUMBER(1),
    LAT_1429	 NUMBER(1),
    LAT_1430	 NUMBER(1),
    LAT_1431	 NUMBER(1),
    LAT_1432	 NUMBER(1),
    LAT_1433	 NUMBER(1),
    LAT_1434	 NUMBER(1),
    LAT_1435	 NUMBER(1),
    LAT_1436	 NUMBER(1),
    LAT_1437	 NUMBER(1),
    LAT_1438	 NUMBER(1),
    LAT_1439	 NUMBER(1),
    LAT_1440	 NUMBER(1),
    LAT_1441	 NUMBER(1),
    LAT_1442	 NUMBER(1),
    LAT_1443	 NUMBER(1),
    LAT_1444	 NUMBER(1),
    LAT_1445	 NUMBER(1),
    LAT_1446	 NUMBER(1),
    LAT_1447	 NUMBER(1),
    LAT_1448	 NUMBER(1),
    LAT_1449	 NUMBER(1),
    LAT_1450	 NUMBER(1),
    LAT_1451	 NUMBER(1),
    LAT_1452	 NUMBER(1),
    LAT_1453	 NUMBER(1),
    LAT_1454	 NUMBER(1),
    LAT_1455	 NUMBER(1),
    LAT_1456	 NUMBER(1),
    LAT_1457	 NUMBER(1),
    LAT_1458	 NUMBER(1),
    LAT_1459	 NUMBER(1),
    LAT_1460	 NUMBER(1),
    LAT_1461	 NUMBER(1),
    LAT_1462	 NUMBER(1),
    LAT_1463	 NUMBER(1),
    LAT_1464	 NUMBER(1),
    LAT_1465	 NUMBER(1),
    LAT_1466	 NUMBER(1),
    LAT_1467	 NUMBER(1),
    LAT_1468	 NUMBER(1),
    LAT_1469	 NUMBER(1),
    LAT_1470	 NUMBER(1),
    LAT_1471	 NUMBER(1),
    LAT_1472	 NUMBER(1),
    LAT_1473	 NUMBER(1),
    LAT_1474	 NUMBER(1),
    LAT_1475	 NUMBER(1),
    LAT_1476	 NUMBER(1),
    LAT_1477	 NUMBER(1),
    LAT_1478	 NUMBER(1),
    LAT_1479	 NUMBER(1),
    LAT_1480	 NUMBER(1),
    LAT_1481	 NUMBER(1),
    LAT_1482	 NUMBER(1),
    LAT_1483	 NUMBER(1),
    LAT_1484	 NUMBER(1),
    LAT_1485	 NUMBER(1),
    LAT_1486	 NUMBER(1),
    LAT_1487	 NUMBER(1),
    LAT_1488	 NUMBER(1),
    LAT_1489	 NUMBER(1),
    LAT_1490	 NUMBER(1),
    LAT_1491	 NUMBER(1),
    LAT_1492	 NUMBER(1),
    LAT_1493	 NUMBER(1),
    LAT_1494	 NUMBER(1),
    LAT_1495	 NUMBER(1),
    LAT_1496	 NUMBER(1),
    LAT_1497	 NUMBER(1),
    LAT_1498	 NUMBER(1),
    LAT_1499	 NUMBER(1),
    LAT_1500	 NUMBER(1),
    LAT_1501	 NUMBER(1),
    LAT_1502	 NUMBER(1),
    LAT_1503	 NUMBER(1),
    LAT_1504	 NUMBER(1),
    LAT_1505	 NUMBER(1),
    LAT_1506	 NUMBER(1),
    LAT_1507	 NUMBER(1),
    LAT_1508	 NUMBER(1),
    LAT_1509	 NUMBER(1),
    LAT_1510	 NUMBER(1),
    LAT_1511	 NUMBER(1),
    LAT_1512	 NUMBER(1),
    LAT_1513	 NUMBER(1),
    LAT_1514	 NUMBER(1),
    LAT_1515	 NUMBER(1),
    LAT_1516	 NUMBER(1),
    LAT_1517	 NUMBER(1),
    LAT_1518	 NUMBER(1),
    LAT_1519	 NUMBER(1),
    LAT_1520	 NUMBER(1),
    LAT_1521	 NUMBER(1),
    LAT_1522	 NUMBER(1),
    LAT_1523	 NUMBER(1),
    LAT_1524	 NUMBER(1),
    LAT_1525	 NUMBER(1),
    LAT_1526	 NUMBER(1),
    LAT_1527	 NUMBER(1),
    LAT_1528	 NUMBER(1),
    LAT_1529	 NUMBER(1),
    LAT_1530	 NUMBER(1),
    LAT_1531	 NUMBER(1),
    LAT_1532	 NUMBER(1),
    LAT_1533	 NUMBER(1),
    LAT_1534	 NUMBER(1),
    LAT_1535	 NUMBER(1),
    LAT_1536	 NUMBER(1),
    LAT_1537	 NUMBER(1),
    LAT_1538	 NUMBER(1),
    LAT_1539	 NUMBER(1),
    LAT_1540	 NUMBER(1),
    LAT_1541	 NUMBER(1),
    LAT_1542	 NUMBER(1),
    LAT_1543	 NUMBER(1),
    LAT_1544	 NUMBER(1),
    LAT_1545	 NUMBER(1),
    LAT_1546	 NUMBER(1),
    LAT_1547	 NUMBER(1),
    LAT_1548	 NUMBER(1),
    LAT_1549	 NUMBER(1),
    LAT_1550	 NUMBER(1),
    LAT_1551	 NUMBER(1),
    LAT_1552	 NUMBER(1),
    LAT_1553	 NUMBER(1),
    LAT_1554	 NUMBER(1),
    LAT_1555	 NUMBER(1),
    LAT_1556	 NUMBER(1),
    LAT_1557	 NUMBER(1),
    LAT_1558	 NUMBER(1),
    LAT_1559	 NUMBER(1),
    LAT_1560	 NUMBER(1),
    LAT_1561	 NUMBER(1),
    LAT_1562	 NUMBER(1),
    LAT_1563	 NUMBER(1),
    LAT_1564	 NUMBER(1),
    LAT_1565	 NUMBER(1),
    LAT_1566	 NUMBER(1),
    LAT_1567	 NUMBER(1),
    LAT_1568	 NUMBER(1),
    LAT_1569	 NUMBER(1),
    LAT_1570	 NUMBER(1),
    LAT_1571	 NUMBER(1),
    LAT_1572	 NUMBER(1),
    LAT_1573	 NUMBER(1),
    LAT_1574	 NUMBER(1),
    LAT_1575	 NUMBER(1),
    LAT_1576	 NUMBER(1),
    LAT_1577	 NUMBER(1),
    LAT_1578	 NUMBER(1),
    LAT_1579	 NUMBER(1),
    LAT_1580	 NUMBER(1),
    LAT_1581	 NUMBER(1),
    LAT_1582	 NUMBER(1),
    LAT_1583	 NUMBER(1),
    LAT_1584	 NUMBER(1),
    LAT_1585	 NUMBER(1),
    LAT_1586	 NUMBER(1),
    LAT_1587	 NUMBER(1),
    LAT_1588	 NUMBER(1),
    LAT_1589	 NUMBER(1),
    LAT_1590	 NUMBER(1),
    LAT_1591	 NUMBER(1),
    LAT_1592	 NUMBER(1),
    LAT_1593	 NUMBER(1),
    LAT_1594	 NUMBER(1),
    LAT_1595	 NUMBER(1),
    LAT_1596	 NUMBER(1),
    LAT_1597	 NUMBER(1),
    LAT_1598	 NUMBER(1),
    LAT_1599	 NUMBER(1),
    LAT_1600	 NUMBER(1),
    LAT_1601	 NUMBER(1),
    LAT_1602	 NUMBER(1),
    LAT_1603	 NUMBER(1),
    LAT_1604	 NUMBER(1),
    LAT_1605	 NUMBER(1),
    LAT_1606	 NUMBER(1),
    LAT_1607	 NUMBER(1),
    LAT_1608	 NUMBER(1),
    LAT_1609	 NUMBER(1),
    LAT_1610	 NUMBER(1),
    LAT_1611	 NUMBER(1),
    LAT_1612	 NUMBER(1),
    LAT_1613	 NUMBER(1),
    LAT_1614	 NUMBER(1),
    LAT_1615	 NUMBER(1),
    LAT_1616	 NUMBER(1),
    LAT_1617	 NUMBER(1),
    LAT_1618	 NUMBER(1),
    LAT_1619	 NUMBER(1),
    LAT_1620	 NUMBER(1),
    LAT_1621	 NUMBER(1),
    LAT_1622	 NUMBER(1),
    LAT_1623	 NUMBER(1),
    LAT_1624	 NUMBER(1),
    LAT_1625	 NUMBER(1),
    LAT_1626	 NUMBER(1),
    LAT_1627	 NUMBER(1),
    LAT_1628	 NUMBER(1),
    LAT_1629	 NUMBER(1),
    LAT_1630	 NUMBER(1),
    LAT_1631	 NUMBER(1),
    LAT_1632	 NUMBER(1),
    LAT_1633	 NUMBER(1),
    LAT_1634	 NUMBER(1),
    LAT_1635	 NUMBER(1),
    LAT_1636	 NUMBER(1),
    LAT_1637	 NUMBER(1),
    LAT_1638	 NUMBER(1),
    LAT_1639	 NUMBER(1),
    LAT_1640	 NUMBER(1),
    LAT_1641	 NUMBER(1),
    LAT_1642	 NUMBER(1),
    LAT_1643	 NUMBER(1),
    LAT_1644	 NUMBER(1),
    LAT_1645	 NUMBER(1),
    LAT_1646	 NUMBER(1),
    LAT_1647	 NUMBER(1),
    LAT_1648	 NUMBER(1),
    LAT_1649	 NUMBER(1),
    LAT_1650	 NUMBER(1),
    LAT_1651	 NUMBER(1),
    LAT_1652	 NUMBER(1),
    LAT_1653	 NUMBER(1),
    LAT_1654	 NUMBER(1),
    LAT_1655	 NUMBER(1),
    LAT_1656	 NUMBER(1),
    LAT_1657	 NUMBER(1),
    LAT_1658	 NUMBER(1),
    LAT_1659	 NUMBER(1),
    LAT_1660	 NUMBER(1),
    LAT_1661	 NUMBER(1),
    LAT_1662	 NUMBER(1),
    LAT_1663	 NUMBER(1),
    LAT_1664	 NUMBER(1),
    LAT_1665	 NUMBER(1),
    LAT_1666	 NUMBER(1),
    LAT_1667	 NUMBER(1),
    LAT_1668	 NUMBER(1),
    LAT_1669	 NUMBER(1),
    LAT_1670	 NUMBER(1),
    LAT_1671	 NUMBER(1),
    LAT_1672	 NUMBER(1),
    LAT_1673	 NUMBER(1),
    LAT_1674	 NUMBER(1),
    LAT_1675	 NUMBER(1),
    LAT_1676	 NUMBER(1),
    LAT_1677	 NUMBER(1),
    LAT_1678	 NUMBER(1),
    LAT_1679	 NUMBER(1),
    LAT_1680	 NUMBER(1),
    LAT_1681	 NUMBER(1),
    LAT_1682	 NUMBER(1),
    LAT_1683	 NUMBER(1),
    LAT_1684	 NUMBER(1),
    LAT_1685	 NUMBER(1),
    LAT_1686	 NUMBER(1),
    LAT_1687	 NUMBER(1),
    LAT_1688	 NUMBER(1),
    LAT_1689	 NUMBER(1),
    LAT_1690	 NUMBER(1),
    LAT_1691	 NUMBER(1),
    LAT_1692	 NUMBER(1),
    LAT_1693	 NUMBER(1),
    LAT_1694	 NUMBER(1),
    LAT_1695	 NUMBER(1),
    LAT_1696	 NUMBER(1),
    LAT_1697	 NUMBER(1),
    LAT_1698	 NUMBER(1),
    LAT_1699	 NUMBER(1),
    LAT_1700	 NUMBER(1),
    LAT_1701	 NUMBER(1),
    LAT_1702	 NUMBER(1),
    LAT_1703	 NUMBER(1),
    LAT_1704	 NUMBER(1),
    LAT_1705	 NUMBER(1),
    LAT_1706	 NUMBER(1),
    LAT_1707	 NUMBER(1),
    LAT_1708	 NUMBER(1),
    LAT_1709	 NUMBER(1),
    LAT_1710	 NUMBER(1),
    LAT_1711	 NUMBER(1),
    LAT_1712	 NUMBER(1),
    LAT_1713	 NUMBER(1),
    LAT_1714	 NUMBER(1),
    LAT_1715	 NUMBER(1),
    LAT_1716	 NUMBER(1),
    LAT_1717	 NUMBER(1),
    LAT_1718	 NUMBER(1),
    LAT_1719	 NUMBER(1),
    LAT_1720	 NUMBER(1),
    LAT_1721	 NUMBER(1),
    LAT_1722	 NUMBER(1),
    LAT_1723	 NUMBER(1),
    LAT_1724	 NUMBER(1),
    LAT_1725	 NUMBER(1),
    LAT_1726	 NUMBER(1),
    LAT_1727	 NUMBER(1),
    LAT_1728	 NUMBER(1),
    LAT_1729	 NUMBER(1),
    LAT_1730	 NUMBER(1),
    LAT_1731	 NUMBER(1),
    LAT_1732	 NUMBER(1),
    LAT_1733	 NUMBER(1),
    LAT_1734	 NUMBER(1),
    LAT_1735	 NUMBER(1),
    LAT_1736	 NUMBER(1),
    LAT_1737	 NUMBER(1),
    LAT_1738	 NUMBER(1),
    LAT_1739	 NUMBER(1),
    LAT_1740	 NUMBER(1),
    LAT_1741	 NUMBER(1),
    LAT_1742	 NUMBER(1),
    LAT_1743	 NUMBER(1),
    LAT_1744	 NUMBER(1),
    LAT_1745	 NUMBER(1),
    LAT_1746	 NUMBER(1),
    LAT_1747	 NUMBER(1),
    LAT_1748	 NUMBER(1),
    LAT_1749	 NUMBER(1),
    LAT_1750	 NUMBER(1),
    LAT_1751	 NUMBER(1),
    LAT_1752	 NUMBER(1),
    LAT_1753	 NUMBER(1),
    LAT_1754	 NUMBER(1),
    LAT_1755	 NUMBER(1),
    LAT_1756	 NUMBER(1),
    LAT_1757	 NUMBER(1),
    LAT_1758	 NUMBER(1),
    LAT_1759	 NUMBER(1),
    LAT_1760	 NUMBER(1),
    LAT_1761	 NUMBER(1),
    LAT_1762	 NUMBER(1),
    LAT_1763	 NUMBER(1),
    LAT_1764	 NUMBER(1),
    LAT_1765	 NUMBER(1),
    LAT_1766	 NUMBER(1),
    LAT_1767	 NUMBER(1),
    LAT_1768	 NUMBER(1),
    LAT_1769	 NUMBER(1),
    LAT_1770	 NUMBER(1),
    LAT_1771	 NUMBER(1),
    LAT_1772	 NUMBER(1),
    LAT_1773	 NUMBER(1),
    LAT_1774	 NUMBER(1),
    LAT_1775	 NUMBER(1),
    LAT_1776	 NUMBER(1),
    LAT_1777	 NUMBER(1),
    LAT_1778	 NUMBER(1),
    LAT_1779	 NUMBER(1),
    LAT_1780	 NUMBER(1),
    LAT_1781	 NUMBER(1),
    LAT_1782	 NUMBER(1),
    LAT_1783	 NUMBER(1),
    LAT_1784	 NUMBER(1),
    LAT_1785	 NUMBER(1),
    LAT_1786	 NUMBER(1),
    LAT_1787	 NUMBER(1),
    LAT_1788	 NUMBER(1),
    LAT_1789	 NUMBER(1),
    LAT_1790	 NUMBER(1),
    LAT_1791	 NUMBER(1),
    LAT_1792	 NUMBER(1),
    LAT_1793	 NUMBER(1),
    LAT_1794	 NUMBER(1),
    LAT_1795	 NUMBER(1),
    LAT_1796	 NUMBER(1),
    LAT_1797	 NUMBER(1),
    LAT_1798	 NUMBER(1),
    LAT_1799	 NUMBER(1),
    LAT_1800	 NUMBER(1),
    LAT_1801	 NUMBER(1),
    LAT_1802	 NUMBER(1),
    LAT_1803	 NUMBER(1),
    LAT_1804	 NUMBER(1),
    LAT_1805	 NUMBER(1),
    LAT_1806	 NUMBER(1),
    LAT_1807	 NUMBER(1),
    LAT_1808	 NUMBER(1),
    LAT_1809	 NUMBER(1),
    LAT_1810	 NUMBER(1),
    LAT_1811	 NUMBER(1),
    LAT_1812	 NUMBER(1),
    LAT_1813	 NUMBER(1),
    LAT_1814	 NUMBER(1),
    LAT_1815	 NUMBER(1),
    LAT_1816	 NUMBER(1),
    LAT_1817	 NUMBER(1),
    LAT_1818	 NUMBER(1),
    LAT_1819	 NUMBER(1),
    LAT_1820	 NUMBER(1),
    LAT_1821	 NUMBER(1),
    LAT_1822	 NUMBER(1),
    LAT_1823	 NUMBER(1),
    LAT_1824	 NUMBER(1),
    LAT_1825	 NUMBER(1),
    LAT_1826	 NUMBER(1),
    LAT_1827	 NUMBER(1),
    LAT_1828	 NUMBER(1),
    LAT_1829	 NUMBER(1),
    LAT_1830	 NUMBER(1),
    LAT_1831	 NUMBER(1),
    LAT_1832	 NUMBER(1),
    LAT_1833	 NUMBER(1),
    LAT_1834	 NUMBER(1),
    LAT_1835	 NUMBER(1),
    LAT_1836	 NUMBER(1),
    LAT_1837	 NUMBER(1),
    LAT_1838	 NUMBER(1),
    LAT_1839	 NUMBER(1),
    LAT_1840	 NUMBER(1),
    LAT_1841	 NUMBER(1),
    LAT_1842	 NUMBER(1),
    LAT_1843	 NUMBER(1),
    LAT_1844	 NUMBER(1),
    LAT_1845	 NUMBER(1),
    LAT_1846	 NUMBER(1),
    LAT_1847	 NUMBER(1),
    LAT_1848	 NUMBER(1),
    LAT_1849	 NUMBER(1),
    LAT_1850	 NUMBER(1),
    LAT_1851	 NUMBER(1),
    LAT_1852	 NUMBER(1),
    LAT_1853	 NUMBER(1),
    LAT_1854	 NUMBER(1),
    LAT_1855	 NUMBER(1),
    LAT_1856	 NUMBER(1),
    LAT_1857	 NUMBER(1),
    LAT_1858	 NUMBER(1),
    LAT_1859	 NUMBER(1),
    LAT_1860	 NUMBER(1),
    LAT_1861	 NUMBER(1),
    LAT_1862	 NUMBER(1),
    LAT_1863	 NUMBER(1),
    LAT_1864	 NUMBER(1),
    LAT_1865	 NUMBER(1),
    LAT_1866	 NUMBER(1),
    LAT_1867	 NUMBER(1),
    LAT_1868	 NUMBER(1),
    LAT_1869	 NUMBER(1),
    LAT_1870	 NUMBER(1),
    LAT_1871	 NUMBER(1),
    LAT_1872	 NUMBER(1),
    LAT_1873	 NUMBER(1),
    LAT_1874	 NUMBER(1),
    LAT_1875	 NUMBER(1),
    LAT_1876	 NUMBER(1),
    LAT_1877	 NUMBER(1),
    LAT_1878	 NUMBER(1),
    LAT_1879	 NUMBER(1),
    LAT_1880	 NUMBER(1),
    LAT_1881	 NUMBER(1),
    LAT_1882	 NUMBER(1),
    LAT_1883	 NUMBER(1),
    LAT_1884	 NUMBER(1),
    LAT_1885	 NUMBER(1),
    LAT_1886	 NUMBER(1),
    LAT_1887	 NUMBER(1),
    LAT_1888	 NUMBER(1),
    LAT_1889	 NUMBER(1),
    LAT_1890	 NUMBER(1),
    LAT_1891	 NUMBER(1),
    LAT_1892	 NUMBER(1),
    LAT_1893	 NUMBER(1),
    LAT_1894	 NUMBER(1),
    LAT_1895	 NUMBER(1),
    LAT_1896	 NUMBER(1),
    LAT_1897	 NUMBER(1),
    LAT_1898	 NUMBER(1),
    LAT_1899	 NUMBER(1),
    LAT_1900	 NUMBER(1),
    LAT_1901	 NUMBER(1),
    LAT_1902	 NUMBER(1),
    LAT_1903	 NUMBER(1),
    LAT_1904	 NUMBER(1),
    LAT_1905	 NUMBER(1),
    LAT_1906	 NUMBER(1),
    LAT_1907	 NUMBER(1),
    LAT_1908	 NUMBER(1),
    LAT_1909	 NUMBER(1),
    LAT_1910	 NUMBER(1),
    LAT_1911	 NUMBER(1),
    LAT_1912	 NUMBER(1),
    LAT_1913	 NUMBER(1),
    LAT_1914	 NUMBER(1),
    LAT_1915	 NUMBER(1),
    LAT_1916	 NUMBER(1),
    LAT_1917	 NUMBER(1),
    LAT_1918	 NUMBER(1),
    LAT_1919	 NUMBER(1),
    LAT_1920	 NUMBER(1),
    LAT_1921	 NUMBER(1),
    LAT_1922	 NUMBER(1),
    LAT_1923	 NUMBER(1),
    LAT_1924	 NUMBER(1),
    LAT_1925	 NUMBER(1),
    LAT_1926	 NUMBER(1),
    LAT_1927	 NUMBER(1),
    LAT_1928	 NUMBER(1),
    LAT_1929	 NUMBER(1),
    LAT_1930	 NUMBER(1),
    LAT_1931	 NUMBER(1),
    LAT_1932	 NUMBER(1),
    LAT_1933	 NUMBER(1),
    LAT_1934	 NUMBER(1),
    LAT_1935	 NUMBER(1),
    LAT_1936	 NUMBER(1),
    LAT_1937	 NUMBER(1),
    LAT_1938	 NUMBER(1),
    LAT_1939	 NUMBER(1),
    LAT_1940	 NUMBER(1),
    LAT_1941	 NUMBER(1),
    LAT_1942	 NUMBER(1),
    LAT_1943	 NUMBER(1),
    LAT_1944	 NUMBER(1),
    LAT_1945	 NUMBER(1),
    LAT_1946	 NUMBER(1),
    LAT_1947	 NUMBER(1),
    LAT_1948	 NUMBER(1),
    LAT_1949	 NUMBER(1),
    LAT_1950	 NUMBER(1),
    LAT_1951	 NUMBER(1),
    LAT_1952	 NUMBER(1),
    LAT_1953	 NUMBER(1),
    LAT_1954	 NUMBER(1),
    LAT_1955	 NUMBER(1),
    LAT_1956	 NUMBER(1),
    LAT_1957	 NUMBER(1),
    LAT_1958	 NUMBER(1),
    LAT_1959	 NUMBER(1),
    LAT_1960	 NUMBER(1),
    LAT_1961	 NUMBER(1),
    LAT_1962	 NUMBER(1),
    LAT_1963	 NUMBER(1),
    LAT_1964	 NUMBER(1),
    LAT_1965	 NUMBER(1),
    LAT_1966	 NUMBER(1),
    LAT_1967	 NUMBER(1),
    LAT_1968	 NUMBER(1),
    LAT_1969	 NUMBER(1),
    LAT_1970	 NUMBER(1),
    LAT_1971	 NUMBER(1),
    LAT_1972	 NUMBER(1),
    LAT_1973	 NUMBER(1),
    LAT_1974	 NUMBER(1),
    LAT_1975	 NUMBER(1),
    LAT_1976	 NUMBER(1),
    LAT_1977	 NUMBER(1),
    LAT_1978	 NUMBER(1),
    LAT_1979	 NUMBER(1),
    LAT_1980	 NUMBER(1),
    LAT_1981	 NUMBER(1),
    LAT_1982	 NUMBER(1),
    LAT_1983	 NUMBER(1),
    LAT_1984	 NUMBER(1),
    LAT_1985	 NUMBER(1),
    LAT_1986	 NUMBER(1),
    LAT_1987	 NUMBER(1),
    LAT_1988	 NUMBER(1),
    LAT_1989	 NUMBER(1),
    LAT_1990	 NUMBER(1),
    LAT_1991	 NUMBER(1),
    LAT_1992	 NUMBER(1),
    LAT_1993	 NUMBER(1),
    LAT_1994	 NUMBER(1),
    LAT_1995	 NUMBER(1),
    LAT_1996	 NUMBER(1),
    LAT_1997	 NUMBER(1),
    LAT_1998	 NUMBER(1),
    LAT_1999	 NUMBER(1),
    LAT_2000	 NUMBER(1),
    LAT_2001	 NUMBER(1),
    LAT_2002	 NUMBER(1),
    LAT_2003	 NUMBER(1),
    LAT_2004	 NUMBER(1),
    LAT_2005	 NUMBER(1),
    LAT_2006	 NUMBER(1),
    LAT_2007	 NUMBER(1),
    LAT_2008	 NUMBER(1),
    LAT_2009	 NUMBER(1),
    LAT_2010	 NUMBER(1),
    LAT_2011	 NUMBER(1),
    LAT_2012	 NUMBER(1),
    LAT_2013	 NUMBER(1),
    LAT_2014	 NUMBER(1),
    LAT_2015	 NUMBER(1),
    LAT_2016	 NUMBER(1),
    LAT_2017	 NUMBER(1),
    LAT_2018	 NUMBER(1),
    LAT_2019	 NUMBER(1),
    LAT_2020	 NUMBER(1)
)
PCTFREE 5
TABLESPACE STUDENT_DATA;


------------------------
	-- PRIMARY KEY
------------------------

ALTER TABLE LATA_SPRAW_FUNKCJI_GLOWNEJ 
    ADD CONSTRAINT PK_LATA_SPRAW_FUNKCJI_GLOWNEJ 
    PRIMARY KEY (LAT_ROK_ID);

-- ----------------------#
	--  UNIQUE Keys;
--	---------------------#

ALTER TABLE LATA_SPRAW_FUNKCJI_GLOWNEJ
    ADD CONSTRAINT UQ_LATA_SPRAW_FUNKCJI_GLOWNEJ
    UNIQUE (LAT_ROK_ID);

------------------------
	--  FOREIGN Keys w TABELI LATA_SPRAW_FUNKCJI_GLOWNEJ
------------------------

ALTER TABLE LATA_SPRAW_FUNKCJI_GLOWNEJ
		ADD CONSTRAINT FK1_LATA_SPRAW_FUNKCJI_GLOWNEJ
		FOREIGN KEY(OSOBA_ID_W_OSO) 
		REFERENCES OSOBY(OSOBA_ID) ENABLE;

----------------------------
----------------------------

--- --- TABELA Dzielnica historyczna --- ---

----------------------------
----------------------------

CREATE TABLE DZIELNICA_HISTORYCZNA(
    DZ_H_ID	                                                NUMBER(2)   NOT NULL,
    DZ_H_KLEPARZ_PRZY_KRAKOWIE 	                            NUMBER(1),
    DZ_H_KAZIMIERZ_PRZY_KRAKOWIE_WRAZ_Z_MIASTEM_ZYDOWSKIM 	NUMBER(1),
    DZ_H_BISKUPICE 	                                        NUMBER(1),
    DZ_H_BLONIE_ZA_KLEPARZEM 	                            NUMBER(1),
    DZ_H_GARBARY 	                                        NUMBER(1),
    DZ_H_GRAMATYKA	                                        NUMBER(1),
    DZ_H_GROBLE	                                            NUMBER(1),
    DZ_H_LUBICZ_MORSZTYNOWSKIE 	                            NUMBER(1),
    DZ_H_PEDZICHOW 	                                        NUMBER(1),
    DZ_H_PODZAMCZE 	                                        NUMBER(1),
    DZ_H_RETORYKA_OSSOLINSKIE 	                            NUMBER(1),
    DZ_H_SMOLENSK_DUCHOWNY_BOZEGO_MILOSIERDZIA 	            NUMBER(1),
    DZ_H_SMOLENSK_WIELKORZADOWY 	                        NUMBER(1),
    DZ_H_SZLAK_SW_FLORIANA 	                                NUMBER(1),
    DZ_H_WESOLA_RADZIWILLOWSKIE 	                        NUMBER(1),
    DZ_H_WYGODA_MARGRABSZCZYZNA	                            NUMBER(1),
    DZ_H_CZARNA_WIES 	                                    NUMBER(1),
    DZ_H_DABIE 	                                            NUMBER(1),      
    DZ_H_DEBNIKI 	                                        NUMBER(1),
    DZ_H_GRZEGORZKI 	                                    NUMBER(1),
    DZ_H_KROWODRZA 	                                        NUMBER(1),
    DZ_H_LUDWINOW 	                                        NUMBER(1),
    DZ_H_LOBZOW 	                                        NUMBER(1),
    DZ_H_NOWA_WIES_NARODOWA 	                            NUMBER(1),
    DZ_H_PLASZOW                                            NUMBER(1),
    DZ_H_POLWSIE_ZWIERZYNIECKIE 	                        NUMBER(1),
    DZ_H_ZAKRZOWEK 	                                        NUMBER(1),
    DZ_H_ZWIERZYNIEC 	                                    NUMBER(1),
    DZ_H_BIELANY 	                                        NUMBER(1),
    DZ_H_BIENCZYCE 	                                        NUMBER(1),
    DZ_H_BIEZANOW 	                                        NUMBER(1),
    DZ_H_BODZOW 	                                        NUMBER(1),
    DZ_H_BOREK_FALECKI 	                                    NUMBER(1),
    DZ_H_BRANICE 	                                        NUMBER(1),
    DZ_H_BRONOWICE_MALE 	                                NUMBER(1),
    DZ_H_BRONOWICE_WIELKIE 	                                NUMBER(1),
    DZ_H_CHELM 	                                            NUMBER(1),
    DZ_H_CZYZYNY 	                                        NUMBER(1),
    DZ_H_GORKA NARODOWA 	                                NUMBER(1),
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
    DZ_H_MISTRZEJOWICE 	                                    NUMBER(1),
    DZ_H_MOGILA 	                                        NUMBER(1),
    DZ_H_MYDLNIKI 	                                        NUMBER(1),
    DZ_H_OLSZA 	                                            NUMBER(1),
    DZ_H_OLSZANICA 	                                        NUMBER(1),
    DZ_H_OPATKOWICE 	                                    NUMBER(1),
    DZ_H_PIASKI_WIELKIE 	                                NUMBER(1),
    DZ_H_PLESZOW 	                                        NUMBER(1),
    DZ_H_PRADNIK_BIALY 	                                    NUMBER(1),
    DZ_H_PRADNIK_CZERWONY 	                                NUMBER(1),
    DZ_H_PROKOCIM 	                                        NUMBER(1),
    DZ_H_PRZEGORZALY 	                                    NUMBER(1),
    DZ_H_PRZEWOZ 	                                        NUMBER(1),
    DZ_H_PRZYLASEK_RUSIECKI 	                            NUMBER(1),
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
    DZ_H_WYCIAZE_I_PRZYLASEK_WYCIASKI 	                    NUMBER(1),
    DZ_H_ZBYDNIOWICE 	                                    NUMBER(1),
    DZ_H_ZESLAWICE 	                                        NUMBER(1)
)
PCTFREE 5
TABLESPACE STUDENT_DATA;


------------------------
	-- PRIMARY KEY
------------------------

ALTER TABLE DZIELNICA_HISTORYCZNA 
    ADD CONSTRAINT PK_DZIELNICA_HISTORYCZNA 
    PRIMARY KEY (DZ_H_ID);

-- ----------------------#
	--  UNIQUE Keys;
--	---------------------#
ALTER TABLE DZIELNICA_HISTORYCZNA
    ADD CONSTRAINT UQ_DZIELNICA_HISTORYCZNA
    UNIQUE (DZ_H_ID);

------------------------
	--  FOREIGN Keys w TABELI LATA_SPRAW_FUNKCJI_GLOWNEJ
------------------------

ALTER TABLE DZIELNICA_HISTORYCZNA
		ADD CONSTRAINT FK1_DZIELNICA_HISTORYCZNA
		FOREIGN KEY(OSOBA_ID_W_OSO) 
		REFERENCES OSOBY(OSOBA_ID) ENABLE;

----------------------------
----------------------------

--- --- TABELA Dzielnica aktualna --- ---

----------------------------
----------------------------

CREATE TABLE DZIELNICA_AKTUALNA(
    DZ_A_ID                         NUMBER(2)   NOT NULL,
    DZ_A_I_STARE_MIASTO             NUMBER(1),
    DZ_A_II_GRZEGORZKI              NUMBER(1),
    DZ_A_III_PRADNIK_CZERWONY       NUMBER(1),
    DZ_A_IV_PRADNIK_BIALY           NUMBER(1),
    DZ_A_V_KROWODRZA                NUMBER(1),
    DZ_A_VI_BRONOWICE               NUMBER(1),
    DZ_A_VII_ZWIERZYNIEC            NUMBER(1),
    DZ_A_VIII_DEBNIKI               NUMBER(1),
    DZ_A_LAGIEWNIKI_BOREK_FALECKI   NUMBER(1),
    DZ_A_X_SWOSZOWICE               NUMBER(1),
    DZ_A_XI_PODGORZE_DUCHACKIE      NUMBER(1),
    DZ_A_XII_BIEZANOW_PROKOCIM      NUMBER(1),
    DZ_A_XIII_PODGORZE              NUMBER(1),
    DZ_A_XIV_CZYZYNY                NUMBER(1),
    DZ_A_XV_MISTRZEJOWICE           NUMBER(1),
    DZ_A_XVI_BIENCZYCE              NUMBER(1),
    DZ_A_XVII_WZGORZA_KRZESLAWICKIE NUMBER(1),
    DZ_A_XVIII_NOWA_HUTA            NUMBER(1)
)
PCTFREE 5
TABLESPACE STUDENT_DATA;


------------------------
	-- PRIMARY KEY
------------------------

ALTER TABLE DZIELNICA_AKTUALNA 
    ADD CONSTRAINT PK_DZIELNICA_AKTUALNA 
    PRIMARY KEY (DZ_A_ID);

-- ----------------------#
	--  UNIQUE Keys;
--	---------------------#
ALTER TABLE DZIELNICA_AKTUALNA
    ADD CONSTRAINT UQ_DZIELNICA_AKTUALNA
    UNIQUE (DZ_A_ID);

------------------------
	--  FOREIGN Keys w TABELI LATA_SPRAW_FUNKCJI_GLOWNEJ
------------------------

ALTER TABLE DZIELNICA_AKTUALNA
		ADD CONSTRAINT FK1_DZIELNICA_AKTUALNA
		FOREIGN KEY(OSOBA_ID_W_OSO) 
		REFERENCES OSOBY(OSOBA_ID) ENABLE;

----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------
----------------------------

TABLESPACE STUDENT_DATA STORAGE (INITIAL 10 kB NEXT 20 kB MINEXTENDS 1);

/*
COLUMN TABLE_NAME HEADING 'NAME' for A32
COLUMN TABLESPACE_NAME HEADING 'TABLESPACE' for A32
COLUMN PCT_FREE HEADING 'PCT_FREE' for 9999.99
COLUMN INITIAL_EXTENT HEADING '1EXTENT [kB]' for 999999999999

SELECT TABLE_NAME,TABLESPACE_NAME,PCT_FREE,INITIAL_EXTENT/1024 FROM USER_TABLES
WHERE DROPPED='NO';
*/

ALTER TABLE OSOBY NOLOGING;

COLUMN TABLE_NAME HEADING 'OSOBY' FOR A32
COLUMN DROPPED HEADING 'OSOBY' FOR A32

SELECT TABLE_NAME FROM USER_TABLES
WHERE DROPPED = 'NO';


CREATE DATABASE  IF NOT EXISTS `bank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bank`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Tworzenie tabeli `dzialy`
--

DROP TABLE IF EXISTS `dzialy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dzialy` (
  `id_dzialu` int NOT NULL AUTO_INCREMENT,
  `Nazwa_dzialu` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dzialu`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `dzialy`
--

LOCK TABLES `dzialy` WRITE;
/*!40000 ALTER TABLE `dzialy` DISABLE KEYS */;
INSERT INTO `dzialy` VALUES (1,'Inwestycje'),(2,'Kredyty'),(3,'Zarzadzanie placowka'),(4,'Transakcje'),(5,'Obsluga klienta'),(6,'Marketing'),(7,'Higiena i czystosc'),(8,'IT'),(9,'Ochrona'),(10,'Prace konserwacyjne');
/*!40000 ALTER TABLE `dzialy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tworzenie tabeli `inwestycje`
--

DROP TABLE IF EXISTS `inwestycje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inwestycje` (
  `id_inwestycji` int NOT NULL AUTO_INCREMENT,
  `Numer_konta` int NOT NULL,
  `id_rodzaj_inwestycji` int NOT NULL,
  `id_pracownik_obslugujacy` int NOT NULL,
  `Nazwa_instrumentu` varchar(45) NOT NULL,
  `Kwota_inwestycji` int NOT NULL,
  `Data_zakupu` date NOT NULL,
  `Kwota_sprzedazy` int NOT NULL,
  `Data_sprzedazy` date NOT NULL,
  PRIMARY KEY (`id_inwestycji`),
  KEY `Rodzaj inwestycji_idx` (`id_rodzaj_inwestycji`),
  KEY `Pracownik nadzorujacy inwestycje_idx` (`id_pracownik_obslugujacy`),
  KEY `Numer_konta_inwestycje_idx` (`Numer_konta`),
  CONSTRAINT `Numer_konta_inwestycje` FOREIGN KEY (`Numer_konta`) REFERENCES `konta` (`Numer_konta`),
  CONSTRAINT `Pracownik nadzorujacy inwestycje` FOREIGN KEY (`id_pracownik_obslugujacy`) REFERENCES `pracownicy` (`id_pracownika`),
  CONSTRAINT `Rodzaj inwestycji` FOREIGN KEY (`id_rodzaj_inwestycji`) REFERENCES `rodzaje_inwestycji` (`id_rodzaj_inwestycji`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `inwestycje`
--

LOCK TABLES `inwestycje` WRITE;
/*!40000 ALTER TABLE `inwestycje` DISABLE KEYS */;
INSERT INTO `inwestycje` VALUES (1,10000001,1,2,'SDF',15246,'2014-07-23',182467,'2020-08-13'),(2,11111111,2,2,'HFG',1524,'2015-07-26',5246,'2018-08-10'),(3,22222222,4,2,'CVB',185437,'2015-10-19',5293,'2020-11-02'),(4,33333333,1,7,'TD',8596,'2014-02-20',5643,'2019-03-06'),(5,44444444,2,2,'VCX',8547,'2016-07-04',506,'2020-04-15'),(6,55555555,3,7,'FBG',52463,'2014-03-18',52648,'2018-10-13'),(7,66666666,1,7,'YFT',15246,'2016-04-09',50624,'2018-10-02'),(8,77777777,4,2,'HMJ',59612,'2014-11-10',15061,'2020-01-05'),(9,88888888,2,7,'HGU',5261,'2014-08-14',50464,'2017-09-02'),(10,99999999,3,2,'GRE',154,'2014-06-23',563,'2017-06-18');
/*!40000 ALTER TABLE `inwestycje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tworzenie tabeli `klienci`
--

DROP TABLE IF EXISTS `klienci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klienci` (
  `id_klienta` int NOT NULL AUTO_INCREMENT,
  `Imie` varchar(45) NOT NULL,
  `Nazwisko` varchar(45) NOT NULL,
  `Data_urodzenia` date NOT NULL,
  `PESEL` varchar(11) NOT NULL,
  `Miasto` varchar(45) NOT NULL,
  `Ulica` varchar(45) NOT NULL,
  `Nr_domu` int NOT NULL,
  `Nr_mieszkania` int DEFAULT NULL,
  `Nr_telefonu` varchar(20) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`id_klienta`),
  UNIQUE KEY `id_klienta_UNIQUE` (`id_klienta`),
  UNIQUE KEY `PESEL_UNIQUE` (`PESEL`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `klienci`
--

LOCK TABLES `klienci` WRITE;
/*!40000 ALTER TABLE `klienci` DISABLE KEYS */;
INSERT INTO `klienci` VALUES (1,'Walter','Mack','1977-12-01','77120106551','Blue Ash','Barnes',23,8,'5136443944','WalterMMack@teleworm.us'),(2,'Michael','Vaughan','1936-08-01','39080104332','Boston','Day Drive',26,33,'6179880214','MichaelJVaughan@rhyta.com'),(3,'Gary','Judah','1999-12-04','99120408994','Kell','Carter Street',42,5,'6188222481','GaryEJudah@rhyta.com'),(4,'Leonardo','Brandt','1949-06-19','49061902145','Champaign','Little Acres Lane',95,NULL,'2178987417','LeonardoABrandt@teleworm.us'),(5,'Elenor','Adan','1940-06-29','40062905662','Springfield','Kinney Street',15,81,'4135538991','ElenorJAdan@armyspy.com'),(6,'Brenda','Varga','1938-12-20','38122007551','Big Stone Gap','Douglas Dairy Road',43,NULL,'2765238838','BrendaCVarga@armyspy.com'),(7,'Roxie','Toussaint','1953-03-17','53031709554','Manhattan','Sigley Road',47,9,'7585588761','RoxieRToussaint@jourrapide.com'),(8,'Genevieve','Jimenez','1950-11-30','50113007661','Denver','Leo Street',19,34,'7209423901','GenevieveBJimenez@teleworm.us'),(9,'Tamara','Lewis','1983-05-18','83051805667','Jackson','Pen Street',26,NULL,'5732431497','TamaraJLewis@jourrapide.com'),(10,'Sharon','Tate','1996-05-28','96052803224','Jersey City','Jadewood Farms',21,2,'9733624328','OllieLTate@rhyta.com');
/*!40000 ALTER TABLE `klienci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tworzenie tabeli `konta`
--

DROP TABLE IF EXISTS `konta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konta` (
  `Numer_konta` int NOT NULL,
  `id_klienta` int NOT NULL,
  `Stan_konta` int NOT NULL,
  `Data_zalozenia` date NOT NULL,
  PRIMARY KEY (`Numer_konta`),
  UNIQUE KEY `id_konta_UNIQUE` (`Numer_konta`),
  KEY `id_klienta_idx` (`id_klienta`),
  CONSTRAINT `id_klienta` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id_klienta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `konta`
--

LOCK TABLES `konta` WRITE;
/*!40000 ALTER TABLE `konta` DISABLE KEYS */;
INSERT INTO `konta` VALUES (10000001,10,567,'2019-05-16'),(11111111,1,1548,'2020-04-05'),(22222222,2,2654,'2018-06-05'),(33333333,3,25482,'2017-01-05'),(44444444,4,6121,'2018-06-12'),(55555555,5,1251,'2015-05-01'),(66666666,6,9654,'2016-01-12'),(77777777,7,15243,'2017-12-09'),(88888888,8,543,'2014-11-30'),(99999999,9,156,'2016-05-16');
/*!40000 ALTER TABLE `konta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tworzenie tabeli `kredyty`
--

DROP TABLE IF EXISTS `kredyty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kredyty` (
  `id_kredytu` int NOT NULL AUTO_INCREMENT,
  `Numer_konta` int NOT NULL,
  `id_pracownika_obslugujacego` int NOT NULL,
  `Data_pozyczenia` date NOT NULL,
  `Kwota_pozyczona` float NOT NULL,
  `Planowana_data_oddania` date NOT NULL,
  `Kwota_do_oddania` float NOT NULL,
  `Splacony` varchar(3) NOT NULL DEFAULT 'NIE',
  PRIMARY KEY (`id_kredytu`),
  KEY `Numer_konta_idx` (`Numer_konta`),
  KEY `pracowkin_obslugujacy_kredyty_idx` (`id_pracownika_obslugujacego`),
  CONSTRAINT `Numer_konta` FOREIGN KEY (`Numer_konta`) REFERENCES `konta` (`Numer_konta`),
  CONSTRAINT `pracowkin_obslugujacy_kredyty` FOREIGN KEY (`id_pracownika_obslugujacego`) REFERENCES `pracownicy` (`id_pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `kredyty`
--

LOCK TABLES `kredyty` WRITE;
/*!40000 ALTER TABLE `kredyty` DISABLE KEYS */;
INSERT INTO `kredyty` VALUES (1,10000001,3,'2015-07-14',694489,'2017-11-13',696631,'TAK'),(2,11111111,3,'2015-05-12',566136,'2019-06-27',567177,'TAK'),(3,22222222,3,'2016-04-27',1272680,'2018-11-22',1346210,'TAK'),(4,33333333,8,'2014-07-22',2984120,'2018-05-06',3029060,'TAK'),(5,44444444,8,'2014-05-01',2262160,'2020-09-07',2297120,'NIE'),(6,55555555,8,'2016-07-07',42599,'2019-09-19',43224,'TAK'),(7,66666666,3,'2014-09-16',1619380,'2018-01-11',1702100,'TAK'),(8,77777777,3,'2016-11-15',3185430,'2019-02-26',3213870,'TAK'),(9,88888888,8,'2015-02-12',2863400,'2019-09-20',2930410,'TAK'),(10,99999999,3,'2014-03-23',816277,'2020-10-05',860374,'NIE');
/*!40000 ALTER TABLE `kredyty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tworzenie tabeli `lokaty`
--

DROP TABLE IF EXISTS `lokaty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lokaty` (
  `id_lokaty` int NOT NULL AUTO_INCREMENT,
  `Numer_konta` int NOT NULL,
  `id_pracownika_nadzorujacego` int NOT NULL,
  `Kwota_lokaty` float NOT NULL,
  `Data_rozpoczecia` date NOT NULL,
  `Zysk` float NOT NULL,
  `Data_zakonczenia` date NOT NULL,
  PRIMARY KEY (`id_lokaty`),
  KEY `Numer konta lokaty_idx` (`Numer_konta`),
  KEY `Pracownik Nadzorujacy lokate_idx` (`id_pracownika_nadzorujacego`),
  CONSTRAINT `Numer konta lokaty` FOREIGN KEY (`Numer_konta`) REFERENCES `konta` (`Numer_konta`),
  CONSTRAINT `Pracownik Nadzorujacy lokate` FOREIGN KEY (`id_pracownika_nadzorujacego`) REFERENCES `pracownicy` (`id_pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `lokaty`
--

LOCK TABLES `lokaty` WRITE;
/*!40000 ALTER TABLE `lokaty` DISABLE KEYS */;
INSERT INTO `lokaty` VALUES (1,10000001,2,15000,'2020-06-01',15,'2021-03-01'),(2,11111111,7,8400,'2018-04-15',100,'2018-12-15'),(3,22222222,7,1000,'2015-06-15',112,'2016-05-15'),(4,33333333,7,2514,'2014-05-15',122,'2015-06-15'),(5,44444444,2,25561,'2016-12-15',523,'2018-05-04'),(6,55555555,2,154615,'2018-05-15',1504,'2019-05-15'),(7,66666666,7,8497,'2016-04-08',150,'2017-05-15'),(8,77777777,2,84967,'2018-02-15',504,'2019-02-15'),(9,88888888,7,8596,'2016-11-05',120,'2018-05-05'),(10,99999999,2,5232,'2018-02-16',261,'2020-02-16');
/*!40000 ALTER TABLE `lokaty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tworzenie tabeli `placowki`
--

DROP TABLE IF EXISTS `placowki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `placowki` (
  `id_placowki` int NOT NULL AUTO_INCREMENT,
  `Miasto` varchar(45) NOT NULL,
  `Ulica` varchar(45) NOT NULL,
  `Nr_budynku` int NOT NULL,
  `Nr_lokalu` int DEFAULT NULL,
  PRIMARY KEY (`id_placowki`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `placowki`
--

LOCK TABLES `placowki` WRITE;
/*!40000 ALTER TABLE `placowki` DISABLE KEYS */;
INSERT INTO `placowki` VALUES (1,'Dallas','Alpaca Way',15,11),(2,'Mansfield','Don Jackson Lane',25,15),(3,'Austin','Valley Lane',15,97),(4,'Red Lion','Zoo Street',15,14),(5,'Pocomoke City','Marie Street',11,36),(6,'Stamford','Cook Hill Road',22,4),(7,'Depue','Braxton Street',37,3),(8,'Columbus','Andell Road',42,64),(9,'Lyndhurst','Central Avenue',65,NULL),(10,'Mountain View','Arbor Lane',22,49);
/*!40000 ALTER TABLE `placowki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tworzenie tabeli `pracownicy`
--

DROP TABLE IF EXISTS `pracownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pracownicy` (
  `id_pracownika` int NOT NULL AUTO_INCREMENT,
  `id_kierownika` int DEFAULT NULL,
  `id_stanowiska` int NOT NULL,
  `id_dzialu` int NOT NULL,
  `id_placowki` int NOT NULL,
  `Imie` varchar(45) NOT NULL,
  `Nazwisko` varchar(45) NOT NULL,
  `Zarobki` int NOT NULL,
  `Nr_telefonu` varchar(20) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `PESEL` varchar(11) NOT NULL,
  `Data_urodzenia` date NOT NULL,
  PRIMARY KEY (`id_pracownika`),
  KEY `id_kierownika_idx` (`id_kierownika`),
  KEY `id_dzialu_idx` (`id_dzialu`),
  KEY `id_placowki_idx` (`id_placowki`),
  KEY `id_stanowiska_idx` (`id_stanowiska`),
  CONSTRAINT `id_dzialu` FOREIGN KEY (`id_dzialu`) REFERENCES `dzialy` (`id_dzialu`),
  CONSTRAINT `id_kierownika` FOREIGN KEY (`id_kierownika`) REFERENCES `pracownicy` (`id_pracownika`),
  CONSTRAINT `id_placowki` FOREIGN KEY (`id_placowki`) REFERENCES `placowki` (`id_placowki`),
  CONSTRAINT `id_stanowiska` FOREIGN KEY (`id_stanowiska`) REFERENCES `stanowiska` (`id_stanowiska`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `pracownicy`
--

LOCK TABLES `pracownicy` WRITE;
/*!40000 ALTER TABLE `pracownicy` DISABLE KEYS */;
INSERT INTO `pracownicy` VALUES (1,NULL,2,3,1,'Matthew','Carter',15000,'5203398241','MatthewMCarter@jourrapide.com','80110208551','1980-11-02'),(2,1,1,1,1,'Cheryl','Hayes',7500,'6504259844','CherylRHayes@armyspy.com','47101805664','1947-10-18'),(3,1,4,2,1,'Orlando','Morrow',8000,'8152313350','OrlandoPMorrow@armyspy.com','66083004882','1966-08-30'),(4,1,6,4,1,'Vincent','Dishmann',5900,'9265487512','VincentVDishman@teleworm.us','65061700221','1965-06-17'),(5,1,5,9,1,'Anne','Taylor',4600,'9145046689','AnneDTaylor@rhyta.com','98012407215','1998-01-24'),(6,NULL,2,3,2,'Athea','Lever',16500,'6183570214','AltheaJLever@jourrapide.com','64051921154','1964-05-19'),(7,6,1,1,2,'Holly','Medina',6900,'6291544578','HollyHMedina@jourrapide.com','9412310594','1994-12-31'),(8,6,4,2,2,'Robert','Elliott',7400,'7046542548','RobertTElliott@jourrapide.com','83110516854','1983-11-05'),(9,6,6,4,2,'Diane','Curry',6250,'3076541548','DianeDCurry@rhyta.com','99062217558','1999-06-22'),(10,6,8,7,2,'Jason','Jones',3800,'4129954562','JasonSJones@armyspy.com','83012006954','1983-01-20');
/*!40000 ALTER TABLE `pracownicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tworzenie tabeli `rodzaje_inwestycji`
--

DROP TABLE IF EXISTS `rodzaje_inwestycji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rodzaje_inwestycji` (
  `id_rodzaj_inwestycji` int NOT NULL AUTO_INCREMENT,
  `Rodzaj_inwestycji` varchar(45) NOT NULL,
  PRIMARY KEY (`id_rodzaj_inwestycji`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `rodzaje_inwestycji`
--

LOCK TABLES `rodzaje_inwestycji` WRITE;
/*!40000 ALTER TABLE `rodzaje_inwestycji` DISABLE KEYS */;
INSERT INTO `rodzaje_inwestycji` VALUES (1,'Bony Skarbowe'),(2,'Akcje'),(3,'Obligacje'),(4,'Fundusze Inwestycyjne');
/*!40000 ALTER TABLE `rodzaje_inwestycji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tworzenie tabeli `stanowiska`
--

DROP TABLE IF EXISTS `stanowiska`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stanowiska` (
  `id_stanowiska` int NOT NULL AUTO_INCREMENT,
  `Nazwa_stanowiska` varchar(45) NOT NULL,
  `Opis_Stanowiska` varchar(250) NOT NULL,
  PRIMARY KEY (`id_stanowiska`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `stanowiska`
--

LOCK TABLES `stanowiska` WRITE;
/*!40000 ALTER TABLE `stanowiska` DISABLE KEYS */;
INSERT INTO `stanowiska` VALUES (1,'Starszy doradca inwestycysny','Pomaga klientomw inwestycjach. Doświadczony pracownik.'),(2,'Kierownik placowki','Kieruje placowka oraz ma mozliwosci zarzadzana personelem.'),(3,'Doradca klienta','Pomaga klientom oraz przekierowuje ich do specjalistow w razie takiej potrzeby.'),(4,'Specjalista ds. ryzyka','Analizuje ryzyko przy kredytach i inwestycjach.'),(5,'Ochroniarz','Dba o bezpieczenstwo klientow i pracownikow na terenie placowki.'),(6,'Specjalista ds. transakcji','Doswiadczony pracownik bedacy w stanie rozwiazac problemy dotyczace transakcji.'),(7,'Specjalista marketingowy','Dba o dobre imie banku oraz stara sie zbobywac nowych klientow.'),(8,'Sprzatacz','Dba o higiene i czystosc placowki.'),(9,'Stazysta','Student rozpoczynajacy kariere. Poznaje jak funkcjinuje bank.'),(10,'Specjalista relacji biznesowych','Dba o relacje banku z innymi biznesami oraz kreuje mozliwosci nabycia klientow.');
/*!40000 ALTER TABLE `stanowiska` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tworzenie tabeli `transakcje_przychodzace`
--

DROP TABLE IF EXISTS `transakcje_przychodzace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transakcje_przychodzace` (
  `id_transakcji_przychodzacej` int NOT NULL AUTO_INCREMENT,
  `Numer_konta_beneficjenta` int NOT NULL,
  `id_pracownika_nadzorujacego` int NOT NULL,
  `Numer_konta_platnika` int NOT NULL,
  `Data_realizacji` date NOT NULL,
  `Kwota_transakcji` int NOT NULL,
  PRIMARY KEY (`id_transakcji_przychodzacej`),
  KEY `Numer konta beneficjenta_idx` (`Numer_konta_beneficjenta`),
  KEY `Pracownik nadzorujacy transakcje przychodzace_idx` (`id_pracownika_nadzorujacego`),
  CONSTRAINT `Numer konta beneficjenta` FOREIGN KEY (`Numer_konta_beneficjenta`) REFERENCES `konta` (`Numer_konta`),
  CONSTRAINT `Pracownik nadzorujacy transakcje przychodzace` FOREIGN KEY (`id_pracownika_nadzorujacego`) REFERENCES `pracownicy` (`id_pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `transakcje_przychodzace`
--

LOCK TABLES `transakcje_przychodzace` WRITE;
/*!40000 ALTER TABLE `transakcje_przychodzace` DISABLE KEYS */;
INSERT INTO `transakcje_przychodzace` VALUES (1,10000001,4,73908984,'2020-05-11',1649732),(2,11111111,9,33110973,'2018-08-20',1570381),(3,22222222,9,84187167,'2018-08-10',929117),(4,33333333,4,47839590,'2017-07-11',796440),(5,44444444,9,34000173,'2016-02-02',484498),(6,55555555,4,45202428,'2018-03-21',1180951),(7,66666666,4,99854520,'2018-10-14',576880),(8,77777777,4,74698784,'2016-02-06',1537220),(9,88888888,9,23270812,'2016-10-20',922775),(10,99999999,4,24012663,'2014-10-25',1172960);
/*!40000 ALTER TABLE `transakcje_przychodzace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tworzenie tabeli `transakcje_wychodzace`
--

DROP TABLE IF EXISTS `transakcje_wychodzace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transakcje_wychodzace` (
  `id_transakcji_wychodzacej` int NOT NULL AUTO_INCREMENT,
  `Numer_konta_platnika` int NOT NULL,
  `id_pracownika_nadzorujacego` int NOT NULL,
  `Kwota_transakcji` int NOT NULL,
  `Numer_konta_beneficjenta` int NOT NULL,
  `Data_realizacji` date NOT NULL,
  PRIMARY KEY (`id_transakcji_wychodzacej`),
  KEY `Numer konta tr. wychodzace_idx` (`Numer_konta_platnika`),
  KEY `Pracownik nadzorujacy transakcje wychodzace_idx` (`id_pracownika_nadzorujacego`),
  CONSTRAINT `Numer konta tr. wychodzace` FOREIGN KEY (`Numer_konta_platnika`) REFERENCES `konta` (`Numer_konta`),
  CONSTRAINT `Pracownik nadzorujacy transakcje wychodzace` FOREIGN KEY (`id_pracownika_nadzorujacego`) REFERENCES `pracownicy` (`id_pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Zapisywanie rekordow do tabeli `transakcje_wychodzace`
--

LOCK TABLES `transakcje_wychodzace` WRITE;
/*!40000 ALTER TABLE `transakcje_wychodzace` DISABLE KEYS */;
INSERT INTO `transakcje_wychodzace` VALUES (1,10000001,9,13086,93651554,'2019-07-15'),(2,11111111,9,94564,35011647,'2015-01-20'),(3,22222222,9,82629,87933729,'2017-08-12'),(4,33333333,4,124214,46756337,'2019-02-26'),(5,44444444,4,12869,71245804,'2018-02-26'),(6,55555555,9,134035,42372479,'2018-09-27'),(7,66666666,4,50518,67888306,'2017-11-25'),(8,77777777,9,41860,71458392,'2019-01-03'),(9,88888888,4,137693,91117597,'2016-03-02'),(10,99999999,9,62048,65981872,'2014-07-26');
/*!40000 ALTER TABLE `transakcje_wychodzace` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dane pochodza z 2020-06-14 19:25:31

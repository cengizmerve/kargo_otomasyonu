-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.28


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema proje
--

CREATE DATABASE IF NOT EXISTS proje;
USE proje;

--
-- Definition of table `alici`
--

DROP TABLE IF EXISTS `alici`;
CREATE TABLE `alici` (
  `TcNo` varchar(11) NOT NULL,
  `Ad` varchar(45) NOT NULL,
  `Soyad` varchar(45) NOT NULL,
  `TelNo` varchar(45) NOT NULL,
  `Adres` varchar(45) NOT NULL,
  `Sehir` varchar(45) NOT NULL,
  PRIMARY KEY (`TcNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alici`
--

/*!40000 ALTER TABLE `alici` DISABLE KEYS */;
INSERT INTO `alici` (`TcNo`,`Ad`,`Soyad`,`TelNo`,`Adres`,`Sehir`) VALUES 
 ('15635874526','Mustafa','Demir','5342533692','Sisli','İstanbul'),
 ('36589214523','Bahadir','Eken','5045698521','Avcilar','İstanbul'),
 ('12595214756','Kerem','Solmaz','5053652146','bornova','izmir'),
 ('35365236303','Melike','Dert','5431023658','karsiyaka','izmir'),
 ('32698520258','Deniz','Kesim','5036387410','gümüsler','denizli'),
 ('10252368525','Ali','Bilir','5436398741','pirimehmet','isparta'),
 ('10000000000','Gizem','Temiz','5447563258','cankaya','Ankara');
/*!40000 ALTER TABLE `alici` ENABLE KEYS */;


--
-- Definition of table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
CREATE TABLE `fatura` (
  `FaturaNo` varchar(10) NOT NULL,
  `TcNo` varchar(11) NOT NULL,
  `KargoNo` varchar(10) NOT NULL,
  `Fiyat` double NOT NULL,
  `OdemeTipi` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`FaturaNo`,`TcNo`,`KargoNo`),
  KEY `FK_fatura_1` (`TcNo`),
  KEY `FK_fatura_3` (`KargoNo`),
  CONSTRAINT `FK_fatura_1` FOREIGN KEY (`TcNo`) REFERENCES `musteri` (`TcNo`),
  CONSTRAINT `FK_fatura_3` FOREIGN KEY (`KargoNo`) REFERENCES `kargoislem` (`KargoNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fatura`
--

/*!40000 ALTER TABLE `fatura` DISABLE KEYS */;
INSERT INTO `fatura` (`FaturaNo`,`TcNo`,`KargoNo`,`Fiyat`,`OdemeTipi`) VALUES 
 ('1000','15635874526','1000',12.5,1);
/*!40000 ALTER TABLE `fatura` ENABLE KEYS */;


--
-- Definition of table `giris`
--

DROP TABLE IF EXISTS `giris`;
CREATE TABLE `giris` (
  `Id` varchar(16) NOT NULL,
  `Sifre` varchar(16) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `giris`
--

/*!40000 ALTER TABLE `giris` DISABLE KEYS */;
INSERT INTO `giris` (`Id`,`Sifre`) VALUES 
 ('admin','admin');
/*!40000 ALTER TABLE `giris` ENABLE KEYS */;


--
-- Definition of table `kargobilgileri`
--

DROP TABLE IF EXISTS `kargobilgileri`;
CREATE TABLE `kargobilgileri` (
  `KargoNo` varchar(10) NOT NULL,
  `SubeNo` int(10) unsigned NOT NULL,
  `Durum` varchar(45) NOT NULL,
  `Sure` int(10) unsigned NOT NULL,
  `Ucret` double NOT NULL,
  PRIMARY KEY (`KargoNo`) USING BTREE,
  CONSTRAINT `FK_kargobilgileri_1` FOREIGN KEY (`KargoNo`) REFERENCES `kargoislem` (`KargoNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kargobilgileri`
--

/*!40000 ALTER TABLE `kargobilgileri` DISABLE KEYS */;
INSERT INTO `kargobilgileri` (`KargoNo`,`SubeNo`,`Durum`,`Sure`,`Ucret`) VALUES 
 ('1001',53,'Dağıtımda',2,12.5),
 ('1002',54,'Araçta',2,10),
 ('1003',53,'Şubede',3,8);
/*!40000 ALTER TABLE `kargobilgileri` ENABLE KEYS */;


--
-- Definition of table `kargoislem`
--

DROP TABLE IF EXISTS `kargoislem`;
CREATE TABLE `kargoislem` (
  `TcNo` varchar(11) NOT NULL,
  `KargoNo` varchar(10) NOT NULL,
  `Agirlik` double NOT NULL,
  `En` double NOT NULL,
  `Boy` double NOT NULL,
  `Uzunluk` double NOT NULL,
  `GondericiAdres` varchar(45) NOT NULL,
  `AliciAdres` varchar(45) NOT NULL,
  PRIMARY KEY (`TcNo`,`KargoNo`) USING BTREE,
  KEY `FK_kargoislem_1` (`KargoNo`),
  CONSTRAINT `FK_kargoislem_2` FOREIGN KEY (`TcNo`) REFERENCES `musteri` (`TcNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kargoislem`
--

/*!40000 ALTER TABLE `kargoislem` DISABLE KEYS */;
INSERT INTO `kargoislem` (`TcNo`,`KargoNo`,`Agirlik`,`En`,`Boy`,`Uzunluk`,`GondericiAdres`,`AliciAdres`) VALUES 
 ('34121643241','5001',5,7,8,22,'fatih','toki'),
 ('34121643241','5002',4,5,5,2,'fatih','halikent'),
 ('34121643241','A100',3,10,20,10,'fatih','modern'),
 ('3413122565','5003',10,5,10,10,'Fatih','Zafer'),
 ('44563215698','B300',6.5,10,20,10,'fatih','modern'),
 ('45234568777','A600',3.2,10,20,5,'fatih','hizirbey');
/*!40000 ALTER TABLE `kargoislem` ENABLE KEYS */;


--
-- Definition of table `musteri`
--

DROP TABLE IF EXISTS `musteri`;
CREATE TABLE `musteri` (
  `TcNo` varchar(11) NOT NULL,
  `Ad` varchar(45) NOT NULL,
  `Soyad` varchar(45) NOT NULL,
  `TelNo` varchar(45) NOT NULL,
  `Adres` varchar(45) NOT NULL,
  `Sehir` varchar(45) NOT NULL,
  PRIMARY KEY (`TcNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `musteri`
--

/*!40000 ALTER TABLE `musteri` DISABLE KEYS */;
INSERT INTO `musteri` (`TcNo`,`Ad`,`Soyad`,`TelNo`,`Adres`,`Sehir`) VALUES 
 ('34121643241','Ahmet','Can','3467864322','Cankaya','Ankara'),
 ('34131225652','Ayse','Canli','5054212399','Sisli','İstanbul'),
 ('34141247876','Arda','Tetik','4682342134','Kecioren','Ankara'),
 ('35624897568','Cevahir','Kara','5065321134','Atatürk caddesi','İstanbul'),
 ('40412123654','Fatih','Semerci','5346421234','Sisli','İstanbul'),
 ('41412123654','İnanc','Temel','5351424234','Lara','Antalya'),
 ('44563215698','Mahsun','Ekin','4673244421','fatih','Isparta'),
 ('45234568777','Eyüp','Tunc','5433212456','Gebze','Kocaeli');
/*!40000 ALTER TABLE `musteri` ENABLE KEYS */;


--
-- Definition of table `sehir`
--

DROP TABLE IF EXISTS `sehir`;
CREATE TABLE `sehir` (
  `idsehir` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Alici` varchar(45) NOT NULL,
  `Gonderici` varchar(45) NOT NULL,
  `Mesafe` double NOT NULL,
  PRIMARY KEY (`idsehir`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sehir`
--

/*!40000 ALTER TABLE `sehir` DISABLE KEYS */;
INSERT INTO `sehir` (`idsehir`,`Alici`,`Gonderici`,`Mesafe`) VALUES 
 (1,'İstanbul','Ankara',453),
 (2,'İstanbul','İzmir',565),
 (3,'İstanbul','Antalya',724),
 (4,'İstanbul','Sivas',893),
 (5,'İstanbul','Malatya',1114),
 (6,'İstanbul','Trabzon',1083),
 (7,'Ankara','İzmir',579),
 (8,'Ankara','Antalya',544),
 (9,'Ankara','Sivas',442),
 (10,'Ankara','Malatya',661),
 (11,'Ankara','Trabzon',765),
 (12,'İzmir','Antalya',446),
 (13,'İzmir','Sivas',1021),
 (14,'İzmir','Malatya',1190),
 (15,'İzmir','Trabzon',1344),
 (16,'Antalya','Trabzon',1237),
 (17,'Antalya','Malatya',947),
 (18,'Antalya','Sivas',815),
 (19,'Sivas','Malatya',247),
 (20,'Sivas','Trabzon',422),
 (21,'Malatya','Trabzon',594),
 (22,'Isparta','Antalya',131),
 (23,'Isparta','Giresun',1023),
 (24,'Isparta','İzmir',408),
 (25,'Isparta','Adana',604),
 (26,'Isparta','Konya',267),
 (27,'Antalya','Isparta',131),
 (28,'Giresun','Isparta',1023),
 (29,'İzmir','Isparta',408),
 (30,'Adana','Isparta',604),
 (31,'Konya','Isparta',267),
 (32,'İstanbul','Roma',1749),
 (33,'İstanbul','Madrid',3539),
 (34,'İstanbul','Barselona',2942),
 (35,'İstanbul','Paris',2740),
 (36,'İstanbul','Berlin',2314),
 (37,'İstanbul','Bakü',2210),
 (38,'İstanbul','Moskava',2150),
 (39,'Roma','İstanbul',1749),
 (40,'Madrid','İstanbul',3539),
 (41,'İstanbul','Münih',1897),
 (42,'Münih','İstanbul',1897),
 (43,'Barselona','İstanbul',2942),
 (44,'Paris','İstanbul',2740),
 (45,'Berlin','İstanbul',2314),
 (46,'Bakü','İstanbul',2210),
 (47,'Moskova','İstanbul',2150),
 (48,'Isparta','Burdur',26),
 (49,'Burdur','Isparta',26),
 (50,'Ankara','İstanbul',453),
 (51,'İzmir','İstanbul',565),
 (52,'Antalya','İstanbul',724),
 (53,'Sivas','İstanbul',893),
 (54,'Malatya','İstanbul',1114),
 (55,'Trabzon','İstanbul',1083),
 (56,'İzmir','Ankara',579),
 (57,'Antalya','Ankara',544),
 (58,'Sivas','Ankara',442),
 (59,'Malatya','Ankara',661),
 (60,'Trabzon','İzmir',1344),
 (61,'Antalya','İzmir',446),
 (62,'Sivas','İzmir',1021),
 (63,'Malatya','İzmir',1190),
 (64,'Trabzon','İzmir',1344),
 (65,'Trabzon','Antalya',1237),
 (66,'Malatya','Antalya',947),
 (67,'Sivas','Antalya',815),
 (68,'Malatya','Sivas',247),
 (69,'Trabzon','Sivas',422),
 (70,'Trabzon','Malatya',594);
/*!40000 ALTER TABLE `sehir` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

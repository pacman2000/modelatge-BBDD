-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: culampolla
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.38-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `idSupplier` int(11) NOT NULL,
  `brand` varchar(45) NOT NULL,
  PRIMARY KEY (`brand`),
  KEY `fk_Brand_Supplier` (`idSupplier`),
  CONSTRAINT `fk_Brand_Supplier` FOREIGN KEY (`idSupplier`) REFERENCES `supplier` (`idSupplier`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Apolo'),(1,'Atenea'),(1,'Zeus'),(2,'London'),(2,'Paris'),(2,'Roma'),(3,'Azalea'),(3,'Tulipan');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `clientName` varchar(45) NOT NULL,
  `clientAdress` varchar(45) NOT NULL,
  `clientPhone` varchar(9) NOT NULL,
  `clientEmail` varchar(45) NOT NULL,
  `registerDate` date NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Pedro Picapiedra','Aragon 325','935550000','pedro@gmail.com','2020-01-15'),(2,'Maria Rocabruna','Diagonal 610','935551111','maria@gmail.com','2020-01-16'),(3,'Pablo Stevens','Llull 60','935552222','pablo@gmail.com','2020-01-18');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientinvoice`
--

DROP TABLE IF EXISTS `clientinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientinvoice` (
  `idInvoice` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) NOT NULL,
  PRIMARY KEY (`idInvoice`),
  KEY `fk_ClientInvoice_Client1_idx` (`idClient`),
  CONSTRAINT `fk_ClientInvoice_Client1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientinvoice`
--

LOCK TABLES `clientinvoice` WRITE;
/*!40000 ALTER TABLE `clientinvoice` DISABLE KEYS */;
INSERT INTO `clientinvoice` VALUES (1,1),(4,1),(2,2),(3,3);
/*!40000 ALTER TABLE `clientinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientrecommend`
--

DROP TABLE IF EXISTS `clientrecommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientrecommend` (
  `idClient` int(11) NOT NULL,
  `idClientRecommend` int(11) NOT NULL,
  KEY `fk_ClientRecommend_Client1_idx` (`idClient`),
  KEY `fk_ClientRecommend_Client2_idx` (`idClientRecommend`),
  CONSTRAINT `fk_ClientRecommend_Client1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ClientRecommend_Client2` FOREIGN KEY (`idClientRecommend`) REFERENCES `client` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientrecommend`
--

LOCK TABLES `clientrecommend` WRITE;
/*!40000 ALTER TABLE `clientrecommend` DISABLE KEYS */;
INSERT INTO `clientrecommend` VALUES (1,2),(2,3),(1,2),(2,3);
/*!40000 ALTER TABLE `clientrecommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `idEmployee` int(11) NOT NULL AUTO_INCREMENT,
  `employeeName` varchar(45) NOT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Marcos Ruiz'),(2,'Marta Gomez'),(3,'Luis Perez');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass`
--

DROP TABLE IF EXISTS `glass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glass` (
  `idGlass` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) NOT NULL,
  `idSupplier` int(11) NOT NULL,
  `rightGraduation` int(11) NOT NULL,
  `leftGraduation` int(11) NOT NULL,
  `frameType` varchar(45) NOT NULL,
  `frameColor` varchar(45) NOT NULL,
  `leftGlassColor` varchar(45) NOT NULL,
  `rightGlassColor` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`idGlass`),
  KEY `fk_Glass_Brand1_idx` (`brand`),
  CONSTRAINT `fk_Glass_Brand1` FOREIGN KEY (`brand`) REFERENCES `brand` (`brand`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass`
--

LOCK TABLES `glass` WRITE;
/*!40000 ALTER TABLE `glass` DISABLE KEYS */;
INSERT INTO `glass` VALUES (1,'Apolo',1,1,1,'pasta','negro','gris','gris',168),(2,'Atenea',1,0,0,'pasta','azul','gris','gris',175),(3,'London',2,0,0,'metalica','oro','transparente','transparente',112),(4,'Tulipan',3,1,1,'flotante','rojo','transparente','transparente',129);
/*!40000 ALTER TABLE `glass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `idInvoice` int(11) NOT NULL,
  `invoiceLine` varchar(2) NOT NULL,
  `idGlass` int(11) NOT NULL,
  `idEmployee` int(11) NOT NULL,
  KEY `fk_Invoice_Employee1_idx` (`idEmployee`),
  KEY `fk_Invoice_Glass1_idx` (`idGlass`),
  KEY `fk_Invoice_ClientInvoice1_idx` (`idInvoice`),
  CONSTRAINT `fk_Invoice_ClientInvoice1` FOREIGN KEY (`idInvoice`) REFERENCES `clientinvoice` (`idInvoice`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Employee1` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`idEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Glass1` FOREIGN KEY (`idGlass`) REFERENCES `glass` (`idGlass`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'1',1,1),(1,'2',2,1),(2,'1',3,2);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `idSupplier` int(11) NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(45) NOT NULL,
  `adressStreet` varchar(45) NOT NULL,
  `adressNumber` varchar(10) NOT NULL,
  `adressFloor` varchar(10) NOT NULL,
  `postalCode` varchar(5) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `phoneNumber` varchar(9) NOT NULL,
  `faxNumber` varchar(9) NOT NULL,
  `nif` varchar(9) NOT NULL,
  PRIMARY KEY (`idSupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Italian design S.P.A.','Via Rotino','3','---','44444','Roma','Italy','444444444','444444445','111111111'),(2,'Barcelona glasses S.A.','Gran Via','318','1','08008','Barcelona','Spain','933330000','933331111','A22222222'),(3,'Optics 3000','Sotomonte','68','bajos','43000','Sevilla','Spain','934440000','934441111','A33333333');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-13 19:40:32

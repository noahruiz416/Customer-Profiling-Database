-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `Customer_Consumption`
--

DROP TABLE IF EXISTS `Customer_Consumption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_Consumption` (
  `OrderID` int NOT NULL,
  `Service_Name` varchar(45) DEFAULT NULL,
  `Customer_ID` int NOT NULL,
  `Total_Cost` float DEFAULT NULL,
  `Date_Of_Trans` date NOT NULL,
  `Employee_ID` int NOT NULL,
  PRIMARY KEY (`OrderID`,`Date_Of_Trans`),
  KEY `fk_Customer_Consumption_Customers_idx` (`Customer_ID`),
  KEY `fk_CustomerConsumption_Employee_Info1_idx` (`Employee_ID`),
  CONSTRAINT `fk_Customer_Consumption_Customers` FOREIGN KEY (`Customer_ID`) REFERENCES `Customers_Info` (`Customer_ID`),
  CONSTRAINT `fk_CustomerConsumption_Employee_Info1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Info` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Consumption`
--

LOCK TABLES `Customer_Consumption` WRITE;
/*!40000 ALTER TABLE `Customer_Consumption` DISABLE KEYS */;
INSERT INTO `Customer_Consumption` VALUES (21,'Nails',1,12.35,'0001-01-20',11),(22,'Haircut',2,18.54,'0001-02-20',12),(23,'Nails',3,13,'0001-03-20',13);
/*!40000 ALTER TABLE `Customer_Consumption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Sentiment`
--

DROP TABLE IF EXISTS `Customer_Sentiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_Sentiment` (
  `Sentiment_ID` int NOT NULL,
  `Service_Rating` varchar(45) DEFAULT NULL,
  `Process_Rating` varchar(45) DEFAULT NULL,
  `Date_Trans` date DEFAULT NULL,
  `Employee_ID` int NOT NULL,
  PRIMARY KEY (`Sentiment_ID`),
  KEY `fk_Customer_Sentiment_Employee_Info1_idx` (`Employee_ID`),
  CONSTRAINT `fk_Customer_Sentiment_Employee_Info1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Info` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Sentiment`
--

LOCK TABLES `Customer_Sentiment` WRITE;
/*!40000 ALTER TABLE `Customer_Sentiment` DISABLE KEYS */;
INSERT INTO `Customer_Sentiment` VALUES (4,'4','2','2020-01-01',11),(5,'3','5','2020-01-02',12),(6,'2','2','2020-01-02',13);
/*!40000 ALTER TABLE `Customer_Sentiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers_Info`
--

DROP TABLE IF EXISTS `Customers_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers_Info` (
  `Customer_ID` int NOT NULL,
  `Customer_Address` varchar(45) DEFAULT NULL,
  `First_Name` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  `Middle_Initial` varchar(45) DEFAULT NULL,
  `Pro_Nouns` varchar(45) DEFAULT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers_Info`
--

LOCK TABLES `Customers_Info` WRITE;
/*!40000 ALTER TABLE `Customers_Info` DISABLE KEYS */;
INSERT INTO `Customers_Info` VALUES (1,'1234 Bob Way','Person','One','K','He','1234567891','Phoenix','AZ','United States'),(2,'5678 Drive Dr','Person','Two','J','She','9876543212','Chandler','AZ','Untied States'),(3,'1823 Elk Way','Person ','Three','S','Them','9854325436','Mesa','AZ','Untied States');
/*!40000 ALTER TABLE `Customers_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Info`
--

DROP TABLE IF EXISTS `Employee_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee_Info` (
  `Employee_ID` int NOT NULL,
  `Employee_First_Name` varchar(45) DEFAULT NULL,
  `Employee_Last_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Info`
--

LOCK TABLES `Employee_Info` WRITE;
/*!40000 ALTER TABLE `Employee_Info` DISABLE KEYS */;
INSERT INTO `Employee_Info` VALUES (11,'John','Doe'),(12,'Jane','Doe'),(13,'Billy','Joe');
/*!40000 ALTER TABLE `Employee_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices`
--

DROP TABLE IF EXISTS `Invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoices` (
  `Invoice_ID` int NOT NULL,
  `Date_Recieved` datetime DEFAULT NULL,
  `Payment_Method` varchar(45) DEFAULT NULL,
  `Invoice_Total` float DEFAULT NULL,
  `Customer_ID` int NOT NULL,
  PRIMARY KEY (`Invoice_ID`),
  KEY `fk_Invoices_Customers1_idx` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices`
--

LOCK TABLES `Invoices` WRITE;
/*!40000 ALTER TABLE `Invoices` DISABLE KEYS */;
INSERT INTO `Invoices` VALUES (31,'0001-02-20 00:00:00','Card',13.5,1),(32,'0001-03-20 00:00:00','Cash',19.2,2),(33,'0001-04-20 00:00:00','Cash',20.53,3);
/*!40000 ALTER TABLE `Invoices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-14 18:23:59

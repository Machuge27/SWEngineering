-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bills
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `bill_items`
--


DROP TABLE IF EXISTS `bill_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_items` (
  `BillItemID` int NOT NULL AUTO_INCREMENT,
  `BillID` int DEFAULT NULL,
  `ItemDescription` varchar(255) NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `LineTotal` decimal(10,2) GENERATED ALWAYS AS ((`Quantity` * `UnitPrice`)) STORED,
  PRIMARY KEY (`BillItemID`),
  KEY `BillID` (`BillID`),
  CONSTRAINT `bill_items_ibfk_1` FOREIGN KEY (`BillID`) REFERENCES `bills` (`BillID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_items`
--

LOCK TABLES `bill_items` WRITE;
/*!40000 ALTER TABLE `bill_items` DISABLE KEYS */;
INSERT INTO `bill_items` (`BillItemID`, `BillID`, `ItemDescription`, `Quantity`, `UnitPrice`) VALUES (1,1,'Laptop Repair',1,100.00),(2,1,'Subscription Fee',1,50.00),(3,2,'Internet Service',1,30.00),(4,2,'Maintenance Fee',1,70.00),(5,3,'Phone Repair',1,120.00),(6,3,'Consulting Service',1,60.00),(7,4,'Consulting Service',1,100.00),(8,4,'Laptop Repair',2,50.00),(9,5,'Subscription Fee',1,40.00),(10,5,'Internet Service',1,60.00),(11,6,'Phone Repair',1,110.00),(12,6,'Consulting Service',1,90.00),(13,7,'Laptop Repair',2,100.00),(14,7,'Subscription Fee',1,50.00),(15,8,'Internet Service',1,30.00),(16,8,'Consulting Service',1,60.00),(17,9,'Phone Repair',1,120.00),(18,9,'Laptop Repair',1,75.00),(19,10,'Internet Service',1,40.00),(20,10,'Subscription Fee',1,60.00),(21,11,'Consulting Service',1,80.00),(22,11,'Phone Repair',1,130.00),(23,12,'Internet Service',1,50.00),(24,12,'Consulting Service',1,90.00),(25,13,'Subscription Fee',1,45.00),(26,13,'Laptop Repair',1,95.00),(27,14,'Phone Repair',1,105.00),(28,14,'Consulting Service',1,75.00),(29,15,'Subscription Fee',1,50.00),(30,15,'Internet Service',1,60.00),(31,16,'Laptop Repair',1,110.00),(32,16,'Phone Repair',1,120.00),(33,17,'Consulting Service',1,85.00),(34,17,'Internet Service',1,55.00),(35,18,'Subscription Fee',1,40.00),(36,18,'Laptop Repair',1,100.00),(37,19,'Phone Repair',1,125.00),(38,19,'Internet Service',1,45.00),(39,20,'Consulting Service',1,70.00),(40,20,'Subscription Fee',1,50.00),(41,21,'Laptop Repair',1,90.00),(42,21,'Phone Repair',1,110.00),(43,22,'Internet Service',1,35.00),(44,22,'Consulting Service',1,80.00),(45,23,'Subscription Fee',1,45.00),(46,23,'Laptop Repair',1,95.00),(47,24,'Phone Repair',1,115.00),(48,24,'Consulting Service',1,60.00),(49,25,'Laptop Repair',1,100.00),(50,25,'Subscription Fee',1,55.00),(51,26,'Phone Repair',1,130.00),(52,26,'Internet Service',1,40.00),(53,27,'Consulting Service',1,85.00),(54,27,'Laptop Repair',1,105.00),(55,28,'Subscription Fee',1,50.00),(56,28,'Internet Service',1,50.00),(57,29,'Phone Repair',1,120.00),(58,29,'Consulting Service',1,75.00),(59,30,'Laptop Repair',1,95.00),(60,30,'Subscription Fee',1,60.00),(61,31,'Internet Service',1,45.00),(62,31,'Phone Repair',1,100.00),(63,32,'Laptop Repair',1,110.00),(64,32,'Consulting Service',1,85.00),(65,33,'Subscription Fee',1,60.00),(66,33,'Phone Repair',1,125.00),(67,34,'Laptop Repair',1,90.00),(68,34,'Internet Service',1,55.00),(69,35,'Consulting Service',1,70.00),(70,35,'Subscription Fee',1,50.00),(71,36,'Phone Repair',1,130.00),(72,36,'Laptop Repair',1,100.00),(73,37,'Consulting Service',1,75.00),(74,37,'Internet Service',1,60.00),(75,38,'Subscription Fee',1,45.00),(76,38,'Laptop Repair',1,80.00),(77,39,'Phone Repair',1,110.00),(78,39,'Consulting Service',1,90.00),(79,40,'Laptop Repair',1,100.00),(80,40,'Subscription Fee',1,50.00),(81,41,'Internet Service',1,40.00),(82,41,'Consulting Service',1,60.00),(83,42,'Phone Repair',1,120.00),(84,42,'Laptop Repair',1,95.00),(85,43,'Subscription Fee',1,55.00),(86,43,'Consulting Service',1,80.00),(87,44,'Internet Service',1,50.00),(88,44,'Phone Repair',1,125.00),(89,45,'Laptop Repair',1,110.00),(90,45,'Subscription Fee',1,50.00),(91,46,'Consulting Service',1,70.00),(92,46,'Internet Service',1,60.00),(93,47,'Phone Repair',1,130.00),(94,47,'Laptop Repair',1,95.00),(95,48,'Consulting Service',1,75.00),(96,48,'Subscription Fee',1,50.00),(97,49,'Internet Service',1,40.00),(98,49,'Phone Repair',1,115.00),(99,50,'Laptop Repair',1,100.00),(100,50,'Subscription Fee',1,60.00);
/*!40000 ALTER TABLE `bill_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `BillID` int NOT NULL AUTO_INCREMENT,
  `CategoryID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `BillDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `Status` varchar(20) DEFAULT 'Unpaid',
  `DateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BillID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` (`BillID`, `CategoryID`, `CustomerID`, `BillDate`, `DueDate`, `TotalAmount`, `Status`, `DateCreated`) VALUES (1,1,1,'2024-11-01','2024-11-15',150.00,'Unpaid','2024-11-20 05:02:20'),(2,2,2,'2024-11-05','2024-11-20',200.00,'Paid','2024-11-20 05:02:20'),(3,3,3,'2024-10-10','2024-10-25',120.50,'Unpaid','2024-11-20 05:02:20'),(4,4,4,'2024-09-15','2024-09-30',250.75,'Paid','2024-11-20 05:02:20'),(5,5,5,'2024-11-03','2024-11-17',180.00,'Unpaid','2024-11-20 05:02:20'),(6,6,6,'2024-08-20','2024-09-05',210.50,'Paid','2024-11-20 05:02:20'),(7,7,7,'2024-07-25','2024-08-10',140.00,'Unpaid','2024-11-20 05:02:20'),(8,8,8,'2024-06-15','2024-06-30',170.00,'Paid','2024-11-20 05:02:20'),(9,9,9,'2024-05-01','2024-05-15',190.00,'Unpaid','2024-11-20 05:02:20'),(10,10,10,'2024-04-10','2024-04-25',250.00,'Paid','2024-11-20 05:02:20'),(11,11,11,'2024-11-01','2024-11-15',160.00,'Unpaid','2024-11-20 05:02:20'),(12,12,12,'2024-10-05','2024-10-20',180.00,'Paid','2024-11-20 05:02:20'),(13,13,13,'2024-09-01','2024-09-15',220.00,'Unpaid','2024-11-20 05:02:20'),(14,14,14,'2024-08-10','2024-08-25',130.00,'Paid','2024-11-20 05:02:20'),(15,15,15,'2024-11-02','2024-11-16',190.00,'Unpaid','2024-11-20 05:02:20'),(16,16,16,'2024-07-15','2024-07-30',160.00,'Paid','2024-11-20 05:02:20'),(17,17,17,'2024-06-01','2024-06-15',240.00,'Unpaid','2024-11-20 05:02:20'),(18,18,18,'2024-05-20','2024-06-05',210.00,'Paid','2024-11-20 05:02:20'),(19,19,19,'2024-04-01','2024-04-15',180.00,'Unpaid','2024-11-20 05:02:20'),(20,20,20,'2024-03-10','2024-03-25',220.00,'Paid','2024-11-20 05:02:20'),(21,21,21,'2024-11-01','2024-11-15',150.50,'Unpaid','2024-11-20 05:02:20'),(22,22,22,'2024-10-05','2024-10-20',200.00,'Paid','2024-11-20 05:02:20'),(23,23,23,'2024-09-01','2024-09-15',250.00,'Unpaid','2024-11-20 05:02:20'),(24,24,24,'2024-08-10','2024-08-25',170.00,'Paid','2024-11-20 05:02:20'),(25,25,25,'2024-11-02','2024-11-16',180.00,'Unpaid','2024-11-20 05:02:20'),(26,26,26,'2024-07-15','2024-07-30',190.00,'Paid','2024-11-20 05:02:20'),(27,27,27,'2024-06-01','2024-06-15',210.00,'Unpaid','2024-11-20 05:02:20'),(28,28,28,'2024-05-20','2024-06-05',250.00,'Paid','2024-11-20 05:02:20'),(29,29,29,'2024-04-01','2024-04-15',240.00,'Unpaid','2024-11-20 05:02:20'),(30,30,30,'2024-03-10','2024-03-25',220.00,'Paid','2024-11-20 05:02:20'),(31,1,31,'2024-11-01','2024-11-15',160.00,'Unpaid','2024-11-20 05:02:20'),(32,2,32,'2024-10-05','2024-10-20',200.00,'Paid','2024-11-20 05:02:20'),(33,3,33,'2024-09-01','2024-09-15',250.00,'Unpaid','2024-11-20 05:02:20'),(34,4,34,'2024-08-10','2024-08-25',170.00,'Paid','2024-11-20 05:02:20'),(35,5,35,'2024-11-02','2024-11-16',180.00,'Unpaid','2024-11-20 05:02:20'),(36,6,36,'2024-07-15','2024-07-30',190.00,'Paid','2024-11-20 05:02:20'),(37,7,37,'2024-06-01','2024-06-15',210.00,'Unpaid','2024-11-20 05:02:20'),(38,8,38,'2024-05-20','2024-06-05',250.00,'Paid','2024-11-20 05:02:20'),(39,9,39,'2024-04-01','2024-04-15',240.00,'Unpaid','2024-11-20 05:02:20'),(40,10,40,'2024-03-10','2024-03-25',220.00,'Paid','2024-11-20 05:02:20'),(41,11,41,'2024-11-01','2024-11-15',150.00,'Unpaid','2024-11-20 05:02:20'),(42,12,42,'2024-10-05','2024-10-20',200.00,'Paid','2024-11-20 05:02:20'),(43,13,43,'2024-09-01','2024-09-15',220.00,'Unpaid','2024-11-20 05:02:20'),(44,14,44,'2024-08-10','2024-08-25',170.00,'Paid','2024-11-20 05:02:20'),(45,15,45,'2024-11-02','2024-11-16',180.00,'Unpaid','2024-11-20 05:02:20'),(46,16,46,'2024-07-15','2024-07-30',190.00,'Paid','2024-11-20 05:02:20'),(47,17,47,'2024-06-01','2024-06-15',210.00,'Unpaid','2024-11-20 05:02:20'),(48,18,48,'2024-05-20','2024-06-05',250.00,'Paid','2024-11-20 05:02:20'),(49,19,49,'2024-04-01','2024-04-15',240.00,'Unpaid','2024-11-20 05:02:20'),(50,20,50,'2024-03-10','2024-03-25',220.00,'Paid','2024-11-20 05:02:20');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categoryID` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`categoryID`, `categoryName`) VALUES (1,'Lunch'),(2,'Fees'),(3,'Repair'),(4,'Utilities'),(5,'Electricity'),(6,'Water'),(7,'Gas'),(8,'Internet'),(9,'Phone'),(10,'Rent'),(11,'Insurance'),(12,'Transportation'),(13,'Subscriptions'),(14,'Maintenance'),(15,'Groceries'),(16,'Medical'),(17,'Tax'),(18,'Legal Fees'),(19,'Education'),(20,'Bank Charges'),(21,'Loans'),(22,'Credit Card Payments'),(23,'Entertainment'),(24,'Travel'),(25,'Fitness'),(26,'Cleaning Services'),(27,'Property Tax'),(28,'Streaming Services'),(29,'Office Supplies'),(30,'Mobile Plans'),(31,'Parking'),(32,'Childcare'),(33,'Pet Care');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(11) DEFAULT NULL,
  `customerAddress` varchar(20) DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`customerID`, `customerName`, `email`, `phoneNumber`, `customerAddress`, `dateCreated`) VALUES (1,'Alice Johnson','alice.johnson@example.com','0712345678','Nairobi','2024-11-20 04:56:04'),(2,'Bob Smith','bob.smith@example.com','0723456789','Mombasa','2024-11-20 04:56:04'),(3,'Charlie Brown','charlie.brown@example.com','0734567890','Kisumu','2024-11-20 04:56:04'),(4,'David Williams','david.williams@example.com','0745678901','Nakuru','2024-11-20 04:56:04'),(5,'Eva Martinez','eva.martinez@example.com','0756789012','Eldoret','2024-11-20 04:56:04'),(6,'Frank Miller','frank.miller@example.com','0767890123','Thika','2024-11-20 04:56:04'),(7,'Grace Wilson','grace.wilson@example.com','0778901234','Machakos','2024-11-20 04:56:04'),(8,'Harry Taylor','harry.taylor@example.com','0789012345','Nyeri','2024-11-20 04:56:04'),(9,'Ivy Anderson','ivy.anderson@example.com','0790123456','Kiambu','2024-11-20 04:56:04'),(10,'Jack Thomas','jack.thomas@example.com','0801234567','Murang\'a','2024-11-20 04:56:04'),(11,'Karen Moore','karen.moore@example.com','0812345678','Kitui','2024-11-20 04:56:04'),(12,'Leo Clark','leo.clark@example.com','0823456789','Bomet','2024-11-20 04:56:04'),(13,'Mona White','mona.white@example.com','0834567890','Nandi','2024-11-20 04:56:04'),(14,'Nina Harris','nina.harris@example.com','0845678901','Embu','2024-11-20 04:56:04'),(15,'Oscar Lewis','oscar.lewis@example.com','0856789012','Voi','2024-11-20 04:56:04'),(16,'Pamela Young','pamela.young@example.com','0867890123','Malindi','2024-11-20 04:56:04'),(17,'Quincy King','quincy.king@example.com','0878901234','Garissa','2024-11-20 04:56:04'),(18,'Rachel Scott','rachel.scott@example.com','0889012345','Lamu','2024-11-20 04:56:04'),(19,'Sam Parker','sam.parker@example.com','0890123456','Narok','2024-11-20 04:56:04'),(20,'Tina Adams','tina.adams@example.com','0901234567','Wajir','2024-11-20 04:56:04'),(21,'Ursula Phillips','ursula.phillips@example.com','0912345678','Isiolo','2024-11-20 04:56:04'),(22,'Victor Robinson','victor.robinson@example.com','0923456789','Kajiado','2024-11-20 04:56:04'),(23,'Wendy Green','wendy.green@example.com','0934567890','Kisii','2024-11-20 04:56:04'),(24,'Xander Nelson','xander.nelson@example.com','0945678901','Homa Bay','2024-11-20 04:56:04'),(25,'Yvonne Carter','yvonne.carter@example.com','0956789012','Kwale','2024-11-20 04:56:04'),(26,'Zane Mitchell','zane.mitchell@example.com','0967890123','Bungoma','2024-11-20 04:56:04'),(27,'Amelia Harris','amelia.harris@example.com','0978901234','Mombasa','2024-11-20 04:56:04'),(28,'Benjamin James','benjamin.james@example.com','0989012345','Kisumu','2024-11-20 04:56:04'),(29,'Chloe Walker','chloe.walker@example.com','0990123456','Nakuru','2024-11-20 04:56:04'),(30,'Daniel Scott','daniel.scott@example.com','1001234567','Nairobi','2024-11-20 04:56:04'),(31,'Ella Turner','ella.turner@example.com','1012345678','Eldoret','2024-11-20 04:56:04'),(32,'Finn Roberts','finn.roberts@example.com','1023456789','Thika','2024-11-20 04:56:04'),(33,'Gina Lee','gina.lee@example.com','1034567890','Machakos','2024-11-20 04:56:04'),(34,'Harry White','harry.white@example.com','1045678901','Kiambu','2024-11-20 04:56:04'),(35,'Isabel Evans','isabel.evans@example.com','1056789012','Murang\'a','2024-11-20 04:56:04'),(36,'Jake Davis','jake.davis@example.com','1067890123','Kitui','2024-11-20 04:56:04'),(37,'Lily Harris','lily.harris@example.com','1078901234','Bomet','2024-11-20 04:56:04'),(38,'Mason King','mason.king@example.com','1089012345','Nandi','2024-11-20 04:56:04'),(39,'Nina Adams','nina.adams@example.com','1090123456','Embu','2024-11-20 04:56:04'),(40,'Olivia Johnson','olivia.johnson@example.com','1101234567','Voi','2024-11-20 04:56:04'),(41,'Paul Robinson','paul.robinson@example.com','1112345678','Malindi','2024-11-20 04:56:04'),(42,'Quinn Anderson','quinn.anderson@example.com','1123456789','Garissa','2024-11-20 04:56:04'),(43,'Ruby Mitchell','ruby.mitchell@example.com','1134567890','Lamu','2024-11-20 04:56:04'),(44,'Steve Clark','steve.clark@example.com','1145678901','Narok','2024-11-20 04:56:04'),(45,'Tess Morgan','tess.morgan@example.com','1156789012','Wajir','2024-11-20 04:56:04'),(46,'Uma Lee','uma.lee@example.com','1167890123','Isiolo','2024-11-20 04:56:04'),(47,'Vera Green','vera.green@example.com','1178901234','Kajiado','2024-11-20 04:56:04'),(48,'Will Turner','will.turner@example.com','1189012345','Kisii','2024-11-20 04:56:04'),(49,'Xena Robinson','xena.robinson@example.com','1190123456','Homa Bay','2024-11-20 04:56:04'),(50,'Yara Scott','yara.scott@example.com','1201234567','Kwale','2024-11-20 04:56:04'),(51,'Zara Thomas','zara.thomas@example.com','1212345678','Bungoma','2024-11-20 04:56:04');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `BillID` int DEFAULT NULL,
  `PaymentDate` date NOT NULL,
  `PaymentAmount` decimal(10,2) NOT NULL,
  `PaymentMethod` varchar(50) NOT NULL,
  `DateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentID`),
  KEY `BillID` (`BillID`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`BillID`) REFERENCES `bills` (`BillID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`PaymentID`, `BillID`, `PaymentDate`, `PaymentAmount`, `PaymentMethod`, `DateCreated`) VALUES (1,1,'2024-11-05',100.00,'Credit Card','2024-11-20 05:09:56'),(2,2,'2024-11-06',50.00,'MPESA','2024-11-20 05:09:56'),(3,3,'2024-11-07',120.00,'Cheque','2024-11-20 05:09:56'),(4,4,'2024-11-08',80.00,'Cash','2024-11-20 05:09:56'),(5,5,'2024-11-09',70.00,'MPESA','2024-11-20 05:09:56'),(6,6,'2024-11-10',90.00,'Credit Card','2024-11-20 05:09:56'),(7,7,'2024-11-11',100.00,'Cheque','2024-11-20 05:09:56'),(8,8,'2024-11-12',110.00,'Cash','2024-11-20 05:09:56'),(9,9,'2024-11-13',60.00,'MPESA','2024-11-20 05:09:56'),(10,10,'2024-11-14',55.00,'Credit Card','2024-11-20 05:09:56'),(11,11,'2024-11-15',85.00,'Cheque','2024-11-20 05:09:56'),(12,12,'2024-11-16',95.00,'Cash','2024-11-20 05:09:56'),(13,13,'2024-11-17',120.00,'MPESA','2024-11-20 05:09:56'),(14,14,'2024-11-18',100.00,'Credit Card','2024-11-20 05:09:56'),(15,15,'2024-11-19',75.00,'Cheque','2024-11-20 05:09:56'),(16,16,'2024-11-20',50.00,'Cash','2024-11-20 05:09:56'),(17,17,'2024-11-21',130.00,'MPESA','2024-11-20 05:09:56'),(18,18,'2024-11-22',105.00,'Credit Card','2024-11-20 05:09:56'),(19,19,'2024-11-23',110.00,'Cheque','2024-11-20 05:09:56'),(20,20,'2024-11-24',90.00,'Cash','2024-11-20 05:09:56'),(21,21,'2024-11-25',100.00,'MPESA','2024-11-20 05:09:56'),(22,22,'2024-11-26',120.00,'Credit Card','2024-11-20 05:09:56'),(23,23,'2024-11-27',80.00,'Cheque','2024-11-20 05:09:56'),(24,24,'2024-11-28',70.00,'Cash','2024-11-20 05:09:56'),(25,25,'2024-11-29',60.00,'MPESA','2024-11-20 05:09:56'),(26,26,'2024-11-30',50.00,'Credit Card','2024-11-20 05:09:56'),(27,27,'2024-12-01',110.00,'Cheque','2024-11-20 05:09:56'),(28,28,'2024-12-02',125.00,'Cash','2024-11-20 05:09:56'),(29,29,'2024-12-03',130.00,'MPESA','2024-11-20 05:09:56'),(30,30,'2024-12-04',95.00,'Credit Card','2024-11-20 05:09:56'),(31,31,'2024-12-05',75.00,'Cheque','2024-11-20 05:09:56'),(32,32,'2024-12-06',60.00,'Cash','2024-11-20 05:09:56'),(33,33,'2024-12-07',50.00,'MPESA','2024-11-20 05:09:56'),(34,34,'2024-12-08',55.00,'Credit Card','2024-11-20 05:09:56'),(35,35,'2024-12-09',85.00,'Cheque','2024-11-20 05:09:56'),(36,36,'2024-12-10',95.00,'Cash','2024-11-20 05:09:56'),(37,37,'2024-12-11',120.00,'MPESA','2024-11-20 05:09:56'),(38,38,'2024-12-12',100.00,'Credit Card','2024-11-20 05:09:56'),(39,39,'2024-12-13',90.00,'Cheque','2024-11-20 05:09:56'),(40,40,'2024-12-14',105.00,'Cash','2024-11-20 05:09:56'),(41,41,'2024-12-15',110.00,'MPESA','2024-11-20 05:09:56'),(42,42,'2024-12-16',120.00,'Credit Card','2024-11-20 05:09:56'),(43,43,'2024-12-17',80.00,'Cheque','2024-11-20 05:09:56'),(44,44,'2024-12-18',70.00,'Cash','2024-11-20 05:09:56'),(45,45,'2024-12-19',60.00,'MPESA','2024-11-20 05:09:56'),(46,46,'2024-12-20',50.00,'Credit Card','2024-11-20 05:09:56'),(47,47,'2024-12-21',110.00,'Cheque','2024-11-20 05:09:56'),(48,48,'2024-12-22',125.00,'Cash','2024-11-20 05:09:56'),(49,49,'2024-12-23',130.00,'MPESA','2024-11-20 05:09:56'),(50,50,'2024-12-24',95.00,'Credit Card','2024-11-20 05:09:56');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20  8:52:47
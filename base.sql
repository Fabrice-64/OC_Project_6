-- MySQL dump 10.13  Distrib 8.0.19, for osx10.15 (x86_64)
--
-- Host: localhost    Database: oc_pizza_ms
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `VAT_rateID` int NOT NULL,
  `current_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoryID`),
  KEY `VAT_rate_FK_idx` (`VAT_rateID`),
  CONSTRAINT `VAT_rate_FK` FOREIGN KEY (`VAT_rateID`) REFERENCES `VAT_rate` (`vat_rateID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deliverer`
--

DROP TABLE IF EXISTS `deliverer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverer` (
  `staffID` int unsigned NOT NULL,
  `assigned_vehicleID` int DEFAULT NULL,
  `job_title` varchar(45) NOT NULL DEFAULT 'deliverer',
  `on-delivery` enum('y','n') DEFAULT 'n',
  PRIMARY KEY (`staffID`),
  CONSTRAINT `FK_staffID_deliverer` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ebike`
--

DROP TABLE IF EXISTS `Ebike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ebike` (
  `serial_number` varchar(45) NOT NULL,
  `vehicleID` int unsigned NOT NULL,
  PRIMARY KEY (`serial_number`),
  KEY `FK_vehicleID_Ebike_idx` (`vehicleID`),
  CONSTRAINT `FK_vehicleID_Ebike` FOREIGN KEY (`vehicleID`) REFERENCES `vehicle` (`vehicleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Escooter`
--

DROP TABLE IF EXISTS `Escooter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Escooter` (
  `licenseplate` varchar(45) NOT NULL,
  `vehicleID` int unsigned NOT NULL,
  PRIMARY KEY (`licenseplate`),
  KEY `Fk_vehicleID_Escooter_idx` (`vehicleID`),
  CONSTRAINT `Fk_vehicleID_Escooter` FOREIGN KEY (`vehicleID`) REFERENCES `vehicle` (`vehicleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kitchen`
--

DROP TABLE IF EXISTS `kitchen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitchen` (
  `kitchenID` varchar(45) NOT NULL,
  `point_of_salesID` int NOT NULL,
  `oven_capacity` int unsigned NOT NULL,
  PRIMARY KEY (`kitchenID`),
  KEY `FK_point_of_salesID_kitchen` (`point_of_salesID`),
  CONSTRAINT `FK_point_of_salesID_kitchen` FOREIGN KEY (`point_of_salesID`) REFERENCES `point_of_sales` (`point_of_salesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `staffID` int unsigned NOT NULL,
  `jobtitle` varchar(45) DEFAULT 'manager',
  PRIMARY KEY (`staffID`),
  CONSTRAINT `FK_staffID_manager` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `margin_rate`
--

DROP TABLE IF EXISTS `margin_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `margin_rate` (
  `margin_rateID` int NOT NULL AUTO_INCREMENT,
  `margin_rate` decimal(6,3) unsigned NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`margin_rateID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item` (
  `menu_itemID` int NOT NULL AUTO_INCREMENT,
  `item_id` varchar(60) DEFAULT NULL,
  `available` enum('y','n') DEFAULT NULL,
  `gross_price` decimal(6,3) DEFAULT '0.000',
  `margin_rate` decimal(6,3) DEFAULT '0.000',
  `net_price_VAT_free` decimal(6,3) GENERATED ALWAYS AS ((`gross_price` * `margin_rate`)) STORED,
  `VAT_amount` decimal(6,3) GENERATED ALWAYS AS ((`net_price_VAT_free` * `VAT_rate`)) STORED,
  `net_price` decimal(6,3) GENERATED ALWAYS AS ((`net_price_VAT_free` + `VAT_amount`)) STORED,
  `VAT_rate` decimal(6,3) DEFAULT '0.000',
  PRIMARY KEY (`menu_itemID`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `sizeID` int NOT NULL,
  `receipe` text,
  `description` text,
  `picture` varchar(100) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `FK_pizza_sizeID_idx` (`sizeID`),
  CONSTRAINT `FK_pizza_sizeID` FOREIGN KEY (`sizeID`) REFERENCES `pizza_size` (`sizeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizza_ingredient`
--

DROP TABLE IF EXISTS `pizza_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_ingredient` (
  `product_code` varchar(13) NOT NULL,
  `pizza_name` varchar(60) NOT NULL,
  `quantity` decimal(6,3) DEFAULT '0.000',
  `unit_pc_g` enum('pc','g') DEFAULT NULL,
  PRIMARY KEY (`product_code`,`pizza_name`),
  KEY `FK_pizzaID_idx` (`pizza_name`),
  CONSTRAINT `FK_pizza_name` FOREIGN KEY (`pizza_name`) REFERENCES `pizza` (`name`),
  CONSTRAINT `FK_product_code` FOREIGN KEY (`product_code`) REFERENCES `product` (`product_code`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizza_size`
--

DROP TABLE IF EXISTS `pizza_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_size` (
  `size` enum('maxi','grande','normale') NOT NULL,
  `diameter` int NOT NULL,
  `sizeID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sizeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizzaiolo`
--

DROP TABLE IF EXISTS `pizzaiolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzaiolo` (
  `staffID` int unsigned NOT NULL,
  `job_title` varchar(45) DEFAULT 'pi',
  PRIMARY KEY (`staffID`),
  CONSTRAINT `FK_staffID_pizzaiolo` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `point_of_sales`
--

DROP TABLE IF EXISTS `point_of_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_of_sales` (
  `point_of_salesID` int NOT NULL AUTO_INCREMENT,
  `SIRET_number` varchar(14) DEFAULT NULL,
  `VAT_number` varchar(14) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zip_code` varchar(5) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `phone_number` varchar(18) DEFAULT NULL,
  `e_mail` varchar(45) GENERATED ALWAYS AS (concat(`city`,_utf8mb4'@OC_pizza.com')) VIRTUAL,
  PRIMARY KEY (`point_of_salesID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_product`
--

DROP TABLE IF EXISTS `pos_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_product` (
  `point_of_salesID` int NOT NULL,
  `product_code` varchar(60) NOT NULL,
  `qty_in_stock` int DEFAULT '0',
  PRIMARY KEY (`point_of_salesID`,`product_code`),
  KEY `FK_product_pos_product_idx` (`product_code`),
  CONSTRAINT `FK_pos_pos_product` FOREIGN KEY (`point_of_salesID`) REFERENCES `point_of_sales` (`point_of_salesID`) ON DELETE RESTRICT,
  CONSTRAINT `FK_product_pos_product` FOREIGN KEY (`product_code`) REFERENCES `product` (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_code` varchar(13) NOT NULL DEFAULT '0',
  `categoryID` int NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '0',
  `product_description` text,
  `pizza_ingredient` enum('y','n') NOT NULL DEFAULT 'n',
  `unit_weight_kg` decimal(6,3) DEFAULT '0.000',
  PRIMARY KEY (`product_code`),
  KEY `product_ibfk_1` (`categoryID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_item`
--

DROP TABLE IF EXISTS `product_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_item` (
  `date_in` date NOT NULL DEFAULT '2020-01-01',
  `product_code` varchar(13) NOT NULL DEFAULT '0',
  `quantity` int NOT NULL,
  `unit_cost` decimal(6,3) DEFAULT NULL,
  `point_of_salesID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`date_in`,`product_code`,`point_of_salesID`),
  KEY `product_item_ibfk_1` (`product_code`),
  KEY `point_of_sales_idx` (`point_of_salesID`),
  CONSTRAINT `product_item_ibfk_1` FOREIGN KEY (`product_code`) REFERENCES `product` (`product_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `product_typeID` int NOT NULL AUTO_INCREMENT,
  `product_type` enum('pizza','alc drink','soft drink','other') DEFAULT NULL,
  PRIMARY KEY (`product_typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffID` int unsigned NOT NULL AUTO_INCREMENT,
  `point_of_salesID` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `private_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  KEY `FK_point_sales_staff` (`point_of_salesID`),
  CONSTRAINT `FK_point_sales_staff` FOREIGN KEY (`point_of_salesID`) REFERENCES `point_of_sales` (`point_of_salesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VAT_rate`
--

DROP TABLE IF EXISTS `VAT_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VAT_rate` (
  `vat_rateID` int NOT NULL AUTO_INCREMENT,
  `VAT_rate` decimal(8,4) NOT NULL,
  PRIMARY KEY (`vat_rateID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vehicleID` int unsigned NOT NULL AUTO_INCREMENT,
  `point_of_salesID` int NOT NULL,
  `operational_status` enum('OK','NOK') DEFAULT 'OK',
  PRIMARY KEY (`vehicleID`),
  KEY `FK_point_of_salesID_vehicle` (`point_of_salesID`),
  CONSTRAINT `FK_point_of_salesID_vehicle` FOREIGN KEY (`point_of_salesID`) REFERENCES `point_of_sales` (`point_of_salesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-11  8:49:15

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
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Boissons Alcooliques',3,'alc drink'),(2,'Boissons non alcooliques vendues dans des contenants permettant leur conservation',1,'non alc drink'),(3,'Produits préparés chez le traiteur vendus à emporter ou à livrer dont Pizzas',1,'pizza'),(4,'Produits livrés destinés à une consommation immédiate',2,NULL),(5,'Glaces conditionnées non destinées à une consommation immédiate',2,'ice cream'),(6,'pizzas, quiches, etc., destinés à une consommation immédiate',2,'ready to eat');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `e_mail` varchar(45) DEFAULT NULL,
  `phone_number` varchar(10) NOT NULL,
  `fidelity_points` int DEFAULT '0',
  `customer_login` varchar(46) GENERATED ALWAYS AS (concat(`first_name`,`last_name`,right(`phone_number`,4))) VIRTUAL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_login_UNIQUE` (`customer_login`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `e_mail`, `phone_number`, `fidelity_points`, `password`) VALUES (4,'Fabrice','Jaouen','fab.jaouen@gmail.com','0689436465',0,NULL),(5,'Allan','Neo','alneo@gmail.com','1472583690',0,NULL),(6,'Gus','Montauban','gusmontau@gmail.com','9876543210',0,'test');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverer`
--

DROP TABLE IF EXISTS `deliverer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverer` (
  `staffID` int unsigned NOT NULL,
  `assigned_vehicleID` int unsigned DEFAULT NULL,
  `job_title` varchar(45) NOT NULL DEFAULT 'deliverer',
  `on-delivery` enum('y','n') DEFAULT 'n',
  PRIMARY KEY (`staffID`),
  KEY `FK_vehicleID_deliverer_idx` (`assigned_vehicleID`),
  CONSTRAINT `FK_staffID_deliverer` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`),
  CONSTRAINT `FK_vehicleID_deliverer` FOREIGN KEY (`assigned_vehicleID`) REFERENCES `vehicle` (`vehicleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverer`
--

LOCK TABLES `deliverer` WRITE;
/*!40000 ALTER TABLE `deliverer` DISABLE KEYS */;
INSERT INTO `deliverer` VALUES (2,NULL,'deliverer','n'),(4,NULL,'deliverer','n');
/*!40000 ALTER TABLE `deliverer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_address`
--

DROP TABLE IF EXISTS `delivery_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_address` (
  `delivery_addressID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `street` varchar(60) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  `access_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`delivery_addressID`),
  KEY `FK_customerID_delivery` (`customerID`),
  CONSTRAINT `FK_customerID_delivery` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_address`
--

LOCK TABLES `delivery_address` WRITE;
/*!40000 ALTER TABLE `delivery_address` DISABLE KEYS */;
INSERT INTO `delivery_address` VALUES (1,4,'Adolfstrasse 50','Bonn','53111','4e étage'),(2,5,'Sesame Street 12','Paris','75012','3e étage droite'),(3,6,'4 rue du cinéma','Paris','75012','');
/*!40000 ALTER TABLE `delivery_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directing_management`
--

DROP TABLE IF EXISTS `directing_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directing_management` (
  `directing_managementID` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`directing_managementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directing_management`
--

LOCK TABLES `directing_management` WRITE;
/*!40000 ALTER TABLE `directing_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `directing_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ebike`
--

DROP TABLE IF EXISTS `Ebike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ebike` (
  `vehicleID` int unsigned NOT NULL,
  `vehicle_type` varchar(45) DEFAULT 'EBike',
  `registration_number` varchar(45) DEFAULT 'N/A',
  PRIMARY KEY (`vehicleID`),
  KEY `FK_vehicleID_Ebike_idx` (`vehicleID`),
  CONSTRAINT `FK_vehicleID_Ebike` FOREIGN KEY (`vehicleID`) REFERENCES `vehicle` (`vehicleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ebike`
--

LOCK TABLES `Ebike` WRITE;
/*!40000 ALTER TABLE `Ebike` DISABLE KEYS */;
INSERT INTO `Ebike` VALUES (8,'EBike','N/A');
/*!40000 ALTER TABLE `Ebike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Escooter`
--

DROP TABLE IF EXISTS `Escooter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Escooter` (
  `vehicleID` int unsigned NOT NULL,
  `vehicle_type` varchar(45) NOT NULL DEFAULT 'EScooter',
  `registration_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vehicleID`),
  KEY `Fk_vehicleID_Escooter_idx` (`vehicleID`),
  CONSTRAINT `Fk_vehicleID_Escooter` FOREIGN KEY (`vehicleID`) REFERENCES `vehicle` (`vehicleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Escooter`
--

LOCK TABLES `Escooter` WRITE;
/*!40000 ALTER TABLE `Escooter` DISABLE KEYS */;
INSERT INTO `Escooter` VALUES (6,'EScooter','CE345RG');
/*!40000 ALTER TABLE `Escooter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_in_order`
--

DROP TABLE IF EXISTS `item_in_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_in_order` (
  `menu_itemID` int NOT NULL,
  `serial_number` int NOT NULL,
  `pizza_size` varchar(45) NOT NULL DEFAULT '0' COMMENT 'Gives either the size of the pizza ordered by the customer or 0.\nUsed with a stored procedure to calculate the multiplication ratio in order to include the various sizes of the pizzas.',
  `applicable_ratio` decimal(6,3) NOT NULL DEFAULT '1.000',
  `item_quantity` int NOT NULL DEFAULT '0',
  `unit_price_no_vat` decimal(6,3) NOT NULL DEFAULT '0.000',
  `unit_vat_amount` decimal(6,3) DEFAULT NULL,
  `line_vat_amount` decimal(6,3) GENERATED ALWAYS AS (((`unit_vat_amount` * `applicable_ratio`) * `item_quantity`)) STORED,
  `line_price_no_vat` decimal(6,3) GENERATED ALWAYS AS (((`unit_price_no_vat` * `applicable_ratio`) * `item_quantity`)) STORED,
  `line_net_price` decimal(6,3) GENERATED ALWAYS AS ((`line_vat_amount` + `line_price_no_vat`)) STORED,
  PRIMARY KEY (`menu_itemID`,`serial_number`,`pizza_size`),
  KEY `FK_order_serial_number_item_in_order_idx` (`serial_number`),
  CONSTRAINT `FK_menu_itemID_item_in_order` FOREIGN KEY (`menu_itemID`) REFERENCES `menu_item` (`menu_itemID`),
  CONSTRAINT `FK_order_serial_number_item_in_order` FOREIGN KEY (`serial_number`) REFERENCES `purchase_order` (`serial_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_in_order`
--

LOCK TABLES `item_in_order` WRITE;
/*!40000 ALTER TABLE `item_in_order` DISABLE KEYS */;
INSERT INTO `item_in_order` (`menu_itemID`, `serial_number`, `pizza_size`, `applicable_ratio`, `item_quantity`, `unit_price_no_vat`, `unit_vat_amount`) VALUES (372,8,'maxi',1.800,1,6.600,0.363),(373,7,'N/A',1.000,2,3.900,0.780),(374,8,'N/A',1.000,4,0.660,0.036),(380,7,'normale',1.000,2,6.660,0.366);
/*!40000 ALTER TABLE `item_in_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pos`
--

DROP TABLE IF EXISTS `item_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pos` (
  `point_of_salesID` int NOT NULL,
  `menu_itemID` int NOT NULL,
  `available_in_pos` enum('y','n') DEFAULT NULL,
  PRIMARY KEY (`point_of_salesID`,`menu_itemID`),
  KEY `FK_menu_item_item_pos` (`menu_itemID`),
  CONSTRAINT `FK_menu_item_item_pos` FOREIGN KEY (`menu_itemID`) REFERENCES `menu_item` (`menu_itemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pos_item_pos` FOREIGN KEY (`point_of_salesID`) REFERENCES `point_of_sales` (`point_of_salesID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pos`
--

LOCK TABLES `item_pos` WRITE;
/*!40000 ALTER TABLE `item_pos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `kitchen`
--

LOCK TABLES `kitchen` WRITE;
/*!40000 ALTER TABLE `kitchen` DISABLE KEYS */;
/*!40000 ALTER TABLE `kitchen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `staffID` int unsigned NOT NULL,
  `job_title` varchar(45) DEFAULT 'manager',
  PRIMARY KEY (`staffID`),
  CONSTRAINT `FK_staffID_manager` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'manager');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `margin_rate`
--

LOCK TABLES `margin_rate` WRITE;
/*!40000 ALTER TABLE `margin_rate` DISABLE KEYS */;
INSERT INTO `margin_rate` VALUES (1,1.000),(2,1.400),(3,1.800),(4,2.200),(5,2.600);
/*!40000 ALTER TABLE `margin_rate` ENABLE KEYS */;
UNLOCK TABLES;

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
  `net_price` decimal(6,3) GENERATED ALWAYS AS (round((`net_price_VAT_free` + `VAT_amount`),2)) STORED,
  `VAT_rate` decimal(6,3) DEFAULT '0.000',
  PRIMARY KEY (`menu_itemID`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` (`menu_itemID`, `item_id`, `available`, `gross_price`, `margin_rate`, `VAT_rate`) VALUES (372,'pizza Calzone','n',3.000,2.200,0.055),(373,'2113','n',1.500,2.600,0.200),(374,'681','y',0.300,2.200,0.055),(380,'pizza reine','y',3.700,1.800,0.055);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `serial_number` int NOT NULL,
  `payment_completed` enum('y','n') NOT NULL DEFAULT 'n',
  `designatedPoSID` int NOT NULL DEFAULT '0',
  `effective_delivery_hour` datetime DEFAULT NULL,
  `order_status` enum('pending','accepted','rejected','in preparation','ready','on delivery','terminated') DEFAULT 'pending',
  PRIMARY KEY (`serial_number`),
  KEY `FK_PoSID_point_of_sales_idx` (`designatedPoSID`),
  CONSTRAINT `FK_designatedPoS_order_status` FOREIGN KEY (`designatedPoSID`) REFERENCES `point_of_sales` (`point_of_salesID`),
  CONSTRAINT `FK_serial_number_order_status` FOREIGN KEY (`serial_number`) REFERENCES `purchase_order` (`serial_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (7,'n',1,NULL,'pending'),(8,'n',1,NULL,'pending');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_number` int NOT NULL AUTO_INCREMENT,
  `order_serial_number` int NOT NULL,
  `operatorID` int unsigned NOT NULL DEFAULT '0',
  `customer_id` int NOT NULL,
  `payment_mode` enum('cash','card','online','lunch ticket') NOT NULL DEFAULT 'card',
  `amount` decimal(6,3) DEFAULT NULL,
  `bank_agreement` enum('yes','no','N/A') NOT NULL DEFAULT 'N/A',
  `effective_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_number`),
  KEY `FK_customerID_payment` (`customer_id`),
  KEY `FK_serial_number_payment_idx` (`order_serial_number`),
  CONSTRAINT `FK_customerID_payment` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `FK_serial_number_payment` FOREIGN KEY (`order_serial_number`) REFERENCES `order_status` (`serial_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (10,7,2,4,'card',23.400,'N/A','2020-06-13 19:43:01'),(11,8,3,5,'cash',15.300,'N/A','2020-06-13 19:43:26');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (3,'Dans cet ordre: ricotta, anchois, olives, mozzarella','Attention, pas de sauce tomate, étaler de la ricotta à la place','https://1drv.ms/u/s!Aqs32d4xc9fslGgpMhsOTZSX7w5H','Pizza Anchois'),(3,'Penser à fermer la pizza avec de l\'oeuf','Pizza repliée en deux, forme un chausson','https://1drv.ms/u/s!Aqs32d4xc9fslGZ7ZJ0m_d4lfZa5?e=vSIYvg','Pizza Calzone'),(3,'Dans l\' ordre: sauce tomate, Olives, Mozzarella, Basilic','Tranches fines de mozzarella recouvrant la pizza. Veiller à une répartition esthétique du basilic','https://1drv.ms/u/s!Aqs32d4xc9fslGeYEZFe-YaIMJJ9','Pizza Margherita'),(3,'Disposer dans cet ordre: pulpe de tomate, champignons, jambon, mozzarella, olives','Doit donner une impression de symétrie','https://1drv.ms/u/s!Aqs32d4xc9fslGp3s9gEqdWVKWHq?e=6KgYMJ','pizza reine');
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pizza_ingredient`
--

LOCK TABLES `pizza_ingredient` WRITE;
/*!40000 ALTER TABLE `pizza_ingredient` DISABLE KEYS */;
INSERT INTO `pizza_ingredient` VALUES ('14403','pizza calzone',150.000,'g'),('14403','pizza reine',100.000,'g'),('15545','Pizza Anchois',6.000,'pc'),('15545','pizza calzone',6.000,'pc'),('15545','Pizza Margherita',6.000,'pc'),('15545','pizza reine',12.000,'pc'),('16613','Pizza Margherita',100.000,'g'),('16613','pizza reine',100.000,'g'),('41405','Pizza Anchois',8.000,'pc'),('48099','pizza calzone',100.000,'g'),('48099','Pizza Margherita',125.000,'g'),('48099','pizza reine',125.000,'g'),('48787','pizza calzone',125.000,'g'),('48787','pizza reine',50.000,'g'),('71760','Pizza Margherita',10.000,'g'),('71760','pizza reine',30.000,'g'),('80280','pizza calzone',60.000,'g'),('80718','pizza calzone',1.000,'pc'),('80784','Pizza Anchois',250.000,'g'),('81913','Pizza Anchois',1.000,'pc');
/*!40000 ALTER TABLE `pizza_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pizza_size`
--

LOCK TABLES `pizza_size` WRITE;
/*!40000 ALTER TABLE `pizza_size` DISABLE KEYS */;
INSERT INTO `pizza_size` VALUES ('grande',24,1),('maxi',36,2),('normale',20,3);
/*!40000 ALTER TABLE `pizza_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzaiolo`
--

DROP TABLE IF EXISTS `pizzaiolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzaiolo` (
  `staffID` int unsigned NOT NULL,
  `job_title` varchar(45) DEFAULT 'pizzaïolo',
  PRIMARY KEY (`staffID`),
  CONSTRAINT `FK_staffID_pizzaiolo` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzaiolo`
--

LOCK TABLES `pizzaiolo` WRITE;
/*!40000 ALTER TABLE `pizzaiolo` DISABLE KEYS */;
INSERT INTO `pizzaiolo` VALUES (3,'pizzaïolo'),(5,'pizzaïolo');
/*!40000 ALTER TABLE `pizzaiolo` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `point_of_sales`
--

LOCK TABLES `point_of_sales` WRITE;
/*!40000 ALTER TABLE `point_of_sales` DISABLE KEYS */;
INSERT INTO `point_of_sales` (`point_of_salesID`, `SIRET_number`, `VAT_number`, `city`, `zip_code`, `street`, `phone_number`) VALUES (1,'142533688885','FR11345666','Paris','75007','4 Rue des Abbesses','01 02 13 14 10');
/*!40000 ALTER TABLE `point_of_sales` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pos_product`
--

LOCK TABLES `pos_product` WRITE;
/*!40000 ALTER TABLE `pos_product` DISABLE KEYS */;
INSERT INTO `pos_product` VALUES (1,'2113',64),(1,'681',57),(1,'71337',48),(1,'71339',49),(1,'71760',2);
/*!40000 ALTER TABLE `pos_product` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('108',2,'Eau minérale pétillante Badoit Citron Vert','Eau Badoit Citron Vert par 33cl','n',0.000),('11704',3,'Bouteille d\'1l d\'huile d\'olives','Huile d\'Olive vierge Extra 1l','y',0.000),('1323',2,'Coca-Cola cannette','Coca-Cola cannette 33 cl','n',0.000),('14403',3,'Champignons de Paris','Champignon Hôtel en boite','y',0.000),('15545',3,'Olives Noires','Olive Noire Dénoyautée par 360g','y',0.000),('16613',3,'Pulpe de tomate','Pulpe de Tomates 8% matière sèche par 2,95kg','y',0.000),('2113',1,'Kronenbourg 1664','Bière Kronenbourg 1664 par 25cl','n',0.000),('2618',1,'Bière Carlsberg 33cl','Bière Carlsberg 33cl','n',0.000),('41405',3,'Anchois','Filets d\'anchois à l\'huile d\'olive par 580g','y',0.000),('48099',3,'Mozzarella','Mozzarella pin 1kg 23% MG','y',0.000),('48787',3,'Jambon Cuit','Jambon Cuit Standard DD 5 Kg','y',0.000),('681',2,'Bouteille cristaline 1/2l','Eau plate cristaline 50cl par 24','n',0.000),('71337',3,'Boule Pâte Normale','Boule Pâte à Pizza 160g','y',0.000),('71338',3,'Boule Pâte Grande','Boule de pâte à Pizza 200g','y',0.000),('71339',3,'Boule Pâte Maxi','Boule Pâte à Pizza 350g','y',0.000),('71760',3,'Basilic','Basilic Frais haché','y',0.000),('80280',3,'Emmental rapé','Emmental rapé Français 29% MG par 1kg','y',0.000),('80718',3,'Oeuf','Oeuf moyen alvéolé par 30pc','y',0.000),('80784',3,'Ricotta','Ricotta 6,5% MG 1,5kg/pc','y',0.000),('81913',3,'Mozzarella de Bufflone','Mozzarella di Buffala 22% MG','y',0.000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `FK_poSID_product_item` FOREIGN KEY (`point_of_salesID`) REFERENCES `point_of_sales` (`point_of_salesID`),
  CONSTRAINT `product_item_ibfk_1` FOREIGN KEY (`product_code`) REFERENCES `product` (`product_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_item`
--

LOCK TABLES `product_item` WRITE;
/*!40000 ALTER TABLE `product_item` DISABLE KEYS */;
INSERT INTO `product_item` VALUES ('2020-06-01','71337',30,0.500,1),('2020-06-08','2113',64,0.200,1),('2020-06-08','71337',12,0.400,1),('2020-06-08','71760',1,0.000,1),('2020-06-09','681',33,0.250,1),('2020-06-09','71760',1,0.000,1),('2020-06-10','681',12,0.250,1),('2020-06-11','681',12,0.250,1);
/*!40000 ALTER TABLE `product_item` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order` (
  `serial_number` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vat_amount` decimal(6,3) NOT NULL DEFAULT '0.000',
  `total_price_vat` decimal(6,3) DEFAULT '0.000',
  `requested_hour` datetime DEFAULT NULL,
  `delivery_addressID` int DEFAULT NULL,
  `purchase_validation` enum('y','n') NOT NULL DEFAULT 'n',
  `payment_time` enum('immediate','on delivery') NOT NULL DEFAULT 'immediate',
  `desired_pos` enum('Paris') DEFAULT NULL,
  `delivery_or_pos` enum('delivery','pos') NOT NULL DEFAULT 'delivery',
  PRIMARY KEY (`serial_number`),
  KEY `FK_customerID_order` (`customer_id`),
  CONSTRAINT `FK_customerID_order` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES (7,4,'2020-06-13 19:35:39',2.300,23.400,'2020-06-13 20:13:01',NULL,'y','on delivery','Paris','delivery'),(8,5,'2020-06-13 19:36:04',0.800,15.300,'2020-06-13 20:30:00',NULL,'y','on delivery','Paris','delivery'),(9,6,'2020-06-14 13:19:27',0.000,0.000,NULL,NULL,'n','immediate','Paris','delivery');
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

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
  `login` varchar(45) NOT NULL DEFAULT 'N/A',
  `password` varchar(100) NOT NULL DEFAULT 'N/A',
  PRIMARY KEY (`staffID`),
  KEY `FK_point_sales_staff` (`point_of_salesID`),
  CONSTRAINT `FK_point_sales_staff` FOREIGN KEY (`point_of_salesID`) REFERENCES `point_of_sales` (`point_of_salesID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,1,'Pierre','Dupont','1234567890','pierdupont@gmail.com','N/A','N/A'),(2,1,'Jean','Durand','0987654321','jeandurand@gmail.com','N/A','N/A'),(3,1,'Marcello','Dernet','8907654321','marceder@gmail.com','N/A','N/A'),(4,1,'Paul','Volfoni','1478523690','pvolfoni@audiard.com','N/A','N/A'),(5,1,'Raoul','Volfoni','3698521470','rvolfoni@audiard.com','N/A','N/A');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_task_order`
--

DROP TABLE IF EXISTS `staff_task_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_task_order` (
  `order_serial_number` int NOT NULL,
  `staffID` int unsigned NOT NULL,
  `staff_task` enum('picker','operator') NOT NULL,
  PRIMARY KEY (`order_serial_number`,`staffID`,`staff_task`),
  KEY `FK_staffID_staff_task_order_idx` (`staffID`),
  CONSTRAINT `FK_serial_number_order_status_staff_task` FOREIGN KEY (`order_serial_number`) REFERENCES `order_status` (`serial_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_staffID_staff_task_order` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_task_order`
--

LOCK TABLES `staff_task_order` WRITE;
/*!40000 ALTER TABLE `staff_task_order` DISABLE KEYS */;
INSERT INTO `staff_task_order` VALUES (7,1,'picker'),(7,2,'operator'),(8,2,'picker'),(8,3,'operator');
/*!40000 ALTER TABLE `staff_task_order` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `VAT_rate`
--

LOCK TABLES `VAT_rate` WRITE;
/*!40000 ALTER TABLE `VAT_rate` DISABLE KEYS */;
INSERT INTO `VAT_rate` VALUES (1,0.0550),(2,0.1000),(3,0.2000),(16,0.0210);
/*!40000 ALTER TABLE `VAT_rate` ENABLE KEYS */;
UNLOCK TABLES;

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
  `insurance_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vehicleID`),
  UNIQUE KEY `insurance_number_UNIQUE` (`insurance_number`),
  KEY `FK_point_of_salesID_vehicle` (`point_of_salesID`),
  CONSTRAINT `FK_point_of_salesID_vehicle` FOREIGN KEY (`point_of_salesID`) REFERENCES `point_of_sales` (`point_of_salesID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (6,1,'OK','21354688'),(8,1,'OK','2589631');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'oc_pizza_ms'
--
/*!50003 DROP FUNCTION IF EXISTS `ProportionCalc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ProportionCalc`(initial_value DECIMAL (6,3), pizza_diam DECIMAL(6,3),ref_pizza_diam DECIMAL (6,3)) RETURNS decimal(6,3)
    DETERMINISTIC
BEGIN
	DECLARE calc_value DECIMAL (6,3);
	SET calc_value = initial_value * (pizza_diam/ ref_pizza_diam);
RETURN calc_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddIngredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddIngredient`(
					ingredient_name VARCHAR(45), 
                    pizza_name VARCHAR(45), 
                    ingredient_quantity DECIMAL(6,3),
                    ingredient_unit ENUM('pc', 'g'))
BEGIN
	INSERT INTO pizza_ingredient (product_code, pizza_name, quantity, unit_pc_g)
    VALUES (
			(SELECT product_code FROM product where name = ingredient_name),
            (SELECT name FROM pizza where name = pizza_name),
            ingredient_quantity,
            ingredient_unit);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddItemToStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddItemToStock`(
			IN input_point_of_salesID INT,
			IN input_product_code VARCHAR(13), 
            IN input_date_in DATE, 
            IN input_quantity INT, 
            IN input_unit_cost DECIMAL (6,3))
BEGIN
	DECLARE total_quantity INT;

	INSERT 
		INTO product_item (point_of_salesID, product_code, date_in, quantity, unit_cost)
        VALUES (input_point_of_salesID,
				input_product_code, 
				input_date_in, 
                input_quantity, 
                input_unit_cost);
	
    SET total_quantity = (SELECT SUM(pi.quantity)
							FROM product_item pi
							WHERE pi.product_code = input_product_code);
	
	INSERT INTO pos_product (point_of_salesID, product_code, qty_in_stock)
	VALUES (input_point_of_salesID, input_product_code, total_quantity)
	ON DUPLICATE KEY UPDATE  qty_in_stock = total_quantity;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddMenuItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddMenuItem`(
							item_id VARCHAR(60),
                            set_gross_price DECIMAL(6,3),
                            pizza_bool ENUM('y','n'),
                            item_margin_rateID INT,
                            is_available ENUM('y', 'n'))
BEGIN
	DECLARE get_margin_rate DECIMAL(6,3);
    DECLARE get_vat_rate DECIMAL(6,3);
	
    SET get_margin_rate = (SELECT margin_rate FROM margin_rate mr 
						WHERE mr.margin_rateID = item_margin_rateID);
	
    IF pizza_bool = 'y' THEN
		SET get_vat_rate = (SELECT VAT_rate FROM VAT_rate vr
							JOIN category c ON vr.VAT_rateID = c.VAT_rateID
							WHERE c.current_name = 'pizza');
	ELSE
		SET get_vat_rate = (SELECT VAT_rate FROM VAT_rate vr 
							JOIN category c ON vr.VAT_rateID = c.VAT_rateID
							JOIN product p ON p.categoryID = c.categoryID
							WHERE product_code = item_id);
	END IF;
   
	INSERT IGNORE INTO menu_item (item_id, gross_price, margin_rate, vat_rate, available)
	VALUES(item_id, set_gross_price, get_margin_rate, get_vat_rate, is_available)
    ON DUPLICATE KEY UPDATE  gross_price = set_gross_price,
							margin_rate = get_margin_rate,
                            vat_rate = get_vat_rate,
                            available = is_available;
			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CallPizzaIngredients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CallPizzaIngredients`(
				IN var_pizza_name VARCHAR(60), IN req_pizza_size VARCHAR(60))
BEGIN
    DECLARE ref_pizza_diam INTEGER;
    DECLARE pizza_diam INTEGER;
    SET ref_pizza_diam = (SELECT diameter FROM pizza_size WHERE pizza_size.size = 'normale');
    SET pizza_diam = (SELECT diameter FROM pizza_size WHERE pizza_size.size = req_pizza_size);
    SELECT(
		SELECT name FROM product WHERE product.product_code = pizza_ingredient.product_code),
        ROUND(ProportionCalc(quantity, pizza_diam, ref_pizza_diam)) AS 'Portion Qty'
                
        FROM pizza_ingredient
        WHERE pizza_name = var_pizza_name;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CallPizzaReceipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CallPizzaReceipe`(IN pizza_name VARCHAR(60))
BEGIN
SELECT name, receipe, description, picture FROM pizza WHERE pizza.name = pizza_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CallPointOfSalesStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CallPointOfSalesStock`(
	IN point_of_sales_id INT)
BEGIN
	SELECT
		product_code,
        p.product_description,
        qty_in_stock
        FROM pos_product
        JOIN product p
        USING (product_code)
	WHERE pos_product.point_of_salesID = point_of_sales_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateCustomer`(
				IN input_first_name VARCHAR(45),
                IN input_last_name VARCHAR(45),
                IN input_e_mail VARCHAR(45),
                IN input_phone_number VARCHAR(10),
                -- Delivery Address
                IN input_street VARCHAR(60),
                IN input_city VARCHAR(45),
                IN input_zip_code VARCHAR(5),
                IN input_access_details VARCHAR(45),
                IN input_password VARCHAR(12))
BEGIN

	INSERT INTO customer (first_name,
						last_name,
						e_mail,
                        phone_number,
                        password)
	VALUES (input_first_name,
			input_last_name,
			input_e_mail,
            input_phone_number,
            input_password);
	
    INSERT INTO delivery_address (customerID,
								street,
                                city,
                                zip_code,
                                access_details)
	VALUES ((SELECT customer_id FROM customer c
			WHERE c.customer_login = concat(`input_first_name`,
											`input_last_name`,
                                            right(`input_phone_number`,4))),
			input_street,
            input_city,
            input_zip_code,
            input_access_details);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatePizza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreatePizza`(name VARCHAR(45), size ENUM('maxi', 'grande', 'normale'), receipe TEXT, description TEXT, picture_path VARCHAR(100))
BEGIN
INSERT INTO pizza (name, sizeID,receipe, description, picture)
	VALUES(name, (SELECT pizza_size.sizeID FROM pizza_size WHERE pizza_size.size = size) , receipe, description, picture_path);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateProduct`(
	IN product_code VARCHAR(13), 
	IN category_name ENUM('alc drink', 'non alc drink', 'pizza', 'ice cream', 'ready to eat'), 
    IN product_description TEXT, 
    IN name VARCHAR (200),
    IN pizza_ingredient ENUM('y', 'n'))
BEGIN
		INSERT 
		INTO product (product_code, categoryID, product_description, name, pizza_ingredient)
		VALUES (product_code, 
				(SELECT categoryID 
				FROM category 
                WHERE category.current_name = category_name), 
                product_description, 
                name, 
                pizza_ingredient);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DisplayDrinks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DisplayDrinks`()
BEGIN
	SELECT menu_itemID AS 'référence',
	(SELECT p.name FROM product p WHERE p.product_code = item_id) AS 'nom produit',
    CONCAT(net_price, ' €') AS 'prix net'
    FROM menu_item
    WHERE item_id NOT LIKE ('pizza%') AND available = 'y';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DisplayPizzas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DisplayPizzas`()
BEGIN
	SELECT 
		menu_itemID AS 'référence',
        (SELECT name FROM pizza WHERE menu_item.item_id = pizza.name) AS 'Votre pizza',
        CONCAT(net_price, ' €', ' pizza taille normale') AS 'prix net'
        FROM menu_item
        WHERE item_id  LIKE('%pizza%') AND available = 'y';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HireStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HireStaff`(
		IN input_point_of_sales INT,
        IN input_first_name VARCHAR(45),
        IN input_last_name VARCHAR(45),
        IN input_phone_number VARCHAR(10),
        IN input_private_email VARCHAR(45),
        IN input_job_title ENUM('manager', 'deliverer', 'pizzaïolo'))
BEGIN
		INSERT INTO staff (point_of_salesID, first_name, last_name, phone_number, private_email)
        VALUES (input_point_of_sales,
				input_first_name,
                input_last_name, 
                input_phone_number,
                input_private_email);
		
        IF input_job_title = 'manager' THEN
			INSERT INTO manager (staffID)
            SELECT (SELECT staffID FROM staff s WHERE (s.first_name = input_first_name AND
														s.last_name = input_last_name AND
                                                        s.phone_number = input_phone_number));
		ELSEIF input_job_title = 'deliverer' THEN
			INSERT INTO deliverer (staffID)
            SELECT (SELECT staffID FROM staff s WHERE (s.first_name = input_first_name AND
														s.last_name = input_last_name AND
                                                        s.phone_number = input_phone_number));
		ELSEIF input_job_title = 'pizzaïolo' THEN
			INSERT INTO pizzaiolo (staffID)
            SELECT (SELECT staffID FROM staff s WHERE (s.first_name = input_first_name AND
														s.last_name = input_last_name AND
                                                        s.phone_number = input_phone_number));
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListAllVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListAllVehicles`()
BEGIN
	SELECT v.point_of_salesID, v.insurance_number, v.operational_status, eb.vehicle_type, eb.registration_number
	FROM vehicle v
	JOIN EBike eb USING (vehicleID)
	UNION
	SELECT v.point_of_salesID, v.insurance_number, v.operational_status, es.vehicle_type, es.registration_number
	FROM vehicle v
	JOIN EScooter es USING (vehicleID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListOngoingOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListOngoingOrders`(
	IN input_point_of_sales INT)
BEGIN
	SELECT 	designatedPoSID,
			serial_number,
			po.requested_hour,
            effective_delivery_hour,
            order_status,
            (SELECT first_name FROM staff WHERE staffID= so.staffID) as 'picker',
            (SELECT first_name FROM staff WHERE staffID= so2.staffID) as 'operator',
            payment_completed
            FROM order_status os
            JOIN purchase_order po
            USING (serial_number)
            LEFT JOIN staff_task_order so
            ON so.order_serial_number = os.serial_number AND so.staff_task = 'picker'
            LEFT JOIN staff_task_order so2 
            ON so2.order_serial_number = os.serial_number AND so2.staff_task = 'operator'
            WHERE os.designatedPoSID = input_point_of_sales;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListStaff`()
BEGIN
	SELECT point_of_salesID, first_name, last_name, m.job_title
	FROM staff s
	JOIN manager m USING (staffID)
	UNION
	SELECT point_of_salesID, first_name, last_name, p.job_title
	FROM staff s
	JOIN pizzaiolo p USING (staffID)
	UNION
	SELECT point_of_salesID, first_name, last_name, d.job_title
	FROM staff s
	JOIN deliverer d USING (staffID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NewVehicle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NewVehicle`(
	IN input_point_of_salesID INT,
	IN input_vehicle_type ENUM('EScooter', 'EBike'),
    IN input_insurance_number VARCHAR(45),
    IN input_EScooter_regist_number VARCHAR(45))
BEGIN
	INSERT INTO vehicle (point_of_salesID, insurance_number)
    VALUES(input_point_of_salesID, input_insurance_number);
	IF input_vehicle_type = 'EScooter' THEN
		INSERT INTO EScooter (vehicleID, registration_number)
		VALUES((SELECT vehicleID FROM vehicle v
				WHERE v.insurance_number = input_insurance_number), 
				input_EScooter_regist_number);
	else
		INSERT INTO EBike (vehicleID)
        SELECT vehicleID
				FROM vehicle v
				WHERE v.insurance_number = input_insurance_number;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrderNewItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrderNewItem`(
					IN input_order_serial_number INT,
                    IN input_menu_itemID INT,
                    IN input_pizza_size ENUM('maxi','grande','normale', 'N/A'),
                    IN input_item_quantity INT)
BEGIN
	-- Include a ratio linked to the pizza size to calculate its price.
    DECLARE pizza_diam INT;
    DECLARE ref_pizza_diam INT;
    DECLARE calc_applicable_ratio DECIMAL(6,3);
    DECLARE set_price_vat_free DECIMAL(6,3);
    DECLARE set_vat_amount DECIMAL(6,3);
    SET set_price_vat_free = (SELECT mi.net_price_VAT_free FROM menu_item mi WHERE menu_itemID = input_menu_itemID);
    SET set_vat_amount = (SELECT mi.VAT_amount FROM menu_item mi WHERE menu_itemID = input_menu_itemID);
    
	IF input_pizza_size != 'N/A' THEN
		SET pizza_diam = (SELECT ps.diameter 
						FROM pizza_size ps 
                        WHERE ps.size = input_pizza_size);
        SET ref_pizza_diam = (SELECT ps.diameter 
							FROM pizza_size ps 
                            WHERE ps.size = 'normale');
        SET calc_applicable_ratio = pizza_diam/ref_pizza_diam;
	ELSE
		SET calc_applicable_ratio = 1;
	END IF;
        
	INSERT INTO item_in_order ( serial_number,
								menu_itemID,								
                                pizza_size,
                                applicable_ratio,
                                item_quantity,
                                unit_price_no_vat,
                                unit_vat_amount)  
	VALUES (input_order_serial_number,
			input_menu_itemID,
            input_pizza_size,
            calc_applicable_ratio,
            input_item_quantity,
            set_price_vat_free,
            set_vat_amount);
            
	-- Update the order table with values out of this new item
    UPDATE purchase_order
	SET 
		vat_amount= (SELECT (ROUND(SUM(line_vat_amount),1)) 
					FROM item_in_order 
                    WHERE serial_number = input_order_serial_number),
		total_price_vat = (SELECT (ROUND(SUM(line_net_price),1))
							FROM item_in_order 
                            WHERE serial_number = input_order_serial_number)
    WHERE serial_number = input_order_serial_number;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PassOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PassOrder`(
					IN input_customer_login VARCHAR(46),
                    IN input_password VARCHAR(12),
                    IN input_desired_pos ENUM('Paris'),
                    IN input_delivery_or_pos ENUM('delivery', 'pos'))
BEGIN
	IF (SELECT c.password 
		FROM customer c
        WHERE c.customer_login = input_customer_login) = input_password THEN
		INSERT INTO purchase_order (customer_id, desired_pos, delivery_or_pos)
		VALUES ((SELECT customer_id FROM customer WHERE customer.customer_login = input_customer_login),
				input_desired_pos, input_delivery_or_pos);
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveItemFromStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveItemFromStock`(
								IN input_point_of_salesID INT,
                                IN input_product_code VARCHAR(13), 
                                IN input_date_in DATE, 
                                IN input_quantity INT)
BEGIN
	DECLARE new_quantity INT;
    DECLARE total_quantity INT;
    SET new_quantity = (SELECT pi.quantity FROM product_item pi 
						WHERE (	pi.point_of_salesID = input_point_of_salesID
								AND pi.product_code = input_product_code 
								AND pi.date_in = input_date_in)) - input_quantity ;
    IF new_quantity < 0 THEN
		SET new_quantity = 0;
	END IF;
	UPDATE product_item pi 
    SET pi.quantity = new_quantity 
    WHERE (pi.product_code = input_product_code AND pi.date_in = date_in);
    
	SET total_quantity = (SELECT SUM(pi.quantity)
						FROM product_item pi
						WHERE pi.product_code = input_product_code);
	INSERT INTO pos_product (point_of_salesID, product_code, qty_in_stock)
	VALUES (input_point_of_salesID, input_product_code, total_quantity)
	ON DUPLICATE KEY UPDATE  qty_in_stock = total_quantity;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetOrderTasking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SetOrderTasking`(
	IN input_order_serial_number INT,
    IN input_point_of_salesID INT,
	IN input_staff VARCHAR(45),
    IN staff_task ENUM('operator', 'picker'))
BEGIN
	REPLACE INTO staff_task_order
    VALUES (input_order_serial_number, 
			(SELECT staffID FROM staff 
            WHERE first_name = input_staff
            AND point_of_salesID = input_point_of_salesID),
			staff_task);
    IF staff_task = 'operator' THEN
		UPDATE payment
		SET operatorID = (SELECT staffID FROM staff 
						WHERE first_name = input_staff 
						AND point_of_salesID = input_point_of_salesID)
		WHERE order_serial_number = input_order_serial_number;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateOrderStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateOrderStatus`(
	IN input_new_status ENUM('pending','accepted','rejected','in preparation','ready','on delivery','terminated'))
BEGIN
 UPDATE order_status
 SET order_status = input_new_status; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidatePurchase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidatePurchase`(
	IN input_serial_number INT,
    IN input_validate_purchase ENUM('y', 'n'),
    IN input_payment_mode ENUM('cash','card','online','lunch ticket', 'N/A'),
    IN input_payment_time ENUM('immediate','on delivery', 'N/A'),
    IN input_delivery_hour DATETIME)
BEGIN
	DECLARE desired_city VARCHAR(45);
    SET desired_city = (SELECT desired_pos 
						FROM purchase_order po 
                        WHERE po.serial_number = input_serial_number);
	IF input_delivery_hour < (SELECT date_add(now(), INTERVAL 30 MINUTE)) THEN
		SET input_delivery_hour = (SELECT date_add(now(), INTERVAL 30 MINUTE));
	END IF;
                        
	IF input_validate_purchase = 'n' THEN
    DELETE FROM purchase_order po 
    WHERE po.serial_number = input_serial_number;
    else
    UPDATE purchase_order 
    SET purchase_validation = 'y',
		payment_time = input_payment_time,
        requested_hour = input_delivery_hour 
		WHERE serial_number = input_serial_number;
        
	INSERT INTO order_status (serial_number, order_status, designatedPoSID)
    VALUES	(input_serial_number, 
			'pending',
            (SELECT point_of_salesID 
            FROM point_of_sales pos
            WHERE pos.city = desired_city));
            
	INSERT INTO payment (order_serial_number, customer_id, payment_mode, amount)
    VALUES	(input_serial_number,
			(SELECT customer_id FROM purchase_order WHERE serial_number = input_serial_number),
			input_payment_mode,
            (SELECT total_price_vat FROM purchase_order WHERE serial_number = input_serial_number));
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-16  8:54:02

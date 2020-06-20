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
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Boissons Alcooliques',3,'alc drink'),(2,'Boissons non alcooliques vendues dans des contenants permettant leur conservation',1,'non alc drink'),(3,'Produits préparés chez le traiteur vendus à emporter ou à livrer dont Pizzas',1,'pizza'),(4,'Produits livrés destinés à une consommation immédiate',2,NULL),(5,'Glaces conditionnées non destinées à une consommation immédiate',2,'ice cream'),(6,'pizzas, quiches, etc., destinés à une consommation immédiate',2,'ready to eat');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `e_mail`, `phone_number`, `fidelity_points`, `password`) VALUES (4,'Fabrice','Jaouen','fab.jaouen@gmail.com','0689436465',0,'test'),(5,'Allan','Neo','alneo@gmail.com','1472583690',0,'test'),(6,'Gus','Montauban','gusmontau@gmail.com','9876543210',0,'test');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `deliverer`
--

LOCK TABLES `deliverer` WRITE;
/*!40000 ALTER TABLE `deliverer` DISABLE KEYS */;
INSERT INTO `deliverer` VALUES (2,NULL,'deliverer','n'),(4,NULL,'deliverer','n');
/*!40000 ALTER TABLE `deliverer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `delivery_address`
--

LOCK TABLES `delivery_address` WRITE;
/*!40000 ALTER TABLE `delivery_address` DISABLE KEYS */;
INSERT INTO `delivery_address` VALUES (1,4,'Adolfstrasse 50','Bonn','53111','4e étage'),(2,5,'Sesame Street 12','Paris','75012','3e étage droite'),(3,6,'4 rue du cinéma','Paris','75012','');
/*!40000 ALTER TABLE `delivery_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `directing_management`
--

LOCK TABLES `directing_management` WRITE;
/*!40000 ALTER TABLE `directing_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `directing_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Ebike`
--

LOCK TABLES `Ebike` WRITE;
/*!40000 ALTER TABLE `Ebike` DISABLE KEYS */;
INSERT INTO `Ebike` VALUES (8,'EBike','N/A');
/*!40000 ALTER TABLE `Ebike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Escooter`
--

LOCK TABLES `Escooter` WRITE;
/*!40000 ALTER TABLE `Escooter` DISABLE KEYS */;
INSERT INTO `Escooter` VALUES (6,'EScooter','CE345RG');
/*!40000 ALTER TABLE `Escooter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item_in_order`
--

LOCK TABLES `item_in_order` WRITE;
/*!40000 ALTER TABLE `item_in_order` DISABLE KEYS */;
INSERT INTO `item_in_order` (`menu_itemID`, `serial_number`, `pizza_size`, `applicable_ratio`, `item_quantity`, `unit_price_no_vat`, `unit_vat_amount`) VALUES (372,8,'maxi',1.800,1,6.600,0.363),(373,7,'N/A',1.000,2,3.900,0.780),(374,8,'N/A',1.000,4,0.660,0.036),(380,7,'normale',1.000,2,6.660,0.366),(380,10,'maxi',1.800,3,6.660,0.366);
/*!40000 ALTER TABLE `item_in_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item_pos`
--

LOCK TABLES `item_pos` WRITE;
/*!40000 ALTER TABLE `item_pos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `kitchen`
--

LOCK TABLES `kitchen` WRITE;
/*!40000 ALTER TABLE `kitchen` DISABLE KEYS */;
/*!40000 ALTER TABLE `kitchen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'manager');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `margin_rate`
--

LOCK TABLES `margin_rate` WRITE;
/*!40000 ALTER TABLE `margin_rate` DISABLE KEYS */;
INSERT INTO `margin_rate` VALUES (1,1.000),(2,1.400),(3,1.800),(4,2.200),(5,2.600);
/*!40000 ALTER TABLE `margin_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` (`menu_itemID`, `item_id`, `available`, `gross_price`, `margin_rate`, `VAT_rate`) VALUES (372,'pizza Calzone','y',3.000,2.200,0.055),(373,'2113','y',1.500,2.600,0.200),(374,'681','y',0.300,2.200,0.055),(380,'pizza reine','y',3.700,1.800,0.055);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (7,'n',1,NULL,'pending'),(8,'n',1,NULL,'pending'),(10,'n',1,NULL,'pending');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (10,7,2,4,'card',23.400,'N/A','2020-06-13 19:43:01'),(11,8,3,5,'cash',15.300,'N/A','2020-06-13 19:43:26'),(12,10,5,4,'cash',37.900,'N/A','2020-06-20 10:19:50');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (3,'Dans cet ordre: ricotta, anchois, olives, mozzarella','Attention, pas de sauce tomate, étaler de la ricotta à la place','https://1drv.ms/u/s!Aqs32d4xc9fslGgpMhsOTZSX7w5H','Pizza Anchois'),(3,'Penser à fermer la pizza avec de l\'oeuf','Pizza repliée en deux, forme un chausson','https://1drv.ms/u/s!Aqs32d4xc9fslGZ7ZJ0m_d4lfZa5?e=vSIYvg','Pizza Calzone'),(3,'Dans l\' ordre: sauce tomate, Olives, Mozzarella, Basilic','Tranches fines de mozzarella recouvrant la pizza. Veiller à une répartition esthétique du basilic','https://1drv.ms/u/s!Aqs32d4xc9fslGeYEZFe-YaIMJJ9','Pizza Margherita'),(3,'Disposer dans cet ordre: pulpe de tomate, champignons, jambon, mozzarella, olives','Doit donner une impression de symétrie','https://1drv.ms/u/s!Aqs32d4xc9fslGp3s9gEqdWVKWHq?e=6KgYMJ','pizza reine');
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pizza_ingredient`
--

LOCK TABLES `pizza_ingredient` WRITE;
/*!40000 ALTER TABLE `pizza_ingredient` DISABLE KEYS */;
INSERT INTO `pizza_ingredient` VALUES ('14403','pizza calzone',150.000,'g'),('14403','pizza reine',100.000,'g'),('15545','Pizza Anchois',6.000,'pc'),('15545','pizza calzone',6.000,'pc'),('15545','Pizza Margherita',6.000,'pc'),('15545','pizza reine',12.000,'pc'),('16613','Pizza Margherita',100.000,'g'),('16613','pizza reine',100.000,'g'),('41405','Pizza Anchois',8.000,'pc'),('48099','pizza calzone',100.000,'g'),('48099','Pizza Margherita',125.000,'g'),('48099','pizza reine',125.000,'g'),('48787','pizza calzone',125.000,'g'),('48787','pizza reine',50.000,'g'),('71760','Pizza Margherita',10.000,'g'),('71760','pizza reine',30.000,'g'),('80280','pizza calzone',60.000,'g'),('80718','pizza calzone',1.000,'pc'),('80784','Pizza Anchois',250.000,'g'),('81913','Pizza Anchois',1.000,'pc');
/*!40000 ALTER TABLE `pizza_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pizza_size`
--

LOCK TABLES `pizza_size` WRITE;
/*!40000 ALTER TABLE `pizza_size` DISABLE KEYS */;
INSERT INTO `pizza_size` VALUES ('grande',24,1),('maxi',36,2),('normale',20,3);
/*!40000 ALTER TABLE `pizza_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pizzaiolo`
--

LOCK TABLES `pizzaiolo` WRITE;
/*!40000 ALTER TABLE `pizzaiolo` DISABLE KEYS */;
INSERT INTO `pizzaiolo` VALUES (3,'pizzaïolo'),(5,'pizzaïolo');
/*!40000 ALTER TABLE `pizzaiolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `point_of_sales`
--

LOCK TABLES `point_of_sales` WRITE;
/*!40000 ALTER TABLE `point_of_sales` DISABLE KEYS */;
INSERT INTO `point_of_sales` (`point_of_salesID`, `SIRET_number`, `VAT_number`, `city`, `zip_code`, `street`, `phone_number`) VALUES (1,'142533688885','FR11345666','Paris','75007','4 Rue des Abbesses','01 02 13 14 10');
/*!40000 ALTER TABLE `point_of_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pos_product`
--

LOCK TABLES `pos_product` WRITE;
/*!40000 ALTER TABLE `pos_product` DISABLE KEYS */;
INSERT INTO `pos_product` VALUES (1,'14944',5),(1,'2113',64),(1,'681',57),(1,'71337',48),(1,'71339',49),(1,'71760',2);
/*!40000 ALTER TABLE `pos_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('108',2,'Eau minérale pétillante Badoit Citron Vert','Eau Badoit Citron Vert par 33cl','n',0.000),('11704',3,'Bouteille d\'1l d\'huile d\'olives','Huile d\'Olive vierge Extra 1l','y',0.000),('1323',2,'Coca-Cola cannette','Coca-Cola cannette 33 cl','n',0.000),('14403',3,'Champignons de Paris','Champignon Hôtel en boite','y',0.000),('14944',3,'Farine','Farine de Blé Type 55 par 5 kg','y',0.000),('15545',3,'Olives Noires','Olive Noire Dénoyautée par 360g','y',0.000),('16613',3,'Pulpe de tomate','Pulpe de Tomates 8% matière sèche par 2,95kg','y',0.000),('2113',1,'Kronenbourg 1664','Bière Kronenbourg 1664 par 25cl','n',0.000),('2618',1,'Bière Carlsberg 33cl','Bière Carlsberg 33cl','n',0.000),('41405',3,'Anchois','Filets d\'anchois à l\'huile d\'olive par 580g','y',0.000),('48099',3,'Mozzarella','Mozzarella pin 1kg 23% MG','y',0.000),('48787',3,'Jambon Cuit','Jambon Cuit Standard DD 5 Kg','y',0.000),('681',2,'Bouteille cristaline 1/2l','Eau plate cristaline 50cl par 24','n',0.000),('71337',3,'Boule Pâte Normale','Boule Pâte à Pizza 160g','y',0.000),('71338',3,'Boule Pâte Grande','Boule de pâte à Pizza 200g','y',0.000),('71339',3,'Boule Pâte Maxi','Boule Pâte à Pizza 350g','y',0.000),('71760',3,'Basilic','Basilic Frais haché','y',0.000),('80280',3,'Emmental rapé','Emmental rapé Français 29% MG par 1kg','y',0.000),('80718',3,'Oeuf','Oeuf moyen alvéolé par 30pc','y',0.000),('80784',3,'Ricotta','Ricotta 6,5% MG 1,5kg/pc','y',0.000),('81913',3,'Mozzarella de Bufflone','Mozzarella di Buffala 22% MG','y',0.000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_item`
--

LOCK TABLES `product_item` WRITE;
/*!40000 ALTER TABLE `product_item` DISABLE KEYS */;
INSERT INTO `product_item` VALUES ('2020-06-01','71337',30,0.500,1),('2020-06-08','2113',64,0.200,1),('2020-06-08','71337',12,0.400,1),('2020-06-08','71760',1,0.000,1),('2020-06-09','681',33,0.250,1),('2020-06-09','71760',1,0.000,1),('2020-06-10','681',12,0.250,1),('2020-06-11','681',12,0.250,1),('2020-06-20','14944',5,0.300,1);
/*!40000 ALTER TABLE `product_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES (7,4,'2020-06-13 19:35:39',2.300,23.400,'2020-06-13 20:13:01',NULL,'y','on delivery','Paris','delivery'),(8,5,'2020-06-13 19:36:04',0.800,15.300,'2020-06-13 20:30:00',NULL,'y','on delivery','Paris','delivery'),(9,6,'2020-06-14 13:19:27',0.000,0.000,NULL,NULL,'n','immediate','Paris','delivery'),(10,4,'2020-06-20 10:17:15',2.000,37.900,'2020-06-20 19:00:00',NULL,'y','on delivery','Paris','delivery');
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,1,'Pierre','Dupont','1234567890','pierdupont@gmail.com','N/A','N/A'),(2,1,'Jean','Durand','0987654321','jeandurand@gmail.com','N/A','N/A'),(3,1,'Marcello','Dernet','8907654321','marceder@gmail.com','N/A','N/A'),(4,1,'Paul','Volfoni','1478523690','pvolfoni@audiard.com','N/A','N/A'),(5,1,'Raoul','Volfoni','3698521470','rvolfoni@audiard.com','N/A','N/A');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `staff_task_order`
--

LOCK TABLES `staff_task_order` WRITE;
/*!40000 ALTER TABLE `staff_task_order` DISABLE KEYS */;
INSERT INTO `staff_task_order` VALUES (7,1,'picker'),(7,2,'operator'),(8,2,'picker'),(8,3,'operator'),(10,5,'operator');
/*!40000 ALTER TABLE `staff_task_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `VAT_rate`
--

LOCK TABLES `VAT_rate` WRITE;
/*!40000 ALTER TABLE `VAT_rate` DISABLE KEYS */;
INSERT INTO `VAT_rate` VALUES (1,0.0550),(2,0.1000),(3,0.2000),(16,0.0210);
/*!40000 ALTER TABLE `VAT_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (6,1,'OK','21354688'),(8,1,'OK','2589631');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-20 10:35:53

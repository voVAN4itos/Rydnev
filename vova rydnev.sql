CREATE DATABASE  IF NOT EXISTS `theatre_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `theatre_db`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: theatre_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `position_id` int DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Иванов Иван Иванович',1,'2020-01-15','+79001112233','ivanov@example.com'),(2,'Петрова Анна Сергеевна',2,'2018-09-20','+79002223344','petrova@example.com'),(3,'Сидоров Павел Алексеевич',3,'2021-06-10','+79003334455','sidorov@example.com'),(4,'Орлова Елена Юрьевна',4,'2019-03-11','+79004445566','orlova@example.com'),(5,'Михайлов Роман Витальевич',5,'2022-01-22','+79005556677','mihailov@example.com');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halls` (
  `hall_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`hall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES (1,'Большой зал',400),(2,'Малый зал',150),(3,'Средний зал',250);
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performances`
--

DROP TABLE IF EXISTS `performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performances` (
  `performance_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `age_limit` int DEFAULT NULL,
  `base_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`performance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performances`
--

LOCK TABLES `performances` WRITE;
/*!40000 ALTER TABLE `performances` DISABLE KEYS */;
INSERT INTO `performances` VALUES (1,'Гамлет','Драма',130,16,1200.00),(2,'Золушка','Сказка',100,6,800.00),(3,'Ревизор','Комедия',110,12,1000.00);
/*!40000 ALTER TABLE `performances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Актёр',55000.00),(2,'Режиссёр',90000.00),(3,'Кассир',35000.00),(4,'Осветитель',40000.00),(5,'Декоратор',42000.00);
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repertoire`
--

DROP TABLE IF EXISTS `repertoire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repertoire` (
  `repertoire_id` int NOT NULL AUTO_INCREMENT,
  `performance_id` int DEFAULT NULL,
  `hall_id` int DEFAULT NULL,
  `show_date` datetime DEFAULT NULL,
  PRIMARY KEY (`repertoire_id`),
  KEY `performance_id` (`performance_id`),
  KEY `hall_id` (`hall_id`),
  CONSTRAINT `repertoire_ibfk_1` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`performance_id`),
  CONSTRAINT `repertoire_ibfk_2` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`hall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repertoire`
--

LOCK TABLES `repertoire` WRITE;
/*!40000 ALTER TABLE `repertoire` DISABLE KEYS */;
INSERT INTO `repertoire` VALUES (1,1,1,'2025-07-01 19:00:00'),(2,2,2,'2025-07-02 14:00:00'),(3,3,3,'2025-07-03 18:00:00'),(4,1,1,'2025-07-10 19:00:00');
/*!40000 ALTER TABLE `repertoire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `visitor_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `visitor_id` (`visitor_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`visitor_id`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (2,1,1,1,'2025-06-17 14:55:33');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_ticket_sale` AFTER INSERT ON `sales` FOR EACH ROW BEGIN
    UPDATE Tickets
    SET is_sold = TRUE
    WHERE ticket_id = NEW.ticket_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TicketStatus` AFTER INSERT ON `sales` FOR EACH ROW BEGIN
    UPDATE Tickets
    SET is_sold = TRUE
    WHERE ticket_id = NEW.ticket_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `repertoire_id` int DEFAULT NULL,
  `seat_number` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_sold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ticket_id`),
  KEY `repertoire_id` (`repertoire_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`repertoire_id`) REFERENCES `repertoire` (`repertoire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,1,10,1000.00,1),(2,1,11,1000.00,0),(3,2,5,700.00,0);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_employeesdetails`
--

DROP TABLE IF EXISTS `view_employeesdetails`;
/*!50001 DROP VIEW IF EXISTS `view_employeesdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_employeesdetails` AS SELECT 
 1 AS `employee_id`,
 1 AS `name`,
 1 AS `position_id`,
 1 AS `hire_date`,
 1 AS `phone`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
  `visitor_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,'Кузнецова Мария','+79006667788','maria@example.com'),(2,'Смирнов Алексей','+79007778899','alex@example.com'),(3,'Ильин Сергей','+79008889900','sergey@example.com');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'theatre_db'
--

--
-- Dumping routines for database 'theatre_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `BuyTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuyTicket`(
    IN in_ticket_id INT,
    IN in_visitor_id INT,
    IN in_employee_id INT
)
BEGIN
    DECLARE ticket_exists INT DEFAULT 0;
    DECLARE already_sold BOOL DEFAULT FALSE;
    SELECT COUNT(*) INTO ticket_exists
    FROM Tickets
    WHERE ticket_id = in_ticket_id;

    IF ticket_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ошибка: Билет не существует!';
    ELSE
        SELECT is_sold INTO already_sold
        FROM Tickets
        WHERE ticket_id = in_ticket_id;

        IF already_sold THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ошибка: Билет уже продан!';
        ELSE
            INSERT INTO Sales (ticket_id, visitor_id, employee_id, sale_date)
            VALUES (in_ticket_id, in_visitor_id, in_employee_id, NOW());
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRevenueByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRevenueByDate`(IN showDate DATE)
BEGIN
    SELECT 
        p.title AS Спектакль,
        r.show_date AS Дата,
        SUM(t.price) AS Доход
    FROM Sales s
    JOIN Tickets t ON s.ticket_id = t.ticket_id
    JOIN Repertoire r ON t.repertoire_id = r.repertoire_id
    JOIN Performances p ON r.performance_id = p.performance_id
    WHERE DATE(r.show_date) = showDate
    GROUP BY p.title, r.show_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_employeesdetails`
--

/*!50001 DROP VIEW IF EXISTS `view_employeesdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_employeesdetails` AS select `employees`.`employee_id` AS `employee_id`,`employees`.`full_name` AS `name`,`employees`.`position_id` AS `position_id`,`employees`.`hire_date` AS `hire_date`,`employees`.`phone` AS `phone`,`employees`.`email` AS `email` from `employees` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-17 15:16:18

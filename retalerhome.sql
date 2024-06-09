-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rental_home
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3wluo9ljton4rckdhy9sxpdaq` (`room_id`),
  CONSTRAINT `FK3wluo9ljton4rckdhy9sxpdaq` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (28,'Ghế',2,6),(29,'Điều hòa',1,6),(30,'Tủ lạnh',1,6),(31,'Bàn',1,6),(32,'Cục wifi',1,6),(33,'Ghế',2,4),(34,'Điều hòa',1,4),(35,'Tủ lạnh',1,4),(36,'Bàn',1,4),(40,'Ghế',2,5),(41,'Điều hòa',1,5),(42,'Tủ lạnh',1,5),(43,'Ghế',1,17),(44,'Tủ Lạnh',2,17),(45,'Ghế',2,18),(46,'Bàn ',1,18),(47,'Tủ lạnh',1,18),(48,'Ghế ',3,19),(49,'Tủ lạnh',2,19),(50,'Ghế',1,20),(51,'Ghề',2,21),(52,'Bàn',2,21),(53,'Ghế ',2,22),(54,'Bàn ',2,22);
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_store`
--

DROP TABLE IF EXISTS `blog_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_store` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtdi64vw3n8m9q5a43tw87ggnb` (`room_id`),
  KEY `FKbmm0v7yiq862r3dr4v9tjx7ge` (`user_id`),
  CONSTRAINT `FKbmm0v7yiq862r3dr4v9tjx7ge` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKtdi64vw3n8m9q5a43tw87ggnb` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_store`
--

LOCK TABLES `blog_store` WRITE;
/*!40000 ALTER TABLE `blog_store` DISABLE KEYS */;
INSERT INTO `blog_store` VALUES (1,'2023-08-25 07:38:32','2023-08-25 07:38:32',21,10),(2,'2023-09-13 17:05:55','2023-09-13 17:05:55',22,15),(3,'2023-10-28 14:50:43','2023-10-28 14:50:43',22,3),(4,'2023-10-28 19:02:18','2023-10-28 19:02:18',21,17),(5,'2023-11-05 14:54:10','2023-11-05 14:54:10',21,1);
/*!40000 ALTER TABLE `blog_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Homestay'),(2,'Villa'),(3,'Chưng cư');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_id` bigint DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsqb4rxp3er8wxrcy9wx7xk8jp` (`rate_id`),
  KEY `FKihp4hqamxll71q5ut5x66m2ie` (`room_id`),
  KEY `FKqm52p1v3o13hy268he0wcngr5` (`user_id`),
  CONSTRAINT `FKihp4hqamxll71q5ut5x66m2ie` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FKqm52p1v3o13hy268he0wcngr5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKsqb4rxp3er8wxrcy9wx7xk8jp` FOREIGN KEY (`rate_id`) REFERENCES `rate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'2023-08-22 19:30:34','2023-08-22 19:30:34','Phòng khá là tốt với yêu cầu mình đang cần ',NULL,NULL,1,4,2),(2,'2023-08-25 09:59:27','2023-08-25 09:59:27','Phòng đẹp tốt sạch sẽ lun ủng hộ cho chủ trọ',NULL,NULL,2,22,10),(3,'2023-09-13 16:54:58','2023-09-13 16:54:58','phong tro tốt ',NULL,NULL,3,22,15),(4,'2023-10-13 11:06:08','2023-10-13 11:06:08','Oki',NULL,NULL,4,22,10),(5,'2023-10-13 11:09:30','2023-10-13 11:09:30','Nha oki',NULL,NULL,5,22,10),(6,'2023-10-13 11:12:18','2023-10-13 11:12:18','Nha tro',NULL,NULL,6,22,10),(7,'2023-10-28 14:51:51','2023-10-28 14:51:51','Homestay',NULL,NULL,7,22,3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `deadline_contract` datetime DEFAULT NULL,
  `name_of_rent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_of_people` int DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `is_invoice` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK439acep1c8d9xqoi5py8of4yt` (`room_id`),
  CONSTRAINT `FK439acep1c8d9xqoi5py8of4yt` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (2,'2023-08-08 09:10:24','2023-08-16 18:58:51','gasky2k1@gmail.com','http://localhost:8080/document/JD_Internship-Java.pdf','Hợp đồng  homestay  số 1 ','gasky2k1@gmail.com',5,'2024-02-23 09:09:00','Nghiêm Đình Nam',2,'0987654321','2024-02-23 09:09:00','2024-02-25 09:09:00',20000000.00,NULL,_binary ''),(3,'2023-08-10 13:14:38','2023-08-17 12:17:19','gasky2k1@gmail.com','http://localhost:8080/document/JD_Internship-Java.pdf','Homestay 303','gasky2k1@gmail.com',17,'2023-10-06 13:12:00','Nguyễn Ngọc Diệm',2,'0987654321','2024-02-23 09:09:00','2024-02-25 09:09:00',20000000.00,NULL,_binary ''),(4,'2023-08-15 15:02:25','2023-08-15 15:02:25','gasky2k1@gmail.com','http://localhost:8080/document/ielts writing 0-3.pdf','Hợp đồng  homestay  506','gasky2k1@gmail.com',18,'2023-08-15 15:01:00','Nghiêm Đình Nam',2,'0987654321','2024-02-23 09:09:00','2024-02-25 09:09:00',20000000.00,NULL,_binary ''),(5,'2023-08-23 10:15:23','2023-08-23 10:15:23','gasky2k1@gmail.com','http://localhost:8080/document/JD_Internship-Java.pdf','Hợp đồng  homestay Trường Dương','gasky2k1@gmail.com',20,'2024-01-23 10:14:00','Nghiêm Trường Dương',2,'0397507826','2024-02-23 09:09:00','2024-02-25 09:09:00',20000000.00,NULL,_binary ''),(6,'2023-09-13 17:01:00','2023-09-13 17:01:00','gasky2k1@gmail.com','http://localhost:8080/document/HN_GDV_Trần-Thị-Thu-Trang.pdf','Homestay 406','gasky2k1@gmail.com',21,'2024-03-13 17:00:00','Nghiêm Trung Kiên',2,'0978987789','2024-02-23 09:09:00','2024-02-25 09:09:00',20000000.00,NULL,_binary ''),(7,'2023-09-25 11:38:43','2023-09-25 11:38:43','gasky2k1@gmail.com','http://localhost:8080/document/CA_chuẩn.pdf','Hợp đồng  homestay  Lê Văn Kiên','gasky2k1@gmail.com',19,'2025-03-25 11:38:00','Lê Văn Kiên',2,'0987654456','2024-02-23 09:09:00','2024-02-25 09:09:00',20000000.00,NULL,_binary ''),(8,'2023-10-27 01:52:52','2023-10-27 01:52:52','gasky2k1@gmail.com','http://localhost:8080/document/Reading .pdf','Thuê Villa của Nghiêm Đình Nam','gasky2k1@gmail.com',22,'2025-03-25 11:38:00','Châu Ngọc Long',10,'0998877665','2023-10-30 10:00:00','2023-10-28 10:00:00',2000000.00,NULL,_binary ''),(19,'2023-11-05 14:09:14','2023-11-05 14:09:14','minksky2k2@gmail.com',NULL,'Hợp đồng thành toán toán online','minksky2k2@gmail.com',21,'2025-03-25 11:38:00','Châu Ngọc Long',4,'0397897826','2023-11-11 14:09:00','2023-11-05 14:09:00',600000.00,1,_binary '\0'),(20,'2023-11-10 02:12:01','2023-11-10 02:12:01','review4taller@gmail.com',NULL,'Hợp đồng thành toán toán onlineNghiem Dinh Nam','review4taller@gmail.com',21,NULL,'Nghiem Dinh Nam',10,'0987123321','2023-11-15 02:11:00','2023-11-10 02:11:00',500000.00,10,_binary '\0'),(21,'2023-11-10 02:25:17','2023-11-10 02:25:17','review4taller@gmail.com',NULL,'Hợp đồng thành toán toán onlineNghiem Dinh Nam','review4taller@gmail.com',21,NULL,'Nghiem Dinh Nam',10,'0987123321','2023-11-16 02:25:00','2023-11-10 02:25:00',600000.00,10,_binary '\0'),(22,'2023-11-10 02:31:41','2023-11-10 02:31:41','review4taller@gmail.com',NULL,'Hợp đồng thành toán toán onlineNghiêm Đình Nam','review4taller@gmail.com',21,NULL,'Nghiêm Đình Nam',10,'0987123321','2023-11-14 02:31:00','2023-11-10 02:31:00',400000.00,10,_binary '\0'),(24,'2023-11-10 02:35:16','2023-11-10 02:35:16','review4taller@gmail.com',NULL,'Hợp đồng thành toán toán onlineNghiem Dinh Nam','review4taller@gmail.com',22,NULL,'Nghiem Dinh Nam',10,'0987123321','2023-11-16 02:35:00','2023-11-10 02:35:00',6000000.00,10,_binary '\0');
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `rentaler_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpgpyqrtr2eyu296talrshe12f` (`customer_id`),
  KEY `FK3f644cpxp0l3a8yocs2pg7wjl` (`rentaler_id`),
  CONSTRAINT `FK3f644cpxp0l3a8yocs2pg7wjl` FOREIGN KEY (`rentaler_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKpgpyqrtr2eyu296talrshe12f` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (1,'2023-08-25 04:36:32','2023-08-25 04:36:32',10,3),(2,'2023-09-13 17:05:27','2023-09-13 17:05:27',15,3),(3,'2023-10-28 14:53:44','2023-10-28 14:53:44',3,1),(4,'2023-10-28 19:01:57','2023-10-28 19:01:57',17,1),(5,'2023-11-05 14:57:24','2023-11-05 14:57:24',1,2);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (2);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Sài Gòn');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintenance_date` datetime DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfoyu49hytdo3atyq3ak5uscd6` (`room_id`),
  CONSTRAINT `FKfoyu49hytdo3atyq3ak5uscd6` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (1,'2023-08-09 04:29:18','2023-08-09 04:29:18','gasky2k1@gmail.com','2023-08-07 04:24:00',200000.00,'gasky2k1@gmail.com',5,'http://localhost:8080/document/BAP_SOFTWARE_JAVA_1.pdf'),(2,'2023-08-10 07:11:02','2023-08-10 07:11:02','gasky2k1@gmail.com','2023-08-10 07:10:00',90000000.00,'gasky2k1@gmail.com',6,'http://localhost:8080/document/BAP_SOFTWARE_JAVA_1.pdf'),(3,'2023-08-15 15:00:02','2023-08-15 15:00:02','gasky2k1@gmail.com','2023-08-15 14:59:00',100000.00,'gasky2k1@gmail.com',18,'http://localhost:8080/document/JD_Internship-Java.pdf');
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user2` bigint DEFAULT NULL,
  `user1` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKriwdrby703i7ivymy6sylrri` (`user2`),
  KEY `FKf4ud3yxkxrd2ptv8vbbva1cud` (`user1`),
  CONSTRAINT `FKf4ud3yxkxrd2ptv8vbbva1cud` FOREIGN KEY (`user1`) REFERENCES `users` (`id`),
  CONSTRAINT `FKriwdrby703i7ivymy6sylrri` FOREIGN KEY (`user2`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,10,3),(2,10,8),(3,15,3),(4,17,3),(5,3,1),(6,3,3),(7,17,1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_chat`
--

DROP TABLE IF EXISTS `message_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  `send_by` bit(1) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `message_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1jl2a55otrsmfh9qv33e0dpsc` (`message_id`),
  CONSTRAINT `FK1jl2a55otrsmfh9qv33e0dpsc` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_chat`
--

LOCK TABLES `message_chat` WRITE;
/*!40000 ALTER TABLE `message_chat` DISABLE KEYS */;
INSERT INTO `message_chat` VALUES (1,'Hi xin chào ',_binary '\0',_binary '','2023-08-27 07:42:44',1),(2,'Tôi muốn hỏi giá phòng a b',_binary '\0',_binary '','2023-08-27 08:00:55',1),(3,'Xin chào ',_binary '\0',_binary '\0','2023-08-27 08:01:55',1),(4,'Tôi muốn thuê phòng 903',_binary '\0',_binary '','2023-08-27 08:12:06',1),(5,'Phòng 903 bạn muốn hỏi gì vậy',_binary '\0',_binary '\0','2023-08-27 15:06:00',1),(6,'Tôi sẽ trả lời mọi thắc mắc của bạn',_binary '\0',_binary '\0','2023-08-27 15:06:14',1),(7,'Rất vui khi được giúp đỡ bạn',_binary '\0',_binary '\0','2023-08-27 15:06:30',1),(8,'Tôi muốn hỏi giá cả của phòng này và thiết bị',_binary '\0',_binary '','2023-08-27 15:07:06',1),(9,'Mong bạn trả lời sớm',_binary '\0',_binary '','2023-08-27 15:07:18',1),(10,'Xin chào bạn',_binary '\0',_binary '','2023-08-27 15:31:56',2),(11,'Tôi muốn thuê phòng giá hợp lý',_binary '\0',_binary '','2023-08-27 19:00:27',1),(12,'Oki bạn hẹn gặp bạn tại phòng nhé',_binary '\0',_binary '\0','2023-08-27 19:00:43',1),(13,'Xin chào',_binary '\0',_binary '','2023-09-13 16:44:07',3),(14,'Xin chào bạn bạn thuê phòng sao ',_binary '\0',_binary '\0','2023-09-13 16:45:14',3),(15,'Như bình thường',_binary '\0',_binary '','2023-09-13 16:46:08',3),(16,'Hello',_binary '\0',_binary '','2023-09-22 18:12:26',1),(17,'Tao muon thue phong',_binary '\0',_binary '','2023-09-22 18:12:37',1),(18,'Hello',_binary '\0',_binary '','2023-10-28 15:04:32',4),(19,'Hello',_binary '\0',_binary '','2023-10-28 19:05:44',7),(20,'Mình muốn thuê phòng hoặc homestay này mấy ngày chả hạn',_binary '\0',_binary '','2023-10-28 19:06:18',4);
/*!40000 ALTER TABLE `message_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdai2guk7xv05q4uencjwyy266` (`room_id`),
  KEY `FKkkc94w4qh1lbimfym26iwhhnf` (`user_id`),
  CONSTRAINT `FKdai2guk7xv05q4uencjwyy266` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FKkkc94w4qh1lbimfym26iwhhnf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (1,'2023-08-22 19:30:34','2023-08-22 19:30:34',NULL,3.5,4,2),(2,'2023-08-25 09:59:27','2023-08-25 09:59:27',NULL,5,22,10),(3,'2023-09-13 16:54:58','2023-09-13 16:54:58',NULL,4,22,15),(4,'2023-10-13 11:06:08','2023-10-13 11:06:08',NULL,4,22,10),(5,'2023-10-13 11:09:30','2023-10-13 11:09:30',NULL,5,22,10),(6,'2023-10-13 11:12:18','2023-10-13 11:12:18',NULL,4.5,22,10),(7,'2023-10-28 14:51:51','2023-10-28 14:51:51',NULL,5,22,3);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `is_answer` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfx6yjrq8my6b2lwgykbt713l9` (`room_id`),
  CONSTRAINT `FKfx6yjrq8my6b2lwgykbt713l9` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'Cần lắp thêm điều hòa và tủ lạnh','Nghiêm Đình Nam','0987654321',6,_binary ''),(3,'Tìm hiểu về các api investigate get car theo user và tư vấn nâng xe','Nguyễn Ngọc Diệm','0987654321',17,_binary ''),(4,'Nhà đẹp không lo về giá các cháu cứ đến thuê nhé','Nguyễn Ngọc Diệm','0987654321',17,_binary '\0'),(5,'Tìm hiểu về các api investigate get car theo user và tư vấn nâng xe','Nghiêm Trung Kiên','0978987789',21,_binary ''),(6,'Sua phong','Nghiêm Trường Dương','0397507826',20,_binary '');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nb4h0p6txrmfc0xbrd1kglp9t` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'ROLE_ADMIN'),(3,'ROLE_RENTALER'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `comment_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `is_locked` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approve` bit(1) DEFAULT NULL,
  `is_remove` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKllkgnps1iryk3347aokxwbxxm` (`category_id`),
  KEY `FKphyg13y4o90ph89hqcbqogq6d` (`comment_id`),
  KEY `FKrqejnp96gs9ldf7o6fciylxkt` (`location_id`),
  KEY `FKrsc9pb9h33996lww769sk8s6x` (`user_id`),
  CONSTRAINT `FKllkgnps1iryk3347aokxwbxxm` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKphyg13y4o90ph89hqcbqogq6d` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `FKrqejnp96gs9ldf7o6fciylxkt` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKrsc9pb9h33996lww769sk8s6x` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (4,'2023-08-03 15:56:00','2023-08-15 07:58:09','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,3999999.00,'ROOM_RENT','DaLat Poshtel','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '',_binary ''),(5,'2023-08-03 15:57:37','2023-08-15 15:10:25','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,3000000.00,'CHECKED_OUT','Lá Phong hostel','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '',_binary ''),(6,'2023-08-03 16:04:57','2023-08-23 15:16:41','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,2000000.00,'ROOM_RENT','Là nhà homestay','gasky2k1@gmail.com',2,NULL,1,3,'DISABLE',_binary '',_binary '\0'),(7,'2023-08-03 15:56:00','2023-08-23 15:16:42','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,2000000.00,'ROOM_RENT','Cù Tê Homestay','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '',_binary '\0'),(8,'2023-08-03 15:57:37','2023-08-23 15:16:44','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,2000000.00,'HIRED','Sunshine Tím','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '',_binary '\0'),(9,'2023-08-03 16:04:57','2023-08-03 16:04:57','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,2000000.00,'ROOM_RENT','Rosemary – Bed & Coffee House ','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '\0',_binary '\0'),(10,'2023-08-03 16:04:57','2023-08-03 16:04:57','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,2000000.00,'ROOM_RENT','Leuleu hostel & cafe','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '\0',_binary '\0'),(11,'2023-08-03 16:04:57','2023-08-03 16:04:57','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,2000000.00,'ROOM_RENT','Phượng tím homestay','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '\0',_binary '\0'),(12,'2023-08-03 16:04:57','2023-08-05 19:36:51','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,2000000.00,'ROOM_RENT','NOMAD Home ','gasky2k1@gmail.com',2,NULL,1,3,'DISABLE',_binary '\0',_binary '\0'),(13,'2023-08-03 16:04:57','2023-08-05 19:35:44','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,2000000.00,'ROOM_RENT','Phire Villa','gasky2k1@gmail.com',2,NULL,1,3,'DISABLE',_binary '\0',_binary '\0'),(14,'2023-08-03 16:04:57','2023-08-03 16:04:57','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,2000000.00,'ROOM_RENT','Nhà Gió – The Dalat Old-Home','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '\0',_binary '\0'),(15,'2023-08-03 16:04:57','2023-08-03 16:04:57','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,2000000.00,'ROOM_RENT','Woody House Hostel','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '\0',_binary '\0'),(16,'2023-08-03 16:04:57','2023-08-03 16:04:57','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com','Nhà đẹp không lo về giá các cháu cứ đến thuê nhé',0,0,2000000.00,'ROOM_RENT','Lemongrass Homestay','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '\0',_binary '\0'),(17,'2023-08-10 07:07:59','2023-08-15 04:21:27','Dao Tu, Quang Phu Cau','gasky2k1@gmail.com','Tìm hiểu về các api investigate get car theo user và tư vấn nâng xe',0,0,1000000.00,'HIRED','Tre\'s House ','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '\0',_binary '\0'),(18,'2023-08-15 14:58:06','2023-08-15 15:04:56','Yen Nghia - Ha Dong','gasky2k1@gmail.com','Tạo database cho phần booking và api tư vấn nâng độ',0,0,90000000.00,'CHECKED_OUT','Nomad Home Dalat ','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '\0',_binary '\0'),(19,'2023-08-17 14:09:29','2023-09-25 11:38:43','Yen Nghia - Ha Dong','gasky2k1@gmail.com','Tìm hiểu về các api investigate get car theo user và tư vấn nâng xe',0,0,10000000.00,'HIRED','Beachside Inn','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '\0',_binary '\0'),(20,'2023-08-17 14:13:36','2023-10-28 19:14:36','Yen Nghia - Ha Dong','gasky2k1@gmail.com','Tìm hiểu về các api investigate get car theo user và tư vấn nâng xe',0,0,100000.00,'CHECKED_OUT','Grand Wellena','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '\0',_binary '\0'),(21,'2023-08-17 14:29:02','2023-09-13 17:01:00','Hawaii, USA','gasky2k1@gmail.com','We are seeking an Accountant to manage our financial records...',19.8986819,-155.6658568,100000.00,'HIRED','The Langham','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '',_binary '\0'),(22,'2023-08-17 14:51:25','2023-10-27 01:52:53','Số 3 ngõ 3 Duy Tân, Ngõ 3 Phố Duy Tân, Dịch Vọng Hậu, Cầu Giấy, Hanoi, Vietnam','gasky2k1@gmail.com','Tìm hiểu về các api investigate get car theo user và tư vấn nâng xe',21.0302655,105.7846598,1000000.00,'HIRED','Moody Moon','gasky2k1@gmail.com',2,NULL,1,3,'ENABLE',_binary '',_binary '\0');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_media`
--

DROP TABLE IF EXISTS `room_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_media` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1fwsidm5trexpwjjs5850uqo8` (`room_id`),
  CONSTRAINT `FK1fwsidm5trexpwjjs5850uqo8` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_media`
--

LOCK TABLES `room_media` WRITE;
/*!40000 ALTER TABLE `room_media` DISABLE KEYS */;
INSERT INTO `room_media` VALUES (10,'http://localhost:8080/image/1.png',6),(11,'http://localhost:8080/image/2.png',6),(12,'http://localhost:8080/image/3.png',6),(13,'http://localhost:8080/image/239822562_3109270802682319_5368106852970315612_n.jpg',4),(14,'http://localhost:8080/image/Ảnh Tết 4.jpg',4),(15,'http://localhost:8080/image/Ảnh Tết 5.jpg',4),(18,'http://localhost:8080/image/Ảnh Tết 3.jpg',5),(19,'http://localhost:8080/image/Ảnh Tết 4.jpg',5),(20,'http://localhost:8080/image/358036912_171447985932035_5552599947793696587_n.jpg',17),(21,'http://localhost:8080/image/Ảnh Tết 3.jpg',18),(22,'http://localhost:8080/image/Ảnh Tết 4.jpg',18),(23,'http://localhost:8080/image/Ảnh Tết 5.jpg',18),(24,'http://localhost:8080/image/Chiem-nguong-88-hinh-nen-your-name-4k-dep-tuyet-dinh-2.png',19),(25,'http://localhost:8080/image/download.png',19),(26,'http://localhost:8080/image/rm370-35.jpg',19),(27,'http://localhost:8080/image/b555d85596974fc91686.jpg',20),(28,'http://localhost:8080/image/be5cf495b2576b093246.jpg',20),(29,'http://localhost:8080/image/224136355_292969275958706_6833087698546566355_n.jpg',21),(30,'http://localhost:8080/image/298835603_5166498146736801_5729322602975341513_n.jpg',21),(31,'http://localhost:8080/image/rm370-35.jpg',22),(32,'http://localhost:8080/image/Screenshot 2022-11-16 124318.png',22),(33,'http://localhost:8080/image/Screenshot 2022-12-03 154520.png',22);
/*!40000 ALTER TABLE `room_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (4,1),(8,1),(9,1),(10,1),(12,1),(13,1),(17,1),(5,2),(1,3),(2,3),(3,3),(11,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified` bit(1) NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` bit(1) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_confirmed` bit(1) DEFAULT NULL,
  `facebook_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zalo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2023-08-01 08:34:45','2023-08-01 08:34:45','Phùng Khoang, Ứng Hòa, Hà Nội','minksky2k2@gmail.com',_binary '\0',NULL,_binary '\0','Hoàng Văn An','$2a$10$0KIPqxgA.sGaPPDJ0DQfAu19tguIapk.nH6WodZfIwHPbBw4koF2i','0987654321','local',NULL,NULL,NULL,NULL),(2,'2023-08-01 09:09:47','2023-08-15 15:08:04','Trung Van, Ha Noi','dinhnam12435@gmail.com',_binary '\0','http://localhost:8080/image/1.png',_binary '\0','Nghiem Truong Duong','$2a$10$tR1HtkADucsULLwga5r3ZOP.2.FdgXspSKpuFHv9OByGnKh3vCY2C','0987654321','local',NULL,NULL,NULL,NULL),(3,'2023-08-01 14:37:50','2023-10-28 19:40:24','Phùng Khoang, Trung Văn, Hà Nội','gasky2k1@gmail.com',_binary '\0','http://localhost:8080/image/2.png',_binary '\0','Nghiêm Đình Nam','$2a$10$MdwBfGycDhEENfXx2fy30.DwZmq/feH82H/z0uDJWB1C/Hcw/9jTe','0987654321','local',NULL,_binary '','https://www.facebook.com/long.11242001','https://zalo.me/0397507826'),(4,'2023-08-01 18:11:40','2023-08-01 18:11:40',NULL,'animeoffical2k1@gmail.com',_binary '\0','https://lh3.googleusercontent.com/a/AAcHTtcov-CGsu9NfqR2gs2ZvCdau03Av2tJI1j-bNFS7VABHQ=s96-c',_binary '\0','Anime Offical',NULL,NULL,'google','114404915183840729250',NULL,NULL,NULL),(5,'2023-08-01 14:37:50','2023-08-01 14:37:50','Phùng Khoang, Trung Văn, Hà Nội','master@gmail.com',_binary '\0',NULL,_binary '\0','Master Admin','$2a$10$AILzhbv.Ynh139xIjgUpY.tjXEbuGcE.RS5ZnJIEvWo5rqahRjP7e','0987654321','local',NULL,_binary '',NULL,NULL),(8,'2023-08-02 17:27:53','2023-08-02 17:32:13',NULL,'dinhnamsaker1@gmail.com',_binary '\0','http://localhost:8080/image/2.png',_binary '\0','Nam Gà','$2a$10$9SWB972zCW/JqVr4kaOSoegjFYL1tI7Xrn1gcbYUVmiO.oTbTt8na',NULL,'local',NULL,_binary '',NULL,NULL),(9,'2023-08-08 11:52:24','2023-08-08 11:54:08',NULL,'namcrowd2020@gmail.com',_binary '\0',NULL,_binary '\0','Nghiêm Trung Kiên','$2a$10$rqEdp9jZZMbsNX99oC26xOESXCLY5T4HbUqTn4fbwY4i9v23DPLqu',NULL,'local',NULL,_binary '',NULL,NULL),(10,'2023-08-15 14:52:06','2023-08-26 11:39:51','Dao Tu, Quang Phu Cau','review4taller@gmail.com',_binary '\0','http://localhost:8080/image/3.png',_binary '\0','Trần Văn Nhân','$2a$10$ZS/UF/lzT0BR6aa1pGt7tOlyXorUWOaHX.4cukwWJ7lN2zlKtb66W','0987654321','local',NULL,_binary '',NULL,NULL),(11,'2023-08-15 16:05:30','2023-08-18 10:39:27',NULL,'namsky1826@gmail.com',_binary '\0','https://lh3.googleusercontent.com/a/AAcHTtdmpw6h6qvQh0JaKUjTQVvbJbDrcrsaQnCPdUS3AnHXXuY=s96-c',_binary '\0','Fboy Gà',NULL,NULL,'google','109818643069957001464',_binary '',NULL,NULL),(12,'2023-08-15 16:07:38','2023-08-15 16:20:02',NULL,'dinhnamsaker@gmail.com',_binary '\0','https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1779458645822232&height=250&width=250&ext=1694708403&hash=AeTrYYsW8m351UJ3QhU',_binary '\0','Nam Nghiêm',NULL,NULL,'facebook','1779458645822232',_binary '',NULL,NULL),(13,'2023-09-13 15:22:06','2023-09-13 15:22:06',NULL,'nguyenvietanh5321vn@gmail.com',_binary '\0',NULL,_binary '\0','Nguyễn Việt Anh','$2a$10$X4A3gMdmNvkagffesOO8GOHA2mNcxd05rodyXhlLG.XdvKNI4fwtm',NULL,'local',NULL,_binary '\0',NULL,NULL),(15,'2023-09-13 15:28:48','2023-09-13 15:29:23',NULL,'kienhcm2003@gmail.com',_binary '\0',NULL,_binary '\0','Nghiêm Trung Kiên','$2a$10$SPF0/Ka9s4QQ.C2LHVA9M.0hlEwh0/w55AP4gwTsZfhLT8U7ZALKi','0978987789','local',NULL,_binary '',NULL,NULL),(17,'2023-10-25 23:33:56','2023-10-28 19:00:28','Dao Tu, Quang Phu Cau','kiethcm2002@gmail.com',_binary '\0','http://localhost:8080/image/download.png',_binary '\0','Nghiêm Trường Dương','$2a$10$0KIPqxgA.sGaPPDJ0DQfAu19tguIapk.nH6WodZfIwHPbBw4koF2i','0397507826','local',NULL,_binary '',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-07  2:00:25

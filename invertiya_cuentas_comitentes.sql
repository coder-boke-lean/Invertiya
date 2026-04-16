CREATE DATABASE  IF NOT EXISTS `invertiya` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `invertiya`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: invertiya
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `cuentas_comitentes`
--

DROP TABLE IF EXISTS `cuentas_comitentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_comitentes` (
  `id_cliente` int NOT NULL,
  `cuit` varchar(20) DEFAULT NULL,
  `nombre_completo` varchar(40) NOT NULL,
  `edad` int DEFAULT NULL,
  `ocupacion` varchar(40) DEFAULT NULL,
  `mail` varchar(40) NOT NULL,
  `id_asesor` int NOT NULL,
  `saldo` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id_cliente`),
  KEY `fk_cliente_asesor` (`id_asesor`),
  CONSTRAINT `fk_cliente_asesor` FOREIGN KEY (`id_asesor`) REFERENCES `asesores` (`id_asesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_comitentes`
--

LOCK TABLES `cuentas_comitentes` WRITE;
/*!40000 ALTER TABLE `cuentas_comitentes` DISABLE KEYS */;
INSERT INTO `cuentas_comitentes` VALUES (1,'2010101010','Leandro Cavalli',28,'Analista Financiero','leandro@mail.com',101,0.00),(2,'2720202020','Ana Garcia',35,'Arquitecta','ana@mail.com',102,0.00),(3,'2030303030','Carlos Perez',42,'Medico','carlos@mail.com',101,0.00),(4,'2740404040','Maria Lopez',24,'Estudiante','maria@mail.com',103,0.00),(5,'2050505050','Juan Rodriguez',50,'Empresario','juan@mail.com',105,0.00),(6,'2760606060','Lucia Fernandez',31,'Diseñadora','lucia@mail.com',104,0.00),(7,'2070707070','Jorge Martinez',39,'Abogado','jorge@mail.com',101,0.00),(8,'2780808080','Elena Gomez',45,'Docente','elena@mail.com',106,0.00),(9,'2090909090','Pedro Sanchez',19,'Programador','pedro@mail.com',107,0.00),(10,'2711111111','Silvia Torres',60,'Jubilada','silvia@mail.com',108,0.00);
/*!40000 ALTER TABLE `cuentas_comitentes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_control_edad` BEFORE INSERT ON `cuentas_comitentes` FOR EACH ROW BEGIN
    IF NEW.edad < 13 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Edad insuficiente para operar (Mínimo 13 años)';
    END IF;
END */;;
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

-- Dump completed on 2026-04-15 14:49:02

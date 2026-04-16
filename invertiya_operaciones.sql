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
-- Table structure for table `operaciones`
--

DROP TABLE IF EXISTS `operaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operaciones` (
  `id_operacion` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_asesor` int NOT NULL,
  `tipo_operacion` varchar(40) DEFAULT NULL,
  `fecha` date NOT NULL,
  `cantidad` int NOT NULL,
  `ticker` varchar(40) NOT NULL,
  `total_operacion` int DEFAULT NULL,
  PRIMARY KEY (`id_operacion`),
  KEY `fk_ope_cliente` (`id_cliente`),
  KEY `fk_ope_asesor` (`id_asesor`),
  KEY `fk_ope_activo` (`ticker`),
  CONSTRAINT `fk_ope_activo` FOREIGN KEY (`ticker`) REFERENCES `activos` (`ticker`),
  CONSTRAINT `fk_ope_asesor` FOREIGN KEY (`id_asesor`) REFERENCES `asesores` (`id_asesor`),
  CONSTRAINT `fk_ope_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cuentas_comitentes` (`id_cliente`),
  CONSTRAINT `chk_tipo_ope` CHECK ((`tipo_operacion` in (_utf8mb4'Compra',_utf8mb4'Venta')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operaciones`
--

LOCK TABLES `operaciones` WRITE;
/*!40000 ALTER TABLE `operaciones` DISABLE KEYS */;
INSERT INTO `operaciones` VALUES (1,1,101,'Compra','2026-03-05',10,'AAPL',185000),(2,2,102,'Compra','2026-03-05',100,'AL30',52000),(3,3,101,'Compra','2026-03-06',5,'MSFT',105000),(4,4,103,'Compra','2026-03-06',50,'KO',475000),(5,1,101,'Venta','2026-03-07',2,'AAPL',37000),(6,5,105,'Compra','2026-03-08',1,'BTC',65000000),(7,6,104,'Compra','2026-03-08',20,'MELI',700000),(8,7,101,'Compra','2026-03-09',200,'GD30',110000),(9,8,106,'Compra','2026-03-10',10,'GOLD',120000),(10,9,107,'Compra','2026-03-10',5,'TSLA',75000);
/*!40000 ALTER TABLE `operaciones` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_actualizar_saldo_post_compra` AFTER INSERT ON `operaciones` FOR EACH ROW BEGIN
    DECLARE v_costo INT;
    SELECT precio INTO v_costo FROM activos WHERE ticker = NEW.ticker;
    
    UPDATE cuentas_comitentes 
    SET saldo = saldo - (v_costo * NEW.cantidad)
    WHERE id_cliente = NEW.id_cliente;
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

-- Dump completed on 2026-04-15 14:49:01

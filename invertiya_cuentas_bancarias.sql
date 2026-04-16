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
-- Table structure for table `cuentas_bancarias`
--

DROP TABLE IF EXISTS `cuentas_bancarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_bancarias` (
  `id_transferencia` int NOT NULL,
  `id_cliente` int NOT NULL,
  `nombre_banco` varchar(40) NOT NULL,
  `nro_cuenta` int NOT NULL,
  `moneda` varchar(40) NOT NULL,
  PRIMARY KEY (`id_transferencia`),
  KEY `fk_banco_cliente_comitente` (`id_cliente`),
  CONSTRAINT `fk_banco_cliente_comitente` FOREIGN KEY (`id_cliente`) REFERENCES `cuentas_comitentes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_bancarias`
--

LOCK TABLES `cuentas_bancarias` WRITE;
/*!40000 ALTER TABLE `cuentas_bancarias` DISABLE KEYS */;
INSERT INTO `cuentas_bancarias` VALUES (501,1,'Galicia',123456,'ARS'),(502,2,'Santander',223344,'USD'),(503,3,'BBVA',998877,'ARS'),(504,4,'Macro',445566,'ARS'),(505,5,'ICBC',112233,'USD'),(506,6,'Brubank',556677,'ARS'),(507,7,'HSBC',334455,'ARS'),(508,8,'Provincia',667788,'ARS'),(509,9,'Lemon',778899,'ARS'),(510,10,'Nacion',889900,'ARS');
/*!40000 ALTER TABLE `cuentas_bancarias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-15 14:49:02

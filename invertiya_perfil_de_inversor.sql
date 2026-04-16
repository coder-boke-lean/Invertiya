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
-- Table structure for table `perfil_de_inversor`
--

DROP TABLE IF EXISTS `perfil_de_inversor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil_de_inversor` (
  `id_cliente` int NOT NULL,
  `perfil` varchar(40) DEFAULT NULL,
  `capacidad_ahorro` int DEFAULT NULL,
  `patrimonio_porcentaje` int DEFAULT NULL,
  `horizonte_inversion_years` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `fk_perfil_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cuentas_comitentes` (`id_cliente`),
  CONSTRAINT `chk_perfil_inversor` CHECK ((`perfil` in (_utf8mb4'Conservador',_utf8mb4'Moderado',_utf8mb4'Arriesgado')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_de_inversor`
--

LOCK TABLES `perfil_de_inversor` WRITE;
/*!40000 ALTER TABLE `perfil_de_inversor` DISABLE KEYS */;
INSERT INTO `perfil_de_inversor` VALUES (1,'Moderado',500,20,5),(2,'Conservador',300,10,2),(3,'Moderado',1000,30,10),(4,'Arriesgado',100,50,15),(5,'Moderado',5000,15,8),(6,'Arriesgado',400,25,12),(7,'Moderado',1500,20,7),(8,'Conservador',600,10,3),(9,'Arriesgado',200,40,20),(10,'Conservador',800,5,4);
/*!40000 ALTER TABLE `perfil_de_inversor` ENABLE KEYS */;
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

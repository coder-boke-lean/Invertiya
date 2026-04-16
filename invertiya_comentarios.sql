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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_operacion` int DEFAULT NULL,
  `tipo_operacion` varchar(40) DEFAULT NULL,
  `motivo_operacion` varchar(200) NOT NULL,
  `expectativa` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `fk_comentario_operacion_id` (`id_operacion`),
  CONSTRAINT `fk_comentario_operacion_id` FOREIGN KEY (`id_operacion`) REFERENCES `operaciones` (`id_operacion`),
  CONSTRAINT `chk_comentario_tipo` CHECK ((`tipo_operacion` in (_utf8mb4'Compra',_utf8mb4'Venta'))),
  CONSTRAINT `chk_expectativa` CHECK ((`expectativa` in (_utf8mb4'Alcista',_utf8mb4'Bajista')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,1,1,'Compra','Diversificación tecnológica','Alcista'),(2,2,2,'Compra','Cobertura en bonos soberanos','Bajista'),(3,3,3,'Compra','Apuesta a software y nube','Alcista'),(4,4,4,'Compra','Activo defensivo por dividendos','Alcista'),(5,1,5,'Venta','Toma de ganancias parcial','Bajista'),(6,5,6,'Compra','Inversión en reserva de valor digital','Alcista'),(7,6,7,'Compra','E-commerce regional sólido','Alcista'),(8,7,8,'Compra','Oportunidad por arbitraje de bonos','Alcista'),(9,8,9,'Compra','Protección contra inflación','Bajista'),(10,9,10,'Compra','Crecimiento en sector automotriz','Alcista');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-15 14:49:01

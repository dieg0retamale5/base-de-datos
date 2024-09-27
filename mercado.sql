-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mercado
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artesano`
--

DROP TABLE IF EXISTS `artesano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artesano` (
  `artesano_id` int NOT NULL AUTO_INCREMENT,
  `nombre_artesano` varchar(45) NOT NULL DEFAULT 'Nombre Apellido',
  `teléfono` varchar(9) NOT NULL DEFAULT '900000000',
  `correo_electrónico` varchar(45) NOT NULL DEFAULT 'example@mail.com',
  `dirección` varchar(255) NOT NULL DEFAULT 'numero, calle, comuna, región',
  PRIMARY KEY (`artesano_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artesano`
--

LOCK TABLES `artesano` WRITE;
/*!40000 ALTER TABLE `artesano` DISABLE KEYS */;
INSERT INTO `artesano` VALUES (1,'María López','912356244','maria.lopez@mail.com','5878, Calle Verdad, Comuna, Región'),(2,'Carlos Gómez','987321321','carlos.gomez@mail.com','3234, Calle Falsa, Comuna, Región'),(3,'Laura Ruiz','955678123','laura.ruiz@mail.com','6989, Calle Centro, Comuna, Región');
/*!40000 ALTER TABLE `artesano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(45) NOT NULL DEFAULT 'Nombre Apellidos',
  `correo_electrónico` varchar(45) NOT NULL DEFAULT 'example@mail.com',
  `teléfono` varchar(9) NOT NULL DEFAULT '900000000',
  `dirección` varchar(255) NOT NULL DEFAULT 'numero, calle, comuna, región',
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Pérez','juan.perez@mail.com','912345678','1234, Calle Falsa, Comuna, Región'),(2,'Ana López','ana.lopez@mail.com','987654321','5678, Calle Real, Comuna, Región'),(3,'Pedro García','pedro.garcia@mail.com','955678123','9876, Calle Nueva, Comuna, Región');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_pedido` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `fecha_estimada` date NOT NULL,
  `fecha_pedido` date NOT NULL,
  `estado_pedido` varchar(20) NOT NULL DEFAULT 'pendiente',
  `tipo_entrega` varchar(30) NOT NULL DEFAULT 'retiro en tienda',
  PRIMARY KEY (`detalle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,'2024-10-01','2024-09-26','pendiente','retiro en tienda');
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `detalle_id` int DEFAULT NULL,
  `cantidad` int NOT NULL DEFAULT '0',
  `precio_total` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`pedido_id`),
  KEY `detalle_id` (`detalle_id`),
  KEY `pedido_fk_cliente` (`cliente_id`),
  CONSTRAINT `pedido_fk_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`detalle_id`) REFERENCES `detalle_pedido` (`detalle_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,1,1,500),(2,2,1,2,300),(3,3,1,1,150);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `tienda_id` int DEFAULT NULL,
  `pedido_id` int DEFAULT NULL,
  `nombre_producto` varchar(50) NOT NULL DEFAULT 'nombre producto',
  `descripcion` text NOT NULL,
  `precio` float NOT NULL DEFAULT '0',
  `stock` int NOT NULL DEFAULT '0',
  `fecha_agregado` date NOT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `tienda_id` (`tienda_id`),
  KEY `producto_fk_pedido` (`pedido_id`),
  CONSTRAINT `producto_fk_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`pedido_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`tienda_id`) REFERENCES `tienda` (`tienda_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,NULL,'Escultura de Madera','Escultura artesanal de madera',500,10,'2024-09-26'),(2,1,NULL,'Joyería de Plata','Collar de plata artesanal',300,5,'2024-09-26'),(3,2,NULL,'Cerámica','Vaso de cerámica hecho a mano',150,20,'2024-09-26'),(4,3,NULL,'Mueble de Madera','Mesa de madera reciclada',1000,2,'2024-09-26');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tienda` (
  `tienda_id` int NOT NULL AUTO_INCREMENT,
  `artesano_id` int NOT NULL,
  `nombre_tienda` varchar(45) NOT NULL DEFAULT 'Nombre Tienda',
  `descripcion` text NOT NULL,
  `fecha_creacion` date NOT NULL,
  PRIMARY KEY (`tienda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,1,'Tienda Uno','Descripción de Tienda Uno','2024-01-01'),(2,2,'Tienda Dos','Descripción de Tienda Dos','2024-01-02'),(3,3,'Tienda Tres','Descripción de Tienda Tres','2024-01-03');
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-27  1:35:13

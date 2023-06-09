-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: publisher
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB-1:10.11.2+maria~ubu2204

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
-- Table structure for table `Mueble`
--

DROP TABLE IF EXISTS `Mueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mueble` (
  `id` int(11) NOT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `color` varchar(64) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `agotado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mueble`
--

LOCK TABLES `Mueble` WRITE;
/*!40000 ALTER TABLE `Mueble` DISABLE KEYS */;
INSERT INTO `Mueble` VALUES
(1,'cama','roja',1246,1),
(2,'mesa','verde',2246,0),
(3,'silla','azul',3246,1),
(4,'ropero','negra',4246,0),
(5,'estufa','blanco',5246,1);
/*!40000 ALTER TABLE `Mueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Persona`
--

DROP TABLE IF EXISTS `Persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apPat` varchar(64) DEFAULT NULL,
  `apMaterno` varchar(64) DEFAULT NULL,
  `sueldo` decimal(10,0) DEFAULT NULL,
  `genero` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persona`
--

LOCK TABLES `Persona` WRITE;
/*!40000 ALTER TABLE `Persona` DISABLE KEYS */;
INSERT INTO `Persona` VALUES
(1,'Gustavo','Arellano','Fox',111,1),
(2,'Adolfo','Sandoval','Slim',222,0),
(3,'Luis','Torres','perez',322,0),
(4,'Pedro','Lopez','Rodriguez',422,0),
(5,'Mario','Casa','Rios',522,0);
/*!40000 ALTER TABLE `Persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristica_producto`
--

DROP TABLE IF EXISTS `caracteristica_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristica_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `activa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristica_producto`
--

LOCK TABLES `caracteristica_producto` WRITE;
/*!40000 ALTER TABLE `caracteristica_producto` DISABLE KEYS */;
INSERT INTO `caracteristica_producto` VALUES
(1,1,'Incluye 2 controles.',1),
(2,1,'Resolución de 720 px x 1080 px.',0),
(3,1,'Memoria RAM de 4GB.',1),
(4,1,'Tiene pantalla táctil.',0),
(5,1,'La duración de la batería es de 9h.',1),
(6,2,'Monitor doble portatil de 11,9 pulgadas para computadora o laptop.',1),
(7,2,'Resolución full HD',1),
(8,2,'pantalla doble adaptable a computadora portatil.',1),
(9,2,' puertos USB A, USB-C',1),
(10,2,'mini HDMI para vinculación con dispositivos.',1),
(11,3,'Memoria RAM:6 GB',1),
(12,3,'Batería de 5000mAh.',1),
(13,3,'Compatible con redes 5G.',0),
(14,3,'Pantalla OLED de 6.4\".',0),
(15,3,'Procesador Snapdragon 695 5G Octa-Core de 2.2GHz',1),
(16,4,'Con pantalla táctil: Sí',1),
(17,4,'Es resistente al agua: Sí',1),
(18,4,'Con GPS: No',1),
(19,4,'Con Bluetooth: Sí',1),
(20,4,'smartband',1),
(21,5,'Es inalámbrico: Sí',1),
(22,5,'Con función percutor: Sí',0),
(23,5,'Tamaño del mandril: 10 mm',1),
(24,5,'Velocidad máxima de rotación: 1450 rpm',1),
(25,5,'Con función destornillador: Sí',1);
/*!40000 ALTER TABLE `caracteristica_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen_producto`
--

DROP TABLE IF EXISTS `imagen_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagen_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `nombre` varchar(256) DEFAULT NULL,
  `activa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen_producto`
--

LOCK TABLES `imagen_producto` WRITE;
/*!40000 ALTER TABLE `imagen_producto` DISABLE KEYS */;
INSERT INTO `imagen_producto` VALUES
(1,1,'p-1-a.webp',1),
(2,1,'p-1-b.webp',1),
(3,1,'p-1-c.webp',1),
(4,1,'p-1-d.webp',1),
(5,1,'p-1-e.webp',1),
(6,2,'p-2-a.webp',1),
(7,2,'p-2-b.webp',1),
(8,2,'p-2-c.webp',1),
(9,2,'p-2-d.webp',1),
(10,2,'p-2-e.webp',1),
(11,3,'p-3-a.webp',1),
(12,3,'p-3-b.webp',1),
(13,3,'p-3-c.webp',1),
(14,3,'p-3-d.webp',1),
(15,3,'p-3-e.webp',1),
(16,4,'p-4-a.webp',1),
(17,4,'p-4-b.webp',1),
(18,4,'p-4-c.webp',1),
(19,4,'p-4-d.webp',1),
(20,4,'p-4-e.webp',1),
(21,5,'p-5-a.webp',1),
(22,5,'p-5-b.webp',1),
(23,5,'p-5-cwebp',1),
(24,5,'p-5-d.webp',1),
(25,5,'p-5-e.webp',1);
/*!40000 ALTER TABLE `imagen_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nuevo` varchar(50) DEFAULT NULL,
  `vendidos` int(11) DEFAULT NULL,
  `resenas` int(11) DEFAULT NULL,
  `total_stars` decimal(10,0) DEFAULT NULL,
  `nombre` varchar(256) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `meses` int(11) DEFAULT NULL,
  `abono` int(11) DEFAULT NULL,
  `productos_nuevos` int(11) DEFAULT NULL,
  `productos_usados` int(11) DEFAULT NULL,
  `oferta` int(11) DEFAULT NULL,
  `entrega` varchar(256) DEFAULT NULL,
  `full` varchar(64) DEFAULT NULL,
  `llegada` varchar(256) DEFAULT NULL,
  `vendedor` varchar(256) DEFAULT NULL,
  `ventas` int(11) DEFAULT NULL,
  `disponibilidad` varchar(256) DEFAULT NULL,
  `garantia_dias` int(11) DEFAULT NULL,
  `garantia_tiempo` varchar(256) DEFAULT NULL,
  `anios` int(11) DEFAULT NULL,
  `puntos` int(11) DEFAULT NULL,
  `activa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES
(1,'nuevo',500,35,5,'Nintendo Switch 32GB Mario Red & Blue Edition color rojo y azul',9499,12,964,4,6,8789,'envio gratis a todo el pais','full','llega el lunes','siempre abierto',1000,'ultima disponible',30,'1',1,499,1),
(2,'nuevo',50,2,5,'2 Pantallas Para Laptop Portátil Doble Monitor 11,9\'\' 1080p',9799,12,775,18,8,9309,'envio gratis a todo el pais','full','llega en una semana','kist',10000,'ultima disponible',25,'2',1,475,1),
(3,'nuevo',1000,24,5,'Moto G71 128 GB arctic blue 6 GB RAM',7599,12,329,45,78,3949,'envio gratis a todo el pais','full','llega mañana','acshty',100,'ultima disponible',78,'1',2,578,1),
(4,'nuevo',5000,784,5,'Reloj Inteligente Bluetooth Responde Y Hace Llamadas Ip67 A',1447,12,575,57,45,5245,'envio gratis a todo el pais','full','llega el jueves','denve tech',500,'ultima disponible',44,'3',2,1475,1),
(5,'nuevo',5,98,3,'Taladro Atornillador De Impacto Inalámbrico De 1450rpm',4345,12,243,145,78,5755,'envio gratis a todo el pais','full','llega en 2 semanas','aguancat',7000,'ultima disponible',76,'1',1,2347,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 16:58:44

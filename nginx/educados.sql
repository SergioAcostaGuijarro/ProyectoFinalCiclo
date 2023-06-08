-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: db    Database: educados
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `alum_calif`
--

DROP TABLE IF EXISTS `alum_calif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alum_calif` (
  `id_usuario` int DEFAULT NULL,
  `id_calificaciones` int DEFAULT NULL,
  KEY `id_usuario` (`id_usuario`),
  KEY `id_calificaciones` (`id_calificaciones`),
  CONSTRAINT `alum_calif_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `alumno` (`id_usuario`),
  CONSTRAINT `alum_calif_ibfk_2` FOREIGN KEY (`id_calificaciones`) REFERENCES `calificaciones` (`id_calificaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alum_calif`
--

LOCK TABLES `alum_calif` WRITE;
/*!40000 ALTER TABLE `alum_calif` DISABLE KEYS */;
/*!40000 ALTER TABLE `alum_calif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alum_materia`
--

DROP TABLE IF EXISTS `alum_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alum_materia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int DEFAULT NULL,
  `id_materia` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `alum_materia_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_usuario`),
  CONSTRAINT `alum_materia_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alum_materia`
--

LOCK TABLES `alum_materia` WRITE;
/*!40000 ALTER TABLE `alum_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `alum_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `id_curso` int DEFAULT NULL,
  `curso` varchar(50) DEFAULT NULL,
  `primer_login` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `curso` (`curso`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`curso`) REFERENCES `curso` (`curso`),
  CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (4,'Sergio','sergio@gmail.com','3bffa4ebdf4874e506c2b12405796aa5',1,'ASIR1',1),(5,'Ale','ale@gmail.com','703042aefd627a8c86c4de140cc80c6e',2,'ASIR2',1),(8,'Jordan','jordan@gmail.com','d16d377af76c99d27093abc22244b342',2,'ASIR2',1),(9,'Marcos','marcos@gmail.com','c5e3539121c4944f2bbe097b425ee774',1,'ASIR1',1),(10,'SERGIO','acostaguijarrosergio@gmail.com','3bffa4ebdf4874e506c2b12405796aa5',1,'ASIR1',1);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `insert_alumno_trigger` AFTER UPDATE ON `alumno` FOR EACH ROW BEGIN
    INSERT INTO calificaciones (id_alumno, alumno, id_materia, materia, primer_ev, segunda_ev, tercer_ev)
    SELECT NEW.id_usuario, NEW.nombre, m.id_materia, m.materia, 0, 0, 0
    FROM materia m
    INNER JOIN curso c ON m.id_curso = c.id_curso
    WHERE c.curso = NEW.curso;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `alumno_curso`
--

DROP TABLE IF EXISTS `alumno_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_curso` (
  `id_relacion` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  PRIMARY KEY (`id_relacion`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `alumno_curso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `alumno` (`id_usuario`),
  CONSTRAINT `alumno_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_curso`
--

LOCK TABLES `alumno_curso` WRITE;
/*!40000 ALTER TABLE `alumno_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
  `id_calificaciones` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int DEFAULT NULL,
  `alumno` varchar(50) DEFAULT NULL,
  `id_materia` int DEFAULT NULL,
  `materia` varchar(50) DEFAULT NULL,
  `primer_ev` int DEFAULT NULL,
  `segunda_ev` int DEFAULT NULL,
  `tercer_ev` int DEFAULT NULL,
  `actitud` int DEFAULT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  `nota_media` float GENERATED ALWAYS AS ((((`primer_ev` + `segunda_ev`) + `tercer_ev`) / 3)) STORED,
  PRIMARY KEY (`id_calificaciones`),
  KEY `id_materia` (`id_materia`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` (`id_calificaciones`, `id_alumno`, `alumno`, `id_materia`, `materia`, `primer_ev`, `segunda_ev`, `tercer_ev`, `actitud`, `comentario`) VALUES (1,4,'Sergio',1,'BBDD',0,0,0,NULL,NULL),(2,4,'Sergio',2,'SO',0,0,0,NULL,NULL),(4,5,'Ale',3,'ABBDD',0,0,0,NULL,NULL),(5,5,'Ale',4,'ASO',0,0,0,NULL,NULL),(7,9,'Marcos',1,'BBDD',5,5,5,10,'Trabajador'),(8,9,'Marcos',2,'SO',5,5,5,10,'Trabajador'),(10,8,'Jordan',3,'ABBDD',0,0,0,NULL,NULL),(11,8,'Jordan',4,'ASO',0,0,0,NULL,NULL),(13,10,'SERGIO',1,'BBDD',0,0,0,NULL,NULL),(14,10,'SERGIO',2,'SO',0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `curso` varchar(50) DEFAULT NULL,
  `tutor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `curso` (`curso`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'ASIR1','Carlos'),(2,'ASIR2','Jose');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `materia` varchar(50) DEFAULT NULL,
  `id_profesor` int DEFAULT NULL,
  `profesor` varchar(50) DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  `curso` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_materia`),
  KEY `id_curso` (`id_curso`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'BBDD',2,'Jose',1,'ASIR1'),(2,'SO',1,'Carlos',1,'ASIR1'),(3,'ABBDD',2,'Jose',2,'ASIR2'),(4,'ASO',NULL,'Crlos',2,'ASIR2');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `update_profesor_materia_curso` BEFORE INSERT ON `materia` FOR EACH ROW BEGIN
    SET NEW.id_curso = (SELECT id_curso FROM curso WHERE curso.curso = NEW.curso);
    SET NEW.id_profesor = (SELECT id_usuario FROM profesor WHERE profesor.nombre = NEW.profesor);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `insert_materia_calificaciones` AFTER INSERT ON `materia` FOR EACH ROW BEGIN
      update calificaciones set id_materia=(NEW.id_materia), materia=(NEW.materia);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `actualizar_id_profesor` BEFORE UPDATE ON `materia` FOR EACH ROW BEGIN
    SET NEW.id_profesor = (SELECT id_usuario FROM profesor WHERE nombre = NEW.profesor);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `materia_calif`
--

DROP TABLE IF EXISTS `materia_calif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_calif` (
  `id_materia` int DEFAULT NULL,
  `id_calificaciones` int DEFAULT NULL,
  KEY `id_materia` (`id_materia`),
  KEY `id_calificaciones` (`id_calificaciones`),
  CONSTRAINT `materia_calif_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `materia_calif_ibfk_2` FOREIGN KEY (`id_calificaciones`) REFERENCES `calificaciones` (`id_calificaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_calif`
--

LOCK TABLES `materia_calif` WRITE;
/*!40000 ALTER TABLE `materia_calif` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia_calif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_curso`
--

DROP TABLE IF EXISTS `materia_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_curso` (
  `id_materia_curso` int NOT NULL AUTO_INCREMENT,
  `id_materia` int DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  PRIMARY KEY (`id_materia_curso`),
  KEY `id_materia` (`id_materia`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `materia_curso_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `materia_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_curso`
--

LOCK TABLES `materia_curso` WRITE;
/*!40000 ALTER TABLE `materia_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padre`
--

DROP TABLE IF EXISTS `padre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `padre` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `id_hijo` int DEFAULT NULL,
  `hijo` varchar(50) DEFAULT NULL,
  `primer_login` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_hijo` (`id_hijo`),
  CONSTRAINT `padre_ibfk_1` FOREIGN KEY (`id_hijo`) REFERENCES `alumno` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padre`
--

LOCK TABLES `padre` WRITE;
/*!40000 ALTER TABLE `padre` DISABLE KEYS */;
INSERT INTO `padre` VALUES (6,'Elena','elena@gmail.com','fadf17141f3f9c3389d10d09db99f757',4,'Sergio',1),(7,'Julio','julio@gmail.com','c027636003b468821081e281758e35ff',NULL,NULL,1);
/*!40000 ALTER TABLE `padre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padre_hijo`
--

DROP TABLE IF EXISTS `padre_hijo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `padre_hijo` (
  `id_relación` int NOT NULL AUTO_INCREMENT,
  `id_padre` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_relación`),
  KEY `id_padre` (`id_padre`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `padre_hijo_ibfk_1` FOREIGN KEY (`id_padre`) REFERENCES `padre` (`id_usuario`),
  CONSTRAINT `padre_hijo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `alumno` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padre_hijo`
--

LOCK TABLES `padre_hijo` WRITE;
/*!40000 ALTER TABLE `padre_hijo` DISABLE KEYS */;
/*!40000 ALTER TABLE `padre_hijo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_materia`
--

DROP TABLE IF EXISTS `prof_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prof_materia` (
  `id_prof_materia` int NOT NULL AUTO_INCREMENT,
  `id_profesor` int DEFAULT NULL,
  `id_materia` int DEFAULT NULL,
  PRIMARY KEY (`id_prof_materia`),
  KEY `id_profesor` (`id_profesor`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `prof_materia_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_usuario`),
  CONSTRAINT `prof_materia_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_materia`
--

LOCK TABLES `prof_materia` WRITE;
/*!40000 ALTER TABLE `prof_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `prof_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'Carlos','carlos@gmail.com','dc599a9972fde3045dab59dbd1ae170b'),(2,'Jose','jose@gmail.com','d27c9589143b57f1954d0d0ca655cda7');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Carlos','carlos@gmail.com','dc599a9972fde3045dab59dbd1ae170b','profesor'),(2,'Jose','jose@gmail.com','d27c9589143b57f1954d0d0ca655cda7','profesor'),(3,'Admin','admin@educados.com','21232f297a57a5a743894a0e4a801fc3','admintech644394412'),(4,'Sergio','sergio@gmail.com','3bffa4ebdf4874e506c2b12405796aa5','alumno'),(5,'Ale','ale@gmail.com','703042aefd627a8c86c4de140cc80c6e','alumno'),(6,'Elena','elena@gmail.com','fadf17141f3f9c3389d10d09db99f757','padre'),(7,'Julio','julio@gmail.com','c027636003b468821081e281758e35ff','padre'),(8,'Jordan','jordan@gmail.com','d16d377af76c99d27093abc22244b342','alumno'),(9,'Marcos','marcos@gmail.com','c5e3539121c4944f2bbe097b425ee774','alumno'),(10,'SERGIO','acostaguijarrosergio@gmail.com','3bffa4ebdf4874e506c2b12405796aa5','alumno');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `insert_alumno` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
   IF NEW.tipo_usuario = 'alumno' THEN
      INSERT INTO alumno (id_usuario, nombre, correo, contrasena)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contrasena);
   END IF;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `insert_padre` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
   IF NEW.tipo_usuario = 'padre' THEN
      INSERT INTO padre (id_usuario, nombre, correo, contrasena)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contrasena);
   END IF;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `insert_profesor` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
   IF NEW.tipo_usuario = 'profesor' THEN
      INSERT INTO profesor (id_usuario, nombre, correo, contrasena)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contrasena);
   END IF;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `update_padre_usuario` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
        UPDATE padre SET nombre = NEW.nombre, correo = NEW.correo WHERE id_usuario = OLD.id_usuario;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `update_alumno_usuario` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
      update alumno set nombre=(NEW.nombre), correo=(NEW.correo) where id_usuario=(OLD.id_usuario);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `update_usuario_profesor` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
      update profesor set nombre=(NEW.nombre), correo=(NEW.correo) where id_usuario=(OLD.id_usuario);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `delete_padre_usuario` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
    DELETE FROM padre WHERE id_usuario = OLD.id_usuario;
    DELETE FROM calificaciones WHERE id_alumno = OLD.id_usuario;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `delete_alumno_usuario` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
    DELETE FROM alumno WHERE id_usuario=(OLD.id_usuario);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`db`*/ /*!50003 TRIGGER `delete_usuario_profesor` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
    DELETE FROM profesor WHERE id_usuario=(OLD.id_usuario);
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

-- Dump completed on 2023-05-23 14:22:01

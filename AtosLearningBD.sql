CREATE DATABASE  IF NOT EXISTS `atoslearning` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `atoslearning`;
-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: 34.123.3.137    Database: atoslearning
-- ------------------------------------------------------
-- Server version	8.0.26-google

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Answers`
--

DROP TABLE IF EXISTS `Answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Answers` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `answer_title` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `Answers_Questions_question_id_fk` (`question_id`),
  CONSTRAINT `Answers_Questions_question_id_fk` FOREIGN KEY (`question_id`) REFERENCES `Questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answers`
--

LOCK TABLES `Answers` WRITE;
/*!40000 ALTER TABLE `Answers` DISABLE KEYS */;
INSERT INTO `Answers` VALUES (1,7,'1',0),(2,7,'2',0),(3,7,'5',0),(4,7,'4',1),(5,8,'4',1),(6,8,'8',0),(7,8,'3',0),(8,8,'6',0),(17,14,'E 1',0),(18,14,'E 2',1),(19,14,'E 3',0),(20,14,'E 4',0),(21,15,'IT1',1),(22,15,'IT2',0),(23,15,'IT3',0),(24,15,'IT4',0),(25,16,'2it1',0),(26,16,'2it2',1),(27,16,'2it3',0),(28,16,'2it4',0);
/*!40000 ALTER TABLE `Answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course_Users`
--

DROP TABLE IF EXISTS `Course_Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Course_Users` (
  `course_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`course_id`),
  KEY `Course_Users_Course_fk` (`course_id`),
  CONSTRAINT `Course_Users_Course_fk` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`),
  CONSTRAINT `Course_Users_User_fk` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course_Users`
--

LOCK TABLES `Course_Users` WRITE;
/*!40000 ALTER TABLE `Course_Users` DISABLE KEYS */;
INSERT INTO `Course_Users` VALUES (1,1),(1,3),(1,5),(1,11),(3,9);
/*!40000 ALTER TABLE `Course_Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  `course_code` varchar(5) NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES (1,'Primer grado','AKE2P',2),(3,'Curso de Nintendo','972e6',8),(4,'Curso de Regina','03ce9',10);
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exam_Submissions`
--

DROP TABLE IF EXISTS `Exam_Submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exam_Submissions` (
  `user_id` int NOT NULL,
  `end_date_time` datetime NOT NULL,
  `exam_id` int NOT NULL,
  `exam_score` float NOT NULL,
  PRIMARY KEY (`user_id`,`exam_id`),
  KEY `Exam_Submissions_Exam_fk` (`exam_id`),
  CONSTRAINT `Exam_Submissions_Exam_fk` FOREIGN KEY (`exam_id`) REFERENCES `Exams` (`exam_id`),
  CONSTRAINT `Exam_Submissions_User_fk` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exam_Submissions`
--

LOCK TABLES `Exam_Submissions` WRITE;
/*!40000 ALTER TABLE `Exam_Submissions` DISABLE KEYS */;
INSERT INTO `Exam_Submissions` VALUES (1,'2023-06-14 03:45:26',10,50),(1,'2023-06-14 01:49:26',33,0);
/*!40000 ALTER TABLE `Exam_Submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exams`
--

DROP TABLE IF EXISTS `Exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exams` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `exam_title` varchar(45) NOT NULL,
  `exam_description` varchar(255) NOT NULL,
  `due_date` datetime NOT NULL,
  `exam_image` varchar(255) NOT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `Exams_Subject_fk` (`subject_id`),
  CONSTRAINT `Exams_Subject_fk` FOREIGN KEY (`subject_id`) REFERENCES `Subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exams`
--

LOCK TABLES `Exams` WRITE;
/*!40000 ALTER TABLE `Exams` DISABLE KEYS */;
INSERT INTO `Exams` VALUES (10,2,'Álgebra 1','Alguna descripcion','2023-06-30 23:59:59','https://concepto.de/wp-content/uploads/2019/12/algebra-e1577465340342.jpg'),(11,2,'Aritmética','Cosas','2023-09-01 23:59:59','https://www.definicionabc.com/wp-content/uploads/2009/11/aritmetica.jpg'),(12,2,'Sumas y restas','Sumar y restar cosas','2023-08-01 23:59:59','https://st2.depositphotos.com/1963585/7142/v/950/depositphotos_71423003-stock-illustration-seamless-background-with-arithmetic-symbols.jpg'),(13,2,'Fracciones','Descripcion para fracciones','2023-06-01 23:59:59','https://media.istockphoto.com/id/1206267095/es/foto/pastel-de-queso-rebanado-sobre-un-fondo-de-arco-iris-rebanadas-de-tarta-de-queso.jpg?s=612x612&w=0&k=20&c=EXcLkkUr-5I_QUVy0xEi4PYCkVtfavaIrfpQFZh-NZU='),(14,2,'Álgebra Avanzada','Examen de medio termino ','2021-05-20 00:00:00','https://www.science.edu/acellus/wp-content/uploads/2017/01/Algebra-2-712x388-712x388.jpg'),(33,11,'Primer parcial de italiano','Descripción de examen de italiano','2023-06-16 23:59:00','https://via.placeholder.com/150'),(34,11,'Segundo parcial de Italiano','feoiufgjwporeijio','2023-08-08 00:00:00','https://via.placeholder.com/11');
/*!40000 ALTER TABLE `Exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question_title` varchar(45) NOT NULL,
  `exam_id` int NOT NULL,
  `time_limit` int NOT NULL COMMENT 'Question time in seconds',
  PRIMARY KEY (`question_id`),
  KEY `Questions_Exams_fk` (`exam_id`),
  CONSTRAINT `Questions_Exams_fk` FOREIGN KEY (`exam_id`) REFERENCES `Exams` (`exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES (7,'Cuanto es 2+2?',10,10),(8,'Cuanto es 2x2?',10,15),(14,'Pregunta 1 de italiano',33,0),(15,'Pregunta 1 de italiano',34,0),(16,'Pregunta 2 de italiano',34,0);
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subjects`
--

DROP TABLE IF EXISTS `Subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Subjects` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(45) NOT NULL,
  `course_id` int NOT NULL,
  `subject_description` varchar(255) NOT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `Subjects_Courses_course_id_fk` (`course_id`),
  CONSTRAINT `Subjects_Courses_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subjects`
--

LOCK TABLES `Subjects` WRITE;
/*!40000 ALTER TABLE `Subjects` DISABLE KEYS */;
INSERT INTO `Subjects` VALUES (2,'Matemáticas 1',1,'Descripcion de mate'),(3,'Computación 1',1,'Descripcion de compu'),(4,'Alemán 1',1,'Descripcion de aleman'),(5,'Álgebra 1',1,'Descripcion de algebra'),(6,'Inglés 1',1,'Descripcion de ingles'),(8,'Programación 1',1,'Progra en c++'),(9,'Artes 1',1,'Mamada de artes'),(11,'Italiano',1,'En este curso aprenderemos sobre la cultura y los tiempos en presente y pasado limpio '),(12,'Mate',4,'mate 1');
/*!40000 ALTER TABLE `Subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Submitted_Answers`
--

DROP TABLE IF EXISTS `Submitted_Answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Submitted_Answers` (
  `user_id` int NOT NULL,
  `answer_id` int NOT NULL,
  `submission_id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL,
  PRIMARY KEY (`submission_id`),
  KEY `Submitted_Answers_Answers_answer_id_fk` (`answer_id`),
  KEY `Submitted_Answers_Users_user_id_fk` (`user_id`),
  KEY `Submitted_Answers_Exams_exam_id_fk` (`exam_id`),
  CONSTRAINT `Submitted_Answers_Answers_answer_id_fk` FOREIGN KEY (`answer_id`) REFERENCES `Answers` (`answer_id`),
  CONSTRAINT `Submitted_Answers_Exams_exam_id_fk` FOREIGN KEY (`exam_id`) REFERENCES `Exams` (`exam_id`),
  CONSTRAINT `Submitted_Answers_Users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Submitted_Answers`
--

LOCK TABLES `Submitted_Answers` WRITE;
/*!40000 ALTER TABLE `Submitted_Answers` DISABLE KEYS */;
INSERT INTO `Submitted_Answers` VALUES (1,17,96,33),(1,5,100,10),(1,1,101,10);
/*!40000 ALTER TABLE `Submitted_Answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Auth`
--

DROP TABLE IF EXISTS `User_Auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Auth` (
  `user_id` int NOT NULL,
  `user_password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `User_Auth_Users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Auth`
--

LOCK TABLES `User_Auth` WRITE;
/*!40000 ALTER TABLE `User_Auth` DISABLE KEYS */;
INSERT INTO `User_Auth` VALUES (1,'Contrasena01.'),(2,'SecretPassword2'),(3,'123'),(4,'123'),(5,'123'),(8,'1234'),(9,'no'),(10,'123'),(11,'123'),(12,'222');
/*!40000 ALTER TABLE `User_Auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `character_id` int DEFAULT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `user_total_score` int DEFAULT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_surname` varchar(45) NOT NULL,
  `user_nickname` varchar(45) DEFAULT NULL,
  `is_teacher` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `Users_pk` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Santiago',1,'link',2070,'a00832880@tec.mx','Quihui','santiq',0),(2,'Arturo',NULL,'link',NULL,'arturo@tec.mx','Duran',NULL,1),(3,'Daniela',3,'somelink',0,'daniramos@tec.mx','Ramos','danir',0),(4,'Sofia',0,'somelink2',0,'sofi@tec.mx','Martinez','Sofia',0),(5,'Daniela',0,'https://i.imgur.com/3Z4nB9K.png',0,'danin@tec.mx','Nuño','Danin',0),(8,'Nintendo',NULL,NULL,0,'nintendo@atos.com','Inc','nintendo@atos.com',1),(9,'Claudia',NULL,NULL,0,'clau@ramos.com','Ramos','clau@ramos.com',0),(10,'Regina',NULL,NULL,0,'reginamartinez@tec.mx','Martinez','reginamartinez@tec.mx',1),(11,'Sofia',NULL,NULL,0,'A01721807@tec.mx','Martinez','A01721807@tec.mx',0),(12,'fer',NULL,NULL,0,'das@dfs.com','rere','das@dfs.com',0);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14  3:46:19

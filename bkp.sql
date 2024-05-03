CREATE DATABASE  IF NOT EXISTS `barbearia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `barbearia`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: barbearia
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento` (
  `CODIGO` int NOT NULL AUTO_INCREMENT,
  `CPFCLIENTE` varchar(11) NOT NULL,
  `CPFPROFISSIONAL` varchar(11) NOT NULL,
  `DATAHORAAGENDAMENTO` timestamp NOT NULL,
  `STATUSAGENDAMENTO` int DEFAULT NULL,
  `TOTALSERVICO` float DEFAULT NULL,
  `TEMPOGASTOSERVICO` time DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `CPFCLIENTE` (`CPFCLIENTE`),
  KEY `CPFPROFISSIONAL` (`CPFPROFISSIONAL`),
  CONSTRAINT `agendamento_ibfk_1` FOREIGN KEY (`CPFCLIENTE`) REFERENCES `pessoas` (`CPF`),
  CONSTRAINT `agendamento_ibfk_2` FOREIGN KEY (`CPFPROFISSIONAL`) REFERENCES `pessoas` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
INSERT INTO `agendamento` VALUES (1,'7007267421','12345678','2024-03-05 03:00:00',1,50,'00:30:00'),(2,'7547368421','12345678','2024-03-08 04:00:00',1,120,'01:50:00');
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bairros`
--

DROP TABLE IF EXISTS `bairros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bairros` (
  `CODIGOBAIRRO` int NOT NULL AUTO_INCREMENT,
  `NOMEBAIRRO` varchar(50) NOT NULL,
  PRIMARY KEY (`CODIGOBAIRRO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairros`
--

LOCK TABLES `bairros` WRITE;
/*!40000 ALTER TABLE `bairros` DISABLE KEYS */;
INSERT INTO `bairros` VALUES (1,'LORENA PARK'),(2,'IMPERIAL');
/*!40000 ALTER TABLE `bairros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `CODIGOCIDADE` int NOT NULL AUTO_INCREMENT,
  `NOMECIDADE` varchar(45) NOT NULL,
  `SIGLAESTADO` varchar(2) NOT NULL,
  PRIMARY KEY (`CODIGOCIDADE`),
  KEY `SIGLAESTADO` (`SIGLAESTADO`),
  CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`SIGLAESTADO`) REFERENCES `estados` (`SIGLAESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'GOIANIA','GO'),(2,'GOIANIRA','GO'),(4,'parana','PA');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalhe_agendamento`
--

DROP TABLE IF EXISTS `detalhe_agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalhe_agendamento` (
  `CODIGODETALHAMENTO` int NOT NULL AUTO_INCREMENT,
  `CODIGOAGENDAMENTO` int NOT NULL,
  `CODIGOSERVICO` int NOT NULL,
  PRIMARY KEY (`CODIGODETALHAMENTO`),
  KEY `CODIGOAGENDAMENTO` (`CODIGOAGENDAMENTO`),
  KEY `CODIGOSERVICO` (`CODIGOSERVICO`),
  CONSTRAINT `detalhe_agendamento_ibfk_1` FOREIGN KEY (`CODIGOAGENDAMENTO`) REFERENCES `agendamento` (`CODIGO`),
  CONSTRAINT `detalhe_agendamento_ibfk_2` FOREIGN KEY (`CODIGOSERVICO`) REFERENCES `servicos` (`CODIGOSERVICO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalhe_agendamento`
--

LOCK TABLES `detalhe_agendamento` WRITE;
/*!40000 ALTER TABLE `detalhe_agendamento` DISABLE KEYS */;
INSERT INTO `detalhe_agendamento` VALUES (1,1,1),(2,2,4),(3,2,7),(4,2,10);
/*!40000 ALTER TABLE `detalhe_agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `CODIGOESTADO` int NOT NULL AUTO_INCREMENT,
  `SIGLAESTADO` varchar(2) NOT NULL,
  `NOMEESTADO` varchar(40) NOT NULL,
  PRIMARY KEY (`CODIGOESTADO`),
  UNIQUE KEY `SIGLAESTADO` (`SIGLAESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'GO','GOIANIA'),(2,'TO','PALMAS'),(3,'PA','PARANA');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoas` (
  `CODIGOPESSOA` int NOT NULL AUTO_INCREMENT,
  `CPF` varchar(11) NOT NULL,
  `NOME` varchar(60) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `TELEFONE` varchar(14) NOT NULL,
  `DATANASCTO` date NOT NULL,
  `LOGRADOURO` varchar(100) DEFAULT NULL,
  `COMPLEMENTO` varchar(40) DEFAULT NULL,
  `NUMERO` varchar(10) DEFAULT NULL,
  `CODIGOCIDADE` int NOT NULL,
  `CODIGOBAIRRO` int NOT NULL,
  `LOGIN` varchar(70) NOT NULL,
  `SENHA` varchar(8) NOT NULL,
  `TIPOPESSOA` varchar(1) NOT NULL,
  `DATACADASTRO` date NOT NULL,
  PRIMARY KEY (`CODIGOPESSOA`),
  KEY `CODIGOBAIRRO` (`CODIGOBAIRRO`),
  KEY `CODIGOCIDADE` (`CODIGOCIDADE`),
  KEY `idx_CPF` (`CPF`),
  CONSTRAINT `pessoas_ibfk_1` FOREIGN KEY (`CODIGOBAIRRO`) REFERENCES `bairros` (`CODIGOBAIRRO`),
  CONSTRAINT `pessoas_ibfk_2` FOREIGN KEY (`CODIGOCIDADE`) REFERENCES `cidade` (`CODIGOCIDADE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES (4,'7547368421','DANIEL','DANI@','629999999','1997-04-25','RUA AV','QD 15','454',4,1,'DANIEL@GAMIAL','1234567','P','2024-03-01'),(5,'12345678','TEST','TES@','11111111','1198-04-02','AVT1','RU',NULL,2,1,'TESTE@','654321','P','2004-05-12'),(8,'123456789','LUIS HENRIQUE','LUIS@GMAIL','(62) 9188811','1997-04-24','RUA LORENA','QD 17 LT45','111',4,2,'LUIS@','123456','C','2024-03-01');
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos` (
  `CODIGOSERVICO` int NOT NULL AUTO_INCREMENT,
  `NOMESERVICO` varchar(50) NOT NULL,
  `TEMPOSERVICO` time DEFAULT NULL,
  `VALORSERVICO` float DEFAULT NULL,
  PRIMARY KEY (`CODIGOSERVICO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` VALUES (1,'CORTE','00:30:00',30),(2,'BARBA','00:20:00',15),(3,'SOBRACELHAS','00:20:00',10),(4,'LUZES','01:00:00',70),(5,'PLATINADO','01:30:00',100),(6,'PIGMENTAÇÂO','01:00:00',10),(7,'CORTE COM DESENHO','00:40:00',40),(8,'CORTE NAVALHADO','00:40:00',40),(9,'PEZINHO','00:15:00',15),(10,'DEPILAÇÃO','00:10:00',10);
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-21 19:18:19

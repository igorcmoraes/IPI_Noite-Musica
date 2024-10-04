CREATE DATABASE  IF NOT EXISTS `musica` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `musica`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: musica
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `albuns`
--

DROP TABLE IF EXISTS `albuns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albuns` (
  `id_albuns` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_de_lancamento` date NOT NULL,
  PRIMARY KEY (`id_albuns`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albuns`
--

LOCK TABLES `albuns` WRITE;
/*!40000 ALTER TABLE `albuns` DISABLE KEYS */;
INSERT INTO `albuns` VALUES (1,'TAP - The 2nd Mini Album','2024-02-26'),(2,'Butter','2021-05-21'),(3,'Future Nostalgia','2020-03-27'),(4,'The Album','2020-10-02'),(5,'BORN PINK','2022-09-16');
/*!40000 ALTER TABLE `albuns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `id_artista` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `biografia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Lee Taeyong','taeyong@gmail.com','tyong*95','kpop','Taeyong é um talentoso cantor e compositor sul-coreano.'),(2,'Lisa','lisa@gmail.com','lisa*997','pop','Lisa é uma dançarina e rapper tailandesa, integrante do grupo BLACKPINK.'),(3,'Jimin','jimin@gmail.com','jimin*97','kpop','Jimin é um cantor e dançarino sul-coreano do grupo BTS.'),(4,'GDragon','gdragon@gmail.com','*gdrag0n','kpop','G-Dragon é um rapper, cantor e compositor sul-coreano.'),(5,'Dua Lipa','dualipa@gmail.com','dua*96lp','pop','Dua Lipa é uma cantora e compositora britânica.');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compoe`
--

DROP TABLE IF EXISTS `compoe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compoe` (
  `id_play` int DEFAULT NULL,
  `id_musica` int DEFAULT NULL,
  `qtd_musica` int DEFAULT NULL,
  KEY `id_play` (`id_play`),
  KEY `id_musica` (`id_musica`),
  CONSTRAINT `compoe_ibfk_1` FOREIGN KEY (`id_play`) REFERENCES `playlist` (`id`),
  CONSTRAINT `compoe_ibfk_2` FOREIGN KEY (`id_musica`) REFERENCES `musica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compoe`
--

LOCK TABLES `compoe` WRITE;
/*!40000 ALTER TABLE `compoe` DISABLE KEYS */;
INSERT INTO `compoe` VALUES (1,1,10),(2,2,9),(3,3,8),(4,4,7),(5,5,11);
/*!40000 ALTER TABLE `compoe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contem`
--

DROP TABLE IF EXISTS `contem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contem` (
  `id_musicafk` int NOT NULL,
  `id_albumfk` int NOT NULL,
  KEY `id_musicafk` (`id_musicafk`),
  KEY `id_albumfk` (`id_albumfk`),
  CONSTRAINT `contem_ibfk_1` FOREIGN KEY (`id_musicafk`) REFERENCES `musica` (`id`),
  CONSTRAINT `contem_ibfk_2` FOREIGN KEY (`id_albumfk`) REFERENCES `albuns` (`id_albuns`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contem`
--

LOCK TABLES `contem` WRITE;
/*!40000 ALTER TABLE `contem` DISABLE KEYS */;
INSERT INTO `contem` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `contem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cria`
--

DROP TABLE IF EXISTS `cria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cria` (
  `id_cria` int DEFAULT NULL,
  `cpf_usuario_cria` char(11) NOT NULL,
  KEY `id_cria` (`id_cria`),
  KEY `cpf_usuario_cria` (`cpf_usuario_cria`),
  CONSTRAINT `cria_ibfk_1` FOREIGN KEY (`id_cria`) REFERENCES `playlist` (`id`),
  CONSTRAINT `cria_ibfk_2` FOREIGN KEY (`cpf_usuario_cria`) REFERENCES `usuario` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cria`
--

LOCK TABLES `cria` WRITE;
/*!40000 ALTER TABLE `cria` DISABLE KEYS */;
INSERT INTO `cria` VALUES (1,'12345678901'),(2,'23456789012'),(3,'34567890123'),(4,'45678901234'),(5,'45398710950');
/*!40000 ALTER TABLE `cria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escuta`
--

DROP TABLE IF EXISTS `escuta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escuta` (
  `qtd_escuta` int NOT NULL,
  `cpffk` varchar(11) NOT NULL,
  `id_musicafk` int NOT NULL,
  KEY `cpffk` (`cpffk`),
  KEY `id_musicafk` (`id_musicafk`),
  CONSTRAINT `escuta_ibfk_1` FOREIGN KEY (`cpffk`) REFERENCES `usuario` (`cpf`),
  CONSTRAINT `escuta_ibfk_2` FOREIGN KEY (`id_musicafk`) REFERENCES `musica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuta`
--

LOCK TABLES `escuta` WRITE;
/*!40000 ALTER TABLE `escuta` DISABLE KEYS */;
INSERT INTO `escuta` VALUES (1,'12345678901',1),(2,'23456789012',2),(3,'34567890123',3),(4,'45678901234',4),(5,'45398710950',5);
/*!40000 ALTER TABLE `escuta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musica`
--

DROP TABLE IF EXISTS `musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica` (
  `id_artistafk` int DEFAULT NULL,
  `titulo` varchar(25) DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `letra` varchar(400) DEFAULT NULL,
  `duracao` time DEFAULT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_artistafk` (`id_artistafk`),
  CONSTRAINT `musica_ibfk_1` FOREIGN KEY (`id_artistafk`) REFERENCES `artista` (`id_artista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica`
--

LOCK TABLES `musica` WRITE;
/*!40000 ALTER TABLE `musica` DISABLE KEYS */;
INSERT INTO `musica` VALUES (1,'Franguinho na Panela','sertanejo clássico','Quando eu fico sem serviço a tristeza me atropela\nEu pego uns bicos pra fora, deixo cedo a corrutela\nEu levo meu viradinho é um fundinho de tigela\nÉ só farinha com ovo, mas da gema bem amarela\nÉ esse o meu almoço, que desce seco na goela\nMais lá no meu ranchinho a mulher e os filhinhos\nTem franguinho na panela','00:03:56',1),(2,'A Boa Parte','Worship','Como Maria\nQue estava aos Seus pés e dissestes a ela\nEssa é a boa parte que nunca, que nunca será tirada\nEu encontrei o meu tesouro\nEu encontrei o bem mais precioso','00:05:50',2),(3,'Navigating','Indie','Pardon my delay\nI m navigating, I m navigating my head\nDisassociate\nIm navigating, Im navigating my head\nGive me some advice\nI am wasting all this time\nMy, oh my','00:03:43',3),(4,'Que país é esse','Rock','Nas favelas, no senado\nSujeira pra todo lado\nNinguém respeita a constituição\nMas todos acreditam no futuro da nação\nQue país é esse?\nQue país é esse?\nQue país é esse?','00:02:58',4),(5,'Electric Feel','Pop','All along the Western front\nPeople line up to receive\nShe got the power in her hand\nTo shock you like you wont believe\nSaw her in the Amazon\nWith the voltage running through her skin\nStanding there with nothing on\nShe gonna teach me how to swim','00:03:49',5);
/*!40000 ALTER TABLE `musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_criacao` date DEFAULT NULL,
  `criador` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'Minha Playlist Favorita','2024-09-26','Luis'),(2,'Minha Segunda Playlist Favorita','2024-09-26','Luis'),(3,'Persona 5 OST','2024-09-02','Gabriel'),(4,'Witcher 3 OST','2023-11-20','Gabriel'),(5,'Chainsawman','2020-10-18','Gabriel');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segue`
--

DROP TABLE IF EXISTS `segue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segue` (
  `cpf` char(11) NOT NULL,
  `id_artista` int NOT NULL,
  `qtdSegui` int DEFAULT NULL,
  `horario` time NOT NULL,
  KEY `id_artista` (`id_artista`),
  KEY `cpf` (`cpf`),
  CONSTRAINT `segue_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id_artista`),
  CONSTRAINT `segue_ibfk_2` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segue`
--

LOCK TABLES `segue` WRITE;
/*!40000 ALTER TABLE `segue` DISABLE KEYS */;
INSERT INTO `segue` VALUES ('12345678901',1,12090,'16:00:40'),('23456789012',2,15000,'17:30:00'),('34567890123',3,23000,'14:15:00'),('45678901234',4,30000,'19:45:00'),('45398710950',5,5000,'08:20:00');
/*!40000 ALTER TABLE `segue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `telefone` char(17) DEFAULT NULL,
  `dataNasc` date NOT NULL,
  `id` int DEFAULT NULL,
  `generoFav` varchar(100) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('12345678901','Lucas','lucas@exemplo.com','lu1234','31987652076','2005-03-22',9,'Rock'),('23456789012','Ana','ana@exemplo.com','an5678','31987652077','2004-05-18',10,'Pop'),('34567890123','Felipe','felipe@exemplo.com','fe9012','31987652078','2007-07-30',11,'Sertanejo'),('45398710950','Gabrielle','gabi@gabi.com','ga6798','31987652075','2006-04-15',13,'Sertanejo'),('45678901234','Mariana','mari@exemplo.com','ma3456','31987652079','2003-12-10',12,'Hip Hop');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-26 21:06:19

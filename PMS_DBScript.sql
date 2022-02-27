-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pms_prydan
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `api_rtblentity`
--

DROP TABLE IF EXISTS `api_rtblentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_rtblentity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Designation` varchar(30) DEFAULT NULL,
  `AddressIDF_id` int DEFAULT NULL,
  `CompanyIDF_id` int DEFAULT NULL,
  `EntityTypeIDF_id` int DEFAULT NULL,
  `PersonIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_rtblentity_AddressIDF_id_1b2efba5_fk_api_tblad` (`AddressIDF_id`),
  KEY `api_rtblentity_CompanyIDF_id_e3dc4d65_fk_api_tblco` (`CompanyIDF_id`),
  KEY `api_rtblentity_EntityTypeIDF_id_04558e5a_fk_api_stble` (`EntityTypeIDF_id`),
  KEY `api_rtblentity_PersonIDF_id_ef4cd3f2_fk_api_tblperson_PersonID` (`PersonIDF_id`),
  CONSTRAINT `api_rtblentity_AddressIDF_id_1b2efba5_fk_api_tblad` FOREIGN KEY (`AddressIDF_id`) REFERENCES `api_tbladdress` (`AddressID`),
  CONSTRAINT `api_rtblentity_CompanyIDF_id_e3dc4d65_fk_api_tblco` FOREIGN KEY (`CompanyIDF_id`) REFERENCES `api_tblcompany` (`CompanyID`),
  CONSTRAINT `api_rtblentity_EntityTypeIDF_id_04558e5a_fk_api_stble` FOREIGN KEY (`EntityTypeIDF_id`) REFERENCES `api_stblentitytype` (`EntityTypeID`),
  CONSTRAINT `api_rtblentity_PersonIDF_id_ef4cd3f2_fk_api_tblperson_PersonID` FOREIGN KEY (`PersonIDF_id`) REFERENCES `api_tblperson` (`PersonID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_rtblentity`
--

LOCK TABLES `api_rtblentity` WRITE;
/*!40000 ALTER TABLE `api_rtblentity` DISABLE KEYS */;
INSERT INTO `api_rtblentity` VALUES (1,'Software Engineer',1,1,1,1),(2,'Software Engineer',2,1,1,2),(3,'Software Engineer',3,1,1,3);
/*!40000 ALTER TABLE `api_rtblentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_rtblentityemail`
--

DROP TABLE IF EXISTS `api_rtblentityemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_rtblentityemail` (
  `EntityEmailID` int NOT NULL AUTO_INCREMENT,
  `EmailIDF_id` int DEFAULT NULL,
  `EntityIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`EntityEmailID`),
  KEY `api_rtblentityemail_EmailIDF_id_7a6c4a2a_fk_api_tblemail_EmailID` (`EmailIDF_id`),
  KEY `api_rtblentityemail_EntityIDF_id_53c27b72_fk_api_tblen` (`EntityIDF_id`),
  CONSTRAINT `api_rtblentityemail_EmailIDF_id_7a6c4a2a_fk_api_tblemail_EmailID` FOREIGN KEY (`EmailIDF_id`) REFERENCES `api_tblemail` (`EmailID`),
  CONSTRAINT `api_rtblentityemail_EntityIDF_id_53c27b72_fk_api_tblen` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_rtblentityemail`
--

LOCK TABLES `api_rtblentityemail` WRITE;
/*!40000 ALTER TABLE `api_rtblentityemail` DISABLE KEYS */;
INSERT INTO `api_rtblentityemail` VALUES (1,1,1),(2,2,1),(3,3,1),(4,1,2),(5,2,2),(6,3,2),(7,1,3),(8,2,3),(9,3,3);
/*!40000 ALTER TABLE `api_rtblentityemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stbladdresstype`
--

DROP TABLE IF EXISTS `api_stbladdresstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stbladdresstype` (
  `AddressTypeID` int NOT NULL AUTO_INCREMENT,
  `AddressType` varchar(30) NOT NULL,
  PRIMARY KEY (`AddressTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stbladdresstype`
--

LOCK TABLES `api_stbladdresstype` WRITE;
/*!40000 ALTER TABLE `api_stbladdresstype` DISABLE KEYS */;
INSERT INTO `api_stbladdresstype` VALUES (1,'Home'),(2,'Office');
/*!40000 ALTER TABLE `api_stbladdresstype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblcompanytype`
--

DROP TABLE IF EXISTS `api_stblcompanytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblcompanytype` (
  `CompanyTypeID` int NOT NULL AUTO_INCREMENT,
  `CompanyType` varchar(30) NOT NULL,
  PRIMARY KEY (`CompanyTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblcompanytype`
--

LOCK TABLES `api_stblcompanytype` WRITE;
/*!40000 ALTER TABLE `api_stblcompanytype` DISABLE KEYS */;
INSERT INTO `api_stblcompanytype` VALUES (1,'Commercial'),(2,'Industrial');
/*!40000 ALTER TABLE `api_stblcompanytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblcountrycodetype`
--

DROP TABLE IF EXISTS `api_stblcountrycodetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblcountrycodetype` (
  `CountryCodeID` int NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(30) NOT NULL,
  PRIMARY KEY (`CountryCodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblcountrycodetype`
--

LOCK TABLES `api_stblcountrycodetype` WRITE;
/*!40000 ALTER TABLE `api_stblcountrycodetype` DISABLE KEYS */;
INSERT INTO `api_stblcountrycodetype` VALUES (1,'India'),(2,'United State'),(3,'United Kingdom'),(4,'Russia'),(5,'Canada'),(6,'Sri Lanka'),(7,'Indonesia'),(8,'Nepal');
/*!40000 ALTER TABLE `api_stblcountrycodetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblemailtype`
--

DROP TABLE IF EXISTS `api_stblemailtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblemailtype` (
  `EmailTypeID` int NOT NULL AUTO_INCREMENT,
  `EmailType` varchar(30) NOT NULL,
  PRIMARY KEY (`EmailTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblemailtype`
--

LOCK TABLES `api_stblemailtype` WRITE;
/*!40000 ALTER TABLE `api_stblemailtype` DISABLE KEYS */;
INSERT INTO `api_stblemailtype` VALUES (1,'Personal'),(2,'Company');
/*!40000 ALTER TABLE `api_stblemailtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblentitytype`
--

DROP TABLE IF EXISTS `api_stblentitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblentitytype` (
  `EntityTypeID` int NOT NULL AUTO_INCREMENT,
  `EntityType` varchar(30) NOT NULL,
  PRIMARY KEY (`EntityTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblentitytype`
--

LOCK TABLES `api_stblentitytype` WRITE;
/*!40000 ALTER TABLE `api_stblentitytype` DISABLE KEYS */;
INSERT INTO `api_stblentitytype` VALUES (1,'Person'),(2,'Company');
/*!40000 ALTER TABLE `api_stblentitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblindustrytype`
--

DROP TABLE IF EXISTS `api_stblindustrytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblindustrytype` (
  `IndustryID` int NOT NULL AUTO_INCREMENT,
  `IndustryType` varchar(30) NOT NULL,
  PRIMARY KEY (`IndustryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblindustrytype`
--

LOCK TABLES `api_stblindustrytype` WRITE;
/*!40000 ALTER TABLE `api_stblindustrytype` DISABLE KEYS */;
INSERT INTO `api_stblindustrytype` VALUES (1,'IT'),(2,'Construction'),(3,'Finishing contracting'),(4,'Real estate'),(5,'Health Care');
/*!40000 ALTER TABLE `api_stblindustrytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblinquirytype`
--

DROP TABLE IF EXISTS `api_stblinquirytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblinquirytype` (
  `InquiryTypeID` int NOT NULL AUTO_INCREMENT,
  `InquiryType` varchar(30) NOT NULL,
  PRIMARY KEY (`InquiryTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblinquirytype`
--

LOCK TABLES `api_stblinquirytype` WRITE;
/*!40000 ALTER TABLE `api_stblinquirytype` DISABLE KEYS */;
INSERT INTO `api_stblinquirytype` VALUES (1,'To give the Project'),(2,'To hire the Employee');
/*!40000 ALTER TABLE `api_stblinquirytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblpersontype`
--

DROP TABLE IF EXISTS `api_stblpersontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblpersontype` (
  `PersonTypeID` int NOT NULL AUTO_INCREMENT,
  `PersonType` varchar(30) NOT NULL,
  PRIMARY KEY (`PersonTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblpersontype`
--

LOCK TABLES `api_stblpersontype` WRITE;
/*!40000 ALTER TABLE `api_stblpersontype` DISABLE KEYS */;
INSERT INTO `api_stblpersontype` VALUES (1,'Employee'),(2,'Customer');
/*!40000 ALTER TABLE `api_stblpersontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblphonetype`
--

DROP TABLE IF EXISTS `api_stblphonetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblphonetype` (
  `PhoneTypeID` int NOT NULL AUTO_INCREMENT,
  `PhoneType` varchar(30) NOT NULL,
  PRIMARY KEY (`PhoneTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblphonetype`
--

LOCK TABLES `api_stblphonetype` WRITE;
/*!40000 ALTER TABLE `api_stblphonetype` DISABLE KEYS */;
INSERT INTO `api_stblphonetype` VALUES (1,'Home'),(2,'Office'),(3,'Emergancy'),(4,'Personal');
/*!40000 ALTER TABLE `api_stblphonetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblphototype`
--

DROP TABLE IF EXISTS `api_stblphototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblphototype` (
  `PhotoTypeID` int NOT NULL AUTO_INCREMENT,
  `PhotoType` varchar(30) NOT NULL,
  PRIMARY KEY (`PhotoTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblphototype`
--

LOCK TABLES `api_stblphototype` WRITE;
/*!40000 ALTER TABLE `api_stblphototype` DISABLE KEYS */;
INSERT INTO `api_stblphototype` VALUES (1,'Company'),(2,'Personal');
/*!40000 ALTER TABLE `api_stblphototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblsocialmediatype`
--

DROP TABLE IF EXISTS `api_stblsocialmediatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblsocialmediatype` (
  `SocialMediaTypeID` int NOT NULL AUTO_INCREMENT,
  `SocialMediaType` varchar(30) NOT NULL,
  PRIMARY KEY (`SocialMediaTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblsocialmediatype`
--

LOCK TABLES `api_stblsocialmediatype` WRITE;
/*!40000 ALTER TABLE `api_stblsocialmediatype` DISABLE KEYS */;
INSERT INTO `api_stblsocialmediatype` VALUES (1,'Facebook'),(2,'Linked In'),(3,'Instagram'),(4,'Twitter');
/*!40000 ALTER TABLE `api_stblsocialmediatype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblsuffixtype`
--

DROP TABLE IF EXISTS `api_stblsuffixtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblsuffixtype` (
  `SuffixID` int NOT NULL AUTO_INCREMENT,
  `SuffixType` varchar(20) NOT NULL,
  PRIMARY KEY (`SuffixID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblsuffixtype`
--

LOCK TABLES `api_stblsuffixtype` WRITE;
/*!40000 ALTER TABLE `api_stblsuffixtype` DISABLE KEYS */;
INSERT INTO `api_stblsuffixtype` VALUES (1,'bhai'),(2,'ben');
/*!40000 ALTER TABLE `api_stblsuffixtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stblusertype`
--

DROP TABLE IF EXISTS `api_stblusertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stblusertype` (
  `UserTypeID` int NOT NULL AUTO_INCREMENT,
  `UserType` varchar(30) NOT NULL,
  PRIMARY KEY (`UserTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stblusertype`
--

LOCK TABLES `api_stblusertype` WRITE;
/*!40000 ALTER TABLE `api_stblusertype` DISABLE KEYS */;
INSERT INTO `api_stblusertype` VALUES (1,'Employee'),(2,'Customer');
/*!40000 ALTER TABLE `api_stblusertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tbladdress`
--

DROP TABLE IF EXISTS `api_tbladdress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tbladdress` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `Address` longtext NOT NULL,
  `City` varchar(30) NOT NULL,
  `District` varchar(30) NOT NULL,
  `State` varchar(30) NOT NULL,
  `PinCode` int NOT NULL,
  `Country` varchar(30) NOT NULL,
  `AddressTypeIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`AddressID`),
  KEY `api_tbladdress_AddressTypeIDF_id_69854165_fk_api_stbla` (`AddressTypeIDF_id`),
  CONSTRAINT `api_tbladdress_AddressTypeIDF_id_69854165_fk_api_stbla` FOREIGN KEY (`AddressTypeIDF_id`) REFERENCES `api_stbladdresstype` (`AddressTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tbladdress`
--

LOCK TABLES `api_tbladdress` WRITE;
/*!40000 ALTER TABLE `api_tbladdress` DISABLE KEYS */;
INSERT INTO `api_tbladdress` VALUES (1,'Station road Bavla Opposite to Arya Samaj Mandir and General Electronic','Bavla','Ahmedabad','Gujarat',382220,'India',1),(2,'Ankul Chokdi Nikol','Nilol','Ahmedabad','Gujarat',325875,'India',1),(3,'Shilaj','Shilaj','Ahmedabad','Gujarat',325478,'India',1);
/*!40000 ALTER TABLE `api_tbladdress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblallocation`
--

DROP TABLE IF EXISTS `api_tblallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblallocation` (
  `AllocationID` int NOT NULL AUTO_INCREMENT,
  `LanguageName` varchar(30) NOT NULL,
  `Location` varchar(30) NOT NULL,
  `Experiance` int NOT NULL,
  `AllocationDescription` longtext NOT NULL,
  `EntityIDF_id` int DEFAULT NULL,
  `PersonIDF_id` int DEFAULT NULL,
  `UserIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`AllocationID`),
  KEY `api_tblallocation_EntityIDF_id_954b23e0_fk_api_tblen` (`EntityIDF_id`),
  KEY `api_tblallocation_PersonIDF_id_2589aa37_fk_api_tblpe` (`PersonIDF_id`),
  KEY `api_tblallocation_UserIDF_id_7bc0212c_fk_api_tbluser_UserID` (`UserIDF_id`),
  CONSTRAINT `api_tblallocation_EntityIDF_id_954b23e0_fk_api_tblen` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`),
  CONSTRAINT `api_tblallocation_PersonIDF_id_2589aa37_fk_api_tblpe` FOREIGN KEY (`PersonIDF_id`) REFERENCES `api_tblperson` (`PersonID`),
  CONSTRAINT `api_tblallocation_UserIDF_id_7bc0212c_fk_api_tbluser_UserID` FOREIGN KEY (`UserIDF_id`) REFERENCES `api_tbluser` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblallocation`
--

LOCK TABLES `api_tblallocation` WRITE;
/*!40000 ALTER TABLE `api_tblallocation` DISABLE KEYS */;
INSERT INTO `api_tblallocation` VALUES (1,'Python','Ahmedabad',1,'Very good developer',1,1,1),(2,'React Native','Ahmedabad',1,'Very good developer',2,2,2),(3,'React Native','Ahmedabad',1,'Very good developer',3,3,3);
/*!40000 ALTER TABLE `api_tblallocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblbill`
--

DROP TABLE IF EXISTS `api_tblbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblbill` (
  `BillID` int NOT NULL AUTO_INCREMENT,
  `CGST` varchar(6) NOT NULL,
  `SGST` varchar(6) NOT NULL,
  `AdvancePayment` varchar(6) NOT NULL,
  `RemainPayment` varchar(6) NOT NULL,
  PRIMARY KEY (`BillID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblbill`
--

LOCK TABLES `api_tblbill` WRITE;
/*!40000 ALTER TABLE `api_tblbill` DISABLE KEYS */;
INSERT INTO `api_tblbill` VALUES (1,'9%','9%','50000','10000'),(2,'9%','9%','180000','15000'),(3,'9%','9%','200000','100000');
/*!40000 ALTER TABLE `api_tblbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblcompany`
--

DROP TABLE IF EXISTS `api_tblcompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblcompany` (
  `CompanyID` int NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(50) NOT NULL,
  `GSTINNo` varchar(15) NOT NULL,
  `Headquarter` varchar(30) NOT NULL,
  `WebsiteURL` longtext NOT NULL,
  `About` longtext NOT NULL,
  `Founded` date NOT NULL,
  `Specialities` longtext NOT NULL,
  `AnnualRevenue` int NOT NULL,
  `CompanyTypeIDF_id` int DEFAULT NULL,
  `EntityIDF_id` int DEFAULT NULL,
  `IndustryIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`CompanyID`),
  KEY `api_tblcompany_EntityIDF_id_af369345_fk_api_tblentity_EntityID` (`EntityIDF_id`),
  KEY `api_tblcompany_IndustryIDF_id_7e53d733_fk_api_stbli` (`IndustryIDF_id`),
  KEY `api_tblcompany_CompanyTypeIDF_id_1ab73436_fk_api_stblc` (`CompanyTypeIDF_id`),
  CONSTRAINT `api_tblcompany_CompanyTypeIDF_id_1ab73436_fk_api_stblc` FOREIGN KEY (`CompanyTypeIDF_id`) REFERENCES `api_stblcompanytype` (`CompanyTypeID`),
  CONSTRAINT `api_tblcompany_EntityIDF_id_af369345_fk_api_tblentity_EntityID` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`),
  CONSTRAINT `api_tblcompany_IndustryIDF_id_7e53d733_fk_api_stbli` FOREIGN KEY (`IndustryIDF_id`) REFERENCES `api_stblindustrytype` (`IndustryID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblcompany`
--

LOCK TABLES `api_tblcompany` WRITE;
/*!40000 ALTER TABLE `api_tblcompany` DISABLE KEYS */;
INSERT INTO `api_tblcompany` VALUES (1,'Prydan Consultancy','65432198765431','Ahmedabad','https://prydan.com/','Excellent company','2019-02-20','All Fields',2105425,1,4,1);
/*!40000 ALTER TABLE `api_tblcompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblcomplaint`
--

DROP TABLE IF EXISTS `api_tblcomplaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblcomplaint` (
  `ComplaintID` int NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `Date` datetime(6) NOT NULL,
  `AllocationIDF_id` int DEFAULT NULL,
  `ProjectIDF_id` int DEFAULT NULL,
  `UserIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`ComplaintID`),
  KEY `api_tblcomplaint_AllocationIDF_id_b0ff3bcd_fk_api_tblal` (`AllocationIDF_id`),
  KEY `api_tblcomplaint_ProjectIDF_id_07e60fdf_fk_api_tblpr` (`ProjectIDF_id`),
  KEY `api_tblcomplaint_UserIDF_id_2f9e0929_fk_api_tbluser_UserID` (`UserIDF_id`),
  CONSTRAINT `api_tblcomplaint_AllocationIDF_id_b0ff3bcd_fk_api_tblal` FOREIGN KEY (`AllocationIDF_id`) REFERENCES `api_tblallocation` (`AllocationID`),
  CONSTRAINT `api_tblcomplaint_ProjectIDF_id_07e60fdf_fk_api_tblpr` FOREIGN KEY (`ProjectIDF_id`) REFERENCES `api_tblproject` (`ProjectID`),
  CONSTRAINT `api_tblcomplaint_UserIDF_id_2f9e0929_fk_api_tbluser_UserID` FOREIGN KEY (`UserIDF_id`) REFERENCES `api_tbluser` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblcomplaint`
--

LOCK TABLES `api_tblcomplaint` WRITE;
/*!40000 ALTER TABLE `api_tblcomplaint` DISABLE KEYS */;
INSERT INTO `api_tblcomplaint` VALUES (1,'some functions are not working','2022-02-27 10:14:54.000000',1,1,1),(2,'Some buttons are not working','2022-02-27 10:15:18.000000',2,2,2),(3,'Some buttons are not working','2022-02-27 10:15:29.000000',2,3,3);
/*!40000 ALTER TABLE `api_tblcomplaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblcountrycode`
--

DROP TABLE IF EXISTS `api_tblcountrycode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblcountrycode` (
  `CodeID` int NOT NULL AUTO_INCREMENT,
  `CountryCode` varchar(5) NOT NULL,
  `CountryCodeIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`CodeID`),
  UNIQUE KEY `CountryCodeIDF_id` (`CountryCodeIDF_id`),
  CONSTRAINT `api_tblcountrycode_CountryCodeIDF_id_03f8b793_fk_api_stblc` FOREIGN KEY (`CountryCodeIDF_id`) REFERENCES `api_stblcountrycodetype` (`CountryCodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblcountrycode`
--

LOCK TABLES `api_tblcountrycode` WRITE;
/*!40000 ALTER TABLE `api_tblcountrycode` DISABLE KEYS */;
INSERT INTO `api_tblcountrycode` VALUES (1,'+91',1),(2,'+1',2),(3,'+44',3),(4,'+7',4),(5,'+1',5),(6,'+94',6),(7,'+62',7),(8,'+977',8);
/*!40000 ALTER TABLE `api_tblcountrycode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblemail`
--

DROP TABLE IF EXISTS `api_tblemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblemail` (
  `EmailID` int NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(50) NOT NULL,
  `EmailTypeIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`EmailID`),
  KEY `api_tblemail_EmailTypeIDF_id_b37254b3_fk_api_stble` (`EmailTypeIDF_id`),
  CONSTRAINT `api_tblemail_EmailTypeIDF_id_b37254b3_fk_api_stble` FOREIGN KEY (`EmailTypeIDF_id`) REFERENCES `api_stblemailtype` (`EmailTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblemail`
--

LOCK TABLES `api_tblemail` WRITE;
/*!40000 ALTER TABLE `api_tblemail` DISABLE KEYS */;
INSERT INTO `api_tblemail` VALUES (1,'kishankumar@example.com',1),(2,'aishwaryabirewar@example.com',1),(3,'vedangipatel@example.com',1);
/*!40000 ALTER TABLE `api_tblemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblentity`
--

DROP TABLE IF EXISTS `api_tblentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblentity` (
  `EntityID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(256) NOT NULL,
  `ShortName` varchar(16) NOT NULL,
  `CreatedAT` date NOT NULL,
  `CreatedBY_id` int DEFAULT NULL,
  `EntityTypeIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`EntityID`),
  KEY `api_tblentity_CreatedBY_id_223b6e97_fk_auth_user_id` (`CreatedBY_id`),
  KEY `api_tblentity_EntityTypeIDF_id_529753a7_fk_api_stble` (`EntityTypeIDF_id`),
  CONSTRAINT `api_tblentity_CreatedBY_id_223b6e97_fk_auth_user_id` FOREIGN KEY (`CreatedBY_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `api_tblentity_EntityTypeIDF_id_529753a7_fk_api_stble` FOREIGN KEY (`EntityTypeIDF_id`) REFERENCES `api_stblentitytype` (`EntityTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblentity`
--

LOCK TABLES `api_tblentity` WRITE;
/*!40000 ALTER TABLE `api_tblentity` DISABLE KEYS */;
INSERT INTO `api_tblentity` VALUES (1,'Kishan Kumar Das','Kishan','2022-02-27',2,1),(2,'Aishwarya Birewar','Aishwarya','2022-02-27',3,1),(3,'Vedangi Patel','Vedangi','2022-02-27',4,1),(4,'Amit Kumar Trivedi','Amit','2022-02-27',1,1);
/*!40000 ALTER TABLE `api_tblentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblentityphone`
--

DROP TABLE IF EXISTS `api_tblentityphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblentityphone` (
  `EntityPhoneID` int NOT NULL AUTO_INCREMENT,
  `EntityIDF_id` int DEFAULT NULL,
  `PhoneIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`EntityPhoneID`),
  KEY `api_tblentityphone_EntityIDF_id_a355d4b0_fk_api_tblen` (`EntityIDF_id`),
  KEY `api_tblentityphone_PhoneIDF_id_937d6a8d_fk_api_tblphone_PhoneID` (`PhoneIDF_id`),
  CONSTRAINT `api_tblentityphone_EntityIDF_id_a355d4b0_fk_api_tblen` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`),
  CONSTRAINT `api_tblentityphone_PhoneIDF_id_937d6a8d_fk_api_tblphone_PhoneID` FOREIGN KEY (`PhoneIDF_id`) REFERENCES `api_tblphone` (`PhoneID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblentityphone`
--

LOCK TABLES `api_tblentityphone` WRITE;
/*!40000 ALTER TABLE `api_tblentityphone` DISABLE KEYS */;
INSERT INTO `api_tblentityphone` VALUES (1,1,2),(2,2,3),(3,3,4);
/*!40000 ALTER TABLE `api_tblentityphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblentitysocialmedia`
--

DROP TABLE IF EXISTS `api_tblentitysocialmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblentitysocialmedia` (
  `EntitySocialMediaID` int NOT NULL AUTO_INCREMENT,
  `EntityIDF_id` int DEFAULT NULL,
  `SocialMediaIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`EntitySocialMediaID`),
  KEY `api_tblentitysocialm_EntityIDF_id_f1157f2f_fk_api_tblen` (`EntityIDF_id`),
  KEY `api_tblentitysocialm_SocialMediaIDF_id_9081ff08_fk_api_tblso` (`SocialMediaIDF_id`),
  CONSTRAINT `api_tblentitysocialm_EntityIDF_id_f1157f2f_fk_api_tblen` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`),
  CONSTRAINT `api_tblentitysocialm_SocialMediaIDF_id_9081ff08_fk_api_tblso` FOREIGN KEY (`SocialMediaIDF_id`) REFERENCES `api_tblsocialmedia` (`SocialmediaID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblentitysocialmedia`
--

LOCK TABLES `api_tblentitysocialmedia` WRITE;
/*!40000 ALTER TABLE `api_tblentitysocialmedia` DISABLE KEYS */;
INSERT INTO `api_tblentitysocialmedia` VALUES (1,1,2),(2,1,4),(3,2,1),(4,1,1),(5,2,4),(6,3,2),(7,2,1),(8,2,4),(9,1,3),(10,1,3);
/*!40000 ALTER TABLE `api_tblentitysocialmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblfeedback`
--

DROP TABLE IF EXISTS `api_tblfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblfeedback` (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `Feedback` longtext,
  `Date` datetime(6) NOT NULL,
  `AllocationIDF_id` int DEFAULT NULL,
  `ProjectIDF_id` int DEFAULT NULL,
  `UserIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `api_tblfeedback_AllocationIDF_id_987e3ef3_fk_api_tblal` (`AllocationIDF_id`),
  KEY `api_tblfeedback_ProjectIDF_id_f1dca6ef_fk_api_tblpr` (`ProjectIDF_id`),
  KEY `api_tblfeedback_UserIDF_id_29e8c0b4_fk_api_tbluser_UserID` (`UserIDF_id`),
  CONSTRAINT `api_tblfeedback_AllocationIDF_id_987e3ef3_fk_api_tblal` FOREIGN KEY (`AllocationIDF_id`) REFERENCES `api_tblallocation` (`AllocationID`),
  CONSTRAINT `api_tblfeedback_ProjectIDF_id_f1dca6ef_fk_api_tblpr` FOREIGN KEY (`ProjectIDF_id`) REFERENCES `api_tblproject` (`ProjectID`),
  CONSTRAINT `api_tblfeedback_UserIDF_id_29e8c0b4_fk_api_tbluser_UserID` FOREIGN KEY (`UserIDF_id`) REFERENCES `api_tbluser` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblfeedback`
--

LOCK TABLES `api_tblfeedback` WRITE;
/*!40000 ALTER TABLE `api_tblfeedback` DISABLE KEYS */;
INSERT INTO `api_tblfeedback` VALUES (1,'This product is excellent and very good working','2022-02-27 10:19:39.000000',1,1,1),(2,'This product is excellent and very good working','2022-02-27 10:19:49.000000',2,2,2),(3,'This product is excellent and very good working','2022-02-27 10:19:59.000000',2,3,3);
/*!40000 ALTER TABLE `api_tblfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblinquiry`
--

DROP TABLE IF EXISTS `api_tblinquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblinquiry` (
  `InquiryID` int NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `AllocationIDF_id` int DEFAULT NULL,
  `InquiryTypeIDF_id` int DEFAULT NULL,
  `ProjectIDF_id` int DEFAULT NULL,
  `UserIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`InquiryID`),
  KEY `api_tblinquiry_AllocationIDF_id_e073b182_fk_api_tblal` (`AllocationIDF_id`),
  KEY `api_tblinquiry_InquiryTypeIDF_id_3c0de1a8_fk_api_stbli` (`InquiryTypeIDF_id`),
  KEY `api_tblinquiry_ProjectIDF_id_8958a452_fk_api_tblpr` (`ProjectIDF_id`),
  KEY `api_tblinquiry_UserIDF_id_fd97bef4_fk_api_tbluser_UserID` (`UserIDF_id`),
  CONSTRAINT `api_tblinquiry_AllocationIDF_id_e073b182_fk_api_tblal` FOREIGN KEY (`AllocationIDF_id`) REFERENCES `api_tblallocation` (`AllocationID`),
  CONSTRAINT `api_tblinquiry_InquiryTypeIDF_id_3c0de1a8_fk_api_stbli` FOREIGN KEY (`InquiryTypeIDF_id`) REFERENCES `api_stblinquirytype` (`InquiryTypeID`),
  CONSTRAINT `api_tblinquiry_ProjectIDF_id_8958a452_fk_api_tblpr` FOREIGN KEY (`ProjectIDF_id`) REFERENCES `api_tblproject` (`ProjectID`),
  CONSTRAINT `api_tblinquiry_UserIDF_id_fd97bef4_fk_api_tbluser_UserID` FOREIGN KEY (`UserIDF_id`) REFERENCES `api_tbluser` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblinquiry`
--

LOCK TABLES `api_tblinquiry` WRITE;
/*!40000 ALTER TABLE `api_tblinquiry` DISABLE KEYS */;
INSERT INTO `api_tblinquiry` VALUES (1,'I want to make a web app in python and i want to hire a python developer',1,2,1,1),(2,'I want to make a Mobile app in React Native and i want to hire a React Native developer',2,2,2,2),(3,'I want to make a Mobile app in React Native and i want to hire a React Native developer',2,2,3,2);
/*!40000 ALTER TABLE `api_tblinquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblpayment`
--

DROP TABLE IF EXISTS `api_tblpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblpayment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `PaymentDate` date NOT NULL,
  `PaymentMode` varchar(30) NOT NULL,
  `ChequeNo` varchar(12) NOT NULL,
  `BankName` varchar(30) NOT NULL,
  `BankIFSCCode` varchar(30) NOT NULL,
  `AllocationIDF_id` int DEFAULT NULL,
  `BillIDF_id` int DEFAULT NULL,
  `ProjectIDF_id` int DEFAULT NULL,
  `UserIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `api_tblpayment_AllocationIDF_id_55bfd225_fk_api_tblal` (`AllocationIDF_id`),
  KEY `api_tblpayment_BillIDF_id_aaefe7c5_fk_api_tblbill_BillID` (`BillIDF_id`),
  KEY `api_tblpayment_ProjectIDF_id_aecf99be_fk_api_tblpr` (`ProjectIDF_id`),
  KEY `api_tblpayment_UserIDF_id_f5365e3c_fk_api_tbluser_UserID` (`UserIDF_id`),
  CONSTRAINT `api_tblpayment_AllocationIDF_id_55bfd225_fk_api_tblal` FOREIGN KEY (`AllocationIDF_id`) REFERENCES `api_tblallocation` (`AllocationID`),
  CONSTRAINT `api_tblpayment_BillIDF_id_aaefe7c5_fk_api_tblbill_BillID` FOREIGN KEY (`BillIDF_id`) REFERENCES `api_tblbill` (`BillID`),
  CONSTRAINT `api_tblpayment_ProjectIDF_id_aecf99be_fk_api_tblpr` FOREIGN KEY (`ProjectIDF_id`) REFERENCES `api_tblproject` (`ProjectID`),
  CONSTRAINT `api_tblpayment_UserIDF_id_f5365e3c_fk_api_tbluser_UserID` FOREIGN KEY (`UserIDF_id`) REFERENCES `api_tbluser` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblpayment`
--

LOCK TABLES `api_tblpayment` WRITE;
/*!40000 ALTER TABLE `api_tblpayment` DISABLE KEYS */;
INSERT INTO `api_tblpayment` VALUES (1,'2022-02-27','Offline','0123','State Bank of India','SBIN0715651',1,1,1,1),(2,'2022-02-27','Offline','0124','State Bank of India','SBIN0715651',2,2,2,2),(3,'2022-02-27','Offline','0126','State Bank of India','SBIN0715651',2,2,2,3);
/*!40000 ALTER TABLE `api_tblpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblperson`
--

DROP TABLE IF EXISTS `api_tblperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblperson` (
  `PersonID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(30) NOT NULL,
  `MiddleName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Gender` varchar(2) NOT NULL,
  `DOB` date NOT NULL,
  `EntityIDF_id` int DEFAULT NULL,
  `PersonTypeIDF_id` int DEFAULT NULL,
  `SuffixIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`PersonID`),
  KEY `api_tblperson_EntityIDF_id_9e341452_fk_api_tblentity_EntityID` (`EntityIDF_id`),
  KEY `api_tblperson_PersonTypeIDF_id_667c6a6d_fk_api_stblp` (`PersonTypeIDF_id`),
  KEY `api_tblperson_SuffixIDF_id_11f1dbdb_fk_api_stbls` (`SuffixIDF_id`),
  CONSTRAINT `api_tblperson_EntityIDF_id_9e341452_fk_api_tblentity_EntityID` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`),
  CONSTRAINT `api_tblperson_PersonTypeIDF_id_667c6a6d_fk_api_stblp` FOREIGN KEY (`PersonTypeIDF_id`) REFERENCES `api_stblpersontype` (`PersonTypeID`),
  CONSTRAINT `api_tblperson_SuffixIDF_id_11f1dbdb_fk_api_stbls` FOREIGN KEY (`SuffixIDF_id`) REFERENCES `api_stblsuffixtype` (`SuffixID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblperson`
--

LOCK TABLES `api_tblperson` WRITE;
/*!40000 ALTER TABLE `api_tblperson` DISABLE KEYS */;
INSERT INTO `api_tblperson` VALUES (1,'Kishan','Kumar','Das','M','2001-07-26',1,1,1),(2,'Aishwarya','Jaydeep','Birewar','F','1999-03-15',2,1,2),(3,'Vedangi','NanduBhai','Patel','F','2001-09-08',3,1,2);
/*!40000 ALTER TABLE `api_tblperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblphone`
--

DROP TABLE IF EXISTS `api_tblphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblphone` (
  `PhoneID` int NOT NULL AUTO_INCREMENT,
  `PhoneNo` bigint NOT NULL,
  `CodeIDF_id` int DEFAULT NULL,
  `PhoneTypeIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`PhoneID`),
  KEY `api_tblphone_CodeIDF_id_aacfff7e_fk_api_tblcountrycode_CodeID` (`CodeIDF_id`),
  KEY `api_tblphone_PhoneTypeIDF_id_ef8eacf4_fk_api_stblp` (`PhoneTypeIDF_id`),
  CONSTRAINT `api_tblphone_CodeIDF_id_aacfff7e_fk_api_tblcountrycode_CodeID` FOREIGN KEY (`CodeIDF_id`) REFERENCES `api_tblcountrycode` (`CodeID`),
  CONSTRAINT `api_tblphone_PhoneTypeIDF_id_ef8eacf4_fk_api_stblp` FOREIGN KEY (`PhoneTypeIDF_id`) REFERENCES `api_stblphonetype` (`PhoneTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblphone`
--

LOCK TABLES `api_tblphone` WRITE;
/*!40000 ALTER TABLE `api_tblphone` DISABLE KEYS */;
INSERT INTO `api_tblphone` VALUES (2,7864578547,1,4),(3,8745896587,1,1),(4,9857458968,1,2),(5,9985799658,1,3);
/*!40000 ALTER TABLE `api_tblphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblphoto`
--

DROP TABLE IF EXISTS `api_tblphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblphoto` (
  `PhotoID` int NOT NULL AUTO_INCREMENT,
  `Photo` varchar(100) NOT NULL,
  `EntityTypeIDF_id` int DEFAULT NULL,
  `PhotoTypeIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`PhotoID`),
  KEY `api_tblphoto_EntityTypeIDF_id_b6925f93_fk_api_stble` (`EntityTypeIDF_id`),
  KEY `api_tblphoto_PhotoTypeIDF_id_7381cd3d_fk_api_stblp` (`PhotoTypeIDF_id`),
  CONSTRAINT `api_tblphoto_EntityTypeIDF_id_b6925f93_fk_api_stble` FOREIGN KEY (`EntityTypeIDF_id`) REFERENCES `api_stblentitytype` (`EntityTypeID`),
  CONSTRAINT `api_tblphoto_PhotoTypeIDF_id_7381cd3d_fk_api_stblp` FOREIGN KEY (`PhotoTypeIDF_id`) REFERENCES `api_stblphototype` (`PhotoTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblphoto`
--

LOCK TABLES `api_tblphoto` WRITE;
/*!40000 ALTER TABLE `api_tblphoto` DISABLE KEYS */;
INSERT INTO `api_tblphoto` VALUES (1,'images/anonymous_hacker_5k-5120x2880.jpg',1,2),(2,'images/flower-6318951.jpg',1,2);
/*!40000 ALTER TABLE `api_tblphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblprofile`
--

DROP TABLE IF EXISTS `api_tblprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblprofile` (
  `ProfileID` int NOT NULL AUTO_INCREMENT,
  `ProfileDescription` longtext,
  `EntityIDF_id` int DEFAULT NULL,
  `UserIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`ProfileID`),
  KEY `api_tblprofile_EntityIDF_id_4dc8a2fe_fk_api_tblentity_EntityID` (`EntityIDF_id`),
  KEY `api_tblprofile_UserIDF_id_6914ae61_fk_api_tbluser_UserID` (`UserIDF_id`),
  CONSTRAINT `api_tblprofile_EntityIDF_id_4dc8a2fe_fk_api_tblentity_EntityID` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`),
  CONSTRAINT `api_tblprofile_UserIDF_id_6914ae61_fk_api_tbluser_UserID` FOREIGN KEY (`UserIDF_id`) REFERENCES `api_tbluser` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblprofile`
--

LOCK TABLES `api_tblprofile` WRITE;
/*!40000 ALTER TABLE `api_tblprofile` DISABLE KEYS */;
INSERT INTO `api_tblprofile` VALUES (1,'I am a Software Engineer',1,1),(2,'I am a Software Engineer',2,2),(3,'I am a Software Engineer',3,3);
/*!40000 ALTER TABLE `api_tblprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblproject`
--

DROP TABLE IF EXISTS `api_tblproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblproject` (
  `ProjectID` int NOT NULL AUTO_INCREMENT,
  `ProjectName` varchar(30) NOT NULL,
  `Description` longtext,
  `Department` varchar(30) NOT NULL,
  `DeadLine` datetime(6) NOT NULL,
  `AllocationIDF_id` int DEFAULT NULL,
  `CompanyIDF_id` int DEFAULT NULL,
  `EmailIDF_id` int DEFAULT NULL,
  `PersonIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`ProjectID`),
  KEY `api_tblproject_AllocationIDF_id_4ee490d8_fk_api_tblal` (`AllocationIDF_id`),
  KEY `api_tblproject_CompanyIDF_id_28fcbfca_fk_api_tblco` (`CompanyIDF_id`),
  KEY `api_tblproject_EmailIDF_id_8eb5ed1a_fk_api_tblemail_EmailID` (`EmailIDF_id`),
  KEY `api_tblproject_PersonIDF_id_66d3c56c_fk_api_tblperson_PersonID` (`PersonIDF_id`),
  CONSTRAINT `api_tblproject_AllocationIDF_id_4ee490d8_fk_api_tblal` FOREIGN KEY (`AllocationIDF_id`) REFERENCES `api_tblallocation` (`AllocationID`),
  CONSTRAINT `api_tblproject_CompanyIDF_id_28fcbfca_fk_api_tblco` FOREIGN KEY (`CompanyIDF_id`) REFERENCES `api_tblcompany` (`CompanyID`),
  CONSTRAINT `api_tblproject_EmailIDF_id_8eb5ed1a_fk_api_tblemail_EmailID` FOREIGN KEY (`EmailIDF_id`) REFERENCES `api_tblemail` (`EmailID`),
  CONSTRAINT `api_tblproject_PersonIDF_id_66d3c56c_fk_api_tblperson_PersonID` FOREIGN KEY (`PersonIDF_id`) REFERENCES `api_tblperson` (`PersonID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblproject`
--

LOCK TABLES `api_tblproject` WRITE;
/*!40000 ALTER TABLE `api_tblproject` DISABLE KEYS */;
INSERT INTO `api_tblproject` VALUES (1,'CRM','This is a mobile application','IT','2022-03-27 09:48:37.000000',1,1,1,1),(2,'PMS','Mobile application in react native','IT','2022-02-27 09:54:19.000000',2,1,1,2),(3,'HMS','Hotel Management system in react native mobile application','Hotel Management','2022-02-27 09:57:03.000000',3,1,1,3);
/*!40000 ALTER TABLE `api_tblproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblquatation`
--

DROP TABLE IF EXISTS `api_tblquatation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblquatation` (
  `QuatationID` int NOT NULL AUTO_INCREMENT,
  `Quotation` longtext,
  `AllocationIDF_id` int DEFAULT NULL,
  `ProjectIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`QuatationID`),
  KEY `api_tblquatation_AllocationIDF_id_fc87f0f1_fk_api_tblal` (`AllocationIDF_id`),
  KEY `api_tblquatation_ProjectIDF_id_38529ac1_fk_api_tblpr` (`ProjectIDF_id`),
  CONSTRAINT `api_tblquatation_AllocationIDF_id_fc87f0f1_fk_api_tblal` FOREIGN KEY (`AllocationIDF_id`) REFERENCES `api_tblallocation` (`AllocationID`),
  CONSTRAINT `api_tblquatation_ProjectIDF_id_38529ac1_fk_api_tblpr` FOREIGN KEY (`ProjectIDF_id`) REFERENCES `api_tblproject` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblquatation`
--

LOCK TABLES `api_tblquatation` WRITE;
/*!40000 ALTER TABLE `api_tblquatation` DISABLE KEYS */;
INSERT INTO `api_tblquatation` VALUES (1,'We will charge 150000 for your project',1,1),(2,'We will charge 250000 for your project',3,2),(3,'We will charge 250000 for your project',3,3);
/*!40000 ALTER TABLE `api_tblquatation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblschedule`
--

DROP TABLE IF EXISTS `api_tblschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblschedule` (
  `ScheduleID` int NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `ScheduleDate` datetime(6) NOT NULL,
  `AllocationIDF_id` int DEFAULT NULL,
  `ProjectIDF_id` int DEFAULT NULL,
  `UserIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `api_tblschedule_AllocationIDF_id_f78d74bf_fk_api_tblal` (`AllocationIDF_id`),
  KEY `api_tblschedule_ProjectIDF_id_9e6d177d_fk_api_tblpr` (`ProjectIDF_id`),
  KEY `api_tblschedule_UserIDF_id_99124136_fk_api_tbluser_UserID` (`UserIDF_id`),
  CONSTRAINT `api_tblschedule_AllocationIDF_id_f78d74bf_fk_api_tblal` FOREIGN KEY (`AllocationIDF_id`) REFERENCES `api_tblallocation` (`AllocationID`),
  CONSTRAINT `api_tblschedule_ProjectIDF_id_9e6d177d_fk_api_tblpr` FOREIGN KEY (`ProjectIDF_id`) REFERENCES `api_tblproject` (`ProjectID`),
  CONSTRAINT `api_tblschedule_UserIDF_id_99124136_fk_api_tbluser_UserID` FOREIGN KEY (`UserIDF_id`) REFERENCES `api_tbluser` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblschedule`
--

LOCK TABLES `api_tblschedule` WRITE;
/*!40000 ALTER TABLE `api_tblschedule` DISABLE KEYS */;
INSERT INTO `api_tblschedule` VALUES (1,'We will send our developer at the given time','2022-02-27 10:38:35.000000',1,1,1),(2,'We will send our developer at the given time','2022-02-27 10:41:39.000000',2,2,2),(3,'We will send our developer at the given time','2022-02-27 10:41:48.000000',3,3,3);
/*!40000 ALTER TABLE `api_tblschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblsocialmedia`
--

DROP TABLE IF EXISTS `api_tblsocialmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblsocialmedia` (
  `SocialmediaID` int NOT NULL AUTO_INCREMENT,
  `url` longtext NOT NULL,
  `SocialMediaTypeIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`SocialmediaID`),
  KEY `api_tblsocialmedia_SocialMediaTypeIDF_i_b3923f38_fk_api_stbls` (`SocialMediaTypeIDF_id`),
  CONSTRAINT `api_tblsocialmedia_SocialMediaTypeIDF_i_b3923f38_fk_api_stbls` FOREIGN KEY (`SocialMediaTypeIDF_id`) REFERENCES `api_stblsocialmediatype` (`SocialMediaTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblsocialmedia`
--

LOCK TABLES `api_tblsocialmedia` WRITE;
/*!40000 ALTER TABLE `api_tblsocialmedia` DISABLE KEYS */;
INSERT INTO `api_tblsocialmedia` VALUES (1,'www.facebook.com',1),(2,'https://www.linkedin.com/signup',2),(3,'https://www.instagram.com/',3),(4,'https://twitter.com',4);
/*!40000 ALTER TABLE `api_tblsocialmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tblupdatestatus`
--

DROP TABLE IF EXISTS `api_tblupdatestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tblupdatestatus` (
  `UpdateStatusID` int NOT NULL AUTO_INCREMENT,
  `UpdateStatus` varchar(30) NOT NULL,
  `ProjectIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`UpdateStatusID`),
  KEY `api_tblupdatestatus_ProjectIDF_id_e6d24f81_fk_api_tblpr` (`ProjectIDF_id`),
  CONSTRAINT `api_tblupdatestatus_ProjectIDF_id_e6d24f81_fk_api_tblpr` FOREIGN KEY (`ProjectIDF_id`) REFERENCES `api_tblproject` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tblupdatestatus`
--

LOCK TABLES `api_tblupdatestatus` WRITE;
/*!40000 ALTER TABLE `api_tblupdatestatus` DISABLE KEYS */;
INSERT INTO `api_tblupdatestatus` VALUES (1,'Project is done',1),(2,'Project is done',2),(3,'Project is done',3);
/*!40000 ALTER TABLE `api_tblupdatestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tbluser`
--

DROP TABLE IF EXISTS `api_tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tbluser` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(30) NOT NULL,
  `UserPassword` varchar(30) NOT NULL,
  `ConformPassword` varchar(30) NOT NULL,
  `UserTypeIDF_id` int DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `api_tbluser_UserTypeIDF_id_56e66726_fk_api_stblu` (`UserTypeIDF_id`),
  CONSTRAINT `api_tbluser_UserTypeIDF_id_56e66726_fk_api_stblu` FOREIGN KEY (`UserTypeIDF_id`) REFERENCES `api_stblusertype` (`UserTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tbluser`
--

LOCK TABLES `api_tbluser` WRITE;
/*!40000 ALTER TABLE `api_tbluser` DISABLE KEYS */;
INSERT INTO `api_tbluser` VALUES (1,'kishan123','kishan12345','kishan12345',1),(2,'aishwarya123','aishwarya12345','aishwarya12345',1),(3,'vedangi123','vedangi12345','vedangi12345',1),(5,'abhishek123','abhishek12345','abhishek12345',2),(6,'mahi123','mahendra12345','mahendra12345',2);
/*!40000 ALTER TABLE `api_tbluser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add stbl address type',7,'add_stbladdresstype'),(26,'Can change stbl address type',7,'change_stbladdresstype'),(27,'Can delete stbl address type',7,'delete_stbladdresstype'),(28,'Can view stbl address type',7,'view_stbladdresstype'),(29,'Can add stbl company type',8,'add_stblcompanytype'),(30,'Can change stbl company type',8,'change_stblcompanytype'),(31,'Can delete stbl company type',8,'delete_stblcompanytype'),(32,'Can view stbl company type',8,'view_stblcompanytype'),(33,'Can add stbl country code type',9,'add_stblcountrycodetype'),(34,'Can change stbl country code type',9,'change_stblcountrycodetype'),(35,'Can delete stbl country code type',9,'delete_stblcountrycodetype'),(36,'Can view stbl country code type',9,'view_stblcountrycodetype'),(37,'Can add stbl email type',10,'add_stblemailtype'),(38,'Can change stbl email type',10,'change_stblemailtype'),(39,'Can delete stbl email type',10,'delete_stblemailtype'),(40,'Can view stbl email type',10,'view_stblemailtype'),(41,'Can add stbl entity type',11,'add_stblentitytype'),(42,'Can change stbl entity type',11,'change_stblentitytype'),(43,'Can delete stbl entity type',11,'delete_stblentitytype'),(44,'Can view stbl entity type',11,'view_stblentitytype'),(45,'Can add stbl industry type',12,'add_stblindustrytype'),(46,'Can change stbl industry type',12,'change_stblindustrytype'),(47,'Can delete stbl industry type',12,'delete_stblindustrytype'),(48,'Can view stbl industry type',12,'view_stblindustrytype'),(49,'Can add stbl inquiry type',13,'add_stblinquirytype'),(50,'Can change stbl inquiry type',13,'change_stblinquirytype'),(51,'Can delete stbl inquiry type',13,'delete_stblinquirytype'),(52,'Can view stbl inquiry type',13,'view_stblinquirytype'),(53,'Can add stbl person type',14,'add_stblpersontype'),(54,'Can change stbl person type',14,'change_stblpersontype'),(55,'Can delete stbl person type',14,'delete_stblpersontype'),(56,'Can view stbl person type',14,'view_stblpersontype'),(57,'Can add stbl phone type',15,'add_stblphonetype'),(58,'Can change stbl phone type',15,'change_stblphonetype'),(59,'Can delete stbl phone type',15,'delete_stblphonetype'),(60,'Can view stbl phone type',15,'view_stblphonetype'),(61,'Can add stbl photo type',16,'add_stblphototype'),(62,'Can change stbl photo type',16,'change_stblphototype'),(63,'Can delete stbl photo type',16,'delete_stblphototype'),(64,'Can view stbl photo type',16,'view_stblphototype'),(65,'Can add stbl social media type',17,'add_stblsocialmediatype'),(66,'Can change stbl social media type',17,'change_stblsocialmediatype'),(67,'Can delete stbl social media type',17,'delete_stblsocialmediatype'),(68,'Can view stbl social media type',17,'view_stblsocialmediatype'),(69,'Can add stbl suffix type',18,'add_stblsuffixtype'),(70,'Can change stbl suffix type',18,'change_stblsuffixtype'),(71,'Can delete stbl suffix type',18,'delete_stblsuffixtype'),(72,'Can view stbl suffix type',18,'view_stblsuffixtype'),(73,'Can add stbl user type',19,'add_stblusertype'),(74,'Can change stbl user type',19,'change_stblusertype'),(75,'Can delete stbl user type',19,'delete_stblusertype'),(76,'Can view stbl user type',19,'view_stblusertype'),(77,'Can add tbl allocation',20,'add_tblallocation'),(78,'Can change tbl allocation',20,'change_tblallocation'),(79,'Can delete tbl allocation',20,'delete_tblallocation'),(80,'Can view tbl allocation',20,'view_tblallocation'),(81,'Can add tbl bill',21,'add_tblbill'),(82,'Can change tbl bill',21,'change_tblbill'),(83,'Can delete tbl bill',21,'delete_tblbill'),(84,'Can view tbl bill',21,'view_tblbill'),(85,'Can add tbl company',22,'add_tblcompany'),(86,'Can change tbl company',22,'change_tblcompany'),(87,'Can delete tbl company',22,'delete_tblcompany'),(88,'Can view tbl company',22,'view_tblcompany'),(89,'Can add tbl country code',23,'add_tblcountrycode'),(90,'Can change tbl country code',23,'change_tblcountrycode'),(91,'Can delete tbl country code',23,'delete_tblcountrycode'),(92,'Can view tbl country code',23,'view_tblcountrycode'),(93,'Can add tbl email',24,'add_tblemail'),(94,'Can change tbl email',24,'change_tblemail'),(95,'Can delete tbl email',24,'delete_tblemail'),(96,'Can view tbl email',24,'view_tblemail'),(97,'Can add tbl entity',25,'add_tblentity'),(98,'Can change tbl entity',25,'change_tblentity'),(99,'Can delete tbl entity',25,'delete_tblentity'),(100,'Can view tbl entity',25,'view_tblentity'),(101,'Can add tbl person',26,'add_tblperson'),(102,'Can change tbl person',26,'change_tblperson'),(103,'Can delete tbl person',26,'delete_tblperson'),(104,'Can view tbl person',26,'view_tblperson'),(105,'Can add tbl project',27,'add_tblproject'),(106,'Can change tbl project',27,'change_tblproject'),(107,'Can delete tbl project',27,'delete_tblproject'),(108,'Can view tbl project',27,'view_tblproject'),(109,'Can add tbl user',28,'add_tbluser'),(110,'Can change tbl user',28,'change_tbluser'),(111,'Can delete tbl user',28,'delete_tbluser'),(112,'Can view tbl user',28,'view_tbluser'),(113,'Can add tbl update status',29,'add_tblupdatestatus'),(114,'Can change tbl update status',29,'change_tblupdatestatus'),(115,'Can delete tbl update status',29,'delete_tblupdatestatus'),(116,'Can view tbl update status',29,'view_tblupdatestatus'),(117,'Can add tbl social media',30,'add_tblsocialmedia'),(118,'Can change tbl social media',30,'change_tblsocialmedia'),(119,'Can delete tbl social media',30,'delete_tblsocialmedia'),(120,'Can view tbl social media',30,'view_tblsocialmedia'),(121,'Can add tbl schedule',31,'add_tblschedule'),(122,'Can change tbl schedule',31,'change_tblschedule'),(123,'Can delete tbl schedule',31,'delete_tblschedule'),(124,'Can view tbl schedule',31,'view_tblschedule'),(125,'Can add tbl quatation',32,'add_tblquatation'),(126,'Can change tbl quatation',32,'change_tblquatation'),(127,'Can delete tbl quatation',32,'delete_tblquatation'),(128,'Can view tbl quatation',32,'view_tblquatation'),(129,'Can add tbl profile',33,'add_tblprofile'),(130,'Can change tbl profile',33,'change_tblprofile'),(131,'Can delete tbl profile',33,'delete_tblprofile'),(132,'Can view tbl profile',33,'view_tblprofile'),(133,'Can add tbl photo',34,'add_tblphoto'),(134,'Can change tbl photo',34,'change_tblphoto'),(135,'Can delete tbl photo',34,'delete_tblphoto'),(136,'Can view tbl photo',34,'view_tblphoto'),(137,'Can add tbl phone',35,'add_tblphone'),(138,'Can change tbl phone',35,'change_tblphone'),(139,'Can delete tbl phone',35,'delete_tblphone'),(140,'Can view tbl phone',35,'view_tblphone'),(141,'Can add tbl payment',36,'add_tblpayment'),(142,'Can change tbl payment',36,'change_tblpayment'),(143,'Can delete tbl payment',36,'delete_tblpayment'),(144,'Can view tbl payment',36,'view_tblpayment'),(145,'Can add tbl inquiry',37,'add_tblinquiry'),(146,'Can change tbl inquiry',37,'change_tblinquiry'),(147,'Can delete tbl inquiry',37,'delete_tblinquiry'),(148,'Can view tbl inquiry',37,'view_tblinquiry'),(149,'Can add tbl feedback',38,'add_tblfeedback'),(150,'Can change tbl feedback',38,'change_tblfeedback'),(151,'Can delete tbl feedback',38,'delete_tblfeedback'),(152,'Can view tbl feedback',38,'view_tblfeedback'),(153,'Can add tbl entity social media',39,'add_tblentitysocialmedia'),(154,'Can change tbl entity social media',39,'change_tblentitysocialmedia'),(155,'Can delete tbl entity social media',39,'delete_tblentitysocialmedia'),(156,'Can view tbl entity social media',39,'view_tblentitysocialmedia'),(157,'Can add tbl entity phone',40,'add_tblentityphone'),(158,'Can change tbl entity phone',40,'change_tblentityphone'),(159,'Can delete tbl entity phone',40,'delete_tblentityphone'),(160,'Can view tbl entity phone',40,'view_tblentityphone'),(161,'Can add tbl complaint',41,'add_tblcomplaint'),(162,'Can change tbl complaint',41,'change_tblcomplaint'),(163,'Can delete tbl complaint',41,'delete_tblcomplaint'),(164,'Can view tbl complaint',41,'view_tblcomplaint'),(165,'Can add tbl address',42,'add_tbladdress'),(166,'Can change tbl address',42,'change_tbladdress'),(167,'Can delete tbl address',42,'delete_tbladdress'),(168,'Can view tbl address',42,'view_tbladdress'),(169,'Can add rtbl entity email',43,'add_rtblentityemail'),(170,'Can change rtbl entity email',43,'change_rtblentityemail'),(171,'Can delete rtbl entity email',43,'delete_rtblentityemail'),(172,'Can view rtbl entity email',43,'view_rtblentityemail'),(173,'Can add rtbl entity',44,'add_rtblentity'),(174,'Can change rtbl entity',44,'change_rtblentity'),(175,'Can delete rtbl entity',44,'delete_rtblentity'),(176,'Can view rtbl entity',44,'view_rtblentity');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$9ZAMUqmyZk3FNuqx1alP9o$okA9Jxr7gjyNzZ2mxg1+eMFgS8ZA9MQ8nLKoz4HdUes=','2022-02-26 11:19:57.790203',1,'admin','','','',1,1,'2022-02-13 23:35:57.859043'),(2,'pbkdf2_sha256$260000$HKits6KDYP4lRws2Vdit4M$9fXeQn7JaTR9/b/UtYYBO76Cq1iu5uwAcs/dD0FDlkI=',NULL,0,'kishan123','','','',0,1,'2022-02-27 14:44:13.869465'),(3,'pbkdf2_sha256$260000$bugUd9H7wHh76ermYb2Nzl$GpI4ME4ImAZYz8xZOsrR8ACTW0xU+SrHtZgrpsuM338=',NULL,0,'aishwarya123','','','',0,1,'2022-02-27 14:45:34.480234'),(4,'pbkdf2_sha256$260000$ghvs7AoXUsdW3Qn1S998Uk$h7bPTIoz+D35Hd8SWdIF67j8pT1iEn04QQl0xYdo6lM=',NULL,0,'vedangi123','','','',0,1,'2022-02-27 14:47:03.965774');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-02-14 10:00:59.102455','1','stblUserType object (1)',1,'[{\"added\": {}}]',19,1),(2,'2022-02-14 10:01:04.588690','2','stblUserType object (2)',1,'[{\"added\": {}}]',19,1),(3,'2022-02-26 12:16:31.061793','1','kishan123',1,'[{\"added\": {}}]',28,1),(4,'2022-02-27 13:14:53.735139','1','kishan123',3,'',28,1),(5,'2022-02-27 14:24:27.721653','1','+91',1,'[{\"added\": {}}]',23,1),(6,'2022-02-27 14:28:56.184806','2','+1',1,'[{\"added\": {}}]',23,1),(7,'2022-02-27 14:29:22.793872','3','+44',1,'[{\"added\": {}}]',23,1),(8,'2022-02-27 14:29:51.296140','4','+7',1,'[{\"added\": {}}]',23,1),(9,'2022-02-27 14:30:09.310907','5','+1',1,'[{\"added\": {}}]',23,1),(10,'2022-02-27 14:30:25.541772','6','+94',1,'[{\"added\": {}}]',23,1),(11,'2022-02-27 14:30:49.267319','7','+62',1,'[{\"added\": {}}]',23,1),(12,'2022-02-27 14:31:02.552252','8','+977',1,'[{\"added\": {}}]',23,1),(13,'2022-02-27 14:34:04.262763','4','Personal',1,'[{\"added\": {}}]',15,1),(14,'2022-02-27 14:35:24.446077','1','1',1,'[{\"added\": {}}]',35,1),(15,'2022-02-27 14:35:57.387628','1','1',3,'',35,1),(16,'2022-02-27 14:36:09.547951','2','2',1,'[{\"added\": {}}]',35,1),(17,'2022-02-27 14:36:20.707635','3','3',1,'[{\"added\": {}}]',35,1),(18,'2022-02-27 14:36:30.954865','4','4',1,'[{\"added\": {}}]',35,1),(19,'2022-02-27 14:36:42.374074','5','5',1,'[{\"added\": {}}]',35,1),(20,'2022-02-27 14:44:14.065913','2','kishan123',1,'[{\"added\": {}}]',4,1),(21,'2022-02-27 14:44:35.502814','1','Kishan Kumar Das',1,'[{\"added\": {}}]',25,1),(22,'2022-02-27 14:45:34.691519','3','aishwarya123',1,'[{\"added\": {}}]',4,1),(23,'2022-02-27 14:45:37.087937','2','Aishwarya Birewar',1,'[{\"added\": {}}]',25,1),(24,'2022-02-27 14:47:04.215679','4','vedangi123',1,'[{\"added\": {}}]',4,1),(25,'2022-02-27 14:47:05.855183','3','Vedangi Patel',1,'[{\"added\": {}}]',25,1),(26,'2022-02-27 14:49:37.712931','1','1',1,'[{\"added\": {}}]',42,1),(27,'2022-02-27 14:50:34.907897','2','2',1,'[{\"added\": {}}]',42,1),(28,'2022-02-27 14:51:04.847414','3','3',1,'[{\"added\": {}}]',42,1),(29,'2022-02-27 14:52:30.339110','1','1',1,'[{\"added\": {}}]',24,1),(30,'2022-02-27 14:52:49.553379','2','2',1,'[{\"added\": {}}]',24,1),(31,'2022-02-27 14:53:08.045903','3','3',1,'[{\"added\": {}}]',24,1),(32,'2022-02-27 14:54:43.640240','1','1',1,'[{\"added\": {}}]',34,1),(33,'2022-02-27 14:55:00.748072','2','2',1,'[{\"added\": {}}]',34,1),(34,'2022-02-27 14:56:39.327701','1','1',1,'[{\"added\": {}}]',30,1),(35,'2022-02-27 14:57:25.746969','2','2',1,'[{\"added\": {}}]',30,1),(36,'2022-02-27 14:57:44.878229','3','3',1,'[{\"added\": {}}]',30,1),(37,'2022-02-27 14:58:09.675985','4','4',1,'[{\"added\": {}}]',30,1),(38,'2022-02-27 15:00:32.929796','1','1',1,'[{\"added\": {}}]',39,1),(39,'2022-02-27 15:00:42.441128','2','2',1,'[{\"added\": {}}]',39,1),(40,'2022-02-27 15:00:46.315255','3','3',1,'[{\"added\": {}}]',39,1),(41,'2022-02-27 15:00:51.765116','4','4',1,'[{\"added\": {}}]',39,1),(42,'2022-02-27 15:00:55.630157','5','5',1,'[{\"added\": {}}]',39,1),(43,'2022-02-27 15:00:59.667119','6','6',1,'[{\"added\": {}}]',39,1),(44,'2022-02-27 15:01:03.857905','7','7',1,'[{\"added\": {}}]',39,1),(45,'2022-02-27 15:01:11.429306','8','8',1,'[{\"added\": {}}]',39,1),(46,'2022-02-27 15:01:15.517180','9','9',1,'[{\"added\": {}}]',39,1),(47,'2022-02-27 15:01:40.367322','10','10',1,'[{\"added\": {}}]',39,1),(48,'2022-02-27 15:09:48.983871','4','Amit Kumar Trivedi',1,'[{\"added\": {}}]',25,1),(49,'2022-02-27 15:09:53.934870','1','Prydan Consultancy',1,'[{\"added\": {}}]',22,1),(50,'2022-02-27 15:16:07.868271','1','tblBill object (1)',1,'[{\"added\": {}}]',21,1),(51,'2022-02-27 15:16:21.819071','2','tblBill object (2)',1,'[{\"added\": {}}]',21,1),(52,'2022-02-27 15:16:34.795865','3','tblBill object (3)',1,'[{\"added\": {}}]',21,1),(53,'2022-02-27 15:19:47.886386','1','Kumar',1,'[{\"added\": {}}]',26,1),(54,'2022-02-27 15:22:17.043598','1','tblAllocation object (1)',1,'[{\"added\": {}}]',20,1),(55,'2022-02-27 15:22:24.828223','1','CRM',1,'[{\"added\": {}}]',27,1),(56,'2022-02-27 15:25:21.187150','2','Aishwarya',1,'[{\"added\": {}}]',26,1),(57,'2022-02-27 15:26:14.804096','2','2',1,'[{\"added\": {}}]',20,1),(58,'2022-02-27 15:26:17.763349','2','PMS',1,'[{\"added\": {}}]',27,1),(59,'2022-02-27 15:31:14.884637','3','Vedangi',1,'[{\"added\": {}}]',26,1),(60,'2022-02-27 15:32:08.309835','3','3',1,'[{\"added\": {}}]',20,1),(61,'2022-02-27 15:32:13.214410','3','HMS',1,'[{\"added\": {}}]',27,1),(62,'2022-02-27 15:38:34.289296','1','1',1,'[{\"added\": {}}]',43,1),(63,'2022-02-27 15:38:39.321021','2','2',1,'[{\"added\": {}}]',43,1),(64,'2022-02-27 15:38:45.607382','3','3',1,'[{\"added\": {}}]',43,1),(65,'2022-02-27 15:38:50.697618','4','4',1,'[{\"added\": {}}]',43,1),(66,'2022-02-27 15:38:54.862953','5','5',1,'[{\"added\": {}}]',43,1),(67,'2022-02-27 15:38:59.509068','6','6',1,'[{\"added\": {}}]',43,1),(68,'2022-02-27 15:39:07.344892','7','7',1,'[{\"added\": {}}]',43,1),(69,'2022-02-27 15:39:12.273328','8','8',1,'[{\"added\": {}}]',43,1),(70,'2022-02-27 15:39:16.340928','9','9',1,'[{\"added\": {}}]',43,1),(71,'2022-02-27 15:40:57.113386','1','Software Engineer',1,'[{\"added\": {}}]',44,1),(72,'2022-02-27 15:41:06.965068','2','Software Engineer',1,'[{\"added\": {}}]',44,1),(73,'2022-02-27 15:41:15.115150','3','Software Engineer',1,'[{\"added\": {}}]',44,1),(74,'2022-02-27 15:44:57.478346','1','tblComplaint object (1)',1,'[{\"added\": {}}]',41,1),(75,'2022-02-27 15:45:25.530445','2','tblComplaint object (2)',1,'[{\"added\": {}}]',41,1),(76,'2022-02-27 15:45:35.809202','3','tblComplaint object (3)',1,'[{\"added\": {}}]',41,1),(77,'2022-02-27 15:49:45.709165','1','tblFeedback object (1)',1,'[{\"added\": {}}]',38,1),(78,'2022-02-27 15:49:56.367129','2','tblFeedback object (2)',1,'[{\"added\": {}}]',38,1),(79,'2022-02-27 15:50:05.774741','3','tblFeedback object (3)',1,'[{\"added\": {}}]',38,1),(80,'2022-02-27 15:56:24.578492','1','tblInquiry object (1)',1,'[{\"added\": {}}]',37,1),(81,'2022-02-27 15:57:05.303013','2','tblInquiry object (2)',1,'[{\"added\": {}}]',37,1),(82,'2022-02-27 15:57:15.804195','3','tblInquiry object (3)',1,'[{\"added\": {}}]',37,1),(83,'2022-02-27 16:05:34.471902','1','tblProfile object (1)',1,'[{\"added\": {}}]',33,1),(84,'2022-02-27 16:05:40.009436','2','tblProfile object (2)',1,'[{\"added\": {}}]',33,1),(85,'2022-02-27 16:05:46.119260','3','tblProfile object (3)',1,'[{\"added\": {}}]',33,1),(86,'2022-02-27 16:07:29.533131','1','tblQuatation object (1)',1,'[{\"added\": {}}]',32,1),(87,'2022-02-27 16:07:39.058109','2','tblQuatation object (2)',1,'[{\"added\": {}}]',32,1),(88,'2022-02-27 16:07:47.569288','3','tblQuatation object (3)',1,'[{\"added\": {}}]',32,1),(89,'2022-02-27 16:11:35.577354','1','tblSchedule object (1)',1,'[{\"added\": {}}]',31,1),(90,'2022-02-27 16:11:44.381505','2','tblSchedule object (2)',1,'[{\"added\": {}}]',31,1),(91,'2022-02-27 16:11:55.657748','3','tblSchedule object (3)',1,'[{\"added\": {}}]',31,1),(92,'2022-02-27 16:13:04.105410','1','Project is done',1,'[{\"added\": {}}]',29,1),(93,'2022-02-27 16:13:08.615138','2','Project is done',1,'[{\"added\": {}}]',29,1),(94,'2022-02-27 16:13:14.382204','3','Project is done',1,'[{\"added\": {}}]',29,1),(95,'2022-02-27 16:15:59.163393','1','1',1,'[{\"added\": {}}]',40,1),(96,'2022-02-27 16:16:06.617659','2','2',1,'[{\"added\": {}}]',40,1),(97,'2022-02-27 16:16:11.947873','3','3',1,'[{\"added\": {}}]',40,1),(98,'2022-02-27 16:21:06.119254','1','1',1,'[{\"added\": {}}]',36,1),(99,'2022-02-27 16:21:30.988500','2','2',1,'[{\"added\": {}}]',36,1),(100,'2022-02-27 16:21:49.104358','3','3',1,'[{\"added\": {}}]',36,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(44,'api','rtblentity'),(43,'api','rtblentityemail'),(7,'api','stbladdresstype'),(8,'api','stblcompanytype'),(9,'api','stblcountrycodetype'),(10,'api','stblemailtype'),(11,'api','stblentitytype'),(12,'api','stblindustrytype'),(13,'api','stblinquirytype'),(14,'api','stblpersontype'),(15,'api','stblphonetype'),(16,'api','stblphototype'),(17,'api','stblsocialmediatype'),(18,'api','stblsuffixtype'),(19,'api','stblusertype'),(42,'api','tbladdress'),(20,'api','tblallocation'),(21,'api','tblbill'),(22,'api','tblcompany'),(41,'api','tblcomplaint'),(23,'api','tblcountrycode'),(24,'api','tblemail'),(25,'api','tblentity'),(40,'api','tblentityphone'),(39,'api','tblentitysocialmedia'),(38,'api','tblfeedback'),(37,'api','tblinquiry'),(36,'api','tblpayment'),(26,'api','tblperson'),(35,'api','tblphone'),(34,'api','tblphoto'),(33,'api','tblprofile'),(27,'api','tblproject'),(32,'api','tblquatation'),(31,'api','tblschedule'),(30,'api','tblsocialmedia'),(29,'api','tblupdatestatus'),(28,'api','tbluser'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-02-13 23:34:33.297291'),(2,'auth','0001_initial','2022-02-13 23:34:34.085318'),(3,'admin','0001_initial','2022-02-13 23:34:34.286238'),(4,'admin','0002_logentry_remove_auto_add','2022-02-13 23:34:34.305684'),(5,'admin','0003_logentry_add_action_flag_choices','2022-02-13 23:34:34.326604'),(6,'api','0001_initial','2022-02-13 23:34:39.057348'),(7,'api','0002_alter_rtblentity_id','2022-02-13 23:34:39.128732'),(8,'contenttypes','0002_remove_content_type_name','2022-02-13 23:34:39.264146'),(9,'auth','0002_alter_permission_name_max_length','2022-02-13 23:34:39.359409'),(10,'auth','0003_alter_user_email_max_length','2022-02-13 23:34:39.458875'),(11,'auth','0004_alter_user_username_opts','2022-02-13 23:34:39.473699'),(12,'auth','0005_alter_user_last_login_null','2022-02-13 23:34:39.535478'),(13,'auth','0006_require_contenttypes_0002','2022-02-13 23:34:39.541616'),(14,'auth','0007_alter_validators_add_error_messages','2022-02-13 23:34:39.553439'),(15,'auth','0008_alter_user_username_max_length','2022-02-13 23:34:39.682872'),(16,'auth','0009_alter_user_last_name_max_length','2022-02-13 23:34:39.762528'),(17,'auth','0010_alter_group_name_max_length','2022-02-13 23:34:39.842773'),(18,'auth','0011_update_proxy_permissions','2022-02-13 23:34:39.883522'),(19,'auth','0012_alter_user_first_name_max_length','2022-02-13 23:34:39.955632'),(20,'sessions','0001_initial','2022-02-13 23:34:39.998664');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0aio9dy2tv2h2gl9a6bto7nsuzsk9j60','.eJxVi0EOwiAQRe_C2jRQplBc6sqFZyADMwSiqY3TujHeXU260OX777-nirguNa7C99hI7ZVRu98tYb7w9BU4t24j6Y4ofJqEJ2lLe_D5Rnw9bNe_vqLUTwwAZItOJbPVo3UhBwqhDM6b3uGYBo_OF6NNYYCEAYm800g9IDqwWr3esOc3pw:1nNpxt:trmjHJNu1ZTYDmk7FNwfqnmg7sZMeWrl_gN0Y-guai4','2022-03-12 11:19:57.797183'),('n357khafhlyn4yjnl38bk3z6ntf9w2mk','.eJxVi0EOwiAQRe_C2jRQplBc6sqFZyADMwSiqY3TujHeXU260OX777-nirguNa7C99hI7ZVRu98tYb7w9BU4t24j6Y4ofJqEJ2lLe_D5Rnw9bNe_vqLUTwwAZItOJbPVo3UhBwqhDM6b3uGYBo_OF6NNYYCEAYm800g9IDqwWr3esOc3pw:1nJJGE:7I1sYMBsXhUaW6WdzE_x_VNoTEfLo7wqF4aEO9VOV4s','2022-02-27 23:36:10.613828');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-27 17:36:45

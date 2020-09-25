/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;




CREATE DATABASE if not EXISTS NRF;

USE NRF;

CREATE USER 'admin'@'%' IDENTIFIED BY '12345';

GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: athletes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `athletes`;
CREATE TABLE `athletes` (
  `Athlete_ID` int(11) NOT NULL,
  `Club_ID` int(11) DEFAULT NULL,
  `Group_ID` varchar(255) DEFAULT NULL,
  `Birth_Date` int(11) DEFAULT NULL,
  `Firstname` varchar(255) DEFAULT NULL,
  `Lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Athlete_ID`),
  KEY `athletes_FK1` (`Club_ID`),
  KEY `athletes_FK2` (`Group_ID`),
  CONSTRAINT `athletes_FK1` FOREIGN KEY (`Club_ID`) REFERENCES `clubs` (`Club_ID`),
  CONSTRAINT `athletes_FK2` FOREIGN KEY (`Group_ID`) REFERENCES `groups` (`Group_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: classes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `Class_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Class_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: clubs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clubs`;
CREATE TABLE `clubs` (
  `Club_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Club_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Club_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: genders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `genders`;
CREATE TABLE `genders` (
  `Gender_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Gender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Gender_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `Group_ID` varchar(255) NOT NULL,
  `Gender_ID` int(11) DEFAULT NULL,
  `Class_ID` int(11) DEFAULT NULL,
  `Rank_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Group_ID`),
  KEY `groups_FK1` (`Rank_ID`),
  KEY `groups_FK2` (`Gender_ID`),
  KEY `groups_FK3` (`Class_ID`),
  CONSTRAINT `groups_FK1` FOREIGN KEY (`Rank_ID`) REFERENCES `ranks` (`Rank_ID`),
  CONSTRAINT `groups_FK2` FOREIGN KEY (`Gender_ID`) REFERENCES `genders` (`Gender_ID`),
  CONSTRAINT `groups_FK3` FOREIGN KEY (`Class_ID`) REFERENCES `classes` (`Class_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ranks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ranks`;
CREATE TABLE `ranks` (
  `Rank_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Class_Rank` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Rank_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: results
# ------------------------------------------------------------

DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `Result_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Athlete_ID` int(255) DEFAULT NULL,
  `5000_Watt` int(255) DEFAULT NULL,
  `5000_Tid` int(255) DEFAULT NULL,
  `2000_Watt` int(255) DEFAULT NULL,
  `2000_Tid` int(255) DEFAULT NULL,
  `60_Watt` int(255) DEFAULT NULL,
  `Prosent_Ligg_Ro` int(255) DEFAULT NULL,
  `Sargeant` int(255) DEFAULT NULL,
  `Bevegelighet` int(255) DEFAULT NULL,
  `Prosent_Knebøy` int(255) DEFAULT NULL,
  `3000_Sekunder` int(255) DEFAULT NULL,
  `3000_Tid` int(255) DEFAULT NULL,
  `Antall_Kroppshevinger` int(255) DEFAULT NULL,
  `Total_Score` int(11) DEFAULT NULL,
  PRIMARY KEY (`Result_ID`),
  KEY `results_FK1` (`Athlete_ID`),
  CONSTRAINT `results_FK1` FOREIGN KEY (`Athlete_ID`) REFERENCES `athletes` (`Athlete_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: testregisters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `testregisters`;
CREATE TABLE `testregisters` (
  `Test_Register_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Group_ID` varchar(255) DEFAULT NULL,
  `Test_Type_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Test_Register_ID`),
  KEY `testregisters_FK1` (`Group_ID`),
  KEY `testregisters_FK2` (`Test_Type_ID`),
  CONSTRAINT `testregisters_FK1` FOREIGN KEY (`Group_ID`) REFERENCES `groups` (`Group_ID`),
  CONSTRAINT `testregisters_FK2` FOREIGN KEY (`Test_Type_ID`) REFERENCES `testtypes` (`Test_Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: testsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `testsets`;
CREATE TABLE `testsets` (
  `Test_Set_ID` int(11) NOT NULL,
  `Test_Register_ID` int(11) DEFAULT NULL,
  `Time_ID` varchar(255) DEFAULT NULL,
  `Result_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Test_Set_ID`),
  KEY `testsets_FK1` (`Test_Register_ID`),
  KEY `testsets_FK2` (`Time_ID`),
  KEY `testsets_FK3` (`Result_ID`),
  CONSTRAINT `testsets_FK1` FOREIGN KEY (`Test_Register_ID`) REFERENCES `testregisters` (`Test_Register_ID`),
  CONSTRAINT `testsets_FK2` FOREIGN KEY (`Time_ID`) REFERENCES `timesets` (`Time_ID`),
  CONSTRAINT `testsets_FK3` FOREIGN KEY (`Result_ID`) REFERENCES `results` (`Result_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: testtypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `testtypes`;
CREATE TABLE `testtypes` (
  `Test_Type_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Øvelse_1` varchar(255) DEFAULT NULL,
  `Øvelse_2` varchar(255) DEFAULT NULL,
  `Øvelse_3` varchar(255) DEFAULT NULL,
  `Øvelse_4` varchar(255) DEFAULT NULL,
  `Øvelse_5` varchar(255) DEFAULT NULL,
  `Øvelse_6` varchar(255) DEFAULT NULL,
  `Øvelse_7` varchar(255) DEFAULT NULL,
  `Øvelse_8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Test_Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: timesets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `timesets`;
CREATE TABLE `timesets` (
  `Time_ID` varchar(255) NOT NULL,
  `Week` int(11) DEFAULT NULL,
  `Years` int(11) DEFAULT NULL,
  PRIMARY KEY (`Time_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: athletes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: classes
# ------------------------------------------------------------

INSERT INTO `classes` (`Class_ID`,`Class`) VALUES (1,'Senior'),(2,'Junior');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: clubs
# ------------------------------------------------------------

INSERT INTO `clubs` (`Club_ID`,`Club_Name`) VALUES (1,'Alvøen'),(2,'Bergens'),(3,'BSI'),(4,'Bærum'),(5,'Christiania'),(6,'Drammen'),(7,'Fana'),(8,'Fredrisstad'),(9,'Haldens'),(10,'Horten'),(11,'Kristiansand'),(12,'Moss'),(13,'NSR'),(14,'NTNUI'),(15,'Ormsund'),(16,'Os'),(17,'Porsgrunn'),(18,'Sandefjord'),(19,'Sarpsborg'),(20,'Sjøkrigsskolen'),(21,'Stavanger'),(22,'Trondhjems'),(23,'Tønsberg'),(24,'Aalesunds');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: genders
# ------------------------------------------------------------

INSERT INTO `genders` (`Gender_ID`,`Gender`) VALUES (1,'Mann'),(2,'Kvinner'),(3,'Gutt'),(4,'Jente');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: groups
# ------------------------------------------------------------

INSERT INTO `groups` (`Group_ID`,`Gender_ID`,`Class_ID`,`Rank_ID`) VALUES ('JAG',3,2,1),('JAJ',4,2,1),('JBG',3,2,2),('JBJ',4,2,2),('JCG',3,2,3),('JCJ',4,2,3),('SK',2,1,NULL),('SM',1,1,NULL);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ranks
# ------------------------------------------------------------

INSERT INTO `ranks` (`Rank_ID`,`Class_Rank`) VALUES (1,'A'),(2,'B'),(3,'C');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: results
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: testregisters
# ------------------------------------------------------------

INSERT INTO `testregisters` (`Test_Register_ID`,`Group_ID`,`Test_Type_ID`) VALUES (1,'SM',1),(2,'SK',1),(3,'JAG',2),(4,'JAJ',2),(5,'JBG',3),(6,'JBJ',3),(7,'JCG',4),(8,'JCJ',4);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: testsets
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: testtypes
# ------------------------------------------------------------

INSERT INTO `testtypes` (`Test_Type_ID`,`Øvelse_1`,`Øvelse_2`,`Øvelse_3`,`Øvelse_4`,`Øvelse_5`,`Øvelse_6`,`Øvelse_7`,`Øvelse_8`) VALUES (1,'5000_Watt','5000_Tid','2000_Watt','2000_Tid','60_Watt','Prosent_Ligg_Ro','Prosent_Knebøy','Bevegelighet'),(2,'5000_Watt','5000_Tid','2000_Watt','2000_Tid','60_Watt','Prosent_Ligg_Ro','Sargeant','Bevegelighet'),(3,'3000_Sekunder','3000_Tid','2000_Watt','2000_Tid','60_Watt','Antall_Kroppshevinger','Sargeant','Bevegelighet'),(4,'3000_Løp','60_Ro','Antall_Kroppshevinger','Sargeant','Bevegelighet',NULL,NULL,NULL);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: timesets
# ------------------------------------------------------------

INSERT INTO `timesets` (`Time_ID`,`Week`,`Years`) VALUES ('02.2013',2,2013),('02.2016',2,2016),('02.2017',2,2017),('02.2018',2,2018),('02.2019',2,2019),('02.2020',2,2020),('11.2013',11,2013),('11.2016',11,2016),('11.2017',11,2017),('11.2018',11,2018),('11.2019',11,2019),('11.2020',11,2020),('44.2016',44,2016),('44.2017',44,2017),('44.2018',44,2018),('44.2019',44,2019);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

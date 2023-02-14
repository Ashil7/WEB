-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 14, 2023 at 06:05 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registration`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidateinfo`
--

DROP TABLE IF EXISTS `candidateinfo`;
CREATE TABLE IF NOT EXISTS `candidateinfo` (
  `candidateId` int(5) NOT NULL AUTO_INCREMENT,
  `applicationNo` varchar(20) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` bigint(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `location` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pin` int(7) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `status` varchar(11) NOT NULL DEFAULT 'Pending',
  `department` varchar(5) NOT NULL,
  `course` varchar(20) NOT NULL,
  PRIMARY KEY (`candidateId`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `candidatepersonalinfo`
--

DROP TABLE IF EXISTS `candidatepersonalinfo`;
CREATE TABLE IF NOT EXISTS `candidatepersonalinfo` (
  `candidateId` int(5) NOT NULL,
  `profileName` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `adharNo` bigint(12) NOT NULL,
  `parentName` varchar(25) NOT NULL,
  `parentOccupation` varchar(25) NOT NULL,
  `parentPhone` bigint(10) NOT NULL,
  `parentEmail` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `Nationality` varchar(10) NOT NULL,
  `Religion` varchar(20) NOT NULL,
  `Caste` varchar(20) NOT NULL,
  `CasteTribe` varchar(20) DEFAULT '-NA-',
  `Categorys` varchar(10) NOT NULL,
  `tenthPhysics` varchar(5) DEFAULT '-NA-',
  `tenthChemistry` varchar(5) DEFAULT '-NA-',
  `tenthBiology` varchar(5) DEFAULT '-NA-',
  `tenthScience` varchar(5) NOT NULL,
  `tenthMaths` varchar(5) NOT NULL,
  `tenthEnglish` varchar(5) NOT NULL,
  `twelfthschool` varchar(20) NOT NULL,
  `twelfthExam` varchar(15) NOT NULL,
  `twelfthyear` int(5) NOT NULL,
  `twelfthRegNo` varchar(15) DEFAULT NULL,
  `twelfthPhysics` varchar(5) NOT NULL,
  `twelfthChemistry` varchar(5) DEFAULT NULL,
  `twelfthMaths` varchar(5) DEFAULT NULL,
  `twelfthExtraPoints` int(5) NOT NULL,
  `MtwelfthPhysic` int(5) NOT NULL,
  `MtwelfthChemistry` int(5) NOT NULL,
  `MtwelfthMath` int(5) NOT NULL,
  `MtwelfthExtraPoint` int(5) NOT NULL,
  `twelfthTotalMarks` int(11) NOT NULL,
  `entranceRegno` varchar(15) NOT NULL,
  `entranceRank` int(5) NOT NULL,
  `entranceTotalmark` int(5) NOT NULL,
  `entrancePhysics` int(5) NOT NULL,
  `entranceMaths` int(5) NOT NULL,
  `MentrancePhysics` int(5) NOT NULL,
  `MentranceMath` int(5) NOT NULL,
  `FPreference` varchar(25) NOT NULL,
  `SPreference` varchar(25) NOT NULL,
  `TPreference` varchar(25) NOT NULL,
  PRIMARY KEY (`adharNo`),
  UNIQUE KEY `candidateId` (`candidateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sngusers`
--

DROP TABLE IF EXISTS `sngusers`;
CREATE TABLE IF NOT EXISTS `sngusers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_type` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sngusers`
--

INSERT INTO `sngusers` (`id`, `username`, `email`, `user_type`, `password`) VALUES
(4, 'admin', 'admin@a.com', 'officeadmin', '21232f297a57a5a743894a0e4a801fc3'),
(5, 'sadmin', 'sadmin@a.com', 'admin', 'c5edac1b8c1d58bad90a246d8f08f53b'),
(8, 'offuser', 'offuser@sngce.ac.in', 'officeuser', '684017dde38b32a40d75b1fff6dbfe66');

-- --------------------------------------------------------

--
-- Table structure for table `transationinfo`
--

DROP TABLE IF EXISTS `transationinfo`;
CREATE TABLE IF NOT EXISTS `transationinfo` (
  `TransNo` int(20) NOT NULL AUTO_INCREMENT,
  `candidateId` int(5) NOT NULL,
  `adharNo` bigint(12) NOT NULL,
  `ptype` varchar(10) NOT NULL,
  `transationId` varchar(20) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `Amount` int(20) NOT NULL,
  PRIMARY KEY (`TransNo`),
  UNIQUE KEY `candidateId` (`candidateId`),
  UNIQUE KEY `adharNo` (`adharNo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transationinfo`
--

INSERT INTO `transationinfo` (`TransNo`, `candidateId`, `adharNo`, `ptype`, `transationId`, `bank`, `Amount`) VALUES
(14, 26, 877665545667, 'RTGS', '867324', 'SHAAKARA', 45645);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `year` int(4) NOT NULL,
  `appln_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidateinfo`
--
ALTER TABLE `candidateinfo`
  ADD CONSTRAINT `candidateinfo_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE;

--
-- Constraints for table `candidatepersonalinfo`
--
ALTER TABLE `candidatepersonalinfo`
  ADD CONSTRAINT `candidatepersonalinfo_ibfk_1` FOREIGN KEY (`candidateId`) REFERENCES `candidateinfo` (`candidateId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;\
-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 06, 2020 at 09:15 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitaldw`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `areaKey` int(11) NOT NULL,
  `regionName` varchar(255) DEFAULT NULL,
  `areaLocation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `factrawatjalan`
--

CREATE TABLE `factrawatjalan` (
  `rawatJalanKey` int(11) NOT NULL,
  `timeKey` int(11) DEFAULT NULL,
  `nurseKey` int(11) DEFAULT NULL,
  `physicianKey` int(11) DEFAULT NULL,
  `patientKey` int(11) DEFAULT NULL,
  `totalCost` int(11) DEFAULT NULL,
  `dose` int(11) DEFAULT NULL,
  `examinationRoom` varchar(5) DEFAULT NULL,
  `medicationKey` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `medicationKey` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `brandName` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nurseKey` int(11) NOT NULL,
  `nurseName` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `registered` int(11) DEFAULT NULL,
  `SSN` varchar(15) DEFAULT NULL,
  `employeeId` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientKey` int(11) NOT NULL,
  `jobKey` int(11) NOT NULL,
  `areaKey` int(11) DEFAULT NULL,
  `patientSSN` varchar(15) NOT NULL,
  `age` int(11) NOT NULL,
  `ageCategory` varchar(50) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `isFromAbroad` enum('Y','N') NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `patientName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patientJob`
--

CREATE TABLE `patientJob` (
  `jobKey` int(11) NOT NULL,
  `jobName` varchar(100) DEFAULT NULL,
  `jobCategory` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `physician`
--

CREATE TABLE `physician` (
  `physicianKey` int(11) NOT NULL,
  `physicianName` varchar(255) DEFAULT NULL,
  `SSN` varchar(15) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `areaKey` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `employeeId` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE `time` (
  `timeKey` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `monthNo` int(11) DEFAULT NULL,
  `quarter` int(11) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`areaKey`);

--
-- Indexes for table `factrawatjalan`
--
ALTER TABLE `factrawatjalan`
  ADD PRIMARY KEY (`rawatJalanKey`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`medicationKey`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nurseKey`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientKey`);

--
-- Indexes for table `patientJob`
--
ALTER TABLE `patientJob`
  ADD PRIMARY KEY (`jobKey`);

--
-- Indexes for table `physician`
--
ALTER TABLE `physician`
  ADD PRIMARY KEY (`physicianKey`);

--
-- Indexes for table `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`timeKey`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `areaKey` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factrawatjalan`
--
ALTER TABLE `factrawatjalan`
  MODIFY `rawatJalanKey` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medication`
--
ALTER TABLE `medication`
  MODIFY `medicationKey` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nurse`
--
ALTER TABLE `nurse`
  MODIFY `nurseKey` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientKey` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patientJob`
--
ALTER TABLE `patientJob`
  MODIFY `jobKey` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `physician`
--
ALTER TABLE `physician`
  MODIFY `physicianKey` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time`
--
ALTER TABLE `time`
  MODIFY `timeKey` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

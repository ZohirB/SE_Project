-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2022 at 09:06 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `se_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--
-- Creation: Apr 16, 2022 at 07:04 PM
-- Last update: Apr 16, 2022 at 07:04 PM
--

CREATE TABLE `customers` (
  `ID_Customer` int(11) NOT NULL,
  `Customer_Name` varchar(40) DEFAULT NULL,
  `Age` int(11) NOT NULL,
  `Blood_Type` varchar(3) DEFAULT NULL,
  `Wanted_Part` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`ID_Customer`, `Customer_Name`, `Age`, `Blood_Type`, `Wanted_Part`) VALUES
(1, 'IronMan', 40, 'A+', 'Face'),
(2, 'Thor', 99, 'AB+', 'Eye'),
(3, 'Thanos', 80, 'O-', 'Heart'),
(4, 'Deadpool', 25, 'B+', 'Skin'),
(5, 'Fury', 45, 'A-', 'Eye'),
(6, 'Bucky', 32, 'O+', 'Arm');

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--
-- Creation: Apr 16, 2022 at 07:04 PM
-- Last update: Apr 16, 2022 at 07:04 PM
--

CREATE TABLE `dealer` (
  `ID_Dealer` int(11) NOT NULL,
  `Dealer_Name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`ID_Dealer`, `Dealer_Name`) VALUES
(1, 'Rafeal'),
(2, 'Saleh'),
(3, 'Taghred'),
(4, 'Dania');

-- --------------------------------------------------------

--
-- Table structure for table `gang_member`
--
-- Creation: Apr 16, 2022 at 07:04 PM
-- Last update: Apr 16, 2022 at 07:04 PM
--

CREATE TABLE `gang_member` (
  `ID_GM` int(11) NOT NULL,
  `GM_name` varchar(40) DEFAULT NULL,
  `Job` varchar(40) NOT NULL,
  `Leader` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gang_member`
--

INSERT INTO `gang_member` (`ID_GM`, `GM_name`, `Job`, `Leader`) VALUES
(1, 'Homoom', 'Leader', NULL),
(2, 'Denver', 'Driver', 1),
(3, 'Rio', 'Bomber', 2),
(4, 'Berlin', 'Killer', 2),
(5, 'Nairobi', 'Driver', 1),
(6, 'Moscow', 'Bomber', 5),
(7, 'Helsinki', 'Killer', 5);

-- --------------------------------------------------------

--
-- Table structure for table `gs`
--
-- Creation: Apr 16, 2022 at 07:04 PM
-- Last update: Apr 16, 2022 at 07:04 PM
--

CREATE TABLE `gs` (
  `ID_GS` int(11) NOT NULL,
  `ID_GM` int(11) NOT NULL,
  `ID_SG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gs`
--

INSERT INTO `gs` (`ID_GS`, `ID_GM`, `ID_SG`) VALUES
(1, 2, 2),
(2, 3, 2),
(3, 4, 2),
(4, 5, 4),
(5, 6, 4),
(6, 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `op`
--
-- Creation: Apr 16, 2022 at 07:04 PM
--

CREATE TABLE `op` (
  `ID_Sales` int(11) NOT NULL,
  `ID_Part` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `parts_name`
--
-- Creation: Apr 16, 2022 at 07:04 PM
-- Last update: Apr 16, 2022 at 07:04 PM
--

CREATE TABLE `parts_name` (
  `ID_Part` int(11) NOT NULL,
  `Part_Name` varchar(40) DEFAULT NULL,
  `ID_Victim` int(11) DEFAULT NULL,
  `Available` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parts_name`
--

INSERT INTO `parts_name` (`ID_Part`, `Part_Name`, `ID_Victim`, `Available`) VALUES
(1, 'Kidney', 1, 'Y'),
(2, 'Liver', 2, 'Y'),
(3, 'Heart', 4, 'N'),
(4, 'Lungs', 3, 'N'),
(5, 'Skin', 3, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--
-- Creation: Apr 16, 2022 at 07:04 PM
--

CREATE TABLE `sales` (
  `ID_Sales` int(11) NOT NULL,
  `ID_Customer` int(11) DEFAULT NULL,
  `ID_Dealer` int(11) DEFAULT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sub_group`
--
-- Creation: Apr 16, 2022 at 07:04 PM
-- Last update: Apr 16, 2022 at 07:04 PM
--

CREATE TABLE `sub_group` (
  `ID_SG` int(11) NOT NULL,
  `SG_Name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_group`
--

INSERT INTO `sub_group` (`ID_SG`, `SG_Name`) VALUES
(1, 'Alpha'),
(2, 'Beta'),
(3, 'Gamma'),
(4, 'Delta'),
(5, 'Alpha');

-- --------------------------------------------------------

--
-- Table structure for table `territory`
--
-- Creation: Apr 16, 2022 at 07:04 PM
-- Last update: Apr 16, 2022 at 07:04 PM
--

CREATE TABLE `territory` (
  `ID_Territory` int(11) NOT NULL,
  `Territory_Name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `territory`
--

INSERT INTO `territory` (`ID_Territory`, `Territory_Name`) VALUES
(3, 'Al_Hamadaniha'),
(2, 'City Center'),
(4, 'Old Aleppo'),
(1, 'Salah Al_Din');

-- --------------------------------------------------------

--
-- Table structure for table `victim`
--
-- Creation: Apr 16, 2022 at 07:04 PM
-- Last update: Apr 16, 2022 at 07:04 PM
--

CREATE TABLE `victim` (
  `ID_Victim` int(11) NOT NULL,
  `ID_GS` int(11) DEFAULT NULL,
  `Age` int(11) NOT NULL,
  `Blood_Type` varchar(3) DEFAULT NULL,
  `ID_Territory` int(11) DEFAULT NULL,
  `Date_Of_Murder` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `victim`
--

INSERT INTO `victim` (`ID_Victim`, `ID_GS`, `Age`, `Blood_Type`, `ID_Territory`, `Date_Of_Murder`) VALUES
(1, 2, 30, 'AB+', 4, '2022-04-16 19:04:14'),
(2, 1, 45, 'O-', 1, '2022-04-16 19:04:14'),
(3, 5, 18, 'A+', 1, '2022-04-16 19:04:14'),
(4, 5, 50, 'B-', 3, '2022-04-16 19:04:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID_Customer`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`ID_Dealer`);

--
-- Indexes for table `gang_member`
--
ALTER TABLE `gang_member`
  ADD PRIMARY KEY (`ID_GM`),
  ADD UNIQUE KEY `GM_name` (`GM_name`);

--
-- Indexes for table `gs`
--
ALTER TABLE `gs`
  ADD PRIMARY KEY (`ID_GS`,`ID_GM`,`ID_SG`),
  ADD KEY `ID_GM` (`ID_GM`),
  ADD KEY `ID_SG` (`ID_SG`);

--
-- Indexes for table `op`
--
ALTER TABLE `op`
  ADD PRIMARY KEY (`ID_Sales`,`ID_Part`),
  ADD KEY `ID_Part` (`ID_Part`);

--
-- Indexes for table `parts_name`
--
ALTER TABLE `parts_name`
  ADD PRIMARY KEY (`ID_Part`),
  ADD UNIQUE KEY `Part_Name` (`Part_Name`),
  ADD KEY `ID_Victim` (`ID_Victim`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`ID_Sales`),
  ADD KEY `ID_Customer` (`ID_Customer`),
  ADD KEY `ID_Dealer` (`ID_Dealer`);

--
-- Indexes for table `sub_group`
--
ALTER TABLE `sub_group`
  ADD PRIMARY KEY (`ID_SG`);

--
-- Indexes for table `territory`
--
ALTER TABLE `territory`
  ADD PRIMARY KEY (`ID_Territory`),
  ADD UNIQUE KEY `Territory_Name` (`Territory_Name`);

--
-- Indexes for table `victim`
--
ALTER TABLE `victim`
  ADD PRIMARY KEY (`ID_Victim`),
  ADD KEY `ID_GS` (`ID_GS`),
  ADD KEY `ID_Territory` (`ID_Territory`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `ID_Customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dealer`
--
ALTER TABLE `dealer`
  MODIFY `ID_Dealer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gang_member`
--
ALTER TABLE `gang_member`
  MODIFY `ID_GM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gs`
--
ALTER TABLE `gs`
  MODIFY `ID_GS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `parts_name`
--
ALTER TABLE `parts_name`
  MODIFY `ID_Part` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `ID_Sales` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_group`
--
ALTER TABLE `sub_group`
  MODIFY `ID_SG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `territory`
--
ALTER TABLE `territory`
  MODIFY `ID_Territory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `victim`
--
ALTER TABLE `victim`
  MODIFY `ID_Victim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gs`
--
ALTER TABLE `gs`
  ADD CONSTRAINT `gs_ibfk_1` FOREIGN KEY (`ID_GM`) REFERENCES `gang_member` (`ID_GM`) ON DELETE CASCADE,
  ADD CONSTRAINT `gs_ibfk_2` FOREIGN KEY (`ID_SG`) REFERENCES `sub_group` (`ID_SG`) ON DELETE CASCADE;

--
-- Constraints for table `op`
--
ALTER TABLE `op`
  ADD CONSTRAINT `op_ibfk_1` FOREIGN KEY (`ID_Sales`) REFERENCES `sales` (`ID_Sales`),
  ADD CONSTRAINT `op_ibfk_2` FOREIGN KEY (`ID_Part`) REFERENCES `parts_name` (`ID_Part`);

--
-- Constraints for table `parts_name`
--
ALTER TABLE `parts_name`
  ADD CONSTRAINT `parts_name_ibfk_1` FOREIGN KEY (`ID_Victim`) REFERENCES `victim` (`ID_Victim`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ID_Customer`) REFERENCES `customers` (`ID_Customer`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`ID_Dealer`) REFERENCES `dealer` (`ID_Dealer`);

--
-- Constraints for table `victim`
--
ALTER TABLE `victim`
  ADD CONSTRAINT `victim_ibfk_1` FOREIGN KEY (`ID_GS`) REFERENCES `gs` (`ID_GS`),
  ADD CONSTRAINT `victim_ibfk_2` FOREIGN KEY (`ID_Territory`) REFERENCES `territory` (`ID_Territory`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

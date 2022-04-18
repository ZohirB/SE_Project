CREATE TABLE `Gang_Member` (
  `ID_GM` INT PRIMARY KEY,
  `GM_name` VARCHAR(40),
  `Job` VARCHAR(40),
  `Leader` INT
);

CREATE TABLE `Sub_Group` (
  `ID_SG` INT PRIMARY KEY,
  `SG_Name` VARCHAR(40)
);

CREATE TABLE `GS` (
  `ID_GS` INT,
  `ID_GM` INT,
  `ID_SG` INT,
  PRIMARY KEY (`ID_GS`, `ID_GM`, `ID_SG`)
);

CREATE TABLE `Territory` (
  `ID_Territory` INT PRIMARY KEY,
  `Territory_Name` VARCHAR(40)
);

CREATE TABLE `Victim` (
  `ID_Victim` INT PRIMARY KEY,
  `ID_GS` INT,
  `Age` INT,
  `Blood_Type` VARCHAR(3),
  `ID_Territory` INT,
  `Date_Of_Murder` TIMESTAMP
);

CREATE TABLE `Parts_Name` (
  `ID_Part` INT PRIMARY KEY,
  `Part_Name` VARCHAR(40),
  `ID_Victim` INT,
  `Available` VARCHAR(1)
);

CREATE TABLE `Dealer` (
  `ID_Dealer` INT PRIMARY KEY,
  `Dealer_Name` VARCHAR(40)
);

CREATE TABLE `Customers` (
  `ID_Customer` INT PRIMARY KEY,
  `Customer_Name` VARCHAR(40),
  `Age` INT,
  `Blood_Type` VARCHAR(3),
  `Wanted_Part` VARCHAR(40)
);

CREATE TABLE `Sales` (
  `ID_Sales` INT PRIMARY KEY,
  `ID_Customer` INT,
  `ID_Dealer` INT,
  `Price` INT
);

CREATE TABLE `OP` (
  `ID_Sales` INT,
  `ID_Part` INT,
  PRIMARY KEY (`ID_Sales`, `ID_Part`)
);

ALTER TABLE `Gang_Member` ADD FOREIGN KEY (`Leader`) REFERENCES `Gang_Member` (`ID_GM`);

ALTER TABLE `GS` ADD FOREIGN KEY (`ID_GM`) REFERENCES `Gang_Member` (`ID_GM`);

ALTER TABLE `GS` ADD FOREIGN KEY (`ID_SG`) REFERENCES `Sub_Group` (`ID_SG`);

ALTER TABLE `Victim` ADD FOREIGN KEY (`ID_GS`) REFERENCES `GS` (`ID_GS`);

ALTER TABLE `Victim` ADD FOREIGN KEY (`ID_Territory`) REFERENCES `Territory` (`ID_Territory`);

ALTER TABLE `Parts_Name` ADD FOREIGN KEY (`ID_Victim`) REFERENCES `Victim` (`ID_Victim`);

ALTER TABLE `OP` ADD FOREIGN KEY (`ID_Part`) REFERENCES `Parts_Name` (`ID_Part`);

ALTER TABLE `OP` ADD FOREIGN KEY (`ID_Sales`) REFERENCES `Sales` (`ID_Sales`);

ALTER TABLE `Sales` ADD FOREIGN KEY (`ID_Dealer`) REFERENCES `Dealer` (`ID_Dealer`);

ALTER TABLE `Sales` ADD FOREIGN KEY (`ID_Customer`) REFERENCES `Customers` (`ID_Customer`);

INSERT INTO `customers` (`ID_Customer`, `Customer_Name`, `Age`, `Blood_Type`, `Wanted_Part`) VALUES
(1, 'IronMan', 40, 'A+', 'Face'),
(2, 'Thor', 99, 'AB+', 'Eye'),
(3, 'Thanos', 80, 'O-', 'Heart'),
(4, 'Deadpool', 25, 'B+', 'Skin'),
(5, 'Fury', 45, 'A-', 'Eye'),
(6, 'Bucky', 32, 'O+', 'Arm');

INSERT INTO `dealer` (`ID_Dealer`, `Dealer_Name`) VALUES
(1, 'Rafeal'),
(2, 'Saleh'),
(3, 'Taghred'),
(4, 'Dania');


INSERT INTO `gang_member` (`ID_GM`, `GM_name`, `Job`, `Leader`) VALUES
(1, 'Homoom', 'Leader', NULL),
(2, 'Denver', 'Driver', 1),
(3, 'Rio', 'Bomber', 2),
(4, 'Berlin', 'Killer', 2),
(5, 'Nairobi', 'Driver', 1),
(6, 'Moscow', 'Bomber', 5),
(7, 'Helsinki', 'Killer', 5);

INSERT INTO `gs` (`ID_GS`, `ID_GM`, `ID_SG`) VALUES
(1, 2, 2),
(2, 3, 2),
(3, 4, 2),
(4, 5, 4),
(5, 6, 4),
(6, 7, 4);

INSERT INTO `parts_name` (`ID_Part`, `Part_Name`, `ID_Victim`, `Available`) VALUES
(1, 'Kidney', 1, 'Y'),
(2, 'Liver', 2, 'Y'),
(3, 'Heart', 4, 'N'),
(4, 'Lungs', 3, 'N'),
(5, 'Skin', 3, 'Y');

INSERT INTO `sub_group` (`ID_SG`, `SG_Name`) VALUES
(1, 'Alpha'),
(2, 'Beta'),
(3, 'Gamma'),
(4, 'Delta'),
(5, 'Alpha');

INSERT INTO `territory` (`ID_Territory`, `Territory_Name`) VALUES
(3, 'Al_Hamadaniha'),
(2, 'City Center'),
(4, 'Old Aleppo'),
(1, 'Salah Al_Din');

INSERT INTO `victim` (`ID_Victim`, `ID_GS`, `Age`, `Blood_Type`, `ID_Territory`, `Date_Of_Murder`) VALUES
(1, 2, 30, 'AB+', 4, '2022-04-16 19:04:14'),
(2, 1, 45, 'O-', 1, '2022-04-16 19:04:14'),
(3, 5, 18, 'A+', 1, '2022-04-16 19:04:14'),
(4, 5, 50, 'B-', 3, '2022-04-16 19:04:15');



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

CREATE TABLE `V_GS` (
  `ID_VGS` INT,
  `ID_GS` INT,
  `ID_Victim` INT,
  PRIMARY KEY (`ID_VGS`, `ID_GS`, `ID_Victim`)
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

CREATE TABLE `P_V` (
  `ID_PV` INT PRIMARY KEY,
  `ID_Part` INT,
  `ID_Victim` INT,
  `ID_Sales` VARCHAR(40)
);

CREATE TABLE `Parts_Name` (
  `ID_Part` INT PRIMARY KEY,
  `Part_Name` VARCHAR(40),
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

ALTER TABLE `Gang_Member` ADD FOREIGN KEY (`Leader`) REFERENCES `Gang_Member` (`ID_GM`);

ALTER TABLE `GS` ADD FOREIGN KEY (`ID_GM`) REFERENCES `Gang_Member` (`ID_GM`);

ALTER TABLE `GS` ADD FOREIGN KEY (`ID_SG`) REFERENCES `Sub_Group` (`ID_SG`);

ALTER TABLE `V_GS` ADD FOREIGN KEY (`ID_GS`) REFERENCES `GS` (`ID_GS`);

ALTER TABLE `V_GS` ADD FOREIGN KEY (`ID_Victim`) REFERENCES `Victim` (`ID_Victim`);

ALTER TABLE `Victim` ADD FOREIGN KEY (`ID_Territory`) REFERENCES `Territory` (`ID_Territory`);

ALTER TABLE `P_V` ADD FOREIGN KEY (`ID_Victim`) REFERENCES `Victim` (`ID_Victim`);

ALTER TABLE `P_V` ADD FOREIGN KEY (`ID_Part`) REFERENCES `Parts_Name` (`ID_Part`);

ALTER TABLE `P_V` ADD FOREIGN KEY (`ID_Sales`) REFERENCES `Sales` (`ID_Sales`);

ALTER TABLE `Sales` ADD FOREIGN KEY (`ID_Dealer`) REFERENCES `Dealer` (`ID_Dealer`);

ALTER TABLE `Sales` ADD FOREIGN KEY (`ID_Customer`) REFERENCES `Customers` (`ID_Customer`);


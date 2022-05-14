CREATE TABLE `Weapon_detail` (
  `ID_WD` INT PRIMARY KEY,
  `W_Name` VARCHAR(40) NOT NULL,
  `W_Type` VARCHAR(40) NOT NULL
);

CREATE TABLE `Shipment` (
  `ID_Shipment` INT PRIMARY KEY,
  `Received_date` timestamp NOT NULL,
  `Number_of_item` INT(15) NOT NULL,
  `Total_Price` INT(20) NOT NULL
);

CREATE TABLE `Armory` (
  `ID_Item` INT PRIMARY KEY,
  `ID_WD` INT NOT NULL,
  `ID_Shipment` INT NOT NULL,
  `Price` INT(21)
);

CREATE TABLE `Car_Detail` (
  `ID_CD` INT PRIMARY KEY,
  `Model_Name` VARCHAR(40) UNIQUE,
  `Capacity` INT(2),
  `Color` VARCHAR(10)
);

CREATE TABLE `License_Plate` (
  `ID_LP` INT PRIMARY KEY,
  `License_Number` VARCHAR(40) UNIQUE,
  `times_of_use` INT(2) DEFAULT 0
);

CREATE TABLE `Car_License` (
  `ID_CL` INT PRIMARY KEY,
  `ID_CD` INT,
  `ID_LP` INT
);

CREATE TABLE `Gang_Member` (
  `ID_GM` INT PRIMARY KEY,
  `GM_name` VARCHAR(40) UNIQUE,
  `Job` VARCHAR(40) NOT NULL,
  `Leader` INT
);

CREATE TABLE `Sub_Group` (
  `ID_SG` INT PRIMARY KEY,
  `SG_Name` VARCHAR(40)
);

CREATE TABLE `GS` (
  `ID_GS` INT,
  `ID_GM` INT NOT NULL,
  `ID_SG` INT NOT NULL,
  `ID_Item` INT,
  `ID_CL` INT NOT NULL,
  PRIMARY KEY (`ID_GS`)
);

CREATE TABLE `Territory` (
  `ID_Territory` INT PRIMARY KEY,
  `Territory_Name` VARCHAR(40) UNIQUE,
  `Territory_Type` VARCHAR(1) NOT NULL
);

CREATE TABLE `Victim` (
  `ID_Victim` INT PRIMARY KEY,
  `Age` INT NOT NULL,
  `Blood_Type` VARCHAR(3),
  `ID_Territory` INT,
  `Date_Of_Murder` timestamp NOT NULL
);

CREATE TABLE `VGS` (
  `ID_VGS` INT,
  `ID_GS` INT,
  `ID_Victim` INT,
  PRIMARY KEY (`ID_VGS`)
);

CREATE TABLE `Part_Name` (
  `ID_Part` INT PRIMARY KEY,
  `Part_Name` VARCHAR(40) UNIQUE,
  `Available` VARCHAR(1)
);

CREATE TABLE `Dealer` (
  `ID_Dealer` INT PRIMARY KEY,
  `Dealer_Name` VARCHAR(40)
);

CREATE TABLE `Customer` (
  `ID_Customer` INT PRIMARY KEY,
  `Customer_Name` VARCHAR(40),
  `Age` INT NOT NULL,
  `Blood_Type` VARCHAR(3),
  `Wanted_Part` VARCHAR(40)
);

CREATE TABLE `Sale` (
  `ID_Sale` INT PRIMARY KEY,
  `ID_Customer` INT NOT NULL,
  `ID_Dealer` INT NOT NULL,
  `Price` INT NOT NULL
);

CREATE TABLE `P_V` (
  `ID_PV` INT PRIMARY KEY,
  `ID_Part` INT,
  `ID_Victim` INT,
  `ID_Sale` INT
);

CREATE TABLE `Graveyard` (
  `ID_Graveyard` INT PRIMARY KEY,
  `Graveyard_Name` VARCHAR(40) NOT NULL,
  `ID_Territory` INT NOT NULL,
  `Quantity` INT(2) DEFAULT 0,
  `Capacity` INT(2)
);

CREATE TABLE `Sub_Graveyard` (
  `ID_Sub_Graveyard` INT PRIMARY KEY,
  `ID_Graveyard` INT NOT NULL,
  `Grave_Number` INT(5) NOT NULL,
  `ID_Victim` INT NOT NULL
);

ALTER TABLE `Armory` ADD FOREIGN KEY (`ID_WD`) REFERENCES `Weapon_detail` (`ID_WD`) ON DELETE CASCADE;

ALTER TABLE `Armory` ADD FOREIGN KEY (`ID_Shipment`) REFERENCES `Shipment` (`ID_Shipment`) ON DELETE CASCADE;

ALTER TABLE `Car_License` ADD FOREIGN KEY (`ID_CD`) REFERENCES `Car_Detail` (`ID_CD`) ON DELETE CASCADE;

ALTER TABLE `Car_License` ADD FOREIGN KEY (`ID_LP`) REFERENCES `License_Plate` (`ID_LP`) ON DELETE CASCADE;

ALTER TABLE `GS` ADD FOREIGN KEY (`ID_GM`) REFERENCES `Gang_Member` (`ID_GM`) ON DELETE CASCADE;

ALTER TABLE `GS` ADD FOREIGN KEY (`ID_SG`) REFERENCES `Sub_Group` (`ID_SG`) ON DELETE CASCADE;

ALTER TABLE `GS` ADD FOREIGN KEY (`ID_Item`) REFERENCES `Armory` (`ID_Item`) ON DELETE CASCADE;

ALTER TABLE `GS` ADD FOREIGN KEY (`ID_CL`) REFERENCES `Car_License` (`ID_CL`) ON DELETE CASCADE;

ALTER TABLE `Victim` ADD FOREIGN KEY (`ID_Territory`) REFERENCES `Territory` (`ID_Territory`) ON DELETE CASCADE;

ALTER TABLE `VGS` ADD FOREIGN KEY (`ID_GS`) REFERENCES `GS` (`ID_GS`) ON DELETE CASCADE;

ALTER TABLE `VGS` ADD FOREIGN KEY (`ID_Victim`) REFERENCES `Victim` (`ID_Victim`) ON DELETE CASCADE;

ALTER TABLE `Sale` ADD FOREIGN KEY (`ID_Customer`) REFERENCES `Customer` (`ID_Customer`) ON DELETE CASCADE;

ALTER TABLE `Sale` ADD FOREIGN KEY (`ID_Dealer`) REFERENCES `Dealer` (`ID_Dealer`) ON DELETE CASCADE;

ALTER TABLE `P_V` ADD FOREIGN KEY (`ID_Part`) REFERENCES `Part_Name` (`ID_Part`) ON DELETE CASCADE;

ALTER TABLE `P_V` ADD FOREIGN KEY (`ID_Victim`) REFERENCES `Victim` (`ID_Victim`) ON DELETE CASCADE;

ALTER TABLE `P_V` ADD FOREIGN KEY (`ID_Sale`) REFERENCES `Sale` (`ID_Sale`) ON DELETE CASCADE;

ALTER TABLE `Graveyard` ADD FOREIGN KEY (`ID_Territory`) REFERENCES `Territory` (`ID_Territory`) ON DELETE CASCADE;

ALTER TABLE `Sub_Graveyard` ADD FOREIGN KEY (`ID_Graveyard`) REFERENCES `Graveyard` (`ID_Graveyard`) ON DELETE CASCADE;

ALTER TABLE `Sub_Graveyard` ADD FOREIGN KEY (`ID_Victim`) REFERENCES `Victim` (`ID_Victim`) ON DELETE CASCADE;

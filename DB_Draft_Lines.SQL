/* Gang_Member Section */
CREATE TABLE Gang_Member (
  ID_GM INT PRIMARY KEY AUTO_INCREMENT,
  GM_name VARCHAR(40) UNIQUE,
  Job VARCHAR(40) NOT NULL,
  Leader INT
);

INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Homoom ', 'Leader' ,NULL);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Denver', 'Driver',1);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Rio', 'Bomber',2);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Berlin', 'Killer',2);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Nairobi', 'Driver',1);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Moscow', 'Bomber',5);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Helsinki', 'Killer',5);

/* Territory Section */
CREATE TABLE Territory (
  ID_Territory INT PRIMARY KEY AUTO_INCREMENT,
  Name_Territory VARCHAR(40) UNIQUE
);
INSERT INTO Territory (Name_Territory) VALUES ('Salah Al_Din');
INSERT INTO Territory (Name_Territory) VALUES ('City Center');
INSERT INTO Territory (Name_Territory) VALUES ('Al_Hamadaniha');
INSERT INTO Territory (Name_Territory) VALUES ('Old Aleppo');

/* Sub_Group Section */
CREATE TABLE Sub_Group (
  ID_SP INT,
  ID_GM INT,
  PRIMARY KEY(ID_SP,ID_GM),
  ID_Territory INT
);

ALTER TABLE Sub_Group
  ADD FOREIGN KEY (ID_GM) 
  REFERENCES Gang_Member(ID_GM) 
  ON DELETE CASCADE;

ALTER TABLE Sub_Group
 ADD FOREIGN KEY (ID_Territory) 
 REFERENCES Territory(ID_Territory) 
 ON DELETE CASCADE;

INSERT INTO Sub_Group (ID_SP,ID_GM,ID_Territory) VALUES (1,2,3);
INSERT INTO Sub_Group (ID_SP,ID_GM,ID_Territory) VALUES (1,3,3);
INSERT INTO Sub_Group (ID_SP,ID_GM,ID_Territory) VALUES (1,4,3);
INSERT INTO Sub_Group (ID_SP,ID_GM,ID_Territory) VALUES (2,5,1);
INSERT INTO Sub_Group (ID_SP,ID_GM,ID_Territory) VALUES (2,6,1);
INSERT INTO Sub_Group (ID_SP,ID_GM,ID_Territory) VALUES (2,7,1);

/* Dealer Section */
CREATE TABLE Dealer(
  ID_Dealer INT PRIMARY KEY AUTO_INCREMENT,
  Dealer_Name VARCHAR(40),
  Dealer_Territory INT
);

ALTER TABLE Dealer
  ADD FOREIGN KEY (Dealer_Territory) 
  REFERENCES Territory(ID_Territory)
  ON DELETE SET NULL;

INSERT INTO Dealer (Dealer_Name,Dealer_Territory) VALUES ('Rafeal',1);
INSERT INTO Dealer (Dealer_Name,Dealer_Territory) VALUES ('Saleh',2);
INSERT INTO Dealer (Dealer_Name,Dealer_Territory) VALUES ('Taghred',3);
INSERT INTO Dealer (Dealer_Name,Dealer_Territory) VALUES ('Dania',4);

/* Blood Section */
CREATE TABLE Blood(
  Blood_Type VARCHAR(2) NOT NULL,
  UNIQUE(Blood_Type)
);
INSERT INTO Blood (Blood_Type) VALUES ('A+');
INSERT INTO Blood (Blood_Type) VALUES ('A-');
INSERT INTO Blood (Blood_Type) VALUES ('O+');
INSERT INTO Blood (Blood_Type) VALUES ('AB+');

/* Victim Section */
CREATE TABLE Victim (
  ID_Victim INT PRIMARY KEY AUTO_INCREMENT,
  Age INT NOT NULL,
  Blood_Type VARCHAR(2),
  FOREIGN KEY (Blood_Type) REFERENCES Blood(Blood_Type),
  Date_Of_Murder TIMESTAMP NOT NULL,
  Sub_Group_Responsible INT,
  FOREIGN KEY (Sub_Group_Responsible) REFERENCES Sub_Group(ID_SP)
);
INSERT INTO Victim (Age,Blood_Type,Sub_Group_Responsible) VALUES (30,'AB+',1);
INSERT INTO Victim (Age,Blood_Type,Sub_Group_Responsible) VALUES (18,'A+',2);

/* Parts_Name Section */
CREATE TABLE Parts_Name (
  ID_Part INT PRIMARY KEY AUTO_INCREMENT,
  Part_Name VARCHAR(40) UNIQUE
);
INSERT INTO Parts_Name (Part_Name) VALUES ('Kidneys');
INSERT INTO Parts_Name (Part_Name) VALUES ('Liver');
INSERT INTO Parts_Name (Part_Name) VALUES ('Heart');
INSERT INTO Parts_Name (Part_Name) VALUES ('Lungs');
INSERT INTO Parts_Name (Part_Name) VALUES ('Skin');

/* Parts_Name Section */
CREATE TABLE Storage (
  ID_Item INT PRIMARY KEY AUTO_INCREMENT,
  ID_Part INT,
  FOREIGN KEY (ID_Part) REFERENCES Parts_Name(ID_Part),
  ID_Victim INT,
  FOREIGN KEY (ID_Victim) REFERENCES Victim(ID_Victim),
  Available VARCHAR(1) 
);
INSERT INTO Storage (ID_Part,ID_Victim,Available) VALUES (1,2,'Y');
INSERT INTO Storage (ID_Part,ID_Victim,Available) VALUES (5,1,'N');
INSERT INTO Storage (ID_Part,ID_Victim,Available) VALUES (5,1,'Y');

/* Parts_Name Customers */
CREATE TABLE Customers (
  ID_Customer INT PRIMARY KEY AUTO_INCREMENT,
  Age INT NOT NULL,
  Blood_Type VARCHAR(2),
  FOREIGN KEY (Blood_Type) REFERENCES Blood(Blood_Type),
  Wanted_Part INT,
  FOREIGN KEY (Wanted_Part) REFERENCES Parts_Name(ID_Part)
);
INSERT INTO Customers (Age,Blood_Type,Wanted_Part) VALUES (25,'A+',2);
INSERT INTO Customers (Age,Blood_Type,Wanted_Part) VALUES (50,'O+',5);

/* Parts_Name Customers */
CREATE TABLE Sales(
  ID_Sales INT PRIMARY KEY AUTO_INCREMENT,
  ID_Customer INT,
  FOREIGN KEY (ID_Customer) REFERENCES Customers(ID_Customer),
  ID_Dealer INT,
  FOREIGN KEY (ID_Dealer) REFERENCES Dealer(ID_Dealer),
  ID_Item INT,
  FOREIGN KEY (ID_Item) REFERENCES Storage(ID_Item),
  Price INT NOT NULL
);
/*INSERT INTO Sales (ID_Customer,ID_Dealer,ID_Item,Price) VALUES (1,2,5,10000);*/

/* 
لا تنسوا تحطوا كومنتات وأنتو عم تشتغلوا
وتضيفوا كمان أمثلة زيادة
وتحطوا تساكات لنعمل عليهن سليكتات
*/

/* Gang_Member Section */
CREATE TABLE Gang_Member (
  ID_GM INT PRIMARY KEY AUTO_INCREMENT,
  GM_name VARCHAR(40) UNIQUE,
  Job VARCHAR(40) NOT NULL,
  Leader INT 
);

INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Homoom','Leader' ,NULL);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Denver','Driver',1);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Rio','Bomber',2);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Berlin','Killer',2);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Nairobi','Driver',1);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Moscow','Bomber',5);
INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES ('Helsinki','Killer',5);

/* Sub_Group Section */
CREATE TABLE Sub_Group (
  ID_SG INT PRIMARY KEY AUTO_INCREMENT,
  SG_Name VARCHAR(40)
);
INSERT INTO Sub_Group (SG_Name) VALUES ('Alpha');
INSERT INTO Sub_Group (SG_Name) VALUES ('Beta');
INSERT INTO Sub_Group (SG_Name) VALUES ('Gamma');
INSERT INTO Sub_Group (SG_Name) VALUES ('Delta');
INSERT INTO Sub_Group (SG_Name) VALUES ('Alpha');

/* GS Section */
CREATE TABLE GS (
  ID_GS INT AUTO_INCREMENT,
  ID_GM INT,
  ID_SG INT,
  PRIMARY KEY(ID_GS,ID_GM,ID_SG)
);

ALTER TABLE GS
  ADD FOREIGN KEY (ID_GM) 
  REFERENCES Gang_Member(ID_GM) 
  ON DELETE CASCADE;

ALTER TABLE GS
 ADD FOREIGN KEY (ID_SG) 
 REFERENCES Sub_Group(ID_SG) 
 ON DELETE CASCADE;

INSERT INTO GS (ID_GM,ID_SG) VALUES (2,2);
INSERT INTO GS (ID_GM,ID_SG) VALUES (3,2);
INSERT INTO GS (ID_GM,ID_SG) VALUES (4,2);
INSERT INTO GS (ID_GM,ID_SG) VALUES (5,4);
INSERT INTO GS (ID_GM,ID_SG) VALUES (6,4);
INSERT INTO GS (ID_GM,ID_SG) VALUES (7,4);

/* Territory Section */
CREATE TABLE Territory (
  ID_Territory INT PRIMARY KEY AUTO_INCREMENT,
  Territory_Name VARCHAR(40) UNIQUE
);
INSERT INTO Territory (Territory_Name) VALUES ('Salah Al_Din');
INSERT INTO Territory (Territory_Name) VALUES ('City Center');
INSERT INTO Territory (Territory_Name) VALUES ('Al_Hamadaniha');
INSERT INTO Territory (Territory_Name) VALUES ('Old Aleppo');

/* Victim Section */
CREATE TABLE Victim (
  ID_Victim INT PRIMARY KEY AUTO_INCREMENT,
  ID_GS INT,
  FOREIGN KEY (ID_GS) REFERENCES GS(ID_GS),
  Age INT NOT NULL,
  Blood_Type VARCHAR(3),
  ID_Territory INT,
  FOREIGN KEY (ID_Territory) REFERENCES Territory(ID_Territory),
  Date_Of_Murder TIMESTAMP NOT NULL
);
INSERT INTO Victim (ID_GS,Age,Blood_Type,ID_Territory) VALUES (2,30,'AB+',4);
INSERT INTO Victim (ID_GS,Age,Blood_Type,ID_Territory) VALUES (1,45,'O-',1);
INSERT INTO Victim (ID_GS,Age,Blood_Type,ID_Territory) VALUES (5,18,'A+',1);
INSERT INTO Victim (ID_GS,Age,Blood_Type,ID_Territory) VALUES (5,50,'B-',3);

/* Parts_Name Section */
CREATE TABLE Parts_Name (
  ID_Part INT PRIMARY KEY AUTO_INCREMENT,
  Part_Name VARCHAR(40) UNIQUE,
  ID_Victim INT,
  FOREIGN KEY (ID_Victim) REFERENCES Victim(ID_Victim),
  Available VARCHAR(1)
);
INSERT INTO Parts_Name (Part_Name,ID_Victim,Available) VALUES ('Kidney',1,'Y');
INSERT INTO Parts_Name (Part_Name,ID_Victim,Available) VALUES ('Liver',2,'Y');
INSERT INTO Parts_Name (Part_Name,ID_Victim,Available) VALUES ('Heart',4,'N');
INSERT INTO Parts_Name (Part_Name,ID_Victim,Available) VALUES ('Lungs',3,'N');
INSERT INTO Parts_Name (Part_Name,ID_Victim,Available) VALUES ('Skin',3,'Y');

/* Dealer Section */
CREATE TABLE Dealer(
  ID_Dealer INT PRIMARY KEY AUTO_INCREMENT,
  Dealer_Name VARCHAR(40)
);
INSERT INTO Dealer (Dealer_Name) VALUES ('Rafeal');
INSERT INTO Dealer (Dealer_Name) VALUES ('Saleh');
INSERT INTO Dealer (Dealer_Name) VALUES ('Taghred');
INSERT INTO Dealer (Dealer_Name) VALUES ('Dania');

/* Customers Section */
CREATE TABLE Customers (
  ID_Customer INT PRIMARY KEY AUTO_INCREMENT,
  Customer_Name VARCHAR(40),
  Age INT NOT NULL,
  Blood_Type VARCHAR(3),
  Wanted_Part VARCHAR(40)
);
INSERT INTO Customers (Customer_Name,Age,Blood_Type,Wanted_Part) VALUES ('IronMan',40,'A+','Face');
INSERT INTO Customers (Customer_Name,Age,Blood_Type,Wanted_Part) VALUES ('Thor',99,'AB+','Eye');
INSERT INTO Customers (Customer_Name,Age,Blood_Type,Wanted_Part) VALUES ('Thanos',80,'O-','Heart');
INSERT INTO Customers (Customer_Name,Age,Blood_Type,Wanted_Part) VALUES ('Deadpool',25,'B+','Skin');
INSERT INTO Customers (Customer_Name,Age,Blood_Type,Wanted_Part) VALUES ('Fury',45,'A-','Eye');
INSERT INTO Customers (Customer_Name,Age,Blood_Type,Wanted_Part) VALUES ('Bucky',32,'O+','Arm');

/* Sales Section */
CREATE TABLE Sales (
  ID_Sales INT PRIMARY KEY AUTO_INCREMENT,
  ID_Customer INT,
  FOREIGN KEY (ID_Customer) REFERENCES Customers(ID_Customer),
  ID_Dealer INT,
  FOREIGN KEY (ID_Dealer) REFERENCES Dealer(ID_Dealer),
  Price INT NOT NULL
);
/*
INSERT INTO Sales (ID_Customer,ID_Dealer,Price) VALUES (1,3,9999);
INSERT INTO Sales (ID_Customer,ID_Dealer,Price) VALUES (2,1,18000);
INSERT INTO Sales (ID_Customer,ID_Dealer,Price) VALUES (4,2,1500);
INSERT INTO Sales (ID_Customer,ID_Dealer,Price) VALUES (3,2,98500);
*/

/* OP Section */
CREATE TABLE OP (
  ID_Sales INT,
  ID_Part INT,
  PRIMARY KEY(ID_Sales,ID_Part),
  FOREIGN KEY (ID_Sales) REFERENCES Sales(ID_Sales),
  FOREIGN KEY (ID_Part) REFERENCES Parts_Name(ID_Part)
);
/*
INSERT INTO OP (ID_Sales,ID_Part) VALUES (3,5);
INSERT INTO OP (ID_Sales,ID_Part) VALUES (,);
INSERT INTO OP (ID_Sales,ID_Part) VALUES (,);
INSERT INTO OP (ID_Sales,ID_Part) VALUES (,);
*/

/* 
يلي بفتح الكود يبعت على الغروب هي الرسالة لأعرف مين فتح الكود وبلش يشتغل ومين لا هخهخهخهخه :-)
(الرسالة: (أصلاً السنة الثالثة سهلة ورح نرفع كل موادنا
*/

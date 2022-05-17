/* 
لا تنسوا تحطوا كومنتات وأنتو عم تشتغلوا
وتضيفوا كمان أمثلة زيادة
وتحطوا تاسكات لنعمل عليهن سليكتات
*/

/* Weapon detail Section */
CREATE TABLE Weapon_detail( -- معلومات عن الأسلحة 
  ID_WD INT PRIMARY KEY AUTO_INCREMENT,
  W_Name VARCHAR(40) NOT NULL,
  W_Type VARCHAR(40) NOT NULL
);
INSERT INTO Weapon_detail (W_Name,W_Type) VALUES 
                  ('Killing Gas','chemical weapon'), -- 1
                  ('Baseball bat','Improvised weapon'), -- 2
                  ('Knife','Bladed weapon'), -- 3
                  ('Desert Eagle','Pistol'), -- 4
                  ('AK-47','Assault rifle'), -- 5
                  ('M16','Assault rifle'), -- 6
                  ("Mask","Clothes"), -- 7
                  ("Gloves","Clothes"); -- 8

CREATE TABLE Shipment (-- معلومات عن شحنات الأسلحة 
  ID_Shipment INT PRIMARY KEY AUTO_INCREMENT,
  Received_date TIMESTAMP NOT NULL,
  Number_of_item INT (15) NOT NULL,
  Total_Price INT (20) NOT NULL
);
INSERT INTO Shipment (Number_of_item,Total_Price) VALUES 
                           (2,70000), -- 1
                           (2,6050000), -- 2
                           (1,50000), -- 3
                           (1,25000); -- 4

CREATE TABLE Armory ( -- معلومات عن مستودع الأسلحة 
  ID_Item INT PRIMARY KEY AUTO_INCREMENT,
  ID_WD INT NOT NULL,
  ID_Shipment INT NOT NULL,
  Price INT(21)
);
ALTER TABLE Armory
  ADD CONSTRAINT FK_Armory_ID_WD FOREIGN KEY (ID_WD) REFERENCES Weapon_detail(ID_WD) ON DELETE CASCADE,
  ADD CONSTRAINT FK_Armory_ID_Shipment FOREIGN KEY (ID_Shipment) REFERENCES Shipment(ID_Shipment) ON DELETE CASCADE;

INSERT INTO Armory (ID_WD,ID_Shipment,Price) VALUES       
                        (2,1,15000), -- 1 (Baseball bat,1,15000)
                        (3,1,5000), -- 2 (Knife,1,5000)
                        (1,2,50000), -- 3 (Killing Gas,2,50000)
                        (6,2,6000000), -- 4 (M16,2,6000000)
                        (7,3,50000),
                        (8,4,25000);


/* Cars Section */
CREATE TABLE Car_Detail ( -- جدول في معلومات عن السيارات يلي بتمتلكها العصابة
  ID_CD INT PRIMARY KEY AUTO_INCREMENT,
  Model_Name VARCHAR(40) UNIQUE,
  Capacity INT (2),
  Color VARCHAR(10)
);
  INSERT INTO Car_Detail (Model_Name,Capacity,Color) VALUES
                              ('VAN',7,'Gray'), -- 1
                              ('KIA Rio',4,'Red'), -- 2
                              ('BMW',4,'Black'), -- 3
                              ('AUDI',4,'Blue'), -- 4
                              ('Range Rover',5,'White'), -- 5
                              ("DODGE",4,"orange"), -- 6
                              ("HYUNDAI",4,"Black"), -- 7
                              ("CHANA",6,"White"); -- 8

CREATE TABLE License_Plate ( -- جدول فيه كل لوحات السيارة عند العصابة
  ID_LP INT PRIMARY KEY AUTO_INCREMENT,
  License_Number VARCHAR(40) UNIQUE,
  times_of_use INT (2) DEFAULT 0 -- لازم نحط تنبيه بس يوصل لعدد معين
);
  INSERT INTO License_Plate (License_Number) VALUES
                              ('ZX25062'), -- 1
                              ('KGR0168'), -- 2
                              ('9364TW'), -- 3
                              ('AB41048'), -- 4
                              ('JJJ961'), -- 5
                              ('SC19476'), -- 6
                              ("QSTF55"), -- 7
                              ("IM5IV9"), -- 8
                              ("77OJCZ"), -- 9
                              ("P05RT7"); -- 10

CREATE TABLE Car_License ( -- جدول فيه كل سيارة استخدمت مع اللوحة المخصصة
  ID_CL INT PRIMARY KEY AUTO_INCREMENT,
  ID_CD INT,
  ID_LP INT
);
ALTER TABLE Car_License
  ADD CONSTRAINT FK_Car_License_ID_CD FOREIGN KEY (ID_CD) REFERENCES Car_Detail(ID_CD) ON DELETE CASCADE,
  ADD CONSTRAINT FK_Car_License_ID_LP FOREIGN KEY (ID_LP) REFERENCES License_Plate(ID_LP) ON DELETE CASCADE;
/*
CREATE TRIGGER AddOneTo_TOU
  AFTER INSERT ON Car_License FOR EACH ROW
  UPDATE License_Plate SET times_of_use = (times_of_use) + 1
  WHERE 
*/

INSERT INTO Car_License (ID_CD,ID_LP) VALUES
                            (1,5), -- 1 (VAN,JJJ961)
                            (2,4), -- 2 (KIA Rio,AB41048)
                            (3,3), -- 3 (BMW,9364TW)
                            (4,2), -- 4 (AUDI,KGR0168)
                            (5,3), -- 5 (Range Rover,9364TW)
                            (8,1), -- 6
                            (8,6), -- 7
                            (6,6), -- 8
                            (7,8), -- 9
                            (8,10); -- 10 

/* Gang_Member Section */
-- جميع أعضاء العصابة وصفة كل واحد فين ومين رئيس كل عضو سواء كان العضو رئيس الكل او مجموعة جزئية
CREATE TABLE Gang_Member (
  ID_GM INT PRIMARY KEY AUTO_INCREMENT,
  GM_name VARCHAR(40) UNIQUE,
  Job VARCHAR(40) NOT NULL,
  Leader INT 
);
ALTER TABLE Gang_Member
  ADD CONSTRAINT FK_Gang_Member_Leader FOREIGN KEY (Leader) REFERENCES Gang_Member(ID_GM) ON DELETE CASCADE;

INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES 
                      ('Homoom','Leader' ,NULL), -- 1
                      ('Denver','Sub_Leader',1),  -- 2
                      ('Rio','Bomber',2), -- 3
                      ('Berlin','Killer',2), -- 4
                      ('Nairobi','Sub_Leader',1), -- 5
                      ('Moscow','Bomber',5), -- 6
                      ('Helsinki','Killer',5), -- 7
                      ('Tokyo','Sub_Leader',1), -- 8
                      ('Beirut','Leader',8), -- 9
                      ('Madrid','Leader',8), -- 10
                      ('Robert','Sub_Leader',1), -- 11
                      ('Rodrygo','Killer',11), -- 12
                      ('William','Bomber',11), -- 13
                      ('Gabriel','Bomber',11); -- 14
                      
--  اسماء الفرق الجزئية (جدول ربط)
CREATE TABLE Sub_Group (
  ID_SG INT PRIMARY KEY AUTO_INCREMENT,
  SG_Name VARCHAR(40)
);
INSERT INTO Sub_Group (SG_Name) VALUES 
                      ('Alpha'), -- 1
                      ('Beta'), -- 2
                      ('Gamma'), -- 3
                      ('Delta'), -- 4
                      ('Alpha'); -- 5


-- كل فريق جزئي ومين معه من الأعضاء ورقم سلاح العضو من مستودع الأسلحة
CREATE TABLE GS (
  ID_GS INT PRIMARY KEY AUTO_INCREMENT,
  ID_GM INT NOT NULL, 
  ID_SG INT NOT NULL,
  ID_Item INT -- ممكن يكون فاضي (نل) بحال العضو ما كان شايل سلاح
);
ALTER TABLE GS
  ADD CONSTRAINT FK_GS_ID_GM FOREIGN KEY (ID_GM) REFERENCES Gang_Member(ID_GM) ON DELETE CASCADE,
  ADD CONSTRAINT FK_GS_ID_SG FOREIGN KEY (ID_SG) REFERENCES Sub_Group(ID_SG) ON DELETE CASCADE,
  ADD CONSTRAINT FK_GS_ID_Item FOREIGN KEY (ID_Item) REFERENCES Armory(ID_Item) ON DELETE CASCADE;

INSERT INTO GS (ID_GM,ID_SG,ID_Item) VALUES 
                      (2,2,3), -- 1 (Denver,Beta,Killing Gas) 
                      (3,2,1), -- 2 (Rio,Beta,Baseball bat) 
                      (4,2,NULL), -- 3 (Berlin,Beta,NULL) 
                      (5,4,4), -- 4 (Nairobi,Delta,M16) 
                      (6,4,2), -- 5 (Moscow,Delta,Knife) 
                      (7,4,NULL); -- 6 (Helsinki,Delta,NULL) 


/* Territory Section */
CREATE TABLE Territory ( -- جدول المناطق
  ID_Territory INT PRIMARY KEY AUTO_INCREMENT,
  Territory_Name VARCHAR(40) UNIQUE,
  Territory_Type VARCHAR(1) NOT NULL -- طبيعة المنطقة إذا كانت مخصصة للخطف أو للدفن
);
INSERT INTO Territory (Territory_Name,Territory_Type) VALUES 
                      ('Salah Al_Din','K'), -- 1 صلاح الدين للخطف
                      ('City Center','K'), -- 2 مركز المدينة للخطف
                      ('Al-Hamadaniha','K'), -- 3 الحمدانية للخطف
                      ('Old Aleppo','K'), -- 4 حلب القديمة للخطف
                      ('New Aleppo','K'), -- 5 حلب الجديدة للخطف
                      ('Kafr Hamra','G'), -- 6 كفر حمرا للدفن
                      ('Khan Al-asal','G'); -- 7 خان العسل للدفن


/* Graveyard Section */
CREATE TABLE Graveyard (
  ID_Graveyard INT PRIMARY KEY AUTO_INCREMENT,
  Graveyard_Name VARCHAR(40) NOT NULL,
  ID_Territory INT NOT NULL,
  Quantity INT (2) DEFAULT 0, -- ضروري لازم نعمل كاونتر لكل مقبرة لحالها متل ما شرح بالمحاضرة الماضية
  Capacity INT (2) 
);
ALTER TABLE Graveyard
  ADD CONSTRAINT FK_Graveyard_ID_Territory FOREIGN KEY (ID_Territory) REFERENCES Territory(ID_Territory) ON DELETE CASCADE;

INSERT INTO Graveyard (Graveyard_Name,ID_Territory,Capacity) VALUES 
                            ('G1_Kafr Hamra',6,10), -- 1
                            ('G2_Kafr Hamra',6,4), -- 2
                            ('G1_Khan Al-asal',7,15); -- 3


CREATE TABLE Sub_Graveyard (
  ID_Sub_Graveyard INT PRIMARY KEY AUTO_INCREMENT,
  ID_Graveyard INT NOT NULL,
  Grave_Number INT(5) NOT NULL
);
ALTER TABLE Sub_Graveyard
  ADD CONSTRAINT FK_Sub_Graveyard_ID_Graveyard FOREIGN KEY (ID_Graveyard) REFERENCES Graveyard(ID_Graveyard) ON DELETE CASCADE;

-- هون بدنا تريغر
INSERT INTO Sub_Graveyard (ID_Graveyard,Grave_Number) VALUES 
                                      (1,1), -- 1
                                      (1,2), -- 2
                                      (2,1), -- 3
                                      (1,3); -- 4

                              
/* Doctor Section */
CREATE TABLE Doctor (
  ID_Doctor INT PRIMARY KEY AUTO_INCREMENT,
  Doctor_Name VARCHAR(22),
  Doctor_SP VARCHAR(22)
);
/*
INSERT INTO Doctor (Doctor_Name,Doctor_SP) VALUES 
                            (,), -- 1
                            (,), -- 2
                            (,), -- 3
                            (,), -- 4
                            (,), -- 5
                            (,); -- 6
*/

/* Victim Section */
CREATE TABLE Victim ( -- جدول الضحايا 
  ID_Victim INT PRIMARY KEY AUTO_INCREMENT,
  Age INT NOT NULL,
  Blood_Type VARCHAR(3),
  ID_Sub_Graveyard INT, -- عادي لسا يكون ما اندفن
  ID_Doctor_1 INT,
  ID_Doctor_2 INT,
  Date_Of_Murder TIMESTAMP NOT NULL
);
ALTER TABLE Victim
  ADD CONSTRAINT FK_Victim_ID_Sub_Graveyard FOREIGN KEY (ID_Sub_Graveyard) REFERENCES Sub_Graveyard(ID_Sub_Graveyard) ON DELETE CASCADE,
  ADD CONSTRAINT FK_Victim_ID_Doctor_1 FOREIGN KEY (ID_Doctor_1) REFERENCES Doctor(ID_Doctor) ON DELETE CASCADE,
  ADD CONSTRAINT FK_Victim_ID_Doctor_2 FOREIGN KEY (ID_Doctor_2) REFERENCES Doctor(ID_Doctor) ON DELETE CASCADE;

INSERT INTO Victim (Age,Blood_Type,ID_Sub_Graveyard) VALUES 
                          (30,'AB+',1), -- 1
                          (45,'O-',2), -- 2
                          (18,'A+',3), -- 3
                          (50,'B-',4), -- 4
                          (18,'B+',NULL), -- 5
                          (20,'O+',NULL); -- 6


/* GS Section */
CREATE TABLE VGS ( -- هذا الجدول فيه كل عصابة ومين خطفت
  ID_VGS INT PRIMARY KEY AUTO_INCREMENT,
  ID_GS INT,
  ID_Victim INT,
  ID_CL INT NOT NULL, -- أكيد مافين العصابة يخطفوا حدا بدون سيارة
  ID_Territory INT NOT NULL
);
ALTER TABLE VGS
  ADD CONSTRAINT FK_VGS_ID_GS FOREIGN KEY (ID_GS) REFERENCES GS(ID_GS) ON DELETE CASCADE,
  ADD CONSTRAINT FK_VGS_ID_Victim FOREIGN KEY (ID_Victim) REFERENCES Victim(ID_Victim) ON DELETE CASCADE,
  ADD CONSTRAINT FK_VGS_ID_Territory FOREIGN KEY (ID_Territory) REFERENCES Territory(ID_Territory) ON DELETE CASCADE,
  ADD CONSTRAINT FK_VGS_ID_CL FOREIGN KEY (ID_CL) REFERENCES Car_License(ID_CL) ON DELETE CASCADE;

INSERT INTO VGS (ID_GS,ID_Victim,ID_CL,ID_Territory) VALUES 
  (2,1,1,4), -- ريو من العصابة بيتا خطف الضحية رقم 1
  (3,3,2,5), -- برلين من العصابة بيتا خطف الضحية رقم 2
  (6,2,3,1); -- هلسينكي من العصابة دلتا خطف الضحية 3


/* Parts_Name Section */
CREATE TABLE Part_Name (
  ID_Part INT PRIMARY KEY AUTO_INCREMENT,
  Part_Name VARCHAR(40) UNIQUE,
  Available VARCHAR(1)
);
-- هون بدنا تريغر
INSERT INTO Part_Name (Part_Name,Available) VALUES 
                          ('Kidney','Y'), -- 1
                          ('Liver','Y'), -- 2
                          ('Heart','N'), -- 3
                          ('Arm','N'), -- 4
                          ('Skin','N'), -- 5
                          ('Eye','N'); -- 6


/* Customers Section */
CREATE TABLE Customer (
  ID_Customer INT PRIMARY KEY AUTO_INCREMENT,
  Customer_Name VARCHAR(40),
  Age INT NOT NULL,
  Blood_Type VARCHAR(3),
  Wanted_Part VARCHAR(40)
);
INSERT INTO Customer (Customer_Name,Age,Blood_Type,Wanted_Part) VALUES 
                            ('IronMan',40,'A+','Face'), -- 1
                            ('Thor',99,'AB+','Eye'), -- 2
                            ('Thanos',80,'O-','Heart'), -- 3
                            ('Deadpool',25,'B+','Skin'), -- 4
                            ('Fury',45,'A-','Eye'), -- 5
                            ('Bucky',32,'O+','Arm'); -- 6


/* Sale Section */
CREATE TABLE Sale (
  ID_Sale INT PRIMARY KEY AUTO_INCREMENT,
  ID_Customer INT NOT NULL,
  Price INT NOT NULL
);
ALTER TABLE Sale
  ADD CONSTRAINT FK_Sale_ID_Customer FOREIGN KEY (ID_Customer) REFERENCES Customer(ID_Customer) ON DELETE CASCADE;

INSERT INTO Sale (ID_Customer,Price) VALUES 
                            (3,10000), -- 1
                            (4,12000), -- 2
                            (2,3500), -- 3
                            (6,5800); -- 4


/* P_V Section */
CREATE TABLE P_V (
  ID_PV INT PRIMARY KEY AUTO_INCREMENT,
  ID_Part INT,
  ID_Victim INT,
  ID_Sale INT
);

ALTER TABLE P_V
 ADD CONSTRAINT FK_P_V_ID_Part FOREIGN KEY (ID_Part) REFERENCES Part_Name(ID_Part) ON DELETE CASCADE,
 ADD CONSTRAINT FK_P_V_ID_Victim FOREIGN KEY (ID_Victim) REFERENCES Victim(ID_Victim) ON DELETE CASCADE,
 ADD CONSTRAINT FK_P_V_ID_Sale FOREIGN KEY (ID_Sale) REFERENCES Sale(ID_Sale) ON DELETE CASCADE;

-- هون بدنا تريغر
INSERT INTO P_V (ID_Part,ID_Victim,ID_Sale) VALUES 
                        (3,2,1), -- 1
                        (5,5,2), -- 2
                        (6,1,3), -- 3
                        (4,6,4); -- 4




/* TO DO LIST
  Check on rules and relationships
  TRIGGERS
  Alert
*/
 
-- use "FK_"(child table)_(parent table)" to name the constraints and are quite happy with this naming convention.




/*
انسيرتات عبودة للتدقيق

INSERT into gang_member (GM_name,Job,Leader) VALUES
                          ('Tokyo','Sub_Leader',1), -- 8
                          ('Beirut','Leader',8), -- 9
                          ('Madrid','Leader',8), -- 10
                          ('Robert','Sub_Leader',1), -- 11
                          ('Rodrygo','Killer',11), -- 12
                          ('William','Bomber',11), -- 13
                          ('Gabriel','Bomber',11); -- 14

INSERT into license_plate (License_Number) VALUES
                          ("QSTF55"), -- 7
                          ("IM5IV9"), -- 8
                          ("77OJCZ"), -- 9
                          ("P05RT7"); -- 10

INSERT into car_detail (Model_Name,Capacity,Color) VALUES
                        ("DODGE",4,"orange"), -- 6
                        ("HYUNDAI",4,"Black"), -- 7
                        ("CHANA",6,"White"); -- 8

INSERT into car_license (ID_CD,ID_LP) VALUES
                          (8,1),
                          (8,6),
                          (6,6),
                          (7,8),
                          (8,10);

INSERT into shipment (Number_of_item,Total_Price) VALUES
                          (1,50000), -- 3
                          (1,25000); -- 4

INSERT into weapon_detail (W_Name,W_Type) VALUES
                          ("Mask","Clothes"), -- 7
                          ("Gloves","Clothes"); -- 8

INSERT into armory (ID_WD,ID_Shipment,price) VALUES
                          (7,3,50000),
                          (8,4,25000);

                
*/
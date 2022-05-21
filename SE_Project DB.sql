/* 
لا تنسوا تحطوا كومنتات وأنتو عم تشتغلوا
وتضيفوا كمان أمثلة زيادة
وتحطوا تاسكات لنعمل عليهن سليكتات
*/

SET FOREIGN_KEY_CHECKS=0; -- to disable them
DROP TABLE IF EXISTS armory, car_detail, car_license, customer, doctor, gang_member, graveyard, gs, license_plate, part_name, p_v, sale, shipment, sub_graveyard, sub_group, territory, vgs, victim, weapon_detail;
SET FOREIGN_KEY_CHECKS=1; -- to re-enable them

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
                           (5,60000); -- 4

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
                        (7,3,50000), -- 5
                        (2,4,25000), -- 6
                        (4,4,25000), -- 7
                        (5,4,5000), -- 8
                        (5,4,2500), -- 9
                        (2,4,2500); -- 10

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

-- trigger for time of use
DELIMITER $$
CREATE trigger aft_upd_license4 after INSERT on car_license  for each row
BEGIN
declare w int;
set w= new.ID_LP;
UPDATE license_plate set times_of_use=(times_of_use+1) where license_plate.ID_LP=w ;
END$$
DELIMITER ;

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
                      ('Berlin','Killer',2), -- 3
                      ('Nairobi','Doctor',2), -- 4
                      ('Rio','Driver',2), -- 5

                      ('Tokyo','Sub_Leader',1), -- 6
                      ('Helsinki','Killer',6), -- 7
                      ('Moscow','Doctor',6), -- 8
                      ('Beirut','Driver',6), -- 9

                      ('Madrid','Sub_Leader',1), -- 10
                      ('Rodrygo','Killer',10), -- 11
                      ('William','Doctor',10), -- 12
                      ('Paris','Driver',10), -- 13

                      ('Robert','Sub_Leader',1), -- 14
                      ('Benzema','Killer',14), -- 15
                      ('Gabriel','Doctor',14), -- 16
                      ('Stockholm','Driver',14); -- 17

--  اسماء الفرق الجزئية (جدول ربط)
CREATE TABLE Sub_Group (
  ID_SG INT PRIMARY KEY AUTO_INCREMENT,
  SG_Name VARCHAR(40)
);
INSERT INTO Sub_Group (SG_Name) VALUES 
                      ('Alpha'), -- 1
                      ('Beta'), -- 2
                      ('Gamma'), -- 3
                      ('Delta'); -- 4


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
                      (2,2,1), -- 1 
                      (3,2,2), -- 2 
                      (4,2,3), -- 3 
                      (5,2,NULL), -- 4 

                      (6,3,4), -- 5 
                      (7,3,5), -- 6
                      (8,3,6), -- 7 
                      (9,3,NULL), -- 8

                      (10,4,7), -- 9
                      (11,4,8), -- 10
                      (12,4,9), -- 11 
                      (13,4,NULL); -- 12

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
                      ('Al-Forkan','K'), -- 6 الفرقان للخطف
                      ('Bestan Al-Kaser','K'), -- 7 بستان القصر للخطف
                      ('Al-Ramousa','G'), -- 8 الراموسة للخطف
                      ('Kafr Hamra','G'), -- 9 كفر حمرا للدفن
                      ('Khan Al-asal','G'), -- 10 خان العسل للدفن
                      ('Tal Al-Zarazir','G'); -- 11 تل الزرازير للدفن

/* Graveyard Section */
CREATE TABLE Graveyard (
  ID_Graveyard INT PRIMARY KEY AUTO_INCREMENT,
  Graveyard_Name VARCHAR(40) NOT NULL,
  ID_Territory INT NOT NULL,
  Capacity INT (2) 
);
ALTER TABLE Graveyard
  ADD CONSTRAINT FK_Graveyard_ID_Territory FOREIGN KEY (ID_Territory) REFERENCES Territory(ID_Territory) ON DELETE CASCADE;

INSERT INTO Graveyard (Graveyard_Name,ID_Territory,Capacity) VALUES 
                            ('G1_Al-Ramousa',8,4), -- 1
                            ('G1_Kafr Hamra',9,10), -- 2
                            ('G2_Kafr Hamra',9,6), -- 3
                            ('G1_Khan Al-asal',10,15), -- 4
                            ('G1_Tal Al-Zarazir',11,10), -- 5
                            ('G2_Tal Al-Zarazir',11,20); -- 6



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
                                      (2,2), -- 4
                                      (3,1), -- 5
                                      (3,2), -- 6
                                      (4,1), -- 7
                                      (4,2), -- 8
                                      (5,1); -- 9

/* Parts_Name Section */
CREATE TABLE Part_Name (
  ID_Part INT PRIMARY KEY AUTO_INCREMENT,
  Part_Name VARCHAR(40) UNIQUE,
  Quantity INT (5)
);

-- هون بدنا تريغر لما بصفر كمية العضو معناها بصير لازم نجيب من هل عضو
INSERT INTO Part_Name (Part_Name,Quantity) VALUES 
                          ('Kidney',0), -- 1
                          ('Liver',0), -- 2
                          ('Heart',0), -- 3
                          ('Arm',0), -- 4
                          ('Skin',0), -- 5
                          ('Eye',0); -- 6
                     
/* Victim Section */
CREATE TABLE Victim ( -- جدول الضحايا 
  ID_Victim INT PRIMARY KEY AUTO_INCREMENT,
  Age INT NOT NULL,
  Blood_Type VARCHAR(3),
  ID_Sub_Graveyard INT, -- عادي لسا يكون ما اندفن
  ID_Doctor_1 INT NOT NULL,
  ID_Doctor_2 INT NOT NULL,
  ID_Territory INT NOT NULL,
  Date_Of_Murder TIMESTAMP NOT NULL
);
ALTER TABLE Victim
  ADD CONSTRAINT FK_Victim_ID_Sub_Graveyard FOREIGN KEY (ID_Sub_Graveyard) REFERENCES Sub_Graveyard(ID_Sub_Graveyard) ON DELETE CASCADE,
  ADD CONSTRAINT FK_Victim_Territory FOREIGN KEY (ID_Territory) REFERENCES Territory(ID_Territory) ON DELETE CASCADE,
  ADD CONSTRAINT FK_Victim_ID_Doctor_1 FOREIGN KEY (ID_Doctor_1) REFERENCES Gang_Member(ID_GM) ON DELETE CASCADE,
  ADD CONSTRAINT FK_Victim_ID_Doctor_2 FOREIGN KEY (ID_Doctor_2) REFERENCES Gang_Member(ID_GM) ON DELETE CASCADE;

-- تريغر لإضافة أعضاء جديدة عند كل ضحية بتنزل جديد
DELIMITER $$
CREATE trigger aft_upd_Vic after INSERT on Victim for each row
BEGIN
UPDATE Part_Name set Quantity=(Quantity+2) where Part_Name.Part_Name = 'Kidney' OR Part_Name.Part_Name = 'Eye' OR Part_Name.Part_Name = 'Arm';
UPDATE Part_Name set Quantity=(Quantity+1) where Part_Name.Part_Name = 'Liver' OR Part_Name.Part_Name = 'Heart' OR Part_Name.Part_Name = 'Skin';
END$$
DELIMITER ;

INSERT INTO Victim (Age,Blood_Type,ID_Sub_Graveyard,ID_Doctor_1,ID_Doctor_2,ID_Territory) VALUES 
                          (30,'AB+',1,12,4,5), -- 1
                          (45,'O-',2,12,8,2), -- 2
                          (18,'A+',3,4,8,3), -- 3
                          (50,'B-',4,4,16,3), -- 4
                          (18,'B+',5,8,16,4), -- 5
                          (20,'A+',6,12,16,6), -- 6
                          (21,'A+',7,4,16,6), -- 7
                          (24,'AB-',8,8,16,1), -- 8
                          (44,'O+',9,16,4,3); -- 9

/* GS Section */
CREATE TABLE VGS ( -- هذا الجدول فيه كل عصابة ومين خطفت
  ID_VGS INT PRIMARY KEY AUTO_INCREMENT,
  ID_GS INT,
  ID_Victim INT,
  ID_CL INT NOT NULL -- أكيد مافين العصابة يخطفوا حدا بدون سيارة
);
ALTER TABLE VGS
  ADD CONSTRAINT FK_VGS_ID_GS FOREIGN KEY (ID_GS) REFERENCES GS(ID_GS) ON DELETE CASCADE,
  ADD CONSTRAINT FK_VGS_ID_Victim FOREIGN KEY (ID_Victim) REFERENCES Victim(ID_Victim) ON DELETE CASCADE,
  ADD CONSTRAINT FK_VGS_ID_CL FOREIGN KEY (ID_CL) REFERENCES Car_License(ID_CL) ON DELETE CASCADE;

INSERT INTO VGS (ID_GS,ID_Victim,ID_CL) VALUES 
  (1,1,1), -- 1
  (1,2,2), -- 2
  (2,3,3), -- 3
  (5,4,4), -- 4
  (6,5,5), -- 5
  (6,6,6), -- 6
  (7,7,7), -- 7
  (10,8,8), -- 8
  (1,9,9); -- 9

/* Customers Section */
CREATE TABLE Customer (
  ID_Customer INT PRIMARY KEY AUTO_INCREMENT,
  Customer_Name VARCHAR(40),
  Age INT NOT NULL,
  Blood_Type VARCHAR(3)
);
INSERT INTO Customer (Customer_Name,Age,Blood_Type) VALUES 
                            ('IronMan',40,'A+'), -- 1
                            ('Thor',99,'AB+'), -- 2
                            ('Thanos',80,'O-'), -- 3
                            ('Deadpool',25,'B+'), -- 4
                            ('Fury',45,'A-'), -- 5
                            ('Bucky',32,'O+'); -- 6

/* Sale Section */
CREATE TABLE Sale (
  ID_Sale INT PRIMARY KEY AUTO_INCREMENT,
  ID_Customer INT NOT NULL,
  Price INT NOT NULL
);
ALTER TABLE Sale
  ADD CONSTRAINT FK_Sale_ID_Customer FOREIGN KEY (ID_Customer) REFERENCES Customer(ID_Customer) ON DELETE CASCADE;

INSERT INTO Sale (ID_Customer,Price) VALUES 
                            (3,5000000), -- 1
                            (4,2000000), -- 2
                            (2,500000), -- 3
                            (6,100000); -- 4


/* P_V Section */
CREATE TABLE P_V (
  ID_PV INT PRIMARY KEY AUTO_INCREMENT,
  ID_Part INT NOT NULL,
  ID_Victim INT NOT NULL,
  ID_Sale INT
);

ALTER TABLE P_V
 ADD CONSTRAINT FK_P_V_ID_Part FOREIGN KEY (ID_Part) REFERENCES Part_Name(ID_Part) ON DELETE CASCADE,
 ADD CONSTRAINT FK_P_V_ID_Victim FOREIGN KEY (ID_Victim) REFERENCES Victim(ID_Victim) ON DELETE CASCADE,
 ADD CONSTRAINT FK_P_V_ID_Sale FOREIGN KEY (ID_Sale) REFERENCES Sale(ID_Sale) ON DELETE CASCADE;

DELIMITER $$
CREATE trigger aft_upd_PV after INSERT on P_V  for each row
BEGIN
declare a int;
set a = new.ID_Part;
UPDATE Part_Name set Quantity=(Quantity-1) where Part_Name.ID_Part=a ;
END$$
DELIMITER ;

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


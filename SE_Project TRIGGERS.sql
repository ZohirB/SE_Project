-- تريغر لزياد عدد مرات الاستخدام للوحات السيارة
DELIMITER $$
CREATE trigger aft_upd_license4 after INSERT on car_license  for each row
BEGIN
declare w int;
set w= new.ID_LP;
UPDATE license_plate set times_of_use=(times_of_use+1) where license_plate.ID_LP=w ;
END$$
DELIMITER ;


-- تريغر لتبديل حالة العضو عند البيع
DELIMITER $$
CREATE trigger aft_upd_PV after INSERT on P_V  for each row
BEGIN
declare a int;
set a = new.ID_Part;
UPDATE Part_Name set Quantity=(Quantity-1) where Part_Name.ID_Part=a ;
END$$
DELIMITER ;

-- تريغر لإضافة أعضاء جديدة عند كل ضحية بتنزل جديد
DELIMITER $$
CREATE trigger aft_upd_Vic after INSERT on Victim for each row
BEGIN
UPDATE Part_Name set Quantity=(Quantity+2) where Part_Name.Part_Name = 'Kidney' OR Part_Name.Part_Name = 'Eye' OR Part_Name.Part_Name = 'Arm';
UPDATE Part_Name set Quantity=(Quantity+1) where Part_Name.Part_Name = 'Liver' OR Part_Name.Part_Name = 'Heart' OR Part_Name.Part_Name = 'Skin';
END$$
DELIMITER ;


/*
-- لينزل سجلات على جدول p_v
DELIMITER $$
CREATE trigger aft_upd_Vic_pv after INSERT on Victim for each row
  BEGIN
    DECLARE V_id int;
    set v_id = MAX(victim.ID_Victim);
    INSERT INTO P_V (ID_Part,ID_Victim) VALUES (1,v_id), (2,v_id), (3,v_id), (4,v_id), (5,v_id), (6,v_id);
  END$$
DELIMITER ;
*/


-- تريغر لمناطق الدفن والخطف
DELIMITER $$
CREATE TRIGGER bef_ins_ter BEFORE INSERT ON territory
 FOR EACH ROW BEGIN
  IF NEW.territory.name  like territory.territory_name and new.territory_type <> territory.territory_type
    THEN
      SET NEW.id_territory=100235 ;
  END IF ;
END$$
DELIMITER ;

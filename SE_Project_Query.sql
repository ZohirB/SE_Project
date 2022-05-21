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

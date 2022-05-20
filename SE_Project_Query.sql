--تريغر لمناطق الدفن والخطف
DELIMITER $$
CREATE TRIGGER bef_ins_ter BEFORE INSERT ON territory
 FOR EACH ROW BEGIN
  IF NEW.territory.name  like territory.territory_name and new.territory_type <> territory.territory_type
    THEN
      SET NEW.id_territory=100235 ;
  END IF ;
END$$
DELIMITER ;

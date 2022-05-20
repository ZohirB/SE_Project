--تريغر لمناطق الدفن والخطف
/*DELIMITER $$
CREATE TRIGGER `updateProductPrice`
BEFORE UPDATE ON `territory`
FOR EACH ROW
BEGIN
  IF NEW.territory.name  like OLD.territory_name
    THEN
      SET NEW.id_territory=100235 ;
  END IF ;
END$$
DELIMITER ;*/


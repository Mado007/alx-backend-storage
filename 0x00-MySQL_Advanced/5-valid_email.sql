-- Creates a trigger that resets the attribute valid_email
-- only when the email has been changed.

-- change the delimiter temporarily
-- in order not to conflict with
-- the semicolons used within the trigger definition itself.
DELIMITER //

CREATE TRIGGER reset_valid_email 
BEFORE UPDATE ON users 
FOR EACH ROW 
BEGIN 
	IF NEW.email != OLD.email THEN 
		SET NEW.valid_email = 0; 
	END IF; 
END//

DELIMITER ;


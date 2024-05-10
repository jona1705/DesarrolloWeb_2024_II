CREATE DATABASE TEST;

USE TEST;

DELIMITER //
CREATE TRIGGER registro_insercion
AFTER INSERT ON ordenes
FOR EACH ROW
BEGIN
	INSERT INTO bitacora (operacion, id_registro, fecha_operacion, usuario)
    VALUES ('Insercion', NEW.id, NOW(), USER());
END // 
DELIMITER ;

DELIMITER //
CREATE TRIGGER registro_borrado
AFTER DELETE ON ordenes
FOR EACH ROW
BEGIN
	INSERT INTO bitacora (operacion, id_registro, fecha_operacion, usuario)
    VALUES ('Borrado', OLD.id, NOW(), USER());
END // 
DELIMITER ;

DELIMITER //
CREATE TRIGGER registro_actualizado
AFTER UPDATE ON ordenes
FOR EACH ROW
BEGIN
	INSERT INTO bitacora (operacion, id_registro, fecha_operacion, usuario)
    VALUES ('Actualizado', NEW.id, NOW(), USER());
END // 
DELIMITER ;

INSERT INTO ordenes(cliente, monto) VALUES('Juan', 12.50);

SELECT * FROM bitacora;
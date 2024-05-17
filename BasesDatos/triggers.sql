CREATE DATABASE TEST;

USE TEST;

CREATE TABLE ordenes(
	id INT PRIMARY KEY auto_increment, 
    cliente VARCHAR(100),
    monto DECIMAL(10,2)
);

CREATE TABLE bitacora(
	id INT PRIMARY KEY auto_increment, 
    operacion VARCHAR(100),
    id_registro int,
    fecha_operacion TIMESTAMP,
    usuario VARCHAR(45)
);

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
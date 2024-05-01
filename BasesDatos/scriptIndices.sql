CREATE DATABASE pruebas;

USE pruebas;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(20)
);

INSERT INTO clientes(nombre, apellido, email, telefono) 
VALUES ('Pedro', 'Hernandez', 'pedro@gmail.com', 5512345678),
('Lucas', 'Torres', 'lucas@hotmail.com', 5587371231),
('Jorge', 'Sanchez', 'jorgito@outlook.com', 5557382930),
('Antonio', 'Lopez', 'antonio@hotmail.com', 5598765432),
('Juana', 'Arcos', 'juanita@outlook.com', 5565843920);

CREATE TABLE clientes_idx (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(20),
    INDEX idx_nombre (nombre),
    INDEX idx_apellido (apellido)
);

INSERT INTO clientes_idx(nombre, apellido, email, telefono) 
VALUES ('Pedro', 'Hernandez', 'pedro@gmail.com', 5512345678),
('Lucas', 'Torres', 'lucas@hotmail.com', 5587371231),
('Jorge', 'Sanchez', 'jorgito@outlook.com', 5557382930),
('Antonio', 'Lopez', 'antonio@hotmail.com', 5598765432),
('Juana', 'Arcos', 'juanita@outlook.com', 5565843920);

-- Ejecutando tabla sin indices
SELECT * FROM clientes WHERE nombre = 'Jorge';

-- Ejecutando tabla con indices
SELECT * FROM clientes_idx WHERE nombre = 'Jorge';

-- Ejecutando tabla sin indices nombre LIKE 'J' OR apellido LIKE 'H'
SELECT * FROM clientes WHERE nombre LIKE 'J%' OR apellido LIKE 'H%';

-- Ejecutando tabla con indices
SELECT * FROM clientes_idx WHERE nombre LIKE 'J%' OR apellido LIKE 'H%';

SELECT * FROM performance_schema.events_statements_summary_by_digest;

set profiling=1;

show profiles;

set profiling=0;

INSERT INTO clientes_idx(nombre, apellido, email, telefono) 
VALUES ('Jorge', 'Torres', 'jorget@hotmail.com', 5595839453),
('Andrea', 'Lujan', 'andy@gmail.com', 5559438412),
('Hector', 'Parra', 'parrah@outlook.com', 5555949214),
('Juan', 'Perez', 'juanpe@gmail.com', 5549582312),
('Oscar', 'Medina', 'omedina@outlook.com', 5545934859);

set profiling=1;

show profiles;

-- Ejecutando tabla sin indices
SELECT * FROM clientes WHERE nombre = 'Jorge';

-- Ejecutando tabla con indices
SELECT * FROM clientes_idx WHERE nombre = 'Jorge';

-- Ejecutando tabla sin indices nombre LIKE 'J' OR apellido LIKE 'H'
SELECT * FROM clientes WHERE nombre LIKE 'J%' OR apellido LIKE 'H%';

-- Ejecutando tabla con indices
SELECT * FROM clientes_idx WHERE nombre LIKE 'J%' OR apellido LIKE 'H%';

show profiles;

set profiling=0;

-- Crear la tabla si no existe
CREATE TABLE IF NOT EXISTS tabla_ejemplo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    campo_1 VARCHAR(255),
    campo_2 INT,
    campo_3 FLOAT
);

-- Crear la tabla si no existe
CREATE TABLE IF NOT EXISTS tabla_ejemplo_idx (
    id INT AUTO_INCREMENT PRIMARY KEY,
    campo_1 VARCHAR(255),
    campo_2 INT,
    campo_3 FLOAT,
    INDEX idx_c1 (campo_1)
);

-- Generar 10,000 registros aleatorios
DELIMITER $$
CREATE PROCEDURE generar_registros_aleatorios()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10000 DO
        INSERT INTO tabla_ejemplo_idx (campo_1, campo_2, campo_3)
        VALUES (
            CONCAT('Dato', FLOOR(1 + RAND() * 1000)), -- Generar un dato aleatorio para campo_1
            FLOOR(1 + RAND() * 100), -- Generar un número entero aleatorio para campo_2
            RAND() * 1000 -- Generar un número flotante aleatorio para campo_3
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

-- Ejecutar el procedimiento almacenado para generar los registros
CALL generar_registros_aleatorios();

SELECT * FROM tabla_ejemplo where campo_1 = 'Dato500';

SELECT * FROM tabla_ejemplo_idx where campo_1 = 'Dato500';

-- Generar 10,000 registros aleatorios
DELIMITER $$
CREATE PROCEDURE generar_registros_aleatorios_idx()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10000 DO
        INSERT INTO tabla_ejemplo_idx (campo_1, campo_2, campo_3)
        VALUES (
            CONCAT('Dato', FLOOR(1 + RAND() * 1000)), -- Generar un dato aleatorio para campo_1
            FLOOR(1 + RAND() * 100), -- Generar un número entero aleatorio para campo_2
            RAND() * 1000 -- Generar un número flotante aleatorio para campo_3
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

-- Ejecutar el procedimiento almacenado para generar los registros
CALL generar_registros_aleatorios_idx();

SELECT COUNT(*) FROM tabla_ejemplo_idx;
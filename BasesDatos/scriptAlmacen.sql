CREATE DATABASE almacen;

USE almacen;

CREATE TABLE productos(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
precio DECIMAL(10, 2),
cantidad INT
);

INSERT INTO productos(nombre, precio, cantidad)
VALUES ('Camiseta', 20.00, 100), 
('Traje de baño', 20.00, 60),
('Pantalón', 35.00, 75),
('Zapatos', 50.00, 50),
('Bufanda', 15.00, 200);

CREATE TABLE clientes (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
email VARCHAR(100)
);

INSERT INTO clientes(nombre, email)
VALUES ('Juan Perez', 'juan@gmail.com'), 
('Maria García', 'maria@outlook.com'),
('Jorge Sanchez', 'jorgito@hotmail.com'),
('Carlos Rodriguez', 'carlos@gmail.com'),
('Hector Gomez', 'hector@yahoo.com');

CREATE TABLE ventas(
id INT AUTO_INCREMENT PRIMARY KEY,
id_producto INT,
id_cliente INT,
cantidad INT,
fecha DATE,
foreign key (id_producto) REFERENCES productos(id),
foreign key (id_cliente) REFERENCES clientes(id)
);

INSERT INTO ventas(id_producto, id_cliente, cantidad, 
fecha)
VALUES (1,1,3,'2024-04-15'), 
(1,5,3,'2024-03-10'),
(2,2,2,'2024-04-14'),
(3,3,1,'2024-02-13'),
(4,1,2,'2024-04-12');

-- Vista para mostrar las ventas de cada cliente
CREATE VIEW ventas_por_cliente AS
SELECT c.nombre AS cliente, p.nombre AS producto, 
v.cantidad, v.fecha FROM ventas v 
JOIN clientes c ON v.id_cliente = c.id
JOIN productos p ON v.id_producto = p.id;

SELECT * FROM ventas_por_cliente;

DROP VIEW ventas_por_cliente;

-- Procedimiento almacenado para agregar productos
DELIMITER //
CREATE PROCEDURE agregar_productos(
IN nombre_producto VARCHAR(100),
IN precio DECIMAL(10, 2),
IN cantidad INT
)
BEGIN
INSERT INTO productos(nombre, precio, cantidad)
VALUES (nombre_producto, precio, cantidad); 
END // 

DELIMITER ;

-- Llamar procedimiento almacenado
CALL agregar_productos('Traje',100.00, 40);

-- Seleccionar productos
SELECT * FROM productos;

-- Procedimiento almacenado para agregar clientes
DELIMITER //
CREATE PROCEDURE agregar_cliente(
IN nombre_cliente VARCHAR(100),
IN email VARCHAR(100)
)
BEGIN
INSERT INTO clientes(nombre, email)
VALUES (nombre_cliente, email); 
END // 

DELIMITER ;

-- Agregando datos a la tabla clientes
CALL agregar_cliente('Elsa Flores', 'elsapato@gmail.com');

-- Seleccionar productos
SELECT * FROM clientes;

-- Procedimiento almacenado para listar productos
DELIMITER //

CREATE PROCEDURE listar_productos()
BEGIN
SELECT * FROM productos; 
END //

DELIMITER ;

CALL listar_productos();

-- Procedimiento almacenado para listar clientes
DELIMITER //

CREATE PROCEDURE listar_clientes()
BEGIN
SELECT * FROM clientes; 
END //
 
DELIMITER ;

CALL listar_clientes();








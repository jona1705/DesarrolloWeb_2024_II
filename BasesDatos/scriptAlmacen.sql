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

-- Modificar tabla de prudctos 
ALTER TABLE Productos ADD COLUMN categoria VARCHAR(50);

--
DESCRIBE Productos;

-- Boorar columna de tabla productos
ALTER TABLE Productos DROP COLUMN categoria;

-- Modificar tabla de ventas
ALTER TABLE Ventas ADD COLUMN monto_total DECIMAL(10,2);

--
DESCRIBE Ventas; 

-- Seleccionar tabla de productos
SELECT * FROM Productos;

-- Deshabilitar el modo seguro
SET SQL_SAFE_UPDATES = 0; 

-- Actualizar categoria para que todos los productos sean de ropa
UPDATE Productos SET categoria = 'Ropa';

-- Habilitar el modo seguro
SET SQL_SAFE_UPDATES = 1;

-- Seleccionar tabla de productos
SELECT * FROM Ventas;

-- Actualizando Monto_total en tabla de ventas
UPDATE Ventas SET monto_total= 20.00 * cantidad
WHERE id = 1;

UPDATE Ventas SET monto_total= 20.00 * cantidad
WHERE id = 2;

UPDATE Ventas SET monto_total= 20.00 * cantidad
WHERE id = 3;

UPDATE Ventas SET monto_total= 35.00 * cantidad
WHERE id = 4;

UPDATE Ventas SET monto_total= 50.00 * cantidad
WHERE id = 5;

-- Procedimiento almacenado para modificar moto_total en tabla de ventas
DELIMITER //

CREATE PROCEDURE Insertar_venta(
	IN p_id_producto INT,
    IN p_id_cliente INT,
    IN p_cantidad INT,
    IN p_fecha DATE
)
BEGIN
	DECLARE v_precio DECIMAL(10,2);
    DECLARE v_monto_total DECIMAL(10,2);
    
    -- Obtener el precio del producto
    SELECT precio INTO v_precio FROM Productos WHERE id = p_id_producto;
	-- Calcular monto total
    SET v_monto_total = v_precio * p_cantidad;
    
    -- Insertar en la tabla de ventas
    INSERT INTO Ventas (id_producto, id_cliente, cantidad, fecha, monto_total)
    VALUES (p_id_producto, p_id_cliente, p_cantidad, p_fecha, v_monto_total);
	
END //

DELIMITER ;

-- Invocar a nuestro procedimiento almacenado
CALL Insertar_venta(5, 3, 5, '2024-04-12');

-- Insertar tres nuevos clientes
INSERT INTO clientes(nombre, email)
VALUES ('Justo Martinez', 'justo@gmail.com'), 
('Mario Gomez', 'mario@outlook.com'),
('Clara Torres', 'clara@hotmail.com');

-- SELEC TABLA DE CLIENTES
SELECT * FROM Clientes;

-- Subconsultas Escalares
SELECT nombre, (SELECT MAX(precio) FROM Productos) AS
precio_maximo FROM Productos;

-- Contar el número total de clientes
SELECT (SELECT COUNT(*) FROM Clientes) AS total_clientes;

-- Calcular el precio total de todas las ventas
SELECT (SELECT SUM(Productos.precio*Productos.cantidad) FROM Productos
INNER JOIN ventas ON Productos.id =
ventas.id_producto) AS total_ventas;

-- Mostrar el nombre del cliente que realizó la última venta
SELECT (SELECT nombre FROM Clientes WHERE id =
(SELECT id_cliente FROM ventas ORDER BY fecha DESC
LIMIT 1)) AS ultimo_cliente;

-- Calcular el promedio de precio de los productos
SELECT (SELECT AVG(precio) FROM Productos) AS
promedio_precio;

-- Subconsultas de fila

-- Obtener los detalles del cliente que realizó la
-- primera venta
SELECT * FROM Clientes WHERE id = (SELECT id_cliente
FROM ventas ORDER BY fecha ASC LIMIT 1);

-- Mostrar los detalles del producto más caro
SELECT * FROM Productos WHERE precio = (SELECT
MAX(precio) FROM Productos);

-- Obtener los detalles del producto más vendido
SELECT * FROM Productos WHERE id = (SELECT
id_producto FROM ventas GROUP BY id_producto ORDER BY
SUM(cantidad) DESC LIMIT 1);

-- Mostrar los detalles del cliente que realizó la
-- última venta
SELECT * FROM Clientes WHERE id = (SELECT id_cliente
FROM ventas ORDER BY fecha DESC LIMIT 1);

-- Obtener los detalles del producto más barato
SELECT * FROM Productos WHERE precio = (SELECT
MIN(precio) FROM Productos);

-- Subconsultas de columna

-- Mostrar el precio máximo de todos los productos
-- junto con el nombre del producto
SELECT nombre, (SELECT MAX(precio) FROM Productos) AS
precio_maximo FROM Productos;

-- Contar el número total de ventas para cada cliente
SELECT nombre, (SELECT COUNT(*) FROM ventas WHERE
ventas.id_cliente = Clientes.id) AS total_ventas FROM
Clientes;

-- Calcular el total gastado por cada cliente en
-- todas las ventas
SELECT nombre, (SELECT SUM(Productos.precio*Productos.cantidad) FROM
ventas INNER JOIN Productos ON ventas.id_producto =
Productos.id WHERE ventas.id_cliente = Clientes.id)
AS total_gastado FROM Clientes;

-- Mostrar la cantidad de productos disponibles en
-- stock junto con el nombre del producto
SELECT DISTINCT nombre, 
    (SELECT cantidad 
     FROM Productos 
     WHERE Productos.id = ventas.id_producto) AS cantidad_disponible 
FROM ventas 
JOIN Productos ON ventas.id_producto = Productos.id;

-- Obtener la fecha de la última venta para cada
-- cliente
SELECT nombre, (SELECT MAX(fecha) FROM ventas WHERE
ventas.id_cliente = Clientes.id) AS ultima_venta FROM
Clientes;

-- Subconsultas correlacionadas

-- Obtener el nombre de los clientes que han
-- realizado una compra en el último mes
SELECT nombre FROM Clientes c
WHERE EXISTS (
SELECT * FROM ventas v
WHERE v.id_cliente = c.id
AND v.fecha >= DATE_SUB(CURRENT_DATE(), INTERVAL
1 MONTH));

-- Mostrar los productos que nunca han sido vendidos
SELECT nombre FROM Productos p
WHERE NOT EXISTS (
SELECT * FROM ventas v
WHERE v.id_producto = p.id
);

-- Calcular el total gastado por cada cliente en
-- todas sus compras y mostrar solo aquellos que
-- hayan gastado más de 1000 en total
SELECT nombre, (
SELECT SUM(v.monto_total)
FROM ventas v
WHERE v.id_cliente = c.id
) AS total_gastado
FROM Clientes c
HAVING total_gastado > 100;
      
-- Mostrar los productos que han sido vendidos más de
-- 50 veces
SELECT nombre FROM Productos p
WHERE (
SELECT COUNT(*)
FROM ventas v
WHERE v.id_producto = p.id
) > 50;

-- Mostrar los productos que tienen una cantidad
-- disponible menor que el promedio de cantidad
-- disponible de todos los productos
SELECT nombre FROM Productos p
WHERE cantidad < (
SELECT AVG(cantidad)
FROM Productos
);








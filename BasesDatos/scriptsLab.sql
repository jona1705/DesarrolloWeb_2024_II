-- CREANDO LA BASE DE DATOS DE UNIVERSIDAD

CREATE DATABASE IF NOT EXISTS Universidad;

USE Universidad;

DROP DATABASE IF EXISTS Universidad;

SHOW DATABASES;

-- TRABAJANDO CON LA TABLA DE PRUEBA (EN LA BASE DE DATOS DE UNIVERSIDAD)

CREATE TABLE IF NOT EXISTS Prueba(
	id INT
);

INSERT INTO Prueba(id) VALUES (12), (24), (45), (97);

SELECT * FROM Prueba;

-- DESACTIVAR EL MODO SEGURO
SET SQL_SAFE_UPDATES = 0; 

UPDATE Prueba SET id = 5;

DELETE FROM Prueba;

DROP TABLE IF EXISTS Prueba;

SELECT * FROM Prueba;

ALTER TABLE Prueba 
ADD COLUMN nombre varchar(50);

ALTER TABLE Prueba
ADD COLUMN rfc VARCHAR(14) AFTER id;

DESCRIBE Prueba;

INSERT INTO Prueba(id, rfc, nombre) VALUES 
(12, 'LPMA180912', 'MANUEL'), 
(24, 'MMLU170892', 'Luis'), 
(45,'VRKA091100','Karla'), 
(97,'PRJO130401', 'Jorge');

ALTER TABLE Prueba 
ADD COLUMN apellido varchar(80);

ALTER TABLE Prueba 
DROP COLUMN apellido;

TRUNCATE TABLE Prueba;

-- ACTIVAR EL MODO SEGURO
SET SQL_SAFE_UPDATES = 1; 

-- EMPIEZA LA BASE DE DATOS DE UNIVERSIDAD

CREATE TABLE IF NOT EXISTS Estudiante(
	id_estudiante INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50),
    apellido varchar(50),
    fecha_nacimiento DATE,
    id_carrera INT
);

DESCRIBE Estudiante;

INSERT INTO Estudiante (nombre, apellido, fecha_nacimiento, id_carrera)
VALUES ('Juan', 'Gonzalez', '2000-04-19', 1);

SELECT * FROM Estudiante;

INSERT INTO Estudiante (nombre, apellido, fecha_nacimiento, id_carrera)
VALUES ('Pedro', 'Torres', '1998-07-21', 1),
('Elena', 'Martinez', '2005-08-20', 2),
('Jorge', 'Vega', '1999-07-12', 2),
('Hugo', 'Perez', '2004-11-30', 3),
('Hector', 'Parra', '2003-12-30', 3);

SELECT nombre, apellido FROM Estudiante;

SELECT COUNT(*) FROM Estudiante;

-- Mostrar estudiantes cuyo nombre comience con 'H'
SELECT * FROM Estudiante WHERE nombre LIKE 'H%';

-- Mostrar estudiantes cuyo apellido termine con 'ez'
SELECT * FROM Estudiante WHERE apellido LIKE '%ez';

-- Mostrar estudiantes cuyo nombre contenga una 'u'
SELECT * FROM Estudiante WHERE nombre LIKE '%u%';

-- Mostrar nombre completo en un solo campo
SELECT id_estudiante, CONCAT(nombre, ' ', apellido)
AS nombre_completo, fecha_nacimiento, id_carrera 
FROM Estudiante;

-- Mostrar estudiante nacido el '1998-07-21'
SELECT * FROM Estudiante WHERE fecha_nacimiento = '1998-07-21';

-- Mostrar alumnos nacidos antes del 2000
SELECT * FROM Estudiante WHERE YEAR(fecha_nacimiento) < 2000;

-- Mostrar estudiantes cuyo nombre  no contenga una 'u'
SELECT * FROM Estudiante WHERE nombre NOT LIKE '%u%';

-- Mostrar los estudiantes nacidos en el mes de abril
SELECT * FROM Estudiante WHERE MONTH(fecha_nacimiento) = 4;

-- Mostrar estudiantes nacidos entre el año 2000 y 2007
SELECT * FROM Estudiante WHERE YEAR(fecha_nacimiento) BETWEEN 2000 AND 2007; 

-- Mostrar estudiantes no nacidos entre el año 2000 y 2007
SELECT * FROM Estudiante WHERE YEAR(fecha_nacimiento) NOT BETWEEN 2000 AND 2007; 

-- Crear tabla de carreras
CREATE TABLE IF NOT EXISTS carreras(
	id_carrera INT PRIMARY KEY AUTO_INCREMENT,
    nombre_carrera VARCHAR(40) NOT NULL
);

-- Insertando registros en la tabla carreras
INSERT INTO carreras (nombre_carrera) VALUES ('Derecho'), 
('Matemáticas Aplicadas y Computación'), ('Actuaria'),
('Comunicación'), ('Filosofía'), ('Historia'), ('Ciencia de Datos');

-- Mostrar informacion en la tabla carreras
SELECT * FROM carreras;

-- Actualizar la informacion de la tabla
UPDATE carreras SET nombre_carrera = 'Gastronomía' WHERE id_carrera = 1;

-- Borrar la carrera de historia
DELETE FROM carreras WHERE id_carrera = 6;

-- Añadir llave foránea a la tabla estudiante
ALTER TABLE Estudiante
ADD CONSTRAINT fk_carrera
FOREIGN KEY (id_carrera) REFERENCES carreras(id_carrera);

-- Checando la llave foranea
DESCRIBE Estudiante;

-- Mostrar el nombre, apellido y la carrera que estudia
SELECT Estudiante.nombre, Estudiante.apellido, 
carreras.nombre_carrera
FROM Estudiante JOIN carreras ON 
Estudiante.id_carrera = carreras.id_carrera; 

-- Mostrar estudiantes de MAC y Gastronomía
SELECT Estudiante.nombre, Estudiante.apellido, 
carreras.nombre_carrera
FROM Estudiante JOIN carreras ON 
Estudiante.id_carrera = carreras.id_carrera
WHERE Estudiante.id_carrera IN (1, 2); 
-- Otra alternativa sería NOT IN (3) 

-- Crear tabla de cursos
CREATE TABLE IF NOT EXISTS Cursos(
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nombre_curso VARCHAR(40) NOT NULL,
    id_carrera INT, 
    FOREIGN KEY(id_carrera) REFERENCES
    carreras(id_carrera)
);

INSERT INTO Cursos (nombre_curso, id_carrera) 
VALUES ('Pozole I', 1), ('Comida Italiana', 1), ('Alimentos procesado', 1),
('Calculo', 2), ('Estructura de Datos', 2), ('Matematicas Discretas', 2),
('Calculo Diferencia', 3), ('Seguro de Vida', 3), ('Algebra Superior', 3);

-- Crear Tabla de inscripcion
CREATE TABLE IF NOT EXISTS Inscripcion(
	id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_estudiante INT, 
    id_curso INT,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Seleccionar todas las tablas
SELECT * FROM Estudiante;
SELECT * FROM Cursos;
-- Insertar datos en la tabla inscripcion
INSERT INTO Inscripcion(id_estudiante, id_curso) 
VALUES(1, 1), (2,2),(1,3),(3, 4),(4, 5);

-- Mostrar datos de inscripcion
SELECT * FROM Inscripcion;

-- Ordenamos por Apellido
SELECT * FROM Estudiante
ORDER BY apellido DESC;

-- Ordenamos por Apellido descendentemente 
-- y fecha de nacimientp ascendentemente
SELECT * FROM Estudiante
ORDER BY apellido DESC, fecha_nacimiento ASC;

-- Funciones de agregacion
SELECT COUNT(*) FROM Estudiante;

-- Total de estudiantes por carrera
SELECT C.nombre_carrera, COUNT(*) AS total_estudiantes
FROM Estudiante E JOIN carreras C
ON E.id_carrera = C.id_carrera
GROUP BY E.id_carrera
HAVING total_estudiantes >= 2;

-- Producto Cartesiano
SELECT * FROM Estudiante JOIN Carreras;

-- INICIO: ACTIVIDADES DE TAREA -------------------------------------

-- Crear Tabla Calificaciones
CREATE TABLE IF NOT EXISTS Calificaciones(
	id_calificacion INT PRIMARY KEY AUTO_INCREMENT,
    calificacion INT NOT NULL,
    id_estudiante INT NOT NULL, 
    id_curso INT NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES CursoS(id_curso)
);

-- Insertando 5 carreras más
INSERT INTO carreras (nombre_carrera) VALUES ('Derecho'), ('Administración'),
('Quimica'), ('Biología'), ('Artes Plasticas');

-- Mostrando la tabla carreras despues de las inserciones
SELECT * FROM carreras;

-- Contando registros en la tabla estudiante antes de las nuevas inserciones
-- SELECT COUNT(*) AS NoAlumnos FROM Estudiante; -- Se contaron con 6 alumnos

-- DESACTIVANDO TEMPORALMENTE LA RESTRICCION DE LLAVE EXTERNA (O FORANEA)
SET foreign_key_checks = 0;

INSERT INTO estudiante (nombre, apellido, fecha_nacimiento, id_carrera) VALUES
('Juan', 'Pérez', '2000-01-15', 8),
('María', 'Gómez', '1999-05-22', 3),
('Carlos', 'Rodríguez', '2002-03-10', 11),
('Ana', 'Martínez', '2001-11-03', 6),
('Pedro', 'López', '2000-07-18', 4),
('Laura', 'Fernández', '1998-09-27', 9),
('Javier', 'González', '2002-02-05', 2),
('Sofía', 'Díaz', '1999-08-14', 7),
('Miguel', 'Hernández', '2001-04-30', 10),
('Isabel', 'Ramírez', '1997-12-12', 1),
('Alejandro', 'Sánchez', '2000-06-25', 12),
('Luisa', 'Jiménez', '1998-10-08', 5),
('Ricardo', 'Torres', '2002-08-03', 8),
('Carmen', 'Ruiz', '1999-01-20', 3),
('Fernando', 'Vega', '2001-07-07', 11),
('Lorena', 'Cruz', '1998-04-15', 6),
('Gabriel', 'Ortiz', '2000-09-11', 4),
('Elena', 'Morales', '1997-03-28', 9),
('Daniel', 'Flores', '2002-05-02', 2),
('Patricia', 'Castro', '1999-10-19', 7),
('Roberto', 'Núñez', '2001-12-08', 10),
('Silvia', 'Herrera', '1998-06-14', 1),
('Diego', 'Cabrera', '2000-04-23', 12),
('Natalia', 'Guerrero', '1997-02-09', 5),
('Francisco', 'Molina', '1999-09-05', 8),
('Verónica', 'García', '2002-11-18', 3),
('Hugo', 'Peralta', '2001-06-30', 11),
('Adriana', 'Navarro', '1998-03-25', 6),
('Martín', 'Vargas', '2000-10-12', 4),
('Raquel', 'Salazar', '1997-07-22', 9),
('Andrés', 'Lara', '2001-01-08', 2),
('Beatriz', 'Montoya', '1998-04-14', 7),
('Óscar', 'Campos', '2002-02-20', 10),
('Alicia', 'Soto', '1999-08-07', 1);

-- ACTIVANDO LA RESTRICCION DE LLAVE EXTERNA
SET foreign_key_checks = 1;

-- Contando registros en la tabla alumnos antes de las nuevas inserciones
-- SELECT COUNT(*) AS NoAlumnos FROM Estudiante; -- Actualmente con 40 alumnos

-- Mostrando estudiantes despues de las nuevas inserciones
SELECT * FROM Estudiante;

-- DESACTIVANDO TEMPORALMENTE LA RESTRICCION DE LLAVE EXTERNA
SET foreign_key_checks = 0;

-- Insertando en la Tabla de Cursos
INSERT INTO Cursos (nombre_curso, id_carrera) 
VALUES ('Técnicas Culinarias Avanzadas', 1), ('Gestión de Restaurantes', 1), ('Cocina Internacional', 1),
('Calculo II', 2), ('Programación I', 2), ('Algebra Superior', 2),
('Matemáticas Actuariales', 3), ('Estadística Aplicada', 3), ('Finanzas y Seguros', 3),
('Teorías de la Comunicación', 4), ('Periodismo Digital', 4), ('Producción Audiovisual', 4),
('Historia de la Filosofía', 5), ('Ética y Moral', 5), ('Filosofía Política', 5),
('Programación en Python', 7), ('Estadística para Ciencia de Datos', 7), ('Aprendizaje Automático', 7),
('Derecho Civil', 8), ('Derecho Penal', 8), ('Derecho Constitucional', 8),
('Administración de Empresas', 9), ('Contabilidad Financiera', 9), ('Marketing Estratégico', 9),
('Química Orgánica', 10), ('Química Inorgánica', 10), ('Análisis Químico', 10),
('Biología Celular', 11), ('Genética', 11), ('Ecología', 11),
('Historia del Arte', 12), ('Dibujo y Pintura', 12), ('Escultura y Arte Tridimensional', 12);

-- ACTIVANDO LA RESTRICCION DE LLAVE EXTERNA (O FORANEA)
SET foreign_key_checks = 1;

-- Mostrando la Tabla de Cursos despues de las Inserciones
SELECT * FROM Cursos;

-- Mostrando Tabla Inscripcion antes de las nuevas inserciones
SELECT * FROM Inscripcion;

-- DESACTIVANDO TEMPORALMENTE LA RESTRICCION DE LLAVE EXTERNA
SET foreign_key_checks = 0;

-- Insertando datos en la Tabla de Inscripcion
INSERT INTO Inscripcion(id_estudiante, id_curso) 
VALUES (2,14), (3,7), (2,13), (9,31),(8,28),(1,4),(5,23),(8,29),(7,26),
(12,41),(11,37),(12,40),(3,17),(3,16),(2,5),(11,39),(7,27),(5,22),(2,3),
(1,3),(4,20),(7,27),(3,9),(10,34),(1,11); 

-- DESACTIVANDO TEMPORALMENTE LA RESTRICCION DE LLAVE EXTERNA
SET foreign_key_checks = 0;

-- Mostrando Tabla Inscripcion despues de las nuevas inserciones
SELECT * FROM Inscripcion;

-- Mostrar datos en la Tabla Calificaciones antes de las inserciones
Select * FROM  Calificaciones;

-- DESACTIVANDO TEMPORALMENTE LA RESTRICCION DE LLAVE EXTERNA
SET foreign_key_checks = 0;

-- Insertando datos en la Tabla de Inscripcion
INSERT INTO Calificaciones(calificacion, id_estudiante, id_curso) 
VALUES (8,2,14), (7,3,7), (6,2,13), (10,9,31),(5,8,28),(7,1,4),(9,5,23),(6,8,29),(8,7,26),
(10,12,41),(7,11,37),(5,12,40),(9,3,17),(6,3,16),(8,2,5),(10,11,39),(7,7,27),(6,5,22),(9,2,3),
(5,1,3),(9,4,20),(6,7,27),(8,3,9),(5,10,34),(7,1,11); 

-- DESACTIVANDO TEMPORALMENTE LA RESTRICCION DE LLAVE EXTERNA
SET foreign_key_checks = 0;

-- Mostrar datos en la Tabla Calificaciones despues de las inserciones
SELECT * FROM Calificaciones;

-- FIN: ACTIVIDADES DE TAREA -------------------------------------

-- EJEMPLO DE FUNCIONES DE AGREGACION Y GROUP BY

-- Suma de calificaciones para un curso especifico
CREATE VIEW suma_calificaciones AS
SELECT cur.nombre_curso, SUM(calf.calificacion) AS sumaCalf
FROM Calificaciones AS calf JOIN Cursos AS cur
ON calf.id_curso = cur.id_curso
GROUP BY calf.id_curso;

SELECT COUNT(*) FROM suma_calificaciones;

-- Promedio de calificaciones para un curso especifico
SELECT cur.nombre_curso, AVG(calf.calificacion) AS sumaCalf
FROM Calificaciones AS calf JOIN Cursos AS cur
ON calf.id_curso = cur.id_curso
GROUP BY calf.id_curso
HAVING AVG(calf.calificacion) > 8;

-- Numero de inscripciones total por alumno
SELECT e.nombre, e.apellido, c.nombre_carrera, 
COUNT(i.id_inscripcion) AS TotalInsc
FROM Inscripcion AS i JOIN Estudiante AS e
ON e.id_estudiante = i.id_estudiante
JOIN Carreras AS c
ON e.id_carrera = c.id_carrera
GROUP BY i.id_estudiante;

-- Calificacion maxima obtenida por estudiante
SELECT id_estudiante, MAX(calificacion) AS MaxCalf
FROM Calificaciones
GROUP BY id_estudiante;

-- Calificacion minima obtenida por estudiante
SELECT id_estudiante, MIN(calificacion) AS MinCalf
FROM Calificaciones
GROUP BY id_estudiante;

-- Estudiantes que no han realizado ninguna inscripcion
SELECT id_estudiante
FROM Estudiante
WHERE id_estudiante NOT IN (SELECT id_estudiante FROM Inscripcion);

-- Revisar la tabla de inscripciones
SELECT * FROM Inscripcion;

-- SELECT ESTUDIANTES
CREATE VIEW alumnos_carreras AS
SELECT c.nombre_carrera, COUNT(*) AS TotalAlumnos FROM Estudiante e JOIN carreras c
ON e.id_carrera = c.id_carrera
GROUP BY e.id_carrera
HAVING COUNT(*) > 2;

SELECT * FROM alumnos_carreras;

DESCRIBE alumnos_carreras;
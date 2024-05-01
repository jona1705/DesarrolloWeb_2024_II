CREATE DATABASE RELALG;

USE RELALG;

CREATE TABLE Persona(
id INT,
pname VARCHAR(20),
address VARCHAR(40),
hobby VARCHAR(20)
);

INSERT INTO Persona(id, pname, address, hobby) 
VALUES (1123, 'John', '123 Main','stamps'),
(1123, 'John', '123 Main','coins'),
(5556, 'Mary', '7 Lake Dr','hinking'),
(9876, 'Bart', '5 Pine St','stamps');

SELECT * FROM Persona;

SELECT DISTINCT pname, address FROM Persona;
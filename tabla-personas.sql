-- 1. Crear la base de datos
CREATE DATABASE IF NOT EXISTS ejemplo;
USE ejemplo;

-- 2. Crear la tabla personas con los nombres de columna exactos
CREATE TABLE IF NOT EXISTS personas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    edad INT,
    ciudad VARCHAR(50)
);

-- 3. Insertar registros en la tabla (20 filas)
INSERT INTO personas (nombre, apellidos, edad, ciudad) VALUES
('Carlos', 'Sanchez Perez', 28, 'Madrid'),
('Elena', 'Gomez Garcia', 34, 'Barcelona'),
('Ricardo', 'Martinez Lopez', 45, 'Sevilla'),
('Lucia', 'Fernandez Ruiz', 22, 'Valencia'),
('Marcos', 'Rodriguez Sanz', 31, 'Zaragoza'),
('Sofia', 'Lopez Martinez', 29, 'Bilbao'),
('Hugo', 'Gonzalez Pardo', 40, 'Malaga'),
('Isabel', 'Jimenez Rozas', 37, 'Alicante'),
('Jorge', 'Castro Soler', 52, 'Valladolid'),
('Valeria', 'Ortiz Bravo', 26, 'Vigo'),
('Adrian', 'Mendez Vidal', 33, 'Gijon'),
('Camila', 'Ramos Vega', 21, 'Granada'),
('Oscar', 'Gil Blanco', 48, 'Vitoria'),
('Julia', 'Serrano Cruz', 30, 'Oviedo'),
('Diego', 'Cano Marin', 35, 'Murcia'),
('Marta', 'Rubio Pena', 27, 'Salamanca'),
('Ivan', 'Soto Garrido', 41, 'Logrono'),
('Paula', 'Luna Campos', 24, 'Pamplona'),
('Andres', 'Ibanez Torres', 39, 'Santander'),
('Natalia', 'Fuentes Moya', 32, 'Almeria');

-- Verificacion 
SELECT * FROM personas ORDER BY id DESC;

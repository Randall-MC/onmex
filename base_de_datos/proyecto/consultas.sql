-- Préstamos que tiene cada lector
SELECT lector_id, COUNT(*) AS total_prestamos
FROM prestamos_vigentes
GROUP BY lector_id
ORDER BY lector_id;

-- Lectores que no tienen ningún libro prestado
SELECT lector_id, nombre, apellido
FROM lectores 
WHERE lector_id NOT IN (SELECT lector_id FROM prestamos_vigentes);

-- Libros que no han sido prestados
SELECT ISBN, nombre, editorial, autor
FROM libros
WHERE ISBN NOT IN (SELECT ISBN FROM prestamos_vigentes);

-- Información del lector y libro prestado
SELECT l.lector_id, l.nombre, l.apellido, p.ISBN AS ISBN_libro_prestado, p.fecha_prestamo
FROM lectores l
LEFT JOIN prestamos_vigentes p ON l.lector_id = p.lector_id
GROUP BY l.lector_id, l.nombre, l.apellido, p.ISBN, p.fecha_prestamo
ORDER BY l.lector_id;

-- Lectores que tienen 5 libros prestados
SELECT l.lector_id, l.nombre, l.apellido, COUNT(p.ISBN) AS cantidad_libros_prestados
FROM lectores l
JOIN prestamos_vigentes p ON l.lector_id = p.lector_id
GROUP BY l.lector_id, l.nombre, l.apellido
HAVING COUNT(p.ISBN) = 5
ORDER BY l.lector_id;

-- Promedio de edad de los lectores
SELECT AVG(EXTRACT(YEAR FROM AGE(fecha_nacimiento))) AS promedio_edad_lectores
FROM lectores;

-- lector  más viejo
SELECT lector_id, nombre, apellido, fecha_nacimiento, EXTRACT(YEAR FROM AGE(fecha_nacimiento)) AS edad
FROM lectores 
ORDER BY fecha_nacimiento ASC
LIMIT 1;

-- Lector  más joven
SELECT lector_id, nombre, apellido, fecha_nacimiento, EXTRACT(YEAR FROM AGE(fecha_nacimiento)) AS edad
FROM lectores 
ORDER BY fecha_nacimiento DESC
LIMIT 1;
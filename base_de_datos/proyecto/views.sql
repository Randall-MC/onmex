-- Vista libros_prestados
CREATE VIEW libros_prestados AS
SELECT l.nombre || ' ' || l.apellido AS nombre_lector, li.nombre AS nombre_libro, li.editorial, p.ISBN
FROM lectores l
JOIN prestamos_vigentes p ON l.lector_id = p.lector_id
JOIN libros li ON p.ISBN = li.ISBN;

-- Prueba de la vista libros_prestados
SELECT *
FROM libros_prestados
WHERE nombre_lector = 'Fernando Rodríguez';
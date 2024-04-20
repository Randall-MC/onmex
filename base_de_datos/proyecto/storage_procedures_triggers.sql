-- Función trigger que inserte los valores necesarios en la tabla "log_prestamos"
CREATE OR REPLACE FUNCTION insert_into_log_prestamos()
RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO log_prestamos (lector_id, ISBN, fecha_prestamo)
    VALUES (NEW.lector_id, NEW.ISBN, NEW.fecha_prestamo);
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- Trigger que se activa después de una inserción en la tabla "prestamos_vigentes"
CREATE TRIGGER prestamos_vigentes_insert_trigger
AFTER INSERT ON prestamos_vigentes
FOR EACH ROW
EXECUTE FUNCTION insert_into_log_prestamos();

-- Procedimiento almacenado para devolver un libro
CREATE OR REPLACE PROCEDURE return_book(
    IN p_lector_id INT,
    IN p_ISBN VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Insertar un registro en log_devoluciones
    INSERT INTO log_devoluciones (lector_id, ISBN, fecha_devolucion)
    VALUES (p_lector_id, p_ISBN, NOW());

    -- Eliminar el registro de prestamos_vigentes
    DELETE FROM prestamos_vigentes
    WHERE lector_id = p_lector_id AND ISBN = p_ISBN;
END;
$$;

-- Crear una función para registrar la devolución y eliminar el préstamo vigente
CREATE OR REPLACE FUNCTION registrar_devolucion(
    p_lector_id INT,
    p_ISBN VARCHAR(20)
) RETURNS TEXT AS
$$
DECLARE
    v_log_prestamo_id INT;
BEGIN
    -- Buscar el log_prestamo_id correspondiente
    SELECT log_prestamo_id INTO v_log_prestamo_id
    FROM log_prestamos
    WHERE lector_id = p_lector_id AND ISBN = p_ISBN;

    -- Insertar en la tabla "log_devoluciones" con el log_prestamo_id
    INSERT INTO log_devoluciones (log_prestamo_id, lector_id, ISBN, fecha_devolucion)
    VALUES (v_log_prestamo_id, p_lector_id, p_ISBN, NOW());

    -- Eliminar el registro en la tabla "prestamos_vigentes"
    DELETE FROM prestamos_vigentes
    WHERE lector_id = p_lector_id AND ISBN = p_ISBN;

    RETURN 'Devolución registrada con éxito';
END;
$$ LANGUAGE PLPGSQL;

-- Llamar a la función registrar_devolucion
SELECT registrar_devolucion(9, '9787654321098');

-- Crear una función para obtener la cantidad de libros prestados actualmente
CREATE OR REPLACE FUNCTION libros_prestados() RETURNS INT AS
$$
DECLARE
    v_cantidad_libros INT;
BEGIN
    -- Contar la cantidad de registros en la tabla "prestamos_vigentes"
    SELECT COUNT(*) INTO v_cantidad_libros
    FROM prestamos_vigentes;

    RETURN v_cantidad_libros;
END;
$$ LANGUAGE PLPGSQL;

SELECT libros_prestados() AS total_libros_prestados;

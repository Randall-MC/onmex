CREATE DATABASE puls_ar
    WITH 
    ENCODING = 'UTF8';

CREATE TABLE lectores (
    lector_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE libros (
    ISBN VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    editorial VARCHAR(100)
);

CREATE TABLE prestamos_vigentes (
    prestamo_vigente_id SERIAL PRIMARY KEY,
    fecha_prestamo DATE NOT NULL,
    lector_id INT REFERENCES lectores(lector_id),
    ISBN VARCHAR(20) REFERENCES libros(ISBN),
    UNIQUE (lector_id, ISBN) -- Garantiza que un lector no pueda tener el mismo libro más de una vez
);

CREATE TABLE log_prestamos (
    log_prestamo_id SERIAL PRIMARY KEY,
    lector_id INT REFERENCES lectores(lector_id),
    ISBN VARCHAR(20) REFERENCES libros(ISBN),
    fecha_prestamo DATE
);

CREATE TABLE log_devoluciones (
    log_devolucion_id SERIAL PRIMARY KEY,
    log_prestamo_id INT REFERENCES log_prestamos(log_prestamo_id),
    lector_id INT,
    ISBN VARCHAR(20),
    fecha_devolucion TIMESTAMP
);

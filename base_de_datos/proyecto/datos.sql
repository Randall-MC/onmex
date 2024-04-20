INSERT INTO lectores (nombre, apellido, fecha_nacimiento, email)
VALUES
    ('Ana', 'García', '1990-03-15', 'ana@example.com'),
    ('Carlos', 'Martínez', '1985-07-20', 'carlos@example.com'),
    ('Elena', 'López', '1992-11-10', 'elena@example.com'),
    ('Fernando', 'Rodríguez', '1988-05-05', 'fernando@example.com'),
    ('Gabriela', 'Pérez', '1995-09-25', 'gabriela@example.com'),
    ('Hugo', 'Sánchez', '1993-02-18', 'hugo@example.com'),
    ('Isabel', 'Ramírez', '1991-12-03', 'isabel@example.com'),
    ('Javier', 'Gómez', '1987-08-12', 'javier@example.com'),
    ('Karla', 'Torres', '1994-04-30', 'karla@example.com'),
    ('Luis', 'Fernández', '1989-06-22', 'luis@example.com');

INSERT INTO libros (ISBN, nombre, editorial, autor)
VALUES
    ('9781234567890', 'Cien años de soledad', 'Gabriel García Márquez', 'Editorial A'),
    ('9789876543210', '1984', 'George Orwell', 'Editorial B'),
    ('9780123456789', 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Editorial C'),
    ('9785432109876', 'Orgullo y prejuicio', 'Jane Austen', 'Editorial D'),
    ('9782468135790', 'Matar a un ruiseñor', 'Harper Lee', 'Editorial E'),
    ('9781357924680', 'Crimen y castigo', 'Fyodor Dostoevsky', 'Editorial F'),
    ('9783692581470', 'El Gran Gatsby', 'F. Scott Fitzgerald', 'Editorial G'),
    ('9789517530864', 'Ulises', 'James Joyce', 'Editorial H'),
    ('9787654321098', 'Los miserables', 'Victor Hugo', 'Editorial I'),
    ('9789876543219', 'La metamorfosis', 'Franz Kafka', 'Editorial J');

INSERT INTO prestamos_vigentes (fecha_prestamo, lector_id, ISBN)
VALUES
    (CURRENT_DATE, 1, '9781234567890'),
    (CURRENT_DATE, 1, '9789876543210'),
    (CURRENT_DATE, 1, '9780123456789'),
    (CURRENT_DATE, 1, '9785432109876'),
    (CURRENT_DATE, 1, '9782468135790'),
    (CURRENT_DATE, 2, '9781234567890'),
    (CURRENT_DATE, 2, '9789876543210'),
    (CURRENT_DATE, 2, '9780123456789'),
    (CURRENT_DATE, 2, '9785432109876'),
    (CURRENT_DATE, 2, '9782468135790'),
    (CURRENT_DATE, 3, '9781234567890'),
    (CURRENT_DATE, 3, '9789876543210'),
    (CURRENT_DATE, 3, '9780123456789'),
    (CURRENT_DATE, 3, '9785432109876'),
    (CURRENT_DATE, 3, '9782468135790'),
    (CURRENT_DATE, 4, '9781234567890'),
    (CURRENT_DATE, 4, '9789876543210'),
    (CURRENT_DATE, 4, '9780123456789'),
    (CURRENT_DATE, 4, '9785432109876'),
    (CURRENT_DATE, 4, '9782468135790');

INSERT INTO prestamos_vigentes (fecha_prestamo, lector_id, ISBN)
VALUES
    (CURRENT_DATE, 5, '9781357924680'),
    (CURRENT_DATE, 5, '9783692581470'),
    (CURRENT_DATE, 5, '9789517530864'),
    (CURRENT_DATE, 6, '9781357924680'),
    (CURRENT_DATE, 6, '9783692581470'),
    (CURRENT_DATE, 6, '9789517530864'),
    (CURRENT_DATE, 7, '9781357924680'),
    (CURRENT_DATE, 7, '9783692581470'),
    (CURRENT_DATE, 7, '9789517530864');

INSERT INTO prestamos_vigentes (fecha_prestamo, lector_id, ISBN)
VALUES
    (CURRENT_DATE, 8, '9787654321098'),
    (CURRENT_DATE, 9, '9787654321098');
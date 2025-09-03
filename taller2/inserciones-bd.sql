-- -----------------------------------------------------
-- Inserciones para la tabla: Usuarios
-- Se omite la columna `id_usuario` para que PostgreSQL la genere automáticamente.
-- -----------------------------------------------------
INSERT INTO Usuarios (nombre, email) VALUES
('Juan Pérez', 'juan.perez@email.com'),
('Ana Torres', 'ana.torres@email.com'),      -- -> Será la usuaria con MÁS préstamos.
('Carlos Ruiz', 'carlos.ruiz@email.com'),
('Sofia Gomez', 'sofia.gomez@email.com'),
('David Lopez', 'david.lopez@email.com'),
('Maria Fernandez', 'maria.f@email.com'),
('Pedro Martinez', 'pedro.m@email.com'),
('Lucia Garcia', 'lucia.g@email.com'),       -- -> Esta usuaria NO tendrá préstamos.
('Javier Rodriguez', 'javier.r@email.com'),  -- -> Este usuario NO tendrá préstamos.
('Laura Mora', 'laura.m@email.com');

-- -----------------------------------------------------
-- Inserciones para la tabla: Libros
-- Se omite la columna `id_libro` para que PostgreSQL la genere automáticamente.
-- -----------------------------------------------------
INSERT INTO Libros (titulo, autor, stock) VALUES
('Cien Años de Soledad', 'Gabriel Garcia Marquez', 15), -- -> Será el libro MÁS prestado.
('La Sombra del Viento', 'Carlos Ruiz Zafón', 25),      -- -> Será el SEGUNDO más prestado y con stock > promedio.
('El Quijote', 'Miguel de Cervantes', 30),              -- -> Stock > promedio.
('1984', 'George Orwell', 10),
('Un Mundo Feliz', 'Aldous Huxley', 5),
('Ficciones', 'Jorge Luis Borges', 12),
('Rayuela', 'Julio Cortázar', 8),
('El Túnel', 'Ernesto Sabato', 20),
('La Casa de los Espíritus', 'Isabel Allende', 18),   -- -> Este libro NUNCA se ha prestado.
('El Aleph', 'Jorge Luis Borges', 11);                 -- -> Este libro NUNCA se ha prestado.

-- -----------------------------------------------------
-- Inserciones para la tabla: Prestamos
-- Se omite la columna `id_prestamos` para que PostgreSQL la genere automáticamente.
-- -----------------------------------------------------
INSERT INTO Prestamos (fecha_prestamo, fecha_devolucion, id_usuario, id_libro) VALUES
-- Préstamos devueltos (con fecha de devolución)
('2025-08-01', '2025-08-10', 1, 1),  -- Juan Pérez, Cien Años de Soledad (Duración: 9 días)
('2025-07-15', '2025-07-20', 2, 2),  -- Ana Torres, La Sombra del Viento (Duración: 5 días)
('2025-06-10', '2025-06-25', 3, 3),  -- Carlos Ruiz, El Quijote (Duración: 15 días)
('2025-08-05', '2025-08-15', 2, 1),  -- Ana Torres, Cien Años de Soledad (Duración: 10 días)
('2025-07-22', '2025-07-30', 4, 6),  -- Sofia Gomez, Ficciones (Duración: 8 días)
('2025-08-11', '2025-08-21', 5, 7),  -- David Lopez, Rayuela (Duración: 10 días)
('2025-08-01', '2025-08-18', 3, 4),  -- Carlos Ruiz, 1984 (Duración: 17 días)

-- Préstamos activos (actualmente prestados, sin fecha de devolución)
('2025-08-20', NULL, 2, 5),          -- -> Préstamo ACTIVO de Ana Torres.
('2025-08-22', NULL, 1, 2),          -- -> Préstamo ACTIVO de Juan Pérez.
('2025-08-25', NULL, 4, 1);          -- -> Préstamo ACTIVO de Sofia Gomez.


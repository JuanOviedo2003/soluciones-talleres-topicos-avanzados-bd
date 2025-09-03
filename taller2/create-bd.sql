-- -----------------------------------------------------
-- Tabla: Usuarios
-- Se cambia INT NOT NULL AUTO_INCREMENT por SERIAL PRIMARY KEY,
-- que es la sintaxis de PostgreSQL para un entero autoincremental.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Usuarios (
  id_usuario SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE -- Se añade UNIQUE para evitar emails duplicados
);

-- -----------------------------------------------------
-- Tabla: Libros
-- Se corrige "AUTO INCREMENT" a la sintaxis correcta de PostgreSQL "SERIAL".
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Libros (
  id_libro SERIAL PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  autor VARCHAR(50) NOT NULL,
  stock INT NOT NULL
);

-- -----------------------------------------------------
-- Tabla: Prestamos
-- Se corrige "AUTO INCREMENT" y se ajusta la sintaxis a PostgreSQL.
-- Las cláusulas ON DELETE y ON UPDATE NO ACTION son el comportamiento
-- por defecto en PostgreSQL, por lo que se pueden omitir por claridad.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Prestamos (
  id_prestamos SERIAL PRIMARY KEY,
  fecha_prestamo DATE NOT NULL,
  fecha_devolucion DATE NULL,
  id_usuario INT NOT NULL,
  id_libro INT NOT NULL,
  CONSTRAINT fk_Prestamos_Usuarios
    FOREIGN KEY (id_usuario)
    REFERENCES Usuarios (id_usuario),
  CONSTRAINT fk_Prestamos_Libros
    FOREIGN KEY (id_libro)
    REFERENCES Libros (id_libro)
);

-- -----------------------------------------------------
-- Las siguientes sentencias DELETE son estándar y
-- funcionan correctamente tanto en MySQL como en PostgreSQL.
-- No necesitan cambios.
-- -----------------------------------------------------

-- Elimina todos los préstamos asociados al usuario con id 15
DELETE FROM Prestamos
WHERE id_usuario = 15;

-- Elimina al usuario con id 15
DELETE FROM Usuarios
WHERE id_usuario = 15;


-- Elimina todos los préstamos asociados al libro con id 101
DELETE FROM Prestamos
WHERE id_libro = 101;


-- Elimina el libro con id 101
DELETE FROM Libros
WHERE id_libro = 101;



<------Punto 7-------->

SELECT nombre
FROM Usuarios
WHERE id_usuario IN (
    SELECT DISTINCT id_usuario
    FROM Prestamos
    WHERE fecha_devolucion IS NULL
);

<------Punto 8-------->

SELECT titulo
FROM Libros
WHERE id_libro = (
    SELECT id_libro
    FROM Prestamos
    GROUP BY id_libro
    ORDER BY COUNT(*) DESC
    OFFSET 1 LIMIT 1
);

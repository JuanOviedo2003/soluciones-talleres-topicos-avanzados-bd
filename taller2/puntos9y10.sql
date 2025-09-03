-- puntos 9 y 10
-- 9) Mostrar los libros que nunca se han prestado.

	SELECT l.titulo, l.id_libro FROM Libros l
	WHERE NOT EXISTS (
	    SELECT p.id_libro
	    FROM Prestamos p
	    WHERE p.id_libro = l.id_libro
	);

-- 10) Promedio de días de devolución por usuario.

	-- Promedio de dias
	SELECT id_usuario, AVG(dias_prestados) AS promedio_dias_devolucion
	FROM
	(  -- Subconsulta para calcular los dias prestados
	   	SELECT id_usuario, fecha_devolucion - fecha_prestamo AS dias_prestados
	    FROM Prestamos
		WHERE fecha_devolucion IS NOT NULL
	)
	AS prestamos_con_dias_prestados
	GROUP BY id_usuario
	ORDER BY id_usuario;
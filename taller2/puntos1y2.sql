
-- puntos 1 y 2

-- 1) Obtener el nombre del usuario que más préstamos ha realizado.

	-- 1) primera parte, contar y orndenar por la cantidad de prestamos segun el id del usuario asociado al prestamo.
	
		-- SELECT u.nombre AS "Nombre_Usuario", u.id_usuario AS "ID_Usuario", 
		-- COUNT(u.id_usuario) AS cantidad_prestamos 
		-- FROM usuarios u INNER JOIN prestamos p ON u.id_usuario = p.id_usuario
		-- GROUP BY u.id_usuario ORDER BY cantidad_prestamos DESC LIMIT 1

		-- sin subconsulta
		-- retorna a ana con id 2 y 3 prestamos
		
	-- 2) segunda parte, el usuario que más prestamos ha realizado
	
		-- hace un join entre usuarios y la tabla temporal
		-- para encontrar los datos del usuario
		SELECT u.nombre, u.id_usuario FROM usuarios u INNER JOIN 
		(	
		-- tabla temporal
		-- almacena solo id del usuario que más se repite en la tabla prestamos
		-- contando el id, agrupandolo por este, ordenandolo de forma desc y limitando a 1
		SELECT id_usuario, COUNT(id_usuario) AS cantidad_prestamos 
		FROM prestamos 
		GROUP BY id_usuario
		ORDER BY cantidad_prestamos DESC LIMIT 1
		) AS usuario_cantidad_prestamos 
		ON u.id_usuario = usuario_cantidad_prestamos.id_usuario

		-- con subconsulta
		-- retorna a ana con id 2 y 3 prestamos
		
	-- SELECT u.id_usuario, u.nombre, p.id_prestamos FROM usuarios u INNER JOIN prestamos p ON u.id_usuario = p.id_usuario
		
	-- retorna:
	-- JUAN PEREZ ID 1, 2 prestamos
	-- ANA TORRES ID 2, 3 prestamos
	-- CARLOS RUIZ ID 3, 2 prestamos
	-- SOFIA GOMEZ ID 4, 2 prestamos
	-- DAVID LOPEZ ID 5, 1 prestamo

-- 2) Listar los títulos de los libros que están actualmente prestados.

	-- JOIN entre los datos de la tabla temporal y la tabla de libros para obtener los nombres
	SELECT l.titulo, l.id_libro FROM libros l INNER JOIN 
	-- tabla temporal
	(SELECT id_libro FROM prestamos) 
	AS ids_libros_prestados 
	ON l.id_libro = ids_libros_prestados.id_libro

	-- id libros prestados
	SELECT id_libro FROM prestamos
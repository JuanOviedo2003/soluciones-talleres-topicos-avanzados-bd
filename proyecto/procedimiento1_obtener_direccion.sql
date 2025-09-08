CREATE OR REPLACE PROCEDURE obtener_direccion(

    IN p_user_id INT, -- parametro de entrada

	-- variables a usar por el procedimiento como salida
    OUT p_email VARCHAR(255),
    OUT p_street VARCHAR(255),
    OUT p_city VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- SELECT ... INTO: Realiza una consulta y guarda los resultados directamente en variables.
    SELECT
        u.email,    -- La columna 'email' de la tabla 'users'
        a.street,   -- La columna 'street' de la tabla 'address'
        a.city      -- La columna 'city' de la tabla 'address'
    INTO
        p_email,    -- se guardará en la variable de salida p_email
        p_street,   -- se guardará en la variable de salida p_street
        p_city      -- se guardará en la variable de salida p_city
    FROM
        address AS a
    INNER JOIN
        users AS u ON u.user_id = a."userId"
    WHERE
        u.user_id = p_user_id
    -- 'SELECT ... INTO' falla si la consulta devuelve más de una fila.
    LIMIT 1;
END;
$$;

-- Procedimiento: obtener_direccion
-- Parámetros:
--		IN  p_user_id -> id del usuario
--		OUT p_email -> email de usuario
--		OUT p_street -> calle del usuario
--		OUT p_city -> ciudad del usuario
-- Descripción:
-- Obtiene el email, calle y ciudad asociados a un usuario



-- el procedieminto remplaza los parametros vacios por los guardados
CALL obtener_direccion(3, NULL, NULL, NULL);
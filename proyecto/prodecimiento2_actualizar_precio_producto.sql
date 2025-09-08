CREATE OR REPLACE PROCEDURE actualizar_precio(
	IN p_product_id INT,
	IN p_price NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
	
	UPDATE product SET price = p_price WHERE product_id = p_product_id;
	
END;
$$;


-- Procedimiento: actualizar_precio
-- Parámetros:
--		IN p_product_id -> id del producto
--		IN p_price -> precio del producto
-- Descripción:
-- Actualiza el precio de un producto

CALL actualizar_precio(1,1500);
SELECT name, price FROM product
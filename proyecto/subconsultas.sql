/*SUBCONSULTAS*/

/*Mostrar los productos cuyo precio es mayor al promedio de precio de todos los productos de su mismo vendedor.*/

SELECT p.name, p.price, p."sellerId"
FROM product p
WHERE p.price > (
    SELECT AVG(p2.price)
    FROM product p2
    WHERE p2."sellerId" = p."sellerId"
);

/* obtener el nombre, apellido y el total de ventas realizadas por cada usuario 
que haya hecho al menos un pedido.*/

SELECT u.name, u."lastName", t.total_ventas
FROM users u
JOIN (
    SELECT "userId", SUM("totalPrice") AS total_ventas
    FROM "order"
    GROUP BY "userId"
) t ON u.user_id = t."userId";



/*Mostrar productos junto con la cantidad de categorías en que aparece cada uno.*/
SELECT p.name,
       p.price,
       (SELECT COUNT(*)
        FROM "_ProductCategory" pc
        WHERE pc."productId" = p.product_id) AS num_categorias
FROM product p;

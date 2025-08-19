/*Mostrar los datos de todos los productos de las categorías con un ID de 1 (Alimentos) o 5 (Frutas y Verduras)
y con un precio unitario superior a 3,5.*/
SELECT product_name, category_id, unit_price 
FROM product
WHERE (category_id = 1 OR category_id = 5) AND unit_price > 3.5;

/*Mostrar los nombres de los productos con un precio unitario mayor o igual a 3.5.*/

SELECT product_name 
FROM product 
WHERE unit_price >= 3.5;


/*
Seleccione nombres de productos junto con sus categorías. Muestre dos columnas: product_name y category_name.
*/

SELECT p.product_name, c.name as category_name 
FROM product as p
JOIN category as c 
ON p.category_id = c.category_id;

/*
Para cada compra, muestre el ID de compra, el nombre del producto,
el precio unitario en el momento de la compra y la cantidad de artículos de cada producto.
*/

SELECT pi.purchase_id, p.product_name, pi.unit_price, pi.quantity
FROM purchase_item as pi
JOIN product as p
ON pi.product_id = p.product_id;

/*
Para cada compra, muestre todas las categorías de productos comprados en esta compra.
*/

SELECT DISTINCT pi.purchase_id,  c."name" as "category_name"
FROM purchase_item as pi
JOIN product as p ON p.product_id = pi.product_id
JOIN category as c ON p.category_id = c.category_id
ORDER BY pi.purchase_id;

/*
pagina usada para las funciones de fechas: https://learnsql.es/blog/funciones-de-fecha-postgresql/
Mostrar los apellidos, nombres y fechas de nacimiento de los empleados. Ordene los resultados por la edad del empleado en orden ascendente
*/

SELECT e.last_name, e.first_name, e.birth_date, DATE_PART('year', AGE(CURRENT_DATE, e.birth_date)) as YEARs
FROM employee as e 
ORDER BY DATE_PART('year', AGE(CURRENT_DATE, e.birth_date)) ASC;

/*
Cuente cuántos clientes viven en cada ciudad, excepto en Knoxville y Stockton.
Ordene los resultados por el nombre de la ciudad en orden ascendente. Muestre dos columnas: city y customers_quantity.
*/

SELECT city, COUNT(city) 
FROM customer
WHERE city <> 'Knoxville' AND city <> 'Stockton'
GROUP BY city;

/*
Para cada categoría, encuentre el número de productos descatalogados.
Muestre sólo las categorías con al menos tres productos descatalogados. 
Ordene las filas por el número de productos descatalogados en orden descendente. 
Muestre dos columnas: name (el nombre de la categoría) y discontinued_products_number.
*/

SELECT c.name, COUNT(p.product_id) AS discontinued_products_number
FROM category c
JOIN product p ON c.category_id = p.category_id
WHERE p.discontinued = true
GROUP BY c.name
HAVING COUNT(p.product_id) >= 3
ORDER BY COUNT(p.product_id) DESC;



















-- 1. Insertar roles de usuario
INSERT INTO role (name) VALUES
('Admin'),
('Seller'),
('Buyer');

-- 2. Insertar usuarios
-- En una aplicación real, las contraseñas deben estar hasheadas.
INSERT INTO users (email, name, "lastName", password) VALUES
('admin@example.com', 'Admin', 'User', 'adminpass123'),
('seller.jane@example.com', 'Jane', 'Doe', 'sellerpass456'),
('john.buyer@example.com', 'John', 'Smith', 'buyerpass789'),
('alice.s@example.com', 'Alice', 'Sampson', 'alicepass101');

-- 3. Asignar roles a los usuarios
INSERT INTO "_UserRole" ("userId", "roleId") VALUES
(1, 1), -- Admin User es Admin
(2, 2), -- Jane Doe es Seller
(2, 3), -- Jane Doe también es Buyer
(3, 3), -- John Smith es Buyer
(4, 2), -- Alice Sampson es Seller
(4, 3); -- Alice Sampson también es Buyer

-- 4. Añadir direcciones de usuario
INSERT INTO address (street, city, state, zip, "userId") VALUES
('123 Admin Ave', 'Adminville', 'CA', '90210', 1),
('456 Seller St', 'Salesburg', 'NY', '10001', 2),
('789 Buyer Blvd', 'Purchase', 'TX', '75001', 3);

-- 5. Insertar categorías de productos
INSERT INTO category (name) VALUES
('Electronics'),
('Books'),
('Home & Kitchen'),
('Office Supplies');

-- 6. Insertar productos
INSERT INTO product (name, description, price, "sellerId", image, quantity) VALUES
('Laptop Pro 15"', 'A high-performance laptop for professionals.', 1200.00, 2, 'images/laptop.jpg', 50),
('The Art of SQL', 'A book about advanced SQL techniques.', 45.50, 4, 'images/sql_book.jpg', 200),
('Ergonomic Office Chair', 'A comfortable chair for long working hours.', 250.75, 4, 'images/chair.jpg', 75),
('Smart Coffee Maker', 'A WiFi-enabled coffee maker.', 79.99, 2, 'images/coffee_maker.jpg', 120);

-- 7. Asignar categorías a los productos
INSERT INTO "_ProductCategory" ("productId", "categoryId") VALUES
(1, 1), -- Laptop -> Electronics
(2, 2), -- SQL Book -> Books
(2, 4), -- SQL Book -> Office Supplies
(3, 3), -- Office Chair -> Home & Kitchen
(3, 4), -- Office Chair -> Office Supplies
(4, 1), -- Coffee Maker -> Electronics
(4, 3); -- Coffee Maker -> Home & Kitchen

-- 8. Crear órdenes de compra
INSERT INTO "order" ("userId", "totalPrice") VALUES
(3, 1279.99), -- John Smith compra la Laptop y la Cafetera (1200.00 + 79.99)
(2, 296.25);  -- Jane Doe compra el libro de SQL y la silla (45.50 + 250.75)

-- 9. Vincular productos a las órdenes
INSERT INTO "_OrderProduct" ("orderId", "productId") VALUES
(1, 1), -- Orden 1 contiene la Laptop
(1, 4), -- Orden 1 también contiene la Cafetera
(2, 2), -- Orden 2 contiene el libro de SQL
(2, 3); -- Orden 2 también contiene la Silla

-- 10. Generar facturas para las órdenes
INSERT INTO invoice ("orderId") VALUES
(1), -- Factura para la orden 1
(2); -- Factura para la orden 2

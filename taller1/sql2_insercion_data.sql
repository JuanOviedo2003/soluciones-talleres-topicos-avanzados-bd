/*INSERTS TO TABLES*/
/*EMPLOYEE*/
INSERT INTO employee
(employee_id, last_name, first_name, birth_date, hire_date, address, city, country, reports_to) VALUES
(1, 'Torres',  'Ana',   '1985-03-12', '2010-01-10', 'Calle 10 #23-45',      'Bogotá',       'Colombia', NULL),
(2, 'Perez',   'Juan',  '1990-06-25', '2015-04-02', 'Av. Las Américas 101', 'Medellín',     'Colombia', 1),
(3, 'Gomez',   'Luisa', '1988-11-04', '2014-07-20', 'Calle 50 #20-11',      'Cali',         'Colombia', 1),
(4, 'Ramirez', 'Carlos','1992-09-15', '2017-02-11', 'Cra 45 #15-33',        'Bucaramanga',  'Colombia', 2),
(5, 'Silva',   'Marta', '1987-01-22', '2012-09-05', 'Av. Oriental 120',     'Medellín',     'Colombia', 1),
(6, 'Lopez',   'Diego', '1995-08-17', '2020-03-03', 'Cra 9 #30-22',         'Bogotá',       'Colombia', 3),
(7, 'Martinez','Paola', '1983-10-05', '2009-06-15', 'Cl 72 #14-55',         'Bogotá',       'Colombia', 1),
(8, 'Castro',  'Felipe','1991-12-09', '2016-08-21', 'Cra 8 #50-10',         'Cali',         'Colombia', 2),
(9, 'Rojas',   'Sandra','1989-05-15', '2013-11-30', 'Cl 25 #5-19',          'Barranquilla', 'Colombia', 3),
(10,'Mejia',   'Andres','1993-07-29', '2018-05-12', 'Cl 11 #22-40',         'Cartagena',    'Colombia', 4),
(11,'Cano',    'Bruno', '1986-02-02', '2011-10-01', 'Cra 60 #100-10',       'Bogotá',       'Colombia', 1),
(12,'Vega',    'Sara',  '1994-04-18', '2021-01-09', 'Av Chile 90',          'Bogotá',       'Colombia', 2);

/*CUSTOMER*/
INSERT INTO customer
(customer_id, contact_name, company_name, contact_email, address, city, country) VALUES
(101, 'María López',   'Flores Ltda.',          'maria.lopez@flores.com',   'Calle 80 #45-12',   'Bogotá',      'Colombia'),
(102, 'Pedro Sánchez', 'Construcciones SAS',    'pedro@construcciones.com', 'Av. Caracas 150',   'Medellín',    'Colombia'),
(103, 'Sofía Herrera', 'Tecnologías del Sur',   'sofia@tecsur.com',         'Calle 13 #45-32',   'Cali',        'Colombia'),
(104, 'Andrés Díaz',   'Agroindustrias Norte',  'andres@agronorte.com',     'Carrera 15 #67-22', 'Barranquilla','Colombia'),
(105, 'Laura Torres',  'Papelería Express',     'laura@papel.com',          'Cra 12 #34-22',     'Bogotá',      'Colombia'),
(106, 'Miguel Romero', 'Alimentos del Valle',   'miguel@alivalle.com',      'Cl 25 #15-44',      'Cali',        'Colombia'),
(107, 'Camila Ruiz',   'Salud Total',           'camila@saludtotal.com',    'Cra 50 #12-60',     'Medellín',    'Colombia'),
(108, 'Ricardo Peña',  'ElectroHogar',          'ricardo@hogar.com',        'Cl 72 #33-12',      'Bogotá',      'Colombia'),
(109, 'Diana Cárdenas','Turismo Caribe',        'diana@caribe.com',         'Cl 60 #14-55',      'Cartagena',   'Colombia'),
(110, 'Fernando Vargas','Consultores SAS',      'fernando@consult.com',     'Av. Boyacá 200',    'Bogotá',      'Colombia'),
(111, 'Julián Mora',   'Textiles Andinos',      'julian@texan.com',         'Cl 23 #7-80',       'Medellín',    'Colombia'),
(112, 'Natalia Pardo', 'Frutales del Pacífico', 'natalia@frupac.com',       'Cra 20 #9-33',      'Cali',        'Colombia'),
(113, 'Erika León',    'Logística 24/7',        'erika@log247.com',         'Av 1 #100-20',      'Bogotá',      'Colombia'),
(114, 'Hugo Nieto',    'Hotel Mar Azul',        'hugo@marazul.com',         'Cl 10 #5-99',       'Cartagena',   'Colombia'),
(115, 'Paula Rincón',  'Café Sierra',           'paula@cafesierra.com',     'Cra 40 #55-10',     'Bogotá',      'Colombia'),
(116, 'Evan Turner',   'Volunteer Supplies',  'evan.turner@volsup.com',        '123 Cumberland Ave',     'Knoxville', 'USA'),
(117, 'Alicia Carter', 'Smoky Tech LLC',      'alicia.carter@smokytech.com',   '7428 Kingston Pike',     'Knoxville', 'USA'),
(118, 'Michael Johnson','River City Foods',   'michael.johnson@rcfoods.com',   '101 S Gay St',           'Knoxville', 'USA'),
(119, 'Marco Gutierrez','Delta Produce',      'marco@deltaproduce.com',        '55 W Weber Ave',         'Stockton',  'USA'),
(120, 'Samantha Lee',  'Portside Logistics',  'samantha.lee@portside-log.com', '300 E Main St',          'Stockton',  'USA'),
(121, 'Priya Patel',   'Valley Ag Services',  'priya.patel@valleyag.com',      '445 N El Dorado St',     'Stockton',  'USA');
/*CATEGORY*/
INSERT INTO category
(category_id, name, description, parent_category_id) VALUES
(1,  'Beverages',           'Juices, sodas, beers',                  NULL),
(2,  'Snacks',              'Packaged snacks',                       NULL),
(3,  'Dairy',               'Milk, cheese, yogurt',                  NULL),
(4,  'Craft Beer',          'Different beer styles',                 1),
(5,  'Bakery',              'Bread, cookies, cakes',                 NULL),
(6,  'Meat',                'Beef, chicken, pork',                   NULL),
(7,  'Fruits',              'Seasonal fresh fruits',                 NULL),
(8,  'Vegetables',          'Fresh and organic vegetables',          NULL),
(9,  'Candy',               'Sweets and chocolates',                 NULL),
(10, 'Frozen',              'Ready-to-eat frozen food',              NULL),
(11, 'Coffee & Tea',        'Roasted coffee and tea leaves',         1),
(12, 'Water',               'Bottled still and sparkling water',     1);

/*PRODUCT*/
INSERT INTO product
(product_id, product_name, category_id, quantity_per_unit, unit_price, units_in_stock, discontinued) VALUES
(201, 'Orange Juice',       1,  1,     5.00, 120, false),
(202, 'Potato Chips',       2,  50,       2.50, 200, false),
(203, 'Fresh Cheese',       3,  250,    6.00,  50, false),
(204, 'IPA Craft Beer',     4,  330,  8.00,  80, false),
(205, 'Natural Yogurt',     3,  200,     3.50, 150, false),
(206, 'Whole Wheat Bread',  5,  500,     4.00, 100, false),
(207, 'Whole Chicken',      6,  1.5,   12.00,  40, false),
(208, 'Red Apple',          7,  1,       3.00,  70, false),
(209, 'Fresh Carrot',       8,  1,       2.00,  60, false),
(210, 'Dark Chocolate',     9,  100,      4.50,  90, false),
(211, 'Ground Coffee',     11,  250,      9.00,  55, false),
(212, 'Sparkling Water',   12,  500,  1.50, 180, false),
(215, 'Aged Cheddar',     3, 250, 15.00, 0, true),
(216, 'Gourmet Cream Cheese', 3, 200,  8.50, 0, true),
(217, 'Imported Blue Cheese', 3, 150, 12.75, 0, true);

/*PURCHASE*/
INSERT INTO purchase
(purchase_id, customer_id, employee_id, total_price, purchase_date, shipped_date, ship_address, ship_city, ship_country) VALUES
(1001, 101,  2,  24.50, '2024-07-15 10:00:00', '2024-07-17 12:00:00', 'Calle 80 #45-12',     'Bogotá',      'Colombia'),
(1002, 102,  3,  50.00, '2024-07-18 14:20:00', '2024-07-20 09:00:00', 'Av. Industriales 45', 'Medellín',    'Colombia'),
(1003, 103,  4,  13.00, '2024-07-20 09:10:00', '2024-07-21 16:00:00', 'Calle 13 #45-32',     'Cali',        'Colombia'),
(1004, 104,  2,  24.00, '2024-07-22 11:30:00', '2024-07-23 13:00:00', 'Carrera 15 #67-22',   'Barranquilla','Colombia'),
(1005, 105,  5,  33.50, '2024-07-25 15:00:00', '2024-07-27 10:30:00', 'Cra 12 #34-22',       'Bogotá',      'Colombia'),
(1006, 106,  6,  33.00, '2024-07-27 08:40:00', '2024-07-29 12:00:00', 'Cl 25 #15-44',        'Cali',        'Colombia'),
(1007, 107,  7,  20.00, '2024-07-29 17:50:00', '2024-07-31 09:10:00', 'Cra 50 #12-60',       'Medellín',    'Colombia'),
(1008, 108,  8,  59.00, '2024-07-30 13:05:00', '2024-08-01 08:00:00', 'Cl 72 #33-12',        'Bogotá',      'Colombia'),
(1009, 109,  9,  16.50, '2024-08-01 10:15:00', '2024-08-03 10:00:00', 'Cl 60 #14-55',        'Cartagena',   'Colombia'),
(1010, 110, 10,  44.00, '2024-08-03 12:25:00', '2024-08-05 12:00:00', 'Av. Boyacá 200',      'Bogotá',      'Colombia'),
(1011, 111, 11,  20.00, '2024-08-04 09:45:00', '2024-08-06 11:00:00', 'Cl 23 #7-80',         'Medellín',    'Colombia'),
(1012, 112, 12,  42.00, '2024-08-05 16:20:00', '2024-08-07 15:00:00', 'Cra 20 #9-33',        'Cali',        'Colombia');


/*PURCHASE_ITEM*/
INSERT INTO purchase_item
(purchase_id, product_id, unit_price, quantity) VALUES
-- 1001: 3x201 (15.00) + 2x202 (5.00) + 1x210 (4.50) = 24.50
(1001, 201, 5.00, 3),
(1001, 202, 2.50, 2),
(1001, 210, 4.50, 1),

-- 1002: 5x204 (40.00) + 4x202 (10.00) = 50.00
(1002, 204, 8.00, 5),
(1002, 202, 2.50, 4),

-- 1003: 2x205 (7.00) + 1x203 (6.00) = 13.00
(1003, 205, 3.50, 2),
(1003, 203, 6.00, 1),

-- 1004: 3x204 (24.00) = 24.00
(1004, 204, 8.00, 3),

-- 1005: 5x206 (20.00) + 3x210 (13.50) = 33.50
(1005, 206, 4.00, 5),
(1005, 210, 4.50, 3),

-- 1006: 2x207 (24.00) + 3x208 (9.00) = 33.00
(1006, 207, 12.00, 2),
(1006, 208, 3.00, 3),

-- 1007: 4x202 (10.00) + 5x209 (10.00) = 20.00
(1007, 202, 2.50, 4),
(1007, 209, 2.00, 5),

-- 1008: 4x204 (32.00) + 6x210 (27.00) = 59.00
(1008, 204, 8.00, 4),
(1008, 210, 4.50, 6),

-- 1009: 2x208 (6.00) + 3x205 (10.50) = 16.50
(1009, 208, 3.00, 2),
(1009, 205, 3.50, 3),

-- 1010: 4x203 (24.00) + 5x209 (10.00) + 2x201 (10.00) = 44.00
(1010, 203, 6.00, 4),
(1010, 209, 2.00, 5),
(1010, 201, 5.00, 2),

-- 1011: 2x206 (8.00) + 1x208 (3.00) + 2x210 (9.00) = 20.00
(1011, 206, 4.00, 2),
(1011, 208, 3.00, 1),
(1011, 210, 4.50, 2),

-- 1012: 2x204 (16.00) + 2x203 (12.00) + 4x205 (14.00) = 42.00
(1012, 204, 8.00, 2),
(1012, 203, 6.00, 2),
(1012, 205, 3.50, 4);


DROP TABLE IF EXISTS PURCHASE_ITEM;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS CATEGORY;
DROP TABLE IF EXISTS PURCHASE;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS EMPLOYEE;

CREATE TABLE IF NOT EXISTS EMPLOYEE (

	employee_id SERIAL PRIMARY KEY,
	last_name varchar(40) NOT NULL,
	first_name varchar(40) NOT NULL,
	birth_date date NULL,
	hire_date date NULL,
	address varchar(128) NULL,
	city varchar(30) NULL,
	country varchar(30) NULL,
	reports_to INT NULL,

	CONSTRAINT fk_employee_reports_to FOREIGN KEY (reports_to) REFERENCES EMPLOYEE (employee_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS CUSTOMER (

	customer_id SERIAL PRIMARY KEY,
	contact_name VARCHAR(30) NOT NULL,
	company_name VARCHAR(40) NULL,
	contact_email VARCHAR(128) NOT NULL,
	address VARCHAR(120) NULL,
	city VARCHAR(30) NULL,
	country VARCHAR(30) NULL

);

CREATE TABLE IF NOT EXISTS PURCHASE (

	purchase_id SERIAL PRIMARY KEY,
	customer_id INT,
	employee_id INT,
	total_price decimal(10,2) NOT NULL,
	purchase_date timestamp NULL,
	shipped_date timestamp NULL,
	ship_address VARCHAR(60) NULL,
	ship_city VARCHAR(15) NULL,
	ship_country VARCHAR(15) NULL,

	CONSTRAINT fk_customer_purchase FOREIGN KEY (customer_id) REFERENCES CUSTOMER (customer_id) on DELETE RESTRICT,
	CONSTRAINT fk_employee_purchase FOREIGN KEY (employee_id) REFERENCES EMPLOYEE (employee_id) on DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS CATEGORY (
	category_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	description TEXT NULL,
	parent_category_id int NULL, 

	CONSTRAINT fk_parent_category FOREIGN KEY (parent_category_id) REFERENCES CATEGORY (category_id) ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS PRODUCT (

	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(40) NOT NULL, 
	category_id INTEGER NOT NULL,
	quantity_per_unit INT NULL,
	unit_price decimal(10,2) NULL,
	units_in_stock INT NULL,
	discontinued boolean NULL,

	CONSTRAINT fk_category_product FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS PURCHASE_ITEM(

	purchase_id int NOT NULL,
	product_id int NOT NULL,
	unit_price decimal(10, 2) NOT NULL,
	quantity int NOT NULL,
	CONSTRAINT pk_purchase_product PRIMARY KEY (purchase_id, product_id),
	CONSTRAINT fk_purchase_product FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
	CONSTRAINT fk_purchase FOREIGN KEY (purchase_id) REFERENCES PURCHASE(purchase_id)
);


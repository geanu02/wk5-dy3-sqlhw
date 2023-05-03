CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(75),
	last_name VARCHAR(75),
	address VARCHAR(255),
	billing_info VARCHAR(255),
	email VARCHAR(255) NOT NULL
);

CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	order_date_placed DATE,
	order_shipped DATE,
	shipping_method VARCHAR(100),
	tracking_number VARCHAR(50) UNIQUE,
	total_price DECIMAL(8,2),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(150),
	price DECIMAL(8,2),
	description VARCHAR(250)
);

CREATE TABLE order_products(
	id SERIAL PRIMARY KEY,
	order_id int,
	product_id int,
	FOREIGN KEY(order_id) REFERENCES orders(order_id),
	FOREIGN KEY(product_id) REFERENCES products(product_id)
);

CREATE TABLE inventory(
	inventory_id SERIAL PRIMARY KEY,
	stock_quantity int,
	expiration_date date,
	product_id int,
	FOREIGN KEY(product_id) REFERENCES products(product_id)
);


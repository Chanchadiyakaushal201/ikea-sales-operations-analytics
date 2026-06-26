-- IKEA India Sales & Operations Analytics
-- Create tables for cleaned datasets

DROP TABLE IF EXISTS returns;
DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

--- customers ---

CREATE TABLE customers(
	customer_id VARCHAR(20) PRIMARY KEY, 
	customer_name VARCHAR(100),
	gender VARCHAR(20),
	age INT,
	age_group VARCHAR(20),
	city VARCHAR(50),
	state VARCHAR(50),
	membership_type VARCHAR(30),
	join_date DATE
);

--- products ---

CREATE TABLE products (
	product_id VARCHAR(20) PRIMARY KEY,
	product_name VARCHAR(100),
	category VARCHAR(50),
	sub_category VARCHAR(50),
	mrp NUMERIC(10, 2),
	cost NUMERIC(10, 2),
	supplier VARCHAR(100),
	stock_on_hand INT
);

--- orders ---

CREATE TABLE orders(
	order_id VARCHAR(20) PRIMARY KEY,
	order_date DATE,
	customer_id VARCHAR(20),
	product_id VARCHAR(20),
	quantity INT,
	sales_amount NUMERIC(12, 2),
	discount NUMERIC(6,2),
	payment_method VARCHAR(50),
	order_status VARCHAR(30),
	CONSTRAINT fk_orders_cust FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	CONSTRAINT fk_orders_prod FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--- deliveries ---

CREATE TABLE deliveries(
	delivery_id VARCHAR(20) PRIMARY KEY,
	order_id VARCHAR(20),
	dispatch_date DATE,
	delivery_date DATE,
	carrier VARCHAR(50),
	delivery_status VARCHAR(30),
	CONSTRAINT fk_deliveries_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

--- returns ---

CREATE TABLE returns(
	return_iD VARCHAR(20) PRIMARY KEY,
	order_iD VARCHAR(20),
	return_date DATE,
	return_reason VARCHAR(100),
	refund_amount NUMERIC(12, 2),
	CONSTRAINT fk_returns_order FOREIGN KEY (order_id) REFERENCES orders(order_id) 
);

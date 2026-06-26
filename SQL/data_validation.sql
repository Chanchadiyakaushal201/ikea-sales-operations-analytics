-- IKEA India Sales & Operations Analytics
-- Data Validation Check

-- Row Count Validation ---

SELECT 'customers' AS table_name, COUNT(*) AS row_count
FROM customers; 

SELECT 'products' AS table_name, COUNT(*) AS row_count
FROM products;

SELECT 'orders' AS table_name, COUNT(*) AS row_count
FROM orders;

SELECT 'deliveries' AS table_name, COUNT(*) AS row_count
FROM deliveries;

SELECT 'returns' AS table_name, COUNT(*) AS row_count
FROM returns;

--- Data Check ---

SELECT * FROM customers
LIMIT 5;

SELECT * FROM products 
LIMIT 5;

SELECT * FROM orders 
LIMIT 5;

SELECT * FROM deliveries 
LIMIT 5;

SELECT * FROM returns 
LIMIT 5;

--- Check city-state mismatches ---

SELECT city, state, COUNT(*) AS customer_count
FROM customers
GROUP BY city, state
ORDER BY city, state;

-- Fix city-state mismatches

UPDATE customers SET state = 'Gujarat' WHERE city = 'Ahmedabad' AND state = 'Delhi';
UPDATE customers SET state = 'Karnataka' WHERE city = 'Bangalore' AND state = 'West Bengal';
UPDATE customers SET state = 'Tamil Nadu' WHERE city = 'Chennai' AND state = 'Rajasthan';
UPDATE customers SET state = 'Delhi' WHERE city = 'Delhi' AND state = 'Telangana';
UPDATE customers SET state = 'Rajasthan' WHERE city = 'Jaipur' AND state = 'Tamil Nadu';
UPDATE customers SET state = 'Maharashtra' WHERE city = 'Pune' AND state = 'Gujarat';


--- Orders with Missing Customers ---

Select *
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

--- Orders with Missing Products ---

SELECT *
FROM orders AS o
LEFT JOIN products AS p
ON o.product_id = p.product_id
WHERE p.product_id IS NULL; 

--- Deliveries with Missing Orders ---

SELECT *
FROM deliveries AS d
LEFT JOIN orders AS o
ON d.order_id = o.order_id
WHERE o.order_id IS NULL;

--- Returns with Missing Orders ---

SELECT *
FROM returns AS r
LEFT JOIN orders AS o
ON r.order_id = o.order_id
WHERE o.order_id IS NULL;

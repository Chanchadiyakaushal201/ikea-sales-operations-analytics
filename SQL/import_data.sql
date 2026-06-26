-- IKEA India Sales & Operations Analytics
-- Import Data 

--- customers ---

COPY customers (customer_id,customer_name,gender,age,age_group,city,state,membership_type,join_date)
FROM 'D:\Data Analytics\Projects\IKEA_Sales_Operation_Analysis\Data\cleaned\customers_cleaned.csv'
DELIMITER ','
CSV HEADER;

--- products ---

COPY products (product_id,product_name,category,sub_category,mrp,cost,supplier,stock_on_hand)
FROM 'D:\Data Analytics\Projects\IKEA_Sales_Operation_Analysis\Data\cleaned\products_cleaned.csv'
DELIMITER ','
CSV HEADER;

--- orders ---

COPY orders (order_id,order_date,customer_id,product_id,quantity,sales_amount,discount,payment_method,order_status)
FROM 'D:\Data Analytics\Projects\IKEA_Sales_Operation_Analysis\Data\cleaned\orders_cleaned.csv'
DELIMITER ','
CSV HEADER;

--- deliveries ---

COPY deliveries (delivery_id,order_id,dispatch_date,delivery_date,carrier,delivery_status)
FROM 'D:\Data Analytics\Projects\IKEA_Sales_Operation_Analysis\Data\cleaned\deliveries_cleaned.csv'
DELIMITER ','
CSV HEADER;

--- returns ---

COPY returns (return_id,order_id,return_date,return_reason,refund_amount)
FROM 'D:\Data Analytics\Projects\IKEA_Sales_Operation_Analysis\Data\cleaned\returns_cleaned.csv'
DELIMITER ','
CSV HEADER;

---





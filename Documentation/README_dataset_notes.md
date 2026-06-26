# IKEA India Sales & Operations Analytics - Final Raw Dataset

This is a synthetic beginner-friendly dataset for an end-to-end Data Analyst portfolio project.

## Files and Columns

### customers.csv
Customer_ID, Customer_Name, Gender, Age, Age_Group, City, State, Membership_Type, Join_Date

### products.csv
Product_ID, Product_Name, Category, Sub_Category, MRP, Cost, Supplier, Stock_On_Hand

### orders.csv
Order_ID, Order_Date, Customer_ID, Product_ID, Quantity, Sales_Amount, Discount, Payment_Method, Order_Status

### deliveries.csv
Delivery_ID, Order_ID, Dispatch_Date, Delivery_Date, Carrier, Delivery_Status

### returns.csv
Return_ID, Order_ID, Return_Date, Return_Reason, Refund_Amount

## Data Period
2024-01-01 to 2025-12-31

## Intentional Cleaning Issues Included

### customers.csv
- Duplicate customer rows
- Missing City/State values
- Inconsistent city names such as Mumbai/mumbai, Bangalore/Bengaluru, Ahmedabad/Ahemdabad
- Extra spaces in some customer names

### products.csv
- Missing Supplier values
- Negative Stock_On_Hand values
- Product name case/spacing inconsistencies
- A few high stock values for outlier detection

### orders.csv
- Missing Payment_Method values
- Duplicate order rows
- Order_Date stored as text in CSV format
- A few Discount values above 100 percent

### deliveries.csv
- Missing Delivery_Date values
- Carrier name inconsistencies such as Blue Dart/BlueDart/blue dart

### returns.csv
- Missing Return_Reason values

## Not Included
- No invalid Customer_ID values
- No invalid Product_ID values
- No cross-table validation problems
- No complex business-rule validation problems

## Suggested Workflow
1. Excel: quick profiling, missing value check, duplicate check, data dictionary
2. SQL: import tables and answer business questions
3. Python: clean, validate, perform EDA and visualizations
4. Power BI: create dashboard pages for executive, customer, operations, and inventory/returns analysis

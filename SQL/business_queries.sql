-- IKEA India Sales & Operations Analytics
-- Business Analysis Queries

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM deliveries;
SELECT * FROM returns;

-- Q1 : What are the overall sales KPIs?

-- Concept Used : COUNT(), SUM(), Aggregate Functions, WHERE Filter

SELECT COUNT(order_id) AS total_order,
	   SUM(quantity) AS total_qty_sold,
	   ROUND(SUM(sales_amount), 2) AS total_revenue
FROM orders
WHERE order_status = 'Completed';

/*
Insight :
- IKEA India completed 4,109 successful orders during the analysis period.
- A total of 7,953 units were sold across all completed transactions.
- Completed orders generated ₹157.68M in revenue.
- Excluding returned and cancelled orders provides a more accurate view of actual business performance.
- The business maintained a strong sales volume while generating significant revenue from completed transactions.
*/

-- Q2 : Which product categories generate the highest revenue?

-- Concept Used : SUM(), JOIN, GROUP BY, ORDER BY

SELECT p.category,
       ROUND(SUM(o.sales_amount), 2) AS total_revenue
FROM orders AS o
JOIN products AS p
ON o.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY total_revenue DESC;

/*
Insight :
- Living Room products generated the highest revenue at ₹22.27M.
- Lighting and Kids Furniture were also major revenue contributors, generating over ₹18M each.
- Kitchen and Dining generated the lowest revenue, indicating potential opportunities for product expansion or targeted promotions.
- Revenue concentration in a few categories suggests that customer demand is strongest in home furnishing and lighting products.
*/

-- Q3 : Which cities generate the highest revenue?

-- Concept Used : SUM(), JOIN, WHERE Filter, GROUP BY, ORDER BY 

SELECT c.city,
	   ROUND(SUM(o.sales_amount), 2) AS total_revenue
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE c.city <> 'Unknown' AND o.order_status = 'Completed'
GROUP BY c.city
ORDER BY total_revenue DESC;

/*
Insight :
- Jaipur generated the highest revenue at ₹20.13M, making it the strongest-performing city.
- Bangalore closely followed with ₹19.46M in revenue.
- Chennai, Delhi, and Hyderabad also contributed significantly, each generating over ₹15M.
- Revenue distribution across multiple cities indicates a geographically diversified customer base.
- The top-performing cities represent key markets where targeted marketing and inventory planning could further drive growth.
*/

-- Q4 : Which membership type generates the highest revenue?

-- Concept Used : SUM(), JOIN, WHERE Filter, GROUP BY, ORDER BY 

SELECT c.membership_type, 
	   ROUND(SUM(o.sales_amount), 2) AS total_revenue
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.membership_type
ORDER by total_revenue DESC;

/*
Insight:
- Business members generated the highest revenue at ₹43.32M.
- Regular members contributed ₹40.98M, making them the second-largest revenue segment.
- Family and Premium memberships generated ₹37.93M and ₹35.46M respectively.
- Revenue contribution is relatively balanced across membership types, indicating broad customer engagement.
- Business and Regular members represent the most valuable customer segments for revenue generation and retention initiatives.
*/

-- Q5 : Which Age Group Generates the Highest Revenue?

-- Concept Used : SUM(), JOIN, WHERE Filter, GROUP BY, ORDER BY 

SELECT c.age_group, 
	   ROUND(SUM(o.sales_amount), 2) AS total_revenue
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.age_group
ORDER by total_revenue DESC;

/*
Insight:
- Customers aged 56+ generated the highest revenue at ₹37.12M.
- The 26–35 age group was the second-largest contributor with ₹34.32M in revenue.
- Revenue contribution remained relatively strong across the 26–55 age segments.
- Customers aged 18–25 generated the lowest revenue among all age groups.
- Older customer segments appear to have higher purchasing power and contribute significantly to overall sales performance.
*/

-- Q6 : Which products generate the highest revenue?

-- Concept Used : SUM(), CTE, DENSE_RANK(), JOIN, Window Function 

WITH product_rank AS (
	SELECT p.product_name,
		   ROUND(SUM(o.sales_amount), 2) AS total_revenue,
		   DENSE_RANK() OVER(ORDER BY SUM(o.sales_amount) DESC) AS revenue_rank
	FROM products AS p
	JOIN orders AS o
	ON p.product_id = o.product_id
	WHERE o.order_status = 'Completed'
	GROUP BY p.product_name
)
SELECT revenue_rank,
	   product_name, 
	   total_revenue
FROM product_rank
WHERE revenue_rank <= 10
ORDER BY total_revenue DESC;

/*
Insight:
- VIMLE Wardrobes generated the highest revenue at ₹4.68M, making it the top-performing product.
- LINNMON TV Units and LACK Outdoor Chairs were also strong revenue contributors, each generating more than ₹3.75M.
- Multiple TV Unit products appear among the top performers, indicating strong customer demand for living room entertainment furniture.
- Outdoor furniture products such as LACK Outdoor Chairs and HEMNES Outdoor Tables also contributed significantly to revenue.
- Revenue is concentrated among a relatively small group of products, suggesting these items are key drivers of business performance.	
*/

-- Q7 : Which Customers Generate the Highest Revenue?

-- Concept Used : SUM(), CTE, DENSE_RANK, JOIN, Window Funation

WITH customer_rank AS (
	SELECT c.customer_name,
		   ROUND(SUM(o.sales_amount), 2) AS total_revenue,
		   DENSE_RANK() OVER(ORDER BY SUM(o.sales_amount) DESC) AS revenue_rank
	FROM customers AS c
	JOIN orders AS o
	ON c.customer_id = o.customer_id
	WHERE o.order_status = 'Completed'
	GROUP BY c.customer_name
)
SELECT revenue_rank,
	   customer_name,
	   total_revenue
FROM customer_rank
WHERE revenue_rank <= 10
ORDER BY total_revenue DESC;

/*
Insight:
- Depali Singh was the highest revenue-generating customer, contributing over ₹1.00M in completed sales.
- Rahul Singh and Kavya Sharma were also among the top revenue contributors, generating nearly ₹1M and ₹0.84M respectively.
- The top 10 customers each contributed more than ₹0.70M in revenue.
- Revenue is concentrated among a relatively small group of high-value customers.
- Identifying and retaining these customers can significantly impact overall business performance and profitability.
*/

-- Q8 : What is the average order value by city?

-- Concept Used : SUM(), COUNT(), AVG(), CTE, JOIN, GROUP BY

WITH city_aov AS (
	SELECT c.city,
		   COUNT(o.order_id) AS total_orders,
		   ROUND(SUM(o.sales_amount), 2) AS total_revenue,
		   ROUND(AVG(o.sales_amount), 2) AS avg_order_value
	FROM customers AS c
	JOIN orders AS o
	ON c.customer_id = o.customer_id
	WHERE o.order_status = 'Completed'
	GROUP BY c.city
)
SELECT city,
	   total_orders,
	   total_revenue,
	   avg_order_value
FROM city_aov
WHERE city <> 'Unknown'
ORDER BY avg_order_value DESC;

/*
Insight:
- Chennai recorded the highest Average Order Value (AOV) at ₹43,003.77 per order.
- Ahmedabad ranked second with an AOV of ₹40,196.05 despite generating lower total revenue than larger cities.
- Jaipur generated the highest overall revenue while maintaining a strong AOV of ₹38,941.99.
- Differences in AOV suggest varying customer purchasing behavior across cities.
- High-AOV cities may present opportunities for premium product offerings and targeted upselling strategies.
*/

-- Q9 : What is the return rate by category?

-- Concept Used : COUNT(), CTE, LEFT JOIN, Type Casting (::NUMERIC), Percentage Calculation

WITH category_returns AS (
	SELECT p.category,
		   COUNT(DISTINCT o.order_id) AS total_orders,
		   COUNT(DISTINCT r.order_id) AS returned_orders
	FROM products AS p
	JOIN orders AS o
	ON p.product_id = o.product_id
	LEFT JOIN returns AS r
	ON o.order_id = r.order_id
	GROUP BY p.category	
)
SELECT category,
	   total_orders,
	   returned_orders,
	   ROUND((returned_orders::NUMERIC / total_orders) * 100, 2) AS return_rate_pct
FROM category_returns
ORDER BY return_rate_pct DESC;

/*
Insight:
- Storage recorded the highest return rate at 9.76%.
- Dining and Kitchen categories also showed relatively high return levels.
- Living Room products had the lowest return rate at 6.13%.
- Categories with elevated return rates should be investigated for quality, sizing, assembly, or customer expectation issues.
- Return behavior varies across categories, highlighting opportunities for category-specific improvements.
*/

-- Q10 : Which return reasons occur most frequently?

-- Concept Used : COUNT(), CTE, DENSE_RANK, Window Function, GROUP BY 

WITH return_reason_rank AS (
	SELECT return_reason,
		   COUNT(return_id) AS total_returns,
		   DENSE_RANK() OVER(ORDER BY COUNT(return_id) DESC) AS reason_rank
	FROM returns
	GROUP BY return_reason
)  
SELECT reason_rank,
	   return_reason,
	   total_returns
FROM return_reason_rank
WHERE return_reason <> 'Not Specified'
ORDER BY total_returns DESC;

/*
Insight:
- Quality Issue and Damaged products were the most common return reasons, each accounting for 88 returns.
- Wrong Item and Late Delivery were also significant contributors to product returns.
- Most returns were concentrated among operational and product-quality related issues.
- Reducing product defects and shipping damage could significantly lower overall return volume.
*/

-- Q11 : What is the monthly revenue trend?

-- Concept Used : DATE_TRUNC(), COUNT(), SUM(), CTE, GROUP BY

WITH monthly_revenue AS (
	SELECT DATE_TRUNC('month', order_date)::DATE AS order_month,
		   COUNT(order_id) AS total_orders,
		   ROUND(SUM(sales_amount), 2) AS total_revenue
	FROM orders
	WHERE order_status = 'Completed' 
	GROUP BY DATE_TRUNC('month', order_date)
)
SELECT order_month,
	   total_orders,
	   total_revenue
FROM monthly_revenue
ORDER BY order_month;

/*
Insight:
- Monthly revenue remained relatively stable throughout the two-year period, ranging between approximately ₹5.6M and ₹7.9M.
- January 2024 recorded the highest monthly revenue at ₹7.97M.
- September 2024 generated the lowest revenue at ₹5.87M.
- Revenue recovered strongly in late 2025, with December 2025 reaching ₹7.37M.
- The business demonstrated consistent sales performance without extreme seasonal fluctuations.
*/

-- Q12 : Which Months Experienced the Highest Sales Growth?

-- Concept Used : DATE_TRUNC(), SUM(), CTE, LAG, Window Function, Growth Calculation

WITH monthly_revenue AS (
	SELECT DATE_TRUNC('month', order_date) AS order_month,
		   ROUND(SUM(sales_amount), 2) AS total_revenue
	FROM orders
	WHERE order_status = 'Completed'
	GROUP BY DATE_TRUNC('month', order_date)
),
revenue_with_lag AS (
	SELECT order_month,
		   total_revenue,
		   LAG(total_revenue) OVER(ORDER BY order_month) AS prev_month_revenue
	FROM monthly_revenue
)
SELECT TO_CHAR(order_month, 'FMMonth YYYY') AS month_name,
	   total_revenue,
	   prev_month_revenue,
	   ROUND((total_revenue - prev_month_revenue) / prev_month_revenue * 100, 2) AS growth_pct
FROM revenue_with_lag
WHERE prev_month_revenue IS NOT NULL
ORDER BY growth_pct DESC;

/*
Insight:
- July 2025 recorded the highest month-over-month sales growth at 33.44%.
- November 2025 and October 2024 also experienced strong growth, exceeding 17%.
- January 2025 showed a healthy recovery with 15.90% growth compared to the previous month.
- February 2024 experienced the largest decline at -19.85%.
- The strongest growth periods occurred primarily in late 2024 and 2025, suggesting successful sales performance during those periods.
- Growth analysis helps identify strong sales recovery months and periods that may need deeper investigation.
*/

-- Q13 : What is the Running Revenue Over Time?

-- Concept Used : DATE_TRUNC(), SUM(), CTE, Running Total, Window Function

WITH monthly_revenue AS (
	SELECT DATE_TRUNC('month', order_date) AS order_month,
		   ROUND(SUM(sales_amount), 2) AS total_revenue
	FROM orders
	WHERE order_status = 'Completed'
	GROUP BY DATE_TRUNC('month', order_date)
)
SELECT TO_CHAR(order_month, 'FMMonth YYYY') AS month_name,
	   total_revenue,
	   SUM(total_revenue) OVER(ORDER BY order_month) AS running_revenue
FROM monthly_revenue
ORDER BY order_month;

/*
Insight:
- Running revenue increased steadily throughout the analysis period, reaching ₹157.68M by December 2025.
- The business crossed ₹79.18M in cumulative revenue by the end of 2024.
- Revenue growth remained consistent across both years, indicating stable sales performance.
- No prolonged periods of revenue stagnation were observed, demonstrating sustained business growth.
- The cumulative revenue trend highlights the company's ability to generate long-term value through continuous sales activity.
*/

-- Q14 : How can customers be segmented based on revenue contribution?

-- Concept Used : SUM(), CTE, CASE, GROUP BY, Business Rules

WITH customer_revenue_tiers AS (
	SELECT c.customer_id,
		   ROUND(SUM(o.sales_amount), 2) AS total_revenue,
		   CASE
		   	   WHEN SUM(o.sales_amount) >= 800000 THEN 'High Value'
			   WHEN SUM(o.sales_amount) >= 300000 THEN 'Medium Value'
			   ELSE 'Low Value'
		   END AS customer_segment
	FROM customers AS c
	JOIN orders AS o
	ON c.customer_id = o.customer_id 
	WHERE o.order_status = 'Completed'
	GROUP BY c.customer_id
)
SELECT customer_segment,
	   COUNT(customer_id) AS customer_count,
	   ROUND(SUM(total_revenue), 2) AS segment_revenue
FROM customer_revenue_tiers
GROUP BY customer_segment
ORDER BY segment_revenue DESC;

/*
Insight:
- Medium Value customers generated the highest revenue contribution at ₹101.99M.
- Low Value customers formed the largest customer group with 264 customers, but generated lower revenue per customer.
- Only 3 customers qualified as High Value customers, indicating a very small premium customer base.
- The Medium Value segment represents the strongest opportunity for upselling and retention campaigns.
- Customer segmentation helps prioritize marketing strategies based on revenue contribution.
*/

/*
Note:
Customer segments were created using custom revenue thresholds and are intended for analytical purposes. Thresholds may vary across organizations based on business objectives and customer spending patterns.
*/

-- Q15 : What is the RFM Analysis of customers?

-- Concept Used : DATE Arithmetic, COUNT(DISTINCT), SUM(), CTE, NTILE(), CASE, Window Function, RFM Analysis

WITH customer_rfm_base AS (
	SELECT customer_id,
		   ('2025-12-31':: DATE - MAX(order_date):: DATE) AS recency_days,
		   COUNT(DISTINCT order_id) AS frequency_count,
		   ROUND(SUM(sales_amount), 2) AS monetary_value
	FROM orders 
	WHERE order_status = 'Completed'
	GROUP BY customer_id
),
rfm_scores AS (
	SELECT *,
		   NTILE(5) OVER (ORDER BY recency_days DESC) AS r_score,
		   NTILE(5) OVER (ORDER BY frequency_count ASC) AS f_score,
		   NTILE(5) OVER (ORDER BY monetary_value ASC) AS m_score
	FROM customer_rfm_base
),
rfm_combined AS (
	SELECT *,
		   ROUND((r_score + f_score + m_score) / 3, 1) AS rfm_avg_score
	FROM rfm_scores
)
SELECT *,
	   CASE
	   	   WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
		   WHEN r_score >= 3 AND f_score >= 3 AND m_score >= 3 THEN 'Loyal Customer'
		   WHEN r_score >= 4 AND f_score = 1 THEN 'New customer'
		   WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
		   WHEN r_score <= 2 AND f_score <= 2 THEN 'Lost'
		   ELSE 'Regular Customer'
	   END AS customer_segment
FROM rfm_combined
ORDER BY rfm_avg_score DESC,  monetary_value DESC;

/*
Insight:
- RFM analysis segmented customers based on recency, frequency, and monetary value.
- Champion customers purchased recently, ordered frequently, and generated high revenue.
- Loyal customers showed strong repeat purchase behavior and should be targeted for retention campaigns.
- At-risk and lost customers can be targeted with reactivation offers to improve repeat purchases.
- RFM segmentation provides a data-driven approach for customer marketing, retention, and loyalty strategy.
*/
	


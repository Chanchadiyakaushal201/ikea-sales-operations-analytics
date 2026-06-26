# 🛋️ IKEA India Sales & Operations Analytics Dashboard

An end-to-end Data Analytics portfolio project demonstrating the complete analytics workflow—from raw data cleaning to interactive business intelligence dashboards using Excel, Python, SQL, and Power BI.

---

# 📌 Project Overview

The **IKEA India Sales & Operations Analytics Dashboard** is a complete business intelligence solution designed to analyze sales performance, operational efficiency, supply chain risks, and customer behavior.

This project simulates a real-world retail analytics scenario where data from multiple business functions is transformed into meaningful insights for decision-makers.

The project follows an end-to-end analytics pipeline:

**Raw Data → Excel → Python → PostgreSQL → Power BI**

The dashboard enables stakeholders to monitor key performance indicators, identify operational risks, evaluate customer segments, and support strategic business decisions.

---

## 🚀 Project Highlights

- 📊 3 Interactive Power BI Dashboard Pages
- 🐍 Data Cleaning & EDA using Python
- 🗄️ PostgreSQL Database with 15+ Business Queries
- 📈 40+ DAX Measures with Time Intelligence
- 👥 RFM Customer Segmentation
- 🚚 Supply Chain & Inventory Risk Analysis
- 🎨 IKEA-inspired Dashboard Design

---

# 🎯 Business Objective

The primary objective of this project is to help business managers answer questions such as:

* How is overall revenue and profit performing?
* Which products and categories generate the highest revenue?
* Which operational factors impact returns?
* Which inventory categories are at high risk?
* Which customers are the most valuable?
* How are different customer segments performing?
* Which regions contribute the most revenue?
* What actions can improve operational efficiency and customer retention?

---

## 💼 Business Value

This dashboard helps management:

* Monitor sales performance

* Identify operational bottlenecks

* Reduce return losses

* Improve inventory planning

* Understand customer behaviour

* Support strategic business decisions

---

# 🛠️ Tools & Technologies

| Tool                               | Purpose                                    |
| ---------------------------------- | ------------------------------------------ |
| Microsoft Excel                    | Data Understanding & Initial Validation    |
| Python (Pandas, NumPy, Matplotlib) | Data Cleaning & Exploratory Data Analysis  |
| PostgreSQL                         | Data Storage & Business SQL Queries        |
| Power BI Desktop                   | Data Modeling, DAX & Dashboard Development |
| DAX                                | KPI & Business Calculations                |
| GitHub                             | Portfolio                                  |

---

# 📂 Dataset Information

The project uses five interconnected retail datasets representing IKEA India's sales and operations.

| Dataset | Description |
|----------|-------------|
| Customers | Customer demographics, membership type, city, state and age group |
| Orders | Sales transactions, quantities, payment methods and order status |
| Products | Product catalog, categories, suppliers, cost, MRP and inventory |
| Deliveries | Dispatch dates, delivery dates, carrier information and delivery status |
| Returns | Returned orders, refund amount and return reasons |

### Dataset Summary

| Dataset | Records |
|---------|--------:|
| Customers | 500 |
| Orders | 5,000 |
| Products | 100 |
| Deliveries | 5,000 |
| Returns | 400 |

---

# 📂 Project Pipeline

## 1️⃣ Data Collection

Five datasets were used:

* Customers
* Products
* Orders
* Deliveries
* Returns

---

## 2️⃣ Excel

Performed:

* Data Understanding
* Data Dictionary
* Data Quality Assessment
* Basic KPI Validation
* Initial Business Review

---

## 3️⃣ Python

Performed:

### Data Cleaning

* Removed duplicates
* Handled missing values
* Standardized text values
* Corrected city/state inconsistencies
* Converted data types
* Outlier detection
* Business rule validation

### Exploratory Data Analysis

Performed analysis including:

* Revenue by Category
* Revenue by City
* Revenue by Membership Type
* Revenue by Age Group
* Payment Method Analysis
* Top Products
* Supplier Performance
* Inventory Risk
* Delivery vs Returns
* Return Factors

---

## 4️⃣ PostgreSQL

Designed relational database consisting of:

* Customers
* Products
* Orders
* Deliveries
* Returns

Performed:

* Database Creation
* Data Import
* Relationship Validation
* Data Quality Validation

Business SQL Queries Included:

* Revenue KPIs
* Revenue by Category
* Revenue by City
* Revenue by Membership
* Revenue by Age Group
* Top Products
* Top Customers
* Average Order Value
* Return Rate
* Return Reasons
* Monthly Revenue Trend
* Revenue Growth
* Running Revenue
* Customer Segmentation
* RFM Preparation

---

## 5️⃣ Power BI

Created interactive dashboard with professional IKEA-inspired UI.

### Data Model

* Star Schema
* Calendar Table
* Optimized Relationships
* Organized Measure Table

---

## DAX Measures

Developed measures including:

### Financial

* Total Revenue
* Total Profit
* Total Cost
* Profit Margin
* AOV

### Growth Metrics

* Revenue Growth %
* Profit Growth %
* Orders Growth %
* Customer Growth %
* Repeat Customer Growth %
* Return Growth %

### Operational

* Return Rate
* Refund Amount
* Average Delivery Days
* Inventory Risk Products

### Customer

* Repeat Customers
* Revenue per Customer
* Champion Customers
* Repeat Purchase Rate

### RFM Analysis

* Recency
* Frequency
* Monetary
* RFM Score
* Customer Segmentation

---

# 📊 Dashboard Pages

---

## 📈 Page 1 — Executive Overview

Focus:

Business Performance

KPIs

* Total Revenue
* Total Profit
* Profit Margin
* Total Orders
* Average Order Value

Visuals

* Revenue & Profit Trend
* Top Products
* Revenue by Category
* Top Cities
* Revenue by Payment Method

---

## 🚚 Page 2 — Operations & Risk

Focus:

Operational Performance & Supply Chain

KPIs

* Total Returns
* Return Rate
* Refund Amount
* Average Delivery Days
* Inventory Risk Products

Visuals

* Return Reason Breakdown
* Return Rate by Category
* Inventory Risk Analysis
* Refund Trend
* Carrier Performance Summary

---

## 👥 Page 3 — Customer Analytics

Focus:

Customer Behavior & Segmentation

KPIs

* Total Customers
* Repeat Customers
* Repeat Purchase Rate
* Revenue per Customer
* Champion Customers

Visuals

* RFM Segmentation
* Revenue by State & City
* Revenue by Gender
* Revenue by Membership
* Revenue by Age Group
* Top Customers

---

# 📈 Key Business Insights

* Revenue is concentrated within a few high-performing product categories.
* A small number of products contribute significantly to total sales.
* Return reasons are primarily driven by damaged and quality-related issues.
* Certain inventory categories require immediate stock optimization.
* Champion and Loyal customers contribute a substantial portion of total revenue.
* Business membership customers generate the highest revenue among membership types.
* Revenue distribution varies significantly across cities and states.
* Customer demographics provide opportunities for targeted marketing strategies.

---

# 📁 Repository Structure

```text
IKEA-Sales-Operations-Analytics/
│
├── data
│   ├── raw
│   └── clean
│
├── excel
│   └── IKEA_Data_Profiling.xlsx
│
├── notebook
│   └── IKEA_Data_Preparation_EDA.ipynb
│
├── sql
│   ├── create_tables.sql
│   ├── import_data.sql
│   ├── data_validation.sql
│   └── business_queries.sql
│
├── powerbi
│   └── IKEA_India_Analytics.pbix
│
├── images
│   ├── overview-dashboard.png
│   ├── operations-dashboard.png
│   ├── customer-dashboard.png
│   ├── powerbi-data-model.png
│   ├── postgresql-erd.png
│   ├── python-revenue-by-category.png
│   ├── python-return-analysis-heatmap.png
│   ├── customer-rfm-segmentation-query.png
│   ├── customer-rfm-segmentation-output.png
│   ├── monthly-sales-growth-query.png
│   └── monthly-sales-growth-output.png
│
├── assets
│   ├── banner.png
│   └── pipeline.png
│
└── README.md
```

---

# 🖼️ Dashboard & Analysis Preview

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Assets/banner.png" alt="Image Description" width="900">

---

## Project Pipeline

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Assets/pipeline.png" alt="Image Description" width="900">

---

## Executive Overview

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Images/overview-dashboard.png" alt="Image Description" width="900">

---

## Operations & Risk

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Images/operations-dashboard.png" alt="Image Description" width="900">

---

## Customer Analytics

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Images/customer-dashboard.png" alt="Image Description" width="900">

---

## Power BI Data Model

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Images/powerbi-data-model.png" alt="Image Description" width="900">

---

## Python EDA – Revenue by Product Category

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Images/python-revenue-by-category.png" alt="Image Description" width="900">

---

## Python EDA – Return Analysis Heatmap

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Images/python-return-analysis-heatmap.png" alt="Image Description" width="900">

---

## SQL – Customer RFM Segmentation (query + output)

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Images/customer-rfm-segmentation-query.png" alt="Image Description" width="900">

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Images/customer-rfm-segmentation-output.png" alt="Image Description" width="900">

---

## SQL – Monthly Sales Growth Analysis (query + output)

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Images/monthly-sales-growth-query.png" width="900">

<img src="https://github.com/Chanchadiyakaushal201/ikea-sales-operations-analytics/blob/dac46ab4069a2797bdf7751826e5fbf64d47c0ab/Images/monthly-sales-growth-output.png" alt="Image Description" width="900">

---

# 💡 Skills Demonstrated

* Data Cleaning
* Data Validation
* Data Modeling
* SQL Query Writing
* Business Analysis
* Data Visualization
* Dashboard Design
* KPI Development
* DAX
* Power Query
* RFM Customer Segmentation
* Time Intelligence
* Interactive Reporting
* Storytelling with Data

---

# 🚀 Future Enhancements

* Sales Forecasting using Prophet
* Customer Lifetime Value (CLV)
* Product Recommendation Analysis
* Inventory Demand Forecasting
* What-if Parameter Analysis
* AI-powered Insights

---

# 📄 License

This project is licensed under the **MIT License**, which permits reuse, modification, and distribution with proper attribution. See the [LICENSE](LICENSE) file for complete details.

---

# 👨‍💻 Author

**Kaushal Chanchadiya**

Aspiring Data Analyst passionate about transforming raw data into actionable business insights through analytics, visualization, and storytelling.

---

# 🔗 Connect with Me

Linkedin :

https://www.linkedin.com/in/kaushalchanchadiya162004/

---

# ⭐ If you found this project helpful

Please consider giving this repository a **Star ⭐** and feel free to share your feedback or suggestions.

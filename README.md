# 📊 E-Commerce Customer Segmentation & RFM Analytics

An end-to-end data analytics project leveraging *MySQL, **Python (Pandas), and **Power BI* to segment customers using the *RFM (Recency, Frequency, Monetary)* framework, analyze churn dynamics, and present actionable business insights.

---

## 📌 Project Overview
In modern e-commerce, retaining high-value customers and reducing churn are essential for maximizing Customer Lifetime Value (CLV). This project processes over *1.03 Million+ raw retail transactions*, cleans and structures the dataset in a relational database, applies Python-based statistical quantile scoring for customer segmentation, and visualizes KPIs in a 3-page interactive Power BI report.

### Key Metrics & Findings
* *Total Transactions Processed:* 1,033,036 rows
* *Total Customers Identified:* 5,882
* *Total Revenue Analyzed:* $20.32 Million
* *Overall Customer Churn Rate:* 50.35% (Inactivity > 90 days)
* *Average Customer Value:* $3,454

---

## 🛠️ Tech Stack & Tools
* *Database & Ingestion:* MySQL (Data Definition, Data Manipulation, Data Cleaning & Merging)
* *Data Processing & Analytics:* Python, Pandas, Jupyter Notebook
* *Data Visualization & Reporting:* Power BI
* *Spreadsheet Validation:* Microsoft Excel

---

## 🔄 Project Workflow & Methodology

┌─────────────────┐     ┌────────────────┐     ┌─────────────────────┐     ┌──────────────────────┐
│  Raw Data (CSV) │ ──> │ MySQL Pipeline │ ──> │ Python RFM Analysis │ ──> │ Interactive Power BI │
└─────────────────┘     └────────────────┘     └─────────────────────┘     └──────────────────────┘

### 1. Data Ingestion & SQL ETL Pipeline
* Ingested multi-part transactional datasets into MySQL Workbench.
* Handled schema setup, date formatting (STR_TO_DATE), and missing value conversions (NULLIF).
* Performed integrity checks: removed missing `CustomerID`s, filtered out negative/zero quantities, and resolved duplicate entries.
* Merged clean data tables using UNION ALL into online_retail_merged.

### 2. Python Data Transformation & RFM Modeling
* Analyzed transactional behavior against snapshot reference date (2011-12-10).
* Aggregated metrics per customer:
  * *Recency ($R$):* Days since last transaction.
  * *Frequency ($F$):* Total unique invoice count.
  * *Monetary ($M$):* Total spend aggregated ($Quantity \times Price$).
* Ranked metrics using Pandas pd.qcut into quartile scores ($1 \dots 4$).
* Grouped customers into strategic segments:
  * 🟢 *Champions:* High Recency, High Frequency, High Monetary
  * 🔵 *Loyal Customers:* Consistent purchase pattern
  * 🟡 *At Risk:* Decreasing recency but historical high spend
  * 🔴 *Lost / Churned Customers:* Inactive > 90 days

### 3. Business Intelligence & Dashboarding
Designed a *3-Page Interactive Power BI Dashboard*:
1. *Home Page:* Navigation hub and key analytics terminology definitions.
2. *Overview Dashboard:* Executive summary highlighting total revenue, total active customers, churn percentage, and region-wise revenue breakdown.
3. *RFM Deep-Dive Analysis:* Cohort analysis, segment distribution, and targeted retention recommendations.

---

## 📁 Repository Structure


├── data/                      # Sample datasets (or link to raw source)
├── sql/
│   └── data_cleaning_etl.sql  # SQL queries for table creation, cleaning & merging
├── python/
│   └── rfm_analysis.ipynb     # Jupyter Notebook with Pandas RFM pipeline
├── dashboard/
│   └── Customer_Analytics.pbix# Power BI Dashboard file
└── README.md                  # Project Documentation

---

## 🚀 How to Run / Replicate This Project

1. *Database Setup:* Run sql/data_cleaning_etl.sql in MySQL to initialize tables and import raw data.
2. *Execute Python Pipeline:* Run python/rfm_analysis.ipynb in Jupyter Notebook to generate clean output CSV with RFM scores (EcommerceDashboarddata.xlsx).
3. *Open Power BI Dashboard:* Load dashboard/Customer_Analytics.pbix to view interactive visuals.

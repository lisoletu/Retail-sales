-- Databricks notebook source
SELECT *
FROM retail.retail_sales.retail_sales_dataset
LIMIT 10;

DESCRIBE retail.retail_sales.retail_sales_dataset;

SELECT
    COUNT(*) AS row_count,
    COUNT(DISTINCT `Transaction ID`) AS unique_transactions,
    COUNT(DISTINCT `Customer ID`) AS unique_customers
FROM retail.retail_sales.retail_sales_dataset;

--checking missing values
SELECT
    COUNT(*) AS total_rows,
    COUNT(`Transaction ID`) AS transaction_id_count,
    COUNT(`Date`) AS date_count,
    COUNT(`Customer ID`) AS customer_id_count,
    COUNT(`Gender`) AS gender_count,
    COUNT(`Age`) AS age_count,
    COUNT(`Product Category`) AS category_count,
    COUNT(`Quantity`) AS quantity_count,
    COUNT(`Price per Unit`) AS price_count,
    COUNT(`Total Amount`) AS amount_count
FROM retail.retail_sales.retail_sales_dataset;

--checking negative values
SELECT *
FROM retail.retail_sales.retail_sales_dataset
WHERE Age < 0
   OR Quantity < 0
   OR `Price per Unit` < 0
   OR `Total Amount` < 0;

--checking sales, transactions, units sold for each category
SELECT
    `Product Category`,
    COUNT(*) AS transactions,
    SUM(Quantity) AS units_sold,
    SUM(`Total Amount`) AS total_sales
FROM retail.retail_sales.retail_sales_dataset
GROUP BY `Product Category`
ORDER BY total_sales DESC;

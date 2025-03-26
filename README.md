# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales 
**Level**: Beginner  
**Database**: `retail_p1`

This project is designed to demonstrate  mySQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This  first project is ideal data analysis and build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.

2. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
3. **Business Analysis**: Use MYSQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `retail_p1`.
- **Table Creation**: A table named `retail_p1` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE retail_p1;

CREATE TABLE retail_p1
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantiy INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM retail_p1;

SELECT COUNT(DISTINCT customer_id) FROM retail_p1;

SELECT DISTINCT category FROM retail_p1;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following MYSQL queries were developed to answer specific business questions:


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT *
FROM retail_sales
WHERE sale_date = '05-11-2022';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' 
--     and the quantity sold is more than 4 in the month of Nov-2022--

select *
FROM  retail_sales
WHERE category = 'clothing'
AND 
sale_date BETWEEN '01-11-2022' AND '30-11-2022'
AND 
quantiy >=4;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT 
      category,
      sum(total_sale) AS net_sale ,
      COUNT(*) AS total_orders
FROM retail_sales
GROUP BY 1;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT 
 ROUND(AVG(age),2) AS avg_age
 FROM retail_sales
 WHERE category='Beauty';
 
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * 
FROM retail_sales
WHERE total_sale > 100;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
       category,
        gender,
      COUNT(*) AS total_trans
 FROM retail_sales
 GROUP BY category,gender;
 
-- Q.7 Write a SQL query to find the top 5 customers based on the highest total sales  

 SELECT 
      customer_id,
	  SUM(total_sale) AS total_sales
FROM  retail_sales
GROUP BY customer_id 
ORDER BY total_sales
LIMIT 5;   

  
-- Q.8 Write a SQL query to find the number of unique customers who purchased items from each category.


SELECT 
      category, 
      COUNT(DISTINCT customer_id) AS unique_customers
FROM  retail_sales
GROUP BY category; 


 -- Q.9 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

 
 SELECT 
    CASE 
        WHEN HOUR(sale_time) <= 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 13 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS number_of_orders
FROM 
    retail_sales
GROUP BY 
    shift;
    
```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to mySQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven mySQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

This project is part of my portfolio, showcasing the mySQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate.



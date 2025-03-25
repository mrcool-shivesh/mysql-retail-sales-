CREATE DATABASE retail_p1;
USE retail_p1;
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
			);
   
-- Data Exploration--

-- How many sales we have?--
SELECT COUNT(*) as total_sale FROM retail_sales ; 

-- WHAT IS THE TOTAL PROFIT -- 
SELECT  SUM(total_sale) as total_profit  FROM retail_sales ; 

-- How many customers we have?--
SELECT COUNT(DISTINCT customer_id) as total_sales FROM  retail_sales;  

-- Data Analysis & Business Key Problem & Answers--
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.8 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.9 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

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


 -- END OF PROJECT--   
    

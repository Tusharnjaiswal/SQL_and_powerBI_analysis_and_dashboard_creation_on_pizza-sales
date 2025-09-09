-- Chart Requirements
-- Q1 Daily trend for Total orders?
SELECT TO_CHAR( order_date,'day') AS days , COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY TO_CHAR( order_date,'day')
ORDER BY  total_orders DESC

-- Q2 Monthly trend for Total_orders?
SELECT TO_CHAR( order_date,'month') AS months , COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY TO_CHAR(order_date,'month')
ORDER BY  total_orders DESC 

-- percentage of sales by pizza category?
SELECT pizza_category , ROUND(sum(total_price)::numeric *100 / (SELECT sum(total_price) FROM pizza_sales)::numeric,2)AS percent_sales 
FROM pizza_sales
GROUP BY pizza_category 
ORDER BY percent_sales DESC

--percentage of sales by pizza size?
SELECT pizza_size , ROUND(sum(total_price)::numeric *100 / (SELECT sum(total_price) FROM pizza_sales)::numeric,2)AS percent_sales 
FROM pizza_sales
GROUP BY pizza_size
ORDER BY percent_sales DESC

-- Top 5 pizza by revenue?
SELECT pizza_name , Sum(total_price) AS total_revenue
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY 2 DESC
LIMIT 5

--Bottom 5 pizza By revenue?
SELECT pizza_name , sum(total_price) AS total_revenue
FROM pizza_sales 
GROUP BY 1 
ORDER BY 2 
LIMIT 5

-- Top 5 pizza by quantity?
SELECT pizza_name , sum(quantity) AS total_quantity
FROM pizza_sales 
GROUP BY 1 
ORDER BY 2 DESC 
LIMIT 5

-- Bottom 5 pizza by quantity?
SELECT pizza_name , sum(quantity) AS total_quantity
FROM pizza_sales 
GROUP BY 1 
ORDER BY 2  
LIMIT 5
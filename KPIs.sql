--KPIs
--Q1 what is the total revenue?
SELECT ROUND(SUM(total_price)::numeric, 2) AS total_sales
FROM pizza_sales;

--what is AOV?
SELECT ROUND(SUM(total_price)::numeric / COUNT(DISTINCT order_id),2) AS AOV
FROM pizza_sales

-- Total pizza's sold?
SELECT SUM(quantity) AS Quantity_sold
FROM pizza_sales

-- Total orders placed?
SELECT COUNT(DISTINCT order_id) AS orders_placed
FROM pizza_sales

-- Average pizzas per order?
SELECT ROUND(SUM(quantity)::numeric / COUNT(DISTINCT order_id),2) AS Average_pizza_per_order
FROM pizza_sales
CREATE DATABASE sales_analysis;
USE sales_analysis;
CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);
SHOW TABLES;
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2024-01-05', 2500.00, 101),
(2, '2024-01-15', 1800.00, 102),
(3, '2024-02-10', 3200.00, 103),
(4, '2024-02-18', 1500.00, 104),
(5, '2024-03-02', 4000.00, 105),
(6, '2024-03-15', 2200.00, 106),
(7, '2024-03-20', 1700.00, 107);
SELECT * FROM online_sales;
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month
FROM online_sales;
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY year, month
ORDER BY year, month;
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 3;
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
WHERE EXTRACT(YEAR FROM order_date) = 2024
GROUP BY month
ORDER BY month;
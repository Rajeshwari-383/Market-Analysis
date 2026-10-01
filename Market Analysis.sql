show tables;

SELECT * FROM aisles LIMIT 10;
SELECT * FROM departments LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM order_products_train LIMIT 10;

DESCRIBE aisles;
DESCRIBE departments;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE order_products_train;

SELECT *
FROM orders
WHERE order_id = 1;
SELECT *
FROM order_products_train
WHERE order_id = 1;
SELECT *
FROM orders
WHERE order_id = 6;
SELECT *
FROM order_products_train
WHERE order_id = 6;

SELECT COUNT(*) AS total_aisles
FROM aisles;
SELECT COUNT(*) AS total_departments
FROM departments;
SELECT COUNT(*) AS total_products
FROM products;
SELECT COUNT(*) AS total_orders
FROM orders;
SELECT COUNT(*) AS total_order_products
FROM order_products_train;
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT product_id) AS unique_products
FROM order_products_train;

-- 1.	What are the top 10 aisles with the highest number of products?

SELECT a.aisle_id, a.aisle, COUNT(p.product_id) AS product_count
FROM products p
JOIN aisles a
    ON p.aisle_id = a.aisle_id
GROUP BY a.aisle_id, a.aisle
ORDER BY product_count DESC
LIMIT 10;

-- 2.	How many unique departments are there in the dataset?
SELECT
    department_id,
    department
FROM departments
ORDER BY department_id;

-- 3.	What is the distribution of products across departments?
SELECT
    d.department_id,
    d.department,
    COUNT(p.product_id) AS product_count
FROM products p
JOIN departments d
    ON p.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department
ORDER BY product_count DESC;

-- 4.	What are the top 10 products with the highest reorder rates?
SELECT
    p.product_id,
    p.product_name,
    COUNT(*) AS total_purchases,
    SUM(op.reordered) AS reordered_count,
    ROUND(SUM(op.reordered) / COUNT(*) * 100, 2) AS reorder_rate
FROM order_products_train op
JOIN products p
    ON op.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
HAVING COUNT(*) >= 10
ORDER BY reorder_rate DESC
LIMIT 10;

-- 5.	How many unique users have placed orders in the dataset?
SELECT COUNT(DISTINCT user_id) AS unique_users
FROM orders;

-- 6.	What is the average number of days between orders for each user?
SELECT
    user_id,
    ROUND(
        AVG(CAST(days_since_prior_order AS DECIMAL(10,2))),
        2
    ) AS avg_days_between_orders
FROM orders
WHERE days_since_prior_order IS NOT NULL
GROUP BY user_id
ORDER BY avg_days_between_orders;

-- 7.	What are the peak hours of order placement during the day?
SELECT
    order_hour_of_day,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_hour_of_day
ORDER BY order_count DESC;

-- 8.	How does order volume vary by day of the week?
SELECT
    order_dow,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_dow
ORDER BY order_dow;

-- 9.	What are the top 10 most ordered products?
SELECT
    p.product_id,
    p.product_name,
    COUNT(*) AS order_count
FROM order_products_train op
JOIN products p
    ON op.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY order_count DESC
LIMIT 10;

-- 10.	How many users have placed orders in each department?
SELECT
    d.department_id,
    d.department,
    COUNT(DISTINCT o.user_id) AS unique_users
FROM orders o
JOIN order_products_train op
    ON o.order_id = op.order_id
JOIN products p
    ON op.product_id = p.product_id
JOIN departments d
    ON p.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department
ORDER BY unique_users DESC;

-- 11.	What is the average number of products per order?
SELECT
    ROUND(AVG(product_count), 2) AS avg_products_per_order
FROM (
    SELECT
        order_id,
        COUNT(product_id) AS product_count
    FROM order_products_train
    GROUP BY order_id
) AS order_sizes;

-- 12.	What are the most reordered products in each department?
SELECT
    a.department,
    a.product_name,
    a.reorder_count
FROM
(
    SELECT
        d.department_id,
        d.department,
        p.product_id,
        p.product_name,
        SUM(op.reordered) AS reorder_count
    FROM order_products_train op
    JOIN products p
        ON op.product_id = p.product_id
    JOIN departments d
        ON p.department_id = d.department_id
    GROUP BY
        d.department_id,
        d.department,
        p.product_id,
        p.product_name
) a
LEFT JOIN
(
    SELECT
        d.department_id,
        p.product_id,
        SUM(op.reordered) AS reorder_count
    FROM order_products_train op
    JOIN products p
        ON op.product_id = p.product_id
    JOIN departments d
        ON p.department_id = d.department_id
    GROUP BY
        d.department_id,
        p.product_id
) b
ON a.department_id = b.department_id
AND b.reorder_count > a.reorder_count
WHERE b.product_id IS NULL
ORDER BY a.department;

-- 13.	How many products have been reordered more than once?
SELECT
    p.product_id,
    p.product_name,
    SUM(op.reordered) AS reorder_count
FROM order_products_train op
JOIN products p
    ON op.product_id = p.product_id
WHERE op.reordered = 1
GROUP BY
    p.product_id,
    p.product_name
HAVING SUM(op.reordered) > 1
ORDER BY reorder_count DESC;

-- 14.	What is the average number of products added to the cart per order?
SELECT
    ROUND(AVG(product_count), 2) AS avg_products_added_to_cart
FROM (
    SELECT
        order_id,
        COUNT(product_id) AS product_count
    FROM order_products_train
    GROUP BY order_id
) AS order_sizes;

-- 15.	How does the number of orders vary by hour of the day?
SELECT
    order_hour_of_day,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_hour_of_day
ORDER BY order_hour_of_day;

-- 16.	What is the distribution of order sizes (number of products per order)?
SELECT
    CASE
        WHEN order_size = 1 THEN '1 product'
        WHEN order_size BETWEEN 2 AND 5 THEN '2-5 products'
        WHEN order_size BETWEEN 6 AND 10 THEN '6-10 products'
        WHEN order_size BETWEEN 11 AND 20 THEN '11-20 products'
        ELSE '21+ products'
    END AS order_size_group,
    COUNT(*) AS order_count
FROM (
    SELECT
        order_id,
        COUNT(product_id) AS order_size
    FROM order_products_train
    GROUP BY order_id
) AS order_sizes
GROUP BY
    CASE
        WHEN order_size = 1 THEN '1 product'
        WHEN order_size BETWEEN 2 AND 5 THEN '2-5 products'
        WHEN order_size BETWEEN 6 AND 10 THEN '6-10 products'
        WHEN order_size BETWEEN 11 AND 20 THEN '11-20 products'
        ELSE '21+ products'
    END
ORDER BY order_count DESC;

-- 17.	What is the average reorder rate for products in each aisle?
SELECT
    a.aisle_id,
    a.aisle,
    ROUND(AVG(op.reordered) * 100, 2) AS avg_reorder_rate
FROM order_products_train op
JOIN products p
    ON op.product_id = p.product_id
JOIN aisles a
    ON p.aisle_id = a.aisle_id
GROUP BY
    a.aisle_id,
    a.aisle
ORDER BY avg_reorder_rate DESC;

-- 18.	How does the average order size vary by day of the week?
SELECT
    order_dow,
    ROUND(AVG(product_count), 2) AS avg_order_size
FROM (
    SELECT
        o.order_id,
        o.order_dow,
        COUNT(op.product_id) AS product_count
    FROM orders o
    JOIN order_products_train op
        ON o.order_id = op.order_id
    GROUP BY
        o.order_id,
        o.order_dow
) AS order_sizes
GROUP BY order_dow
ORDER BY order_dow;

-- 19.	What are the top 10 users with the highest number of orders?
SELECT user_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id
ORDER BY total_orders DESC
LIMIT 10;

-- 20.	How many products belong to each aisle and department?
SELECT
    d.department_id,
    d.department,
    a.aisle_id,
    a.aisle,
    COUNT(p.product_id) AS product_count
FROM products p
JOIN aisles a
    ON p.aisle_id = a.aisle_id
JOIN departments d
    ON p.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department,
    a.aisle_id,
    a.aisle
ORDER BY
    d.department_id,
    product_count DESC;
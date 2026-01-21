CREATE TABLE customer_orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    product VARCHAR(50) NOT NULL,
    quantity INT CHECK (quantity > 0),
    price NUMERIC(10,2) CHECK (price > 0),
    order_date DATE NOT NULL
);

-- Filtering Data Using Conditions
SELECT * 
FROM customer_orders
WHERE price > 30000;

SELECT * 
FROM customer_orders
WHERE product = 'Laptop';

-- Sorting Query Results (ORDER BY)
-- Sort orders by price (ascending)
SELECT customer_name, product, price
FROM customer_orders
ORDER BY price ASC;
-- Sort using multiple attributes (date priority, then price)
SELECT customer_name, product, price, order_date
FROM customer_orders
ORDER BY order_date ASC, price DESC;

-- Grouping Data for Aggregation
-- Total sales per product
SELECT product, SUM(quantity * price) AS total_sales
FROM customer_orders
GROUP BY product;
-- Total quantity sold per product
SELECT product, SUM(quantity) AS total_quantity
FROM customer_orders
GROUP BY product;

--Applying Conditions on Aggregated Data
-- Products with total sales greater than 50,000
SELECT product, SUM(quantity * price) AS total_sales
FROM customer_orders
GROUP BY product
HAVING SUM(quantity * price) a> 50000;

-- Custome whose total purchase exceeds 60,000
SELECT customer_name, SUM(quantity * price) AS total_spent
FROM customer_orders
GROUP BY customer_name
HAVING SUM(quantity * price) > 60000;

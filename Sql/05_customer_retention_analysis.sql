-- Identify repeat customers
SELECT
    customers.customer_id,
    customers.first_name,
    COUNT(orders.order_id) AS total_orders
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY
    customers.customer_id,
    customers.first_name
HAVING COUNT(orders.order_id) > 1
ORDER BY total_orders DESC;

-- Calculate the repeat customer rate
SELECT
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN order_count > 1 THEN 1 END) AS repeat_customers,
    ROUND(
        COUNT(CASE WHEN order_count > 1 THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS repeat_customer_rate
FROM (
    SELECT
        customer_id,
        COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
) AS customer_orders;

-- Customer Purchase Frequency
SELECT
    round(COUNT(order_id) * 1.0 / COUNT(DISTINCT customer_id), 2)
        AS average_orders_per_customer
FROM orders;

-- Analyse customer retention over time
SELECT
    DATE_TRUNC('month', orders.order_date) AS order_month,
    COUNT(DISTINCT orders.customer_id) AS active_customers
FROM orders
GROUP BY order_month
ORDER BY order_month;

-- Identify customers who returned in another month
SELECT
    jan.customer_id,
    COUNT(DISTINCT jan.order_id) AS january_orders,
    COUNT(DISTINCT feb.order_id) AS february_orders
FROM orders AS jan
JOIN orders AS feb
    ON jan.customer_id = feb.customer_id
WHERE EXTRACT(MONTH FROM jan.order_date) = 1
  AND EXTRACT(MONTH FROM feb.order_date) = 2
  AND EXTRACT(YEAR FROM jan.order_date) =
      EXTRACT(YEAR FROM feb.order_date)
GROUP BY jan.customer_id;

-- Calculate monthly retention rate
WITH january_customers AS (
    SELECT DISTINCT customer_id
    FROM orders
    WHERE EXTRACT(MONTH FROM order_date) = 1
),
february_customers AS (
    SELECT DISTINCT customer_id
    FROM orders
    WHERE EXTRACT(MONTH FROM order_date) = 2
)
SELECT
    COUNT(february_customers.customer_id) AS retained_customers,
    COUNT(january_customers.customer_id) AS january_customers,
    ROUND(
        COUNT(february_customers.customer_id) * 100.0 /
        NULLIF(COUNT(january_customers.customer_id), 0),
        2
    ) AS retention_rate
FROM january_customers
LEFT JOIN february_customers
    ON january_customers.customer_id = february_customers.customer_id;
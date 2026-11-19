SELECT 'customers' AS table_name, COUNT(*) AS total_records
FROM customers

UNION ALL

SELECT 'products', COUNT(*)
FROM products

UNION ALL

SELECT 'orders', COUNT(*)
FROM orders

UNION ALL

SELECT 'order_items', COUNT(*)
FROM order_items;

# MISSING VALUES


SELECT
    COUNT(*) AS total_customers,
    COUNT(first_name) AS available_first_names,
    COUNT(last_name) AS available_last_names,
    COUNT(email) AS available_emails,
    COUNT(signup_date) AS available_signup_dates,
    COUNT(city) AS available_cities
FROM customers;

#DUPLICATE RECORDS


-- SELECT
--     email,
--     COUNT(*) AS duplicate_count
-- FROM customers
-- GROUP BY email
-- HAVING COUNT(*) > 1;

-- SELECT
--   product_name,
--   COUNT(*) AS duplicate_count
-- from products
-- group by product_name
-- having count(*) > 1


select
  order_id,
  count(*) as duplicates_value
from orders
group by order_id
having count(*) > 1

#DATE VALIDATION

SELECT
    c.customer_id,
    c.first_name,
    c.signup_date,
    o.order_id,
    o.order_date
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_date::DATE < c.signup_date;

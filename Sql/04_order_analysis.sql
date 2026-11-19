select count(*) from orders;

SELECT order_status, COUNT(*)  FROM orders
GROUP BY order_status
ORDER BY count(*) DESC;

SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

SELECT order_id, SUM(quantity * unit_price) AS order_value
FROM order_items
GROUP BY order_id
ORDER BY order_value DESC;

SELECT
    AVG(order_value) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(quantity * unit_price) AS order_value
    FROM order_items
    GROUP BY order_id
) AS order_totals;

select orders.order_status, sum(order_items.quantity * order_items.unit_price) as revenue from orders
join order_items on orders.order_id = order_items.order_id
group by orders.order_status
order by revenue desc

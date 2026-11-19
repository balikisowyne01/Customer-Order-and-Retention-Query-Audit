-- Count our customers
select count(*) from customers;

-- Counting orders per customer.
select customers.customer_id, customers.first_name, orders.order_id from customers
join orders
  on customers.customer_id = orders.customer_id;

-- Count orders per customer
select customers.customer_id, customers.first_name, count(orders.order_id) from customers 
join orders on customers.customer_id = orders.customer_id
group by customers.customer_id, customers.first_name
order by customers.customer_id ASC;

-- Identify repeat customers
select customers.customer_id, customers.first_name, count(orders.order_id) from customers 
join orders on customers.customer_id = orders.customer_id
group by customers.customer_id, customers.first_name
having count(orders.order_id) > 1
order by customers.customer_id desc;

-- Calculate total customer spending
select order_id, quantity, unit_price, quantity*unit_price as total_price from order_items;

-- Calculate total revenue
select order_id, sum(quantity*unit_price) as total_revenue from order_items
group by order_id
order by total_revenue desc;

-- Calculate revenue per customer
select customers.customer_id, customers.first_name, sum(quantity * unit_price) as total_revenue from customers
join orders on customers.customer_id= orders.customer_id
join order_items on orders.order_id = order_items.order_id
group by customers.customer_id, customers.first_name
order by customer_id asc;

-- Identify customers who have never placed an order
select customers.customer_id, customers.first_name, orders.order_id  from customers
left join orders on customers.customer_id = orders.customer_id
where orders.order_id is null;

SELECT customers.customer_id, customers.first_name, MAX(orders.order_date) AS last_order_date FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.first_name
ORDER BY last_order_date DESC;
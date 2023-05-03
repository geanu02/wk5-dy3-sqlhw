SELECT * FROM customer;

SELECT order_date_placed, order_shipped
FROM orders
JOIN customer 
ON orders.customer_id = customer.customer_id;

SELECT *
FROM customer AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
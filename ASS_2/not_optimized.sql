USE ASS_2;	

SELECT 
    c.name AS customer_name,
    p.category,
    p.name AS product_name,
    SUM(o.quantity * p.price) AS total_spent,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE o.order_date >= '2023-01-01'
  AND p.price > (SELECT AVG(price) FROM products)
GROUP BY c.name, p.category, p.name
HAVING total_spent > 1000  
ORDER BY total_spent DESC;

USE ASS_2;

CREATE INDEX idx_order_date ON orders(order_date);

WITH avg_prices as
(
	select p.product_id, p.name, p.price, p.category
    from products p
    where p.price > (SELECT AVG(price) FROM products)
),
total_spend_date as 
(
	select o.customer_id, o.order_id, SUM(o.quantity * ap.price) AS total_spend, ap.category, ap.name
    from avg_prices ap
    left join orders o
		on o.product_id = ap.product_id
	where o.order_date >= '2023-01-01' -- force index if needed
    group by o.customer_id, o.order_id, ap.category, ap.name
    having total_spend > 1000
)
SELECT 
    c.name AS customer_name,
    ts.category,
    ts.name AS product_name,
    ts.total_spend,
    COUNT(ts.order_id) AS total_orders
FROM customers c
right join total_spend_date ts ON c.customer_id = ts.customer_id
GROUP BY c.name, ts.category, ts.name, ts.total_spend
ORDER BY total_spend DESC;

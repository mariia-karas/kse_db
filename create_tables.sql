DROP DATABASE if exists ASS_2;
CREATE DATABASE ASS_2;
USE ASS_2;	

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(20),
    city VARCHAR(20)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(20),
    category VARCHAR(20),
    price INT
);

CREATE TABLE orders (
  order_id       INT PRIMARY KEY,
  product_id     INT,
  customer_id    INT,
  order_date     DATE,
  quantity       INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);



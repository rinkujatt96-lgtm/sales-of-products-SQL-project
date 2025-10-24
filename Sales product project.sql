
-- Customers Table
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  region VARCHAR(30)
);

-- Products Table
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  category VARCHAR(30),
  price DECIMAL(10,2)
);

-- Sales Table
CREATE TABLE Sales (
  sale_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  sale_date DATE,
  quantity INT,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Sample Data
INSERT INTO Customers VALUES
(1, 'Aditi Sharma', 'North'),
(2, 'Rahul Verma', 'West'),
(3, 'Neha Singh', 'East'),
(4, 'Vivek Rao', 'South');

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Phone', 'Electronics', 25000),
(103, 'Headphones', 'Accessories', 3000),
(104, 'Tablet', 'Electronics', 35000),
(105, 'Keyboard', 'Accessories', 2000);

INSERT INTO Sales VALUES
(1, 1, 101, '2025-01-10', 1),
(2, 2, 102, '2025-01-12', 2),
(3, 3, 103, '2025-01-13', 3),
(4, 4, 101, '2025-01-14', 1),
(5, 1, 104, '2025-01-15', 1),
(6, 2, 105, '2025-01-16', 2),
(7, 3, 101, '2025-01-17', 1),
(8, 4, 103, '2025-01-18', 2);


-- total sale region wise
select c.region, sum(p.price * s.quantity) as Total_revenue
from Customers c 
inner join Sales s 
on c.customer_id = s.customer_id
inner join Products p 
on s.product_id = p.product_id
group by region 
order by Total_revenue desc;


-- Top 3 products by total quantity sold
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 3;

-- sale datewise total quantity sale --

select sum(quantity) Total_quanity_sale
from Sales
where sale_date between '2025-01-13' and '2025-01-17'

-- joining across databas=>join multiple columns which have same column
-- and same data in different dstabase
USE sql_store;
SELECT *
FROM order_items oi
JOIN sql_inventory.products p 
ON oi.product_id=p.product_id;


-- self join =>Used to join the table with itself
-- Here we refer the id of the manager because manager could be change
-- we select name of each employe and his manager
USE sql_hr;
SELECT  
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id;-- info about employee then manager is shown
    
    
    -- Joining more then 2 tables =>we use a single columns 
    -- to uniquely identify the given rows
    USE sql_store;
    SELECT 
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name
    FROM orders o 
    JOIN customers c
		ON o.customer_id = c.customer_id
	JOIN order_statuses os
		ON o.status= os.order_status_id;
        

-- Compound join =>(We use it when we have duplicate values inside columns)
-- We can use combination of column to identify each item
-- Composite primary key contain more then one column
USE sql_store;
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id
    AND oi.product_id=oin.product_id; -- It is a compund join condition
    
    
-- Implicit join syntax 
SELECT *
FROM orders o,customers c    
WHERE o.customer_id=c.customer_id;
    -- if we forget WHERE clause we get every record in order table 
    -- connected to every record in customer which gives us cross join


-- OUTER JOIN=>
SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o -- all record from left table are returned wheather it meets condition or not
ON c.customer_id=o.customer_id -- matching the condition is must
ORDER BY c.customer_id; 
-- Here only the customer with the order will be shown
-- To solve this problem we use LEFT join and RIGHT join 


-- outer join between multiple tables=>outer table with shipper table 
SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o 
ON c.customer_id=o.customer_id 
JOIN shippers sh
ON o.shipper_id=sh.shipper_id -- Here we used outer as well as inner join 
ORDER BY c.customer_id; 
  
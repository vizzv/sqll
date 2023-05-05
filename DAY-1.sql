USE sql_store;
-- Precedence order AND OR NOT just like we have in Arithmetic operation 
-- AND operator =>Both the condition must be true 


SELECT *
FROM customers
WHERE birth_date >'1990-01-01'
AND 
points >1000;

-- OR operator=>If one of condition is true as as well as both 
SELECT *
FROM customers
WHERE birth_date >'1990-01-01'
OR 
points>500 
AND state='VA';


-- NOT=>Used to negate a Condition
SELECT *
FROM customers
WHERE NOT 
(birth_date >'1990-01-01'
OR 
points>1000 );


-- IN operator=>Instead of combining multiple conditions using operator we use IN operator
SELECT *
FROM products
WHERE quantity_in_stock  IN (49,38,72);


-- Between operator =>Used for a specific range
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';


-- Like operator =>Retrive row with specific string pattern
SELECT *
FROM customers
WHERE last_name LIKE 'b%'; -- it means after b if we use __y last char 2 then follow y

-- Regular expression=>powerful to search more complex string
SELECT *
FROM customers
WHERE last_name REGEXP 'filed|mac|rose'; -- ^use this sign for begin and $for end of the signal ,| (OR) for another query ,[] to match char, [-] for the range


-- IS null for record with missing value => for  empty values
SELECT *
FROM customers
WHERE phone IS  NULL; -- ALSO we can use IS NOT NULL to negate the statement


-- ORDER BY operator=> To sort the table according us If we dont use it then it sort according to the primary key
SELECT *
FROM customers
ORDER BY first_name; -- use DESC at last for reversing the order also more then one could be selected for example we can also include state with it


-- LIMIT clause =>USED if we want a specific number of rows
SELECT *
FROM customers
LIMIT 6,3; -- Here 6 represent offset which are skipped while showing the table 
-- Page 1:1-3
-- page 2:4-6
-- page 3:7-9
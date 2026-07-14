USE tushar ;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE customers (
	Customer_ID  INT  PRIMARY KEY ,
    First_Name  VARCHAR(255) ,
    Last_Name  VARCHAR(255) ,
    Email  VARCHAR(255) ,
    Registration_Date  DATE
) ;


INSERT INTO customers ( Customer_ID , First_Name , Last_Name , Email , Registration_Date )
VALUES 
	(1 , 'John' , 'Deo' , 'john.doe@gmail.com' , '2022-03-15') ,
    (2 , 'Jane' , 'Smith' , 'jane.smith@gmail.com' , '2022-09-05') ,
    (3 , 'Tushar' , 'Bagle' , 'tushar.bagle@gmail.com' , '2022-12-25') ,
    (4 , 'Kanish' , 'Singh' , 'kanish.singh@gmail.com' , '2022-05-10') ,
    (5 , 'Harshit' , 'Dhara' , 'harshit.dhara@gmail.com' , '2022-08-20') ;


SELECT * FROM customers ;


-- The "OUTPUT"

-- +-------------+------------+-----------+------------------------+-------------------+
-- | Customer_ID | First_Name | Last_Name | Email                  | Registration_Date |
-- +-------------+------------+-----------+------------------------+-------------------+
-- | 1           | John       | Deo       | john.doe@gmail.com     | 2022-03-15        |
-- | 2           | Jane       | Smith     | jane.smith@gmail.com   | 2022-09-05        |
-- | 3           | Tushar     | Bagle     | tushar.bagle@gmail.com | 2022-12-25        |
-- | 4           | Kanish     | Singh     | kanish.singh@gmail.com | 2022-05-10        |
-- | 5           | Harshit    | Dhara     | harshit.dhara@gmail.com| 2022-08-20        |
-- +-------------+------------+-----------+------------------------+-------------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



CREATE TABLE orders (
	Order_ID  INT  PRIMARY KEY ,
    Customer_ID  INT(11) ,
    Order_Date  DATE ,
    Total_Amount  DECIMAL(10,2) ,
    
    FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID)
) ;


INSERT INTO orders (Order_ID , Customer_ID , Order_Date , Total_Amount) 
VALUES 
	(101 , 1 , '2023-07-01' , 150.50) , 
	(102 , 2 , '2023-01-11' , 250.50) , 
	(103 , 3 , '2023-12-21' , 370.30) , 
	(104 , 4 , '2023-05-22' , 400.00) , 
	(105 , 5 , '2023-09-09' , 900.10) ;


SELECT * FROM orders ;


-- The "OUTPUT"

-- +----------+-------------+------------+--------------+
-- | Order_ID | Customer_ID | Order_Date | Total_Amount |
-- +----------+-------------+------------+--------------+
-- | 101      | 1           | 2023-07-01 | 150.50       |
-- | 102      | 2           | 2023-01-11 | 250.50       |
-- | 103      | 3           | 2023-12-21 | 370.30       |
-- | 104      | 4           | 2023-05-22 | 400.00       |
-- | 105      | 5           | 2023-09-09 | 900.10       |
-- +----------+-------------+------------+--------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



CREATE TABLE employees (
	Employee_ID  INT  PRIMARY KEY ,
    First_Name  VARCHAR(255) ,
    Last_Name  VARCHAR(255) ,
    Department  VARCHAR(255) ,
    Hire_Date  DATE ,
    Salary  DECIMAL(10,2) 
) ;


INSERT INTO employees ( Employee_ID , First_Name , Last_Name , Department , Hire_Date , Salary)
VALUES 
	(1 , 'Mark' , 'Johnson' , 'Sales' , '2020-01-15' , 500000.00) , 
	(2 , 'Ramesh' , 'Ahire' , 'HR' , '2020-04-25' , 550000.00) , 
	(3 , 'Jayesh' , 'Bagle' , 'IT' , '2020-07-05' , 300000.00) , 
	(4 , 'Raj' , 'Patil' , 'Marketing' , '2020-10-22' , 550000.00) , 
	(5 , 'Darshan' , 'Vasaikar' , 'Intern' , '2020-12-07' , 600000.00) ;


SELECT * FROM employees ;


-- The "OUTPUT"

-- +-------------+------------+-----------+------------+------------+----------+
-- | Employee_ID | First_Name | Last_Name | Department | Hire_Date  | Salary   |
-- +-------------+------------+-----------+------------+------------+----------+
-- | 1           | Mark       | Johnson   | Sales      | 2020-01-15 | 500000.00|
-- | 2           | Ramesh     | Ahire     | HR         | 2020-04-25 | 550000.00|
-- | 3           | Jayesh     | Bagle     | IT         | 2020-07-05 | 300000.00|
-- | 4           | Raj        | Patil     | Marketing  | 2020-10-22 | 550000.00|
-- | 5           | Darshan    | Vasaikar  | Intern     | 2020-12-07 | 600000.00|
-- +-------------+------------+-----------+------------+------------+----------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 1. INNER JOIN : Retrieve all orders and customers details where oreder exist.
SELECT
	o.* ,
    c.*
FROM orders o
JOIN customers c 
ON o.Customer_ID = c.Customer_ID ;


-- The "OUTPUT"

-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+
-- | Order_ID | Customer_ID | Order_Date | Total_Amount | First_Name | Last_Name | Email                  | Registration_Date |
-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+
-- | 101      | 1           | 2023-07-01 | 150.50       | John       | Deo       | john.doe@gmail.com     | 2022-03-15        |
-- | 102      | 2           | 2023-01-11 | 250.50       | Jane       | Smith     | jane.smith@gmail.com   | 2022-09-05        |
-- | 103      | 3           | 2023-12-21 | 370.30       | Tushar     | Bagle     | tushar.bagle@gmail.com | 2022-12-25        |
-- | 104      | 4           | 2023-05-22 | 400.00       | Kanish     | Singh     | kanish.singh@gmail.com | 2022-05-10        |
-- | 105      | 5           | 2023-09-09 | 900.10       | Harshit    | Dhara     | harshit.dhara@gmail.com| 2022-08-20        |
-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 2. LEFT JOIN : Retrieve all customers and their corresponding orders.
SELECT
	c.* ,
    o.*
FROM customers c
LEFT JOIN orders o 
ON c.Customer_ID = o.Customer_ID ;


-- The "OUTPUT"

-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+------------+-
-- | Order_ID | Customer_ID | First_Name | Last_Name | Email                  | Registration_Date | Customer_ID | Order_Date | Total_Amount |
-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+------------+-
-- | 101      | 1           | John       | Deo       | john.doe@gmail.com     | 2022-03-15        | 1           | 2023-07-01 | 150.50       |
-- | 102      | 2           | Jane       | Smith     | jane.smith@gmail.com   | 2022-09-05        | 2           | 2023-01-11 | 250.50       |
-- | 103      | 3           | Tushar     | Bagle     | tushar.bagle@gmail.com | 2022-12-25        | 3           | 2023-12-21 | 370.30       |
-- | 104      | 4           | Kanish     | Singh     | kanish.singh@gmail.com | 2022-05-10        | 4           | 2023-05-22 | 400.00       |
-- | 105      | 5           | Harshit    | Dhara     | harshit.dhara@gmail.com| 2022-08-20        | 5           | 2023-09-09 | 900.10       |
-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+------------+-



-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 3. RIGHT JOIN : Retrieve all orders and their corresponding customers.
SELECT
	o.* ,
    c.*
FROM orders o
RIGHT JOIN customers c
ON o.Customer_ID = c.Customer_ID ;


-- The "OUTPUT"

-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+
-- | Order_ID | Customer_ID | Order_Date | Total_Amount | First_Name | Last_Name | Email                  | Registration_Date |
-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+
-- | 101      | 1           | 2023-07-01 | 150.50       | John       | Deo       | john.doe@gmail.com     | 2022-03-15        |
-- | 102      | 2           | 2023-01-11 | 250.50       | Jane       | Smith     | jane.smith@gmail.com   | 2022-09-05        |
-- | 103      | 3           | 2023-12-21 | 370.30       | Tushar     | Bagle     | tushar.bagle@gmail.com | 2022-12-25        |
-- | 104      | 4           | 2023-05-22 | 400.00       | Kanish     | Singh     | kanish.singh@gmail.com | 2022-05-10        |
-- | 105      | 5           | 2023-09-09 | 900.10       | Harshit    | Dhara     | harshit.dhara@gmail.com| 2022-08-20        |
-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+



-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4. FULL OUTER JOIN : Retrieve all customers and all orders , regardless of matching.
--      We can not do the FULL OUTER JOIN in MySQL directly then ,

-- LEFT JOIN
SELECT
	c.* ,
    o.*
FROM customers c
LEFT JOIN orders o 
ON c.Customer_ID = o.Customer_ID

UNION 

-- RIGHT JOIN 
SELECT
	c.* ,
    o.*
FROM customers c
RIGHT JOIN orders o
ON c.Customer_ID = o.Customer_ID ;


-- The "OUTPUT"

-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+
-- | Order_ID | Customer_ID | Order_Date | Total_Amount | First_Name | Last_Name | Email                  | Registration_Date |
-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+
-- | 101      | 1           | 2023-07-01 | 150.50       | John       | Deo       | john.doe@gmail.com     | 2022-03-15        |
-- | 102      | 2           | 2023-01-11 | 250.50       | Jane       | Smith     | jane.smith@gmail.com   | 2022-09-05        |
-- | 103      | 3           | 2023-12-21 | 370.30       | Tushar     | Bagle     | tushar.bagle@gmail.com | 2022-12-25        |
-- | 104      | 4           | 2023-05-22 | 400.00       | Kanish     | Singh     | kanish.singh@gmail.com | 2022-05-10        |
-- | 105      | 5           | 2023-09-09 | 900.10       | Harshit    | Dhara     | harshit.dhara@gmail.com| 2022-08-20        |
-- +----------+-------------+------------+--------------+------------+-----------+------------------------+-------------------+



-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 5. Subquery to find customers who have placed orders worth more than the average amount.
SELECT
	Customer_ID
FROM orders
WHERE Total_Amount > (
	SELECT 
		AVG(Total_Amount) AS Average_Total_Amount
	FROM orders
) ;


-- The "OUTPUT"

-- +-------------+
-- | Customer_ID |
-- +-------------+
-- | 5           |
-- +-------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 6. Subquery to find employees with salaries above the average salary.
SELECT
	*
FROM employees
WHERE salary > (
	SELECT 
		AVG(salary) AS Avg_Salary
	FROM employees
) ;


-- The "OUTPUT"

-- +-------------+------------+-----------+------------+------------+----------+
-- | Employee_ID | First_Name | Last_Name | Department | Hire_Date  | Salary   |
-- +-------------+------------+-----------+------------+------------+----------+
-- | 2           | Ramesh     | Ahire     | HR         | 2020-04-25 | 550000.00|
-- | 4           | Raj        | Patil     | Marketing  | 2020-10-22 | 550000.00|
-- | 5           | Darshan    | Vasaikar  | Intern     | 2020-12-07 | 600000.00|
-- +-------------+------------+-----------+------------+------------+----------+

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 7. Extract the YEAR and MONTH from the Order_Date
SELECT
	YEAR(Order_Date) AS Year ,
    MONTH(Order_Date) AS Month
FROM orders ;


-- The "OUTPUT"

-- +------+-------+
-- | Year | Month |
-- +------+-------+
-- | 2023 | 7     |
-- | 2023 | 1     |
-- | 2023 | 12    |
-- | 2023 | 5     |
-- | 2023 | 9     |
-- +------+-------+

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 8. Format the Order_Date to a more readable format (e.g., 'DD-MM-YYYY').
SELECT
	DATE_FORMAT(Order_Date , '%d-%m-%Y') AS Normal_Date
FROM orders ;


-- The "OUTPUT"

-- +-------------+
-- | Normal_Date |
-- +-------------+
-- | 01-07-2023  |
-- | 11-01-2023  |
-- | 21-12-2023  |
-- | 22-05-2023  |
-- | 09-09-2023  |
-- +-------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 9. Calculate the difference in days between two dates(order_Date and Current_Date).
SELECT
	Order_Date ,
    curdate() ,
	DATEDIFF(CURDATE() , Order_Date) AS Days_Differences
FROM orders ;


-- The "OUTPUT"

-- +------------+------------+-----------------+
-- | Order_Date | CURDATE()  | Days_Difference |
-- +------------+------------+-----------------+
-- | 2023-07-01 | 2026-04-10 | 1014            |
-- | 2023-01-11 | 2026-04-10 | 1188            |
-- | 2023-12-21 | 2026-04-10 | 841             |
-- | 2023-05-22 | 2026-04-10 | 1054            |
-- | 2023-09-09 | 2026-04-10 | 944             |
-- +------------+------------+-----------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 10. Concatenate First_Name and Last_Name to form a full name.
SELECT
	CONCAT(First_Name , ' ' , Last_Name) AS Full_Name
FROM customers ;


-- The "OUTPUT"

-- +----------------+
-- | Full_Name      |
-- +----------------+
-- | John Deo       |
-- | Jane Smith     |
-- | Tushar Bagle   |
-- | Kanish Singh   |
-- | Harshit Dhara  |
-- +----------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 11. Replace part of a String (e.g., replace 'John' with 'Jonathan').
SELECT
	REPLACE(First_Name , 'John' , 'Jonathan') AS Update_Name
FROM customers ;


-- The "OUTPUT"

-- +--------------+
-- | Update_Name  |
-- +--------------+
-- | Jonathan     |
-- | Jane         |
-- | Tushar       |
-- | Kanish       |
-- | Harshit      |
-- +--------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 12. Convert First_Name to Uppercase and Last_Name to Lowercase.
SELECT
	UPPER(First_Name) AS Capital_Latter ,
    LOWER(Last_Name) AS Small_Latter
FROM customers ;


-- The "OUTPUT"

-- +----------------+--------------+
-- | Capital_Latter | Small_Latter |
-- +----------------+--------------+
-- | JOHN           | deo          |
-- | JANE           | smith        |
-- | TUSHAR         | bagle        |
-- | KANISH         | singh        |
-- | HARSHIT        | dhara        |
-- +----------------+--------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 13. Trim extra space from the email field.
SELECT
	TRIM(Email) AS Clean_Email
FROM customers ;


-- The "OUTPUT"

-- +--------------------------+
-- | Clean_Email              |
-- +--------------------------+
-- | john.doe@gmail.com       |
-- | jane.smith@gmail.com     |
-- | tushar.bagle@gmail.com   |
-- | kanish.singh@gmail.com   |
-- | harshit.dhara@gmail.com  |
-- +--------------------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 14. Calculate the Running Total of Total_Amount for each order.
SELECT
	Total_Amount ,
    SUM(Total_Amount)  OVER()  AS Running_Total
FROM orders ;


-- The "OUTPUT"

-- +--------------+---------------+
-- | Total_Amount | Running_Total |
-- +--------------+---------------+
-- | 150.50       | 2071.40       |
-- | 250.50       | 2071.40       |
-- | 370.30       | 2071.40       |
-- | 400.00       | 2071.40       |
-- | 900.10       | 2071.40       |
-- +--------------+---------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 15. Rank orders based on Total_Amount using the Rank() function.
SELECT
	Total_Amount ,
	RANK()  OVER(ORDER BY Total_Amount DESC)  AS Rank_Fun
FROM orders ;


-- The "OUTPUT"

-- +--------------+----------+
-- | Total_Amount | Rank_Fun |
-- +--------------+----------+
-- | 900.10       | 1        |
-- | 400.00       | 2        |
-- | 370.30       | 3        |
-- | 250.50       | 4        |
-- | 150.50       | 5        |
-- +--------------+----------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 16. Assign a discount based on Total_Amount in orders (e.g., > 1000 : 10% off , > 500 : 5% off).
SELECT
	Total_Amount ,

    CASE 
		WHEN Total_Amount > 1000 THEN '10% off'
        WHEN Total_Amount > 500 THEN '5% off'
        ELSE 'No_Discount'
	END  AS Discounts

FROM orders ;


-- The "OUTPUT"

-- +--------------+-------------+
-- | Total_Amount | Discounts   |
-- +--------------+-------------+
-- | 150.50       | No_Discount |
-- | 250.50       | No_Discount |
-- | 370.30       | No_Discount |
-- | 400.00       | No_Discount |
-- | 900.10       | 5% off      |
-- +--------------+-------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 17. Categorize employee's salaries as high , medium , or low.
SELECT
	salary ,
    
    CASE 
		WHEN salary > 550000 THEN 'High'
        WHEN salary BETWEEN 400000 AND 550000 THEN 'Medium'
        ELSE 'Low'
	END  AS Categorize_Salary

FROM employees ;


-- The "OUTPUT"

-- +----------+--------------------+
-- | Salary   | Categorize_Salary  |
-- +----------+--------------------+
-- | 500000   | Medium             |
-- | 550000   | Medium             |
-- | 300000   | Low                |
-- | 550000   | Medium             |
-- | 600000   | High               |
-- +----------+--------------------+


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Data Types and creating tables 
INT   -- Whole numbers 
DECIMAL(M,N)  -- Decimal Numbers - Exact Value 
VARCHAR(1)  -- String of text of length of 1 
BLOB  -- Binary Large Object, Stores large data
DATE  --'YYYY-MM-DD'
TIMESTAMP  -- 'YYYY-MM-DD HH:MM:SS' - used for recording 


CREATE TABLE student (
    student_id INT, AUTO_INCREMENT -- Will auto add in it 
    name VARCHAR(20) NOT NULL,  -- You cannot pull NULL in there 
    major VARCHAR(20), UNIQUE  -- Major cannot be the same anymore  -- DEFAULT 'undecided' (Will be output if nothing is there)
    PRIMARY KEY(student_id)
);
SELECT * FROM student;  -- Gives all of the information 

DESCRIBE student;

ALTER TABLE student ADD gpa DEICMAL(3, 2);  -- Modifes the table

ALTER TABLE student DROP COLUMN gpa; -- WIll drop / remove the section

-- Inserting values 

INSERT INTO student VALUES(1, 'Jack', 'Biology');  -- Run and put new info and run again to apply data
INSERT INTO student VALUES(2, 'Kate', 'Sociology');
INSERT INTO student(student_id, name) VALUES(3, 'Claire');
INSERT INTO student VALUES(4, 'Jack', 'Biology');
INSERT INTO student VALUES(5, 'Mike', 'Computer Science');

-- Update and Delete 
UPDATE student 
SET major = 'Bio'
WHERE major = 'Biology';

SELECT * FROM student;  -- Everything and below is deleted 
DELETE FROM student
WHERE student_id = 5; 
WHERE name = 'Tom' AND major = 'undiced' -- Another way to delelte 

-- Basic Queries 
SELECT name, major -- Get those sections and nothing else (Also can use student.name)
FROM student
ORDER BY name; -- Orders the names in order (Asending first and program decend)
-- ORDER BY major, student_id  (Another way to do this)
LIMIT 2; -- This will limit the amount of things or sections 
WHERE major = 'Biology'; OR name = 'Kate'; -- Finds certain things in the table 
WHERE student_id < 3; -- Gets all of them use less than three (<>) means not equal too
WHERE name IN ('claire', 'Kate', 'Mike'); -- Gets all of the enters for those names 

-- Creating a Company Data Base !!!!
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
),

CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL;

)

ALTER TABLE employee -- Makes the realtionship between 2 rows make sense
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id);
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY (super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES brach(branch_id) on DELETE SET NULL
);

-- (Now we are inserting into the tables)
-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1 
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);


-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15');

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Anglea', 'Martin', '1971-06-25');
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05');
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19');

-- Stamford 

INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05');
INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3;
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22');
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01');

-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T Forms & Labels', 'Customs');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Labels', 'Custom');


-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackwana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO words_with VALUES(102, 401, 267000);
INSERT INTO words_with VALUES(108, 402, 22500);
INSERT INTO words_with VALUES(107, 403, 5000);
INSERT INTO words_with VALUES(108, 403, 12000);
INSERT INTO words_with VALUES(105, 404, 33000);
INSERT INTO words_with VALUES(107, 405, 26000);
INSERT INTO words_with VALUES(102, 406, 15000);
INSERT INTO words_with VALUES(105, 406, 130000);


-- select * from words_with;  (Show the table that you request)

-- More Data Queries 

-- Find all employees (Finds all employees and other things you ask)
SELECT *
FROM employee;


-- Find all employees ordered by salary 
SELECT *
FROM employee
ORDER BY salary DESC;

-- Find all employess ordered by sex then name 
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;


-- Find the first 5 employees in the table 
SELECT *
FROM employee
LIMIT 5;

-- Find the first and last names of all employess 
SELECT first_name, last_name 
FROM employee;


-- Find the forename and surnames names of all employess
SELECT first_name as forenane, last_name AS surname 
FROM employee

-- Find out all the different genders 
SELECT DISTINCT branch_id
FROM employee;



-- Functions 
-- Find the number of employees
SELECT COUNT(emp_id) -- Counts how many entres have values 
FROM employee;

-- Find the number of female employees bron afer 1970
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_date > '1971-01-01';


-- Find the average of all employees salaires 
SELECT AVG(salary)
FROM employee
WHERE sex = 'M';


-- Find the sum of all employess salarires 
SELECT SUM(salary)
FROM employee;


-- Find out how many males and females there are 
SELECT COUNT(sex), sex
FROM employee   
GROUP BY sex;


-- Find the total sales of each salesmen 
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY;



-- Wildcards
-- Find any clients who are in LLC
SELECT *
FROM client 
WHERE client_name LIKE '%LLC'; -- It is like this pattern then it will return (Has to end in it)
-- % any amount of characters and _ is one charcter  

-- Find any branch suppliers who are in the label business
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '% LABEL%' -- It is had label in it somewhere


-- Find any employee born in October 
SELECT *
FROM employee
WHERE birth_date LIKE '____-10%' -- <=


-- Find any clients who are schools 
SELECT *
FROM client 
WHERE client_name LIKE '%school%';


-- Unions (muiltple select statements into one)

-- Find a list of employee and branch names 
SELECT first_name -- Need to have the same number of columns 
FROM employee
UNION
SELECT branch_name
FROM branch
UNION
SELECT client_name
FROM client;


-- Find a lsit of all clients & branch supplier names 
SELECT client_name, client.branch_id
FROM client
UNION
SELECT supplier_name
FROM branch_supplier;


-- Find a list of all money spent of earned by the company 
SELECT salary 
FROM employee
UNION
SELECT total_sales 
FROM works_with;


-- Joins (Combining different results into one thing)
INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL);

-- Find all branches and the names of their managers 
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch -- When using LEFT JOIN it uses the other employees
ON employee.emp_id = branch.mgr_id;


-- Nested Queries (Use the results of one select statemeets to inform the other)

-- Find name of all employees who have sold over 30,000 to a single client 
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
SELECT works_with.emp_id
FROM works_with
WHERE works_with.total_sales > 30000
);

-- Find all clients who are handled by the branch that Michael Scott manages 
SELECT client.client_name
FROM client 
WHERE client.branch_id = (
SELECT branch.branch_id 
FROM branch
WHERE branch.branch_id = 102
LIMIT 1
);


-- On Delete (Bringing in example code from Database table)
CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);
DELETE FROM  employee
WHERE emp_id = 102;

SELECT * from branch; -- This code is extra and it is to see that the table is changed and now it is NULL


-- Triggers (VID) (Not ON TEST)
DELIMITER $$
CREATE 
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES(NEW.first_name)
    END$$
DELIMITER;

----------------------------------------------------------------------------------------------
-- Normal notes 
The SELECT DISTINCT statement is used to return only DISTINCT (different) values 
Exmaple code: select distinct country from customers; -- Returns everthing including duplucates
-- COUNT returens the number of how many there is 

The WHERE clause is used to filter records
It is used to extract only those records that fulfill a specifeid condition 
Example code: select * from customers where country='Meixco';



The ORDER BY keyword is used to sort the result-set in ascending or descending order
Example code: select * from products order by price DESC;
-- ASC is that


The WHERE clause can contain one or many AND opeartors
The AND operator is used to filter based on more than one coniditon
Example code:
select * 
from customers
where country = 'Spain' and customername like 'G%';
-- the like finds it something is there


the WHERE clause can contain one or more OR opeartors
The OR opeartor is used to filter records based on more than one condition, like if you want to return all customers form germany by also those from spain 
Example code:
select *
from customers
where country = 'Germany' or country = 'Spain';


The NULL value go to the WHERE statemnts only 
Example code:
select customername, contactname, address
from customers
where address is null;


The UPDATE statement is used to modify the existing records in a table
Example code:
update customers 
set contactname = 'Alfred Schmidt', city = 'Frankfurt'
where customerid = 1;



The DELETE statement is used to delete existing records in a table
Example code:
delete from customers where customername - 'Alfreds Futterkiste';


The SELECT TOP clause is used to specify the number of records to return
The SELECT TOP clause is useful on large tables with thousands of records. Returning a large numer of records can impact performace 
Example code for LIMIT:
select * from customers
limit 3;

Example code for FECTH FIRST:
select * from customers 
fetch first 3 rows only;

Example code for TOP PERCENT:
select top 50 percent * from customers;

Exmaple code with WHERE claues:
select top 3 * from customers 
where country='Germany';

COUNT() = returns the number of rows that mathces a specified criterion


The IN opeartor allows you to specify multiple values in WHERE clause 
The IN opeartor is a shorthand for multiple OR conditions!!!!
Example code:
select * from customers
where country in ('Germany', 'France', 'UK');


The BETWEEN operator selects values within a given range.
The BETWEEN opeartor is inclusive: begin and end value are included
Example code:
select * from products
where price between 10 and 20; 


The JOIN clause is used to combine rows from two or more tables, based on a related colummn between them.
Example code:
select orders.orderid, customers.customersname, orders.orderdate
from orders 
innner join customers on order.customerid=customers.customerid;


A self join is a regular join, but the table is joined with itself. 
Example code:
select colummn_name(s)
from table t1, table t2
where condition;


The UNION opeartor is used to combine the result-set of two to more SELECT statements
Example code: -- Gets information from more than one table 
select city from customers 
union 
select city from suppliers 
order by city;



The HAVING clause was added to SQL bcz the WHERE keyword cannot be used with aggregate functions.
-- HAVING is the same as WHERE statement 



the EXISTS opeartor is used to test for the existence of any record in a subqurey 
the EXISTS opeartor returns TRUE if the subqurey returns one or more records 
Example code:
select colummn_name(s)
from table_name
where exists 
(select colummn_name from table_name where coniditon);



The ANY and ALL opeartors allow you to perform a comparison between a single column value and a range of other values 
The ANY operator:
    returns a boolean value as a result
    returns TRUE if any of the subquery values meet the condition 
ANY means that the condtion will be true if the operation is true for any of the values in the range
-- All and any means practically the same thing 
Example code:



The INSERT INTO SELECT statement copies data from one table and inserts it into another table 
It also requires the data types in source and target tables matches 
Example code:
INSERT INTO customers (customers, city, country)
select SupplierName, City, Country FROM suppliers;



The CASE statement is the if else statements but in sql but (If there is no ELSE part and no condtions are true, it returns NULL)
Example code:
select OrderID, quantiy, 
CASE
    WHEN quantiy > 30 THEN ' The quantity is greater than 30'
    WHEN quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is unde 30'
END AS QuantityText -- Code could end right here as just END and nothing else
FROM OrderDetails 



IFNULL() function lets you return an alternative value if an expression is NULL (Same for COALESCE)
-- Basically a if statement when it hits null


offset is where it starts counting and limit is how many numbers it can go through 


















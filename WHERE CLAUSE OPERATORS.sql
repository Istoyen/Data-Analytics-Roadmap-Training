--Equals Operator (=)

SELECT * FROM customers WHERE age = 30;
--The query selects all records from the customers table where the age is exactly 30.

--Not Equals Operator (!= or <>)

SELECT * FROM customers WHERE age != 30;
--The query selects all records from the customers table where the age is not equal to 30.

--Less Than Operator (<)

SELECT * FROM customers WHERE balance < 1000;
--The query selects all records from the customers table where the balance is less than 1000.

--Greater Than Operator (>)

SELECT * FROM customers WHERE balance > 1000;
---This query selects all records from the customers table where the balance is greater than 1000.

--Less Than or Equal To Operator (<=)

SELECT * FROM customers WHERE age <= 30;
--This query selects all records from the customers table where the age is 30 or younger.

--Greater Than or Equal To Operator (>=)

SELECT * FROM customers WHERE age >= 30;
--This query selects all records from the customers table where the age is 30 or older.

--IN Operator

SELECT * FROM customers WHERE state IN ('California', 'Texas');
---This query selects all records from the customers table where the state is either 'California' or 'Texas'.

---NOT IN Operator

SELECT * FROM customers WHERE state NOT IN ('California', 'Texas');
---This query selects all records from the customers table where the state is neither 'California' nor 'Texas'.

--LIKE Operator (for pattern matching)

SELECT * FROM customers WHERE name LIKE 'Jo%';
----This query selects all records from the customers table where the name starts with 'Jo'.

--NOT LIKE Operator

SELECT * FROM customers WHERE name NOT LIKE 'Jo%';
---This query selects all records from the customers table where the name does not start with 'Jo'.

--BETWEEN Operator

SELECT * FROM customers WHERE age BETWEEN 25 AND 30;
---This query selects all records from the customers table where the age is between 25 and 30, inclusive.

---NOT BETWEEN Operator

SELECT * FROM customers WHERE age NOT BETWEEN 25 AND 30;
----This query selects all records from the customers table where the age is not between 25 and 30.

---IS NULL Operator

SELECT * FROM customers WHERE address IS NULL;
---This query selects all records from the customers table 
---where the address field is null (i.e., missing or unknown).

---IS NOT NULL Operator

SELECT * FROM customers WHERE address IS NOT NULL;
---This query selects all records from the customers 
---table where the address field is not null.

--Each of these operators serves a unique purpose in filtering data in  
--queries based on specific criteria. They are fundamental in the creation
--of dynamic and responsive  queries that can adjust to different data analysis needs.
--Hacker Rank Solution
--Aggregate
--We define an employee's total earnings to be their monthly salary x months
--worked, and the maximum total earnings to be the maximum total earnings for any
--employee in the Employee table. Write a query to find the maximum total earnings
--for all employees as well as the total number of employees who have maximum
--total earnings. Then print these values as 2 space-separated integers.
--Input Format
--The Employee table containing employee data for a company is described as
--follows:
--Column                             Type
--employee_id                       Integer     
--name                               String
--months                            Integer
--salary                            Integer
----where employee_id is an employee's ID number, name is their name, months is the
--total number of months they've been working for the company, and salary is the
--their monthly salary.
---1
SELECT 
    MAX(total_earnings) AS max_total_earnings,
    COUNT(*) AS num_employees_with_max_earnings
FROM (
    SELECT 
        employee_id, 
        name, 
        months, 
        salary, 
        (months * salary) AS total_earnings
    FROM Employee
) AS earnings_table
WHERE total_earnings = (SELECT MAX(months * salary) FROM Employee);

---2

--Query the following two values from the STATION table:
--1. The sum of all values in LAT_N rounded to a scale of 2 decimal places.
--2. The sum of all values in LONG_W rounded to a scale of 2 decimal places
SELECT 
  ROUND(SUM(LAT_N), 2) AS sum_lat_n,
  ROUND(SUM(LONG_W), 2) AS sum_long_w
FROM STATION;

---3
--Query the sum of Northern Latitudes (LAT_N) from STATION 
--having values greater than  and less than . Truncate your answer to  decimal places.

SELECT TRUNCATE(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

---4
---Query a count of the number of cities in CITY having a Population larger than 
SELECT count(*)
FROM CITY
WHERE POPULATION > '100000'

---Query the total population of all cities in CITY where District is California.
SELECT SUM(Population)
FROM CITY
WHERE District = 'California';

--Query the average population of all cities in CITY where District is California.SELECT AVG(Population)
FROM CITY
WHERE District = 'California';

---Query the average population for all cities in CITY, 
--rounded down to the nearest integer.
SELECT FLOOR(AVG(Population))
FROM CITY;

--Query the difference between the maximum and minimum populations in CITY.
SELECT MAX(Population) - MIN(Population) AS PopulationDifference
FROM CITY;

--Samantha was tasked with calculating the average monthly salaries for all
--employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was
--broken until after completing the calculation. She wants your help finding the
--difference between her miscalculation (using salaries with any zeros removed), and
--the actual average salary.

--Write a query calculating the amount of error (i.e .: actual - miscalculated
--average monthly salaries), and round it up to the next integer.
--Input Format
--The EMPLOYEES table is described as follows:
--Column                           Type
--ID                               Integer
--Name                             String
--Salary                           Integer
--Note: Salary is per month.

SELECT CEILING(AVG(Salary) - AVG(CAST(REPLACE(CAST(Salary AS CHAR), '0', '') AS UNSIGNED))) AS ErrorAmount
FROM EMPLOYEES;

--Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than .
--Truncate your answer to  decimal places.
SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

--Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N)
--in STATION that is less than . Round your answer to  decimal places. SOLVE
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
);

--Query the smallest Northern Latitude (LAT_N) from STATION that is greater than
--38.7780. Round your answer to 4 decimal places.
SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780;

--Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N)
--in STATION is greater than . Round your answer to  decimal places.

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7780
);

--Consider P1 (a, b) and P2 (c, d) to be two points on a 2D plane.
--. a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
--· b happens to equal the minimum value in Western Longitude (LONG_W in
--STATION).
--. c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
--· d happens to equal the maximum value in Western Longitude (LONG_W in
--STATION).

--Query the Manhattan Distance between points P1 and P2 and round it to a scale of
--4 decimal places.

SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4) AS ManhattanDistance
FROM STATION;

--Consider P1 (a, c) and P2 (b, d) to be two points on a 2D plane where (a, b) are the
--respective minimum and maximum values of Northern Latitude (LAT_N) and (c, d)
--are the respective minimum and maximum values of Western Longitude (LONG_W)
--in STATION.
--Query the Euclidean Distance between points P1 and P2 and format your answer to
--display 4 decimal digits.
--Input Format
--The STATION table is described as follows:

SELECT ROUND(SQRT(POWER(MAX(LAT_N) - MIN(LAT_N), 2) + POWER(MAX(LONG_W) - MIN(LONG_W), 2)), 4) AS EuclideanDistance
FROM STATION;

--A median is defined as a number separating the higher half of a data set from the lower half. Query the 
--median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
--Input Format
WITH OrderedLats AS (
  SELECT LAT_N,
         ROW_NUMBER() OVER (ORDER BY LAT_N) AS RowAsc,
         COUNT(*) OVER () AS TotalCount
  FROM STATION
),
MiddleValues AS (
  SELECT LAT_N
  FROM OrderedLats
  WHERE RowAsc IN (FLOOR((TotalCount + 1) / 2), CEIL((TotalCount + 1) / 2))
)
SELECT ROUND(AVG(LAT_N), 4)
FROM MiddleValues;

--Write a query identifying the type of each record in the TRIANGLES table using its
--three side lengths. Output one of the following statements for each record in the
--table:
--· Equilateral: It's a triangle with 3 sides of equal length.
--. Isosceles: It's a triangle with 2 sides of equal length.
--. Scalene: It's a triangle with 3 sides of differing lengths.
--. Not A Triangle: The given values of A, B, and C don't form a triangle.

SELECT
    CASE
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR A = C OR B = C THEN 'Isosceles'
        ELSE 'Scalene'
    END AS TriangleType
FROM
    TRIANGLES;

--Generate the following two result sets:
--1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately
--followed by the first letter of each profession as a parenthetical (i.e .: enclosed in
--parentheses). For example: AnActorName (A), ADoctorName (D),
--AProfessorName (P), and ASingerName(S).
--2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the
--occurrences in ascending order, and output them in the following format:
--There are a total of [occupation_count] [occupation]s.
--where [occupation_count] is the number of occurrences of an occupation in
--OCCUPATIONS and [occupation] is the lowercase occupation name. If more
--than one Occupation has the same [occupation_count], they should be
--ordered alphabetically.
--Note: There will be at least two entries in the table for each type of occupation.
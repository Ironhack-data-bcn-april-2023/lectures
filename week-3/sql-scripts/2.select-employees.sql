USE employees;
SELECT * FROM departments;

-- lowercase or uppercase
-- indent/not-indent
	-- different lines
    
SELECT * 
	FROM departments;
    
SELECT first_name, last_name, gender
	FROM employees;

-- Alias is only for the query
-- and the "print" (result set)
-- alias don't modify the actual table
SELECT birth_date AS BIRTHDAY,
first_name, last_name, gender
	FROM employees;

SELECT * FROM employees;

-- Select things with conditions
-- Select only women from employees

SELECT first_name, last_name, gender
	FROM employees
		WHERE gender = "F";
        
-- Multiple conditions
-- All the Women named Nevin
SELECT first_name, last_name,
gender 
	FROM employees
		WHERE gender = "F" AND
        first_name = "Nevin";
        
-- Either woman or name is parto
SELECT first_name, gender
	FROM employees
		WHERE first_name = "Parto" 
			OR gender = "F";
            
-- Women named Bezalel OR men
SELECT first_name, gender
	FROM employees
		WHERE (first_name = "Bezalel"
        AND gender = "F")
        OR gender = "M";
        
-- Filter by things I don't see?
SELECT first_name, last_name 
	FROM employees
		WHERE (first_name = "Bezalel"
			AND gender = "F")
			OR gender = "M";

-- SELECT -> df[["col1", "col2"]]
-- WHERE -> df[df[col1] == "something"]

-- df[df[gender] == "F"][["name", "last_name"]]
-- 1. WHERE clause, 2. SELECT

-- Many OR conditions
-- Hugo, Mark, Ramzi
SELECT first_name, last_name, gender
	FROM employees
		WHERE first_name = "Hugo"
			OR first_name = "Mark"
            OR first_name = "Ramzi";
            
SELECT first_name, last_name, gender
	FROM employees
		WHERE first_name 
			IN ("Hugo", "Mark", "Ramzi");

-- NOT Hugo, Mark or Ramzi
SELECT first_name, last_name, gender
	FROM employees
		WHERE first_name
			NOT IN ("Hugo", "Mark", "Ramzi");

-- Strings are not case sensitive
SELECT * FROM employees
	WHERE first_name = "hugo";

-- %: anything & any number of times
-- All the names starting with "Ann"
SELECT * FROM employees	
	WHERE first_name LIKE ("ann%");
    
-- Name contains "ann"
SELECT * FROM employees	
	WHERE first_name LIKE ("%ann%");

-- Anything & only limited characters that are different
-- Anneli
SELECT * FROM employees
	WHERE first_name LIKE ("ann___");
    
-- %: any/any times
-- _: any/only once

-- Every MAN (gender) born in 1955(birth_date)
SELECT first_name, birth_date, gender
	FROM employees
    WHERE gender = "M"
		AND birth_date LIKE ("1955%");

-- Everyone born in the 60s
SELECT first_name, birth_date, gender
	FROM employees
		WHERE birth_date LIKE ("196%");
        
-- Everyone born between 1964 and 1969
SELECT first_name, birth_date, gender
	FROM employees
		WHERE birth_date 
			BETWEEN "1964-01-01" 
            AND "1969-12-31";

-- Everyone born between Jan-Jun 1960
-- MySQL 
SELECT * FROM employees
	WHERE birth_date 
		BETWEEN "1960-01-01"
        AND "1960-06-30";

-- Every women hired in the 1990s (decade)
SELECT *
	FROM employees
		WHERE gender = "F"
        AND hire_date BETWEEN 
		"1990-01-01"  AND "1999-12-31";

SELECT *
	FROM employees
		WHERE gender = "F"
        AND hire_date LIKE 
		("199%");
        
-- Salaries
SELECT * FROM salaries;
SELECT * FROM salaries
	WHERE salary 
		BETWEEN 70000 and 80000;
        
SELECT * FROM salaries
	WHERE salary 
		>= 70000 AND salary < 80000
        
	ORDER BY salary ASC;
    
SELECT * FROM salaries
	WHERE salary 
		>= 70000 AND salary < 80000
        
	ORDER BY salary DESC;

SELECT * 
	FROM employees
    WHERE first_name BETWEEN 
		"C" AND "J"
	ORDER BY first_name ASC;
    
-- NOT NULL
SELECT * FROM employees WHERE birth_date 
IS NOT NULL;


SELECT AVG(salary) as AVERAGE FROM salaries;

-- How much has this company spent?
SELECT SUM(salary) as the_total FROM salaries;

SELECT COUNT(emp_no) AS everyone from SALARIES;
 
SELECT emp_no, salary as GROSS
	FROM SALARIES;

-- AFTER_TAX
-- 100 -> 20%
-- salary * 0.8

SELECT emp_no, salary as GROSS,
	(salary * 0.8) as AFTER_TAX
	FROM SALARIES;

-- Percentage for each worker
-- What is the average 
-- 50

-- calculations
SELECT emp_no, salary as gross_salary,
	(salary * 0.8) as after_tax_salary,
    (salary * 0.5) as company_spends_tax,
    (salary * 1.5) as this_worker_costs_me
	FROM SALARIES
    ORDER BY this_worker_costs_me DESC;

-- Another query FROM the calculations: subquery
SELECT AVG(this_worker_costs_me) as AVG_EXPENSES_PER_WORKER
	FROM

		(SELECT emp_no, salary as gross_salary,
			(salary * 0.8) as after_tax_salary,
			(salary * 0.5) as company_spends_tax,
			(salary * 1.5) as this_worker_costs_me
			FROM SALARIES
				ORDER BY this_worker_costs_me DESC)
            
	AS calculations;


-- ROUND

SELECT emp_no, salary as gross_salary,
			ROUND(salary * 0.8) as after_tax_salary,
			ROUND(salary * 0.5) as company_spends_tax,
			ROUND(salary * 1.5) as this_worker_costs_me
			FROM SALARIES
				ORDER BY this_worker_costs_me DESC;
                
                
SELECT * FROM departments;
SELECT COUNT(*) FROM departments;

-- UNIQUE: unique
SELECT DISTINCT(COUNT(*)) FROM departments;
SELECT COUNT(first_name) FROM employees; 


-- How many names appear at least once
-- How many different names
SELECT COUNT(DISTINCT(first_name)) FROM employees;


-- Column: col1 + col2 (strings)
SELECT CONCAT(first_name, " ", last_name) as full_name
	FROM employees;
    
-- value_counts: first_names. How many times is this name repeated?
	-- 1. df["names"].value_counts()
	-- 2. df["names"].groupby("names").agg({"name":"count"})

-- What is the most frequent name in my database?
SELECT first_name, COUNT(first_name) as the_count
	FROM employees
		GROUP BY first_name
	ORDER BY the_count ASC;

-- Only the names that are the least frequent (threshold: 20)
-- 1. Group by the names
-- 2. Aggregate by the count
-- 3. Wherever the_count is less than 200 -> filter
SELECT first_name,  COUNT(first_name)  AS  the_count
	FROM employees
		GROUP BY first_name
			HAVING the_count < 200
	ORDER BY the_count DESC;



-- What are the WOMEN names that happen 80-90 times
SELECT first_name, COUNT(first_name) AS the_count
	FROM employees
		WHERE gender = "F"
		GROUP BY first_name
			HAVING the_count BETWEEN 80 and 90
	ORDER BY the_count ASC;

-- Where vs having
	-- where: before grouping (row)
    -- having: after grouping (takes the grouped thing)
		

-- Can we know the gender?
SELECT first_name, COUNT(first_name) AS the_count, gender
	FROM employees
		WHERE gender = "F"
		GROUP BY first_name
			HAVING the_count BETWEEN 80 and 90
	ORDER BY the_count ASC;

SELECT first_name, COUNT(first_name) AS the_count, gender
	FROM employees
		WHERE gender = "M"
		GROUP BY first_name
			HAVING the_count BETWEEN 0 and 200
	ORDER BY the_count ASC;

-- How many men/women in my company?
SELECT gender, COUNT(gender) as total_gender
FROM employees
	GROUP BY gender
    ORDER BY total_gender DESC;
		












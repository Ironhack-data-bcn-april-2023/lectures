-- Do men or women make more on average?
-- 1. Select columns
-- 2. From the table
-- 3. How we want the info

SELECT first_name, gender, salary
FROM salaries 
    JOIN employees
		ON salaries.emp_no = employees.emp_no
	ORDER BY salary DESC
	LIMIT 100;
    
    
-- emp: gender
-- salaries: salary

SELECT gender, ROUND(AVG(salary)) AS mean_salary
FROM salaries 
    JOIN employees
		ON salaries.emp_no = employees.emp_no
	GROUP BY gender
	ORDER BY mean_salary DESC;

-- salaries(emp_no), dep_manager(emp_no), department(dept_no)
-- What is the best paid department?
SELECT dept_name, AVG(salary) as mean_salaries
FROM salaries
	JOIN dept_manager 
		ON salaries.emp_no = dept_manager.emp_no
	JOIN departments
		ON dept_manager.dept_no = departments.dept_no
	GROUP BY dept_name
    ORDER BY mean_salaries DESC;
    
-- without grouping by
SELECT salaries.emp_no, salary, dept_no
FROM salaries
	JOIN dept_manager 
		ON salaries.emp_no = dept_manager.emp_no;


-- MySQL: inner default
USE publications;


-- authors(au_id), titleauthor(au_id), titles(title_id)
SELECT au_lname, title
FROM authors
	JOIN titleauthor
		ON titleauthor.au_id = authors.au_id
	JOIN titles
		ON titleauthor.title_id = titles.title_id;
        
-- How many titles does each author have?
-- SELECT COUNT titles...
-- 0. JOIN
-- 1. GROUP BY AUTHORS

DROP TABLE each_employee;


CREATE TABLE each_employee AS
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no
ORDER BY emp_no ASC;

DROP TABLE emp_1986;

CREATE TABLE emp_1986 AS 
SELECT 
	employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE 
	EXTRACT(year FROM employees.hire_date) = 1986
ORDER BY employees.hire_date ASC;

DROP TABLE managers;

CREATE TABLE managers AS 
	SELECT 
		departments.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
	FROM
		dept_manager
	INNER JOIN departments ON 
		departments.dept_no = dept_manager.dept_no
	INNER JOIN employees ON
		dept_manager.emp_no = employees.emp_no
	ORDER BY departments.dept_no ASC;

DROP TABLE employee_departments;

CREATE TABLE employee_departments AS
	SELECT
		employees.emp_no,
		employees.last_name,
		employees.first_name,
		dept_emp.dept_no,
		departments.dept_name
	FROM employees
	INNER JOIN dept_emp ON
		employees.emp_no = dept_emp.emp_no
	INNER JOIN departments ON
		dept_emp.dept_no = departments.dept_no
	ORDER BY dept_emp.dept_no ASC;
	
DROP TABLE hercules;

CREATE TABLE hercules AS
	SELECT
		employees.first_name,
		employees.last_name,
		employees.sex
	FROM employees
	WHERE 
		employees.first_name = 'Hercules' AND
		employees.last_name LIKE 'B%'
	ORDER BY employees.last_name ASC;
	
DROP TABLE sales_dept;

CREATE TABLE sales_dept AS
	SELECT
		dept_emp.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
	FROM employees
	INNER JOIN dept_emp ON
		dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON
		dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales'
	ORDER BY employees.last_name ASC;

DROP TABLE sales_and_dev;

CREATE TABLE sales_and_dev AS
	SELECT
		dept_emp.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
	FROM employees
	INNER JOIN dept_emp ON
		dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON
		dept_emp.dept_no = departments.dept_no
	WHERE 
		departments.dept_name = 'Sales' OR
		departments.dept_name = 'Development'
	ORDER BY departments.dept_name ASC;

CREATE TABLE last_names AS 
	SELECT last_name,COUNT(*) AS "Number of unique Last Names" 
	FROM employees 
	GROUP BY last_name
	ORDER BY last_name ASC;	
	
DROP TABLE salary_title;
	
CREATE TABLE salary_title AS
	SELECT 
		employee_departments.dept_name,
		salaries.salary
	FROM salaries
	INNER JOIN employee_departments ON
		employee_departments.emp_no = salaries.emp_no;
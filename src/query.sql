INSERT INTO each_employee 
SELECT
	salaries.id,
	employees.id,
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
LEFT JOIN salaries ON
employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no ASC
;

INSERT INTO emp_1986
SELECT 
	employees.id,
	employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE 
	EXTRACT(year FROM employees.hire_date) = 1986
ORDER BY employees.hire_date ASC;

INSERT INTO managers 
	SELECT 
		dept_manager.id,
		employees.id,
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
	
INSERT INTO employee_departments 
	SELECT
		departments.id,
		employees.id,
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
	
INSERT INTO hercules
	SELECT
		employees.id,
		employees.first_name,
		employees.last_name,
		employees.sex
	FROM employees
	WHERE 
		employees.first_name = 'Hercules' AND
		employees.last_name LIKE 'B%'
	ORDER BY employees.last_name ASC;
	
INSERT INTO sales_dept
	SELECT
		dept_emp.id,
		employees.id,
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
	
INSERT INTO sales_and_dev
	SELECT
		departments.id,
		employees.id,
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
	
INSERT INTO salary_title 
	SELECT 
		salaries.id,
		employee_departments.dept_name,
		salaries.salary
	FROM salaries
	INNER JOIN employee_departments ON
		employee_departments.emp_no = salaries.emp_no;
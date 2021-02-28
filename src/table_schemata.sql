-- SQL CHALLENGE!

-- CREATING TABLES FOR THE CORRESPONDING CSV FILES AND THEN IMPORTING THEM

DROP TABLE employees;

CREATE TABLE employees (
	id SERIAL PRIMARY KEY,
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1),
	hire_date DATE
);

DROP TABLE salaries;

CREATE TABLE salaries (
	id SERIAL PRIMARY KEY,
	emp_no INT,
	salary INT
);

DROP TABLE departments;

CREATE TABLE departments (
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR,
	dept_name VARCHAR
);

DROP TABLE dept_emp;

CREATE TABLE dept_emp (
	id SERIAL PRIMARY KEY,
	emp_no INT,
	dept_no VARCHAR
);

DROP TABLE dept_manager;

CREATE TABLE dept_manager (
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR,
	emp_no INT
);

DROP TABLE titles;

CREATE TABLE titles (
	id SERIAL PRIMARY KEY,
	title_id VARCHAR,
	title VARCHAR
);

-- CREATING THE TABLES FOR JOINING INFO IN THE QUERY SQL

DROP TABLE each_employee;

CREATE TABLE each_employee (
	salary_key INT,
	employee_key INT,
	FOREIGN KEY (employee_key) REFERENCES employees(id),
	FOREIGN KEY (salary_key) REFERENCES salaries(id),
	PRIMARY KEY (employee_key, salary_key),
	emp_no INT,
	last_name VARCHAR,
	first_name VARCHAR,
	sex VARCHAR(1),
	salary INT

);

DROP TABLE emp_1986;

CREATE TABLE emp_1986 (
	employee_key INT,
	first_name VARCHAR,
	last_name VARCHAR,
	hire_date DATE,
	FOREIGN KEY (employee_key) REFERENCES employees(id),
	PRIMARY KEY (employee_key)
);

DROP TABLE managers;

CREATE TABLE managers (
	dept_manager_key INT,
	employee_key INT,
	dept_no VARCHAR,
	dept_name VARCHAR,
	emp_no INT,
	last_name VARCHAR,
	first_name VARCHAR,
	FOREIGN KEY (employee_key) REFERENCES employees(id),
	FOREIGN KEY (dept_manager_key) REFERENCES dept_manager(id),
	PRIMARY KEY (dept_manager_key, employee_key)
);

DROP TABLE employee_departments;

CREATE TABLE employee_departments (
	dept_key INT,
	employee_key INT,
	emp_no INT,
	last_name VARCHAR,
	first_name VARCHAR,
	dept_no VARCHAR,
	dept_name VARCHAR,
	employee_id INT,
	FOREIGN KEY (employee_key) REFERENCES employees(id),
	FOREIGN KEY (dept_key) REFERENCES departments(id),
	PRIMARY KEY (employee_key, dept_key)
);
	
DROP TABLE hercules;

CREATE TABLE hercules (
	employee_id INT,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1),
	FOREIGN KEY (employee_id) REFERENCES employees(id),
	PRIMARY KEY (employee_id)
);
	
DROP TABLE sales_dept;

CREATE TABLE sales_dept (
	dept_key INT,
	employee_id INT,
	emp_no INT,
	last_name VARCHAR,
	first_name VARCHAR,
	dept_name VARCHAR,
	FOREIGN KEY (dept_key) REFERENCES dept_emp(id),
	FOREIGN KEY (employee_id) REFERENCES employees(id),
	PRIMARY KEY (dept_key, employee_id)
);

DROP TABLE sales_and_dev;

CREATE TABLE sales_and_dev (
	dept_key INT,
	emp_key INT,
	emp_no INT,
	last_name VARCHAR,
	first_name VARCHAR,
	dept_name VARCHAR,
	FOREIGN KEY (emp_key) REFERENCES employees(id),
	FOREIGN KEY (dept_key) REFERENCES departments(id),
	PRIMARY KEY (emp_key, dept_key)
);

DROP TABLE last_names;

CREATE TABLE last_names AS 
	SELECT employees.last_name,COUNT(*) AS "Number of unique Last Names" 
	FROM employees 
	GROUP BY employees.last_name
	ORDER BY employees.last_name ASC;	
	
DROP TABLE salary_title;

CREATE TABLE salary_title (
	salary_key INT,
	dept_name VARCHAR,
	salary INT,
	FOREIGN KEY (salary_key) REFERENCES salaries(id)
);
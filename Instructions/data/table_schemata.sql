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
drop table departments;
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


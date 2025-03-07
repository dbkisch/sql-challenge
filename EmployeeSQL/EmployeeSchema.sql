﻿
CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    FOREIGN KEY(emp_title_id) REFERENCES titles(title_id),
	birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR   NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
    PRIMARY KEY (emp_no)
);

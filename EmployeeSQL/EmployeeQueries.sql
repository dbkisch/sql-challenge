--DATA ANALYSIS
--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no
;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year', hire_date)= '1986'
;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments, dept_manager, employees
WHERE employees.emp_no = dept_manager.emp_no
and dept_manager.dept_no = departments.dept_no
;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments, dept_emp, employees
WHERE dept_emp.dept_no = departments.dept_no
and dept_emp.emp_no = employees.emp_no
;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
and last_name like 'B%'
;

--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees, departments, dept_emp
WHERE employees.emp_no = dept_emp.emp_no
and dept_emp.dept_no = departments.dept_no
and departments.dept_name = 'Sales'
;

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees, departments, dept_emp
WHERE employees.emp_no = dept_emp.emp_no
and dept_emp.dept_no = departments.dept_no
and departments.dept_name in ('Sales','Development')
;

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(*)
FROM employees
GROUP BY last_name
ORDER BY count(*) DESC
;

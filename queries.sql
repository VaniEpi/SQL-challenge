--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    e.gender, 
    s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON (e.emp_no = s.emp_no)
ORDER BY e.emp_no;

--2. List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date
BETWEEN '1986-01-01'
    AND '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT 
    departments.dept_no,
    departments.dept_name,
    dept_manager.emp_no,
    employees.last_name,
    employees.first_name,
    dept_manager.from_date,
    dept_manager.to_date
FROM departments
JOIN dept_manager 
ON (departments.dept_no = dept_manager.dept_no)
JOIN employees 
ON (employees.emp_no = dept_manager.emp_no)

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM dept_emp
INNER JOIN employees
ON (dept_emp.emp_no = employees.emp_no)
INNER JOIN departments
ON (departments.dept_no = dept_emp.dept_no);

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
  employees.emp_no,
  employees.last_name,
  employees.first_name,
  departments.dept_name
FROM dept_emp
JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
JOIN employees
ON (employees.emp_no = dept_emp.emp_no)
WHERE departments.dept_name = 'Sales';


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
  employees.emp_no,
  employees.last_name,
  employees.first_name,
  departments.dept_name
FROM dept_emp
JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
JOIN employees
ON (employees.emp_no = dept_emp.emp_no)
WHERE departments.dept_name IN ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;


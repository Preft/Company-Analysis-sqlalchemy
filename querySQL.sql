
--/////////////////////////////////////////////////////////////////////--
--// List of Employee Number, Last Name, First Name, Sex, and Salary //--
--/////////////////////////////////////////////////////////////////////--

SELECT employees.emp_no AS "Employee Number", employees.last_name AS "Last Name", employees.first_name AS "First Name", employees.sex AS "Sex", salaries.salary AS "Salary" FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--//////////////////////////////////////////////////////////////////////////////--
--// List of First Name, Last Name, and Hire Date for Employees hired in 1986 //--
--//////////////////////////////////////////////////////////////////////////////--

SELECT first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hire Date" FROM employees WHERE date_part('year', hire_date) = date_part('year',  date '1986-01-01');

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--// List of Department Managers's Department Number, Department Name, Employee Number, First Name, Last Name //--
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////--

SELECT dept_emp.dept_no AS "Department Number", departments.dept_name AS "Department Name", employees.emp_no AS "Manager''s Employee Number", employees.first_name AS "First Name", employees.last_name AS "Last Name"
	FROM dept_manager
	INNER JOIN employees
		ON dept_manager.emp_no = employees.emp_no 
	INNER JOIN dept_emp
  		ON employees.emp_no = dept_emp.emp_no
	INNER JOIN departments
  		ON departments.dept_no = dept_emp.dept_no 
  			WHERE (hire_date, dept_manager.dept_no) IN (SELECT MAX(hire_date), dept_no FROM dept_manager INNER JOIN employees ON dept_manager.emp_no = employees.emp_no GROUP BY dept_no);

--//////////////////////////////////////////////////////////////////////////////////--
--// List the every Employee's Number, Last Name, First Name, and Department Name //--
--//////////////////////////////////////////////////////////////////////////////////--

SELECT employees.emp_no AS "Employee''s Number", employees.last_name AS "Last Name", employees.first_name AS "First Name", departments.dept_name AS "Department Name" FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no;

--//////////////////////////////////////////////////////////////////////////////////////////////////--
--// List First Name, Last Name, and Sex when First Name is Hercules and Last Name begins with B. //--
--//////////////////////////////////////////////////////////////////////////////////////////////////--

SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex" FROM employees WHERE first_name IN ('Hercules') AND last_name LIKE 'B%';

--////////////////////////////////////////////////////////////////////////////////////////////////////--
--// List Sales Department's Employee's Employee Number, Last Name, First Name, and Department Name // --
--////////////////////////////////////////////////////////////////////////////////////////////////////--

SELECT employees.emp_no AS "Employee''s Number", employees.last_name AS "Last Name", employees.first_name AS "First Name", departments.dept_name AS "Department Name" FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE departments.dept_name = 'Sales';

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--// List Sales and Development Department's Employee's Employee Number, Last Name, First Name, and Department Name // --
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--

SELECT employees.emp_no AS "Employee''s Number", employees.last_name AS "Last Name", employees.first_name AS "First Name", departments.dept_name AS "Department Name" FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE departments.dept_name IN ('Sales', 'Development');

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--// List Sales and Development Department's Employee's Employee Number, Last Name, First Name, and Department Name // --
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--

SELECT last_name AS "Last Name", count(last_name) AS "Occurances" FROM employees GROUP BY last_name ORDER BY last_name DESC;
--1.  Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number

select employees.emp_number, last_name, first_name, sex, salary from employees
	inner join salaries on employees.emp_number = salaries.emp_number
	order by employees.emp_number;

-- 2.  Select the first name, last name, and hiring date for all employees hired in 1986

select first_name, last_name, hire_date from employees
	where date_part('year',hire_date)= 1986;

-- 3.  Select the department number, department name, employee number, last name, and first name of all managers of each department

select dept_manager.dept_number, departments.dept_name, dept_manager.emp_number, last_name, first_name from dept_manager
	inner join departments on dept_manager.dept_number = departments.dept_number
	inner join employees on dept_manager.emp_number = employees.emp_number;
	

-- 4.  Select the employee number, last name, first name, and department of each employee, ordered by employee number

select employees.emp_number, last_name, first_name, dept_name from employees
	inner join dept_emp on employees.emp_number = dept_emp.emp_number
	inner join departments on dept_emp.dept_number = departments.dept_number
	order by employees.emp_number;
	

-- 5.  Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"

select first_name, last_name, birth_date, sex from employees
	where first_name = 'Hercules' and last_name like 'B%';
	
-- 6.  Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number

select employees.emp_number, last_name, first_name, dept_name from employees
	inner join dept_emp on employees.emp_number = dept_emp.emp_number
	inner join departments on dept_emp.dept_number = departments.dept_number
	where dept_name = 'Sales'
	order by employees.emp_number;

-- 7.  Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number

select employees.emp_number, last_name, first_name, dept_name from employees
	inner join dept_emp on employees.emp_number = dept_emp.emp_number
	inner join departments on dept_emp.dept_number = departments.dept_number
	where (dept_name = 'Sales' OR dept_name = 'Development')
	order by employees.emp_number;

-- 8.  Count the number of employees, grouped by last name

select last_name, count(*) from employees
	group by last_name;

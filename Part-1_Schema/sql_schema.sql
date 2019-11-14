-- Code to easily drop tables from database
-- drop table if exists department;
-- drop table if exists employees;
-- drop table if exists titles;
-- drop table if exists dep_emp;
-- drop table if exists dep_manager;
-- drop table if exists salaries;


-- Create a table of Departments
CREATE TABLE department (
  	ID VARCHAR(50) PRIMARY KEY,
  	dept_name VARCHAR(100) NOT NULL
);
-- Create a table of Employees
CREATE TABLE employees (
  	ID integer PRIMARY KEY,
 	birth_date date NOT NULL,
  	first_name varchar(100) not null,
	last_name varchar(100) not null,
	gender varchar(100) not null,
	hire_date date not null
);
-- Create a table of Employees Titles
CREATE TABLE titles (
	emp_no integer not null,
	  FOREIGN KEY (emp_no) REFERENCES employees(ID),
 	title varchar(100) NOT NULL,
  	from_date date not null,
	to_date date not null
);
-- Create a table of Department Employees
CREATE TABLE dep_emp (
	emp_no integer not null,
	  FOREIGN KEY (emp_no) REFERENCES employees(ID),
	dep_no VARCHAR(50) not null,
	  FOREIGN KEY (dep_no) REFERENCES department(ID), 
  	from_date date not null,
	to_date date not null
);
-- Create a table of Department Manager
CREATE TABLE dep_manager (
	dep_no VARCHAR(50) not null,
	  FOREIGN KEY (dep_no) REFERENCES department(ID), 
	emp_no integer not null,
	  FOREIGN KEY (emp_no) REFERENCES employees(ID),
  	from_date date not null,
	to_date date not null
);
-- Create a table of Employees Salaries
CREATE TABLE salaries (
	emp_no integer not null,
	  FOREIGN KEY (emp_no) REFERENCES employees(ID),
	salary integer not null,
  	from_date date not null,
	to_date date not null
);

--List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
select e.last_name, e.first_name, e.gender, s.salary
from employees e
	join salaries s
		on (e.ID = s.emp_no);

-- List employees who were hired in 1986.
select last_name, first_name
from employees
where hire_date between '1986-01-01' and '1986-12-31';

--List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
select m.dep_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
from dep_manager m
	join department d
		on (d.ID=m.dep_no)
	join employees e
		on (e.ID=m.emp_no);

-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
select e.ID, e.last_name, e.first_name, d.dept_name
from employees e
	join dep_emp de
		on (e.ID=de.emp_no)
	join department d
		on (de.dep_no=d.ID);

-- List all employees whose first name is "Hercules" 
-- and last names begin with "B."
select first_name, last_name
from employees
where first_name='Hercules' and last_name like 'B%';

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, 
-- and department name.
select e.ID, e.last_name, e.first_name, d.dept_name
from employees e
	join dep_emp de
		on (e.ID=de.emp_no)
	join department d
		on (d.ID=de.dep_no)
where d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, 
-- and department name.
select e.ID, e.last_name, e.first_name, d.dept_name
from employees e
	join dep_emp de
		on (e.ID=de.emp_no)
	join department d
		on (d.ID=de.dep_no)
where d.dept_name = 'Sales' or d.dept_name='Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;

select * from departments;
select * from dept_emp;
select * from dept_manager;
select* from employees;
select * from salaries;
select * from titles;

select first_name, last_name from employees where birth_date 
between '1952-01-01' and '1952-12-31';

-- Retirement eligibility
select first_name, last_name from employees where (birth_date 
between '1952-01-01' and '1955-12-31') 
and (hire_date between '1985-01-01' and '1988-12-31');
										   
-- Number of employees retiring
select count(first_name) from employees
where (birth_date 
between '1952-01-01' and '1955-12-31') 
and (hire_date between '1985-01-01' and '1988-12-31');

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
select d.dept_name, 
dm.emp_no, 
dm.from_date, 
dm.to_date
from departments as d inner join dept_manager as dm
on d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
select ri.emp_no,
ri.first_name,
ri.last_name,
de.to_date 
into current_emp
from retirement_info as ri
inner join dept_emp as de on  
ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01');

-- Employee count by department number
select count(ce.emp_no), de.dept_no
into retire_dept
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

select * from salaries
order by to_date DESC;

select e.emp_no,
e.first_name,
e.last_name, 
e.gender, s.salary,
de.to_date
into emp_info
from employees as e
inner join salaries as s 
on (e.emp_no = s.emp_no)
inner join dept_emp as de
on (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- List of managers per department
select dm.dept_no, 
d.dept_name,
dm.emp_no,
ce.last_name,
ce.first_name,
dm.from_date,
dm.to_date
into manager_info
from dept_manager as dm
inner join departments as d 
on (dm.dept_no = d.dept_no)
inner join current_emp as ce
on (dm.emp_no = ce.emp_no);

select ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- into dept_info
from current_emp as ce 
inner join dept_emp as de
on (ce.emp_no = de.emp_no)
inner join departments as d
on (de.dept_no = d.dept_no);
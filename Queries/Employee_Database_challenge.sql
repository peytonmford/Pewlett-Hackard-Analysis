-- Deliverable 1
select e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO emp_title
from employees as e 
inner join titles as ti
on e.emp_no = ti.emp_no 
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by e.birth_date;
select * from emp_title;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_title
FROM emp_title
ORDER BY emp_no, to_date DESC;
select* from unique_title;

select count(title), title
into retiring_titles
from unique_title
group by title
order by count(title) DESC;

-- Deliverable 2

select distinct on (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
into mentorship_eligibility
from dept_emp as de
inner join employees as e
on de.emp_no =  e.emp_no
inner join titles as ti
on e.emp_no = ti.emp_no
where e.birth_date between '1965-01-01' and '1965-12-31'
order by emp_no;
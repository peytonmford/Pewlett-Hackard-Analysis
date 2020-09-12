-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);
create table employees (
	emp_no INT NOT NULL,
	birth_date DATE not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar not null,
	hire_date date not null,
	primary key (emp_no)
);
create table dept_manager (
dept_no varchar(4) not null,
	emp_no int not null,
	from_date date not null,
	to_date date not null,
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);
create table salaries (
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no)
);
create table dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
    PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	foreign key (emp_no) references employees (emp_no)
);
select * from departments;

Departments
-
dept_no varchar pk
dept_name varchar

Employees
-
emp_no int pk
birth_date date
first_name varchar
last_name varchar
gender varchar
hire_date date

Dept_Emp
-
emp_no int pk fk - Employees.emp_no
dept_no varchar pk fk - Departments.dept_no
from_date date
to_date date

Manager
-
dept_no varchar pk fk - Departments.dept_no
emp_no int pk fk - Employees.emp_no
from_date date
to_date date

Salaries
-
emo_no varchar pk fk - Employees.emp_no 
salary int
from_date date
to_date date

Titles
-
emp_no varchar pk fk - Employees.emp_no
title varchar
from_date date
to_date date




create database liveclasses;
show databases;
create table employees(
emp_no int not null unique primary key,
birth_date date not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
gender enum('m','f'),
hire_date date);
desc employees;
create table departments(
dept_no char(4) not null primary key,
dept_name varchar(40) not null unique key,
dept_location varchar(40) not null);
desc departments;
create table dept_manager(
emp_no int not null ,
dept_no char(4) not null ,
from_date date not null,
to_date date not null,
foreign key (emp_no) references employees (emp_no),
primary key (emp_no,dept_no));
desc dept_manager;











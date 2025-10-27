create database employeeDB;
use employeeDB;
create table employees(
employee_id int primary key,
first_name varchar(50),
last_name varchar(50)
);
insert into employees values
(11,"priya","dharshini"),
(12,"ragu","ram"),
(13,"durga","devi"),
(14,"tamil","arasi"),
(15,"bava","dharani");

select * from employees;
select first_name,last_name ,lower(last_name),upper(first_name) from employees;
select substring(first_name,1,4) as sub_string from employees;
select concat(first_name, " " , last_name) as concat_name from employees;

create table employee_date(
employee_id int primary key,
employee_name varchar(50),
hire_date date);

insert into employee_date values
(21,"preethi","2024-04-05"),
(22,"lokesh","2021-06-08"),
(23,"keerthi","2020-11-11");

select * from employee_date;
select employee_name,hire_date,year(now())-year(hire_date) as tenure_years from employee_date;
select employee_name,hire_date,datediff(now(),hire_date) as tenure_date from employee_date;

create table student(
student_id int primary key,
frist_name varchar(50),
last_name varchar(50)
);

insert into student values
(101,"riya","raj"),
(102,"diya","dev"),
(103,"thanyaa","sri");

select * from student;
DELIMITER //
CREATE FUNCTION getfullname(frist_name varchar(50), last_name varchar(50))
RETURNS varchar(100)
DETERMINISTIC
BEGIN
RETURN CONCAT(frist_name," ",last_name);
END //

select student_id,getfullname(frist_name,last_name) as fullname from student;
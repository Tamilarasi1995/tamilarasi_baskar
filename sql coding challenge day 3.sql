create database university;
use university;
drop table students;

create table students(
student_id int primary key,
student_name varchar(50),
department varchar(50),
gender enum('M','F'),
course varchar(50),
email varchar(100),
location varchar(50),
gpa decimal(10,2)
);

insert into students values
(501,'priya','computer science','F','BCA','priya34@gmail.com','chennai',3.6),
(502,'ramya','commerce','F','BBA','null','trichy',3.9),
(503,'tamil','maths','F','Bsc','tamilbaskar95@gmail.com','bangalore',4.0),
(504,'ragul','chemistry','M','Bsc','ragulrr@gmail.com','chennai',3.8),
(505,'dev','english','M', 'BA','null','coimbatore',4.0);


select*from students;
select distinct department from students where gpa="4.00";

select student_id,student_name from students where email is null;
select student_id,student_name from students where email is not null;

select student_id,student_name,course,gpa from students where gpa in (4.0);
select student_id,student_name,course,gpa from students where gpa between 2.0 and 3.8;
select student_id,student_name,course,gpa from students where gpa between 3.9 and 4.0;
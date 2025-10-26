create database students;
use students;
create table student_details(
student_id int primary key,
student_name varchar(50),
course_Id int
);

create table courses(
course_id int primary key,
course_name varchar(50)
);
create table enrollments(
enrollment_id int primary key,
student_id int,
course_id int,
course_name varchar(50),
foreign key (student_id) references student_details(student_id),
foreign key (course_id) references courses(course_id)
);
insert into student_details values
(501,"priya",101),
(502,"ragul",102),
(503,"regan",103),
(504,"jeni",104),
(505,"prabha",105),
(506,"logesh",106);
insert into courses values
(101,"data analytics"),
(102,"web developer"),
(103,"software testing"),
(104,"data science"),
(105,"full stack developer"),
(106,"python");
insert into enrollments values
(1,501,101,"priya"),
(2,502,102,"ragul"),
(3,503,103,"ragul"),
(4,504,104,"jeni"),
(5,505,105,"jeni"),
(6,506,106,"logesh");

select s.student_id, c.course_name from student_details as s
inner join enrollments as e
on e.student_id = s.student_id
inner join courses as c 
on c.course_id = e.course_id;
select * from student_details;

select s.student_id,c.course_name from student_details as s
left join enrollments as e
on e.student_id=s.student_id
left join courses as c
on e.course_id= c.course_id;

select s.student_id,c.course_id,c.course_name from student_details as s
right join enrollments as e
on e.student_id=s.student_id
right join courses as c
on e.course_id= c.course_id;

CREATE TABLE current_employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50)
);
INSERT INTO current_employees VALUES
(11,"Anu"),
(12,"diya"),
(13,"prabhu"),
(14,"tamil"),
(15,"bavi");

CREATE TABLE past_employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50)
);
INSERT INTO past_employees VALUES
(21,"Guna"),
(22,"harish"),
(23,"thanyaa"),
(24,"ram"),
(25,"karthi");
select emp_id,emp_name from current_employees
union 
select emp_id,emp_name from past_employees;

select emp_id,emp_name from current_employees
union all
select emp_id,emp_name from past_employees;









create database Ecommerce;
use Ecommerce;
create table products(
product_id int primary key,
product_name varchar(50),
product_price decimal(10,2)
);
insert into products values
(51,'smart phone',250000),
(52,'fan',10000),
(53,'head phones',12000),
(54,'smart watch',5000.45),
(55,'laptop',40000);

select * from products;
select * from products order by product_price desc limit 3;

CREATE TABLE sales(
 sale_id INT PRIMARY KEY,
 customer_name VARCHAR(50),
 sale_date DATE,
 Quantity INT,
 price DECIMAL(10,2)
 );
 
 select * from sales;
 INSERT INTO sales VALUES
 (121,'prince','23-04-25',12,2500),
 (122,'hussain','09-09-25',16,6000),
 (123,'thomas','17-03-24',20,2000),
 (124,'vijay','11-10-24',25,3000),
 (125,'jessy','09-09-25',30,25000);

select count(sale_id) from sales;
select sum(price) from sales;
select avg(price) from sales;
select min(price) from sales;
select max(price) from sales;

CREATE TABLE Employees (
Emp_ID INT PRIMARY KEY,
Emp_name VARCHAR(50),
Department_Name VARCHAR (50)
);


INSERT INTO Employees VALUES
(101, "pooja", "Finance"),
(102, "giri", "IT"),
(103, "achu", "IT"),
(104, "thanyaa", "Marketting"),
(105, "mona", "HR"),
(106, "bavi", "Marketting"),
(107, "sashti", "IT"),
(108, "aarathi", "sales"),
(109,"priya","sales"),
(110,"uma","IT");

select * from employees;

select department_name, count(Emp_id) as total_employee from employees 
group by department_name 
having count(Emp_id) > 3;

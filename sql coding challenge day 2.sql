create database Onlinebookstore;
use onlinebookstore;

-- create a table with primary key--
create table Books(
BookID int primary key,
title varchar(100),
author varchar(50),
publication_name varchar(100),
price decimal(10,2)
);
SELECT * FROM Books;
select * from Orders;
-- create a table with foreign key --
create table Orders(
Order_ID int primary key,
OrderDate date ,
BookID int,
quantity int,
price decimal(10,2),
foreign key (BookID) references Books(BookID)
);

-- add unique constarints to ISBN column --
alter table Books add ISBN varchar(50) Unique;

-- delete specific rows --
delete from Orders
where Order_ID<=3;

-- truncate --
truncate table Orders;

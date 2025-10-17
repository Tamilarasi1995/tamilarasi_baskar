create database hospital;
use hospital;

create table Patients(
Patient_ID int primary key,
Patient_name varchar(100),
Age int,
gender enum ("M","F"),
Admission_Date date
);
select * from Patients;
-- add coulmn --
alter table Patients add column DoctorAssigned varchar(50);

-- modify column --
alter table Patients modify column Patient_name varchar(50);

-- rename column --
alter table Patients rename to Patient_info;

truncate table Patient_info;
drop table Patient_info;




drop database if exists employeedb; --only drop if doing the personal program or in personal machine. not for company or other. this will delete all!!!!!!
create database employeedb;

use employeedb;

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    department varchar (15),
    salary decimal(6,2)
);

insert into employee values(1, 'Matt','River','ict',5000);
insert into employee values(2, 'Mary','Smith','admin',7000);

insert into employee (employeeId,firstname,lastname)
values(3,'Vera','River');

insert into employee values(4, 'Amenda','Jones',null,null);
insert into employee values(5, 'Will','Brown','ict',4000);
insert into employee values(6, 'Matt','Green','marketing',7000);


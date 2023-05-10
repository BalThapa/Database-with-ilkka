select * from employee order by salary ;

select * from employee order by salary desc;

select * from employee where salary is not null order by salary desc;

select count(*) from employee;

select count(*) as NumberOfEmployees from employee;

select count(*) as "Number Of Employees" from employee; -- better not to use this method because it could cause trouble in JavaScript.

select count(salary) from employee; --doesnt consider 'null' value.

select count(*) - count(salary) from employee;
select count(*) - count(salary) as nulls from employee;

select firstname, count(*) as amount from employee group by firstname;

select firstname, count(*) from employee group by firstname having count(*)>1;

select firstname, count(*) as amount from employee group by firstname having count(*)<2;
select firstname, count(*) as amount from employee group by firstname having amount<2;

select min(salary) as minimum from employee;

select max(salary) as maximum from employee;

select avg(salary) as average from employee;

select min(salary) as lowest, max(salary) as highest from employee;
select max(salary)-min(salary) as diff from employee;
select sum(salary) from employee;


select firstname, rand() from employee;
select firstname from employee order by rand();

select firstname,lastname from employee where lastname = 'River' or lastname = 'Smith';
select firstname,lastname from employee where lastname in ('River' , 'Smith');

select firstname,lastname from employee where lastname not in ('River' , 'Smith');

select firstname,lastname,salary from employee where salary between 5000 and 7000;

select firstname,lastname,salary from employee where salary>= 5000 and salary <=7000;

select * from employee where firstname like '_a%';--for selecting particular name.
select * from employee where firstname like '_ar%'; 
select * from employee where firstname like '___y';
select * from employee where firstname  like '%y';
select * from employee where firstname  like 'Mary_';
select * from employee where firstname  like 'Mary_%';
select * from employee where firstname  like 'Mary\_%';
select * from employee where firstname  like 'Mary%';
select * from employee where firstname  like 'M%';
select * from employee where firstname  between 'M' and 'W';
select * from employee where firstname  between 'M' and 'Will';

insert into employee values(7, 'Mary_Ann','Jonesy','admin',6500);
insert into employee values(8, 'MaryAnn','Smithy','ict',5500);

update employee set department ='marketing' where employeeId=3; 
update employee set salary =3500 where employeeId=3; 
update employee set department ='marketing' , Salary = 8000 where employeeId=4; 

update employee set firstname = 'Matias' where firstname = 'Matt';-- for updating name

update employee set firstname = 'Matias' where employeeId = 1 or employeeId = 6;--for multiple changes.

update employee set salary = round(salary*1.1);---for changing all employee salary
update employee set salary = round(salary*1.1) where firstname = 'Matt';
update employee set salary = round(salary*1.1) where salary<5000;
update employee set salary = 6000 where salary>6000;
select sum(salary) from employee;

/*update employee set salary = 7000;--if 'where' is left out then all the salary columns will be changed.

delete from employee where department='marketing';
 
delete from employee where lastname like'_m%';

delete from employee;---delete all data--


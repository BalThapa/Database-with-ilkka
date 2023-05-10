select firstname,lastname from employee;

select firstname from employee;

select distinct firstname  from employee; --only select one in case of two same names.

select firstname,lastname,department,salary from employee where lastname='River';

select firstname,department,salary from employee where lastname='River';

select firstname,department,salary from employee where lastname!='River'; -- can be used for not ! or <>

select firstname,lastname from employee where department is null;

select lastname,firstname,department,salary from employee order by lastname asc,firstname asc;

select lastname,firstname,department,salary from employee order by lastname asc,firstname desc;

select firstname from employee order by firstname desc;

select distinct firstname from employee order by firstname asc;



---instead of 'where' we can use 'having' but it should be started by 'group by'

select firstname, count(*) from employee group by firstname;
select firstname, count(*) as count from employee group by firstname;


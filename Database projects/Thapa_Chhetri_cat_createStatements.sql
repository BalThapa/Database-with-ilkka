drop database if exists catdb;
create database catdb;

use catdb;

create table cat(
    catNumber integer not null primary key,
    catName varchar(12) not null,
    catLength integer not null,
    weightKg integer not null,
    yearOfBirth integer not null
);

insert into cat values(3, 'Fatzo', 35, 6, 2012);
insert into cat values(1, 'Hairball', 33, 3, 2010);
insert into cat values(2, 'Lion II', 40, 7, 2018);
insert into cat values(5, 'Fluffy', 32, 15, 1995);
insert into cat values(6, 'Puma', 42, 10, 1990);
insert into cat values(4, 'Cute', 50, 4, 2017);
insert into cat values(7, 'Zebra', 30, 5, 2015);
insert into cat values(8, 'leo', 25, 3, 2018);


----Test Part--
select * from cat;
select yearOfBirth, catNumber, catLength from cat;
select * from cat where yearOfBirth=2000;
select * from cat where weightKg=4;
select * from cat where weightKg=3;

update cat set catName='Puma', catLength=33 where catNumber=7;
update cat set yearOfBirth=2017, catLength=32 where catNumber=2;
update cat set catName='Lion II', catLength=32, weightKg=7 where catNumber=4;
update cat set catName='Puma', catLength=33 ,yearOfBirth=1995 where catNumber=6;

delete from cat where catNumber=3;
delete from cat where catNumber=2;
delete from cat where catName='Fluffy';
delete from cat where catName='Fatzo' or catName='Fluffy'; 
delete from cat where weightKg=6 or weightKg=10 or catLength=30; 





drop user if exists 'jessica'@'localhost';
create user 'jessica'@'localhost' identified by 'DYb7bc73';

grant all privileges on catdb.* to 'jessica'@'localhost';
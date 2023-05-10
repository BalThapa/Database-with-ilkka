drop database if exists turtledb;
create database turtledb;

use turtledb;

create table turtle(
    turtleNumber integer not null primary key,
    turtleName varchar(13) not null,
    speed varchar(25) not null,
    age integer not null,
    weightKg integer not null
);

insert into turtle values(1, 'Peace', 'ridiculosly fast', 10, 100);
insert into turtle values(2, 'Turtle king', 'quicksilvery', 20, 13);
insert into turtle values(3, 'Ninja', 'normal', 2, 25);
insert into turtle values(4, 'Hard Shield', 'fast', 1, 30);
insert into turtle values(5, 'Hurrier', 'ridiculosly slow', 100, 15);
insert into turtle values(6, 'Deep Thinker', 'tarish', 200, 150);
insert into turtle values(7, 'MaxAge 2000', 'ridiculosly fast', 5, 10);


---Test Part--
select * from turtle;
select age,weightKg,turtleName from turtle;
select * from turtle where age = 2;
select * from turtle where speed = 'fast' ;
select * from turtle where speed = 'slowish';

update turtle set speed = 'slowish' where turtleNumber = 7; 
update turtle set weightKg = 15, turtleName = 'Deep Thinker' where turtleNumber = 4;
update turtle set speed = 'ridiculously fast', turtleName = 'Turtle King' where turtleNumber = 6;
update turtle set speed = 'fast', age = 19, turtleName = 'Ninja' where turtleNumber = 5;
update turtle set weightKg = 5, age = 19, speed = 'fast' where turtleNumber = 4;

delete from turtle where turtleNumber = 4;
delete from turtle where turtleNumber = 1;
delete from turtle where age = 200;

insert into turtle values (8,'ninjaTurtle' ,'fast', 5, 30);
delete from turtle where weightKg = 30 and speed = 'fast';

delete from turtle where turtleName = 'Peace' or speed= 'fast' or weightKg = 150 ;


drop user if exists 'jack'@'localhost';
create user 'jack'@'localhost' identified by 'mSQ2rmJI';

grant all privileges on turtledb.* to 'jack'@'localhost';
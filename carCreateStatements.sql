drop database if exists cardb;
create database cardb;
use cardb;

 create table car (
  carid int(11) NOT NULL,
  model varchar(20) NOT NULL,
  licence varchar(10) NOT NULL,
  imagepath varchar(255) 
 );

 insert into car values(1,'Model T','ABC-1','tmodel.png');
 insert into car (carid,model,licence) values(2,'MbW','XYZ-123');
 insert into car (model,imagepath,carid,licence) values('GtX','gtx.png',3,'A-5');

 select * from car; --for displaying whole table*/

 select model from car; --for displaying model

 select licence from car;  --for displaying licence

 select model , imagepath from car; --for displaying more than one */
 select model,imagepath from where imagepath is not null;

 select model from car where imagepath is null; 

 describe car;  --for describing table

 delete from car where carid=2; --delete certain items from table

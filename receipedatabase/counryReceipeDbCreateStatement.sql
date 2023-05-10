drop database if exist receipedb2;
create database receipedb2;

use receipedb2;

create table country(
    countryId varchar (3) not null primary key,
    countryName varchar(50) not null ,
    countryCodeAlpha2 varchar(2) not null,
    primaryLanguage varchar(30) not null 
);

create table receipe(
    receipeId integer not null primary key,
    receipeName varchar(100) not null,
    countryCode varchar(3),
    instructions varchar(1000),
    foreign key (countryCode) references country(countryId)
);

create table ingredient(
    ingredientId  integer not null primary key,
    ingredientName varchar(40) not null,
    pictureName varchar (30)
);

create table receipe_has_ingredient(
    receipeNumber integer not null,
    ingredientNumber integer not null,
    amount decimal(5,2) not null,
    unit varchar(10) not null,
    primary key(receipeNumber, ingredientNumber),
    foreign key(receipeNumber) references receipe(receipeId),
    foreign key(ingredientNumber) references ingredient(ingredientId)
);

drop user if exists 'cook'@'localhost';
create user 'cook'@'localhost' identified by 'cake123';

grant all privileges on receipedb2.* to 'cook'@'localhost';

insert into country values('FIN', 'Finland', 'FI', 'finnish');
insert into country values('SWE', 'Sweden', 'SE', 'swedish');


insert into receipe values(1, 'cake', 'FIN', 'Bake a cake...');
insert into receipe values(2, 'pancake', 'SWE', 'To make a swedish pancake...');
insert into receipe values(3, 'pannukakku', 'FIN', 'To make a finnish pancake...');

insert into ingredient values(1, 'flour', 'flour.png');
insert into ingredient values(2, 'sugar', 'sugar.png');
insert into ingredient values(3, 'egg', null);
insert into ingredient values(4, 'baking powder', 'bpowder.png');
insert into ingredient values(5, 'milk', 'cow.png');
insert into ingredient values(6, 'oil', null);
insert into ingredient values(7, 'butter', 'butter.png');
insert into ingredient values(8, 'salt', null);

--                                        (r,i,a,u)--
insert into receipe_has_ingredient values(1,1,3.5,'dl');
insert into receipe_has_ingredient values(1,2,1,'handfull');
insert into receipe_has_ingredient values(1,3,3,'big ones');
insert into receipe_has_ingredient values(2,7,150,'g');
insert into receipe_has_ingredient values(2,1,0.5,'l');
insert into receipe_has_ingredient values(2,3,1,'cup');
insert into receipe_has_ingredient values(2,4,0.5,'spoon');
insert into receipe_has_ingredient values(2,5,1,'l');
insert into receipe_has_ingredient values(2,6,1,'dl');



question 51:
create database set2


use set2

CREATE table worldtable2(
    `name` varchar(30),
    continent varchar(30),
    area int,
    `population` int,
    gdp bigint,
    PRIMARY KEY (`name`)
)

insert into worldtable2 values ('Afghanistan', 'Asia', 652230 ,25500100 ,20343000000)


insert into worldtable2 values('Albania', 'Europe', 28748, 2831741,12960000000),
('Algeria','Africa' ,2381741, 37100000, 188681000000),
('Andorra','Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000)




select `name` , population ,area from worldtable2 where area>3000000 or `population` >25000000

question 52 :
create table customer
(`id`  int,name varchar(20),referee_id int, PRIMARY KEY(`id`));

insert into customer values
(1,'Will',NULL),
(2,'Jane',NULL),
(3,'Alex',   2),
(4,'Bill',NULL),
(5,'Zack',   1),
(6,'Mark',   2);


select name from customer WHERE referee_id!=2 or referee_id is null


question 53:create table Customers
(id int,name varchar(20), PRIMARY KEY(id));

insert into Customers values
(1,'Joe'),
(2,'Henry'),
(3,'Sam'),
(4,'Max');

create table Orders
(id int,customerId int, PRIMARY KEY(id));

insert into Orders values
(1,3),
(2,1);


select * from Customers c left join  Orders o on c.id = o.customerID

select name from (select * from Customers c left join  Orders1 o on c.id = o.customerID) tabl where tabl.id1 is null

question 54 :
create table Employee(employee_id int,team_id int, PRIMARY KEY(employee_id));
insert into Employee values
(1,8),
(2,8),
(3,8),
(4,7),
(5,9),
(6,9);




select employee_id,count(team_id)  over (partition by team_id) as team from Employee ORDER BY employee_id ASC



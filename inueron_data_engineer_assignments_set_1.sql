create database ineuron

use ineuron


create table  city(
    `id` int,
    `name` varchar(30),
    country_code varchar(30),
    district varchar(30),
    `population` int
)

question 1:
select * from city where population>100000 and country_code='usa'

question 2:
select `name` from city where population>120000 and country_code='usa'

question 3:
select * from city

question 4:
select * from city where id =1661
  
 question 5: 
select * from city where country_code='jpn'

insert into city VALUES (38781,'Scottsdale','jpn','Arizona',202705)

question 6:
select `name` from city WHERE country_code='jpn'

question 7:
select CITY,STATE from station



question 28 :
create table Customers
(customer_id  int, name  varchar(20), country varchar(20));

insert into Customers values
(1,'Winston','USA'),
(2,'Jonathan','Peru'),
(3,'Moustafa','Egypt');

create table Product
(product_id   int, description varchar(20), price int);

insert into Product values
(10,'LC Phone' ,300 ),
(20,'LC T-Shirt', 10 ),
(30,'LC Book' ,45 ),
(40,'LC Keychain', 2 );

create table Orders
(order_id    int, customer_id int, product_id  int, order_date  date, quantity  int);

insert into Orders values
(1,1,10,'2020-06-10',1 ),
(2,1,20,'2020-07-01',1 ),
(3,1,30,'2020-07-08',2 ),
(4,2,10,'2020-06-15',2 ),
(5,2,40,'2020-07-01',10),
(6,3,20,'2020-06-24',2 ),
(7,3,30,'2020-06-25',2 ),
(9,3,30,'2020-05-08',3 );


select o.customer_id, c.name
from Customers c, Product p, Orders o
where c.customer_id = o.customer_id and p.product_id = o.product_id
group by o.customer_id,c.name
having 
(
    sum(case when extract(year_month from o.order_date) =  '202006' then o.quantity*p.price else 0 end) >= 100
    and
    sum(case when extract(year_month from o.order_date) =  '202007' then o.quantity*p.price else 0 end) >= 100
);



question 8:
select city from station where id%2=0



question 9:
select count(city)- count(DISTINCT(city)) from station



question 11:

SELECT DISTINCT city FROM station WHERE city REGEXP '^[AEIOUaeiou]';


question 12 :
SELECT DISTINCT city FROM station WHERE city REGEXP '[AEIOUaeiou]$';


question 13 :
SELECT DISTINCT city FROM station WHERE city REGEXP '^[^AEIOUaeiou]';


question 14:
SELECT DISTINCT city FROM station WHERE city REGEXP '[^AEIOUaeiou]$';


question 15 :
SELECT DISTINCT city FROM station WHERE city REGEXP '^[^AEIOUaeiou]'  or city REGEXP '[^AEIOUaeiou]$';



question 16:
SELECT DISTINCT city FROM station WHERE city REGEXP '^[^AEIOUaeiou]'  and city REGEXP '[^AEIOUaeiou]$';




question 17 :

reate table Product
(product_id int,product_name varchar(20),unit_price int);

insert into Product values
(1 ,'S8', 1000),
(2 ,'G4', 800),
(3 ,'iPhone', 1400);

create table Sales
(seller_id int,product_id int,buyer_id int,sale_date date,quantity int,price int);

insert into Sales values
(1,1,1,'2019-01-21',2,2000),
(1,2,2,'2019-02-17',1,800),
(2,2,3,'2019-06-02',1,800),
(3,3,4,'2019-05-13',2,2800);


alter table Product add constraint PRIMARY key (product_id)

SELECT product_id, product_name 
FROM   Product 
WHERE  product_id NOT IN (SELECT product_id
FROM   Sales WHERE  sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31');

question 18 :
select author_id as id
from Views
where author_id = viewer_id
group by author_id
order by author_id asc;




question 19 :
select round(100*d2.immediate_orders/count(d1.delivery_id),2)
immediate_percentage
from Delivery d1,
    (select count(order_date) as immediate_orders
    from Delivery 
    where order_date = customer_pref_delivery_date) d2
    group by d2.immediate_orders;


question 20:
select ad_id,
    ifnull(round(sum(action ='Clicked')/sum(action !='ignored') *100,2),0) ctr
from Ads
group by ad_id
order by ctr desc, ad_id;



question 21 :

create table Employee
(employee_id int, team_id int);

insert into Employee values
(1,8),
(2,8),
(3,8),
(4,7),
(5,9),
(6,9);

SELECT employee_id, COUNT(team_id) OVER (PARTITION BY team_id) team_size
FROM Employee order by employee_id;

question 22:
CREATE DATABASE ineuorn


use ineuorn

create table Countries
(country_id int, country_name varchar(20));

insert into Countries values
(2,'USA'),
(3,'Australia'),
(7,'Peru'),
(5,'China'),
(8,'Morocco'),
(9,'Spain');


create table Weather
(country_id int, weather_state int, day  date);

insert into Weather values
(2,15,'2019-11-01'),
(2,12,'2019-10-28'),
(2,12,'2019-10-27'),
(3,-2,'2019-11-10'),
(3,0 ,'2019-11-11'),
(3,3 ,'2019-11-12'),
(5,16,'2019-11-07'),
(5,18,'2019-11-09'),
(5,21,'2019-11-23'),
(7,25,'2019-11-28'),
(7,22,'2019-12-01'),
(7,20,'2019-12-02'),
(8,25,'2019-11-05'),
(8,27,'2019-11-15'),
(8,31,'2019-11-25'),
(9,7 ,'2019-10-23'),
(9,3 ,'2019-12-23');

SELECT c.country_name,
       CASE
           WHEN AVG(w.weather_state ) <= 15 THEN 'Cold'
           WHEN AVG(w.weather_state ) >= 25 THEN 'Hot'
           ELSE 'Warm'
       END AS weather_type
FROM Countries AS c
INNER JOIN Weather AS w ON c.country_id = w.country_id
WHERE extract(year_month from w.day) = '201911'
GROUP BY c.country_name
order by weather_type;

question 23


question 24
create table Activity
(player_id int,device_id int,event_date date, games_played int);

insert into Activity values
(1,2,'2016-03-01',5),
(1,2,'2016-05-02',6),
(2,3,'2017-06-25',1),
(3,1,'2016-03-02',0),
(3,4,'2018-07-03',5);
alter table Activity add constraint PRIMARY KEY(player_id, event_date)



select player_id,event_date as first_login from(
select player_id,event_date,row_number() over(partition by player_id order by event_date asc) as rw from Activity) a
where a.rw = 1;


queestion 26:
create table Products(
product_id int primary key ,
product_name varchar(50),
product_category varchar(20)
);

insert into Products values
(1,'Leetcode Solutions','Book'),
(2,'Jewels of Stringology','Book'),
(3,'HP','Laptop'),
(4,'Lenovo','Laptop'),
(5,'Leetcode Kit','T-shirt');

create table Orders(
product_id int,
order_date date,
unit int,
foreign key(product_id) REFERENCES Products(product_id)
);

insert into Orders values
(1,'2020-02-05',60),
(1,'2020-02-10',70),
(2,'2020-01-18',30),
(2,'2020-02-11',80),
(3,'2020-02-17',2 ),
(3,'2020-02-24',3 ),
(4,'2020-03-01',20),
(4,'2020-03-04',30),
(4,'2020-03-04',60),
(5,'2020-02-25',50),
(5,'2020-02-27',50),
(5,'2020-03-01',50);

select  product_name from (
select  distinct product_name,sum(o.unit) over (partition by o.product_id) total_ordered
from Products p
join
Orders o
on  
p.product_id = o.product_id
where extract(year_month from o.order_date) = '202002')
temp where temp.total_ordered >= 100 ;


question 27:
create table Users
(user_id int,name varchar(20),mail varchar(30));

insert into Users values
(1,'Winston','winston@leetcode.com'),
(2,'Jonathan','jonathanisgreat'),
(3,'Annabelle','bella-@leetcode.com'),
(4,'Sally','sally.come@leetcode.com'),
(5,'Marwan','quarz#2020@leetcode.com'),
(6,'David','david69@gmail.com'),
(7,'Shapiro','.shapo@leetcode.com');

SELECT *
FROM Users
WHERE mail REGEXP ('^[a-zA-Z][a-zA-Z0-9\_\.\-]*@leetcode.com');



question 29:
create table TVProgram
(program_date   date,content_id  int, channel   varchar(20));

insert into TVProgram values
(STR_TO_DATE('2020-06-10 08:00','%Y-%m-%d %H:%i'),1,'LC-Channel'),
(STR_TO_DATE('2020-05-11 12:00','%Y-%m-%d %H:%i'),2,'LC-Channel'),
(STR_TO_DATE('2020-05-12 12:00','%Y-%m-%d %H:%i'),3,'LC-Channel'),
(STR_TO_DATE('2020-05-13 14:00','%Y-%m-%d %H:%i'),4,'Disney Ch'),
(STR_TO_DATE('2020-06-18 14:00','%Y-%m-%d %H:%i'),4,'Disney Ch'),
(STR_TO_DATE('2020-07-15 16:00','%Y-%m-%d %H:%i'),5,'Disney Ch');

create table Content
(content_id int,title  varchar(20), Kids_content  varchar(2), content_type  varchar(20));
insert into Content values
(1,'Leetcode Movie','N','Movies'),
(2,'Alg. for Kids','Y','Series'),
(3,'Database Sols','N','Series'),
(4,'Aladdin','Y','Movies'),
(5,'Cinderella','Y','Movies');



    
    
    
select distinct title
from Content c
join TVProgram t on c.content_id = t.content_id
where kids_content = 'Y' 
    and content_type = 'Movies' 
    and extract(year_month from program_date) = '202006';

question 31:
create table NPV
(id   int, year   int, npv    int);

insert into NPV values
(1 ,2018,100),
(7 ,2020,30 ),
(13,2019,40 ),
(1 ,2019,113),
(2 ,2008,121),
(3 ,2009,12 ),
(11,2020,99 ),
(7 ,2019,0  );

create table Queries
(id int, year int);

insert into Queries values
(1 ,2019),
(2 ,2008),
(3 ,2009),
(7 ,2018),
(7 ,2019),
(7 ,2020),
(13,2019);

select q.id, q.year, ifnull(n.npv,0) as npv
from NPV as n
right join 
Queries as q
on  (n.id, n.year) = (q.id, q.year);


question 32:
create  table Employees
(id int, name  varchar(20));

insert into Employees values
(1,'Alice'),
(7,'Bob'),
(11,'Meir'),
(90,'Winston'),
(3,'Jonathan');

create  table EmployeeUNI
(id int, unique_id int);

insert into EmployeeUNI values
(3 ,1),
(11,2),
(90,3);

select IFNULL(unique_id,'null')unique_id , name
from Employees emp
left join EmployeeUNI euni
on (emp.id = euni.id);


question 33:
create table Users
(id  int, name  varchar(20));

insert into Users values
(1 ,'Alice'),
(2 ,'Bob'),
(3 ,'Alex'),
(4 ,'Donald'),
(7 ,'Lee'),
(13,'Jonathan'),
(19,'Elvis');

create table Rides
(id   int, user_id  int, distance int);

insert into Rides values
(1,1 ,120),
(2,2 ,317),
(3,3 ,222),
(4,7 ,100),
(5,13,312),
(6,19,50 ),
(7,7 ,120),
(8,19,400),
(9,7 ,230);

select name, sum(ifnull(distance, 0)) as travelled_distance
from Rides r
right join Users u
on r.user_id = u.id
group by name
order by travelled_distance desc,name asc;




question 34 :
select  product_name from (
select  distinct product_name,sum(o.unit) over (partition by o.product_id) total_ordered
from Products p
join
Orders o
on  
p.product_id = o.product_id
where extract(year_month from o.order_date) = '202002')
temp where temp.total_ordered >= 100 ;



question 37:
create  table Departments
(id   int,name  varchar(30));

insert into Departments values
(1 ,'Electrical Engineering  '),
(7 ,'Computer Engineering    '),
(13,'Bussiness Administration');

create  table Students
(id   int,name   varchar(30), department_id int);

insert into Students values
(23,'Alice',1 ),
(1 ,'Bob',7 ),
(5 ,'Jennifer',13),
(2 ,'John',14),
(4 ,'Jasmine',77),
(3 ,'Steve',74),
(6 ,'Luis',1 ),
(8 ,'Jonathan',7 ),
(7 ,'Daiana',33),
(11,'Madelynn',1 );

select s.id, s.name
from Students s
left join Departments d
on s.department_id = d.id
where d.id is null;



question 42:
create table warehouse(
name varchar(20),
product_id int,
units int);

create table products(
product_id int,
product_name varchar(20),
width int,
length int,
height int);

insert into warehouse values
('LCHouse1',1,1),
('LCHouse1',2,10),
('LCHouse1',3,5),
('LCHouse2',1,2),
('LCHouse2',2,2),
('LCHouse3',4,1);



insert into products values
(1,'LC-TV',5,50,40),
(2,'LC-KeyChain',5,5,5),
(3,'LC-Phone',2,10,10),
(4,'LC-T-Shirt',4,10,20);

select name as warehouse_name,sum(a.cubic_volumne * units) 
from warehouse w join 
    (select product_id,
    product_name,length,width,height,
    (length * width * height) cubic_volumne
    from products)a 
    on w.product_id = a.product_id group by warehouse_name;


question 42:
create table sales
(
    sale_date date,
    fruit enum('apples','oranges'),
    sold_num INT
);

insert into sales VALUES
('2020-05-01','apples',10),
('2020-05-01','oranges',8),
('2020-05-02','apples',15),
('2020-05-02','oranges',15),
('2020-05-03','apples',20),
('2020-05-03','oranges',0),
('2020-05-04','apples',15),
('2020-05-04','oranges',16);



select sale_date,diff from (select *,sold_num-(lead(sold_num) over(partition by sale_date)) 
diff from sales order by sale_date,fruit)a
where a.fruit = 'apples';

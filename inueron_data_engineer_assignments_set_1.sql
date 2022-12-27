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




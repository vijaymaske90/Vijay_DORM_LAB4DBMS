
-- 1)You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the E-commerce with the schema definition given below.
create database ecommerce_lab4;
use ecommerce_lab4;

create table supplier(
sup_id int primary key,
sup_name varchar(50) not null,
sup_city varchar(50) not null,
sup_phone varchar(50) not null);

create table customer(
cus_id int primary key,
cus_name varchar(50) not null,
cus_phone varchar(50) not null,
cus_city varchar(50) not null,
cus_gender char);

create table category(
cat_id int primary key,
cat_name varchar(20) not null);

create table product(
pro_id int primary key,
pro_name varchar(20) not null default "Dummy",
pro_desc varchar(60),
cat_id int, 
foreign key(cat_id) references category(cat_id) );

create table supplier_pricing(
pricing_id int primary key,
pro_id int,
sup_id int,
foreign key(pro_id) references product(pro_id),
foreign key(sup_id) references supplier(sup_id),
sup_price int Default "0"
);

create table `order`(
order_id int primary key,
order_amount int not null,
order_date date not null,
cus_id int,
pricing_id int,
foreign key(cus_id) references customer(cus_id),
foreign key(pricing_id) references supplier_pricing(pricing_id)
);

create table rating(
rat_id int primary key,
order_id int,
foreign key(order_id) references `order`(order_id),
rat_ratestars int not null
);


-- 2)Insert the following data in the table created above

insert into supplier values
(1,		"Rajesh Retails",		"Delhi",		"1234567890"),
(2,		"Appario Ltd.",		"Mumbai",	"2589631470"),
(3,		"Knome products",	"Banglore",	"9785462315"),
(4,		"Bansal Retails",		"Kochi",		"8975463285"),
(5,		"Mittal Ltd.",		"Lucknow",	 "7898456532");

insert into customer value
(1,		"AAKASH",	"9999999999",	"DELHI",		'M'),
(2,		"AMAN",		"9785463215",	"NOIDA",		'M'),
(3,		"NEHA",		"9999999999",	"MUMBAI",		'F'),
(4,		"MEGHA",	"9994562399",	"KOLKATA",		'F'),
(5,		"PULKIT",	"7895999999",	"LUCKNOW",		'M');

insert into category value
(1,		"BOOKS"),
(2,		"GAMES"),
(3,		"GROCERIES"),
(4,		"ELECTRONICS"),
(5,		"CLOTHES");

insert into product value
(1,		"GTA V",		"Windows 7 and above with i5 processor and 8GB RAM",		2),
(2,		"TSHIRT",		"SIZE-L with Black, Blue and White variations",				5),
(3,		"ROG LAPTOP",	"Windows 10 with 15inch screen, i7 processor, 1TB SSD",		4),
(4,		"OATS",			"Highly Nutritious from Nestle",							3),
(5,		"HARRY POTTER",	"Best Collection of all time by J.K Rowling",				1),
(6,		"MILK",			"1L Toned MIlk",											3),
(7,		"Boat Earphones", "1.5Meter long Dolby Atmos",								4),
(8,		"Jeans",		"Stretchable Denim Jeans with various sizes and color",		5),
(9,		"Project IGI",	"compatible with windows 7 and above",						2),
(10,	"Hoodie",		"Black GUCCI for 13 yrs and above",							5),
(11,	"Rich Dad Poor Dad","Written by Robert Kiyosaki",							1),
(12,		"Train Your Brain",	"By Shireen Stephen",								1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

insert into `order` values
(101,			1500,		"2021-10-06",	2,		1),
(102,			1000,		"2021-10-12",	3,		5),
(103,			30000,		"2021-09-16",	5,		2),
(104,			1500,		"2021-10-05",	1,		1),
(105,			3000,		"2021-08-16",	4,		3),
(106,			1450,		"2021-08-18",	1,		9),
(107,			789,		"2021-09-01",	3,		7),
(108,			780,		"2021-09-07",	5,		6),
(109,			3000,		"2021-09-10",	5,		3),
(110,			2500,		"2021-09-10",	2,		4),
(111,			1000,		"2021-09-15",	4,		5),
(112,			789,		"2021-09-16",	4,		7),
(113,			31000,		"2021-09-16",	1,		8),
(114,			1000,		"2021-09-16",	3,		5),
(115,			3000,		"2021-09-16",	5,		3),
(116,			99,			"2021-09-17",	2,		14);


INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

-- 3)Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

select count(b.cus_gender),b.cus_gender from 
(select count(p.cus_id), p.cus_id, p.cus_name, p.order_amount, p.cus_gender from 
(select `order` .*, Customer.cus_gender, Customer.cus_name from `order` 
inner join Customer where`order`.cus_id=Customer.cus_id having `order`.order_amount>=3000)
 as p group by p.cus_id) 
 as b group by b.cus_gender;


-- 4)Display all the orders along with product name ordered by a customer having Customer_Id=2

select O.*, p.pro_name from `order`O, product p, supplier_pricing sp
where O.cus_id=2
and O.pricing_id =sp.pricing_id
and sp.pro_id=p.pro_id;

-- 5)Display the Supplier details who can supply more than one product.

select s.* from supplier s where s.sup_id in
(select sp.sup_id from supplier_pricing sp group by sp.sup_id having count(sup_id)>1)
group by s.sup_id;

-- 6)Find the least expensive product from each category and print the table with category id, name, product name and price of the product

Select category.cat_id,category.cat_name,pro_name, min(t3.min_price) as Min_Price from category inner join
(Select product.cat_id,product.pro_name,t2.* from product inner join
(Select pro_id, min(sup_price) as Min_Price from supplier_pricing Group by pro_id)
as t2 Where t2.pro_id = product.pro_id)
as t3 Where t3.cat_id = category.cat_id Group by t3.cat_id;

-- 7)Display the Id and Name of the Product ordered after “2021-10-05”.

select pro_id, pro_name from product where pro_id in (SELECT pro_id
   FROM supplier_pricing
   WHERE pricing_id IN (SELECT o.pricing_id 
         FROM `order` o
         WHERE o.order_date >= '2021-10-05'));


-- 8)Display customer name and gender whose names start or end with character 'A'

select c.cus_name, c.cus_gender from customer c where c.cus_name LIKE 'A%' or c.cus_name LIKE '%a';

-- Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

DELIMITER &&
Create Procedure proc()
Begin
Select report.sup_id,report.sup_name,report.Rating,
Case
When report.Rating = 5 Then 'Excellent Service'
When report.Rating > 4 Then 'Good Service'
When report.Rating > 2 Then 'Average Service'
Else 'Poor Service'
End As Type_of_Service from
(Select final.sup_id,supplier.sup_name,final.Rating from 
(Select test2.sup_id,sum(test2.rat_ratestars)/count(test2.rat_ratestars) as Rating from 
(Select supplier_pricing.sup_id,test.order_id,test.rat_ratestars from supplier_pricing inner join
(Select `order`.pricing_id,rating.order_ID,rating.rat_ratestars from `order` inner join rating on rating.order_id = `order`.order_id) as test
on test.pricing_id = supplier_pricing.pricing_id)
as test2 Group by supplier_pricing.sup_id)
as final inner join supplier where final.sup_id = supplier.sup_id) as report;
End &&
DELIMITER ;
call proc();
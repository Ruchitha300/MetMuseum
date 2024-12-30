create database museum;

use museum;

create table met(
ID INT PRIMARY KEY,
Department varchar(100),
Category varchar(100),
Title varchar(100),
Artist varchar(100),
Date varchar(100),
Medium varchar(100),
Country varchar(100));

select * from met;

-- 1. Select the top 10 rows in the met table.

select * from met limit 10;

-- 2. How many pieces are in the American Metropolitan Art collection, 
      -- where each record in the table represents the unique piece in the museum? 

select count(*) from met where Country = "United STates";

-- 3. Count the number of pieces where the category includes ‘celery’.

select distinct(Category) from met;

select * from met where Category like 'Celery%';

select count(*) from met;

-- 4. Find the title and medium of the oldest piece(s) in the collection.

select Title, Medium from met order by Date limit 1;

-- 5. Find the top 10 countries with the most pieces in the collection.

select * from
(select Country, count(Title) as count from met 
group by Country) as piece_count 
order by count desc
limit 10;

-- 6. Find the categories which have more than 100 pieces.

select Category, count(Category) from met group by Category having count(Category) > 100;

-- 7. Count the number of pieces where the medium contains ‘gold’ or ‘silver’ and sort in descending order.

select Medium , count(Medium) from met 
where Medium like "%Gold%" or Medium like '%Silver%'
group by Medium
order by count(Medium) desc ;

 

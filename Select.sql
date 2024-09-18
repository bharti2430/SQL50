-- Q1) find the ids of products that are both low fat and recyclable.
select product_id from Products
where low_fats='Y' and recyclable='Y';

-- Q2) Find the names of the customer that are not referred by the customer with id = 2.
select name from Customer
where referee_id!=2 or referee_id is null;

-- Q3) find the name, population, and area of the big countries.
select name,population,area from world
where area>=3000000 or population>=25000000;

-- Q4) find all the authors that viewed at least one of their own articles. Return the result table sorted by id in ascending order.
select distinct author_id as id from views
where author_id=viewer_id
order by author_id;

-- Q5) find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
select tweet_id from tweets
where length(content)>15;

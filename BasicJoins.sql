-- Q6) show the unique ID of each user, If a user does not have a unique ID replace just show null.
select eu.unique_id as unique_id,e.name as name from Employees e
natural left join EmployeeUNI eu;

-- Q7) report the product_name, year, and price for each sale_id in the Sales table.
select p.product_name,s.year,s.price from sales s
join product p on s.product_id=p.product_id;

-- Q8) find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
SELECT 
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM 
    Visits v
LEFT JOIN 
    Transactions t ON v.visit_id = t.visit_id
WHERE 
    t.transaction_id IS NULL
GROUP BY 
    v.customer_id;

-- Q9) find all dates' id with higher temperatures compared to its previous dates (yesterday).
SELECT w1.id from weather w1 join weather w2
on w1.recordDate=DATE_ADD(w2.recordDate,Interval 1 day)
where w1.temperature>w2.temperature;

-- Q10) The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
WITH ProcessTimes AS (
    SELECT
        machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) - 
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS process_time
    FROM Activity
    GROUP BY machine_id, process_id
)
SELECT
    machine_id,
    ROUND(AVG(process_time), 3) AS processing_time
FROM ProcessTimes
GROUP BY machine_id;

-- Q11) report the name and bonus amount of each employee with a bonus less than 1000.
Select e.name,b.bonus from employee e left join bonus b
on e.empId=b.empId where b.bonus<1000 or b.bonus is null;

-- Q12)  find the number of times each student attended each exam. Return the result table ordered by student_id and subject_name.
select s.student_id,s.student_name,sub.subject_name,count(e.subject_name) as attended_exams
from students s join subjects sub left join examinations e 
on s.student_id=e.student_id and sub.subject_name=e.subject_name
group by sub.subject_name,s.student_id
order by s.student_id,sub.subject_name;

Q13) 

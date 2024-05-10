create database if not exists assessment;
use assessment;

create table if not exists worker (
worker_id int,
first_name varchar(20),
last_name varchar(20),
salary int,
joining_date datetime,
department varchar(20)
);

insert into worker values
(1,"Monika","Arora",100000,"2014-02-20 09:00:00","HR"),
(2,"Niharika","Verma",80000,"2014-06-11 09:00:00","Admin"),
(3,"Vishal","Singhal",300000,"2014-02-20 09:00:00","HR"),
(4,"Amitabh","Singh",500000,"2014-02-20 09:00:00","Admin"),
(5,"Vivek","Bhati",500000,"2014-06-11 09:00:00","Admin"),
(6,"Vipul","Diwan",200000,"2014-06-11 09:00:00","Account"),
(7,"Satish","Kumar",75000,"2014-01-20 09:00:00","Account"),
(8,"Geetika","Chauhan",90000,"2014-04-11 09:00:00","Admin");

select * from worker;

-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
select * from worker 
order by first_name asc, department desc;

-- 2.Write an SQL query to print details for Workers with the first names   “Vipul” and “Satish” from the Worker table.
select * from worker
where first_name = "Vipul" or first_name = "Satish";

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
select * from worker
where first_name like "%h";

-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 1. 
select * from worker
where salary between 5000 and 200000;

-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select * from worker
as w join worker as v
on w.worker_id = v.worker_id
where w.first_name = v.first_name or w.last_name = v.last_name or w.salary = v.salary
or w.joining_date = v.joining_date or w.department = v.department;
 
-- 6. Write an SQL query to show the top 6 records of a table.
select * from worker limit 6; 

-- 7. Write an SQL query to fetch the departments that have less than five people in them.
 select department,count(*) as total_employee 
 from worker
 group by department
 having count(*) < 5;
 
-- 8. Write an SQL query to show all departments along with the number of people in there.
  select department,count(*) as total_employee 
 from worker
 group by department;

-- 9. Write an SQL query to print the name of employees having the highest salary in each department. 
select concat(first_name," ",last_name) as Full_name , salary , department 
from worker
where salary in (select max(salary) from worker group by department);
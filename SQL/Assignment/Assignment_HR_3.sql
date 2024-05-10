use hr;

set sql_safe_updates = 0;

-- 1. Write a query to display the last name, department number, department name for all employees. 
select e.last_name, d.department_id, d.department_name 
from employees as e join departments as d
on e.department_id = d.department_id;

-- 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output.
select  d.department_name,l.city
from departments as d join locations as l
on d.location_id = l.location_id; 

-- 3. Write a query to display the employee last name,department name,location id and city of 
-- all employees who earn commission.
select e.last_name, d.department_name, l.location_id, l.city 
from employees as e join departments as d join locations as l
on e.department_id = d.department_id and d.location_id = l.location_id
where e.commission_pct is not null; 

-- 4. Display the employee last name and department name of all employees who have an 'a' 
-- in their last name 
select e.last_name, d.department_name 
from employees as e join departments as d
on e.department_id = d.department_id
where e.last_name like "%a%";

-- 5. Write a query to display the last name,job,department number and department name for 
-- all employees who work in ATLANTA. 
select e.last_name, d.department_id ,d.department_name 
from employees as e join departments as d join locations as l
on e.department_id = d.department_id and d.location_id = l.location_id
where l.city like "%atlanta%";

-- 6. Display the employee last name and employee number along with their manager's last 
-- name and manager number. 
select e.last_name, e.employee_id, m.last_name, m.manager_id 
from employees as e join managers as m
on e.manager_id = m.manager_id;

-- 7. Display the employee last name and employee number along with their manager's last 
-- name and manager number (including the employees who have no manager). 
select e.last_name, e.employee_id, m.last_name, m.manager_id 
from employees as e join managers as m
on e.manager_id = m.manager_id;

-- 8. Create a query that displays employees last name,department number,and all the 
-- employees who work in the same department as a given employee.
select e.last_name, e.department_id 
from employees as e join employees as e1
on e.employee_id = e1.employee_id
where e.department_id = e1.department_id; 

-- 9. Create a query that displays the name,job,department name,salary,grade for all 
-- employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 
alter table employees
add column grade varchar(25);

update employees
set grade = "A"
where salary >= 50000;

update employees
set grade = "B"
where salary >= 30000;

update employees
set grade = "C"
where salary < 30000;

select concat(e.first_name," ",e.last_name) as full_name, j.job_title, d.department_name, e.salary , e.grade
from employees as e join departments as d join jobs as j
on e.department_id = d.department_id and e.job_id = j.job_id;

-- 10. Display the names and hire date for all employees who were hired before their 
-- managers along withe their manager names and hire date. Label the columns as Employee 
-- name, emp_hire_date,manager name,man_hire_date
select concat(e.first_name," ",e.last_name) as Employee_name, e.hire_date as emp_hire_date ,
concat(m.first_name," ",m.last_name) as Manager_name, m.hire_date
from employees as e join managers as m
on e.manager_id = m.manager_id;

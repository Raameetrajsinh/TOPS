use hr;

-- 1. Write a query to display the last name and hire date of any employee in the same 
-- department as SALES. 
select e.last_name, e.hire_date, d.department_name
from employees as e join departments as d 
on e.department_id = d.department_id 
where d.department_name = "Sales";

-- 2. Create a query to display the employee numbers and last names of all employees who 
-- earn more than the average salary. Sort the results in ascending order of salary. 
select last_name, phone_number , salary
from employees
where salary > (select avg(salary) from employees)
order by salary;

-- 3. Write a query that displays the employee numbers and last names of all employees who 
-- work in a department with any employee whose last name contains a 'u'.
select e.last_name, e.phone_number
from employees as e join employees as e1
on e.employee_id = e1.employee_id
where e.department_id = e1.department_id and e1.last_name like "%u%";

-- 4. Display the last name, department number, and job ID of all employees whose 
-- department location is ATLANTA. 
select e.last_name, d.department_id ,e.job_id
from employees as e join departments as d join locations as l
on e.department_id = d.department_id and d.location_id = l.location_id
where l.city = "Atlanta";

-- 5. Display the last name and salary of every employee who reports to FILLMORE.
select e.last_name, e.salary
from employees as e join managers as m
on e.manager_id = m.manager_id
where m.last_name like "%Fillmore%"; 

-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department. 
select  d.department_id, e.last_name, e.job_id
from employees as e join departments as d
on e.department_id = d.department_id
where d.department_name = "Operations" ;

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all 
-- employees who earn more than the average salary and who work in a department with any 
-- employee with a 'u'in their name. 
select  d.department_id, e.last_name, e.salary
from employees as e join departments as d 
on e.department_id = d.department_id
where e.salary > (select avg(salary) from employees) and e.last_name like "%u%";

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept.
select concat(e.first_name," ",e.last_name) as full_name, j.job_title 
from employees as e join departments as d join jobs as j
on e.department_id = d.department_id and e.job_id = j.job_id
where j.job_title in (select  distinct(j.job_title)
from employees as e join departments as d join jobs as j
on e.department_id = d.department_id and e.job_id = j.job_id
where d.department_name = "Sales") ;
 
-- 9. Write a compound query to produce a list of employees showing raise percentages, 
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
-- given a 15% raise, and employees in department 6 are not given a raise. 
select concat(e.first_name," ",e.last_name) as full_name,  d.department_name
from employees as e join departments as d 
on e.department_id = d.department_id; 
 
-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.
select last_name, salary 
from employees
order by salary desc
limit 3; 

-- 11. Display the names of all employees with their salary and commission earned. Employees 
-- with a null commission should have O in the commission column 
update employees
set commission_pct = 0
where commission_pct is null;

select concat(first_name," ",last_name) as full_name, salary, commission_pct
from employees;

-- 12. Display the Managers (name) with top three salaries along with their salaries and department information.
select m.last_name, m.salary, d.deaprtment_id, d.department_name, d.location_id 
from managers as m join departments as d
on m.manager_id = d.manager_id
order by salary desc
limit 3; 
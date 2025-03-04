use hr;
--  1. Display all information in the tables EMP and DEPT.
select * 
from  employees;
select * 
from departments;

-- 2. Display only the hire date and employee name for each employee.
select hire_date,concat(first_name," ",last_name) as full_name 
from employees; 

-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title
select concat(first_name," ",last_name," , ",job_id) as Employee_and_Title 
from employees; 

-- 4. Display the hire date, name and department number for all clerks.
select hire_date,concat(first_name," ",last_name) as full_name,department_id 
from employees;

-- 5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT
select concat(employee_id,first_name,",",last_name,email,phone_number,hire_date)
from employees;

-- 6. Display the names and salaries of all employees with a salary greater than 2000.
select concat(first_name," ",last_name) as full_name , salary 
from employees 
where salary > 2000;

-- 7. Display the names and dates of employees with the column headers "Name" and "StartDate"
select concat(first_name," ",last_name) as Name ,hire_date as Start_Date 
from employees ;

-- 8. Display the names and hire dates of all employees in the order they were hired.
select concat(first_name," ",last_name) as Name ,hire_date 
from employees 
order by hire_date;

-- 9. Display the names and salaries of all employees in reverse salary order.
select concat(first_name," ",last_name) as full_name , salary 
from employees 
order by salary desc;

-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.
select concat(first_name," ",last_name) as ename , department_id as deptno 
from employees 
order by salary desc;

-- 11. Display the last name and job title of all employees who do not have a manager
select last_name,job_id 
from employees;

-- 12. Display the last name, job, and salary for all employees whose job is sales representative 
-- or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
select last_name, job_id , salary 
from employees 
where (job_id = "SA_REP" or job_id = "ST_CLERK") and (salary not in (2500,3500,5000));
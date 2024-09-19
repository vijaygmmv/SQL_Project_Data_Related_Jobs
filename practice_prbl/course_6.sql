/*
    - find the job posting for the first quater have salary greater than 70k ?
    
*/

with avg_value as (

SELECT *,
avg(salary_year_avg) as avg_salary
from job_postings_fact
where EXTRACT(quarter from job_posted_date) = 1 
GROUP BY job_id
having salary_year_avg is not NULL )


SELECT * from avg_value
where avg_salary > 70
order by salary_year_avg desc

///////////////////

-- using the jan, feb, march table with union opperator

SELECT job_title_short,job_location,salary_year_avg
from(
    SELECT * from jan_jobs
    UNION all 
    SELECT * from feb_jobs
    UNION all 
    SELECT * from mar_jobs) as quarter_jobs
where salary_year_avg > 70000 and job_title_short ='Data Analyst'
order by salary_year_avg desc 
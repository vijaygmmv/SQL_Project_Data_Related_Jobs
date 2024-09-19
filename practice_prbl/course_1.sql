
SELECT 
    job_schedule_type,
    job_posted_date,
    COALESCE(avg(salary_year_avg),0 ) as avg_salary_year,
    COALESCE(avg(salary_hour_avg),0) as avg_salary_hour
from job_postings_fact
where 
    job_posted_date > '2023-06-01'
GROUP BY 
    job_schedule_type,job_posted_date
limit 100 offset 100; 
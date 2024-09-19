/*
 - To categorize the salary from each job posting like (high-medium-low)
 - only for Data-centric role in India 
 - Add "NOT INCLUDED" sign to salaries that contain null values
*/

SELECT *
FROM (
    SELECT 
        job_title_short,
        job_location,
        salary_year_avg,
        CASE
            WHEN salary_year_avg IS NULL THEN 'NOT INCLUDED'
            WHEN COALESCE(salary_year_avg, 0) > 100000 THEN 'high_salary'
            WHEN COALESCE(salary_year_avg, 0) < 60000 THEN 'low_salary'
            ELSE 'medium'
        END AS salary_range
    FROM job_postings_fact
    WHERE 
        job_title_short LIKE 'Data%' 
        AND job_location = 'India'
    GROUP BY job_title_short, job_location, salary_year_avg
) AS new_column;

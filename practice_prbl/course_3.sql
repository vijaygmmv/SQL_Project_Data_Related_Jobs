SELECT cam.name,EXTRACT(quarter from job_posted_date) as dates,
job_health_insurance
FROM job_postings_fact job 
left JOIN company_dim as cam  ON job.company_id = cam.company_id
where EXTRACT(quarter from job_posted_date) = 2 and job_health_insurance = True
ORDER BY dates
limit 100;
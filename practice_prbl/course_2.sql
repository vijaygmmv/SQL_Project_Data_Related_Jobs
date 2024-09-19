SELECT
concat(extract(month from job_posted_date ),' th  month')as posted_month,
count(job_id) as total_jobs
FROM job_postings_fact
GROUP BY posted_month
ORDER BY posted_month ASC
LIMIT 100;



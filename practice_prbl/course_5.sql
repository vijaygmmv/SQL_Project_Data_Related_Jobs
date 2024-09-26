--  What is the most in demand  skills in Data Roles in India

WITH remote_jobs as (
    select sj.skill_id,count(*) as job_count 
    from 
        skills_job_dim sj
    inner JOIN job_postings_fact jo on 
    jo.job_id = sj.job_id
    where 
        jo.job_work_from_home = TRUE and jo.job_title_short like '%Data%'
    group by 
        sj.skill_id
    )

SELECT 
    sd.skills,rj.skill_id,rj.job_count 
FROM 
    remote_jobs rj
inner JOIN skills_dim sd on rj.skill_id = sd.skill_id
ORDER BY job_count desc
LIMIT 5

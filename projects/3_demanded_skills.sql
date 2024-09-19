/* 
  QUESTION: What are the most in demand skills For Data Centric Roles in Indian?
    - Join job postings to inner join table similar to query 2
    - Identify the top 10 in-demand skills for (Data Analyst, Data Engineer, Data Scientist and Business Analyst) roles.
    - Why? Retrieves the top 10 skills with the highest demand in the job market, 
        providing insights into the most valuable skills for job seekers.
*/

select 
        sd.skills as skill_name,
        count(*) as job_count 
from 
    skills_job_dim sj
inner JOIN job_postings_fact jo on jo.job_id = sj.job_id
inner JOIN  skills_dim sd on sj.skill_id = sd.skill_id
WHERE 
    jo.job_location = 'India'
      AND (
          jo.job_title_short LIKE '%Data%' OR
          jo.job_title_short LIKE '%Business%'
          )
group by 
  sd.skills
ORDER BY 
  job_count desc
limit 10


/*

Here's the breakdown of the most demanded skills for Data Centric Indian Jobs in 2023
    - The most in-demand skills for data-Centric roles in India are SQL and Python.
    - Other essential skills include Excel, Tableau and AWS reflecting a high demand for both programming and data analysis tools.
    - Additionally, cloud technologies like AWS and Azure show growing importance in the industry.

    OUTPUT 
    ^^^^^^ 

  [
    {
      "skill_name": "sql",
      "job_count": "3854"
    },
    {
      "skill_name": "python",
      "job_count": "3517"
    },
    {
      "skill_name": "excel",
      "job_count": "1470"
    },
    {
      "skill_name": "tableau",
      "job_count": "1445"
    },
    {
      "skill_name": "aws",
      "job_count": "1401"
    },
    {
      "skill_name": "spark",
      "job_count": "1322"
    },
    {
      "skill_name": "azure",
      "job_count": "1294"
    },
    {
      "skill_name": "r",
      "job_count": "1081"
    },
    {
      "skill_name": "power bi",
      "job_count": "1008"
    },
    {
      "skill_name": "hadoop",
      "job_count": "824"
    }
  ]
/*
    QUESTION: What are the most optimal skills to learn in India? (high-paying and high in demand)
        - Identify skills in high demand and associated with high average salaries for Data Centric roles
        - Focuses on Indian location with specified salaries
        - Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
            offering strategic insights for career development in data Centric roles
*/


WITH Demanded_skills as (
    select 
        sd.skill_id as skill_id,
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
    group by sd.skill_id
    ORDER BY job_count desc
    limit 10
),

salary as (
    select 
        sd.skill_id as skills_id,
        sd.Skills as skill,
        round(avg(jo.salary_year_avg)) as Avg_salary_year
    from 
        skills_job_dim sj
    inner JOIN job_postings_fact jo on jo.job_id = sj.job_id
    inner JOIN  skills_dim sd on sj.skill_id = sd.skill_id
    where
        jo.job_title_short like '%Data%' and jo.salary_year_avg is not NULL
    group by 
        skills_id
)

select 
    ds.skill_name,
    ds.skill_id,
    ds.job_count,
    sa.Avg_salary_year as avgs
from 
    Demanded_skills ds
inner JOIN salary sa on ds.skill_id = sa.skills_id
order BY 
    ds.job_count DESC, sa.Avg_salary_year DESC
LIMIT 10


/*
Here's a breakdown of the most optimal skills for Data Centric Indian Jobs in 2023:    
    - High-Paying Skills: Skills like Spark and Hadoop offer the highest average salaries, at ₹142,458 and ₹138,875 respectively, 
        indicating that these technologies command significant compensation in the data analytics field.
    - High-Demand Skills: SQL and Python are the most frequently required skills in job postings,
        with 3854 and 3517 job listings respectively, showing that they are highly sought after by employers.
    - Balancing Salary and Demand: Python stands out as a skill that balances both high demand and high salary, 
        with an average salary of ₹133,137 and significant job availability.
    - Emerging Technologies: Skills in AWS and Azure also show strong average salaries (₹137,478 and ₹131,486) and substantial job counts,
        highlighting the importance of cloud technologies in the current job market.
    - Visualization Tools: While not as high in average salary compared to other skills,
        Tableau is still notable with a decent average salary of ₹117,769 and a high demand count of 1445, underscoring its value in data visualization.


    OUTPUT 
    ^^^^^^ 
    [
    {
        "skill_name": "sql",
        "skill_id": 0,
        "job_count": "3854",
        "avgs": "125844"
    },
    {
        "skill_name": "python",
        "skill_id": 1,
        "job_count": "3517",
        "avgs": "133137"
    },
    {
        "skill_name": "excel",
        "skill_id": 181,
        "job_count": "1470",
        "avgs": "100124"
    },
    {
        "skill_name": "tableau",
        "skill_id": 182,
        "job_count": "1445",
        "avgs": "117769"
    },
    {
        "skill_name": "aws",
        "skill_id": 76,
        "job_count": "1401",
        "avgs": "137478"
    },
    {
        "skill_name": "spark",
        "skill_id": 92,
        "job_count": "1322",
        "avgs": "142458"
    },
    {
        "skill_name": "azure",
        "skill_id": 74,
        "job_count": "1294",
        "avgs": "131486"
    },
    {
        "skill_name": "r",
        "skill_id": 5,
        "job_count": "1081",
        "avgs": "127585"
    },
    {
        "skill_name": "power bi",
        "skill_id": 183,
        "job_count": "1008",
        "avgs": "107897"
    },
    {
        "skill_name": "hadoop",
        "skill_id": 97,
        "job_count": "824",
        "avgs": "138875"
    }
    ]

*/

/* 
    Question: What skills are required for the top-paying data-Centric jobs in India? (Data Analyst, Data Engineer, Data Scientist, and Business Analyst)
      - Use the top 10 highest-paying Data Centric jobs in India from first query
      - Add the specific skills required for these roles
      - Why? It provides a detailed look at which high-paying jobs demand certain skills, 
          helping job seekers understand which skills to develop that align with top salaries
*/


WITH top_paying_jobs AS (
    SELECT 
        j.job_id,
        j.job_title_short,
        c.name AS company_name,
        j.salary_year_avg
    FROM 
      job_postings_fact AS j
    LEFT JOIN company_dim AS c ON j.company_id = c.company_id
    WHERE j.salary_year_avg IS NOT NULL 
      AND j.job_location = 'India'
      AND (
          j.job_title_short LIKE '%Data%' OR
          j.job_title_short LIKE '%Business%'
          )
    ORDER BY 
      j.salary_year_avg DESC
    LIMIT 10
)

-- Query to select skills from the top-paying jobs

SELECT  
    top.job_title_short,
    top.company_name,
    sd.skills,
    top.salary_year_avg
FROM 
  top_paying_jobs AS top
INNER JOIN skills_job_dim AS sj ON top.job_id = sj.job_id
INNER JOIN skills_dim AS sd ON sj.skill_id = sd.skill_id
ORDER BY 
  top.salary_year_avg DESC;


/*
  Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
    - Top-paying roles like Senior Data Engineer at Bristol Myers Squibb offer ₹181,765 annually, valuing skills such as Python, AWS, and Tableau.
    - Data Scientist positions at companies like Micron and Shell, with salaries around ₹170,575, prioritize skills like SQL, Python, and Snowflake.
    - Overall, SQL, Python, and AWS emerge as key skills for high-paying data roles in India.


    OUTPUT 
    ^^^^^^ 
  [
    {
      "job_title_short": "Senior Data Engineer",
      "company_name": "Bristol Myers Squibb",
      "skills": "python",
      "salary_year_avg": "181765.0"
    },
    {
      "job_title_short": "Senior Data Engineer",
      "company_name": "Bristol Myers Squibb",
      "skills": "aws",
      "salary_year_avg": "181765.0"
    },
    {
      "job_title_short": "Senior Data Engineer",
      "company_name": "Bristol Myers Squibb",
      "skills": "excel",
      "salary_year_avg": "181765.0"
    },
    {
      "job_title_short": "Senior Data Engineer",
      "company_name": "Bristol Myers Squibb",
      "skills": "tableau",
      "salary_year_avg": "181765.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "skills": "shell",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "skills": "databricks",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Micron Technology",
      "skills": "sql",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Micron Technology",
      "skills": "python",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Micron Technology",
      "skills": "snowflake",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Micron Technology",
      "skills": "spark",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Micron Technology",
      "skills": "hadoop",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Micron Technology",
      "skills": "tensorflow",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Micron Technology",
      "skills": "pytorch",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Micron Technology",
      "skills": "tableau",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "KONE",
      "skills": "sql",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "KONE",
      "skills": "python",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "KONE",
      "skills": "databricks",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "KONE",
      "skills": "aws",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "KONE",
      "skills": "jira",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "KONE",
      "skills": "confluence",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "skills": "python",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "skills": "java",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "skills": "r",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "skills": "shell",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "skills": "go",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "skills": "c++",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "skills": "express",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "skills": "excel",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "skills": "kubernetes",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Senior Data Scientist",
      "company_name": "Deliveroo",
      "skills": "sql",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "HRS",
      "skills": "python",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "HRS",
      "skills": "r",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "HRS",
      "skills": "azure",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "HRS",
      "skills": "aws",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "HRS",
      "skills": "gcp",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "HRS",
      "skills": "docker",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Target",
      "skills": "sql",
      "salary_year_avg": "170000.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Target",
      "skills": "python",
      "salary_year_avg": "170000.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Target",
      "skills": "flow",
      "salary_year_avg": "170000.0"
    }
  ]

*/



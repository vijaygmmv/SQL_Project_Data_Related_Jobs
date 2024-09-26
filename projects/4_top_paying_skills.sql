/* 
    QUESTION: what are the top skills based on the salary in India?
      - Look at the average salary associated with each skill for Data Related Jobs
      - Focuses on roles with specified salaries and located in India
      - Why? It reveals how different skills impact salary levels for Data Analysts and 
          helps identify the most financially rewarding skills to acquire or improve
*/


SELECT 
    sd.skills as skill_name,
    round(avg(j.salary_year_avg)) as Avg_salary_year
from 
    skills_job_dim sj
inner JOIN job_postings_fact j on j.job_id = sj.job_id
inner JOIN  skills_dim sd on sj.skill_id = sd.skill_id
WHERE j.salary_year_avg IS NOT NULL 
      AND j.job_location = 'India'
      AND (
          j.job_title_short LIKE '%Data%' OR
          j.job_title_short LIKE '%Business%'
          )
group by 
    skill_name
ORDER BY 
    Avg_salary_year desc
limit 20


/*

Here's a breakdown of the results for top paying skills for Data Centric Jobs in India:
    - Highest Average Salaries: Skills such as RingCentral and Mongo offer the highest average salaries at ₹182,500 and ₹171,361 respectively. 
        This indicates that these skills command the top compensation in the market.
    - Strong Paying Technologies: Lua and Solidity follow closely with average salaries of ₹170,500 and ₹168,300,
        showing that they are also highly valued by employers
    - High Compensation in Emerging Skills': Objective-C and Node.js also feature prominently with average salaries of ₹164,500 and ₹161,450,
        reflecting their importance in the tech industry.
    - Diverse Skill Set: Skills such as Dplyr and Watson offer solid average salaries of ₹160,667 and ₹155,779 respectively,
        highlighting the value of diverse technologies in data analysis and AI.
    - Growing Technologies: Pytorch and AirTable show competitive average salaries of ₹148,333 and ₹147,677,
        demonstrating the growing importance of machine learning frameworks and modern data management tools.


    OUTPUT 
    ^^^^^^ 
[
  {
    "skill_name": "ringcentral",
    "avg_salary_year": "182500"
  },
  {
    "skill_name": "mongo",
    "avg_salary_year": "171361"
  },
  {
    "skill_name": "lua",
    "avg_salary_year": "170500"
  },
  {
    "skill_name": "solidity",
    "avg_salary_year": "168300"
  },
  {
    "skill_name": "objective-c",
    "avg_salary_year": "164500"
  },
  {
    "skill_name": "node",
    "avg_salary_year": "161450"
  },
  {
    "skill_name": "dplyr",
    "avg_salary_year": "160667"
  },
  {
    "skill_name": "watson",
    "avg_salary_year": "155779"
  },
  {
    "skill_name": "cassandra",
    "avg_salary_year": "155068"
  },
  {
    "skill_name": "hugging face",
    "avg_salary_year": "152537"
  },
  {
    "skill_name": "codecommit",
    "avg_salary_year": "152289"
  },
  {
    "skill_name": "rshiny",
    "avg_salary_year": "151611"
  },
  {
    "skill_name": "theano",
    "avg_salary_year": "151556"
  },
  {
    "skill_name": "mxnet",
    "avg_salary_year": "150619"
  },
  {
    "skill_name": "pytorch",
    "avg_salary_year": "148333"
  },
  {
    "skill_name": "airtable",
    "avg_salary_year": "147677"
  },
  {
    "skill_name": "gatsby",
    "avg_salary_year": "147500"
  },
  {
    "skill_name": "neo4j",
    "avg_salary_year": "147313"
  },
  {
    "skill_name": "kafka",
    "avg_salary_year": "145793"
  },
  {
    "skill_name": "scala",
    "avg_salary_year": "145678"
  }
]







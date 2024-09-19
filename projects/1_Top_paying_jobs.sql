/* 
    Question: What are the top-paying data-Centric jobs in India? (data analyst, data engineer, data scientist, and business analyst)
      - Identify the top 10 highest-paying data-Centric roles that are available in India.
      - Focuses on the job postings with specified salaries (remove nulls)
      - Additionally, I added the company name and official Link to that high-paying job posting
      why? - Highlight the top-paying opportunities for Data roles in India, offering insights into employment options.
            
*/


SELECT 
    j.job_title_short,
    c.name AS company_name,
    c.link_google,
    j.job_location,
    j.job_work_from_home,
    j.job_posted_date,
    j.job_schedule_type,
    j.salary_year_avg
FROM 
  job_postings_fact AS j
LEFT JOIN company_dim AS c ON j.company_id = c.company_id
WHERE j.salary_year_avg IS NOT NULL  
  AND j.job_location = 'India' 
  AND (
      j.job_title_short LIKE '%Data%' 
      OR
      j.job_title_short LIKE '%Business%'
      )
ORDER BY 
  j.salary_year_avg DESC
LIMIT 10; 


/*
Here's the breakdown of the top data-centric Indian jobs in 2023:
  - The Data Scientist ROle at GSK will Offer an average annual salary of $204,381.
  - Other high-paying positions include Senior Data Engineer at Bristol Myers Squibb ($181,765) and Data Scientist roles at KONE and Micron Technology, each offering around $170,575 annually.
  - These roles are full-time and based in India, with no remote work options listed.


    OUTPUT
    ^^^^^^
  [
    {
      "job_title_short": "Data Scientist",
      "company_name": "GSK",
      "link_google": "https://www.google.com/search?q=GSK&sa=X&ved=0ahUKEwjo69rYvtj-AhUTFVkFHWrzDAc4PBCYkAIIlwo",
      "job_location": "India",
      "job_work_from_home": false,
      "job_posted_date": "2023-11-07 15:11:03",
      "job_schedule_type": "Full-time",
      "salary_year_avg": "204381.0"
    },
    {
      "job_title_short": "Senior Data Engineer",
      "company_name": "Bristol Myers Squibb",
      "link_google": "https://www.google.com/search?gl=us&hl=en&q=Bristol+Myers+Squibb&sa=X&ved=0ahUKEwiNi6WP7_H_AhX3k2oFHW15DdI4RhCYkAIIpws",
      "job_location": "India",
      "job_work_from_home": false,
      "job_posted_date": "2023-12-22 15:08:33",
      "job_schedule_type": "Full-time",
      "salary_year_avg": "181765.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "KONE",
      "link_google": "https://www.google.com/search?sca_esv=583557295&gl=us&hl=en&q=KONE&sa=X&ved=0ahUKEwizsv2E8syCAxVXN0QIHfaFAsY4ChCYkAII0ww",
      "job_location": "India",
      "job_work_from_home": false,
      "job_posted_date": "2023-11-01 00:09:15",
      "job_schedule_type": "Full-time",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Micron Technology",
      "link_google": "https://www.google.com/search?sca_esv=585192112&gl=us&hl=en&q=Micron+Technology&sa=X&ved=0ahUKEwjv1bXmvt6CAxVMj2oFHefhCX4QmJACCI4N",
      "job_location": "India",
      "job_work_from_home": false,
      "job_posted_date": "2023-11-14 19:10:51",
      "job_schedule_type": "Full-time",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "link_google": "https://www.google.com/search?sca_esv=557359178&hl=en&gl=us&q=Shell&sa=X&ved=0ahUKEwjT0IGxxuCAAxX-HzQIHUjoAFUQmJACCPUL",
      "job_location": "India",
      "job_work_from_home": false,
      "job_posted_date": "2023-10-30 07:09:09",
      "job_schedule_type": "Full-time",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Senior Data Scientist",
      "company_name": "Equifax",
      "link_google": "https://www.google.com/search?ucbcb=1&gl=us&hl=en&q=Equifax&sa=X&ved=0ahUKEwiWn_Kyref9AhXIjYkEHTPzBM0QmJACCNwK",
      "job_location": "India",
      "job_work_from_home": false,
      "job_posted_date": "2023-11-01 03:09:15",
      "job_schedule_type": "Full-time",
      "salary_year_avg": "170575.0"
    },
    {
      "job_title_short": "Senior Data Scientist",
      "company_name": "Deliveroo",
      "link_google": "https://www.google.com/search?sca_esv=582900893&hl=en&gl=us&q=Deliveroo&sa=X&ved=0ahUKEwjG5fes78eCAxV-m2oFHdjnBy44HhCYkAII-wk",
      "job_location": "India",
      "job_work_from_home": false,
      "job_posted_date": "2023-12-01 12:15:07",
      "job_schedule_type": "Full-time",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "HRS",
      "link_google": "https://www.google.com/search?sca_esv=658e7cce1db0eda3&gl=us&hl=en&q=HRS&sa=X&ved=0ahUKEwiw_-_v87iCAxWWTTABHQ3-BFI4FBCYkAIIlw4",
      "job_location": "India",
      "job_work_from_home": false,
      "job_posted_date": "2023-12-09 12:06:16",
      "job_schedule_type": "Full-time",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Data Scientist",
      "company_name": "Shell",
      "link_google": "https://www.google.com/search?sca_esv=557359178&hl=en&gl=us&q=Shell&sa=X&ved=0ahUKEwjT0IGxxuCAAxX-HzQIHUjoAFUQmJACCPUL",
      "job_location": "India",
      "job_work_from_home": false,
      "job_posted_date": "2023-11-22 16:13:09",
      "job_schedule_type": "Full-time",
      "salary_year_avg": "170500.0"
    },
    {
      "job_title_short": "Senior Data Scientist",
      "company_name": "Cargill",
      "link_google": "https://www.google.com/search?hl=en&gl=us&q=Cargill&sa=X&ved=0ahUKEwj94vP80Lz9AhVtmmoFHf1tAXcQmJACCIAM",
      "job_location": "India",
      "job_work_from_home": false,
      "job_posted_date": "2023-12-20 21:08:37",
      "job_schedule_type": "Full-time",
      "salary_year_avg": "170000.0"
    }
  ] 


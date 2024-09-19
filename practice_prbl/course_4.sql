create table jan_jobs as 
    select * 
    from job_postings_fact
    where EXTRACT(MONTH from job_posted_date) = 1

create table Feb_jobs as 
    select * 
    from job_postings_fact
    where EXTRACT(MONTH from job_posted_date) = 2;

create table mar_jobs as 
    select * 
    from job_postings_fact
    where EXTRACT(MONTH from job_posted_date) = 3


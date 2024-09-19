/*
    - list the job count and the location 
    - when the location is anywhere or India then name it remote or local
    - Else name it Onsite
*/

select 
    count(job_id) as number_jobs,
    case 
        when job_location = 'Anywhere' then 'remote'
        when job_location = 'India' then ' local'
        else 'onsite'
    end as job_action
FROM job_postings_fact
where 
    job_title_short like '%Data%'
group by 
    job_action
ORDER BY
    number_jobs desc;    



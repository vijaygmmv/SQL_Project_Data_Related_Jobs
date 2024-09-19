drop table if exists job_applied;

create table job_applied(
    job_id INT primary key,
    application_sent_date date,
    Resume_file_name varchar(200),
    cover_letter_sent boolean,
    cover_letter_file_name varchar(255),
    status varchar(50)
);

INSERT INTO job_applied

values
    (1,
    '2024-02-05',
    'first_name',
    True,
    'first_cover,hard',
    'submitteds'), 

    (2,
    '2024-02-04',
    'second_name',
    True,
    'secound_cover,hard',
    'submitted'),

    (3,
    '2024-02-07',
    'third_name',
    false,
    'third_cover,hard',
    'rejected'),

    (4,
    '2024-02-01',
    'fourth_name',
    false,
    'fourth_cover,hard',
    'submitted'),
    
    (5,
    '2024-02-11',
    'fifth_name',
    false,
    'FIFTH_cover,hard',
    'rejected'
    );

-- creating table jobs_info

drop table if exists jobs_info;

CREATE table jobs_info(

    job_id serial primary key,
    job_name text,
    skills text,
    shifts text,
    foreign key (job_id) REFERENCES job_applied (job_id) 
);

INSERT INTO jobs_info (job_name,skills, shifts)
VALUES (
    'java developer',
    'java, data structure',
    'day'
  ),
  (
  'python_developer',
  'python, data structure',
  'day & night'
  ),
  (
    'data Analyst',
    'SQL, python Excel, r',
    'Day'
  ),
  (
    'data scientist',
    'tablea, sql, python, excel',
    'Day'
  ),
  (
    'Full Stack Developer',
    'html, css, javascript, sql',
    'day & night'
  );


-- to add phone_no column
alter table job_applied()
add phone_no int ;


-- update value to single column 
update job_applied
set phone_no = case resume_file_names
WHEN 'first_name' then 7625761921
WHEN 'second_name' then 3463243656
WHEN 'third_name' then 8656744382
WHEN 'fourth_name' then 9687542368
WHEN 'fifth_name' then 7465339207
ELSE phone_no
end;


 -- below are just test queries to understand the tables

/* ########################################################*/

-- particular column to null values
update job_applied
set phone_no = null

-- update without case
update job_applied
set cover_letter_sent = True
where job_id =  4 

-- to alter column datatype
alter table job_applied
alter column phone_no type bigint

-- to delete the all content of the table
delete FROM job_applied



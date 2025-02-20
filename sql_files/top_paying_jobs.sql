/*
Question: What are the top-paying data analysis jobs?
_ Identify the top 10 highest-paying Data Analysis roles that are available remotely.
_ Focuses on job postings with specified salaries (remove nulls).
_ Why? Highlight the highest-paying remote data analysis jobs to help professionals choose the best career path.
*/

SELECT 
    job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL AND
ORDER BY
    salary_year_avg DESC
LIMIT 10;
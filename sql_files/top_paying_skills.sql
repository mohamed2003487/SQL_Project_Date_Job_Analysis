/* 
Question: What are the top skills based on salary?
_ Look at the average salary associated with each skill for Data Analyst positions
_ Focuses on roles with specified salaries, regardless of location
_ Why? It reveals how different skills impact salary levels for Data Analyst and
    helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim AS skills ON skills_job_dim.skill_id = skills.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND  
    salary_year_avg IS NOT NULL AND
    job_country = 'Egypt'
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 10;
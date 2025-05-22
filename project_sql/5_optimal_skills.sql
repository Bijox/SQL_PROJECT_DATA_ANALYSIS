WITH skills_demand as (
SELECT skills_dim.skill_id, 
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL AND
      job_work_from_home = TRUE
GROUP BY skills_dim.skill_id
), average_salary as (
SELECT skills_job_dim.skill_id, 
       ROUND(AVG(salary_year_avg), 0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL AND
      job_work_from_home = TRUE
GROUP BY skills_job_dim.skill_id
)

SELECT skills_demand.skill_id,
       skills_demand.Skills,
       demand_count,
       avg_salary
FROM skills_demand
INNER JOIN average_salary on skills_demand.skill_id = average_salary.skill_id      
ORDER BY demand_count DESC,
         avg_salary DESC
LIMIT 25
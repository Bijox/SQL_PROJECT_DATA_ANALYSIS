SELECT skills,
       round(AVG(salary_year_avg), 0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
limit 25 

/* 
Key Insights
AI & Machine Learning Skills Pay Well:
Frameworks like TensorFlow, PyTorch, Keras, and MXNet are linked to high salaries, highlighting strong demand for deep learning and AI expertise.
DevOps & Infrastructure Tools Are Valuable:
Tools like Terraform, Ansible, Puppet, and VMware offer top salaries, reflecting the importance of automation and cloud infrastructure management.
Blockchain Skills Stand Out:
Solidity commands one of the highest average salaries, showing that blockchain development is a lucrative niche.
Niche Technologies Pay Off:
Skills such as Couchbase, DataRobot, and Hugging Face are highly paid, likely due to their specialized use and limited talent pool.
Modern Programming Languages Matter:
Languages like Golang and Scala are associated with high salaries, indicating demand for efficient, scalable backend development.
/*
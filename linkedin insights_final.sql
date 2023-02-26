select * from jobs J join company C on j.Company_id=c.company_id
join Details D on J.Detail_id=D.Detail_id

---print the companies situated in bengaluru and show their Linkedin followers
select company_name,sum(followers)as Followers from jobs J join company C on j.Company_id=c.company_id
join Details D on J.Detail_id=D.Detail_id
where location like 'bengaluru%'
group by company_name
order by followers desc;

---- number of jobs across different locations
select Location,count(job_id)as job_counts from  jobs
group by Location
order by count(job_id) desc

----number of applicants across different companies:
select c.company_name,sum(applicants)as Number_of_Applicants from jobs J join company C on j.Company_id=c.company_id
join Details D on J.Detail_id=D.Detail_id
group by c.company_name
order by sum(applicants) desc

-----top 10 companies with higher followers:
select top 10 company_name,sum(Followers)as Followers from company
group by company_name
order by sum(Followers) desc

----count the number of applicants where designation is 'Manager' across different companies
select c.company_name,Designation,Location,sum(Applicants)as total_applicants from jobs J join company C on j.Company_id=c.company_id
join Details D on J.Detail_id=D.Detail_id
where Designation='Manager'
group by c.company_name,Designation,Location

update jobs
set location='Delhi, India'
where location like 'Delhi, Delhi, India';

---Number of jobs under different departments
select *,
case when lower(designation) like '%hr%' or designation like '5recruiter%' or designation like '%talent%' then 'HR'
     WHEN lower(Designation) like '%data%' or designation like '%analyst%' then 'Data Science'
	 else designation end
	 as Department
from jobs;


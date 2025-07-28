create database satish;
use satish;
select count(*)
from hospital_data;
#1. Total Number of Patients 
select sum(`patients count`) as total_patients
from hospital_data;
#2. Average Number of Doctors per Hospital 
select avg(`Doctors count`) as average_number_of_doctors
from hospital_data;
#3. Top 3 Departments with the Highest Number of Patients 
select department, sum(`patients count`) as Total_number_of_patients
from Hospital_data
group by department
order by  Total_number_of_patients
limit 3;
#4. Hospital with the Maximum Medical Expenses
select `ï»¿Hospital Name`, max(`Medical Expenses`) as maximum_medical_expenses
from hospital_data
group by `ï»¿Hospital Name`
order by maximum_medical_expenses desc
limit 1;
#5. Daily Average Medical Expenses 
SET SQL_SAFE_UPDATES = 0;
UPDATE Hospital_data
SET 
  `admission date` = STR_TO_DATE(`Admission date`, '%d-%m-%Y'),
  `discharge date` = STR_TO_DATE(`discharge date`, '%d-%m-%Y');
SELECT 
  `ï»¿Hospital Name`, 
  ROUND(SUM(`Medical Expenses`) / SUM(DATEDIFF(`discharge date`, `admission date`)), 2) AS avg_expense_per_day
FROM hospital_data
GROUP BY `ï»¿Hospital Name`
ORDER BY avg_expense_per_day DESC;
#6. Longest Hospital Stay 
SELECT *,
 DATEDIFF(`discharge date`, `admission date`) AS longest_stay
FROM hospital_data
ORDER BY longest_stay DESC;
#7. Total Patients Treated Per City
select location as city, sum(`patients count`) as total_number_of_patients
from hospital_data
group by location
order by  total_number_of_patients desc;
#8. Average Length of Stay Per Department 
SELECT department,
 round(avg(DATEDIFF(`discharge date`, `admission date`)),2) AS longest_stay
FROM hospital_data
group by department
ORDER BY longest_stay DESC;
#9. Identify the Department with the Lowest Number of Patients 
SELECT department,
sum(`patients count`) as minimum_number_of_patients
FROM hospital_data
group by department
ORDER BY minimum_number_of_patients asc
limit 1;

#10. Monthly Medical Expenses Report 
SELECT 
  DATE_FORMAT(`discharge date`, '%M %Y') AS month,
 ROUND(SUM(`medical expenses`),2) AS total_medical_expenses
FROM hospital_data
GROUP BY month
ORDER BY month;


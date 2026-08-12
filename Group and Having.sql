use healthcaredb;
# GROUP
#Q1. Count the number of patients in each city.
SELECT city,
       COUNT(*) AS Total_Patients
FROM Patients
GROUP BY city;
#Q2. Count the number of patients in each blood group.
SELECT blood_group,
       COUNT(*) AS Total_Patients
FROM Patients
GROUP BY blood_group;
#Q3. Count the number of doctors in each department.
SELECT department_id,
       COUNT(*) AS Total_Doctors
FROM Doctors
GROUP BY department_id;
#Q4. Find the average salary of doctors in each department.
SELECT department_id,
       AVG(salary) AS Average_Salary
FROM Doctors
GROUP BY department_id;
#Q5. Find the highest salary in each department.
SELECT department_id,
       MAX(salary) AS Highest_Salary
FROM Doctors
GROUP BY department_id;
#Q6. Find the lowest salary in each department.
SELECT department_id,
       MIN(salary) AS Lowest_Salary
FROM Doctors
GROUP BY department_id;
#Q7. Find the total salary paid in each department.
SELECT department_id,
       SUM(salary) AS Total_Salary
FROM Doctors
GROUP BY department_id;
#Q8. Count appointments by status.
SELECT status,
       COUNT(*) AS Total_Appointments
FROM Appointments
GROUP BY status;
#Q9. Count appointments for each doctor.
SELECT doctor_id,
       COUNT(*) AS Total_Appointments
FROM Appointments
GROUP BY doctor_id;
#Q10. Find the total consultation fees collected by each doctor.
SELECT doctor_id,
       SUM(consultation_fee) AS Total_Fees
FROM Appointments
GROUP BY doctor_id;
#Q11. Find the average consultation fee for each doctor.
SELECT doctor_id,
       AVG(consultation_fee) AS Average_Fee
FROM Appointments
GROUP BY doctor_id;
#Q12. Find the highest consultation fee charged by each doctor.
SELECT doctor_id,
       MAX(consultation_fee) AS Highest_Fee
FROM Appointments
GROUP BY doctor_id;
#Q13. Find the total treatment cost for each disease.
SELECT d.disease_name,
       SUM(t.treatment_cost) AS Total_Treatment_Cost
FROM Diagnosis d
JOIN Treatments t
ON d.diagnosis_id = t.diagnosis_id
GROUP BY d.disease_name;
#Q14. Count patients diagnosed with each disease.
SELECT disease_name,
       COUNT(*) AS Total_Patients
FROM Diagnosis
GROUP BY disease_name;
#Q15. Find the average treatment cost by disease.
SELECT d.disease_name,
       AVG(t.treatment_cost) AS Average_Treatment_Cost
FROM Diagnosis d
JOIN Treatments t
ON d.diagnosis_id = t.diagnosis_id
GROUP BY d.disease_name;
#Q16. Find the total billing amount for each payment status.
SELECT payment_status,
       SUM(total_amount) AS Total_Billing
FROM Billing
GROUP BY payment_status;
#Q17. Find the average billing amount by payment status.
SELECT payment_status,
       AVG(total_amount) AS Average_Billing
FROM Billing
GROUP BY payment_status;
#Q18. Count bills by payment status.
SELECT payment_status,
       COUNT(*) AS Total_Bills
FROM Billing
GROUP BY payment_status;
#Q19. Count registrations by city.
SELECT city,
       COUNT(*) AS Total_Registrations
FROM Patients
GROUP BY city;
#Q20. Count doctors by specialization.
SELECT specialization,
       COUNT(*) AS Total_Doctors
FROM Doctors
GROUP BY specialization;

#HAVING
#Q21. Display departments having more than 2 doctors.
SELECT department_id,
       COUNT(*) AS Total_Doctors
FROM Doctors
GROUP BY department_id
HAVING COUNT(*) > 2;
#Q22. Display cities having more than 3 patients.
SELECT city,
       COUNT(*) AS Total_Patients
FROM Patients
GROUP BY city
HAVING COUNT(*) > 3;
#Q23. Display doctors whose total consultation fees exceeds ₹10000.
SELECT doctor_id,
       SUM(consultation_fee) AS Total_Fees
FROM Appointments
GROUP BY doctor_id
HAVING SUM(consultation_fee) > 10000;
#Q24. Display diseases more than 10 patient.
SELECT disease_name,
       COUNT(*) AS Total_Patients
FROM Diagnosis
GROUP BY disease_name
HAVING COUNT(*) > 10;
#Q25. Display payment statuses whose total billing exceeds ₹10000.
SELECT payment_status,
       SUM(total_amount) AS Total_Billing
FROM Billing
GROUP BY payment_status
HAVING SUM(total_amount) > 10000;
#Q26. Display departments whose average salary is greater than ₹160000.
SELECT department_id,
       AVG(salary) AS Average_Salary
FROM Doctors
GROUP BY department_id
HAVING AVG(salary) > 160000;
#Q27. Display doctors more than 5 appointments.
SELECT doctor_id,
       COUNT(*) AS Total_Appointments
FROM Appointments
GROUP BY doctor_id
HAVING COUNT(*) > 5;
#Q28. Display blood groups more than  2 patients.
SELECT blood_group,
       COUNT(*) AS Total_Patients
FROM Patients
GROUP BY blood_group
HAVING COUNT(*) >2;
#Q29. Display cities where the average patient age is above 40 years.
SELECT city,
       AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS Average_Age
FROM Patients
GROUP BY city
HAVING AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) > 40;
#Q30. Display departments whose total salary exceeds ₹26000.
SELECT department_id,
       SUM(salary) AS Total_Salary
FROM Doctors
GROUP BY department_id
HAVING SUM(salary) > 26000;
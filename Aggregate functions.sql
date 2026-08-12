# AGGREGATE FUNCTIONS
#COUNT()
# Q1. Count the total number of patients.
SELECT COUNT(*) AS Total_Patients
FROM Patients;
# Q2. Count the total number of doctors.
SELECT COUNT(*) AS Total_Doctors
FROM Doctors;
# Q3. Count the total number of appointments.
SELECT COUNT(*) AS Total_Appointments
FROM Appointments;
# Q4. Count the number of female patients.
SELECT COUNT(*) AS Female_Patients
FROM Patients
WHERE gender = 'Female';
#Q5. Count the number of doctors in each department.
SELECT department_id,
       COUNT(*) AS Total_Doctors
FROM Doctors
GROUP BY department_id;

#SUM()
#Q6. Calculate the total hospital revenue.
SELECT SUM(total_amount) AS Total_Revenue
FROM Billing;
#Q7. Calculate the total consultation fees collected.
SELECT SUM(consultation_fee) AS Total_Consultation_Fee
FROM Appointments;
#Q8. Calculate the total treatment cost.
SELECT SUM(treatment_cost) AS Total_Treatment_Cost
FROM Treatments;
#Q9. Find the total salary paid to doctors.
SELECT SUM(salary) AS Total_Doctor_Salary
FROM Doctors;
#Q10. Find the total billing amount for paid bills.
SELECT SUM(total_amount) AS Paid_Bills
FROM Billing
WHERE payment_status = 'Paid';

#AVG()
#Q11. Find the average doctor salary.
SELECT AVG(salary) AS Average_Salary
FROM Doctors;
#Q12. Find the average consultation fee.
SELECT AVG(consultation_fee) AS Average_Consultation_Fee
FROM Appointments;
#Q13. Find the average treatment cost.
SELECT AVG(treatment_cost) AS Average_Treatment_Cost
FROM Treatments;
#Q14. Find the average billing amount.
SELECT AVG(total_amount) AS Average_Bill
FROM Billing;
#Q15. Find the average experience of doctors.
SELECT AVG(experience_years) AS Average_Experience
FROM Doctors;

#MAX()
#Q16. Find the highest doctor salary.
SELECT MAX(salary) AS Highest_Salary
FROM Doctors;
#Q17. Find the highest billing amount.
SELECT MAX(total_amount) AS Highest_Bill
FROM Billing;
#Q18. Find the highest consultation fee.
SELECT MAX(consultation_fee) AS Highest_Consultation_Fee
FROM Appointments;
#Q19. Find the most experienced doctor.
SELECT MAX(experience_years) AS Maximum_Experience
FROM Doctors;
#Q20. Find the latest patient registration date.
SELECT MAX(registration_date) AS Latest_Registration
FROM Patients;

#MIN()
#Q21. Find the lowest doctor salary.
SELECT MIN(salary) AS Lowest_Salary
FROM Doctors;
#Q22. Find the lowest billing amount.
SELECT MIN(total_amount) AS Lowest_Bill
FROM Billing;
#Q23. Find the minimum consultation fee.
SELECT MIN(consultation_fee) AS Minimum_Fee
FROM Appointments;
#Q24. Find the youngest patient.
#Since the youngest patient has the latest date of birth, use MAX(date_of_birth):
SELECT *
FROM Patients
WHERE date_of_birth =
(
    SELECT MAX(date_of_birth)
    FROM Patients
);
#Q25. Find the earliest appointment date.
SELECT MIN(appointment_date) AS Earliest_Appointment
FROM Appointments;

#Count the number of male doctors.
SELECT COUNT(*) AS Male_Doctors
FROM Doctors
WHERE gender = 'Male';
#Calculate the total revenue from pending bills.
SELECT SUM(total_amount) AS Pending_Revenue
FROM Billing
WHERE payment_status = 'Pending';
#Find the average salary of doctors with more than 10 years of experience.
select avg(salary) from doctors where experience_years >10;

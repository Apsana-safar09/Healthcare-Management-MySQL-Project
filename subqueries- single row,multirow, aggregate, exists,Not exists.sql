#Subqueries
#Single row
#Q1. Find the doctor(s) with the highest salary.
SELECT *
FROM Doctors
WHERE salary = (
    SELECT MAX(salary)
    FROM Doctors
);
#Q2. Find the patient(s) with the latest registration date.
SELECT *
FROM Patients
WHERE registration_date = (
    SELECT MAX(registration_date)
    FROM Patients
);
#Q3. Find the patient(s) with the oldest date of birth.
SELECT *
FROM Patients
WHERE date_of_birth = (
    SELECT MIN(date_of_birth)
    FROM Patients
);
#Q4. Find doctors earning more than the average salary.
SELECT *
FROM Doctors
WHERE salary >
(
    SELECT AVG(salary)
    FROM Doctors
);
#Q5. Find appointments with consultation fees greater than the average consultation fee.
SELECT *
FROM Appointments
WHERE consultation_fee >
(
    SELECT AVG(consultation_fee)
    FROM Appointments
);
#Q6. Find patients whose bill amount is greater than the average billing amount.
SELECT p.patient_id,
       p.first_name,
       p.last_name,
       b.total_amount
FROM Patients p
JOIN Billing b
ON p.patient_id=b.patient_id
WHERE b.total_amount >
(
    SELECT AVG(total_amount)
    FROM Billing
);
#Q7. Find treatments costing more than the average treatment cost.
SELECT *
FROM Treatments
WHERE treatment_cost >
(
    SELECT AVG(treatment_cost)
    FROM Treatments
);
#Q8. Find doctors working in the Cardiology department.
SELECT *
FROM Doctors
WHERE department_id =
(
    SELECT department_id
    FROM Departments
    WHERE department_name='Cardiology'
);
#Q9. Find appointments handled by Cardiology doctors.
SELECT *
FROM Appointments
WHERE doctor_id IN
(
    SELECT doctor_id
    FROM Doctors
    WHERE department_id =
    (
        SELECT department_id
        FROM Departments
        WHERE department_name='Cardiology'
    )
);
#Q10. Find patients who have pending bills.
SELECT *
FROM Patients
WHERE patient_id IN
(
    SELECT patient_id
    FROM Billing
    WHERE payment_status='Pending'
);
#Q11. Find patients diagnosed with Diabetes.
SELECT *
FROM Patients
WHERE patient_id IN
(
    SELECT a.patient_id
    FROM Appointments a
    JOIN Diagnosis d
    ON a.appointment_id=d.appointment_id
    WHERE d.disease_name='Diabetes'
);
#Q12. Find doctors who have appointments.
SELECT *
FROM Doctors
WHERE doctor_id IN
(
    SELECT DISTINCT doctor_id
    FROM Appointments
);
#Q13. Find patients who have appointments.
SELECT *
FROM Patients
WHERE patient_id IN
(
    SELECT DISTINCT patient_id
    FROM Appointments
);
#Q14. Find departments having doctors.
SELECT *
FROM Departments
WHERE department_id IN
(
    SELECT DISTINCT department_id
    FROM Doctors
);
#Q15. Find diseases having treatments.
SELECT DISTINCT disease_name
FROM Diagnosis
WHERE diagnosis_id IN
(
    SELECT diagnosis_id
    FROM Treatments
);


#Multi-Row Subqueries
#Q16. Find doctors earning more than ANY doctor in department 1.
SELECT *
FROM Doctors
WHERE salary > ANY
(
    SELECT salary
    FROM Doctors
    WHERE department_id=1
);
#Q17. Find doctors earning more than ALL doctors in department 1.
SELECT *
FROM Doctors
WHERE salary > ALL
(
    SELECT salary
    FROM Doctors
    WHERE department_id=1
);
#Q18. Find patients whose bills are greater than ANY pending bill.
SELECT *
FROM Billing
WHERE total_amount > ANY
(
    SELECT total_amount
    FROM Billing
    WHERE payment_status='Pending'
);
#Q19. Find patients whose bills are greater than ALL cancelled bills.
SELECT *
FROM Billing
WHERE total_amount > ALL
(
    SELECT total_amount
    FROM Billing
    WHERE payment_status='Cancelled'
);
#Q20. Find doctors working in Cardiology, Neurology, or Oncology.
SELECT *
FROM Doctors
WHERE department_id IN
(
    SELECT department_id
    FROM Departments
    WHERE department_name IN
    ('Cardiology','Neurology','Oncology')
);
#Q21. Find patients diagnosed with Diabetes or Asthma.
SELECT *
FROM Patients
WHERE patient_id IN
(
    SELECT a.patient_id
    FROM Appointments a
    JOIN Diagnosis d
    ON a.appointment_id=d.appointment_id
    WHERE disease_name IN
    ('Diabetes','Asthma')
);
#Q22. Find appointments of doctors earning above ₹180000.
SELECT *
FROM Appointments
WHERE doctor_id IN
(
    SELECT doctor_id
    FROM Doctors
    WHERE salary>180000
);
#Q23. Find billing records of patients from Chennai.
SELECT *
FROM Billing
WHERE patient_id IN
(
    SELECT patient_id
    FROM Patients
    WHERE city='Chennai'
);
#Q24. Find treatments for Cancer or COVID-19.
SELECT *
FROM Treatments
WHERE diagnosis_id IN
(
    SELECT diagnosis_id
    FROM Diagnosis
    WHERE disease_name IN
    ('Cancer','COVID-19')
);
#Q25. Find doctors whose specialization is either Cardiologist or Neurologist.
SELECT *
FROM Doctors
WHERE specialization IN
(
    'Cardiologist',
    'Neurologist'
);

#Aggregate Subqueries (Q26–Q35)
#Q26. Find departments where the average doctor salary is above the overall average salary.
SELECT department_id,
       AVG(salary) AS Avg_Salary
FROM Doctors
GROUP BY department_id
HAVING AVG(salary) >
(
    SELECT AVG(salary)
    FROM Doctors
);
#Q27. Find doctors earning more than their department's average salary.
SELECT *
FROM Doctors d
WHERE salary >
(
    SELECT AVG(salary)
    FROM Doctors
    WHERE department_id=d.department_id
);
#Q28. Find patients whose bill amount is above the average bill.
SELECT *
FROM Billing
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM Billing
);
#Q29. Find diseases whose treatment cost is above the average treatment cost.
SELECT d.disease_name,
       t.treatment_cost
FROM Diagnosis d
JOIN Treatments t
ON d.diagnosis_id=t.diagnosis_id
WHERE t.treatment_cost >
(
    SELECT AVG(treatment_cost)
    FROM Treatments
);
#Q30. Find doctors whose appointment count is above the average appointment count.
SELECT doctor_id,
       COUNT(*) AS Total_Appointments
FROM Appointments
GROUP BY doctor_id
HAVING COUNT(*) >
(
    SELECT AVG(Appointment_Count)
    FROM
    (
        SELECT COUNT(*) AS Appointment_Count
        FROM Appointments
        GROUP BY doctor_id
    ) AS Temp
);

#EXISTS / NOT EXISTS (Q31–Q35)
#Q31. Find doctors who have appointments.
SELECT *
FROM Doctors d
WHERE EXISTS
(
    SELECT 1
    FROM Appointments a
    WHERE a.doctor_id=d.doctor_id
);
#Q32. Find patients who have billing records.
SELECT *
FROM Patients p
WHERE EXISTS
(
    SELECT 1
    FROM Billing b
    WHERE b.patient_id=p.patient_id
);
#Q33. Find doctors with no appointments.
SELECT *
FROM Doctors d
WHERE NOT EXISTS
(
    SELECT 1
    FROM Appointments a
    WHERE a.doctor_id=d.doctor_id
);
#Q34. Find patients with no appointments.
SELECT *
FROM Patients p
WHERE NOT EXISTS
(
    SELECT 1
    FROM Appointments a
    WHERE a.patient_id=p.patient_id
);
#Q35. Find departments with no doctors.
SELECT *
FROM Departments d
WHERE NOT EXISTS
(
    SELECT 1
    FROM Doctors doc
    WHERE doc.department_id=d.department_id
);
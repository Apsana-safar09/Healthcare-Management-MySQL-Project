#Correlated Subqueries
#Q1. Find doctors earning more than the average salary of their own department.
SELECT *
FROM Doctors d
WHERE salary >
(
    SELECT AVG(salary)
    FROM Doctors
    WHERE department_id = d.department_id
);
#Q2. Find patients whose bill amount is greater than the average bill of all patients from the same city.
SELECT
    p.patient_id,
    p.first_name,
    p.city,
    b.total_amount
FROM Patients p
JOIN Billing b
ON p.patient_id = b.patient_id
WHERE b.total_amount >
(
    SELECT AVG(b2.total_amount)
    FROM Patients p2
    JOIN Billing b2
    ON p2.patient_id = b2.patient_id
    WHERE p2.city = p.city
);
#Q3. Find doctors whose experience is greater than the average experience in their department.
SELECT *
FROM Doctors d
WHERE experience_years >
(
    SELECT AVG(experience_years)
    FROM Doctors
    WHERE department_id = d.department_id
);
#Q4. Find appointments whose consultation fee is greater than the average consultation fee charged by the same doctor.
SELECT *
FROM Appointments a
WHERE consultation_fee >
(
    SELECT AVG(consultation_fee)
    FROM Appointments
    WHERE doctor_id = a.doctor_id
);
#Q5. Find patients older than the average age of patients from the same city.
SELECT *
FROM Patients p
WHERE TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) >
(
    SELECT AVG(TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()))
    FROM Patients
    WHERE city = p.city
);
#Q6. Find billing records whose amount is greater than the average bill for the same payment status.
SELECT *
FROM Billing b
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM Billing
    WHERE payment_status = b.payment_status
);
#Q7. Find treatments costing more than the average treatment cost for the same disease.
SELECT
    d.disease_name,
    t.treatment_name,
    t.treatment_cost
FROM Diagnosis d
JOIN Treatments t
ON d.diagnosis_id = t.diagnosis_id
WHERE t.treatment_cost >
(
    SELECT AVG(t2.treatment_cost)
    FROM Diagnosis d2
    JOIN Treatments t2
    ON d2.diagnosis_id = t2.diagnosis_id
    WHERE d2.disease_name = d.disease_name
);
#Q8. Find doctors whose salary is the highest in their department.
SELECT *
FROM Doctors d
WHERE salary =
(
    SELECT MAX(salary)
    FROM Doctors
    WHERE department_id = d.department_id
);
#Q9. Find doctors whose salary is the lowest in their department.
SELECT *
FROM Doctors d
WHERE salary =
(
    SELECT MIN(salary)
    FROM Doctors
    WHERE department_id = d.department_id
);
#Q10. Find patients having the highest bill in their city.
SELECT
    p.patient_id,
    p.first_name,
    p.city,
    b.total_amount
FROM Patients p
JOIN Billing b
ON p.patient_id = b.patient_id
WHERE b.total_amount =
(
    SELECT MAX(b2.total_amount)
    FROM Patients p2
    JOIN Billing b2
    ON p2.patient_id = b2.patient_id
    WHERE p2.city = p.city
);
#Q11. Find doctors who handled more appointments than the average appointments per doctor.
SELECT
    d.doctor_id,
    d.first_name,
    d.last_name
FROM Doctors d
WHERE
(
    SELECT COUNT(*)
    FROM Appointments a
    WHERE a.doctor_id = d.doctor_id
)
>
(
    SELECT AVG(App_Count)
    FROM
    (
        SELECT COUNT(*) AS App_Count
        FROM Appointments
        GROUP BY doctor_id
    ) AS x
);
#Q12. Find patients who visited more times than the average number of visits.
SELECT
    p.patient_id,
    p.first_name,
    p.last_name
FROM Patients p
WHERE
(
    SELECT COUNT(*)
    FROM Appointments a
    WHERE a.patient_id = p.patient_id
)
>
(
    SELECT AVG(Visit_Count)
    FROM
    (
        SELECT COUNT(*) AS Visit_Count
        FROM Appointments
        GROUP BY patient_id
    ) AS x
);
#Q13. Find departments whose doctors earn more than the department's average salary.
SELECT DISTINCT
    dep.department_name
FROM Departments dep
JOIN Doctors d
ON dep.department_id = d.department_id
WHERE d.salary >
(
    SELECT AVG(salary)
    FROM Doctors
    WHERE department_id = dep.department_id
);
#Q14. Find doctors who charged the highest consultation fee among their own appointments.
SELECT DISTINCT
    d.doctor_id,
    d.first_name,
    d.last_name
FROM Doctors d
JOIN Appointments a
ON d.doctor_id = a.doctor_id
WHERE a.consultation_fee =
(
    SELECT MAX(consultation_fee)
    FROM Appointments
    WHERE doctor_id = d.doctor_id
);
#Q15. Find patients whose total bill is greater than the average total bill per patient.
SELECT
    p.patient_id,
    p.first_name,
    p.last_name
FROM Patients p
WHERE
(
    SELECT SUM(total_amount)
    FROM Billing b
    WHERE b.patient_id = p.patient_id
)
>
(
    SELECT AVG(Total_Bill)
    FROM
    (
        SELECT SUM(total_amount) AS Total_Bill
        FROM Billing
        GROUP BY patient_id
    ) AS x
);
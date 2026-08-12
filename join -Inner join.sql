# Join
#Innerjoin
#Patient ↔ Appointments
#Q1. Display patient name and appointment date.
SELECT
    p.patient_id,
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    a.appointment_date,
    a.appointment_time
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id;
#Q2. Display patient name and appointment status.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    a.status
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id;
#Q3. Display patient name and consultation fee.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    a.consultation_fee
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id;
#Doctor ↔ Appointments
#Q4. Display doctor name and appointment date.
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    a.appointment_date
FROM Doctors d
INNER JOIN Appointments a
ON d.doctor_id = a.doctor_id;
#Q5. Display doctor name and consultation fee.
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    a.consultation_fee
FROM Doctors d
INNER JOIN Appointments a
ON d.doctor_id = a.doctor_id;
#Doctors ↔ Departments
#Q6. Display doctor name and department name.
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    dep.department_name
FROM Doctors d
INNER JOIN Departments dep
ON d.department_id = dep.department_id;
#Q7. Display doctor specialization and department.
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    d.specialization,
    dep.department_name
FROM Doctors d
INNER JOIN Departments dep
ON d.department_id = dep.department_id;
#Appointments ↔ Diagnosis
#Q8. Display appointment ID and disease name.
SELECT
    a.appointment_id,
    dg.disease_name
FROM Appointments a
INNER JOIN Diagnosis dg
ON a.appointment_id = dg.appointment_id;
#Q9. Display appointment date and diagnosis date.
SELECT
    a.appointment_date,
    dg.diagnosis_date
FROM Appointments a
INNER JOIN Diagnosis dg
ON a.appointment_id = dg.appointment_id;
#Diagnosis ↔ Treatments
#Q10. Display disease and treatment.
SELECT
    dg.disease_name,
    t.treatment_name,
    t.medicine
FROM Diagnosis dg
INNER JOIN Treatments t
ON dg.diagnosis_id = t.diagnosis_id;
#Q11. Display disease and treatment cost.
SELECT
    dg.disease_name,
    t.treatment_cost
FROM Diagnosis dg
INNER JOIN Treatments t
ON dg.diagnosis_id = t.diagnosis_id;
#Patients ↔ Billing
#Q12. Display patient name and bill amount.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    b.total_amount
FROM Patients p
INNER JOIN Billing b
ON p.patient_id = b.patient_id;
#Q13. Display patient name and payment status.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    b.payment_status
FROM Patients p
INNER JOIN Billing b
ON p.patient_id = b.patient_id;
#Q14. Display patient name, payment date, and bill amount.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    b.payment_date,
    b.total_amount
FROM Patients p
INNER JOIN Billing b
ON p.patient_id = b.patient_id;
#Multiple INNER JOINs
#Q15. Display patient name, doctor name, and appointment date.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    a.appointment_date
FROM Appointments a
INNER JOIN Patients p
ON a.patient_id = p.patient_id
INNER JOIN Doctors d
ON a.doctor_id = d.doctor_id;
#Q16. Display patient, doctor, department.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    dep.department_name
FROM Appointments a
INNER JOIN Patients p
ON a.patient_id = p.patient_id
INNER JOIN Doctors d
ON a.doctor_id = d.doctor_id
INNER JOIN Departments dep
ON d.department_id = dep.department_id;
#Q17. Display patient, disease, and diagnosis date.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    dg.disease_name,
    dg.diagnosis_date
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id
INNER JOIN Diagnosis dg
ON a.appointment_id = dg.appointment_id;
#Q18. Display patient, disease, and treatment.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    dg.disease_name,
    t.treatment_name
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id
INNER JOIN Diagnosis dg
ON a.appointment_id = dg.appointment_id
INNER JOIN Treatments t
ON dg.diagnosis_id = t.diagnosis_id;
#Q19. Display patient, doctor, disease, and treatment.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    dg.disease_name,
    t.treatment_name
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id
INNER JOIN Doctors d
ON a.doctor_id = d.doctor_id
INNER JOIN Diagnosis dg
ON a.appointment_id = dg.appointment_id
INNER JOIN Treatments t
ON dg.diagnosis_id = t.diagnosis_id;
#Q20. Complete Patient Healthcare Report
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    dep.department_name,
    dg.disease_name,
    t.treatment_name,
    b.total_amount,
    b.payment_status
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id
INNER JOIN Doctors d
ON a.doctor_id = d.doctor_id
INNER JOIN Departments dep
ON d.department_id = dep.department_id
INNER JOIN Diagnosis dg
ON a.appointment_id = dg.appointment_id
INNER JOIN Treatments t
ON dg.diagnosis_id = t.diagnosis_id
INNER JOIN Billing b
ON a.appointment_id = b.appointment_id;
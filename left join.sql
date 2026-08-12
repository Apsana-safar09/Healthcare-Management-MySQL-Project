#LEFT JOIN
#Q21. Display all patients and their appointments (including patients with no appointments).
SELECT
    p.patient_id,
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    a.appointment_date,
    a.status
FROM Patients p
LEFT JOIN Appointments a
ON p.patient_id = a.patient_id;
#Q22. Display all doctors and their appointments.
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    a.appointment_date,
    a.status
FROM Doctors d
LEFT JOIN Appointments a
ON d.doctor_id = a.doctor_id;
#Q23. Display all departments and their doctors.
SELECT
    dep.department_name,
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name
FROM Departments dep
LEFT JOIN Doctors d
ON dep.department_id = d.department_id;
#Q24. Display all patients and their billing details.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    b.total_amount,
    b.payment_status
FROM Patients p
LEFT JOIN Billing b
ON p.patient_id = b.patient_id;
#Q25. Display all appointments and diagnosis.
SELECT
    a.appointment_id,
    a.appointment_date,
    dg.disease_name
FROM Appointments a
LEFT JOIN Diagnosis dg
ON a.appointment_id = dg.appointment_id;
#Q26. Display all diagnosis and treatments.
SELECT
    dg.disease_name,
    t.treatment_name
FROM Diagnosis dg
LEFT JOIN Treatments t
ON dg.diagnosis_id = t.diagnosis_id;
#Q27. Display all patients and diseases (even if not diagnosed).
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    dg.disease_name
FROM Patients p
LEFT JOIN Appointments a
ON p.patient_id=a.patient_id
LEFT JOIN Diagnosis dg
ON a.appointment_id=dg.appointment_id;
#Q28. Display all doctors and departments.
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    dep.department_name
FROM Doctors d
LEFT JOIN Departments dep
ON d.department_id=dep.department_id;
#Q29. Display all appointments and billing.
SELECT
    a.appointment_id,
    b.total_amount
FROM Appointments a
LEFT JOIN Billing b
ON a.appointment_id=b.appointment_id;
#Q30. Display all patients, appointments, and bills.
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    a.appointment_date,
    b.total_amount
FROM Patients p
LEFT JOIN Appointments a
ON p.patient_id=a.patient_id
LEFT JOIN Billing b
ON a.appointment_id=b.appointment_id;
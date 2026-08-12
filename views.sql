#View
#Q1. Create a view to display all patient details.
CREATE VIEW Patient_Details AS
SELECT *
FROM Patients;
SELECT * FROM Patient_Details;

#Q2. Create a view to display doctor name and department.
CREATE VIEW Doctor_Department AS
SELECT
    d.doctor_id,
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    dep.department_name,
    d.specialization
FROM Doctors d
JOIN Departments dep
ON d.department_id = dep.department_id;
SELECT * FROM Doctor_Department;

#Q3. Create a view for appointment details.
CREATE VIEW Appointment_Details AS
SELECT
    a.appointment_id,
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    a.appointment_date,
    a.status
FROM Appointments a
JOIN Patients p
ON a.patient_id = p.patient_id
JOIN Doctors d
ON a.doctor_id = d.doctor_id;

#Q4. Create a view for patient billing.
CREATE VIEW Patient_Billing AS
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    b.total_amount,
    b.payment_status
FROM Patients p
JOIN Billing b
ON p.patient_id = b.patient_id;

#Q5. Create a view for diagnosis details.
CREATE VIEW Diagnosis_Report AS
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    dg.disease_name,
    dg.severity,
    dg.diagnosis_date
FROM Patients p
JOIN Appointments a
ON p.patient_id = a.patient_id
JOIN Diagnosis dg
ON a.appointment_id = dg.appointment_id;

#Q6. Create a treatment report view.
CREATE VIEW Treatment_Report AS
SELECT
    dg.disease_name,
    t.treatment_name,
    t.medicine,
    t.treatment_cost
FROM Diagnosis dg
JOIN Treatments t
ON dg.diagnosis_id = t.diagnosis_id;

#Q7. Create a complete patient healthcare report.
CREATE VIEW Patient_Healthcare_Report AS
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS Patient_Name,
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    dep.department_name,
    dg.disease_name,
    t.treatment_name,
    b.total_amount,
    b.payment_status
FROM Patients p
JOIN Appointments a
ON p.patient_id = a.patient_id
JOIN Doctors d
ON a.doctor_id = d.doctor_id
JOIN Departments dep
ON d.department_id = dep.department_id
JOIN Diagnosis dg
ON a.appointment_id = dg.appointment_id
JOIN Treatments t
ON dg.diagnosis_id = t.diagnosis_id
JOIN Billing b
ON a.appointment_id = b.appointment_id;

#Q8. Create a department revenue view.
CREATE VIEW Department_Revenue AS
SELECT
    dep.department_name,
    SUM(b.total_amount) AS Total_Revenue
FROM Departments dep
JOIN Doctors d
ON dep.department_id = d.department_id
JOIN Appointments a
ON d.doctor_id = a.doctor_id
JOIN Billing b
ON a.appointment_id = b.appointment_id
GROUP BY dep.department_name;

#Q9. Create a doctor appointment summary.
CREATE VIEW Doctor_Appointment_Summary AS
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
    COUNT(a.appointment_id) AS Total_Appointments
FROM Doctors d
JOIN Appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name;

#Q10. Create a disease summary view.
CREATE VIEW Disease_Summary AS
SELECT
    disease_name,
    COUNT(*) AS Total_Cases
FROM Diagnosis
GROUP BY disease_name;
#View Operations
#Display all views
SHOW FULL TABLES
WHERE Table_type = 'VIEW';

#View definition
SHOW CREATE VIEW Patient_Healthcare_Report;

#Describe a view
DESC Patient_Healthcare_Report;

#Update a view
CREATE OR REPLACE VIEW Patient_Details AS
SELECT
    patient_id,
    first_name,
    last_name,
    city
FROM Patients;

#Delete a view
DROP VIEW Patient_Details;

#Updatable vs Non-Updatable Views
#Updatable View

CREATE VIEW Patient_Basic AS
SELECT patient_id,
       first_name,
       last_name,
       city
FROM Patients;

#You can update through this view:

UPDATE Patient_Basic
SET city = 'Chennai'
WHERE patient_id = 1;

#Non-Updatable View
CREATE VIEW Department_Revenue AS
SELECT
    dep.department_name,
    SUM(b.total_amount)
FROM Departments dep
JOIN Doctors d
ON dep.department_id = d.department_id
JOIN Appointments a
ON d.doctor_id = a.doctor_id
JOIN Billing b
ON a.appointment_id = b.appointment_id
GROUP BY dep.department_name;
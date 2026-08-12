#SELF JOIN (Healthcare)
#Q31. Find patients from the same city.
SELECT
p1.patient_id,
CONCAT(p1.first_name,' ',p1.last_name) AS Patient1,
CONCAT(p2.first_name,' ',p2.last_name) AS Patient2,
p1.city
FROM Patients p1
JOIN Patients p2
ON p1.city=p2.city
AND p1.patient_id<p2.patient_id;
#Q32. Find doctors in the same department.
SELECT
CONCAT(d1.first_name,' ',d1.last_name) AS Doctor1,
CONCAT(d2.first_name,' ',d2.last_name) AS Doctor2,
d1.department_id
FROM Doctors d1
JOIN Doctors d2
ON d1.department_id=d2.department_id
AND d1.doctor_id<d2.doctor_id;
#Q33. Find doctors having the same specialization.
SELECT
CONCAT(d1.first_name,' ',d1.last_name) Doctor1,
CONCAT(d2.first_name,' ',d2.last_name) Doctor2,
d1.specialization
FROM Doctors d1
JOIN Doctors d2
ON d1.specialization=d2.specialization
AND d1.doctor_id<d2.doctor_id;
#Q34. Find patients with the same blood group.
SELECT
CONCAT(p1.first_name,' ',p1.last_name) Patient1,
CONCAT(p2.first_name,' ',p2.last_name) Patient2,
p1.blood_group
FROM Patients p1
JOIN Patients p2
ON p1.blood_group=p2.blood_group
AND p1.patient_id<p2.patient_id;
#Q35. Find patients registered on the same date.
SELECT
CONCAT(p1.first_name,' ',p1.last_name) Patient1,
CONCAT(p2.first_name,' ',p2.last_name) Patient2,
p1.registration_date
FROM Patients p1
JOIN Patients p2
ON p1.registration_date=p2.registration_date
AND p1.patient_id<p2.patient_id;


#Multiple JOIN (Healthcare Reports)
#Q36. Patient → Doctor → Department
SELECT
CONCAT(p.first_name,' ',p.last_name) Patient,
CONCAT(d.first_name,' ',d.last_name) Doctor,
dep.department_name
FROM Patients p
JOIN Appointments a
ON p.patient_id=a.patient_id
JOIN Doctors d
ON a.doctor_id=d.doctor_id
JOIN Departments dep
ON d.department_id=dep.department_id;
#Q37. Patient → Diagnosis → Treatment
SELECT
CONCAT(p.first_name,' ',p.last_name) Patient,
dg.disease_name,
t.treatment_name
FROM Patients p
JOIN Appointments a
ON p.patient_id=a.patient_id
JOIN Diagnosis dg
ON a.appointment_id=dg.appointment_id
JOIN Treatments t
ON dg.diagnosis_id=t.diagnosis_id;
#Q38. Doctor → Department → Appointment → Billing
SELECT
CONCAT(d.first_name,' ',d.last_name) Doctor,
dep.department_name,
SUM(b.total_amount) AS Revenue
FROM Doctors d
JOIN Departments dep
ON d.department_id=dep.department_id
JOIN Appointments a
ON d.doctor_id=a.doctor_id
JOIN Billing b
ON a.appointment_id=b.appointment_id
GROUP BY d.doctor_id,dep.department_name;
#Q39. Complete Patient Report
SELECT
CONCAT(p.first_name,' ',p.last_name) Patient,
CONCAT(d.first_name,' ',d.last_name) Doctor,
dg.disease_name,
t.treatment_name,
b.total_amount
FROM Patients p
JOIN Appointments a
ON p.patient_id=a.patient_id
JOIN Doctors d
ON a.doctor_id=d.doctor_id
JOIN Diagnosis dg
ON a.appointment_id=dg.appointment_id
JOIN Treatments t
ON dg.diagnosis_id=t.diagnosis_id
JOIN Billing b
ON a.appointment_id=b.appointment_id;
#Q40. Department Revenue Report
SELECT
dep.department_name,
SUM(b.total_amount) AS Total_Revenue
FROM Departments dep
JOIN Doctors d
ON dep.department_id=d.department_id
JOIN Appointments a
ON d.doctor_id=a.doctor_id
JOIN Billing b
ON a.appointment_id=b.appointment_id
GROUP BY dep.department_name;


#Aggregate with JOIN
#Q41. Count patients treated by each doctor.
SELECT
CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
COUNT(a.patient_id) AS Total_Patients
FROM Doctors d
JOIN Appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name;
#Q42. Find the average consultation fee by department.
SELECT
dep.department_name,
AVG(a.consultation_fee) AS Average_Fee
FROM Departments dep
JOIN Doctors d
ON dep.department_id = d.department_id
JOIN Appointments a
ON d.doctor_id = a.doctor_id
GROUP BY dep.department_name;
#Q43. Find the total billing amount by department.
SELECT
dep.department_name,
SUM(b.total_amount) AS Total_Billing
FROM Departments dep
JOIN Doctors d
ON dep.department_id = d.department_id
JOIN Appointments a
ON d.doctor_id = a.doctor_id
JOIN Billing b
ON a.appointment_id = b.appointment_id
GROUP BY dep.department_name;
#Q44. Count patients diagnosed with each disease.
SELECT
dg.disease_name,
COUNT(*) AS Total_Patients
FROM Diagnosis dg
GROUP BY dg.disease_name;
#Q45. Find the average treatment cost by disease.
SELECT
dg.disease_name,
AVG(t.treatment_cost) AS Average_Cost
FROM Diagnosis dg
JOIN Treatments t
ON dg.diagnosis_id = t.diagnosis_id
GROUP BY dg.disease_name;
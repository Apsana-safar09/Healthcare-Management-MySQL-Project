use healthcaredb;
#Patient queries
#Q1. Display all patient details.
select * from patients;
#Q2. Display patient first name, last name, and city.
SELECT first_name,
       last_name,
       city
FROM Patients;
#Q3.Display only female patients.
SELECT * FROM Patients
WHERE gender='Female';
#Q4. Display patients from Chennai.
SELECT *
FROM Patients
WHERE city='Chennai';
#Q5. Display patients whose blood group is O+.
SELECT *
FROM Patients
WHERE blood_group='O+';
#Q6. Display patients registered after 2025-03-01.
SELECT * FROM Patients
WHERE registration_date>'2025-03-01';
#Q7. Display patients born after 1995.
SELECT * FROM Patients
WHERE date_of_birth>'1995-12-31';
#Q8. Display patients whose city is Chennai or Madurai.
SELECT *
FROM Patients
WHERE city IN ('Chennai','Madurai');
#Q9. Display patients whose first name starts with 'A'.
SELECT * FROM Patients
WHERE first_name LIKE 'A%';
#Q10. Display patients whose first name ends with 'a'.
SELECT *FROM Patients
WHERE first_name LIKE '%a';

#Doctor Queries
# Q11. Display all doctors.
SELECT *FROM Doctors;
#Q12. Display doctor names and specialization.
SELECT first_name,
       last_name,
       specialization
FROM Doctors;
#Q13. Display doctors whose salary is greater than ₹170000.
SELECT *
FROM Doctors
WHERE salary>170000;
#Q14. Display doctors having more than 10 years of experience.
SELECT * FROM Doctors
WHERE experience_years>10;
#Q15. Display doctors working in department 1.
SELECT *
FROM Doctors
WHERE department_id=1;
# Q16. Display doctors whose specialization contains 'ologist'.
SELECT * FROM Doctors
WHERE specialization LIKE '%ologist%';

#Appointment Queries
# Q17. Display all appointments.
SELECT * FROM Appointments;
#Q18. Display completed appointments.
SELECT *
FROM Appointments
WHERE status='Completed';
#Q19. Display pending appointments.
SELECT *
FROM Appointments
WHERE status='Pending';
#Q20. Display appointments with consultation fee greater than ₹500.
SELECT *
FROM Appointments
WHERE consultation_fee>500;

#Billing Queries
#Q21. Display all bills.
SELECT *
FROM Billing;
# Q22. Display paid bills.
SELECT *
FROM Billing
WHERE payment_status='Paid';
# Q23. Display pending bills.
SELECT *
FROM Billing
WHERE payment_status='Pending';
#Q24. Display bills greater than ₹5000.
SELECT *
FROM Billing
WHERE total_amount>5000;
#Q25. Display billing details ordered by highest amount.
SELECT *
FROM Billing
ORDER BY total_amount DESC;
#Display patients whose blood group is A+.
select * from patients where blood_group = 'A+';
#Display doctors earning between ₹150000 and ₹180000.
select first_name,last_name,salary from doctors where salary between 150000 and 180000;
#Display appointments scheduled in May 2025.
SELECT *
FROM Appointments
WHERE appointment_date BETWEEN '2025-05-01' AND '2025-05-31';
#Display bills with payment status = 'Cancelled'.
SELECT *
FROM Billing
WHERE payment_status='Cancelled';
#Display patients whose email ends with gmail.com.
SELECT *
FROM Patients
WHERE email LIKE '%gmail.com';
#Display doctors whose first name starts with S.
SELECT *
FROM Doctors
WHERE first_name LIKE 'S%';
#Display patients not from Chennai.
SELECT *
FROM Patients
WHERE city!= 'Chennai';
#Display appointments with consultation fees between ₹400 and ₹700.
SELECT *
FROM Appointments
WHERE consultation_fee BETWEEN 400 AND 700;
#Display the top 5 highest bills.
SELECT *
FROM Billing
ORDER BY total_amount DESC
LIMIT 5;
# Display patients ordered alphabetically by last name.
SELECT *
FROM Patients
ORDER BY last_name ASC;



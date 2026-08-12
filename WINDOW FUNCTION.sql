#Window Function
#1. ROW_NUMBER()
#Q1. Assign a row number to each doctor based on salary (highest first).
SELECT
    doctor_id,
    first_name,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS Row_Num
FROM Doctors;
#Q2. Assign row numbers within each department.
SELECT
    doctor_id,
    first_name,
    department_id,
    salary,
    ROW_NUMBER() OVER
    (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS Dept_Row
FROM Doctors;

#2. RANK()
#Q3. Rank doctors by salary.
SELECT
    doctor_id,
    first_name,
    salary,
    RANK() OVER
    (
        ORDER BY salary DESC
    ) AS Salary_Rank
FROM Doctors;

#Q4. Rank doctors within each department.
SELECT
    doctor_id,
    first_name,
    department_id,
    salary,
    RANK() OVER
    (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS Dept_Rank
FROM Doctors;

#3. DENSE_RANK()
#Q5. Dense rank doctors by salary.
SELECT
    doctor_id,
    first_name,
    salary,
    DENSE_RANK() OVER
    (
        ORDER BY salary DESC
    ) 
FROM Doctors;

#4. NTILE()
#Q6. Divide doctors into four salary groups.
SELECT
    doctor_id,
    first_name,
    salary,
    NTILE(4) OVER
    (
        ORDER BY salary DESC
    ) AS Salary_Group
FROM Doctors;

#5. LAG()
#Q7. Show the previous doctor's salary.
SELECT
    doctor_id,
    first_name,
    salary,
    LAG(salary) OVER
    (
        ORDER BY salary
    ) AS Previous_Salary
FROM Doctors;

#6. LEAD()
#Q8. Show the next doctor's salary.
SELECT
    doctor_id,
    first_name,
    salary,
    LEAD(salary) OVER
    (
        ORDER BY salary
    ) AS Next_Salary
FROM Doctors;

#7. FIRST_VALUE()
#Q9. Show the highest salary for every doctor.
SELECT
    doctor_id,
    first_name,
    salary,
    FIRST_VALUE(salary) OVER
    (
        ORDER BY salary DESC
    ) AS Highest_Salary
FROM Doctors;

#8. LAST_VALUE()
#Q10. Show the lowest salary.
SELECT
    doctor_id,
    first_name,
    salary,
    LAST_VALUE(salary) OVER
    (
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS Lowest_Salary
FROM Doctors;

#9. Running Total
#Q11. Running total of billing amount.
SELECT
    bill_id,
    total_amount,
    SUM(total_amount) OVER
    (
        ORDER BY bill_id
    ) AS Running_Total
FROM billing;

#10. Running Average
#Q12. Running average of consultation fee.
SELECT
    appointment_id,
    consultation_fee,
    AVG(consultation_fee) OVER
    (
        ORDER BY appointment_id
    ) AS Running_Average
FROM Appointments;

#11. Department Average
#Q13. Display every doctor along with the average salary of their department.
SELECT
    doctor_id,
    first_name,
    department_id,
    salary,
    AVG(salary) OVER
    (
        PARTITION BY department_id
    ) AS Dept_Avg
FROM Doctors;


#12. Department Maximum Salary
#Q14. Display every doctor along with the maximum salary in their department.
SELECT
    doctor_id,
    first_name,
    salary,
    MAX(salary) OVER
    (
        PARTITION BY department_id
    ) AS Dept_Max
FROM Doctors;

#13. Department Minimum Salary
#Q15. Display every doctor along with the minimum salary in their department.
SELECT
    doctor_id,
    first_name,
    salary,
    MIN(salary) OVER
    (
        PARTITION BY department_id
    ) AS Dept_Min
FROM Doctors;

#14. Count Patients by City
#Q16. Display each patient with the total number of patients from the same city.
SELECT
    patient_id,
    first_name,
    city,
    COUNT(*) OVER
    (
        PARTITION BY city
    ) AS City_Count
FROM Patients;

#15. Revenue by Payment Status
#Q17. Display each bill with the total revenue for its payment status.
SELECT
    bill_id,
    payment_status,
    total_amount,
    SUM(total_amount) OVER
    (
        PARTITION BY payment_status
    ) AS Status_Total
FROM Billing;

#16. Rank Patients by Bill Amount
#Q18. Rank patients based on billing amount.
SELECT
    patient_id,
    total_amount,
    RANK() OVER
    (
        ORDER BY total_amount DESC
    ) AS Bill_Rank
FROM Billing;

#17. Top 3 Doctors in Each Department
SELECT *
FROM
(
    SELECT
        doctor_id,
        first_name,
        department_id,
        salary,
        ROW_NUMBER() OVER
        (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM Doctors
) AS x
WHERE rn <= 3;

#18. Highest Bill in Each Payment Status
SELECT
    bill_id,
    payment_status,
    total_amount,
    MAX(total_amount) OVER
    (
        PARTITION BY payment_status
    ) AS Highest_Bill
FROM Billing;
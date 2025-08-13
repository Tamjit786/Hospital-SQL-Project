-- 1. List all patients with their doctors
SELECT p.first_name AS Patient, p.last_name, d.first_name AS Doctor, d.specialty
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

-- 2. Total bills per patient
SELECT p.first_name, p.last_name, SUM(b.amount) AS TotalBill
FROM Bills b
JOIN Patients p ON b.patient_id = p.patient_id
GROUP BY p.patient_id;

-- 3. Unpaid bills
SELECT p.first_name, p.last_name, b.amount, b.bill_date
FROM Bills b
JOIN Patients p ON b.patient_id = p.patient_id
WHERE b.paid = FALSE;

-- 4. Treatments for each appointment
SELECT a.appointment_id, p.first_name AS Patient, t.treatment_description, t.medication_prescribed
FROM Treatments t
JOIN Appointments a ON t.appointment_id = a.appointment_id
JOIN Patients p ON a.patient_id = p.patient_id;

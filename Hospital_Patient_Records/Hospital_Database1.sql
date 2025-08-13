-- Create Database
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- Table: Patients
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    phone VARCHAR(15),
    address TEXT
);

-- Table: Doctors
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(50),
    phone VARCHAR(15)
);

-- Table: Appointments
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Table: Treatments
CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    treatment_description TEXT,
    medication_prescribed TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- Table: Bills
CREATE TABLE Bills (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    amount DECIMAL(10,2),
    bill_date DATE,
    paid BOOLEAN,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Insert sample data
INSERT INTO Patients (first_name, last_name, date_of_birth, gender, phone, address) VALUES
('John', 'Doe', '1980-05-14', 'Male', '1234567890', '123 Main St'),
('Jane', 'Smith', '1990-08-21', 'Female', '9876543210', '456 Oak Ave'),
('Sam', 'Brown', '1975-12-30', 'Male', '5556667777', '789 Pine Rd');

INSERT INTO Doctors (first_name, last_name, specialty, phone) VALUES
('Alice', 'Johnson', 'Cardiology', '1112223333'),
('Bob', 'Williams', 'Neurology', '4445556666');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason) VALUES
(1, 1, '2025-08-20 09:00:00', 'Heart check-up'),
(2, 2, '2025-08-21 10:30:00', 'Migraine consultation'),
(3, 1, '2025-08-22 14:00:00', 'Chest pain follow-up');

INSERT INTO Treatments (appointment_id, treatment_description, medication_prescribed) VALUES
(1, 'ECG scan and review', 'Aspirin 75mg daily'),
(2, 'MRI brain scan', 'Pain relief medication'),
(3, 'Blood test and ECG', 'Beta blockers');

INSERT INTO Bills (patient_id, amount, bill_date, paid) VALUES
(1, 2000.00, '2025-08-20', TRUE),
(2, 3500.00, '2025-08-21', FALSE),
(3, 1500.00, '2025-08-22', TRUE);

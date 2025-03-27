CREATE TABLE Patient (
  PatientID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DateOfBirth DATE,
  Address TEXT,
  AssignmentDate DATETIME,
  DoctorID INT,
  FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID) ON DELETE SET NULL
);

CREATE TABLE Doctor (
  DoctorID INT PRIMARY KEY,
  Name VARCHAR(50),
  Speciality VARCHAR(50),
  DeptID INT,
  FOREIGN KEY (DeptID) REFERENCES Department(DeptID) ON DELETE SET NULL
);

CREATE TABLE Department (
  DeptID INT PRIMARY KEY,
  Name VARCHAR(50)
);

CREATE TABLE Nurse (
  NurseID INT PRIMARY KEY,
  Name VARCHAR(50),
  DepartmentID INT,
  FOREIGN KEY (DepartmentID) REFERENCES Department(DeptID) ON DELETE SET NULL
);

CREATE TABLE Appointment (
  AppointmentID INT PRIMARY KEY,
  PatientID INT,
  RoomID INT,
  DoctorID INT,
  AppointmentDate DATETIME,
  Reason TEXT,
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE SET NULL,
  FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE SET NULL,
  FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID) ON DELETE SET NULL
);

CREATE TABLE MedicalRecord (
  RecordID INT PRIMARY KEY,
  Medication TEXT,
  Dossage NUMERIC,
  Diagnosis TEXT,
  AppointmentID INT,
  FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID) ON DELETE CASCADE
);

CREATE TABLE Room (
  RoomID INT PRIMARY KEY,
  Type VARCHAR(50)
);

-- Insert sample data
INSERT INTO Department (DeptID, Name) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Pediatrics'),
(5, 'Dermatology'),
(6, 'General Practitioner'),
(7, 'Radiology');

INSERT INTO Doctor (DoctorID, Name, Speciality, DeptID) VALUES
(1, 'Dr. Lars Mikkelsen', 'Cardiologist', 1),
(2, 'Dr. Sofie Andersen', 'Neurologist', 2),
(3, 'Dr. Henrik Nielsen', 'Orthopedic Surgeon', 3),
(4, 'Dr. Emma Christensen', 'Pediatrician', 4),
(5, 'Dr. Frederik Hansen', 'Dermatologist', 5),
(6, 'Dr. Erik Holm', 'General Practitioner', 6),
(7, 'Dr. Anna Petersen', 'Radiologist', 7);

INSERT INTO Patient (PatientID, Name, Gender, DateOfBirth, Address, AssignmentDate, DoctorID) VALUES
(1, 'Ida Sørensen', 'Female', '1985-04-12', 'Strandvejen 12, København', '2025-03-20 10:30:00', 1),
(2, 'Mikkel Jensen', 'Male', '1990-07-23', 'Nørrebrogade 45, København', '2025-03-21 11:00:00', 2),
(3, 'Anders Pedersen', 'Male', '1982-12-15', 'Østerbrogade 78, København', '2025-03-22 14:00:00', 3),
(4, 'Camilla Larsen', 'Female', '1995-05-30', 'Amagerbrogade 32, København', '2025-03-23 09:30:00', 4),
(5, 'Emil Thomsen', 'Male', '1978-09-10', 'Frederiksberg Allé 65, Frederiksberg', '2025-03-24 13:15:00', 5),
(6, 'Søren Kristensen', 'Male', '1975-06-14', 'Roskildevej 25, Roskilde', '2025-03-21 15:00:00', 6),
(7, 'Lotte Henriksen', 'Female', '1988-11-03', 'Vesterbrogade 98, København', '2025-03-22 08:30:00', 6);

INSERT INTO Nurse (NurseID, Name, DepartmentID) VALUES
(1, 'Nurse Katrine Møller', 1),
(2, 'Nurse Jonas Rasmussen', 2),
(3, 'Nurse Maria Olesen', 3),
(4, 'Nurse Kasper Lund', 4),
(5, 'Nurse Louise Birk', 5),
(6, 'Nurse Peter Hansen', 6),
(7, 'Nurse Ingrid Larsen', 7);

INSERT INTO Room (RoomID, Type) VALUES
(1, 'ICU'),
(2, 'General'),
(3, 'Private'),
(4, 'Surgical'),
(5, 'Maternity'),
(6, 'Examination'),
(7, 'Imaging');

INSERT INTO Appointment (AppointmentID, PatientID, RoomID, DoctorID, AppointmentDate, Reason) VALUES
(1, 1, 1, 1, '2025-03-25 10:00:00', 'Routine Checkup'),
(2, 2, 2, 2, '2025-03-26 11:30:00', 'Headache and dizziness'),
(3, 3, 3, 3, '2025-03-27 14:45:00', 'Knee Pain'),
(4, 4, 4, 4, '2025-03-28 09:00:00', 'Flu Symptoms'),
(5, 5, 5, 5, '2025-03-29 13:00:00', 'Skin Rash'),
(6, 6, 6, 6, '2025-03-30 10:45:00', 'General check-up'),
(7, 7, 7, 7, '2025-03-31 12:15:00', 'X-ray for possible fracture');

INSERT INTO MedicalRecord (RecordID, Medication, Dossage, Diagnosis, AppointmentID) VALUES
(1, 'Aspirin', 100, 'Hypertension', 1),
(2, 'Ibuprofen', 200, 'Migraine', 2),
(3, 'Paracetamol', 500, 'Arthritis', 3),
(4, 'Amoxicillin', 250, 'Influenza', 4),
(5, 'Hydrocortisone', 50, 'Eczema', 5),
(6, 'Multivitamins', 1, 'Routine Health Check', 6),
(7, 'None', 0, 'Suspected fracture, awaiting further tests', 7);

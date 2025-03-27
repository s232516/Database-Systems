DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Nurse;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS MedicalRecord;

CREATE TABLE Department (
  DeptID INT,
  DepartmentName VARCHAR(50),
  PRIMARY KEY (DeptID)
);

CREATE TABLE Doctor (
  DoctorID INT,
  DoctorName VARCHAR(50),
  Speciality VARCHAR(50),
  DeptID INT,
  PRIMARY KEY (DoctorID),
  FOREIGN KEY (DeptID) REFERENCES Department(DeptID) ON DELETE SET NULL
);

CREATE TABLE Room (
  RoomID INT,
  Type VARCHAR(50),
  PRIMARY KEY (RoomID)
);

CREATE TABLE Patient (
  PatientID INT,
  PatientName VARCHAR(50),
  Gender VARCHAR(50),
  DateOfBirth DATE,
  Address TEXT,
  AssignmentDate DATETIME,
  DoctorID INT,
  PRIMARY KEY (PatientID),
  FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID) ON DELETE SET NULL
);

CREATE TABLE Nurse (
  NurseID INT,
  NurseName VARCHAR(50),
  DepartmentID INT,
  PRIMARY KEY (NurseID),
  FOREIGN KEY (DepartmentID) REFERENCES Department(DeptID) ON DELETE SET NULL
);

CREATE TABLE Appointment (
  AppointmentID INT,
  PatientID INT,
  RoomID INT,
  DoctorID INT,
  AppointmentDate DATETIME,
  Reason TEXT,
  PRIMARY KEY (AppointmentID),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE SET NULL,
  FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE SET NULL,
  FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID) ON DELETE SET NULL
);

CREATE TABLE MedicalRecord (
  RecordID INT,
  Medication TEXT,
  Dosage TEXT,
  Diagnosis TEXT,
  AppointmentID INT,
  PRIMARY KEY (RecordID),
  FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID) ON DELETE CASCADE
);


-- Insert sample data
INSERT INTO Department (DeptID, DepartmentName) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Pediatrics'),
(5, 'Dermatology'),
(6, 'General Practitioner'),
(7, 'Radiology');

INSERT INTO Doctor (DoctorID, DoctorName, Speciality, DeptID) VALUES
(1, 'Dr. Lars Mikkelsen', 'Cardiologist', 1),
(2, 'Dr. Sofie Andersen', 'Neurologist', 2),
(3, 'Dr. Henrik Nielsen', 'Orthopedic Surgeon', 3),
(4, 'Dr. Emma Christensen', 'Pediatrician', 4),
(5, 'Dr. Frederik Hansen', 'Dermatologist', 5),
(6, 'Dr. Erik Holm', 'General Practitioner', 6),
(7, 'Dr. Anna Petersen', 'Radiologist', 7);

INSERT INTO Patient (PatientID, PatientName, Gender, DateOfBirth, Address, AssignmentDate, DoctorID) VALUES
(1, 'Ida Sørensen', 'Female', '1985-04-12', 'Strandvejen 12, København', '2025-03-20 10:30:00', 1),
(2, 'Mikkel Jensen', 'Male', '1990-07-23', 'Nørrebrogade 45, København', '2025-03-21 11:00:00', 2),
(3, 'Anders Pedersen', 'Male', '1982-12-15', 'Østerbrogade 78, København', '2025-03-22 14:00:00', 3),
(4, 'Camilla Larsen', 'Female', '1995-05-30', 'Amagerbrogade 32, København', '2025-03-23 09:30:00', 4),
(5, 'Emil Thomsen', 'Male', '1978-09-10', 'Frederiksberg Allé 65, Frederiksberg', '2025-03-24 13:15:00', 5),
(6, 'Søren Kristensen', 'Male', '1975-06-14', 'Roskildevej 25, Roskilde', '2025-03-21 15:00:00', 6),
(7, 'Lotte Henriksen', 'Female', '1988-11-03', 'Vesterbrogade 98, København', '2025-03-22 08:30:00', 6);

INSERT INTO Nurse (NurseID, NurseName, DepartmentID) VALUES
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

INSERT INTO MedicalRecord (RecordID, Medication, Dosage, Diagnosis, AppointmentID) VALUES
(1, 'Aspirin 100mg', 100, 'Hypertension', 1),
(2, NULL, NULL, 'Suspected fracture, awaiting further tests', 1),
(3, 'Ibuprofen 200mg', 200, 'Migraine', 2),
(4, NULL, NULL, 'Suspected fracture, awaiting further tests', 2),
(5, 'Paracetamol 500mg', 500, 'Arthritis', 3),
(6, NULL, NULL, 'Suspected fracture, awaiting further tests', 3),
(7, 'Amoxicillin 250mg', 250, 'Influenza', 4),
(8, NULL, NULL, 'Suspected fracture, awaiting further tests', 4),
(9, 'Hydrocortisone 50mg', '1 ', 'Eczema', 5),
(10, NULL, NULL, 'Suspected fracture, awaiting further tests', 5),
(11, 'Multivitamins', 1, 'Routine Health Check', 6),
(12, NULL, NULL, 'Suspected fracture, awaiting further tests', 6),
(13, NULL, NULL, 'Suspected fracture, awaiting further tests', 7);


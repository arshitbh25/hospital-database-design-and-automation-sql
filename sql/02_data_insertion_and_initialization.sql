/* 
File Name   : 02_data_insertion_and_initialization.sql
Created On  : 09-Feb-2026
Database    : Hospital
*/


/*
Problem Statement:

After creating the relational database schema, the next step is to migrate and insert the
existing hospital data from the legacy Excel/CSV system into the structured database.

The hospital's historical data is stored in a file named 'hospital_data.csv', which contains
combined information related to patients, doctors, departments, appointments, prescriptions,
and billing. This data must be properly imported and transformed before inserting it into
the normalized relational tables.



Data Migration Requirements:

1. Import the combined dataset from 'hospital_data.csv' into the existing database named 'Hospital'
   as a staging table (single raw table).

2. While importing the data, ensure that each column's datatype is correctly converted to match
   the datatype definitions used in the relational schema created in '01_database_schema_creation.sql'.

3. After successful import and datatype alignment, insert the cleaned and structured data into
   the respective normalized tables such as Patients, Doctors, Departments, Appointments,
   Prescriptions, and Billing.

Important Note:
Failure to correctly import the data or mismatch in datatypes may result in insertion errors,
constraint violations, or data integrity issues.
*/




SELECT * FROM hospital_data


-- Task : Inserting values into Department Table
SET IDENTITY_INSERT Department ON

INSERT INTO Department (Department_ID, Department_Name)
SELECT Departments_DepartmentID, Departments_Name FROM hospital_data
WHERE
	Departments_DepartmentID is not NULL

SET IDENTITY_INSERT Department OFF




-- Task : Inserting values into Doctor Table
SET IDENTITY_INSERT Doctor ON

INSERT INTO Doctor (Doctor_ID, Doctor_Name, Specialization, Role, Department_ID)
SELECT Doctors_DoctorID, Doctors_Name,
	   Doctors_Specialization, Doctors_Role,
	   Doctors_DepartmentID
FROM hospital_data
WHERE
	Doctors_DoctorID is not NULL

SET IDENTITY_INSERT Doctor OFF




-- Task : Inserting values into Patient Table
SET IDENTITY_INSERT Patient ON

INSERT INTO Patient (Patient_ID, Patient_Name, Date_of_Birth, Gender, Phone_Number)
SELECT Patients_PatientID, Patients_Name,
	   Patients_DateOfBirth, Patients_Gender,
	   Patients_Phone
FROM hospital_data
WHERE
	Patients_PatientID is not NULL

SET IDENTITY_INSERT Patient OFF




-- Task : Inserting values into Appointment Table
SET IDENTITY_INSERT Appointment ON

INSERT INTO Appointment (Appointment_ID, Patient_ID, Doctor_ID, Appointment_Time, Appointment_Status)
SELECT Appointments_AppointmentID, Appointments_PatientID,
	   Appointments_DoctorID, Appointments_AppointmentTime,
	   Appointments_Status
FROM hospital_data
WHERE
	Appointments_AppointmentID is not null

SET IDENTITY_INSERT Appointment OFF




-- Task : Inserting values into Prescription Table
SET IDENTITY_INSERT Prescription ON

INSERT INTO Prescription (Prescription_ID, Appointment_ID, Medicine, Dosage)
SELECT Prescriptions_PrescriptionID,Prescriptions_AppointmentID,
	   Prescriptions_Medication, Prescriptions_Dosage
FROM hospital_data
WHERE
	Prescriptions_PrescriptionID is not NULL

SET IDENTITY_INSERT Prescription OFF




-- Task : Inserting values into Bill Table
SET IDENTITY_INSERT Bill ON

INSERT INTO Bill (Bill_ID, Appointment_ID, Amount, Paid, Bill_Date)
SELECT Bills_BillID, Bills_AppointmentID,
	   Bills_Amount, Bills_Paid,
	   Bills_BillDate
FROM hospital_data
WHERE
	Bills_BillID is not NULL

SET IDENTITY_INSERT Bill OFF




-- Task : Inserting values into LabReport Table
SET IDENTITY_INSERT LabReport ON

INSERT INTO LabReport (Report_ID, Appointment_ID, Created_on, Report_Data)
SELECT LabReports_ReportID, LabReports_AppointmentID,
	   LabReports_CreatedAt, LabReports_ReportData
FROM hospital_data
WHERE
	LabReports_ReportID is not NULL

SET IDENTITY_INSERT LabReport OFF

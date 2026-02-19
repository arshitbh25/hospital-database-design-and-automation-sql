/* 
File Name   : 01_database_schema_creation.sql
Created On  : 09-Feb-2026
Database    : Hospital
*/



CREATE DATABASE Hospital
USE Hospital

/*
Problem Statement:

The hospital currently maintains its operational data using Excel files, which lack structure,
unique identifiers, and enforceable relationships between entities such as patients, doctors,
departments, and appointments. This leads to data redundancy, inconsistency, and difficulty
in managing hospital operations.

This script creates the relational database schema by defining structured tables with
primary keys, foreign keys, and appropriate constraints. The objective is to establish a
normalized and scalable database system that ensures data integrity, supports efficient
data management, and forms the foundation for appointment management, billing, reporting,
and secure access control.
*/


-- Task : Creating table Department
CREATE TABLE Department
(
	Department_ID INT IDENTITY(1,1) PRIMARY KEY	,
	Department_Name VARCHAR(50) not NULL
)


-- Task : Creating table Doctors
CREATE TABLE Doctor
(
	Doctor_ID INT IDENTITY(1,1) PRIMARY KEY,
	Doctor_Name VARCHAR(50),
	Specialization VARCHAR(50),
	Role VARCHAR(50),
	Department_ID INT,
	FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
)


-- Task : Creating table Patient
CREATE TABLE Patient
(
	Patient_ID INT IDENTITY(1,1) PRIMARY KEY,
	Patient_Name VARCHAR(50),
	Date_of_Birth DATE,
	Gender CHAR(1) CHECK (Gender in ('M','F','O')),
	Phone_Number VARCHAR(50) 
)


-- Task : Creating table Appointment
CREATE TABLE Appointment
(
	Appointment_ID INT IDENTITY(1,1) PRIMARY KEY,
	Patient_ID INT FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
	Doctor_ID INT FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
	Appointment_Time DATETIME,
	Appointment_Status VARCHAR(50) CHECK (Appointment_Status in ('Scheduled','Completed','Cancelled'))
)


-- Task : Creating table Prescription
CREATE TABLE Prescription
(
	Prescription_ID INT IDENTITY(1,1) PRIMARY KEY,
	Appointment_ID INT FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID),
	Medicine VARCHAR(100),
	Dosage VARCHAR(50)
)


-- Task : Creating table Bill
CREATE TABLE Bill
(
	Bill_ID INT IDENTITY(1,1) PRIMARY KEY,
	Appointment_ID INT FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID),
	Amount DECIMAL(9,2),
	Paid BIT CHECK (Paid in (0,1)),
	Bill_Date DATETIME DEFAULT GETDATE()
)


-- Task : Creating table LabReport
CREATE TABLE LabReport
(
	Report_ID INT IDENTITY(1,1) PRIMARY KEY,
	Appointment_ID INT FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID),
	Created_on DATETIME DEFAULT GETDATE(),
	Report_Data NVARCHAR(MAX)
)

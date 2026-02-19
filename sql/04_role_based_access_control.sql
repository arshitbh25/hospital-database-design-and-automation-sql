/* 
File Name   : 04_role_based_access_control.sql
Created On  : 09-Feb-2026
Database    : Hospital
*/


/*
Problem Statement:

Currently, all doctors have unrestricted access to all patient records regardless of their
department or role. This lack of access control creates serious data privacy, security, and
compliance risks.

This script implements role-based access control mechanisms to ensure that doctors can only
access patient records (whose appointment is scheduled) relevant to their department or assigned patients, while senior doctors
may have broader access privileges. The objective is to enhance data security, enforce privacy
policies, and ensure controlled access to sensitive patient information.
*/




CREATE or ALTER PROCEDURE View_Doctors_Data
(
	@input_username VARCHAR(50),
	@input_password VARCHAR(50)
)
AS
BEGIN
	
	DECLARE
		@doctor_id INT,
		@doctor_role VARCHAR(50),
		@department_id INT

	-- Fetching Doctor_ID from doctor_credentials Table
	SELECT @doctor_id = doctor_id
	FROM doctor_credentials
	WHERE
		user_name = @input_username
		and
		password = @input_password

	
	-- Throwing Error for invalid credentials
	IF @doctor_id is NULL
	BEGIN
		THROW 50001, 'Error: Invalid Credentials! Try Again with Vaild one.', 1;
        RETURN
	END


	-- Fetching Doctor's Role and Department from Doctor Table
	SELECT @doctor_role = Role,
		   @department_id = Department_ID
	FROM Doctor
	WHERE
		Doctor_ID = @doctor_id


	-- Selecting Required data as per valid roles
	IF @doctor_role = 'Senior'
	BEGIN
		SELECT D.Doctor_ID,P.Patient_ID, P.Patient_Name, P.Gender, 
			   A.Appointment_Time, PR.Medicine,LR.Report_Data
		FROM Appointment AS A
		left join
		Doctor AS D
		ON A.Doctor_ID = D.Doctor_ID
		left join
		Patient AS P
		ON A.Patient_ID = P.Patient_ID
		left join
		LabReport AS LR
		ON LR.Appointment_ID = A.Appointment_ID
		left join
		Prescription AS PR
		ON PR.Appointment_ID = A.Appointment_ID
		WHERE
			D.Department_ID = @department_id
			and
			A.Appointment_Status = 'Scheduled'
		ORDER BY A.Appointment_Time
	END

	ELSE
	BEGIN
		SELECT P.Patient_ID, P.Patient_Name, P.Gender, 
			   A.Appointment_Time, PR.Medicine,LR.Report_Data
		FROM Appointment AS A
		left join
		Patient AS P
		ON A.Patient_ID = P.Patient_ID
		left join
		LabReport AS LR
		ON LR.Appointment_ID = A.Appointment_ID
		left join
		Prescription AS PR
		ON PR.Appointment_ID = A.Appointment_ID
		WHERE
			A.Doctor_ID = @doctor_id
			and
			A.Appointment_Status = 'Scheduled'
		ORDER BY A.Appointment_Time
	END

END

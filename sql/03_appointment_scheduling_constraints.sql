/* 
File Name   : 03_appointment_scheduling_constraints.sql
Created On  : 09-Feb-2026
Database    : Hospital
*/


/*
Problem Statement:

The hospital currently faces scheduling issues such as double-booking of doctors and
appointments being scheduled in the past. These inconsistencies disrupt hospital workflows,
impact patient care, and reduce operational efficiency.

This script implements constraints, validation rules, and logic to regulate appointment
scheduling. The objective is to prevent invalid appointment entries, ensure doctors cannot
be double-booked, and enforce valid scheduling timelines, thereby improving scheduling
accuracy and maintaining operational integrity.
*/
	



CREATE TRIGGER Check_new_Appointment
ON Appointment
INSTEAD OF INSERT
AS
BEGIN
	-- Checks appointment cannot in the past
	IF exists
	(
		SELECT * FROM inserted
		WHERE Appointment_Time < GETDATE()
	)
	BEGIN
		THROW 50001, 'Error: Appointment cannot be in the past.', 1;
        RETURN
	END

	-- Checks whether doctor already has an appointment at the same time
	IF exists
	(
		SELECT * FROM inserted AS I
		inner join
		Appointment AS A
		ON I.Doctor_ID = A.Doctor_ID
		and I.Appointment_Time = A.Appointment_Time
		WHERE A.Appointment_Status = 'Scheduled'
	)
	BEGIN
        THROW 50002, 'Error: Doctor already has an appointment at this time.', 1;
        RETURN
    END

	-- Insert only if all the validation passes
	INSERT INTO Appointment (Patient_ID, Doctor_ID, Appointment_Time, Appointment_Status)
	SELECT Patient_ID, Doctor_ID,
		   Appointment_Time, Appointment_Status
	FROM inserted
END



-- Testing 1 : Inserting past date to Appointment Table

INSERT INTO Appointment(Patient_ID,Doctor_ID,Appointment_Time,Appointment_Status)
VALUES(1, 1, '2025-06-25 10:00:00', 'Scheduled')



-- Testing 2 : Inserting same value multiple times in Appointment Table

INSERT INTO Appointment(Patient_ID,Doctor_ID,Appointment_Time,Appointment_Status)
VALUES(1, 1, '2026-06-25 10:00:00', 'Scheduled')

INSERT INTO Appointment(Patient_ID,Doctor_ID,Appointment_Time,Appointment_Status)
VALUES(1, 1, '2026-06-25 10:00:00', 'Scheduled')
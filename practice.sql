-- -- 1ST
-- CREATE TABLE DOCTOR_SPECIALIZATION (
--     ID INT PRIMARY KEY NOT NULL,  
--     DOCTORID INT NOT NULL REFERENCES DOCTORS(ID), 
--     SPECIALIZATIONID INT NOT NULL REFERENCES SPEACIALIZATIONS(ID)
    
-- );

-- INSERT INTO DOCTOR_SPECIALIZATION (ID, DOCTORID, SPECIALIZATIONID) 
-- VALUES
-- (1, 1, 1),
-- (2, 2, 2),
-- (3, 3, 3),
-- (4, 4, 4),
-- (5, 5, 5),
-- (6, 6, 6),
-- (7, 7, 7),
-- (8, 8, 8),
-- (9, 9, 9),
-- (10, 10, 10);





-- -- 2ND
-- CREATE TABLE SPONSORS(
-- 	ID INT PRIMARY KEY NOT NULL,
-- 	SPONSOR_NAME VARCHAR(100) NOT NULL UNIQUE
-- );


-- INSERT INTO SPONSORS (ID, SPONSOR_NAME) VALUES
-- (1, 'SPONSOR 1'),
-- (2, 'SPONSOR 2'),
-- (3, 'SPONSOR 3'),
-- (4, 'SPONSOR 4'),
-- (5, 'SPONSOR 5'),
-- (6, 'SPONSOR 6'),
-- (7, 'SPONSOR 7'),
-- (8, 'SPONSOR 8'),
-- (9, 'SPONSOR 9'),
-- (10, 'SPONSOR 10');




-- 3RD
-- CREATE TABLE DONATIONS(
-- 	ID INT PRIMARY KEY NOT NULL,
-- 	AMMOUNT INT NOT NULL CHECK (AMMOUNT > 0),
-- 	DONATION_DATE DATE NOT NULL DEFAULT CURRENT_DATE,
-- 	DEPARTMENTID INT REFERENCES DEPARTMENTS(ID) NOT NULL,
-- 	SPONSORID INT REFERENCES SPONSORS(ID) NOT NULL
-- );

-- INSERT INTO DONATIONS (ID, AMMOUNT, DEPARTMENTID, SPONSORID) VALUES
-- (1, 100, 1, 1),
-- (2, 200, 2, 2),
-- (3, 150, 3, 3),
-- (4, 250, 4, 4),
-- (5, 180, 5, 5),
-- (6, 300, 6, 6),
-- (7, 120, 7, 7),
-- (8, 170, 8, 8),
-- (9, 220, 9, 9),
-- (10, 195, 10, 10);




-- -- 4
-- CREATE TABLE SPEACIALIZATIONS(
-- 	ID INT PRIMARY KEY NOT NULL,
-- 	SPECIALIZATION_NAME VARCHAR(100) NOT NULL UNIQUE 

-- );

-- INSERT INTO SPEACIALIZATIONS (ID, SPECIALIZATION_NAME) VALUES
-- (1, 'SPECIALIZATION 1'),
-- (2, 'SPECIALIZATION 2'),
-- (3, 'SPECIALIZATION 3'),
-- (4, 'SPECIALIZATION 4'),
-- (5, 'SPECIALIZATION 5'),
-- (6, 'SPECIALIZATION 6'),
-- (7, 'SPECIALIZATION 7'),
-- (8, 'SPECIALIZATION 8'),
-- (9, 'SPECIALIZATION 9'),
-- (10, 'SPECIALIZATION 10');




-- -- 5
-- CREATE TABLE VACATIONS(
-- 	ID INT PRIMARY KEY NOT NULL,
-- 	STARTDATE DATE NOT NULL,
-- 	ENDDATE DATE NOT NULL CHECK (ENDDATE > STARTDATE),
-- 	DOCTORID INT NOT NULL REFERENCES DOCTORS(ID)
-- );

-- INSERT INTO VACATIONS (ID, STARTDATE, ENDDATE, DOCTORID) VALUES
-- (1, '2024-06-01', '2024-06-07', 1),
-- (2, '2024-07-15', '2024-07-25', 2),
-- (3, '2024-08-10', '2024-08-20', 3),
-- (4, '2024-09-05', '2024-09-10', 4),
-- (5, '2024-10-01', '2024-10-07', 5),
-- (6, '2024-11-15', '2024-11-20', 6),
-- (7, '2024-12-10', '2024-12-18', 7),
-- (8, '2025-01-05', '2025-01-10', 8),
-- (9, '2025-02-20', '2025-02-25', 9),
-- (10, '2025-03-15', '2025-03-20', 10);



-- -- 6TH
-- ALTER TABLE WARDS
-- ADD COLUMN DEPERMENT_ID INT REFERENCES DEPARTMENTS(ID);

-- UPDATE WARDS
-- SET DEPERMENT_ID = 1
-- WHERE ID % 2 = 0;

-- UPDATE WARDS
-- SET DEPERMENT_ID = 2
-- WHERE ID % 2 = 1;

-- UPDATE WARDS
-- SET DEPERMENT_ID = BUILDING







-- QUERIES
-- -- 1
-- SELECT NAME, SURNAME, SPECIALIZATION_NAME
-- FROM DOCTORS 
-- JOIN DOCTOR_SPECIALIZATION ON DOCTORS.ID = DOCTOR_SPECIALIZATION.DOCTORID
-- JOIN SPEACIALIZATIONS ON DOCTOR_SPECIALIZATION.SPECIALIZATIONID = SPEACIALIZATIONS.ID;


-- 2
-- SELECT NAME, SALARY
-- 	FROM DOCTORS
-- 	JOIN VACATIONS ON DOCTORS.ID = VACATIONS.DOCTORID
-- WHERE STARTDATE > CURRENT_DATE


-- 3
-- SELECT NAME
-- FROM WARDS
-- JOIN DEPARTMENTS ON WARDS.DEPERMENT_ID = DEPARTMENTS.ID
-- WHERE DEPARTMENT_NAME = 'DEPARTMNENT D'


-- 4
-- SELECT DISTINCT NAME
-- FROM DEPARTMENTS
-- JOIN DONATIONS ON DEPARTMENTS.ID = DONATIONS.DEPARTMENTID
-- JOIN SPONSORS ON DONATIONS.SPONSORID = SPONSORS.ID
-- WHERE SPONSOR_NAME = 'SPONSOR 6'


-- 5
-- SELECT 
--     DEPARTMENTS.NAME AS DEPARTMENT,
--     SPONSORS.SPONSOR_NAME AS SPONSOR,
--     DONATIONS.AMMOUNT AS DONATION_AMOUNT,
--     DONATIONS.DONATION_DATE AS DONATION_DATE
-- FROM 
--     DONATIONS
-- JOIN 
--     DEPARTMENTS ON DONATIONS.DEPARTMENTID = DEPARTMENTS.ID
-- JOIN 
--     SPONSORS ON DONATIONS.SPONSORID = SPONSORS.ID
	
-- 6
-- SELECT NAME, SURNAME, DEPARTMENT_NAME
-- FROM EXAMINATIONS
-- JOIN DOCTORS ON EXAMINATIONS.DOCTOR_ID = DOCTORS.ID
-- WHERE DAY_OF_WEEK < 6


-- 7
-- SELECT NAME
-- FROM DEPARTMENTS
-- JOIN DONATIONS ON DEPARTMENTS.ID = DONATIONS.DEPARTMENTID
-- WHERE AMMOUNT > 200


-- 8
-- ALTER TABLE DEPARTMENTS
-- ADD COLUMN DOCTOR_ID INT REFERENCES DOCTORS(ID);

-- UPDATE DEPARTMENTS
-- SET DOCTOR_ID = 1
-- WHERE ID % 2 = 0;

-- UPDATE DEPARTMENTS
-- SET DOCTOR_ID = 2
-- WHERE ID % 2 = 1;

-- SELECT DOCTOR_NAME
-- FROM DOCTORS
-- JOIN DEPARTMENTS ON DOCTORS.ID = DEPARTMENTS.DOCTOR_ID
-- WHERE PREMIUM = 0

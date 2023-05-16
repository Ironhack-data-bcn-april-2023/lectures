-- 1. CREATE DATABASE
DROP DATABASE IF EXISTS school;
CREATE DATABASE IF NOT EXISTS school;
USE school;

-- 2. CREATE TABLES: teacher, client, course, participant, tk_c
CREATE TABLE IF NOT EXISTS teacher  (
	teacher_id INT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    language_1 	CHAR(3), -- ENG
    language_2 VARCHAR(3),
    dob DATE,
    tax_id INT UNIQUE,
    phone_no VARCHAR(20)
);

-- client: cols, pk
CREATE TABLE IF NOT EXISTS client (
	client_id INT PRIMARY KEY,
    client_name VARCHAR(20),
    address VARCHAR(40),
    industry VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS participant (
	participant_id INT PRIMARY KEY, 
    first_name VARCHAR(10),
    last_name VARCHAR(10),
    phone_no VARCHAR(20), 
    client INT -- This will be a FK from client table
);

CREATE TABLE IF NOT EXISTS course (
	course_id INT PRIMARY KEY,
    course_name VARCHAR(15) NOT NULL,
    language CHAR(3),
    level CHAR(2), -- B1, A1, A2
	course_length_weeks INT,
    start_date DATE,
    in_school BOOLEAN,
    teacher INT,
    client INT
);

-- 3. ALTER TABLE
ALTER TABLE	participant
	ADD FOREIGN KEY (client)
REFERENCES client(client_id)
ON DELETE SET NULL;

ALTER TABLE course 
	ADD FOREIGN KEY (teacher)
REFERENCES teacher(teacher_id)
ON DELETE CASCADE;

ALTER TABLE course 
	ADD FOREIGN KEY (client)
REFERENCES client(client_id)
ON DELETE CASCADE;


CREATE TABLE takes_course (
	participant_id INT,
    course_id INT,
    PRIMARY KEY(participant_id, course_id),
		FOREIGN KEY (participant_id) REFERENCES participant(participant_id),
        FOREIGN KEY (course_id) REFERENCES course(course_id)
);


-- 4. POPULATE
INSERT INTO teacher(teacher_id, first_name, language_1, language_2)
VALUES (1, "Mica", "ESP", "ENG");

INSERT INTO teacher VALUES
(2, "name", "CAT", "eng", "1950-10-10", 90876, "09876"),
(3, "name", "CAT", "eng", "1950-10-10", 345234, "09876"),
(4, "name", "CAT", "eng", "1950-10-10", 234567, "09876");


-- 5. MODIFY THE DATA
-- 5.1. Delete
DELETE FROM teacher WHERE teacher_id = 1;

-- 5.2. Update
UPDATE teacher
SET first_name = "Hugo"
WHERE teacher_id = 2;

-- 6. SIMPLE READING
SELECT * FROM teacher;

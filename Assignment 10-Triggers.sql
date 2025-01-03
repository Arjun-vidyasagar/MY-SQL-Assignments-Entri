CREATE DATABASE School;
USE School;

CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    experience INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO teachers (name, subject, experience, salary) VALUES
('John Smith', 'Mathematics', 8, 50000),
('Alice Johnson', 'Science', 12, 60000),
('Robert Brown', 'English', 7, 45000),
('Emily Davis', 'History', 10, 55000),
('Michael Wilson', 'Physics', 15, 70000),
('Sophia Taylor', 'Chemistry', 9, 48000),
('Liam Anderson', 'Biology', 3, 40000),
('Olivia Martinez', 'Geography', 5, 42000);

CREATE TABLE teacher_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    action VARCHAR(50) NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero.
DELIMITER //
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END;
//
DELIMITER ;

INSERT INTO teachers (name, subject, experience, salary) 
VALUES ('Jessy', 'Art', 5, -2);

-- Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted.

DELIMITER //
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action)
    VALUES (NEW.id, 'INSERT');
END;
//
DELIMITER ;

SELECT * FROM teacher_log;
SELECT * FROM teachers;
INSERT INTO teachers (name, subject, experience, salary)
VALUES ('David Johnson', 'Mathematics', 5, 45000);

-- Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years.

DELIMITER //
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with experience greater than 10 years';
    END IF;
END;
//
DELIMITER ;

DELETE FROM teachers
WHERE experience >12;

-- Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.

DELIMITER //
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action)
    VALUES (OLD.id, 'DELETE');
END;
//
DELIMITER ;

DELETE FROM teachers WHERE id = 3;

SELECT * FROM teacher_log;
SELECT * FROM teachers;


INSERT INTO teachers (name, subject, experience, salary)
VALUES ('sHOBANA', 'Physics', 5, 50000);

DELETE FROM teachers WHERE name = 'sHOBANA';



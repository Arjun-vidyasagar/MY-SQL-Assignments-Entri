CREATE DATABASE Company;
USE Company;

CREATE TABLE Worker (
    Worker_Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATE,
    Department CHAR(25)
);

desc worker;

INSERT INTO Worker (FirstName, LastName, Salary, JoiningDate, Department) VALUES
('John', 'Doe', 50000, '2020-01-15', 'HR'),
('Alice', 'Smith', 60000, '2019-03-10', 'Finance'),
('Bob', 'Brown', 70000, '2018-05-20', 'IT'),
('Emily', 'Davis', 80000, '2021-06-25', 'HR'),
('Liam', 'Wilson', 75000, '2017-11-30', 'Finance'),
('Emma', 'Taylor', 72000, '2020-08-15', 'IT'),
('Mia', 'White', 54000, '2019-09-05', 'HR'),
('Noah', 'Walker', 88000, '2021-12-01', 'IT'),
('Sophia', 'Lopez', 65000, '2022-03-15', 'Finance'),
('James', 'Clark', 47000, '2020-02-20', 'HR'),
('Olivia', 'Evans', 81000, '2018-12-10', 'IT'),
('Ethan', 'Martin', 72000, '2021-05-18', 'Finance'),
('Isabella', 'Harris', 62000, '2019-07-22', 'HR');

-- Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.

Delimiter //
create procedure addworker(
in first_name char(25),
in last_name char(25),
in p_salary int,
in joining_date date,
in department_name char(25)
)

Begin
insert into worker(FirstName, LastName, Salary, JoiningDate, Department)
values (first_name, last_name, p_salary, joining_date, department_name);
end //
delimiter ;

CALL AddWorker('Arjun', 'Krishna', 65000, '2021-03-15', 'Finance');

Select * from worker;

-- Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call. 

DELIMITER //
CREATE PROCEDURE getworkersalary(
    IN workerid INT,
    OUT p_salary INT
)
BEGIN
    SELECT Salary 
    INTO p_salary
    FROM Worker
    WHERE Worker_Id = workerid;
END //
DELIMITER ;

CALL getworkersalary(5, @salary);
SELECT  @salary AS WorkerSalary;

-- Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call.


delimiter //
create procedure UpdateWorkerDepartment(
in p_workerid int,
in P_department char(25)
)
begin
update worker
set department = p_department
where worker_id = p_workerid;
end//
delimiter ;

CALL UpdateWorkerDepartment(2, 'Marketing');

-- Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call.

delimiter //
create procedure CountWorkersInDepartment(
in p_department char(25),
out p_workercount int
)

begin

select count(*) into p_workercount
from worker
where department = p_department;
end //
delimiter ;

set @worker_count = 0;
CALL CountWorkersInDepartment('IT', @worker_count);
SELECT @worker_count AS WorkerCount;

-- Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

delimiter //

create procedure AvgSalaryInDepartment(
in p_department char(25),
Out p_avgSalary int
)
begin

select avg(salary) into p_avgSalary
from worker
where Department = p_Department;
END //
DELIMITER ;

set @average_salary = 0;
call AvgSalaryInDepartment('IT', @average_salary);
SELECT @average_salary AS AvgSalary;
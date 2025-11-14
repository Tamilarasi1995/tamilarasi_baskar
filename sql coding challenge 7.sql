
CREATE DATABASE IF NOT EXISTS company_procedures_views;
USE company_procedures_views;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments (DepartmentName) VALUES
('Software Development'),
('Human Resources'),
('Finance'),
('Data Science');

INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary) VALUES
('Anu', 'mithra', 1, 50000),
('Bavi', 'thanya', 2, 75000),
('karthi', 'keyan', 3, 55000),
('tamil', 'pasupathi', 1, 80000),
('pooja', 'suresh', 4, 80000);

DELIMITER $$

CREATE PROCEDURE GetEmployeeByID (IN emp_id INT)
BEGIN
    SELECT 
        e.EmployeeID,
        CONCAT(e.FirstName, ' ', e.LastName) AS FullName,
        d.DepartmentName,
        e.Salary
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
    WHERE e.EmployeeID = emp_id;
END $$

DELIMITER ;

CALL GetEmployeeByID(3);

CREATE VIEW EmployeeDepartmentView AS
SELECT 
    CONCAT(FirstName, ' ', LastName) AS EmployeeName,
    DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

SELECT * FROM EmployeeDepartmentView;


CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    Bonus DECIMAL(10,2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Salaries (EmployeeID, Bonus) VALUES
(1, 9000),
(2, 2000),
(3, 4000),
(4, 6000),
(5, 1000);

CREATE VIEW EmployeeFullDetails AS
SELECT 
    e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS FullName,
    d.DepartmentName,
    e.Salary,
    s.Bonus,
    (e.Salary + s.Bonus) AS TotalCompensation
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
JOIN Salaries s ON e.EmployeeID = s.EmployeeID;

SELECT * FROM EmployeeFullDetails;
create database mangmentsystem
use mangmentsystem

-- Q1. Create Employees table
CREATE TABLE Employees
(
    ID INT ,
    Name VARCHAR(100),
    Salary DECIMAL(10,2)
);


-- Q2. Add Department column
ALTER TABLE Employees
ADD Department VARCHAR(50);


-- Q3. Remove Salary column

ALTER TABLE Employees
DROP COLUMN Salary;
-- ضفتهcolumn بعد ما مسحت ال  
-- Add Salary column
ALTER TABLE Employees
ADD Salary DECIMAL(10,2);


-- Q4. Rename Department to DeptName
EXECute sp_rename
    'Employees.Department',
    'DeptName',
    'COLUMN';


-- Q5. Create Projects table
CREATE TABLE Projects
(
    ProjectID INT,
    ProjectName VARCHAR(100)
);

ALTER TABLE Employees
ALTER Column ID INT NOT NULL

-- Q6. Add Primary Key to Employees
ALTER TABLE Employees
ADD CONSTRAINT PK_Employees
PRIMARY KEY (ID);


-- Q7. Create Foreign Key between Employees and Projects
ALTER TABLE Projects
ALTER Column ProjectID INT NOT NULL
-- First, add Primary Key to Projects
ALTER TABLE Projects
ADD CONSTRAINT PK_Projects
PRIMARY KEY (ProjectID);

-- Create Foreign Key
ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Projects
FOREIGN KEY (ID)
REFERENCES Projects(ProjectID);


-- Q8. Remove Foreign Key
ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Projects;


-- Q9. Add Unique Constraint to Name
ALTER TABLE Employees
ADD CONSTRAINT UQ_Employees_Name
UNIQUE (Name);


-- Q10. Create Customers table
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Status VARCHAR(50)
);


-- Q11. Add Unique Constraint to FirstName and LastName
ALTER TABLE Customers
ADD CONSTRAINT UQ_Customers_Name
UNIQUE (FirstName, LastName);


-- Q12. Add Default Value to Status
ALTER TABLE Customers
ADD CONSTRAINT DF_Customers_Status
DEFAULT 'Active' FOR Status;


-- Q13. Create Orders table
CREATE TABLE Orders
(
    OrderID INT,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2)
);


-- Q14. Add Check Constraint
ALTER TABLE Orders
ADD CONSTRAINT CK_Orders_TotalAmount
CHECK (TotalAmount > 0);


-- Q15. Create Sales Schema
go
CREATE SCHEMA Sales;
go


-- Q16. Move Orders table to Sales Schema
ALTER SCHEMA Sales
TRANSFER dbo.Orders;


-- Q17. Rename Orders to SalesOrders
EXECute sp_rename
    'Sales.Orders',
    'SalesOrders';



-- Q18. Select all columns from Employees
SELECT *
FROM Employees;


-- Q19. Select Name and Salary
SELECT Name, Salary
FROM Employees;


-- Q20. Select distinct DeptName
SELECT DISTINCT DeptName
FROM dbo.Employees;

-- Q21. Select top 5 records
SELECT TOP 5 *
FROM Employees;


-- Q22. Order Salary descending
SELECT *
FROM Employees
ORDER BY Salary DESC;


-- Q23. Select first 10 records starting from third record
SELECT *
FROM Employees
ORDER BY ID
OFFSET 2 ROWS
FETCH NEXT 10 ROWS ONLY;


-- Q24. Select average salary
SELECT AVG(Salary) AS AverageSalary
FROM Employees;


-- Q25. Select maximum and minimum salaries
SELECT
    MAX(Salary) AS MaxSalary,
    MIN(Salary) AS MinSalary
FROM Employees;


-- Q26. Select top 3 highest salaries
SELECT TOP 3 *
FROM Employees
ORDER BY Salary DESC;


-- Q27. Order employees by Name ascending
SELECT *
FROM Employees
ORDER BY Name ASC;


-- Q28. Select first 5 records starting from second record
SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 1 ROWS
FETCH NEXT 5 ROWS ONLY;


-- Q29. Select sum of all salaries
SELECT SUM(Salary) AS TotalSalary
FROM Employees;


-- Q30. Select salaries between 40000 and 60000
SELECT *
FROM Employees
WHERE Salary BETWEEN 40000 AND 60000
ORDER BY Salary ASC;

-- Sample data has been inserted into all tables to test the SQL queries and verify their results.

INSERT INTO Employees (ID, Name, DeptName, Salary)
VALUES
(1, 'Ahmed', 'IT', 45000),
(2, 'Mona', 'HR', 38000),
(3, 'Omar', 'IT', 55000),
(4, 'Sara', 'Finance', 60000),
(5, 'Ali', 'Marketing', 42000),
(6, 'Nour', 'HR', 35000),
(7, 'Youssef', 'IT', 70000),
(8, 'Hana', 'Finance', 50000),
(9, 'Khaled', 'Marketing', 48000),
(10, 'Salma', 'IT', 65000),
(11, 'Amr', 'HR', 40000),
(12, 'Farah', 'Finance', 58000);

INSERT INTO Projects (ProjectID, ProjectName)
VALUES
(1, 'Website'),
(2, 'Mobile App'),
(3, 'Management System'),
(4, 'E-Commerce'),
(5, 'Database System');

INSERT INTO Sales.SalesOrders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2026-01-10', 1500),
(2, 2, '2026-02-15', 2500),
(3, 3, '2026-03-20', 3000),
(4, 4, '2026-04-05', 4500),
(5, 5, '2026-05-12', 5000);

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Status)
VALUES
(1, 'Ahmed', 'Ali', 'ahmed@gmail.com', DEFAULT),
(2, 'Mona', 'Hassan', 'mona@gmail.com', DEFAULT),
(3, 'Omar', 'Mohamed', 'omar@gmail.com', 'Inactive'),
(4, 'Sara', 'Ali', 'sara@gmail.com', DEFAULT),
(5, 'Nour', 'Ibrahim', 'nour@gmail.com', 'Active');
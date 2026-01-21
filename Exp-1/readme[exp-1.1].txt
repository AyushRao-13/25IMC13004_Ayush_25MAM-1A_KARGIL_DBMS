Experiment: Department–Employee–Project Database Implementation
1. Aim of the Session

The aim of this practical is to design and implement a relational database schema for managing Departments, Employees, and Projects in an organization. This experiment focuses on defining tables with appropriate constraints, establishing relationships using foreign keys, and implementing role-based access control for secure data access.

2. Objective of the Session

Upon completing this session, the following objectives were achieved:

Designed table structures using Primary Keys, Foreign Keys, UNIQUE, and CHECK constraints

Gained hands-on experience with DML operations such as INSERT, SELECT, UPDATE, and DELETE

Implemented DCL commands to manage user roles and permissions

Applied DDL operations like ALTER TABLE and DROP TABLE

Maintained referential integrity across multiple related tables (Department, Employee, and Project)

3. Practical / Experiment Steps

The implementation was carried out through the following tasks:

Schema Definition: Created tables for Department, Employee, and Project with constraints such as NOT NULL, UNIQUE, and CHECK (e.g., salary > 0).

Relational Setup: Established relationships using Foreign Keys, including ON DELETE SET NULL behavior.

Data Population: Inserted sample records to validate schema design.

Operational Testing: Performed UPDATE and DELETE operations to observe constraint and referential actions.

Security Administration: Created a reporting role with limited read-only privileges.

Schema Modification: Altered table structure by adding a new column.

Table Maintenance: Dropped an existing table to test schema changes.

4. Procedure of the Practical

The following steps were followed during execution:

System Initialization: Logged into the database environment and established a connection.

Database Creation: Initialized a database for organizational data management.

Executing Table Scripts: Executed CREATE TABLE commands in a proper sequence.

Data Entry: Inserted department, employee, and project records.

Query Verification: Used SELECT statements to verify data consistency.

Data Modification: Executed UPDATE and DELETE queries to test behavior.

Role Configuration: Created a role and assigned selective privileges.

Security Verification: Revoked unnecessary permissions to validate access control.

Schema Update: Modified and dropped tables as part of schema evolution.

Record Maintenance: Saved SQL scripts and documented outputs.

5. I/O Analysis (Input / Output Analysis)
Input Queries
-- Table Creation
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary INT CHECK (salary > 0),
    dept_id INT,
    CONSTRAINT fk_dept
        FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
        ON DELETE SET NULL
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    dept_id INT NOT NULL,
    CONSTRAINT fk_project_dept
        FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
);

-- Data Manipulation
INSERT INTO Department VALUES (1, 'HR', 'Delhi');
INSERT INTO Department VALUES (2, 'IT', 'Bangalore');
INSERT INTO Department VALUES (3, 'Finance', 'Mumbai');

INSERT INTO Employee VALUES (101, 'Amit', 50000, 2);
INSERT INTO Employee VALUES (102, 'Riya', 45000, 1);
INSERT INTO Employee VALUES (103, 'Karan', 60000, 2);

INSERT INTO Project VALUES (201, 'Payroll System', 1);
INSERT INTO Project VALUES (202, 'Website Upgrade', 2);

UPDATE Employee
SET salary = 55000
WHERE emp_id = 101;

DELETE FROM Department
WHERE dept_id = 3;

-- Role Management
CREATE ROLE reporting_staff LOGIN PASSWORD 'reportS1';

GRANT SELECT ON Department TO reporting_staff;
GRANT SELECT ON Employee TO reporting_staff;
GRANT SELECT ON Project TO reporting_staff;

REVOKE CREATE ON SCHEMA public FROM reporting_staff;

ALTER TABLE Employee
ADD email VARCHAR(50);

DROP TABLE Project;

SELECT * FROM Employee;

Output Details

Schema Success:
All tables were created successfully with constraints enforced. Salary validation and unique department names worked as intended.

Referential Integrity:
When a department was deleted, the related employee records had their dept_id set to NULL due to ON DELETE SET NULL.

DML Results:
UPDATE and SELECT queries reflected correct and consistent data changes.

DCL Verification:
The reporting_staff role was successfully created and granted read-only access, while schema modification permissions were revoked.

DDL Results:
The Employee table was altered successfully, and the Project table was dropped without errors.

(Screenshots of execution results are attached separately.)

6. Learning Outcome

This practical session provided significant insights into:

Structural Logic: Understanding how constraints and foreign keys ensure data consistency.

Referential Actions: Learning the impact of ON DELETE SET NULL in relational databases.

Security Implementation: Managing database access using roles and privileges.

Practical Application: Applying SQL concepts to a real-world organizational data model.
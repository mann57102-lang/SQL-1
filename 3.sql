-- Create the EMPLOYEE table if it does not exist
CREATE TABLE IF NOT EXISTS EMPLOYEE (
    EMP_ID TEXT PRIMARY KEY,
    EMP_NAME TEXT NOT NULL,
    DEPARTMENT TEXT,
    PHONE TEXT,
    EXPERIENCE INTEGER
);

-- Insert sample data into the EMPLOYEE table
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, DEPARTMENT, PHONE, EXPERIENCE) VALUES
('E1', 'RAHUL', 'IT', '********', 2),
('E2', 'PRIYA', 'HR', '********', 2),
('E3', 'AMIT', 'SALES', '********', 5),
('E4', 'NEHA', 'IT', '********', 2),
('E5', 'KARAN', 'SALES', '********', 5),
('E6', 'ROHAN', 'HR', '********', 2);

-- Select all records from the EMPLOYEE table
SELECT * FROM EMPLOYEE;

-- Query employees who have 2 years of experience and work in IT
SELECT * FROM EMPLOYEE
WHERE EXPERIENCE = 2 AND DEPARTMENT = 'IT';

-- Query employees who have 2 years of experience and are named RAHUL
SELECT * FROM EMPLOYEE
WHERE EXPERIENCE = 2 AND EMP_NAME = 'RAHUL';

-- Query employees named RAHUL or AMIT
SELECT * FROM EMPLOYEE
WHERE EMP_NAME = 'RAHUL' OR EMP_NAME = 'AMIT';

-- Query employees named RAHUL or having 5 years of experience
SELECT * FROM EMPLOYEE
WHERE EMP_NAME = 'RAHUL' OR EXPERIENCE = 5;

-- Query employees with 2 years of experience and named RAHUL or PRIYA
SELECT * FROM EMPLOYEE
WHERE EXPERIENCE = 2
AND (EMP_NAME = 'RAHUL' OR EMP_NAME = 'PRIYA');

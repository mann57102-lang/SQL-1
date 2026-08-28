CREATE TABLE employee (
    EID TEXT PRIMARY KEY,
    ENAME TEXT,
    SALARY INTEGER,
    CITY TEXT
);

INSERT INTO employee (EID, ENAME, SALARY, CITY) VALUES
('E1', 'Rahul', 25000, 'Mumbai'),
('E2', 'Priya', 18000, 'Delhi'),
('E3', 'Aman', 32000, 'Pune'),
('E4', 'Sneha', 22000, 'Mumbai'),
('E5', 'Karan', 28000, 'Bangalore');

SELECT * FROM employee;

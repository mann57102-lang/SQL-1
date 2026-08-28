CREATE TABLE IF NOT EXISTS Employee (
    Employee_id TEXT PRIMARY KEY,
    Employee_name TEXT,
    city TEXT,
    Bonus REAL
);

INSERT INTO Employee (Employee_id, Employee_name, city, Bonus) VALUES
('E101', 'Rahul Sharma', 'Mumbai', 0.15),
('E102', 'Priya Mehta', 'Delhi', 0.13),
('E103', 'Aman Verma', 'Pune', 0.11),
('E104', 'Sneha Patel', 'Delhi', 0.14),
('E105', 'Karan Singh', 'Jaipur', 0.13),
('E106', 'Neha Kapoor', 'Bangalore', 0.12);

SELECT * FROM Employee;


CREATE TABLE IF NOT EXISTS Projects (
    project_no TEXT PRIMARY KEY,
    project_cost REAL,
    project_date TEXT,
    client_id TEXT,
    Employee_id TEXT
);

INSERT INTO Projects (project_no, project_cost, project_date, client_id, Employee_id) VALUES
('P001', 1500.5, '2024-10-05', 'C101', 'E102'),
('P002', 2700.65, '2024-09-10', 'C102', 'E101'),
('P003', 650.26, '2024-10-05', 'C103', 'E103'),
('P004', 1100.5, '2024-08-17', 'C104', 'E105'),
('P005', 9480.5, '2024-09-10', 'C101', 'E104'),
('P006', 24000.6, '2024-07-27', 'C105', 'E106');

SELECT * FROM Projects;


SELECT Employee_name, Bonus
FROM Employee;

CREATE TABLE IF NOT EXISTS Employee(
  Employee_id TEXT PRIMARY KEY,
  employee_name TEXT,
  city TEXT,
  Bonus TEXT
);

INSERT INTO Employee(Employee_id, employee_name, city, Bonus)
VALUES
  ("E101","Rahul Sharma","Mumbai","0.15"),
  ("E102","Priya Mehta","Delhi","0.13"),
  ("E105","Aman Verma","Pune","0.11"),
  ("E106","Sneha Patel","Delhi","0.14"),
  ("E107","Karan Singh","Jaipur","0.13"),
  ("E103","Neha Kapoor","Bangalore","0.12");


CREATE TABLE IF NOT EXISTS Client(
  client_id TEXT,
  client_name TEXT PRIMARY KEY,
  city TEXT,
  rating TEXT,
  Employee_id TEXT
);

INSERT INTO Client(client_id,client_name,city,rating,Employee_id)
VALUES
  ("C101","Arjun Mehta","Mumbai","100","E101"),
  ("C107","Riya Shah","Mumbai","200","E101"),
  ("C105","Vikram Rao","Delhi","200","E102"),
  ("C108","Ananya Das","London","300","E102"),
  ("C104","Rohit Jain","Delhi","300","E106"),
  ("C109","Mehul Shah","Berlin","100","E103"),
  ("C103","Ishita Roy","Jaipur","200","E107"),
  ("C111","Varun Kumar","Pune","","E105");


CREATE TABLE IF NOT EXISTS Purchase(
  purchase_no TEXT PRIMARY KEY,
  purchase_amt TEXT,
  purchase_date TEXT,
  client_id TEXT,
  Employee_id TEXT
);

INSERT INTO Purchase(purchase_no,purchase_amt,purchase_date,client_id,Employee_id)
VALUES
  ("P001","500.5","2024-10-05","C105","E102"),
  ("P009","870.65","2024-09-10","C101","E101"),
  ("P002","265.26","2024-10-05","C101","E103"),
  ("P004","410.5","2024-08-17","C109","E107"),
  ("P007","1948.5","2024-09-10","C105","E105"),
  ("P005","3200.6","2024-07-27","C107","E106");


-- Queries


-- Matching clients and employees by city
SELECT Client.client_name, Employee.employee_name, Employee.city
FROM Client
JOIN Employee ON Client.city = Employee.city;


-- Linking clients to their employees
SELECT Client.client_name, Employee.employee_name
FROM Client
JOIN Employee
ON Client.Employee_id = Employee.Employee_id;


-- Fetching purchases where client's city does not match employee's city
SELECT Purchase.purchase_no,
       Client.client_name,
       Purchase.client_id,
       Purchase.Employee_id
FROM Purchase
JOIN Client
ON Purchase.client_id = Client.client_id
JOIN Employee
ON Purchase.Employee_id = Employee.Employee_id
WHERE Client.city <> Employee.city;


-- Fetching all purchases with client names
SELECT Purchase.purchase_no, Client.client_name
FROM Purchase
JOIN Client
ON Purchase.client_id = Client.client_id;


-- Clients with ratings
SELECT Client.client_name AS "Client",
       Client.rating AS "Rating"
FROM Purchase
JOIN Employee
ON Purchase.Employee_id = Employee.Employee_id
JOIN Client
ON Purchase.client_id = Client.client_id
WHERE Client.rating IS NOT NULL;


-- Clients with employees where bonus is between 0.12 and 0.14
SELECT Client.client_name AS "Client",
       Client.city AS "City",
       Employee.employee_name AS "Employee",
       Employee.Bonus
FROM Client
JOIN Employee
ON Client.Employee_id = Employee.Employee_id
WHERE Employee.Bonus BETWEEN 0.12 AND 0.14;


-- Calculating bonuses for purchases where client rating is 200 or more
SELECT Purchase.purchase_no,
       Client.client_name,
       Employee.Bonus AS "Bonus%",
       Purchase.purchase_amt * Employee.Bonus AS "Bonus"
FROM Purchase
JOIN Employee
ON Purchase.Employee_id = Employee.Employee_id
JOIN Client
ON Purchase.client_id = Client.client_id
WHERE Client.rating >= 200;


-- Purchases on a specific date
SELECT *
FROM Client
JOIN Purchase
ON Client.client_id = Purchase.client_id
WHERE Purchase.purchase_date = '2024-10-05';

-- Create Hotel table
CREATE TABLE IF NOT EXISTS Hotel (
  name TEXT,
  location TEXT,
  category TEXT,
  rating REAL,
  cost TEXT,
  status TEXT
);

-- Insert data
INSERT INTO Hotel (name, location, category, rating, cost, status)
VALUES
  ('Royal Palace', 'Mumbai', 'Luxury', 4.6, '$$$$', 'Excellent'),
  ('City Inn', 'Delhi', 'Business', 3.5, '$$', 'Good'),
  ('Sea View', 'Mumbai', 'Resort', 4.1, '$$$', 'Average'),
  ('Green Stay', 'Pune', 'Budget', 3.8, '$', 'Good'),
  ('Grand Hotel', 'Bangalore', 'Luxury', 4.7, '$$$', ''),
  ('Lake Resort', 'Delhi', 'Resort', 3.2, '$$', ''),
  ('Sunrise Suites', 'Chennai', 'Luxury', 4.9, '$$$$', 'Average'),
  ('Comfort Inn', 'Mumbai', 'Business', 3.9, '$$', 'Good'),
  ('Park View', 'Chennai', 'Luxury', 4.0, '$$', 'Excellent');


-- 1) Distinct locations
SELECT DISTINCT location
FROM Hotel;


-- 2) Distinct hotel categories
SELECT DISTINCT category
FROM Hotel;


-- 3) Luxury hotel options
SELECT *
FROM Hotel
WHERE category = 'Luxury';


-- 4) Hotels with ratings 4 and above
SELECT *
FROM Hotel
WHERE rating >= 4.0;


-- 5) Luxury hotels with $$ to $$$
SELECT *
FROM Hotel
WHERE category = 'Luxury'
  AND cost IN ('$$', '$$$');


-- 6) Hotels with exactly $$$
SELECT *
FROM Hotel
WHERE cost = '$$$';


-- 7) Hotel name contains "View"
SELECT *
FROM Hotel
WHERE name LIKE '%View%';


-- 8) Hotels in Mumbai, Delhi, or Chennai
SELECT *
FROM Hotel
WHERE location IN ('Mumbai', 'Delhi', 'Chennai');


-- 9) Hotels with status pending (empty value)
SELECT *
FROM Hotel
WHERE status = '' OR status IS NULL;


-- 10) Top 4 hotels based on ratings
SELECT *
FROM Hotel
ORDER BY rating DESC
LIMIT 4;

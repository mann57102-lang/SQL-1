-- ============================================================
-- SQL Sorting & Filtering
-- Activity: Movie Explorer
-- ============================================================

-- ---- PART 1: Build and Explore the Table ----

CREATE TABLE IF NOT EXISTS movie (
    movie_id   INTEGER PRIMARY KEY,
    movie_name TEXT    NOT NULL,
    category   TEXT    NOT NULL,
    rating     REAL    NOT NULL,
    duration   INTEGER NOT NULL,
    rel_year   INTEGER NOT NULL
);

INSERT INTO movie VALUES (1, 'Sky Warriors',   'Action',   8.8, 135, 2021);
INSERT INTO movie VALUES (2, 'Future World',   'Sci-Fi',   8.2, 128, 2020);
INSERT INTO movie VALUES (3, 'Lost Island',    'Adventure',7.5, 115, 2022);
INSERT INTO movie VALUES (4, 'Dark Mission',   'Action',   9.1, 142, 2019);
INSERT INTO movie VALUES (5, 'Space Journey',  'Sci-Fi',   8.7, 130, 2023);
INSERT INTO movie VALUES (6, 'Ocean Mystery',  'Adventure',7.9, 110, 2021);
INSERT INTO movie VALUES (7, 'Hero Returns',   'Action',   9.3, 150, 2022);
INSERT INTO movie VALUES (8, 'Galaxy Quest',   'Sci-Fi',   8.9, 138, 2020);

SELECT * FROM movie;


-- ---- PART 2: ORDER BY ----

-- Sort all movies from lowest rating to highest rating
SELECT movie_name, rating
FROM movie
ORDER BY rating ASC;

-- Sort all movies from highest rating to lowest rating
SELECT movie_name, rating
FROM movie
ORDER BY rating DESC;

-- Sort by category A–Z, then highest rating first within each category
SELECT movie_name, category, rating
FROM movie
ORDER BY category ASC, rating DESC;


-- ---- PART 3: LIMIT ----

-- Top 3 highest-rated movies
SELECT movie_name, rating
FROM movie
ORDER BY rating DESC
LIMIT 3;

-- 5 oldest movies by release year
SELECT movie_name, rel_year
FROM movie
ORDER BY rel_year ASC
LIMIT 5;


-- ---- PART 4: GROUP BY ----

-- How many movies are in each category?
SELECT category, COUNT(*) AS movie_count
FROM movie
GROUP BY category;

-- Total duration and average rating per category
SELECT category,
       SUM(duration) AS total_duration,
       AVG(rating) AS avg_rating
FROM movie
GROUP BY category;


-- ---- PART 5: HAVING ----

-- Categories that have more than 2 movies
SELECT category, COUNT(*) AS movie_count
FROM movie
GROUP BY category
HAVING COUNT(*) > 2;

-- Categories where the average rating is at least 8.5
SELECT category, AVG(rating) AS avg_rating
FROM movie
GROUP BY category
HAVING AVG(rating) >= 8.5;

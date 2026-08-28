-- ============================================================
-- SQL Aggregate Functions
-- Activity: Library Explorer
-- ============================================================

-- ---- PART 1: Build and Explore the Table ----

CREATE TABLE IF NOT EXISTS library_book (
    book_id       INTEGER PRIMARY KEY,
    title         TEXT    NOT NULL,
    category      TEXT    NOT NULL,
    pages         INTEGER NOT NULL,
    price         REAL    NOT NULL
);

INSERT INTO library_book VALUES (1, 'Python Basics',       'Programming', 250, 450.0);
INSERT INTO library_book VALUES (2, 'Java Fundamentals',   'Programming', 320, 600.0);
INSERT INTO library_book VALUES (3, 'World History',       'History',     500, 750.0);
INSERT INTO library_book VALUES (4, 'Indian History',      'History',     400, 550.0);
INSERT INTO library_book VALUES (5, 'English Grammar',     'Language',    220, 300.0);
INSERT INTO library_book VALUES (6, 'Web Development',     'Programming', 350, 700.0);
INSERT INTO library_book VALUES (7, 'Physics Basics',      'Science',     280, 500.0);
INSERT INTO library_book VALUES (8, 'Chemistry Basics',    'Science',     310, 650.0);

SELECT * FROM library_book;


-- ---- PART 2: SELECT DISTINCT ----

-- All category values including duplicates
SELECT category FROM library_book;

-- Only unique categories
SELECT DISTINCT category FROM library_book;

-- Count how many unique categories
SELECT COUNT(DISTINCT category) AS unique_categories
FROM library_book;


-- ---- PART 3: COUNT ----

-- Total number of books
SELECT COUNT(book_id) AS total_books
FROM library_book;

-- Books having more than 300 pages
SELECT COUNT(book_id) AS books_over_300_pages
FROM library_book
WHERE pages > 300;


-- ---- PART 4: SUM and AVG ----

-- Total pages of all books
SELECT SUM(pages) AS total_pages
FROM library_book;

-- Average price of all books
SELECT AVG(price) AS average_price
FROM library_book;


-- ---- PART 5: Combining Aggregate Functions ----

SELECT
    COUNT(book_id)        AS total_books,
    COUNT(DISTINCT category) AS unique_categories,
    SUM(pages)            AS total_pages,
    AVG(price)            AS average_price
FROM library_book;

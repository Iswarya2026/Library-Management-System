
-- PROJECT: LIBRARY MANAGEMENT SYSTEM
-- DATABASE: library_management

CREATE DATABASE IF NOT EXISTS library_management;
USE library_management;

-- 1. STUDENTS TABLE

CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    email VARCHAR(100)
);

-- 2. BOOKS TABLE

CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    category VARCHAR(50),
    quantity INT
);

-- 3. ISSUE RECORDS TABLE

CREATE TABLE IF NOT EXISTS issue_records (
    issue_id INT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- INSERT STUDENT DETAILS

INSERT IGNORE INTO students VALUES
(1, 'Ananya', 'CSE', 'ananya@gmail.com'),
(2, 'Rahul', 'ECE', 'rahul@gmail.com'),
(3, 'Priya', 'IT', 'priya@gmail.com'),
(4, 'Arjun', 'CSE', 'arjun@gmail.com'),
(5, 'Sneha', 'EEE', 'sneha@gmail.com');

-- INSERT BOOK DETAILS

INSERT IGNORE INTO books VALUES
(101, 'Python Programming', 'John Smith', 'Programming', 10),
(102, 'Database Systems', 'Ramakrishnan', 'Database', 8),
(103, 'Java Programming', 'Herbert Schildt', 'Programming', 6),
(104, 'Artificial Intelligence', 'Stuart Russell', 'AI', 5),
(105, 'Computer Networks', 'Andrew Tanenbaum', 'Networking', 7);

-- INSERT ISSUE DETAILS

INSERT IGNORE INTO issue_records VALUES
(1, 1, 101, '2026-10-20', NULL, 'Issued'),
(2, 2, 102, '2026-10-21', '2026-10-25', 'Returned'),
(3, 3, 103, '2026-10-22', NULL, 'Issued'),
(4, 4, 104, '2026-10-23', NULL, 'Issued'),
(5, 5, 105, '2026-10-24', '2026-10-28', 'Returned');

-- SQL QUERIES

-- 1. Display all students
SELECT * FROM students;

-- 2. Display all books
SELECT * FROM books;

-- 3. Display all issue records
SELECT * FROM issue_records;

-- 4. Display CSE students
SELECT * FROM students
WHERE department = 'CSE';

-- 5. Display programming books
SELECT * FROM books
WHERE category = 'Programming';

-- 6. Display available books
SELECT * FROM books
WHERE quantity > 0;

-- 7. Count total students
SELECT COUNT(*) AS total_students
FROM students;

-- 8. Count total books
SELECT COUNT(*) AS total_books
FROM books;

-- 9. Display issued books
SELECT * FROM issue_records
WHERE status = 'Issued';

-- 10. Display returned books
SELECT * FROM issue_records
WHERE status = 'Returned';

-- 11. Display student and book details
SELECT s.student_name, b.book_name
FROM students s
JOIN issue_records i ON s.student_id = i.student_id
JOIN books b ON i.book_id = b.book_id;

-- 12. Display issue dates
SELECT student_id, book_id, issue_date
FROM issue_records;

-- 13. Count books by category
SELECT category, COUNT(*) AS total_books
FROM books
GROUP BY category;

-- 14. Display student departments
SELECT student_name, department
FROM students;

-- 15. Complete issue report
SELECT
    i.issue_id,
    s.student_name,
    b.book_name,
    i.issue_date,
    i.return_date,
    i.status
FROM issue_records i
JOIN students s ON i.student_id = s.student_id
JOIN books b ON i.book_id = b.book_id;

-- END OF PROJECT


SHOW TABLES;

SELECT * FROM students;
SELECT * FROM books;
SELECT * FROM issue_records;

-- Create the database
CREATE DATABASE library_ms;
GO



-- Create the users table
CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(100),
    contact VARCHAR(20)
);
GO

-- Create the book_details table
CREATE TABLE book_details (
    book_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    book_name VARCHAR(250),
    author VARCHAR(100),
    quantity INT
);
GO

-- Create the student_details table
CREATE TABLE student_details (
    student_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100),
    course VARCHAR(100),
    branch VARCHAR(100)
);
GO

-- Create the issue_book_details table
CREATE TABLE issue_book_details (
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    book_id INT NOT NULL,
    book_name VARCHAR(150),
    student_id INT NOT NULL,
    student_name VARCHAR(50),
    issue_date DATE,
    due_date DATE,
    status VARCHAR(20),
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES book_details(book_id),
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES student_details(student_id)
);
GO

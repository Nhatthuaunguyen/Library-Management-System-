-- Create the database
CREATE DATABASE new_lib;
GO

Use new_lib;

-- Create the author table
CREATE TABLE Author (
    Author_id INT PRIMARY KEY NOT NULL,
    Author_name VARCHAR(50)
);
GO

-- Create the book table
CREATE TABLE Book (
    Book_id INT PRIMARY KEY NOT NULL,
    Title VARCHAR(250),
	ISBN varchar(250),
    total_pages varchar(100),
	Manage_id INT,
	CONSTRAINT fk_Manage_Book FOREIGN KEY (Manage_id) REFERENCES Manage(Manage_id)
);
GO

-- Create written table
CREATE TABLE Written (
	Written_id INT PRIMARY KEY NOT NULL,
    Book_id INT NOT NULL,
    Author_id INT NOT NULL,
	Publish_date DATE,
    CONSTRAINT fk_Book_Written FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
	CONSTRAINT fk_Author_Written FOREIGN KEY (Author_id) REFERENCES Author(Author_id)
);
GO


-- Create the student table
CREATE TABLE Student (
    Student_id INT PRIMARY KEY NOT NULL,
    Student_name VARCHAR(100),
    Course VARCHAR(100),
    Branch VARCHAR(100)
);
GO

CREATE TABLE Staff (
    Staff_id INT PRIMARY KEY NOT NULL,
    Staff_name VARCHAR(100),
    Email VARCHAR(100),
    Contact VARCHAR(100)
);
GO

-- Create the borrowing table
CREATE TABLE Borrowing (
    Borrow_id INT PRIMARY KEY NOT NULL,
    Book_id INT NOT NULL,
    Student_id INT NOT NULL,
    Staff_id INT NOT NULL,
    Borrow_date DATE,
    Due_date DATE,
    Status VARCHAR(20),
    CONSTRAINT fk_Book_Borrowing FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
    CONSTRAINT fk_Student_Borrowing FOREIGN KEY (Student_id) REFERENCES Student(Student_id),
	CONSTRAINT fk_Staff_Borrowing FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);
GO

-- Create the manage table
CREATE TABLE Manage (
    Staff_id INT NOT NULL,
	Manage_id INT PRIMARY KEY NOT NULL,
    Import_date DATE,
    Quantity int,
	CONSTRAINT fk_Staff_Manage FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);
GO



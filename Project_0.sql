CREATE TABLE Borrower_Records (
    UserID INT PRIMARY KEY IDENTITY(1, 1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ContactInfo VARCHAR(50),
    Address VARCHAR(50)
);

CREATE TABLE Transaction_History (
    TransactionID INT PRIMARY KEY IDENTITY(1, 1),
    UserID INT,
    TransactionDate DATETIME,
    ReturnDate DATETIME,
    Cost DECIMAL(10, 2),
    BookID INT,
    FOREIGN KEY (UserID) REFERENCES Borrower_Records(UserID),
    FOREIGN KEY (BookID) REFERENCES Book_Management(BookID)
);

CREATE TABLE Book_Management (
    BookID INT PRIMARY KEY IDENTITY(1, 1),
    BookTitle VARCHAR(50) NOT NULL,
    ISBN VARCHAR(20),
    Author VARCHAR(50),
    Genre VARCHAR(50),
    TotalCopies INT,
    YearPublished DATE
);

-- Inserting data into Borrower_Records
INSERT INTO Borrower_Records (FirstName, LastName, ContactInfo, Address)
VALUES
	('John', 'Doe', 'john.doe@email.com', '123 Main St'),
	('Alice', 'Smith', 'alice.smith@email.com', '456 Oak Ave'),
	('Bob', 'Johnson', 'bob.johnson@email.com', '789 Pine Rd'),
	('Eva', 'Williams', 'eva.williams@email.com', '101 Cedar Ln'),
	('Michael', 'Jones', 'michael.jones@email.com', '202 Elm Blvd'),
	('Mary', 'Johnson', 'mary.johnson@email.com', '456 Oak St'),
	('Robert', 'Smith', 'robert.smith@email.com', '789 Maple Ave'),
	('Christopher', 'Miller', 'chris.miller@email.com', '202 Cedar Ln'),
	('Olivia', 'Jones', 'olivia.jones@email.com', '303 Elm Blvd'),
	('Daniel', 'Davis', 'daniel.davis@email.com', '404 Birch St'),
	('Ava', 'Whites', 'ava.whites@email.com', '707 Pine Rd'),
	('Ethan', 'Martin', 'ethan.martin@email.com', '808 Cedar Ln');

-- Inserting data into Transaction_History (including BookID)
INSERT INTO Transaction_History (UserID, TransactionDate, ReturnDate, Cost, BookID)
VALUES
	(2, '2023-01-15', '2023-02-15', 25.00, 26), --The Last digit are the BookID's [The first is UserID]
	(4, '2022-07-15', '2022-08-15', 15.00, 33),
	(5, '2022-12-10', '2023-01-10', 20.50, 31),
	(9, '2022-04-19', '2022-05-19', 23.75, 31),
	(3, '2023-03-05', '2023-04-05', 15.50, 31),
	(7, '2023-01-10', '2023-02-10', 18.00, 35),
	(10, '2023-01-10', '2023-02-10', 25.00, 36),
	(9, '2023-02-15', '2023-03-15', 18.00, 30),
	(11, '2023-03-25', '2023-04-25', 28.50, 37),
	(13, '2023-01-05', '2023-02-05', 21.00, 37),
	(12, '2023-04-01', '2023-05-01', 16.75, 33),
	(6, '2023-02-28', '2023-03-28', 23.25, 28);
	-- Come back and edit it to have some usual customers / edit as needed after executing borrower_records

-- Inserting data into Book_Management
INSERT INTO Book_Management (BookTitle, ISBN, Author, Genre, TotalCopies, YearPublished)
VALUES
	('Harry Potter and the Sorcerer''s Stone', '97807475032696', 'J. K. Rowling', 'Fantasy Literature', 3, '1997-01-01'),
	('To Kill a Mockingbird', '9783498038083', 'Harper Lee', 'Fiction', 150, '1960-07-11'),
	('1984', '3456789012', 'George Orwell', 'Dystopian', 120, '1949-06-08'),
	('The Lord of the Rings', '4445556677', 'J.R.R. Tolkien', 'Fantasy', 120, '1954-07-29'),
	('Sapiens: A Brief History of Humankind', '7890123456', 'Yuval Noah Harari', 'History', 75, '1967-05-30'),
	('The Alchemist', '4567890123', 'Paulo Coelho', 'Fiction', 85, '1988-01-01'),
	('The Hobbit', '1234567890', ' J.J.R. Tolkien', 'Fantasy', 100, '1937-09-21'),
	('Holly', '678902345', 'Stephen King', 'Horror Fiction', 60, '2023-09-05'),
	('The Catcher In The Rye', '1112223334', 'J.D. Salinger', 'Fiction', 90, '1951-07-16'),
	('Pride and Prejudice', '7778889990', 'Jane Austen', 'Romance', 80, '1813-01-28'),
	('The Shining', '3456789012', 'Stephen King', 'Horror', 95, '1977-01-28'),
	('The Da Vinvi Code', '2345678901', 'Dan Brown', 'Mystery', 110, '2003-03-18');


SELECT * FROM Borrower_Records
SELECT * FROM Transaction_History
SELECT * FROM Book_Management

-----------------------DELETE TABLES (Please be careful)
--DELETE Borrower_Records
--DELETE Transaction_History
--DELETE Book_Management

----------------------- STORE PROCEDURES
CREATE PROCEDURE InsertBorrowerRecord
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@ContactInfo VARCHAR(50),
	@Address VARCHAR(50)
AS
BEGIN
	INSERT INTO Borrower_Records (FirstName, LastName, ContactInfo, Address)
	VALUES (@FirstName, @LastName, @ContactInfo, @Address);
END;

-- Executing the store procedure
EXEC InsertBorrowerRecord
	@FirstName = 'Abbey',
	@LastName = 'Vega',
	@ContactInfo = 'abbey.vega@email.com',
	@Address = '838 Mapel Road';

CREATE PROCEDURE InsertTransactionHistory
	@UserID INT,
	@TransactionDate DATETIME,
	@ReturnDate DATETIME,
	@Cost DECIMAL(10, 2),
	@BookID INT
AS
BEGIN
	INSERT INTO Transaction_History (UserID, TransactionDate, ReturnDate, Cost, BookID)
	VALUES (@UserID, @TransactionDate, @ReturnDate, @Cost, @BookID);
END;

CREATE PROCEDURE InsertBookManagement
	@BookTitle VARCHAR(50),
	@ISBN VARCHAR(20),
	@Author VARCHAR(50),
	@Genre VARCHAR(50),
	@TotalCopies INT,
	@YearPublished DATE
AS
BEGIN
	INSERT INTO Book_Management (BookTitle, ISBN, Author, Genre, TotalCopies, YearPublished)
	VALUES (@BookTitle, @ISBN, @Author, @Genre, @TotalCopies, @YearPublished);
END;

------Updated Procedures
CREATE PROCEDURE UpdatedBorrowerRecord
	@UserID INT,
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@ContactInfo VARCHAR(50),
	@Address VARCHAR(50)
AS
BEGIN
	UPDATE Borrower_Records
	SET
		FirstName = @FirstName,
		LastName = @LastName,
		ContactInfo = @ContactInfo,
		Address = @Address
	WHERE UserID = @UserID;
END;

CREATE PROCEDURE UpdatedTransactionHistory
	@TransactionID INT,
	@UserID INT,
	@TransactionDate DATETIME,
	@ReturnDate DATETIME,
	@Cost DECIMAL(10, 2),
	@BookID INT
AS BEGIN
	UPDATE Transaction_History
	SET
		UserID = @UserID,
		TransactionDate = @TransactionDate,
		ReturnDate = @ReturnDate,
		Cost = @Cost,
		BookID = @BookID
	WHERE TransactionID = @TransactionID;
END;

CREATE PROCEDURE UpdateBookManagement
    @BookID INT,
    @BookTitle VARCHAR(50),
    @ISBN VARCHAR(20),
    @Author VARCHAR(50),
    @Genre VARCHAR(50),
    @TotalCopies INT,
    @YearPublished DATE
AS
BEGIN
    UPDATE Book_Management
    SET
        BookTitle = @BookTitle,
        ISBN = @ISBN,
        Author = @Author,
        Genre = @Genre,
        TotalCopies = @TotalCopies,
        YearPublished = @YearPublished
    WHERE BookID = @BookID;
END;


------------------------DELETE Stored Procedures (Please be careful)
--CREATE PROCEDURE DeleteBorrowerRecord
--	@UserID INT
--AS
--BEGIN
--	DELETE FROM Borrower_Records
--	WHERE UsedID = @UserID;
--END;

--CREATE PROCEDURE DeleteTransactionHistory
--	@TransactionID INT
--AS
--BEGIN
--	DELETE FROM Transaction_History
--	WHERE TransactionID = @TransactionID;
--END

--CREATE PROCEDURE DeleteBookManagement
--	@BookID INT
--AS
--BEGIN
--	DELETE FROM Book_Management
--	WHERE BookID = @BookID;
--END;
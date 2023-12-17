# Library-Management-System

## Overview
This document outlines the database design for a Library Management System. The system is designed to manage information related to borrowers, transaction history, and book management.

## Tables
1. Borrower_Records
- UserID (Primary Key): Unique identifier for each borrower.
- FirstName: First name of the borrower.
- LastName: Last name of the borrower.
- ContactInfo: Contact information of the borrower.
- Address: Address of the borrower.
  
2. Transaction_History
TransactionID (Primary Key): Unique identifier for each transaction.
UserID (Foreign Key): References the UserID in Borrower_Records.
TransactionDate: Date of the transaction.
ReturnDate: Date when the borrowed item is expected to be returned.
Cost: Cost associated with the transaction.
BookID (Foreign Key): References the BookID in Book_Management.

4. Book_Management
BookID (Primary Key): Unique identifier for each book.
BookTitle: Title of the book.
ISBN: International Standard Book Number.
Author: Author of the book.
Genre: Genre of the book.
TotalCopies: Total copies available in the library.
YearPublished: Year when the book was published.

## Stored Procedures
1. InsertBorrowerRecord
Parameters:
@FirstName (VARCHAR)
@LastName (VARCHAR)
@ContactInfo (VARCHAR)
@Address (VARCHAR)
Functionality:
Inserts a new borrower record into the Borrower_Records table.

2. InsertTransactionHistory
Parameters:
@UserID (INT)
@TransactionDate (DATETIME)
@ReturnDate (DATETIME)
@Cost (DECIMAL)
@BookID (INT)
Functionality:
Inserts a new transaction record into the Transaction_History table.

3. InsertBookManagement
Parameters:
@BookTitle (VARCHAR)
@ISBN (VARCHAR)
@Author (VARCHAR)
@Genre (VARCHAR)
@TotalCopies (INT)
@YearPublished (DATE)
Functionality:
Inserts a new book record into the Book_Management table.

## Conclusion
The database is structured to support the Library Management System efficiently. The tables capture essential information about borrowers, book transactions, and book details. The stored procedures provide a convenient way to interact with the database, allowing for the insertion of new records.

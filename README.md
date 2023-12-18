# Library-Management-System

## Overview
The Library Management System document is designed to handle information such as Borrower_Records to record different users, Transaction_History to record transactions done with the customers, and Book_Management to handle what books are currently in the library. 

## Tables
1. Borrower_Records
- UserID (Primary Key): Unique identifier for each customer.
- FirstName: First name of the customer.
- LastName: Last name of the customer.
- ContactInfo: Contact information of the customer.
- Address: Address of the customer.
  
2. Transaction_History
- TransactionID (Primary Key): Unique identifier for each transaction with the customer and their book.
- UserID (Foreign Key): References the UserID in Borrower_Records.
- TransactionDate: Date of the transaction.
- ReturnDate: Date when the borrowed item is expected to be returned.
- Cost: Cost associated with the transaction.
- BookID (Foreign Key): References the BookID in Book_Management.

4. Book_Management
- BookID (Primary Key): Unique identifier for each book.
- BookTitle: Title of the book.
- ISBN: International Standard Book Number.
- Author: Author of the book.
- Genre: Genre of the book.
- TotalCopies: Total copies available in the library.
- YearPublished: Year when the book was published.

## Stored Procedures
1. InsertBorrowerRecord
Parameters:
- @FirstName (VARCHAR)
- @LastName (VARCHAR)
- @ContactInfo (VARCHAR)
- @Address (VARCHAR)

Functionality:
Inserts a new borrower record into the Borrower_Records table.

2. InsertTransactionHistory
Parameters:
- @UserID (INT)
- @TransactionDate (DATETIME)
- @ReturnDate (DATETIME)
- @Cost (DECIMAL)
- @BookID (INT)

Functionality:
Inserts a new transaction record into the Transaction_History table.

3. InsertBookManagement
Parameters:
- @BookTitle (VARCHAR)
- @ISBN (VARCHAR)
- @Author (VARCHAR)
- @Genre (VARCHAR)
- @TotalCopies (INT)
- @YearPublished (DATE)

Functionality:
Inserts a new book record into the Book_Management table.

## Conclusion
The database seen here is what provides the most effective support for the Library Management System. The tables are used to keep track of who is borrowing the books, their transaction, and the specifics of the books being borrowed. By adding new entries from the database, stored procedures provide another means to interact with the database.

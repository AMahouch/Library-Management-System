DROP TABLE IF EXISTS BOOK_AUTHORS;
DROP TABLE IF EXISTS BOOK_COPIES;
DROP TABLE IF EXISTS BOOK_LOANS;
DROP TABLE IF EXISTS BOOK;
DROP TABLE IF EXISTS PUBLISHER;
DROP TABLE IF EXISTS LIBRARY_BRANCH;
DROP TABLE IF EXISTS BORROWER;

CREATE TABLE BOOK (
  Book_Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Title VARCHAR(60) NOT NULL,
  Publisher_name VARCHAR(30),
  FOREIGN KEY (Publisher_name) REFERENCES PUBLISHER(Publisher_Name)
);

CREATE TABLE BOOK_AUTHORS (
  Book_Id INT NOT NULL,
  Author_Name VARCHAR(30) NOT NULL,
  PRIMARY KEY (Book_Id,Author_Name),
  FOREIGN KEY (Book_Id) REFERENCES BOOK(Book_id)
);

CREATE TABLE PUBLISHER (
  Publisher_Name VARCHAR(30) PRIMARY KEY,
  Phone VARCHAR(12) NOT NULL,
  Address VARCHAR(60) NOT NULL
);

CREATE TABLE BOOK_COPIES (
  Book_Id INT NOT NULL,
  Branch_Id INT NOT NULL,
  No_Of_Copies INT NOT NULL,
  PRIMARY KEY (Book_id, Branch_id),
  FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id),
  FOREIGN KEY (Branch_id) REFERENCES LIBRARY_BRANCH(Branch_Id)
);
CREATE TABLE BOOK_LOANS (
  Book_Id INT NOT NULL,
  Branch_Id INT NOT NULL,
  Card_No INT NOT NULL,
  Date_out DATE NOT NULL,
  Due_date DATE NOT NULL,
  Returned_date DATE DEFAULT NULL,
  PRIMARY KEY (Book_Id,Branch_Id,Card_No),
  FOREIGN KEY (Branch_Id) REFERENCES LIBRARY_BRANCH(Branch_Id),
  FOREIGN KEY (Card_No) REFERENCES BORROWER(Card_No),
  FOREIGN KEY (Book_Id) REFERENCES BOOK(Book_Id)
);

CREATE TABLE LIBRARY_BRANCH (
  Branch_Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Branch_Name VARCHAR(30) NOT NULL,
  Address VARCHAR(60) NOT NULL
);

CREATE TABLE BORROWER (
  Card_No INTEGER PRIMARY KEY AUTOINCREMENT,
  Name VARCHAR(30) NOT NULL,
  Address VARCHAR(60) NOT NULL,
  Phone VARCHAR(10) NOT NULL
);

-- create database

Create database libraryManagementSystem;

-- ativando banco
use libraryManagementSystem;

-- tabela publisher

create table tbl_publisher (
	pk_publisherID int primary key auto_increment,
    publisherName varchar(255) not null,
    publisherAdress varchar(255) not null,
    publisherPhone varchar(255) not null
);


-- tabela book authors


create table tbl_book_authors (

	pk_book_authors_AuthorID int primary key auto_increment,
    book_authors_AuthorName varchar(255) not null,
    fk_book_authors_BookID int not null
);



-- tabela book

create table tbl_book (
	pk_bookID int primary key auto_increment,
    bookTitle varchar(255) not null,
    fk_publisherID int not null,
    fk_authorID int not null,
    
    foreign key (fk_publisherID) references tbl_publisher (pk_publisherID),
	foreign key (fk_authorID) references tbl_book_authors (	pk_book_authors_AuthorID)
);


-- tabela livrarias branch

create table tbl_library_branch (
	pk_libraryBranchID int primary key auto_increment,
    libraryBranchName varchar(255) not null,
    libraryBranchAddress varchar(255) not null

);

-- tabela copias de livros

create table tbl_book_copies (
	pk_bookCopiesID int primary key auto_increment,
    fk_bookCopies_BookID int not null,
    fk_bookCopies_BranchID int not null,
    bookCopies_No_Of_Copies int not null,
    
    foreign key (fk_bookCopies_BookID) references tbl_book (pk_bookID),
    foreign key (fk_bookCopies_BranchID) references tbl_library_branch (pk_libraryBranchID)

);

-- tabela borrower

create table tbl_borrower (
	pk_borrower_CardNo int primary key auto_increment,
    borrowerName varchar(255) not null,
	borrowerAddress varchar(255) not null,
    borrowerPhone varchar(255) not null
);


-- tabela book loans
create table tbl_book_loans (
	book_LoansID int primary key auto_increment,
	fk_BookID int not null,
	fk_BranchID int not null,
	fk_CardNo int not null,
	book_loans_DateOut date,
	book_loans_DueDate date,

 foreign key (fk_BookID) references tbl_book (pk_bookID),
 foreign key (fk_BranchID) references tbl_library_branch (pk_libraryBranchID),
 foreign key (fk_CardNo) references tbl_borrower (pk_borrower_CardNo)
);










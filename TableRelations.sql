-- 1ST TASK
CREATE TABLE [Persons](
	[PersonID] INT IDENTITY NOT NULL,
	[FirstName] NVARCHAR(50),
	[Salary] DECIMAL,
	[PassportID] INT
)

INSERT INTO [Persons] VALUES
	('Roberto', 43300.00, 102),
	('Tom', 56100.00, 103),
	('Yana', 60200.00, 101)

ALTER TABLE [Persons] ADD CONSTRAINT PK_PersonID PRIMARY KEY (PersonID)

CREATE TABLE [Passports](
	[PassportID] INT PRIMARY KEY NOT NULL,
	[PassportNumber] NVARCHAR(30)
)

INSERT INTO [Passports] VALUES 
	(101, 'N34FG21B'),
	(102, 'K65LO4R7'),
	(103, 'ZE657QP2')

ALTER TABLE [Persons] ADD CONSTRAINT FK_Persons_Passports FOREIGN KEY (PassportID) REFERENCES [Passports](PassportID)



--2ND TASK

CREATE TABLE [Models](
	[ModelID] INT,
	[Name] NVARCHAR(10),
	[ManufacturerID] INT
)

CREATE TABLE [Manufacturers](
	[ManufacturerID] INT IDENTITY,
	[Name] NVARCHAR(10),
	[EstablishedOn] NVARCHAR(15)
)

INSERT INTO [Models] VALUES
	(101, 'X1', 1),
	(102, 'i6', 1),
	(103, 'Model S', 2),
	(104, 'Model X', 2),
	(105, 'Model 3', 2),
	(106, 'Nova', 3)

INSERT INTO [Manufacturers] VALUES 
	('BMW', '07/03/1916'),
	('Tesla', '01/01/2003'),
	('Lada', '01/05/1966')

ALTER TABLE [Models] ALTER COLUMN [ModelID] INT NOT NULL
ALTER TABLE [Models] ADD CONSTRAINT PK_ModelID PRIMARY KEY (ModelID)

ALTER TABLE [Manufacturers] ALTER COLUMN [ManufacturerID] INT NOT NULL
ALTER TABLE [Manufacturers] ADD CONSTRAINT PK_ManufacturerId PRIMARY KEY (ManufacturerID)

ALTER TABLE [Models] ADD CONSTRAINT FK_Models_Manufacturers FOREIGN KEY ([ManufacturerID]) REFERENCES Manufacturers(ManufacturerID)

--3RD TASK

CREATE TABLE [Students] (
	[StudentID] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(20)
)

CREATE TABLE [Exams](
	[ExamID] INT PRIMARY KEY,
	[Name] NVARCHAR(30)
)


CREATE TABLE [StudentsExams](
	[StudentID] INT ,
	[ExamID] INT 
)

ALTER TABLE [StudentsExams] ALTER COLUMN [StudentID] INT NOT NULL;
ALTER TABLE [StudentsExams] ALTER COLUMN [ExamID] INT NOT NULL;

--ALTER TABLE [StudentsExams] DROP CONSTRAINT [PK_StudentID]
ALTER TABLE [StudentsExams] ADD CONSTRAINT PK_StudentID PRIMARY KEY (StudentID, ExamID)

INSERT INTO [Students] VALUES 
	('Mila'),
	('Toni'),
	('Ron')

INSERT INTO [Exams] VALUES
	(101, 'SpringMVC'),
	(102, 'Neo4j'),
	(103, 'Oracle 11g')

INSERT INTO [StudentsExams] VALUES
	(1, 101),
	(1, 102),
	(2, 101),
	(3, 103),
	(2, 102),
	(2, 103)

ALTER TABLE [StudentsExams] ADD CONSTRAINT FK_StudentExams_Students FOREIGN KEY ([StudentID]) REFERENCES Students([StudentID])
ALTER TABLE [StudentsExams] ADD CONSTRAINT FK_StudentExams_Exams FOREIGN KEY ([ExamID]) REFERENCES Exams([ExamID])

--4TH TASK

CREATE TABLE [Teachers](
	[TeacherID] INT NOT NULL,
	[Name] NVARCHAR(50),
	[ManagerID] INT
)

ALTER TABLE [Teachers] ADD CONSTRAINT CK_Teachers PRIMARY KEY ([TeacherID])
ALTER TABLE [Teachers] ADD CONSTRAINT FK_ManagerID FOREIGN KEY (ManagerID) REFERENCES [Teachers](TeacherID)



--5TH TASK

CREATE DATABASE [Online Store Database]


CREATE TABLE [Cities](
	[CityID] INT PRIMARY KEY NOT NULL,
	[Name] VARCHAR(50)
)

INSERT INTO [Cities] VALUES 
	(1, 'Sofia'),
	(2, 'Ruse'),
	(3, 'Varna'),
	(4, 'Burgas')

CREATE TABLE [Customers](
	[CustomerID] INT PRIMARY KEY NOT NULL,
	[Name] VARCHAR(50),
	[Birthday] DATE,
	[CityID] INT NOT NULL
)

INSERT INTO [Customers] VALUES 
	(1, 'Ivan', '2004-12-20', 1),
	(2, 'Kristiyan', '1997-12-14', 2),
	(3, 'Mario', '1998-10-12', 1),
	(4, 'Nikolay', '1994-09-25', 2)
	
ALTER TABLE [Customers] ADD CONSTRAINT FK_Customers_Cities FOREIGN KEY (CityID) REFERENCES [Cities](CityID)

CREATE TABLE [Orders](
	[OrderID] INT PRIMARY KEY NOT NULL,
	[CustomerID] INT NOT NULL
)

INSERT INTO [Orders] VALUES 
	(101, 1),
	(102, 2),
	(103, 3),
	(104, 4),
	(105, 1),
	(106, 2),
	(107, 3)

ALTER TABLE [Orders] ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)

CREATE TABLE [OrderItems](
	[OrderID] int NOT NULL,
	[ItemID] INT NOT NULL
)

ALTER TABLE [OrderItems] ADD CONSTRAINT CPK_OrderItems PRIMARY KEY ([OrderID], [ItemID])
ALTER TABLE [OrderItems] ADD CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
ALTER TABLE [OrderItems] ADD CONSTRAINT FK_OrderItems_Items FOREIGN KEY (ItemID) REFERENCES Items(ItemID)

INSERT INTO [OrderItems] VALUES 
	(101,1),
	(102,1),
	(101,2),
	(102,2),
	(103,3)

CREATE TABLE [Items](
	[ItemID] INT PRIMARY KEY NOT NULL,
	[Name] VARCHAR(50),
	[ItemTypeID] INT
)

insert into [Items] VALUES
	(1, 'Bottle', 1001),
	(2, 'Water', 1002),
	(3, 'Fries', 1003)

insert into [Items] VALUES
	(4, 'Bread', 1001)

ALTER TABLE [Items] ADD CONSTRAINT FK_Items_ItemTypes FOREIGN KEY (ItemTypeID) REFERENCES [ItemTypes](ItemTypeID)

CREATE TABLE [ItemTypes](
	[ItemTypeID] INT PRIMARY KEY NOT NULL,
	[Name] VARCHAR(50)
)

INSERT INTO [ItemTypes] VALUES  
	(1001, 'Container'),
	(1002, 'Food'),
	(1003, 'Food3')
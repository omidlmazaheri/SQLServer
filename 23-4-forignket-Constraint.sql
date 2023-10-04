/*
FOREIGN KEY CONSTRAINT
(Column Level) در سطح فیلد
*/

-- بررسی جهت وجود دیتابیس و حذف آن 
DROP DATABASE IF EXISTS sampleDB
GO

-- ایجاد دیتابیس
CREATE DATABASE sampleDB 
GO

USE sampleDB;
GO

-- (Parent) ایجاد جدول پدر
CREATE TABLE customers
(
	id INT PRIMARY KEY ,
	companyName NVARCHAR(100)
)
GO

-- های جدول CONSTRAINT مشاهده
EXEC sp_HelpConstraint 'customers'
GO

-- درج رکورد در جدول
INSERT INTO customers 
	VALUES (100,N'تهران گستر'),(101,N'ایران گستر'),(102,N'ایرانیان')
GO

-- مشاهده رکوردهای جدول
SELECT * FROM customers
GO
	
-- (Child) ایجاد جدول فرزند
CREATE TABLE orders
(
	id INT REFERENCES customers(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	orderdate char(10)
)
GO

-- های جدول CONSTRAINT مشاهده
EXEC sp_HelpConstraint 'orders'
GO

-- درج رکورد در جدول
INSERT INTO orders 
	VALUES (100,'1395.03.25'),
		   (101,'1395.03.29'),(101,'1395.04.01'),
		   (102,'1395.04.02'),(102,'1395.04.03'),(102,'1395.04.11')
GO

-- مشاهده رکوردهای جدول
SELECT * FROM customers
SELECT * FROM orders
GO

-- (Parent) درج رکورد در جدول
INSERT INTO customers 
	VALUES (103,N'همکاران')
GO

-- مشاهده رکوردهای جدول
SELECT * FROM customers
GO

-- (Child) درج رکورد در جدول
INSERT INTO orders 
	VALUES (104,'1395.04.22')
GO

-- (Parent) حذف رکورد از جدول
DELETE FROM customers
	WHERE id=100
GO

-- مشاهده رکوردهای جدول
SELECT * FROM customers
SELECT * FROM orders
GO

-- (Child) حذف رکورد از جدول
DELETE FROM orders
	WHERE id=101
GO

-- مشاهده رکوردهای جدول
SELECT * FROM customers
SELECT * FROM orders
GO

-- (Parent) به روز رسانی رکورد در جدول
UPDATE customers
	SET id=1000
		WHERE id=102
GO
		
-- مشاهده رکوردهای جدول
SELECT * FROM customers
SELECT * FROM orders
GO

-- (Child) به روز رسانی رکورد در جدول
UPDATE orders
	SET id=2000
		WHERE id=1000
GO

----------------------------------------------------------

----------------------------------------------------------
/*
FOREIGN KEY CONSTRAINT
(Table Level) در سطح جدول
*/

-- (Parent) ایجاد جدول پدر
CREATE TABLE myTabel1
(
	col1 INT,
	col2 INT,
	PRIMARY KEY(col1,col2)
)
GO

-- (Parent) درج رکورد در جدول
INSERT INTO myTabel1 
	VALUES (1,1),(1,2),(2,1),(2,2)
GO

-- مشاهده رکوردهای جدول
SELECT * FROM myTabel1
GO

-- های جدول CONSTRAINT مشاهده
EXEC sp_HelpConstraint 'myTabel1'
GO

-- (Child) ایجاد جدول فرزند
CREATE TABLE myTabel2
(
	fld1 INT,
	fld2 INT,
	title varchar(10),
	FOREIGN KEY(fld1,fld2) REFERENCES myTabel1(col1,col2)
)
GO

-- (Child) درج رکورد در جدول
INSERT INTO myTabel2 
	VALUES (1,1,'test1'),(1,2,'test2'),(2,1,'test3'),(2,2,'test4')
GO

-- مشاهده رکوردهای جدول
SELECT * FROM myTabel2
GO

-- های جدول CONSTRAINT مشاهده
EXEC sp_HelpConstraint 'myTabel2'
GO

-- (Parent) درج رکورد در جدول
INSERT INTO myTabel1 
	VALUES (3,3)
GO

-- (Child) درج رکورد در جدول
INSERT INTO myTabel2 
	VALUES (10,10,'test10')
GO

-- (Parent) حذف رکورد از جدول
DELETE FROM myTabel1
	WHERE col1=1 AND col2=1
GO

-- (Child) حذف رکورد از جدول
DELETE FROM myTabel2
	WHERE fld1=1 AND fld2=1
GO

-- مشاهده رکوردهای جدول
SELECT * FROM myTabel1
SELECT * FROM myTabel2
GO

-- Parent به روز رسانی رکورد در جدول
UPDATE myTabel1
	SET col2=20
		WHERE col1=1
GO

-- (Child) به روز رسانی رکورد در جدول
UPDATE myTabel2
	SET fld2=20
		WHERE fld1=1
GO

----------------------------------------------------------

----------------------------------------------------------
/*
FORIEGN KEY CONSTRAINT
SET DEFAULT SET NULL
*/

-- (Parent) ایجاد جدول پدر
CREATE TABLE job_type
(
	code INT IDENTITY,
	title NVARCHAR(50) primary key
)
GO

-- درج رکورد در جدول
INSERT job_type
	VALUES(N'مدیر'),(N'معاون'),(N'سرپرست'),(N'کارشناس'),(N'نامشخص')
GO

-- (Child) ایجاد جدول فرزند
CREATE TABLE employees
(
	id INT IDENTITY (0,100) PRIMARY KEY,
	family NVARCHAR(100),
	jobTitle NVARCHAR(50) REFERENCES job_type(title) ON DELETE SET DEFAULT DEFAULT N'نامشخص'
)
GO

-- درج رکورد در جدول
INSERT employees
	VALUES(N'باقری',N'مدیر'),
		(N'سعادت',N'معاون'),
		(N'صدر',N'سرپرست'),
		(N'کریمی',N'سرپرست'),
		(N'صادقی',N'کارشناس'),
		(N'پویا',N'کارشناس')
GO

-- های جدول CONSTRAINT مشاهده
EXEC sp_HelpConstraint 'employees'
GO

-- (Parent) حذف رکورد از جدول
DELETE FROM job_type 
	WHERE code=3
GO

-- مشاهده رکوردهای جدول
SELECT * FROM job_type
SELECT * FROM employees
GO

----------------------------------------------------------
/*
PRIMARY KEY  CONSTRAINT
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

-- PK IN column level
CREATE TABLE students
(
	code INT CONSTRAINT myConst1 PRIMARY key,
	FirstName NVARCHAR(100), 
	LastName NVARCHAR(100), 
	Age INT
);
GO

-- های جدولCONSTRAINT مشاهده
sp_helpCONSTRAINT 'students'
GO

-- درج رکورد در جدول
INSERT INTO students
	VALUES (1000,N'سمیرا', N'محمودی', 15),
		   (1001,N'ترانه', N'جاوید', 14)
GO

-- مشاهده رکوردها در جدول
SELECT * FROM students	
GO

-- درج رکورد با کلید تکراری در جدول
INSERT INTO students
	VALUES(1000,N'شبنم',N'پرتوی',12)
GO

-- در جدول NULL درج رکورد با کلید
INSERT INTO students
	VALUES(NULL,N'شبنم',N'پرتوی',12)
GO

-- بررسی جهت وجود جدول و حذف آن
DROP TABLE IF EXISTS students
GO

----------------------------------------------------------

----------------------------------------------------------
/*
PRIMARY KEY CONSTRAINT
(Table Level) در سطح جدول
*/
CREATE TABLE students
(
	code INT IDENTITY,
	FirstName NVARCHAR(100), 
	LastName NVARCHAR(100), 
	Age INT,
	CONSTRAINT myConst1 PRIMARY KEY(FirstName,LastName)
);
GO

-- درج رکورد در جدول
INSERT INTO students
	VALUES (N'سمیرا', N'محمودی', 15),
		   (N'ترانه', N'جاوید', 14)
GO

-- مشاهده رکوردها در جدول
SELECT * FROM students	
GO

-- درج رکورد با کلید تکراری در جدول
INSERT INTO students
	VALUES(N'سمیرا',N'محمودی',12)
GO

-- در جدول NULL درج رکورد با کلید
INSERT INTO students
	VALUES(NULL,N'پرتوی',12)

-- در جدول NULL درج رکورد با کلید
INSERT INTO students
	VALUES(NULL,NULL,12)
GO

----------------------------------------------------------

----------------------------------------------------------
/*
UNIQUE KEY CONSTRAINT
(Column Level) در سطح فیلد
*/

CREATE TABLE students
(
	code INT CONSTRAINT myConst1 UNIQUE,
	FirstName NVARCHAR(100), 
	LastName NVARCHAR(100), 
	Age INT
);
GO

-- های جدولCONSTRAINT مشاهده
sp_helpCONSTRAINT 'students'
GO

-- درج رکورد در جدول
INSERT INTO students
	VALUES (1000,N'سمیرا', N'محمودی', 15),
		   (1001,N'ترانه', N'جاوید', 14),
		   (NULL,N'سحر', N'تقوی', 15)
GO

-- مشاهده رکوردها در جدول
SELECT * FROM students	
GO

-- درج رکورد  تکراری در جدول
INSERT INTO students
	VALUES(1000,N'شبنم',N'پرتوی',12)
GO

-- درج رکورد  تکراری در جدول
INSERT INTO students
	VALUES(NULL,N'شبنم',N'پرتوی',12)
GO

-- بررسی جهت وجود جدول و حذف آن
DROP TABLE IF EXISTS students
GO

----------------------------------------------------------
/*
UNIQUE KEY CONSTRAINT
(Table Level) در سطح جدول
*/

CREATE TABLE students
(
	code INT IDENTITY,
	FirstName NVARCHAR(100), 
	LastName NVARCHAR(100), 
	Age INT,
	CONSTRAINT myConst1 UNIQUE (FirstName,LastName)
);
GO

-- درج رکورد در جدول
INSERT INTO students
	VALUES (N'سمیرا', N'محمودی', 15),
		   (N'ترانه', N'جاوید', 14)
GO

-- مشاهده رکوردها در جدول
SELECT * FROM students	
GO

-- درج رکورد تکراری در جدول
INSERT INTO students
	VALUES(N'سمیرا',N'محمودی',12)
GO

-- درج رکورد تکراری در جدول
INSERT INTO students
	VALUES(NULL,NULL,12)

-- نکته
INSERT INTO students
	VALUES(NULL,N'پرتوی',12)
GO

-- مشاهده رکوردها در جدول
SELECT * FROM students	
GO

INSERT INTO students
	VALUES(NULL,N'اصغری',12)
GO

-- مشاهده رکوردها در جدول
SELECT * FROM students	
GO

----------------------------------------------------------
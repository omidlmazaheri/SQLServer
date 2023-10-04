/*
DEFAULT CONSTRAINT
*/

USE master
GO
-- بررسی جهت وجود دیتابیس و حذف آن 
DROP DATABASE IF EXISTS sampleDB
GO

-- ایجاد دیتابیس
CREATE DATABASE sampleDB 
GO

USE sampleDB;
GO

-- ایجاد جدول
CREATE TABLE students
(
	nationalCode INT CONSTRAINT myConst1 DEFAULT 0,
	family NVARCHAR(100) NOT NULL,
	medical_status NVARCHAR(100) CONSTRAINT myConst2 DEFAULT N'ندارد',	
	BLOOD_GROUP NVARCHAR(100) CONSTRAINT myConst3 DEFAULT N'OOOOO'
)
GO

-- های جدولCONSTRAINT مشاهده
sp_helpCONSTRAINT 'students'
GO

-- درج رکورد در جدول
INSERT INTO students (family)
	values (N'احمدی'),(N'راد'),(N'سعیدی')
GO

-- مشاهده رکوردها در جدول
SELECT * FROM students
GO

----------------------------------------------------------

----------------------------------------------------------
/*
در زمان اضافه کردن فیلد جدید به جدول موجود DEFAULT CONSTRAINT اعمال
*/
-- WITH VALUES با استفاده از
ALTER TABLE students
	ADD code1 INT DEFAULT 100000  WITH VALUES
GO

-- مشاهده رکوردها در جدول
SELECT * FROM STUDENTS
GO

-- WITH VALUES بدون استفاده از
ALTER TABLE students
	ADD code2 INT DEFAULT 200000
GO

-- مشاهده رکوردها در جدول
SELECT * FROM STUDENTS
GO

-- درج رکورد در جدول
INSERT INTO students (family)
	values (N'حیدری')
GO

-- مشاهده رکوردها در جدول
SELECT * FROM students	
GO

----------------------------------------------------------

----------------------------------------------------------
/*
پس از اضافه کردن فیلد به جدول موجود DEFAULT CONSTRAINT اعمال
*/	

ALTER TABLE students
	ADD city NVARCHAR(50)
GO

INSERT INTO students (family)
	values (N'عماد')
GO

ALTER TABLE students
	ADD  DEFAULT N'تهران' FOR  city
GO

-- درج رکورد در جدول
INSERT INTO students (family)
	values (N'صابری')
GO

-- مشاهده رکوردها در جدول
SELECT * FROM students	
GO

----------------------------------------------------------

----------------------------------------------------------
/*
CONSTRAINT حذف
*/

ALTER TABLE students
	DROP CONSTRAINT myConst1
GO

----------------------------------------------------------
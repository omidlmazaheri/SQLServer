/*
CHECK CONSTRAINT
(Column Level) در سطح فیلد
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
CREATE TABLE myTABLE(
	id INT CONSTRAINT myConst1 CHECK (id>=100),
	country NVARCHAR(100) CONSTRAINT myConst2 CHECK (country IN (N'ایتالیا',N'ایران',N'آمریکا')),
	barcode VARCHAR(100) CHECK (barcode LIKE ('[0-9][a-h]/%'))
)
GO

-- های جدولCONSTRAINT مشاهده
sp_helpCONSTRAINT 'myTABLE'
GO

-- درج رکورد در جدول
INSERT INTO myTABLE
	VALUES(100,N'آمریکا','0a/'),(101,N'ایران','1e/ir'),(102,N'ایتالیا','8h/')
GO

-- مشاهده رکوردها در جدول
SELECT * FROM myTABLE	
GO

-- درج رکورد غیر مجاز در جدول
INSERT INTO myTABLE
	VALUES(99,N'ایتالیا','aa/a55')
GO

-- درج رکورد غیر مجاز در جدول
INSERT INTO myTABLE
	VALUES(101,N'لهستان','9e/')
GO

-- درج رکورد غیر مجاز در جدول
INSERT INTO myTABLE
	VALUES(101,N'آمریکا','9/aaaa')
GO


/*
پس از اضافه کردن فیلد به جدول موجود CHECK CONSTRAINT اعمال
*/

ALTER TABLE myTABLE
	ADD col1 INT DEFAULT -1 WITH VALUES
GO

-- مشاهده رکوردها در جدول
SELECT * FROM myTABLE	
GO

ALTER TABLE myTABLE
	WITH nocheck
		ADD CHECK (col1>1000)
GO

-- درج رکورد غیر مجاز در جدول
INSERT INTO myTABLE
	VALUES(101,N'آمریکا','9h/aaaa',999)
GO

-- مشاهده رکوردها در جدول
SELECT * FROM myTABLE	
GO

----------------------------------------------------------

----------------------------------------------------------
/*
CHECK CONSTRAINT
(Table Level) در سطح جدول
*/

-- بررسی جهت وجود جدول و حذف آن
DROP TABLE IF EXISTS myTABLE
GO

CREATE TABLE myTABLE
(
	col1 INT,
	col2 INT,
	CHECK (col1>=col2)
)
GO

-- درج رکورد در جدول
INSERT INTO myTABLE
	VALUES(100,60)
GO

-- مشاهده رکوردها در جدول
SELECT * FROM myTABLE	
GO

-- درج رکورد غیر مجاز در جدول
INSERT INTO myTABLE
	VALUES(80,90)
GO

----------------------------------------------------------
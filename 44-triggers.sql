Alter TRIGGER DeleteBlogsAfterDeletetest
   ON  dbo.test
   AFTER Delete
AS 
BEGIN
declare @id int;
set @id = (SELECT id FROM DELETED)
SELECT @id
DELETE FROM test2 WHERE id=@id
END



delete from test where id=1
select * from DELETED



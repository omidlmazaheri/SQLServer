CREATE PROC removeAuthors
@au_id varchar(11),
@title_id varchar(6)
as
DELETE FROM dbo.titleauthor WHERE  au_id =@au_id
AND title_id=@title_id;
go
DELETE FROM dbo.authors WHERE  au_id=@au_id;
go
DELETE FROM dbo.titles WHERE title_id =@title_id
Go
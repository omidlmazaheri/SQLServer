USE [pubs]
GO
/****** Object:  StoredProcedure [dbo].[removeAuthors]    Script Date: 19/06/1402 03:00:04 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[removeAuthors]
@au_id varchar(11),
@title_id varchar(6)
as
DELETE FROM [dbo].[roysched] WHERE  title_id=@title_id;
DELETE FROM dbo.sales WHERE  title_id=@title_id;
DELETE FROM dbo.titleauthor WHERE  au_id =@au_id AND title_id=@title_id;
DELETE FROM dbo.titles WHERE title_id =@title_id
DELETE FROM dbo.authors WHERE  au_id=@au_id;





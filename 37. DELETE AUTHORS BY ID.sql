use pubs
Go
CREATE PROCEDURE removeAuthorsById
AS

DELETE FROM Authors WHERE au_id='172-32-1176'; 
GO 

CREATE PROCEDURE addAuthors
@au_id varchar(11) ,
@au_lname varchar(40)  ,
@au_fname varchar(20),
@phone char(12) ,
@address varchar(40),
@city varchar(20),
@state char(2),
@zip char(5),
@contract bit 
AS
INSERT authors (au_id , au_lname ,au_fname ,phone, address ,city,state ,zip ,contract)
VALUES (@au_id ,@au_lname ,@au_fname ,@phone, @address ,@city,@state ,@zip ,@contract)
go


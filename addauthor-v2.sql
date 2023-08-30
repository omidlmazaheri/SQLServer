use pubs;
go
EXEC addAuthors @au_id ='213-46-8919' , @au_lname ='anderson' , @au_fname='katrin' , @phone='001584785475' ,
@city='karaj' ,@contract=0 , @address='22 Cleveland Av. #15' ,@state='KS' , @zip='94609'
SELECT * FROM authors

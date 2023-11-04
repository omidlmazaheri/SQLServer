Create Table MyTable
(Id int Identity(1,1) primary key not null,FirstName varchar(50), Family varchar(150), ModifyDateTime DateTime Null)

Insert Into MyTable (FirstName,Family) Values ('Omid','Lak')


Create Trigger [dbo].[Trg_Update] On [dbo].[myTable]
 After Update
 As Begin
Update myTable Set ModifyDateTime = GETDATE()
Where myTable.id = (Select d.id from deleted d)
End


UPDATE MyTable set firstname='ali' WHERE FirstName='Omid'
USE [pubs]
GO
/****** Object:  StoredProcedure [dbo].[edit_authors]    Script Date: 08/30/2023 19:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[edit_authors] 
@au_id nvarchar(11) , @au_lname nvarchar(40), @au_fname nvarchar(20), @phone char(12), @address nvarchar(40), @city nvarchar(40) , @state char(2), @zip char(5), @contract bit
AS
UPDATE dbo.authors
SET au_lname = @au_lname, au_fname = @au_fname, phone = @phone, address = @address, city = @city, state = @state, zip = @zip, contract = @contract
WHERE au_id = @au_id

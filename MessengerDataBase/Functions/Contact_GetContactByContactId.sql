USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 30.04.2017
-- Description:	Get contact via ContactId
-- =============================================
alter FUNCTION [dbo].[Contact_GetContactByContactId]
(	
	@contactId INT
)
RETURNS @contact TABLE(
	[ContactId] INT,
	[FirstName] NVARCHAR(40),
	[SecondName] NVARCHAR(40),
	[MiddleName] NVARCHAR(40),
	[Sex] VARCHAR(5),
	[BirthDate] DATETIME,
	[Email] VARCHAR(60),
	[Phone] VARCHAR(15),
	[Comment] NVARCHAR(120),
	[CreationDate] DATETIME,
	[ModificationDate] DATETIME,
	[Disable] BIT,
	[NotRelevant] BIT,
	[RowVersion] Binary)
AS
BEGIN
	INSERT INTO @contact 
	SELECT TOP(1) * FROM [dbo].[Contact] WHERE ContactId = @contactId
	RETURN
END
GO

--([ContactId],[FirstName],[SecondName],[MiddleName],[Sex],[BirthDate],[Email],[Phone],[Comment],[CreationDate],[ModificationDate],[Disable],[NotRelevant],[RowVersion])



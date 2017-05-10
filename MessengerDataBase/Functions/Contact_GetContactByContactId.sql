USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 30.04.2017
-- Description:	Get contact via ContactId
-- =============================================
CREATE FUNCTION [dbo].[Contact_GetContactByContactId]
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
	[NotRelevant] BIT)
AS
BEGIN
	INSERT @contact 
	SELECT TOP(1) * FROM [dbo].[Contact] WHERE ContactId = @contactId
	RETURN
END
GO



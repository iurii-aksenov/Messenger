USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 30.04.2017
-- Description:	Get list of friends by ContactId
-- =============================================
CREATE FUNCTION [dbo].[List_GetListOfFriendsByContactId]
(	
	@contactId INT
)
RETURNS @friendsTable TABLE (
	[ContactId] INT,
	[FirstName] NVARCHAR(40),
	[SecondName] NVARCHAR(40),
	[MiddleName] NVARCHAR(40),
	[Sex] VARCHAR(5),
	[BirthDate] VARCHAR,
	[Email] VARCHAR(60),
	[Phone] VARCHAR(15),
	[Comment] NVARCHAR(120),
	[CreationDate] DATETIME,
	[ModificationDate] DATETIME,
	[Disable] BIT,
	[NotRelevant] BIT,
	[RowVersion] BINARY)
AS
BEGIN
	DECLARE @listId INT  = (SELECT TOP(1) ListId FROM List WHERE CreatorId = @contactId AND Title='FRIENDS')

	INSERT INTO @friendsTable
	SELECT * FROM Contact WHERE ContactId IN (SELECT ContactId FROM ListContact WHERE ListId=@listId)
	RETURN
END
GO


USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 07.05.2017
-- Description:	Get ListContact by ListContactId
-- =============================================
CREATE FUNCTION [dbo].[ListContact_GetListContactByContactListId]
(
	@listContactId INT
)
RETURNS @listContactTable TABLE (
	[ListContactId] INT,
	[ListId] INT,
	[ContactId] INT,
	[CreationDate] DATETIME,
	[ModificationDate] DATETIME,
	[NotRelevant] BIT,
	[RowVersion] BINARY)
AS
BEGIN
	INSERT INTO @listContactTable
	SELECT TOP(1) * FROM ListContact WHERE ListContactId = @listContactId
	RETURN 
END
GO
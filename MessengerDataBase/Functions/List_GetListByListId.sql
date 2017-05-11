USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 11.05.2017
-- Description:	Get List by ListId
-- =============================================
CREATE FUNCTION [dbo].[List_GetListByListId]
(
	@listId INT
)
RETURNS @list TABLE(
	[ListId] INT,
	[Title] NVARCHAR(40),
	[Comment] NVARCHAR(250),
	[CreatorId] INT,
	[CreationDate] DATETIME,
	[ModificationDate] DATETIME,
	[NotRelevant] BIT,
	[RowVersion] BINARY)
AS
BEGIN
	INSERT INTO @list 
	SELECT TOP(1) * FROM [dbo].[List] WHERE ListId = @listId
	RETURN
END
GO


USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 11.05.2017
-- Description:	Get List by Title and CreatorId
-- =============================================
CREATE FUNCTION [dbo].[List_GetListByTitleAndCreatorId]
(
	@title NVARCHAR(40),
	@creatorId INT
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
	SELECT TOP(1) * FROM [dbo].[List] WHERE Title = @title AND CreatorId = @creatorId;
	RETURN
END
GO


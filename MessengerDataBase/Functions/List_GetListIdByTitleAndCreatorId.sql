USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 07.05.2017
-- Description:	Get ListId by Title and CreatorId
-- =============================================
CREATE FUNCTION [dbo].[List_GetListIdByTitleAndCreatorId]
(
	@title NVARCHAR(40),
	@creatorId INT
)
RETURNS INT
AS
BEGIN
	DECLARE @listId INT;
	SET @listId =(SELECT ListId FROM List WHERE title=@title AND CreatorId=@creatorId);
	RETURN @listId;
END
GO

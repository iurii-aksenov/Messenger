USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Get list of someones id by Title of list and ContactId
-- =============================================
CREATE FUNCTION [dbo].[List_GetListOfSomeonesIdByTitleAndContactId]
(	
	@title NVARCHAR(40),
	@contactId INT
)
RETURNS @someonesIdTable TABLE ([ContactId] INT)
AS
BEGIN

	DECLARE @listId INT  = (SELECT TOP(1) ListId FROM List WHERE CreatorId = @contactId AND Title=@title)
	INSERT INTO @someonesIdTable
	SELECT ContactId FROM ListContact WHERE ListId = @listId
	RETURN
END
GO

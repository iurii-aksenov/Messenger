USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 30.04.2017
-- Description:	Get list of friends id by Contact Id
-- =============================================
CREATE FUNCTION [dbo].[List_GetListOfFriendsIdByContactId]
(	
	@contactId INT
)
RETURNS @friendsIdTable TABLE ([ContactId] INT)
AS
BEGIN

	DECLARE @listId INT  = (SELECT TOP(1) ListId FROM List WHERE CreatorId = @contactId AND Title='FRIENDS')
	INSERT INTO @friendsIdTable
	SELECT ContactId FROM ListContact WHERE ListId = @listId
	RETURN
END
GO

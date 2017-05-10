USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 07.05.2017
-- Description:	Get ListContactId by ListId and ContactId
-- =============================================
CREATE FUNCTION [dbo].[ListContact_GetListContactIdByListIdAndContactId]
(
	@listId INT,
	@contactId INT
)
RETURNS INT
AS
BEGIN
	DECLARE @listContactId INT;
	SET @listContactId =(SELECT ListContactId FROM ListContact WHERE ListId=@listId AND ContactId=@contactId);
	RETURN @listContactId;
END
GO


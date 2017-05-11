USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Update instance of listContact in ListContact table
-- =============================================
CREATE PROCEDURE [dbo].[ListContact_UpdateListContact] 
	@listContactId INT,
	@listId INT,
	@contactId INT,
	@notRelevant BIT
AS
BEGIN
	UPDATE [dbo].[ListContact]
	SET [ListId] = @listId
      ,[ContactId] = @contactId
      ,[ModificationDate] = GETDATE()
      ,[NotRelevant] = @notRelevant
	WHERE ListContactId = @listContactId

	IF (@@ERROR <> 0)
	BEGIN
	PRINT 
		N'Updating ListContact is failed.' +
		ERROR_MESSAGE()
	SELECT -1 AS 'Updating ListContact is failed.'
	RETURN -1
	END

	PRINT 'Updating ListContact is ok.' 
	SELECT 0 AS 'Updating ListContact is ok.'
	RETURN 0
END
GO

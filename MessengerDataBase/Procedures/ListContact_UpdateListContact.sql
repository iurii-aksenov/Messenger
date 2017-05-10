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
	@creationDate DATETIME,
	@notRelevant BIT
AS
BEGIN
	UPDATE [dbo].[ListContact]
	SET [ListId] = @listId
      ,[ContactId] = @contactId
      ,[CreationDate] = @creationDate
      ,[ModificationDate] = getdate()
      ,[NotRelevant] = @notRelevant
	WHERE ListContactId = @listContactId

	IF (@@ERROR <> 0)
		BEGIN
		PRINT 
			N'Updating list contact is failed.' +
			ERROR_MESSAGE()
		RETURN -1
		END
	PRINT 'Updating list is ok.'
	RETURN 0
END
GO

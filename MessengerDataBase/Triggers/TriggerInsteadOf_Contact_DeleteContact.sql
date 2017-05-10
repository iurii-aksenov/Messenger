USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Trigger for deleting contact. Instead deleting contact will be disabled.
-- =============================================
CREATE TRIGGER [dbo].[TriggerInsteadOf_Contact_DeleteContact] 
   ON [dbo].[Contact] INSTEAD OF DELETE
AS 
BEGIN
	
	DECLARE @deletedContactId INT;
	SET @deletedContactId = (SELECT TOP(1) ContactId FROM deleted);

	UPDATE [dbo].[Contact]
	SET [Disable] = 1
      ,[NotRelevant] = 1
	WHERE ContactId = @deletedContactId;

	UPDATE [dbo].[Dialog]
	SET [NotRelevant] = 1
	WHERE OwnerId = @deletedContactId;

	DECLARE @deletedListId INT;

	DECLARE deletedContactsFromListsCursor CURSOR FOR
	SELECT ListId FROM [dbo].[List] WHERE CreatorId = @deletedContactId;

	Open deletedContactsFromListsCursor;

	FETCH NEXT FROM deletedContactsFromListsCursor INTO @deletedContactID;

	WHILE @@FETCH_STATUS=0
	BEGIN
		UPDATE [dbo].[ListContact]
		SET [NotRelevant] = 1
			WHERE ListId = @deletedListId;
		FETCH NEXT FROM deletedContactsFromListsCursor INTO @deletedContactID;
	END

	CLOSE deletedContactsFromListsCursor;

	DEALLOCATE deletedContactsFromListsCursor;

	UPDATE [dbo].[List]
	SET [NotRelevant] = 1
	WHERE CreatorId = @deletedContactId;

END
GO

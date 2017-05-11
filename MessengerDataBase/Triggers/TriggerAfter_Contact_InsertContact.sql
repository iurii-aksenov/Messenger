USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Trigger for creating "FRIENDS" list in List table when inserting contact occures
-- =============================================

CREATE TRIGGER [dbo].[TriggerAfter_Contact_InsertContact]
    ON [dbo].[Contact] AFTER INSERT
AS 
BEGIN
    DECLARE @contactId INT;
	SET @contactId = (SELECT TOP(1) ContactId FROM inserted);
	
	DECLARE insertedFriendListCursor CURSOR FOR
	SELECT ContactId FROM inserted

	OPEN insertedFriendListCursor

	FETCH NEXT FROM insertedFriendListCursor INTO @contactId

	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXECUTE [dbo].[List_InsertList] @title='FRIENDS', @creatorId = @contactId;
		FETCH NEXT FROM insertedFriendListCursor INTO @contactId
	END

	CLOSE insertedFriendListCursor
	DEALLOCATE insertedFriendListCursor

END
GO


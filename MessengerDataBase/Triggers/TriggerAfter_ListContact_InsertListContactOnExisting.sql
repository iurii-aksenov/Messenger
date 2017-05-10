USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Trigger for checking the insert contactId on already existing.
-- =============================================
CREATE TRIGGER [dbo].[TriggerAfter_ListContact_InsertListContactOnExisting]
    ON [dbo].[ListContact] AFTER INSERT
AS 
BEGIN

	DECLARE @insertedListId INT;
	DECLARE @insertedContactId INT;


	SET @insertedListId = (SELECT TOP(1) ListId FROM inserted);
	SET @insertedContactId = (SELECT TOP(1) ContactId FROM inserted);

	IF((SELECT COUNT(*) FROM ListContact WHERE ListId=@insertedListId AND ContactId=@insertedContactId) > 1)
	BEGIN
		PRINT 'Such list contact row already exists'
		ROLLBACK TRANSACTION
	END
END
GO
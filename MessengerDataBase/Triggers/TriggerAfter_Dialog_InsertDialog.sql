USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	After creating dialog cotact will be inserted in FRIENDS list is he/she there isn't
-- После создания диалога добавляем этого контакта в список жрузей.
-- =============================================
CREATE TRIGGER [dbo].[TriggerAfter_Dialog_InsertDialog]
    ON [dbo].[Dialog] AFTER INSERT
AS 
BEGIN

	DECLARE @insertedOwnerId INT;
	DECLARE @insertedInterlocutorId INT;

	
	DECLARE insertedDialogsCursor CURSOR FOR
	SELECT OwnerId, InterlocutorId FROM inserted 
	
	OPEN insertedDialogsCursor

	FETCH NEXT FROM insertedDialogsCursor INTO @insertedOwnerId, @insertedInterlocutorId

	WHILE @@FETCH_STATUS = 0
	BEGIN

		IF(NOT EXISTS(
		SELECT * FROM ListContact 
			WHERE ListId  = 
				(SELECT ListId FROM List 
					WHERE Title='FRIENDS' AND CreatorId = @insertedOwnerId) 
			AND ContactId=@insertedInterlocutorId))
		BEGIN
			INSERT INTO [dbo].[ListContact]([ListId],[ContactId]) VALUES 
			((SELECT TOP(1) ListId FROM List WHERE Title='FRIENDS' AND CreatorId = @insertedOwnerId), @insertedInterlocutorId)
		END


		FETCH NEXT FROM insertedDialogsCursor INTO @insertedOwnerId, @insertedInterlocutorId
	END

	CLOSE insertedDialogsCursor 
	DEALLOCATE insertedDialogsCursor 
	
END
GO
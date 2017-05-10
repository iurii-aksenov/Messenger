USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Trigger for inserting any contact in list contact. If title is not friends then checking will occured to insert contact in friends list.
-- After adding person in some list, dialog between contacts will be determined on existing. if it doesn't exist, the such dialog willl be added.
-- ѕосле добавлени€ чловека в список провер€етс€ есть ли между ним диалог, если диалога нет, то он создаетс€.
-- =============================================
CREATE TRIGGER [dbo].[TriggerAfter_ListContact_InsertListContact]
    ON [dbo].[ListContact] AFTER INSERT
AS 
BEGIN
	BEGIN TRANSACTION

		DECLARE @insertedListId INT;
		DECLARE @insertedTitle NVARCHAR(40);
		DECLARE @insertedContactId INT;

		SET @insertedListId = (SELECT TOP(1) ListId FROM inserted);
		SET @insertedContactId = (SELECT TOP(1) ContactId FROM inserted);

		--DECLARE insertedListContactsCursor CURSOR FOR
		--SELECT ListId, ContactId FROM inserted 
	
		--OPEN insertedListContactsCursor

		--FETCH NEXT FROM insertedListContactsCursor INTO @insertedListId, @insertedContactId

		--WHILE @@FETCH_STATUS = 0
		--BEGIN

			SET @insertedTitle = (SELECT TOP(1) Title FROM List WHERE ListId = @insertedListId);
			
		
			IF(@insertedTitle != 'FRIENDS') 
			BEGIN 
				DECLARE @friendListIdWhereTitleIsFriends INT;
				SET @friendListIdWhereTitleIsFriends = (SELECT TOP(1) ListId FROM List WHERE Title='FRIENDS' AND CreatorId=(SELECT TOP(1) CreatorId FROM List WHERE ListId = @insertedListId));
				IF(NOT EXISTS(SELECT * FROM ListContact WHERE ContactId=@insertedContactId AND ListId=@friendListIdWhereTitleIsFriends))
				BEGIN
					EXECUTE [dbo].[ListContact_InsertListContact] @listId=@friendListIdWhereTitleIsFriends, @contactId=@insertedContactId;
				END
			END

			IF (@@error <> 0)
			BEGIN 
				PRINT 
				 N'Inserted in Friends dialog non-friend contact is failed. Inserting instance between this guys is impossible too. Rolling back transaction' +
				 ERROR_MESSAGE()
				--CLOSE insertedListContactsCursor 
				--DEALLOCATE insertedListContactsCursor
				ROLLBACK TRANSACTION 
			END
		

			IF(NOT EXISTS(SELECT * FROM Dialog	WHERE OwnerId  = 
					(SELECT CreatorId FROM List WHERE Title='FRIENDS' AND CreatorId=(SELECT TOP(1) CreatorId FROM List WHERE ListId = @insertedListId)) 
					AND InterlocutorId = @insertedContactId))
			BEGIN
				DECLARE @insertedOwnerId INT = (SELECT CreatorId FROM List WHERE Title='FRIENDS' AND CreatorId=(SELECT TOP(1) CreatorId FROM List WHERE ListId = @insertedListId))
				EXECUTE [dbo].[Dialog_InsertDialog] @ownerId = @insertedOwnerId, @interlocutorID= @insertedContactId;
			END

			IF (@@error <> 0)
			BEGIN 
				PRINT 
					N'Inserting instance between this guys is impossible too. Rolling back transaction' +
					ERROR_MESSAGE()
				--CLOSE insertedListContactsCursor 
				--DEALLOCATE insertedListContactsCursor
				ROLLBACK TRANSACTION 
			END

			--FETCH NEXT FROM insertedListContactsCursor INTO @insertedListId, @insertedContactId
		--END

	--CLOSE insertedListContactsCursor
	--DEALLOCATE insertedListContactsCursor 

	COMMIT TRANSACTION
 
END
GO
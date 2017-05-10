USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Insert instance of dialog message from DialogMessage table
-- =============================================
CREATE PROCEDURE [dbo].[DialogMessage_InsertDialogMessage]
	@authorId INT,
    @text NVARCHAR (2500),
	@dialogId INT,
    @readStatus VARCHAR(6) = 'UNREAD',
    @creationDate DATETIME = NULL,
    @modificationDate DATETIME = NULL,
    @notRelevant BIT = 0
AS
BEGIN
	DECLARE @insertedDialogMessageId INT = -1;

	BEGIN TRANSACTION
	
	DECLARE @previousDialogMessageId INT = NULL;

	IF(@dialogId != 0) 
	BEGIN 
		SET @previousDialogMessageId = (SELECT TOP(1) LastDialogMessageId FROM Dialog WHERE DialogId = @dialogId);  
	END

			IF (@creationDate IS NULL) BEGIN SET @creationDate = getdate() END
			IF (@modificationDate IS NULL) BEGIN SET @modificationDate = getdate() END


			INSERT INTO [dbo].[DialogMessageText]
			   ([Text]
			   ,[CreationDate]
			   ,[NotRelevant]
			   ,[ModificationDate])
			VALUES
			   (@text
			   ,@creationDate
			   ,@notRelevant
			   ,@modificationDate)

			IF (@@error <> 0)
			BEGIN 
				PRINT 
				N'Inserted DialogMessegeText is failed.'+
				'Rolling back transaction'
				ROLLBACK TRANSACTION
				RETURN -1
			END

			DECLARE @insertedDialogMessageTextId INT = SCOPE_IDENTITY();
			PRINT 'InsertedDialogMessageTextId = ' + CAST(@insertedDialogMessageTextId AS VARCHAR(10))

			INSERT INTO [dbo].[DialogMessage]
				   ([AuthorId]
				   ,[DialogMessageTextId]
				   ,[ReadStatus]
				   ,[PreviousDialogMessageId]
				   ,[CreationDate]
				   ,[ModificationDate]
				   ,[NotRelevant])
			 VALUES
				   (@authorId
				   ,@insertedDialogMessageTextId
				   ,@readStatus
				   ,@previousDialogMessageId
				   ,@creationDate
				   ,@modificationDate
				   ,@notRelevant)

	

		IF (@@error <> 0)
		BEGIN 
			PRINT 
			N'Inserted DialogMessege is failed.'+
			'Rolling back transaction'
			ROLLBACK TRANSACTION
			RETURN -1
		END

		SET @insertedDialogMessageId = SCOPE_IDENTITY();

		IF(@dialogId != 0)
		BEGIN
			UPDATE [dbo].[Dialog]
			SET LastDialogMessageId = @insertedDialogMessageId
			WHERE DialogId = @dialogId;

			IF (@@error <> 0)
			BEGIN 
				PRINT 
				N'Inserted DialogMessege is failed. Changing LastDialogMessageId in transmitted (owner) dialogId is bad'+
				' Rolling back transaction'
				ROLLBACK TRANSACTION
				RETURN -1
			END

			DECLARE @ownerId INT = (SELECT TOP(1) OwnerId FROM Dialog WHERE DialogId = @dialogId);
			DECLARE @interlocutorId INT = (SELECT TOP(1) InterlocutorId FROM Dialog WHERE DialogId = @dialogId);

			UPDATE [dbo].[Dialog]
			SET LastDialogMessageId = @insertedDialogMessageId
			WHERE OwnerId = @ownerId AND InterlocutorId = @interlocutorId

			IF (@@error <> 0)
			BEGIN 
				PRINT 
				N'Inserted DialogMessege is failed. Changing LastDialogMessageId in interlocutor dialogId is bad'+
				' Rolling back transaction'
				ROLLBACK TRANSACTION
				RETURN -1
			END
		END
	COMMIT TRANSACTION

	PRINT 'InsertedDialogMessageId = ' + CAST(@insertedDialogMessageId AS VARCHAR(10))
	RETURN @insertedDialogMessageId
END
GO



--USE MessengerDb
--GO
---- =============================================
---- Author:		YURIY AKSENOV
---- Create date: 07.05.2017
---- Description:	Insert instance of dialog message from DialogMessage table
---- =============================================
--CREATE PROCEDURE [dbo].[DialogMessage_InsertDialogMessage]
--	@authorId INT,
--    @text NVARCHAR (2500),
--	@dialogId INT,
--    @readStatus VARCHAR(6) = 'UNREAD',
--    @creationDate DATETIME = NULL,
--    @modificationDate DATETIME = NULL,
--    @notRelevant BIT = 0
--AS
--BEGIN
--	DECLARE @insertedDialogMessageId INT;
--	BEGIN TRANSACTION
	
--	DECLARE @previousDialogMessageId INT = NULL;

--	IF(@dialogId != 0) 
--	BEGIN 
--		SET @previousDialogMessageId = (SELECT TOP(1) LastDialogMessageId FROM Dialog WHERE DialogId = @dialogId);  
--	END

--			IF (@creationDate IS NULL) BEGIN SET @creationDate = getdate() END
--			IF (@modificationDate IS NULL) BEGIN SET @modificationDate = getdate() END


--			INSERT INTO [dbo].[DialogMessageText]
--			   ([Text]
--			   ,[CreationDate]
--			   ,[NotRelevant]
--			   ,[ModificationDate])
--			VALUES
--			   (@text
--			   ,@creationDate
--			   ,@notRelevant
--			   ,@modificationDate)

--			IF (@@error <> 0)
--			BEGIN 
--				PRINT 
--				N'Inserted DialogMessegeText is failed.'+
--				'Rolling back transaction'
--				ROLLBACK TRANSACTION
--				RETURN -1
--			END

--			DECLARE @insertedDialogMessageTextId INT = SCOPE_IDENTITY();
--			PRINT 'InsertedDialogMessageTextId = ' + CAST(@insertedDialogMessageTextId AS VARCHAR(10))

--			INSERT INTO [dbo].[DialogMessage]
--				   ([AuthorId]
--				   ,[DialogMessageTextId]
--				   ,[ReadStatus]
--				   ,[PreviousDialogMessageId]
--				   ,[CreationDate]
--				   ,[ModificationDate]
--				   ,[NotRelevant])
--			 VALUES
--				   (@authorId
--				   ,@insertedDialogMessageTextId
--				   ,@readStatus
--				   ,@previousDialogMessageId
--				   ,@creationDate
--				   ,@modificationDate
--				   ,@notRelevant)

	

--			IF (@@error <> 0)
--			BEGIN 
--				PRINT 
--				N'Inserted DialogMessege is failed.'+
--				'Rolling back transaction'
--				ROLLBACK TRANSACTION
--				RETURN -1
--			END
--	SET @insertedDialogMessageId = SCOPE_IDENTITY();
		

--	COMMIT TRANSACTION

--	PRINT 'InsertedDialogMessageId = ' + CAST(@insertedDialogMessageId AS VARCHAR(10))
--	RETURN @insertedDialogMessageId
--END
--GO

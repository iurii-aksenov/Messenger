USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Insert instance of dialog into Dialog table
-- =============================================
CREATE PROCEDURE [dbo].[Dialog_InsertDialog] 
	@ownerId INT,
    @interlocutorId INT,
    @lastDialogMessageId INT = NULL,
    @creationDate DATETIME = NULL,
    @modificationDate DATETIME = NULL,
    @notRelevant BIT = 0
AS
BEGIN
	BEGIN TRANSACTION [Transaction_InsertPairsOfDialog] WITH MARK 'Insert Pairs Of Dialog And Creating Message With Text'

		ALTER TABLE [dbo].[Dialog] NOCHECK CONSTRAINT [FK_Dialog_DialogMessage_LastDialogMessageId_DialogMessageId]

		DECLARE @insertedDialogId INT;

		IF(EXISTS(SELECT * FROM Dialog WHERE OwnerId=@ownerId AND InterlocutorId=@interlocutorId))
		BEGIN
			PRINT 
				N'Inserted is failed. Such dialog of these owner and interlocitor already exists.'+
				'Inserting will be closed.' 

			ALTER TABLE [dbo].[Dialog] CHECK CONSTRAINT [FK_Dialog_DialogMessage_LastDialogMessageId_DialogMessageId]
			ROLLBACK TRANSACTION [Transaction_InsertPairsOfDialog]
			RETURN -1;
		END


		DECLARE @insertedDialogMessageId INT;
		EXECUTE @insertedDialogMessageId = [dbo].[DialogMessage_InsertDialogMessage] @authorId=@ownerId, @dialogId = 0, @text='',@readStatus='UNREAD', @notRelevant = 1;

		IF (@@error <> 0)
        BEGIN 
			PRINT 
				N'Inserted is failed. Insert dialog message is impossible. ' + 
				'Inserting will be closed.'+
				ERROR_MESSAGE()
			ALTER TABLE [dbo].[Dialog] CHECK CONSTRAINT [FK_Dialog_DialogMessage_LastDialogMessageId_DialogMessageId]
			ROLLBACK TRANSACTION [Transaction_InsertPairsOfDialog]
			RETURN -1;
			
		END

		IF(NOT EXISTS(SELECT * FROM Dialog WHERE OwnerId=@ownerId AND InterlocutorId=@interlocutorId))
		BEGIN
			INSERT INTO [dbo].[Dialog]
			   ([OwnerId]
			   ,[InterlocutorId]
			   ,[LastDialogMessageId]
			   ,[CreationDate]
			   ,[ModificationDate]
			   ,[NotRelevant])
			VALUES
			   (@ownerId
			   ,@interlocutorId
			   ,@insertedDialogMessageId
			   ,getdate()
			   ,getdate()
			   ,0)
		END	

		IF (@@error <> 0)
        BEGIN 
			PRINT 
				N'Inserted is failed. Insert owner dialog is failed'+
				'Inserting will be closed.'+
				ERROR_MESSAGE()
			ALTER TABLE [dbo].[Dialog] CHECK CONSTRAINT [FK_Dialog_DialogMessage_LastDialogMessageId_DialogMessageId]
			ROLLBACK TRANSACTION [Transaction_InsertPairsOfDialog]
			RETURN -1;
		END

		SET @insertedDialogId = SCOPE_IDENTITY();

		IF(NOT EXISTS(SELECT * FROM Dialog WHERE OwnerId=@interlocutorId AND InterlocutorId=@ownerId))
		BEGIN
			INSERT INTO [dbo].[Dialog]
			   ([OwnerId]
			   ,[InterlocutorId]
			   ,[LastDialogMessageId]
			   ,[CreationDate]
			   ,[ModificationDate]
			   ,[NotRelevant])
			VALUES
			   (@interlocutorId
			   ,@ownerId
			   ,@insertedDialogMessageId
			   ,getdate()
			   ,getdate()
			   ,0)
		END		

		IF (@@error <> 0)
        BEGIN 
			SELECT 'Inserted is failed. Inser interlocutor dialog id failed'
			ALTER TABLE [dbo].[Dialog] CHECK CONSTRAINT [FK_Dialog_DialogMessage_LastDialogMessageId_DialogMessageId]
			ROLLBACK TRANSACTION [Transaction_InsertPairsOfDialog]
			RETURN -1;
		END

		
		
		
	COMMIT TRANSACTION [Transaction_InsertPairsOfDialog]
	SELECT @insertedDialogId AS DialogId;
	RETURN @insertedDialogId;
END
	--DECLARE @insertedDialogId INT;

	--IF (@creationDate IS NULL) BEGIN SET @creationDate = getdate() END
	--IF (@modificationDate IS NULL) BEGIN SET @modificationDate = getdate() END

	--INSERT INTO [dbo].[Dialog]
 --          ([OwnerId]
 --          ,[InterlocutorId]
 --          ,[LastDialogMessageId]
 --          ,[CreationDate]
 --          ,[ModificationDate]
 --          ,[NotRelevant])
 --    VALUES
 --          (@ownerId
 --          ,@interlocutorId
 --          ,@lastDialogMessageId
 --          ,@creationDate
 --          ,@modificationDate
 --          ,@notRelevant)

	--SET @insertedDialogId = SCOPE_IDENTITY();
	--SELECT @insertedDialogId AS DialogId;
	--RETURN @insertedDialogId;

GO

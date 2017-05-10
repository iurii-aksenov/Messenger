--”ƒ¿À≈Õ

USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Trigger and Trasactions for inserting dialog and creating 
-- =============================================
CREATE TRIGGER [dbo].[TriggerInsteadOf_Dialog_InsertDialog_WithTransaction]
    ON [dbo].[Dialog] INSTEAD OF INSERT
AS 

	BEGIN TRANSACTION [Transaction_InsertPairsOfDialog] WITH MARK 'Insert Pairs Of Dialog And Creating Message With Text'

		ALTER TABLE [dbo].[Dialog] NOCHECK CONSTRAINT [FK_Dialog_DialogMessage_LastDialogMessageId_DialogMessageId]

		DECLARE @insertedOwnerId INT;
		DECLARE @insertedInterlocutorId INT;
		DECLARE @insertedDialogId INT;

		SET @insertedOwnerId = (SELECT TOP(1) OwnerId FROM inserted);
		SET @insertedInterlocutorId = (SELECT TOP(1) InterlocutorId FROM inserted);
		SET @insertedDialogId = (SELECT TOP(1) DialogId FROM inserted);

		IF(EXISTS(SELECT * FROM Dialog WHERE OwnerId=@insertedOwnerId AND InterlocutorId=@insertedInterlocutorId))
		BEGIN
			SELECT 'Inserted is failed. Such dialog of these owner and interlocitor already exists.'
			ALTER TABLE [dbo].[Dialog] CHECK CONSTRAINT [FK_Dialog_DialogMessage_LastDialogMessageId_DialogMessageId]
			ROLLBACK TRANSACTION [Transaction_InsertPairsOfDialog]
		END


		DECLARE @insertedDialogMessageId INT;
		EXECUTE @insertedDialogMessageId = [dbo].[DialogMessage_InsertDialogMessage] @authorId=@insertedOwnerId, @text='',@readStatus='UNREAD', @notRelevant = 1;

		IF (@@error <> 0)
        BEGIN 
			SELECT 'Inserted is failed. Insert dialog message is impossible'
			ALTER TABLE [dbo].[Dialog] CHECK CONSTRAINT [FK_Dialog_DialogMessage_LastDialogMessageId_DialogMessageId]
			ROLLBACK TRANSACTION [Transaction_InsertPairsOfDialog]
		END

		IF(NOT EXISTS(SELECT * FROM Dialog WHERE OwnerId=@insertedOwnerId AND InterlocutorId=@insertedInterlocutorId))
		BEGIN
			INSERT INTO [dbo].[Dialog]
			   ([OwnerId]
			   ,[InterlocutorId]
			   ,[LastDialogMessageId]
			   ,[CreationDate]
			   ,[ModificationDate]
			   ,[NotRelevant])
			VALUES
			   (@insertedOwnerId
			   ,@insertedInterlocutorId
			   ,@insertedDialogMessageId
			   ,getdate()
			   ,getdate()
			   ,0)
		END	

		IF (@@error <> 0)
        BEGIN 
			SELECT 'Inserted is failed. Insert owner dialog is failed'
			ALTER TABLE [dbo].[Dialog] CHECK CONSTRAINT [FK_Dialog_DialogMessage_LastDialogMessageId_DialogMessageId]
			ROLLBACK TRANSACTION [Transaction_InsertPairsOfDialog]
		END

		IF(NOT EXISTS(SELECT * FROM Dialog WHERE OwnerId=@insertedInterlocutorId AND InterlocutorId=@insertedOwnerId))
		BEGIN
			INSERT INTO [dbo].[Dialog]
			   ([OwnerId]
			   ,[InterlocutorId]
			   ,[LastDialogMessageId]
			   ,[CreationDate]
			   ,[ModificationDate]
			   ,[NotRelevant])
			VALUES
			   (@insertedInterlocutorId
			   ,@insertedOwnerId
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
		END
		
	COMMIT TRANSACTION [Transaction_InsertPairsOfDialog]

GO


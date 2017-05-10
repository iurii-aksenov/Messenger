USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Trigger for updating not relevant
-- =============================================
CREATE TRIGGER [dbo].[TriggerAfter_DialogMessage_UpdateDialogMessage]
    ON [dbo].[DialogMessage] AFTER UPDATE
AS 
BEGIN

	DECLARE @updatedDialogMessageId INT;
	DECLARE @updatedDialogMessageTextId INT;
	DECLARE @updatedNotRelevant BIT;

	SET @updatedDialogMessageId  = (SELECT TOP(1) DialogMessageId FROM deleted)
	SET @updatedDialogMessageTextId  = (SELECT TOP(1) DialogMessageTextId FROM deleted)
	SET @updatedNotRelevant  = (SELECT TOP(1) NotRelevant FROM deleted)

	UPDATE [dbo].[DialogMessageText]
	SET [NotRelevant] = @updatedNotRelevant
	WHERE DialogMessageTextId  = @updatedDialogMessageTextId

END
GO

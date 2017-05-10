USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Update instance of dialog into Dialog table
-- =============================================
CREATE PROCEDURE [dbo].[Dialog_UpdateDialog] 
	@dialogId INT,
	@ownerId INT,
    @interlocutorId INT,
    @lastDialogMessageId INT,
    @creationDate DATETIME,
    @notRelevant BIT = 0
AS
BEGIN
	UPDATE [dbo].[Dialog]
	   SET [OwnerId] = @ownerId
		  ,[InterlocutorId] = @interlocutorId
		  ,[LastDialogMessageId] = @lastDialogMessageId
		  ,[CreationDate] = @creationDate
		  ,[ModificationDate] = getdate()
		  ,[NotRelevant] = @notRelevant
	 WHERE DialogId = @dialogId

	IF (@@ERROR <> 0)
	BEGIN
		PRINT 
			N'Updating dialog is failed.' +
			ERROR_MESSAGE()
		RETURN -1;
	END

	PRINT 'Updating dialog is ok.';

	RETURN 0;
END
GO

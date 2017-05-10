USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Update instance of dialog message from DialogMessage table
-- =============================================
CREATE PROCEDURE [dbo].[DialogMessage_UpdateDialogMessage]
	@dialogMessageId INT,
	@authorId INT,
    @dialogMessageTextId INT,
    @readStatus VARCHAR(6),
    @previousDialogMessageId INT,
    @creationDate DATETIME,
    @notRelevant BIT
AS
BEGIN
	UPDATE [dbo].[DialogMessage]
	SET [AuthorId] = @authorId
      ,[DialogMessageTextId] = @dialogMessageTextId
      ,[ReadStatus] = @readStatus
      ,[PreviousDialogMessageId] = @previousDialogMessageId
      ,[CreationDate] = @creationDate
      ,[ModificationDate] = getdate()
      ,[NotRelevant] = @notRelevant
	WHERE DialogMessageId = @dialogMessageId
	
	IF (@@ERROR <> 0)
		BEGIN
		PRINT 
			N'Updating dialog message is failed.' +
			ERROR_MESSAGE()
		RETURN -1
		END
	PRINT 'Updating dialog message is ok.'
	RETURN 0
END
GO

USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Delete instance of dialog message from DialogMessage table
-- =============================================
CREATE PROCEDURE [dbo].[DialogMessage_DeleteDialogMessage]
	@dialogMessageId INT
AS
BEGIN
	DELETE FROM [dbo].[DialogMessage]
      WHERE DialogMessageId = @dialogMessageId
	
	IF (@@ERROR <> 0)
	BEGIN
		PRINT 
			N'Deleting dialog message is failed.' +
			ERROR_MESSAGE()
		RETURN -1
	END

	PRINT 'Deleting dialog message is ok.'
	RETURN 0
END
GO

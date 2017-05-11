USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Delete instance of dialog message text from DialogMessageText table
-- =============================================
CREATE PROCEDURE [dbo].[DialogMessageText_DeleteDialogMessageText]
	@dialogMessageTextId INT
AS
BEGIN
	DELETE FROM [dbo].[DialogMessageText]
      WHERE DialogMessageTextId = @dialogMessageTextId
	
	IF (@@ERROR <> 0)
		BEGIN
		PRINT 
			N'Deleting dialog message text is failed.' +
			ERROR_MESSAGE()
		RETURN -1
		END
	PRINT 'Deleting dialog message text is ok.'
	RETURN 0
END
GO

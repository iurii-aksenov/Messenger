USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Delete instance of dialog from Dialog table
-- =============================================
CREATE PROCEDURE [dbo].[Dialog_DeleteDialog]
	@dialogId INT
AS
BEGIN
	DELETE FROM [dbo].[Dialog]
      WHERE DialogId = @dialogId
	

	IF (@@ERROR <> 0)
		BEGIN
		PRINT 
			N'Deleting dialog is failed.' +
			ERROR_MESSAGE()
		RETURN -1
		END
	PRINT 'Deleting dialog is ok.'
	RETURN 0
END
GO

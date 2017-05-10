USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Delete instance of list in List table
-- =============================================
CREATE PROCEDURE [dbo].[List_DeleteList] 
	@listId INT
AS
BEGIN
	DELETE FROM [dbo].[List]
      WHERE ListId = @listId

	IF (@@ERROR <> 0)
		BEGIN
		PRINT 
			N'Deleting list is failed.' +
			ERROR_MESSAGE()
		RETURN -1
		END
	PRINT 'Deleting list is ok.'
	RETURN 0
END
GO

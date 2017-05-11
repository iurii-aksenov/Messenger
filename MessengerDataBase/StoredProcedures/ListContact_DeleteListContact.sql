USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Delete instance of listContact in ListContact table
-- =============================================
CREATE PROCEDURE [dbo].[ListContact_DeleteListContact] 
	@listContactId INT
AS
BEGIN
	DELETE FROM [dbo].[ListContact]
      WHERE ListContactId = @listContactId

	IF (@@ERROR <> 0)
		BEGIN
		PRINT 
			N'Deleting list contact is failed.' +
			ERROR_MESSAGE()
		RETURN -1
		END
	PRINT 'Deleting list contact is ok.'
	RETURN 0
END
GO

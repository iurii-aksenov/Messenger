USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Delete contact from Contact table be ContactId
-- =============================================
CREATE PROCEDURE [dbo].[Contact_DeleteContact]
	@contactId INT
AS
BEGIN
	DELETE FROM [dbo].[Contact]
      WHERE ContactId=@contactId

	SELECT 1 AS isDeleted;
	IF (@@ERROR <> 0)
	BEGIN
		PRINT 
			N'Deleting contact is failed.' +
			ERROR_MESSAGE()
		SELECT -1 AS 'Deleting contact is failed.'
		RETURN -1
	END

	PRINT 'Deleting contact is ok'
	SELECT 0 AS 'Deleting contact is ok'
	RETURN 0;
END
GO

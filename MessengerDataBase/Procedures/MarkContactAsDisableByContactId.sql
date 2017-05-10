USE [MessengerDb]
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 25.04.2017
-- Description:	Mark contact as diasable
-- =============================================
CREATE PROCEDURE [dbo].[MarkContactAsDisableByContactId] 
	(
	@contactId INT
	)
AS
BEGIN

	IF (NOT EXISTS(SELECT * FROM Contact WHERE ContactId=@contactId)) 
	BEGIN 
	;THROW 51000, 'Such contact does not exist. Check entering Id.',1; 
	END

	UPDATE Contact
	SET [Disable] = 1
	WHERE ContactId = @contactId;
	
END
GO

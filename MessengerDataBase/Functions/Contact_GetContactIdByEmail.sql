USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 26.04.2017
-- Description:	Get ContactId by Email address
-- =============================================
CREATE FUNCTION [dbo].[Contact_GetContactIdByEmail]
(	
	@email VARCHAR(60)
)
RETURNS INT
AS
BEGIN
	DECLARE @contactId INT = (SELECT TOP(1) ContactId FROM Contact WHERE Email = @email);
	RETURN (@contactId)
END
GO


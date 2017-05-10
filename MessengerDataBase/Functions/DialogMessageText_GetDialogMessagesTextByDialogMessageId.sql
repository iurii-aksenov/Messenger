USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 10.05.2017
-- Description:	Get dialog message next by DialogMessageId
-- =============================================
CREATE FUNCTION [dbo].[DialogMessageText_GetDialogMessagesTextByDialogMessageId] 
(
	@dialogMessageId INT
)
RETURNS NVARCHAR(2500)
AS
BEGIN
	RETURN (SELECT TOP(1) Text FROM DialogMessageText 
	WHERE 	DialogMessageTextId = 
		(SELECT TOP(1) DialogMessageTextId FROM DialogMessage WHERE DialogMessageId = @dialogMessageId))
END
GO
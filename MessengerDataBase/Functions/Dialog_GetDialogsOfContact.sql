USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 10.05.2017
-- Description:	Get dialogs of contact
-- =============================================
CREATE FUNCTION [dbo].[Dialog_GetDialogsOfContact] 
(
	@contactId INT
)
RETURNS 
@dialogsTable TABLE 
(
	[DialogId] INT,
	[OwnerId] INT,
	[InterlocutorId] INT,
	[LastDialogMessageId] INT,
	[CreationDate] DATETIME,
	[ModificationDate] DATETIME,
	[NotRelevant] BIT
)
AS
BEGIN
	INSERT @dialogsTable 
	SELECT [DialogId],	[OwnerId],	[InterlocutorId],	[LastDialogMessageId],	[CreationDate],	[ModificationDate],	[NotRelevant] 
	FROM Dialog WHERE OwnerId = @contactId
	RETURN 
END
GO
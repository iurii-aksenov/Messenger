USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 10.05.2017
-- Description:	Get dialog messages of contact
-- =============================================
CREATE FUNCTION [dbo].[DialogMessage_GetDialogMessagesOfContact] 
(
	@dialogId INT
)
RETURNS 
@dialogMessagesTable TABLE 
(
	[DialogMessageId] INT,
	[AuthorId] INT,
	[DialogMessageTextId] INT,
	[ReadStatus] VARCHAR(6),
	[PreviousDialogMessageId] INT,
	[CreationDate] DATETIME,
	[ModificationDate] DATETIME,
	[NotRelevant] BIT
)
AS
BEGIN
	DECLARE @lastDialogMessageId INT = (SELECT TOP(1) LastDialogMessageId FROM Dialog WHERE DialogId = @dialogId)

	INSERT @dialogMessagesTable 
	SELECT [DialogMessageId],	[AuthorId],	[DialogMessageTextId],	[ReadStatus],	[PreviousDialogMessageId],	[CreationDate],	[ModificationDate],	[NotRelevant] 
	FROM DialogMessage WHERE DialogMessageId = @lastDialogMessageId

	DECLARE @previousDialogMessageId INT = (SELECT TOP(1) PreviousDialogMessageId FROM DialogMessage WHERE DialogMessageId = @lastDialogMessageId);

	WHILE (@previousDialogMessageId IS NOT NULL)
	BEGIN
		INSERT @dialogMessagesTable SELECT [DialogMessageId],	[AuthorId],	[DialogMessageTextId],	[ReadStatus],	[PreviousDialogMessageId],	[CreationDate],	[ModificationDate],	[NotRelevant]  FROM DialogMessage WHERE DialogMessageId = @previousDialogMessageId
		SET @previousDialogMessageId  = (SELECT TOP(1) PreviousDialogMessageId FROM DialogMessage WHERE DialogMessageId = @previousDialogMessageId);
	END

	RETURN 
END
GO
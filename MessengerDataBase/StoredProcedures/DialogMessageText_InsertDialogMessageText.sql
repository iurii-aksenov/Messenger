USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Insert instance of dialog message text from DialogMessageText table
-- =============================================
CREATE PROCEDURE [dbo].[DialogMessageText_InsertDialogMessageText]
	@text NVARCHAR(2500),
	@creationDate DATETIME = NULL,
	@notRelevant BIT = 0
AS
BEGIN

	DECLARE @insertedDialogMessageTextId INT;

	IF (@creationDate IS NULL) BEGIN SET @creationDate = getdate() END

	INSERT INTO [dbo].[DialogMessageText]
           ([Text]
           ,[CreationDate]
           ,[NotRelevant])
     VALUES
           (@Text
           ,@CreationDate
           ,@NotRelevant)
	IF (@@ERROR <> 0)
	BEGIN
		PRINT 
			N'Inserting dialog is failed.' +
			ERROR_MESSAGE()
		RETURN -1
	END

	SET @insertedDialogMessageTextId = SCOPE_IDENTITY();
	SELECT @insertedDialogMessageTextId AS DialogMessageTextId
	RETURN @insertedDialogMessageTextId;
END
GO

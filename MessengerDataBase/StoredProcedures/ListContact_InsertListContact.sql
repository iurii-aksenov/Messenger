USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Insert instance of listContact in ListContact table
-- =============================================
CREATE PROCEDURE [dbo].[ListContact_InsertListContact] 
	@listId INT,
	@contactId INT,
	@creationDate DATETIME = NULL,
	@modificationDate DATETIME = NULL,
	@notRelevant BIT = 0
AS
BEGIN

	IF (@creationDate IS NULL) BEGIN SET @creationDate = getdate() END
	IF (@modificationDate IS NULL) BEGIN SET @modificationDate = getdate() END

	INSERT INTO [dbo].[ListContact]
           ([ListId]
		   ,[ContactId]
           ,[CreationDate]
           ,[ModificationDate]
           ,[NotRelevant])
     VALUES
           (@listId
		   ,@contactId
           ,@creationDate
           ,@modificationDate
           ,@notRelevant)

	IF (@@ERROR <> 0)
	BEGIN
		PRINT 
			N'Inserting listContact is failed.' +
			ERROR_MESSAGE()
		SELECT -1 AS 'Inserting listContact is failed.'
		RETURN -1
	END

	PRINT 
		N'Inserting listContact is ok.'
	SELECT 0 AS 'Inserting listContact is ok.'
	RETURN 0
END
GO

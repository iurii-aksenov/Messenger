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

	DECLARE @insertedLsitContactId INT = SCOPE_IDENTITY();
	SELECT @insertedLsitContactId AS LsitContactId;
	RETURN @insertedLsitContactId;
END
GO

USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Insert instance of list into List table
-- =============================================
CREATE PROCEDURE [dbo].[List_InsertList] 
	@title NVARCHAR(40),
	@comment NVARCHAR(250) = '',
    @creatorId INT,
    @creationDate DATETIME = NULL,
    @modificationDate DATETIME = NULL,
    @notRelevant BIT = 0
AS
BEGIN
	
	IF (@creationDate IS NULL) BEGIN SET @creationDate = getdate() END
	IF (@modificationDate IS NULL) BEGIN SET @modificationDate = getdate() END

	INSERT INTO [dbo].[List]
           ([Title]
           ,[Comment]
           ,[CreatorId]
           ,[CreationDate]
           ,[ModificationDate]
           ,[NotRelevant])
     VALUES
           (@title
           ,@comment
           ,@creatorId
           ,@creationDate
           ,@modificationDate
           ,@notRelevant)

	IF (@@ERROR <> 0)
	BEGIN
		PRINT 
		N'Inserting list is failed.' +
		ERROR_MESSAGE()
		SELECT -1 AS 'Inserting list is failed.'
		RETURN -1

	END

	PRINT 'Inserting list is ok.'
	--DECLARE @insertedListId INT;
	--SET @insertedListId =  SCOPE_IDENTITY();
	--SELECt @insertedListId AS LsitId;
	--RETURN @insertedListId;
	SELECT 1 AS 'Inserting list is ok.'
	RETURN 1
END
GO

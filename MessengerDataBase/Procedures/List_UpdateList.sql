-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Update instance of list in List table
-- =============================================
CREATE PROCEDURE [dbo].[List_UpdateList]
	@listId INT,
	@title NVARCHAR(40),
	@comment NVARCHAR(250),
    @creatorId INT,
    @notRelevant BIT
AS
BEGIN
	UPDATE [dbo].[List]
	SET [Title] = @title
      ,[Comment] = @comment
      ,[CreatorId] = @creatorId
      ,[ModificationDate] = getdate()
      ,[NotRelevant] = @notRelevant
	WHERE ListId = @listId

	IF (@@ERROR <> 0)
		BEGIN
		PRINT 
			N'Updating list is failed.' +
			ERROR_MESSAGE()
		SELECT -1 AS 'Updating list is failed.'
		RETURN -1
		END
	PRINT 'Updating list is ok.'
	SELECT 0 AS 'Updating list is failed.'
	RETURN 0
END
GO

USE [MessengerDb]
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 14.04.2017
-- Description:	Insert instance of contact into Contact table
-- =============================================
CREATE PROCEDURE [dbo].[Contact_InsertContact] 
	(@firstName NVARCHAR(40),
	@secondName NVARCHAR(40) = '',
	@middleName NVARCHAR(40) = '',
	@sex VARCHAR(5) = 'ANY',
	@birthDate DATETIME = NULL,
	@email VARCHAR(60),
	@phone VARCHAR(15) = '',
	@comment NVARCHAR(120)='',
	@creationDate DATETIME = NULL,
	@modificationDate DATETIME = NULL,
	@disable BIT = 0,
	@notRelevant BIT = 0
	)
AS
BEGIN

	IF (@creationDate IS NULL) BEGIN SET @creationDate = getdate() END
	IF (@modificationDate IS NULL) BEGIN SET @modificationDate = getdate() END

	INSERT INTO [dbo].[Contact]
           ([FirstName]
           ,[SecondName]
           ,[MiddleName]
           ,[Sex]
           ,[BirthDate]
           ,[Email]
           ,[Phone]
           ,[Comment]
           ,[CreationDate]
           ,[ModificationDate]
           ,[Disable]
           ,[NotRelevant])
     VALUES
           (@firstName
           ,@secondName
           ,@middleName
           ,@sex
           ,@birthDate
           ,@email
           ,@phone
           ,@comment
           ,@creationDate
           ,@modificationDate
           ,@disable
           ,@notRelevant)

	IF (@@ERROR <> 0)
	BEGIN
		PRINT 
			N'Inserting contact is failed.' +
			ERROR_MESSAGE()
		SELECT -1 AS 'Inserting contact is failed.'
		RETURN -1
	END

	PRINT 
			N'Inserting contact is ok.'
		SELECT 1 AS 'Inserting contact is ok.'
		RETURN 1
END	
GO



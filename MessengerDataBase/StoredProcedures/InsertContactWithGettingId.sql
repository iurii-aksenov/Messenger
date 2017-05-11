USE [MessengerDb]
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 25.04.2017
-- Description:	Insert data into Contact table
-- =============================================
CREATE PROCEDURE [dbo].[InsertContactWithGettingId] 
	(
	@contactId INT OUTPUT,
	@firstName NVARCHAR(40),
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

	IF (EXISTS(SELECT * FROM Contact WHERE Email=@email)) 
	BEGIN 
	;THROW 51000, 'Such email already exists!',1; 
	END

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

	SET @contactId = SCOPE_IDENTITY();
END
GO

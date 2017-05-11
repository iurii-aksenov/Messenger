USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Update contact in Contact table
-- =============================================
CREATE PROCEDURE [dbo].[Contact_UpdateContact]
	@contactId INT,
	@firstName NVARCHAR(40),
    @secondName NVARCHAR(40),
    @middleName NVARCHAR(40),
    @sex VARCHAR(5),
    @birthDate DATETIME,
    @email VARCHAR(60),
    @phone VARCHAR(15),
    @comment NVARCHAR(120),
    @disable BIT,
    @notRelevant BIT
AS
BEGIN
	UPDATE [dbo].[Contact]
	   SET [FirstName] = @firstName
		  ,[SecondName] = @secondName
		  ,[MiddleName] = @middleName
		  ,[Sex] = @sex
		  ,[BirthDate] = @birthDate
		  ,[Email] = @email
		  ,[Phone] = @phone
		  ,[Comment] = @comment
		  ,[ModificationDate] = GETDATE()
		  ,[Disable] = @disable
		  ,[NotRelevant] = @notRelevant
	 WHERE ContactId = @contactId

	IF (@@ERROR <> 0)
	BEGIN
	PRINT 
		N'Updating contact is failed.' +
		ERROR_MESSAGE()
	SELECT -1 AS 'Updating contact is failed.'
	RETURN -1
	END

	PRINT 'Updating contact is ok.' 
	SELECT 0 AS 'Updating contact is ok.'
	RETURN 0	
END
GO

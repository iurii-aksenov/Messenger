USE MessengerDb
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 07.05.2017
-- Description:	Update contact in Contact table
-- =============================================
CREATE PROCEDURE [dbo].[Contact_UpdateContact]
	@contactId INT,
	@firstName nvarchar(40),
    @secondName nvarchar(40),
    @middleName nvarchar(40),
    @sex varchar(5),
    @birthDate datetime,
    @email varchar(60),
    @phone varchar(15),
    @comment nvarchar(120),
    @disable bit,
    @notRelevant bit
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
		  ,[ModificationDate] = getdate()
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

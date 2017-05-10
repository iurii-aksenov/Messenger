USE [MessengerDb]
GO
-- =============================================
-- Author:		YURIY AKSENOV
-- Create date: 14.04.2017
-- Description:	Insert unparsing string data into Contact table. The format of Insert String is 
--				[FirstName],[SecondName],[MiddleName],[Sex],[BirthDate],[Email],[Phone],[Comment],[CreationDate],[ModificationDate],[Disable],[NotRelevant]
-- =============================================
ALTER PROCEDURE [dbo].[InsertContactUnparsingString] 
	(@insertString NVARCHAR (500) ='',
	@separator CHAR = ',')
AS
BEGIN

DECLARE	@firstName NVARCHAR(40);
DECLARE	@secondName NVARCHAR(40);
DECLARE	@middleName NVARCHAR(40);
DECLARE	@sex VARCHAR(5);
DECLARE	@birthDate DATETIME;
DECLARE	@email VARCHAR(60);
DECLARE	@phone VARCHAR(15);
DECLARE	@comment NVARCHAR(120);
DECLARE	@creationDate DATETIME;
DECLARE	@modificationDate DATETIME;
DECLARE	@disable BIT;
DECLARE	@notRelevant BIT;

SET	@firstName = NULL;
SET	@secondName = '';
SET	@middleName = '';
SET	@sex = 'ANY';
SET	@birthDate = NULL;
SET	@email = NULL;
SET	@phone  = '';
SET	@comment ='';
SET	@creationDate = NULL;
SET	@modificationDate = NULL;
SET	@disable = 0;
SET	@notRelevant = 0;


DECLARE @stringLength INT;
DECLARE @currentPosition INT;
DECLARE @nextPosition INT;


SET @stringLength = LEN(@insertString);
SET @currentPosition = 0;

WHILE @currentPosition <= @stringLength
BEGIN
	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	DECLARE @_firstName NVARCHAR(60) = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);
	IF(@_firstName = '') BEGIN PRINT 'FirstName does not exist'; THROW 51000, 'The firstName does not exist.', 16;  END ELSE BEGIN SET @firstName = @_firstName END

	SET @currentPosition = @nextPosition + 1;

	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	SET @secondName = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);

	SET @currentPosition = @nextPosition + 1;

	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	SET @middleName = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);

	SET @currentPosition = @nextPosition + 1;

	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	SET @sex = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);

	SET @currentPosition = @nextPosition + 1;

	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	DECLARE @_birthDate NVARCHAR(25) = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);
	IF(@_birthDate = '') BEGIN SET @birthDate = NULL END ELSE BEGIN SET @birthDate = CAST(@_birthDate AS DATETIME) END

	SET @currentPosition = @nextPosition + 1;

	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	DECLARE @_email NVARCHAR(60) = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);
	IF(@_email = '') BEGIN PRINT 'Email does not exist'; THROW 51000, 'The e-mail does not exist.', 16;  END ELSE BEGIN SET @email = @_email END

	SET @currentPosition = @nextPosition + 1;

	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	SET @phone = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);

	SET @currentPosition = @nextPosition + 1;

	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	SET @comment = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);

	SET @currentPosition = @nextPosition + 1;

	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	DECLARE @_creationDate NVARCHAR(25) = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);
	IF(@_creationDate = '' OR @_creationDate IS NULL) BEGIN SET @creationDate = getdate(); END ELSE BEGIN SET @creationDate = @_creationDate END

	SET @currentPosition = @nextPosition + 1;

	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	DECLARE @_modificationDate NVARCHAR(25) = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);
	IF(@_modificationDate = '' OR @_modificationDate IS NULL) BEGIN SET @modificationDate = getdate(); END ELSE BEGIN SET @modificationDate = @_modificationDate END

	SET @currentPosition = @nextPosition + 1;

	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	DECLARE @_disable NVARCHAR(25) = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);
	IF(@_disable = '') BEGIN SET @disable = 0; END ELSE BEGIN SET @disable = CAST(@_disable AS BIT) END

	SET @currentPosition = @nextPosition + 1;

	SET @nextPosition = CHARINDEX(@separator, @insertString, @currentPosition)
	IF (@nextPosition = 0) BEGIN SET @nextPosition = @stringLength + 1 END
	DECLARE @_notRelevant NVARCHAR(25) = SUBSTRING(@insertString, @currentPosition, @nextPosition - @currentPosition);
	IF(@_notRelevant = '') BEGIN SET @notRelevant = 0; END ELSE BEGIN SET @notRelevant = CAST(@_notRelevant AS BIT) END
	
	BEGIN TRY
		EXECUTE [dbo].[InsertContact] @firstName = @firstName, @secondName = @secondName, @middleName = @middleName, @sex = @sex, @birthDate = @birthDate, @email = @email, @phone = @phone, @comment = @comment, @creationDate = @creationDate, @modificationDate = @modificationDate, @disable = @disable, @notRelevant = @notRelevant;
	END TRY
	BEGIN CATCH
		PRINT 'EXEPTION DURING INSERT STRING'
	END CATCH

	SET @currentPosition = @nextPosition + 1;

END
	
END
GO

--EXECUTE [dbo].InsertContactUnparsingString @insertString = '12345,12345,12345,woman,,,,,,,,,'


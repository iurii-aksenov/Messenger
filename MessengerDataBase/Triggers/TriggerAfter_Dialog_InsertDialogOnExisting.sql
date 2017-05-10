USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Trigger for checking the inserting dialog on already existing.
-- =============================================
CREATE TRIGGER [dbo].[TriggerAfter_Dialog_InsertDialogOnExisting]
    ON [dbo].[Dialog] AFTER INSERT
AS 
BEGIN

	DECLARE @insertedOwnerId INT;
	DECLARE @insertedInterlocutorId INT;

	SET @insertedOwnerId = (SELECT TOP(1) OwnerId FROM inserted);
	SET @insertedInterlocutorId = (SELECT TOP(1) InterlocutorId FROM inserted);

	IF(((SELECT COUNT(*) FROM Dialog WHERE OwnerId=@insertedOwnerId AND InterlocutorId=@insertedInterlocutorId) > 1) AND (@insertedOwnerId != @insertedInterlocutorId))
	BEGIN
		PRINT 'Such Dialog row has existed already'
		ROLLBACK TRANSACTION
	END
	IF(((SELECT COUNT(*) FROM Dialog WHERE OwnerId=@insertedOwnerId AND InterlocutorId=@insertedInterlocutorId) > 2) AND (@insertedOwnerId = @insertedInterlocutorId))
	BEGIN
		PRINT 'Such Dialog row has existed already'
		ROLLBACK TRANSACTION
	END
END
GO

USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Trigger for checking the inserting list on already existing.
-- =============================================
CREATE TRIGGER [dbo].[TriggerAfter_List_InsertListOnExisting]
    ON [dbo].[List] AFTER INSERT
AS 
BEGIN

	DECLARE @insertedTitle NVARCHAR(40);
	DECLARE @insertedCreatorId INT;
	


	SET @insertedTitle = (SELECT TOP(1) Title FROM inserted);
	SET @insertedCreatorId = (SELECT TOP(1) CreatorId FROM inserted);

	IF((SELECT COUNT(*) FROM List WHERE Title=@insertedTitle AND CreatorId=@insertedCreatorId)>1)
	BEGIN
		PRINT 'Such list row already exists'
		ROLLBACK TRANSACTION
	END
END
GO


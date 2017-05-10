USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Trigger for deleting any list from List. Then all conecttive listcontacts will be deleted too.
-- =============================================

CREATE TRIGGER [dbo].[TriggerInsteadOf_List_DeleteList]
    ON [dbo].[List] INSTEAD OF DELETE
AS 
BEGIN
    DECLARE @deletedListId INT;
	SET @deletedListId = (SELECT TOP(1) ListId FROM deleted);
	
	DELETE FROM [dbo].[ListContact]
      WHERE ListId = @deletedListId

	DELETE FROM [dbo].[List]
	WHERE ListId = @deletedListId
END
GO
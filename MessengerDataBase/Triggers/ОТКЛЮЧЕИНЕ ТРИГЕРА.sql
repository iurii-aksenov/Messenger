ALTER TABLE [dbo].[Contact]
DISABLE TRIGGER [TriggerInsteadOf_Contact_DeleteContact]
GO

ALTER TABLE [dbo].[List]
DISABLE TRIGGER [TriggerInsteadOf_List_DeleteList]
GO

ALTER TABLE [dbo].[Dialog]
DISABLE TRIGGER [TriggerInsteadOf_Dialog_InsertDialog_WithTransaction]
GO 

ALTER TABLE [dbo].[Contact]
DISABLE TRIGGER [TriggerInsteadOf_Contact_DeleteContact] 
GO

ALTER TABLE [dbo].[ListContact]
DISABLE TRIGGER [TriggerAfter_ListContact_InsertListContactOnExisting]
GO

ALTER TABLE [dbo].[ListContact]
DISABLE TRIGGER [TriggerAfter_ListContact_InsertListContact]
GO

ALTER TABLE [dbo].[List]
DISABLE TRIGGER [TriggerAfter_List_InsertListOnExisting]
GO

--ALTER TABLE [dbo].[DialogMessage]
--DISABLE TRIGGER [TriggerAfter_DialogMessage_UpdateDialogMessage]
--GO

ALTER TABLE [dbo].[Dialog]
DISABLE TRIGGER [TriggerAfter_Dialog_InsertDialogOnExisting]
GO 

ALTER TABLE [dbo].[Dialog]
DISABLE TRIGGER [TriggerAfter_Dialog_InsertDialog]
GO  

ALTER TABLE [dbo].[Contact]
DISABLE TRIGGER [TriggerAfter_Contact_InsertContact]
GO
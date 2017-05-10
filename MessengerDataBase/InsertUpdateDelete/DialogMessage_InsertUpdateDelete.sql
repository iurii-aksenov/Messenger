USE [MessengerDb]
GO
SET IDENTITY_INSERT [dbo].[DialogMessageText] ON
GO
INSERT INTO [dbo].[DialogMessage]
([DialogMessageId],[AuthorId],[DialogMessageTextId],[PreviousDialogMessageId],[CreationDate],[ModificationDate])VALUES
 (1, 1, 1, NULL, '20170510,20170510')
,(2, 2, 2, 1, '20170510,20170510')
,(3, 1, 3, 2, '20170510,20170510')
GO
SET IDENTITY_INSERT [dbo].[DialogMessageText] OFF
GO


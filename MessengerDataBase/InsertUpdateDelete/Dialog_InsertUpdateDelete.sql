USE [MessengerDb]
GO
SET IDENTITY_INSERT [dbo].[Dialog] ON
GO
INSERT INTO [dbo].[Dialog]
([DialogId],[OwnerId],[InterlocutorId],[LastDialogMessageId],[CreationDate],[ModificationDate])VALUES
(1, 1, 2, 3, '20170510','20170510')
,(2, 2, 1 ,3, '20170510','20170510')
GO


SET IDENTITY_INSERT [dbo].[Dialog] OFF
GO
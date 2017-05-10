GO
EXECUTE [dbo].[Dialog_InsertDialog] @ownerId=45, @interlocutorId=45;
GO
EXECUTE [dbo].[DialogMessage_InsertDialogMessage] @authorId=45,@text='Hello',@dialogId=6;
GO

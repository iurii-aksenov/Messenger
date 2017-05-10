USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Index for Dialog on OwnerId and InterlocutorId
-- =============================================
CREATE INDEX [Index_Dialog_OwnerIdAndInterlocutorId]
    ON [dbo].[Dialog](OwnerId, InterlocutorId);
GO

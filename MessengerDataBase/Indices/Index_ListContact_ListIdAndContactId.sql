USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Index for ListContact on ListId and ContactId
-- =============================================
CREATE INDEX [Index_ListContact_ListIdAndContactId]
    ON [dbo].[ListContact](ListId, ContactId);
GO
USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Index for List on Title and CreatorId
-- =============================================
CREATE INDEX [Index_List_TitleAndCreatorId]
    ON [dbo].[List](Title, CreatorId);
GO
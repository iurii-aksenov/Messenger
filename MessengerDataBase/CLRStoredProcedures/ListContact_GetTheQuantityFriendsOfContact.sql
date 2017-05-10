USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Assembly CLRStoredProcedures count the number of contact friends
-- =============================================
CREATE PROCEDURE [dbo].[ListContact_GetTheQuantityFriendsOfContact]
(
	@contactId INT
)
AS EXTERNAL NAME CLRStoredProcedures.StoredProcedures.CountFriendsOfContact 


USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Assembly CLRStoredProcedures count the number of contact friends
-- =============================================
CREATE FUNCTION [dbo].[ListContact_GetTheQuantityFriendsOfContact](@contactId INT)
RETURNS INT
AS EXTERNAL NAME CLRStoredProcedures.StoredProcedures.CountFriendsOfContact 
GO

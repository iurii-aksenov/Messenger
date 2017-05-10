USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 07.05.2017
-- Description:	Get friend of contact by ContactId
-- =============================================
CREATE FUNCTION [dbo].[GetFriendsByContactId]
(	
	@contactId INT
)
RETURNS @friendsTable TABLE(
	[ContactId] INT,
	[FirstName] NVARCHAR(40),
	[SecondName] NVARCHAR(40),
	[MiddleName] NVARCHAR(40),
	[Sex] VARCHAR(5),
	[BirthDate] DATETIME,
	[Email] VARCHAR(60),
	[Phone] VARCHAR(15),
	[Comment] NVARCHAR(120),
	[CreationDate] DATETIME,
	[ModificationDate] DATETIME,
	[Disable] BIT,
	[NotRelevant] BIT
)
AS
RETURN 
(
	
	select 0
)
GO

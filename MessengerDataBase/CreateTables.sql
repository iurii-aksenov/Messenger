CREATE DATABASE MessengerDb
GO

USE [MessengerDb]
GO

----------------------------------------------------------------
--////////////////////////////////////////////////////////////--
----------------------------------------------------------------

----------------CREATE TABLES----------------


----------------CONTACT PART----------------

--TABLE Contact

CREATE TABLE [dbo].[Contact] (
	[ContactId] INT IDENTITY (1,1),
	[FirstName] NVARCHAR(40) NOT NULL,
	[SecondName] NVARCHAR(40) NOT NULL DEFAULT(''),
	[MiddleName] NVARCHAR(40) NOT NULL DEFAULT(''),
	[Sex] VARCHAR(5) NOT NULL DEFAULT('ANY'),
	[BirthDate] DATETIME NULL DEFAULT(NULL),
	[Email] VARCHAR(60) NOT NULL DEFAULT(''),
	[Phone] VARCHAR(15) NOT NULL,
	[Password] VARCHAR(15) NOT NULL,
	[CreationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[ModificationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[Disable] BIT NOT NULL DEFAULt(0),
	[NotRelevant] BIT NOT NULL DEFAULt(0),
	[RowVersion] TIMESTAMP NOT NULL,
	CONSTRAINT PK_Contact_ContactId PRIMARY KEY CLUSTERED (ContactId)
)
GO

----------------LSIT PART----------------

--TABLE ListContact

CREATE TABLE [dbo].[ListContact] (
	[ListContactId] INT IDENTITY (1,1),
	[ListId] INT NOT NULL,
	[ContactId] INT NOT NULL,
	[CreationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[ModificationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[NotRelevant] BIT NOT NULL DEFAULt(0),
	[RowVersion] TIMESTAMP NOT NULL,
	CONSTRAINT PK_ListContact_ListContactId PRIMARY KEY CLUSTERED (ListContactId)
)
GO

--TABLE List

CREATE TABLE [dbo].[List] (
	[ListId] INT IDENTITY (1,1),
	[Title] NVARCHAR(40) NOT NULL,
	[Comment] NVARCHAR(100) NOT NULL DEFAULT(''),
	[CreatorId] INT NOT NULL,
	[CreationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[ModificationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[NotRelevant] BIT NOT NULL DEFAULt(0),
	[RowVersion] TIMESTAMP NOT NULL,
	CONSTRAINT PK_List_ListId PRIMARY KEY CLUSTERED (ListId)
)
GO

----------------DIALOG PART----------------

--TABLE Dialog

CREATE TABLE [dbo].[Dialog] (
	[DialogId] INT IDENTITY (1,1),
	[OwnerId] INT NOT NULL,
	[InterlocutorId] INT NOT NULL,
	[LastDialogMessageId] INT NOT NULL,
	[CreationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[ModificationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[NotRelevant] BIT NOT NULL DEFAULt(0),
	[RowVersion] TIMESTAMP NOT NULL,
	CONSTRAINT PK_Dialog_DialogId PRIMARY KEY CLUSTERED (DialogId)
)
GO


--TABLE DialogMessage

CREATE TABLE [dbo].[DialogMessage] (
	[DialogMessageId] INT IDENTITY (1,1),
	[AuthorId] INT NOT NULL,
	[DialogMessageTextId] INT NOT NULL,
	[ReadStatus] VARCHAR(6)  NOT NULL DEFAULT('UNREAD'),
	[PreviousDialogMessageId] INT NULL,
	[CreationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[ModificationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[NotRelevant] BIT NOT NULL DEFAULt(0),
	[RowVersion] TIMESTAMP NOT NULL,
	CONSTRAINT PK_DialogMessage_DialogMessageId PRIMARY KEY CLUSTERED (DialogMessageId)
)
GO

--TABLE DialogMessageText

CREATE TABLE [dbo].[DialogMessageText] (
	[DialogMessageTextId] INT IDENTITY(1,1),
	[Text] NVARCHAR(2500) NOT NULL DEFAULT(''),
	[CreationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[ModificationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[NotRelevant] BIT NOT NULL DEFAULt(0),
	[RowVersion] TIMESTAMP NOT NULL,
	CONSTRAINT PK_DialogMessageText_DialogMessageTextId PRIMARY KEY CLUSTERED (DialogMessageTextId)
)
GO

----------------CONVERSATION PART----------------

--TABLE Conversation

CREATE TABLE [dbo].[Conversation] (
	[ConversationId] INT IDENTITY(1,1),
	[Title] NVARCHAR(40) NOT NULL,
	[CreatorId] INT NOT NULL,
	[LastConversationMessageId] INT NOT NULL,
	[CreationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[ModificationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[NotRelevant] BIT NOT NULL DEFAULt(0),
	[RowVersion] TIMESTAMP NOT NULL,
	CONSTRAINT PK_Conversation_ConversationId PRIMARY KEY CLUSTERED (ConversationId)
)
GO

--TABLE ConversationParticipant

CREATE TABLE [dbo].[ConversationParticipant] (
	[ConversationParticipantId] INT IDENTITY(1,1),
	[ConversationId] INT NOT NULL,
	[ParticipantId] INT NOT NULL,
	[CreationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[NotRelevant] BIT NOT NULL DEFAULt(0),
	[RowVersion] TIMESTAMP NOT NULL,
	CONSTRAINT PK_ConversationParticipant_ConversationParticipantId PRIMARY KEY CLUSTERED (ConversationParticipantId)
)
GO

--TABLE ConversationMessage

CREATE TABLE [dbo].[ConversationMessage] (
	[ConversationMessageId] INT IDENTITY(1,1),
	[AuthorId] INT NOT NULL,
	[ConversationMessageTextId] INT NOt NULL,
	[PreviousConversationMessageId] INT NOt NULL,
	[CreationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[ModificationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[NotRelevant] BIT NOT NULL DEFAULt(0),
	[RowVersion] TIMESTAMP NOT NULL,
	CONSTRAINT PK_ConversationMessage_ConversationMessageId PRIMARY KEY CLUSTERED (ConversationMessageId)
)
GO

--TABLE ConversationMessageText

CREATE TABLE [dbo].[ConversationMessageText] (
	[ConversationMessageTextId] INT IDENTITY(1,1),
	[Text] NVARCHAR(2500),
	[CreationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[NotRelevant] BIT NOT NULL DEFAULt(0),
	[RowVersion] TIMESTAMP NOT NULL,
	CONSTRAINT PK_ConversationMessageText_ConversationMessageTextId PRIMARY KEY CLUSTERED (ConversationMessageTextId)
)
GO

--TABLE ConversationMessageReadState

CREATE TABLE [dbo].[ConversationMessageReadState] (
	[ConversationMessageReadStateId] INT IDENTITY(1,1),
	[ConversationMessageId] INT NOT NULL,
	[ContactId] INT NOT NULL,
	[CreationDate] DATETIME NOT NULL DEFAULT(getdate()),
	[NotRelevant] BIT NOT NULL DEFAULt(0),
	[RowVersion] TIMESTAMP NOT NULL,
	CONSTRAINT PK_ConversationMessageReadState_ConversationMessageReadStateId PRIMARY KEY CLUSTERED (ConversationMessageReadStateId)
)
GO


----------------------------------------------------------------
--////////////////////////////////////////////////////////////--
----------------------------------------------------------------

----------------CONSTRAINTS IN TABLES----------------


----------------CONTACT PART----------------

--TABLE Contact

ALTER TABLE  [dbo].[Contact] 
	ADD CONSTRAINT DF_Contact_Phone  UNIQUE ([Phone])
GO

----------------REFERENCIES IN TABLES----------------

----------------LIST PART----------------

-- TABLE ListContact

ALTER TABLE  [dbo].[ListContact] 
	WITH CHECK ADD CONSTRAINT FK_ListContact_List_ListId_ListId FOREIGN KEY (ListId) 
	REFERENCES [dbo].[List] (ListId)
GO
ALTER TABLE  [dbo].[ListContact] 
	WITH CHECK ADD CONSTRAINT FK_ListContact_Contact_ContactId_ContactId FOREIGN KEY (ContactId) 
	REFERENCES [dbo].[Contact] (ContactId)
GO

-- TABLE List

ALTER TABLE  [dbo].[List] 
	WITH CHECK ADD CONSTRAINT FK_List_Contact_CreatorId_ContactId FOREIGN KEY (CreatorId) 
	REFERENCES [dbo].[Contact] (ContactId)
GO

----------------DIALOG PART----------------

--TABLE Dialog

ALTER TABLE  [dbo].[Dialog] 
	WITH CHECK ADD CONSTRAINT FK_Dialog_Contact_OwnerId_ContactId FOREIGN KEY (OwnerId) 
	REFERENCES [dbo].[Contact] (ContactId)
GO

ALTER TABLE  [dbo].[Dialog] 
	WITH CHECK ADD CONSTRAINT FK_Dialog_Contact_InterlocutorId_ContactId FOREIGN KEY (InterlocutorId) 
	REFERENCES [dbo].[Contact] (ContactId)
GO

ALTER TABLE  [dbo].[Dialog] 
	WITH CHECK ADD CONSTRAINT FK_Dialog_DialogMessage_LastDialogMessageId_DialogMessageId FOREIGN KEY (LastDialogMessageId) 
	REFERENCES [dbo].[DialogMessage] (DialogMessageId)
GO

--TABLE DialogMessage

ALTER TABLE  [dbo].[DialogMessage] 
	WITH CHECK ADD CONSTRAINT FK_DialogMessage_Contact_AuthorId_ContactId FOREIGN KEY (AuthorId) 
	REFERENCES [dbo].[Contact] (ContactId)
GO

ALTER TABLE  [dbo].[DialogMessage] 
	WITH CHECK ADD CONSTRAINT FK_DialogMessage_DialogMessage_PreviousDialogMessageId_DialogMessageId FOREIGN KEY (PreviousDialogMessageId) 
	REFERENCES [dbo].[DialogMessage] (DialogMessageId)
GO

ALTER TABLE  [dbo].[DialogMessage] 
	WITH CHECK ADD CONSTRAINT FK_DialogMessage_DialogMessageText_DialogMessageTextId_DialogMessageTextId FOREIGN KEY (DialogMessageTextId) 
	REFERENCES [dbo].[DialogMessageText] (DialogMessageTextId)
GO

----------------CONVERSATION PART----------------

--TABLE Conversation

ALTER TABLE  [dbo].[Conversation] 
	WITH CHECK ADD CONSTRAINT FK_Conversation_ConversationMessage_LastConversationMessageId_ConversationMessageId FOREIGN KEY (LastConversationMessageId) 
	REFERENCES [dbo].[ConversationMessage] (ConversationMessageId)
GO

ALTER TABLE  [dbo].[Conversation] 
	WITH CHECK ADD CONSTRAINT FK_Conversation_Contact_CreatorId_ContactId FOREIGN KEY (CreatorId) 
	REFERENCES [dbo].[Contact] (ContactId)
GO

--TABLE ConversationParticipant

ALTER TABLE  [dbo].[ConversationParticipant] 
	WITH CHECK ADD CONSTRAINT FK_ConversationParticipant_Conversation_ConversationId_ConversationId FOREIGN KEY (ConversationId) 
	REFERENCES [dbo].[Conversation] (ConversationId)
GO

ALTER TABLE  [dbo].[ConversationParticipant] 
	WITH CHECK ADD CONSTRAINT FK_ConversationParticipant_Contact_ParticipantId_ContactId FOREIGN KEY (ParticipantId) 
	REFERENCES [dbo].[Contact] (ContactId)
GO

--TABLE ConversationMessage

ALTER TABLE  [dbo].[ConversationMessage] 
	WITH CHECK ADD CONSTRAINT FK_ConversationMessage_ConversationMessage_PreviousConversationMessageId_ConversationMessageId FOREIGN KEY (PreviousConversationMessageId) 
	REFERENCES [dbo].[ConversationMessage] (ConversationMessageId)
GO

ALTER TABLE  [dbo].[ConversationMessage] 
	WITH CHECK ADD CONSTRAINT FK_ConversationMessage_Contact_AuthorId_ContactId FOREIGN KEY (AuthorId) 
	REFERENCES [dbo].[Contact] (ContactId)
GO

ALTER TABLE  [dbo].[ConversationMessage] 
	WITH CHECK ADD CONSTRAINT FK_ConversationMessage_ConversationMessageText_ConversationMessageTextId_ConversationMessageTextId FOREIGN KEY (ConversationMessageTextId) 
	REFERENCES [dbo].[ConversationMessageText] (ConversationMessageTextId)
GO

--TABLE ConversationMessageReadState

ALTER TABLE [dbo].[ConversationMessageReadState]
	WITH CHECK ADD CONSTRAINT FK_ConversationMessageReadState_Contact_ContactId_ContactId FOREIGN KEY (ContactId)
	REFERENCES [dbo].[Contact] (ContactId)
GO

ALTER TABLE [dbo].[ConversationMessageReadState]
	WITH CHECK ADD CONSTRAINT FRK_ConversationMessageReadState_ConversationMessage_ConversationMessageId_ConversationMessageId FOREIGN KEY (ConversationMessageId)
	REFERENCES [dbo].[ConversationMessage] (ConversationMessageId)
GO


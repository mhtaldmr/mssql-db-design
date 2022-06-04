--TO CREATE THE TABLES YOU CAN RUN THIS QUERY

USE SocialNetworkDB;


-- SocialNetworkDB.dbo.GroupMessagesArchive definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.GroupMessagesArchive;

CREATE TABLE SocialNetworkDB.dbo.GroupMessagesArchive (
	Id int IDENTITY(1,1) NOT NULL,
	MessageId int NOT NULL,
	MessageBody nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	MessageTypeId int NOT NULL,
	UpdatedAt datetime2 NULL,
	CONSTRAINT PK_GroupMessagesArchive PRIMARY KEY (Id)
);


-- SocialNetworkDB.dbo.UserMessagesArchive definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.UserMessagesArchive;

CREATE TABLE SocialNetworkDB.dbo.UserMessagesArchive (
	Id int IDENTITY(1,1) NOT NULL,
	MessageId int NOT NULL,
	MessageBody nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	MessageTypeId int NOT NULL,
	UpdatedAt datetime2 NULL,
	CONSTRAINT PK_UserMessagesArchive PRIMARY KEY (Id)
);


-- SocialNetworkDB.dbo.Users definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.Users;

CREATE TABLE SocialNetworkDB.dbo.Users (
	Id int IDENTITY(1,1) NOT NULL,
	FirstName nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	LastName nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Email nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PasswordHash nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	RegisteredAt datetime2 NOT NULL,
	IsActive bit NOT NULL,
	CONSTRAINT PK_Users PRIMARY KEY (Id)
);


-- SocialNetworkDB.dbo.[__EFMigrationsHistory] definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.[__EFMigrationsHistory];

CREATE TABLE SocialNetworkDB.dbo.[__EFMigrationsHistory] (
	MigrationId nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ProductVersion nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK___EFMigrationsHistory PRIMARY KEY (MigrationId)
);


-- SocialNetworkDB.dbo.FriendshipRequests definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.FriendshipRequests;

CREATE TABLE SocialNetworkDB.dbo.FriendshipRequests (
	Id int IDENTITY(1,1) NOT NULL,
	RequestedAt datetime2 NOT NULL,
	UpdatedAt datetime2 NULL,
	SenderId int NOT NULL,
	ReceiverId int NOT NULL,
	CONSTRAINT PK_FriendshipRequests PRIMARY KEY (Id),
	CONSTRAINT FK_FriendshipRequests_Users_ReceiverId FOREIGN KEY (ReceiverId) REFERENCES SocialNetworkDB.dbo.Users(Id),
	CONSTRAINT FK_FriendshipRequests_Users_SenderId FOREIGN KEY (SenderId) REFERENCES SocialNetworkDB.dbo.Users(Id)
);
 CREATE NONCLUSTERED INDEX IX_FriendshipRequests_ReceiverId ON dbo.FriendshipRequests (  ReceiverId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_FriendshipRequests_SenderId ON dbo.FriendshipRequests (  SenderId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- SocialNetworkDB.dbo.Friendships definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.Friendships;

CREATE TABLE SocialNetworkDB.dbo.Friendships (
	Id int IDENTITY(1,1) NOT NULL,
	IsActive bit NOT NULL,
	CreatedAt datetime2 NOT NULL,
	UpdatedAt datetime2 NULL,
	SourceId int NOT NULL,
	TargetId int NOT NULL,
	CONSTRAINT PK_Friendships PRIMARY KEY (Id),
	CONSTRAINT FK_Friendships_Users_SourceId FOREIGN KEY (SourceId) REFERENCES SocialNetworkDB.dbo.Users(Id),
	CONSTRAINT FK_Friendships_Users_TargetId FOREIGN KEY (TargetId) REFERENCES SocialNetworkDB.dbo.Users(Id)
);
 CREATE NONCLUSTERED INDEX IX_Friendships_SourceId ON dbo.Friendships (  SourceId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_Friendships_TargetId ON dbo.Friendships (  TargetId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- SocialNetworkDB.dbo.Groups definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.Groups;

CREATE TABLE SocialNetworkDB.dbo.Groups (
	Id int IDENTITY(1,1) NOT NULL,
	Title nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Description nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CreatedAt datetime2 NOT NULL,
	UpdatedAt datetime2 NULL,
	AdminId int NOT NULL,
	CONSTRAINT PK_Groups PRIMARY KEY (Id),
	CONSTRAINT FK_Groups_Users_AdminId FOREIGN KEY (AdminId) REFERENCES SocialNetworkDB.dbo.Users(Id)
);
 CREATE NONCLUSTERED INDEX IX_Groups_AdminId ON dbo.Groups (  AdminId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- SocialNetworkDB.dbo.UserMessages definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.UserMessages;

CREATE TABLE SocialNetworkDB.dbo.UserMessages (
	Id int IDENTITY(1,1) NOT NULL,
	MessageBody nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	MessageTypeId int NOT NULL,
	CreatedAt datetime2 NOT NULL,
	UpdatedAt datetime2 NULL,
	SenderId int NOT NULL,
	ReceiverId int NOT NULL,
	CONSTRAINT PK_UserMessages PRIMARY KEY (Id),
	CONSTRAINT FK_UserMessages_Users_ReceiverId FOREIGN KEY (ReceiverId) REFERENCES SocialNetworkDB.dbo.Users(Id),
	CONSTRAINT FK_UserMessages_Users_SenderId FOREIGN KEY (SenderId) REFERENCES SocialNetworkDB.dbo.Users(Id)
);
 CREATE NONCLUSTERED INDEX IX_UserMessages_ReceiverId ON dbo.UserMessages (  ReceiverId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_UserMessages_SenderId ON dbo.UserMessages (  SenderId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- SocialNetworkDB.dbo.UserPosts definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.UserPosts;

CREATE TABLE SocialNetworkDB.dbo.UserPosts (
	Id int IDENTITY(1,1) NOT NULL,
	Post nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PostType int NOT NULL,
	CreatedAt datetime2 NOT NULL,
	UpdatedAt datetime2 NULL,
	UserId int NOT NULL,
	CONSTRAINT PK_UserPosts PRIMARY KEY (Id),
	CONSTRAINT FK_UserPosts_Users_UserId FOREIGN KEY (UserId) REFERENCES SocialNetworkDB.dbo.Users(Id)
);
 CREATE NONCLUSTERED INDEX IX_UserPosts_UserId ON dbo.UserPosts (  UserId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- SocialNetworkDB.dbo.UserPostsComments definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.UserPostsComments;

CREATE TABLE SocialNetworkDB.dbo.UserPostsComments (
	Id int IDENTITY(1,1) NOT NULL,
	Comment nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CommentTypeId int NOT NULL,
	UserId int NOT NULL,
	UserPostId int NOT NULL,
	CONSTRAINT PK_UserPostsComments PRIMARY KEY (Id),
	CONSTRAINT FK_UserPostsComments_UserPosts_UserPostId FOREIGN KEY (UserPostId) REFERENCES SocialNetworkDB.dbo.UserPosts(Id),
	CONSTRAINT FK_UserPostsComments_Users_UserId FOREIGN KEY (UserId) REFERENCES SocialNetworkDB.dbo.Users(Id)
);
 CREATE NONCLUSTERED INDEX IX_UserPostsComments_UserId ON dbo.UserPostsComments (  UserId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_UserPostsComments_UserPostId ON dbo.UserPostsComments (  UserPostId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- SocialNetworkDB.dbo.CommentTypes definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.CommentTypes;

CREATE TABLE SocialNetworkDB.dbo.CommentTypes (
	Id int IDENTITY(1,1) NOT NULL,
	CommentTypeId int NOT NULL,
	CommentTypeName nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_CommentTypes PRIMARY KEY (Id),
	CONSTRAINT FK_CommentTypes_UserPostsComments_CommentTypeId FOREIGN KEY (CommentTypeId) REFERENCES SocialNetworkDB.dbo.UserPostsComments(Id)
);
 CREATE NONCLUSTERED INDEX IX_CommentTypes_CommentTypeId ON dbo.CommentTypes (  CommentTypeId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- SocialNetworkDB.dbo.FriendshipApprovals definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.FriendshipApprovals;

CREATE TABLE SocialNetworkDB.dbo.FriendshipApprovals (
	Id int IDENTITY(1,1) NOT NULL,
	IsAccepted bit NOT NULL,
	FriendshipRequestId int NOT NULL,
	CONSTRAINT PK_FriendshipApprovals PRIMARY KEY (Id),
	CONSTRAINT FK_FriendshipApprovals_FriendshipRequests_FriendshipRequestId FOREIGN KEY (FriendshipRequestId) REFERENCES SocialNetworkDB.dbo.FriendshipRequests(Id)
);
 CREATE NONCLUSTERED INDEX IX_FriendshipApprovals_FriendshipRequestId ON dbo.FriendshipApprovals (  FriendshipRequestId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- SocialNetworkDB.dbo.GroupMemberships definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.GroupMemberships;

CREATE TABLE SocialNetworkDB.dbo.GroupMemberships (
	Id int IDENTITY(1,1) NOT NULL,
	IsActive bit NOT NULL,
	RegisteredAt datetime2 NOT NULL,
	UpdatedAt datetime2 NULL,
	UserId int NOT NULL,
	GroupId int NOT NULL,
	CONSTRAINT PK_GroupMemberships PRIMARY KEY (Id),
	CONSTRAINT FK_GroupMemberships_Groups_GroupId FOREIGN KEY (GroupId) REFERENCES SocialNetworkDB.dbo.Groups(Id),
	CONSTRAINT FK_GroupMemberships_Users_UserId FOREIGN KEY (UserId) REFERENCES SocialNetworkDB.dbo.Users(Id)
);
 CREATE NONCLUSTERED INDEX IX_GroupMemberships_GroupId ON dbo.GroupMemberships (  GroupId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_GroupMemberships_UserId ON dbo.GroupMemberships (  UserId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- SocialNetworkDB.dbo.GroupMessages definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.GroupMessages;

CREATE TABLE SocialNetworkDB.dbo.GroupMessages (
	Id int IDENTITY(1,1) NOT NULL,
	MessageBody nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	MessageTypeId int NOT NULL,
	CreatedAt datetime2 NOT NULL,
	UpdatedAt datetime2 NULL,
	UserId int NOT NULL,
	GroupId int NOT NULL,
	CONSTRAINT PK_GroupMessages PRIMARY KEY (Id),
	CONSTRAINT FK_GroupMessages_Groups_GroupId FOREIGN KEY (GroupId) REFERENCES SocialNetworkDB.dbo.Groups(Id),
	CONSTRAINT FK_GroupMessages_Users_UserId FOREIGN KEY (UserId) REFERENCES SocialNetworkDB.dbo.Users(Id)
);
 CREATE NONCLUSTERED INDEX IX_GroupMessages_GroupId ON dbo.GroupMessages (  GroupId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_GroupMessages_UserId ON dbo.GroupMessages (  UserId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- SocialNetworkDB.dbo.MessageTypes definition

-- Drop table

-- DROP TABLE SocialNetworkDB.dbo.MessageTypes;

CREATE TABLE SocialNetworkDB.dbo.MessageTypes (
	Id int IDENTITY(1,1) NOT NULL,
	MessageTypeId int NOT NULL,
	MessageTypeName nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_MessageTypes PRIMARY KEY (Id),
	CONSTRAINT FK_MessageTypes_GroupMessagesArchive_MessageTypeId FOREIGN KEY (MessageTypeId) REFERENCES SocialNetworkDB.dbo.GroupMessagesArchive(Id),
	CONSTRAINT FK_MessageTypes_GroupMessages_MessageTypeId FOREIGN KEY (MessageTypeId) REFERENCES SocialNetworkDB.dbo.GroupMessages(Id),
	CONSTRAINT FK_MessageTypes_UserMessagesArchive_MessageTypeId FOREIGN KEY (MessageTypeId) REFERENCES SocialNetworkDB.dbo.UserMessagesArchive(Id),
	CONSTRAINT FK_MessageTypes_UserMessages_MessageTypeId FOREIGN KEY (MessageTypeId) REFERENCES SocialNetworkDB.dbo.UserMessages(Id)
);
 CREATE NONCLUSTERED INDEX IX_MessageTypes_MessageTypeId ON dbo.MessageTypes (  MessageTypeId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;



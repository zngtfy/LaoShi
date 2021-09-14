USE master
GO

IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'LaoShi')
	DROP DATABASE [LaoShi]
CREATE DATABASE [LaoShi]
GO

USE [LaoShi]
GO

CREATE SCHEMA [System]
GO

IF OBJECT_ID('System.CodeType', 'U') IS NOT NULL
	DROP TABLE [System].[CodeType]
CREATE TABLE [System].[CodeType]
(
	[Code]					VARCHAR(64) PRIMARY KEY,
	[DisplayAs]				NTEXT,
	[Sequence]				INT,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);

IF OBJECT_ID('System.Code', 'U') IS NOT NULL
	DROP TABLE [System].[Code]
CREATE TABLE [System].[Code]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ParentId]				INT,
	[CodeType]				VARCHAR(64),
	[Value]					NVARCHAR(MAX),
	[DisplayAs]				NTEXT,
	[Sequence]				INT,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
	CONSTRAINT FkCodeParent FOREIGN KEY ([ParentId]) REFERENCES [System].[Code]([Id]),
	CONSTRAINT FkCodeType FOREIGN KEY ([CodeType]) REFERENCES [System].[CodeType]([Code])
);

IF OBJECT_ID('System.User', 'U') IS NOT NULL
	DROP TABLE [System].[User]
CREATE TABLE [System].[User]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[UserName]				VARCHAR(128),
	[FirstName]				NVARCHAR(64),
	[LastName]				NVARCHAR(64),
	[Email]					VARCHAR(128),
	[Phone]					VARCHAR(64),
	[Address]				NVARCHAR(256),
	[Avatar]				VARCHAR(512),
	[PasswordHash]			TEXT,
	[PasswordSalt]			TEXT,
	[ReminderToken]			VARCHAR(128),
	[ReminderExpired]		DATETIME,
	[LastSignIn]			DATETIME,
	[InvalidAttempts]		SMALLINT NULL DEFAULT 0,
	[LockExpired]			DATETIME,
	[LastPasswordChanged]	DATETIME,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);

IF OBJECT_ID('System.Role', 'U') IS NOT NULL
	DROP TABLE [System].[Role]
CREATE TABLE [System].[Role]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[Description]			VARCHAR(512),
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);

IF OBJECT_ID('System.UserRole', 'U') IS NOT NULL
	DROP TABLE [System].[UserRole]
CREATE TABLE [System].[UserRole]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[UserId]				INT,
	[RoleId]				INT,
	[Description]			VARCHAR(512),
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);

IF OBJECT_ID('System.Function', 'U') IS NOT NULL
	DROP TABLE [System].[Function]
CREATE TABLE [System].[Function]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ParentId]				INT,
	[Code]					VARCHAR(64),
	[Url]					VARCHAR(128),
	[Sequence]				INT,
	[Description]			VARCHAR(512),
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);

IF OBJECT_ID('System.FunctionRole', 'U') IS NOT NULL
	DROP TABLE [System].[FunctionRole]
CREATE TABLE [System].[FunctionRole]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[FunctionId]			INT,
	[RoleId]				INT,
	[Description]			VARCHAR(512),
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);

IF OBJECT_ID('System.Setting', 'U') IS NOT NULL
	DROP TABLE [System].[Setting]
CREATE TABLE [System].[Setting]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[UserId]				INT,
	[Code]					VARCHAR(64),
	[DataType]				VARCHAR(32),
	[Value]					VARCHAR(1024),
	[Description]			VARCHAR(512),
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);

IF OBJECT_ID('System.Group', 'U') IS NOT NULL
	DROP TABLE [System].[Group]
CREATE TABLE [System].[Group]
(
	[Id]					INT IDENTITY(1,1) PRIMARY KEY,
	[Level]					INT,
	[Pid]					INT,
	[InitialChar] 			NVARCHAR(32),
	[Description]			NVARCHAR(512),
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);

IF OBJECT_ID('System.UserGroup', 'U') IS NOT NULL
	DROP TABLE [System].[UserGroup]
CREATE TABLE [System].[UserGroup]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[UserId]				INT,
	[GroupId]				INT,
	[Description]			VARCHAR(512),
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);

IF OBJECT_ID('System.LoginHistory', 'U') IS NOT NULL
	DROP TABLE [System].[LoginHistory]
CREATE TABLE [System].[LoginHistory]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[UserName]				VARCHAR(128),
	[Uuid]					UNIQUEIDENTIFIER,
	[SignInOn]				DATETIME,
	[SignOutOn]				DATETIME,
	[LastAccessedOn]		DATETIME,
	[Host]					VARCHAR(256),
	[UserAgent]				VARCHAR(256),
	[SingleSession]			BIT NOT NULL DEFAULT 0,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);

IF OBJECT_ID('System.PasswordHistory', 'U') IS NOT NULL
	DROP TABLE [System].[PasswordHistory]
CREATE TABLE [System].[PasswordHistory]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[UserId]				INT,
	[PasswordHash]			TEXT,
	[PasswordSalt]			TEXT,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);
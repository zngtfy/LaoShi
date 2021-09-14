USE [LaoShi]
GO

CREATE SCHEMA [Business]
GO

IF OBJECT_ID('Business.School', 'U') IS NOT NULL
	DROP TABLE [Business].[School]
CREATE TABLE [Business].[School]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[SchoolCode]			NVARCHAR(50) NULL,
	[SchoolName]			NVARCHAR(500) NULL,
	[SchoolNameEng]			NVARCHAR(500) NULL,
	[SchoolType]			NVARCHAR(200) NULL,
	[YearOfFoundation]		INT NULL,
	[SchoolAddress]			NVARCHAR(500) NULL,
	[SchoolPhone]			NVARCHAR(50) NULL,
	[WebSite]				NVARCHAR(2000) NULL,
	[Description]			NTEXT NULL,
	[BriefName]				NVARCHAR(500) NULL,
	[LogoUrl]				NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.SchoolCampus', 'U') IS NOT NULL
	DROP TABLE [Business].[SchoolCampus]
CREATE TABLE [Business].[SchoolCampus]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[SchoolId]				INT NULL,
	[CampusName]			NVARCHAR(500) NULL,	
	[Latitude]				VARCHAR(200) NULL,
	[Longtitude]			VARCHAR(200) NULL,
	[Altitude]				VARCHAR(200) NULL,
	[Address]				NVARCHAR(500) NULL,
	[Note]					NVARCHAR(500),	
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.Subject', 'U') IS NOT NULL
	DROP TABLE [Business].[Subject]
CREATE TABLE [Business].[Subject]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[SubjectCode]			NVARCHAR(50) NULL,
	[SubjectName]			NVARCHAR(500) NOT NULL,
	[Description]			NVARCHAR(max) NULL,
	[SubjectType]			NVARCHAR(20) NULL,
	[TotalCredit]			INT NULL,
	[PracticeCredit]		INT NULL,
	[TheoryCredit]			INT NULL,
	[SchoolId]				INT NULL,
	[Department]			NVARCHAR(500) NULL,
	[Note]					NTEXT NULL,
	[MajorGroup]			NVARCHAR (50) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.Student', 'U') IS NOT NULL
	DROP TABLE [Business].[Student]
CREATE TABLE [Business].[Student]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[OfficialStudentId]		VARCHAR(50) NULL,
	[UserId]				INT NULL, -- linked to [User] table
	[Birthday]				DATETIME NULL,
	[Gender]				BIT NULL,
	[StudentType]			VARCHAR(128) NULL,
	[Class]					NVARCHAR(512) NULL,
	[CourseName]			NVARCHAR(512) NULL,
	[Note]					NVARCHAR(500),
	[SchoolId]				INT NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.Class', 'U') IS NOT NULL
	DROP TABLE [Business].[Class]
CREATE TABLE [Business].[Class]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[Code]					NVARCHAR(50) NULL,
	[Name]					NVARCHAR(500) NULL,
	[SubjectId]				INT NULL,
	[Venue]					NVARCHAR(4000) NULL,
	[Description]			NVARCHAR(MAX) NULL,
	[ClassTime]				NVARCHAR(500) NULL,
	[StartDate]				DATETIME NULL,
	[EndDate]				DATETIME NULL,
	[Prerequisition]		NVARCHAR(MAX) NULL,
	[Images]				[varchar](255) NULL,
	[Semester]				INT NULL,
	[SchoolYear]			VARCHAR(50) NULL,
	[TotalSession]			INT NULL,
	[Note]					NTEXT NULL,
	[TeacherId]				INT NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ClassMember', 'U') IS NOT NULL
	DROP TABLE [Business].[ClassMember]
CREATE TABLE [Business].[ClassMember]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ClassId]				INT NULL,
	[MemberId]				INT NULL, -- linked to [User] table
	[MemberRole]			NVARCHAR(4000) NULL,
	[Description]			NVARCHAR(max) NULL,
	[Note]					NTEXT NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ClassAnnouncement', 'U') IS NOT NULL
	DROP TABLE [Business].[ClassAnnouncement]
CREATE TABLE [Business].[ClassAnnouncement]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ClassId]				INT NULL,
	[Title]					NVARCHAR(500) NULL,
	[Brief]					NVARCHAR(500) NULL,
	[Type]					NVARCHAR(500) NULL,
	[Content]				NVARCHAR(MAX) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ClassAssignment', 'U') IS NOT NULL
	DROP TABLE [Business].[ClassAssignment]
CREATE TABLE [Business].[ClassAssignment]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ClassId]				INT NULL,
	[Name]					NVARCHAR(500) NULL,
	[AssignmentType]		VARCHAR(20) NULL,
	[AssignmentContent]		NTEXT NULL,
	[AssignmentUrl]			VARCHAR(500) NULL,
	[GroupNo]				INT NULL,
	[DueDate]				DATETIME NULL,
	[RequireSubmit]			BIT NULL,
	[SubmitType]			VARCHAR(20) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ClassAssignmentGroup', 'U') IS NOT NULL
	DROP TABLE [Business].[ClassAssignmentGroup]
CREATE TABLE [Business].[ClassAssignmentGroup]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ClassAssignmentId]		INT NULL,
	[GroupNo]				INT NULL,
	[StudentId]				INT NULL,
	[UserId]				INT NULL
);

IF OBJECT_ID('Business.AssignmentSubmission', 'U') IS NOT NULL
	DROP TABLE [Business].[AssignmentSubmission]
CREATE TABLE [Business].[AssignmentSubmission]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ClassAssignmentId]		INT NULL,
	[SubmitForGroup]		VARCHAR(50) NULL,
	[SubmitForMembers]		VARCHAR(MAX) NULL,
	[SubmissionUrl]			VARCHAR(500) NULL,
	[SubmitType]			VARCHAR(20) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL
);

IF OBJECT_ID('Business.SubmissionAttachment', 'U') IS NOT NULL
	DROP TABLE [Business].[SubmissionAttachment]
CREATE TABLE [Business].[SubmissionAttachment]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[SubmissionId]			INT NULL,
	[DisplayName]			NVARCHAR(512) NULL,
	[GuidName]				NVARCHAR(MAX) NULL,
	[Extension]				NVARCHAR(250) NULL,
	[ContentType]			NVARCHAR(MAX) NULL,
	[Url]					VARCHAR(MAX) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL
);

IF OBJECT_ID('Business.ClassDocument', 'U') IS NOT NULL
	DROP TABLE [Business].[ClassDocument]
CREATE TABLE [Business].[ClassDocument]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ClassId]				INT NULL,
	[Title]					NVARCHAR(500) NULL,
	[Description]			NVARCHAR(500) NULL,	
	[LinkUrl]				VARCHAR(200) NULL,
	[ImageUrl]				VARCHAR(200) NULL,
	[DocumentType]			NVARCHAR(20) NULL,
	[Type]					NVARCHAR(20) NULL,
	[Content]				NTEXT NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ClassScoreConfig', 'U') IS NOT NULL
	DROP TABLE [Business].[ClassScoreConfig]
CREATE TABLE [Business].[ClassScoreConfig]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ClassId]				INT NULL,
	[ScoreType]				NVARCHAR(MAX) NULL,
	[Description]			NVARCHAR(MAX) NULL,
	[Percentage]			INT NULL,
	[RefAssignmentId]		INT NULL,
	[Note]					NVARCHAR(MAX) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ClassSession', 'U') IS NOT NULL
	DROP TABLE [Business].[ClassSession]
CREATE TABLE [Business].[ClassSession]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ClassId]				INT NULL,
	[Session]				VARCHAR(20) NULL,
	[Brief]					NVARCHAR(MAX) NULL,
	[ClassContent]			NTEXT NULL,
	[DateOfClass]			DATETIME NULL,
	[SessionType]			VARCHAR(50) NULL,
	[FromTime]				VARCHAR(5) NULL,
	[ToTime]				VARCHAR(5) NULL,
	[TotalClassUnit]		INT NULL,
	[Location]				NVARCHAR(500) NULL,
	[Note]					NVARCHAR(MAX) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ClassStudent', 'U') IS NOT NULL
	DROP TABLE [Business].[ClassStudent]
CREATE TABLE [Business].[ClassStudent]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ClassId]				INT NULL,
	[StudentId]				INT NULL,
	[StudentRole]			VARCHAR(50) NULL,
	[FinalScore]			DECIMAL(5, 2) NULL,
	[FinalResult]			VARCHAR(50) NULL,
	[Note]					NVARCHAR(MAX) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ClassStudentScore', 'U') IS NOT NULL
	DROP TABLE [Business].[ClassStudentScore]
CREATE TABLE [Business].[ClassStudentScore]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ClassId]				INT NULL,
	[StudentId]				INT NULL,
	[ClassStudentId]		INT NULL,
	[Score]					DECIMAL(5, 2) NULL,
	[ScoreType]				VARCHAR(20) NULL,
	[Percentage]			INT NULL,
	[Note]					NVARCHAR(500),
	[RefScoreConfig]		INT NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ClassAttendance', 'U') IS NOT NULL
	DROP TABLE [Business].[ClassAttendance]
CREATE TABLE [Business].[ClassAttendance]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ClassId]				INT NULL,
	[StudentId]				INT NULL,
	[DeviceId]				VARCHAR(200) NULL,
	[Latitude]				VARCHAR(200) NULL,
	[Longtitude]			VARCHAR(200) NULL,
	[Altitude]				VARCHAR(200) NULL,
	[Address]				NVARCHAR(MAX) NULL,
	[Note]					NVARCHAR(500),
	[RefSessionId]			INT NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.Comment', 'U') IS NOT NULL
	DROP TABLE [Business].[Comment]
CREATE TABLE [Business].[Comment]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ParentId]				INT NULL,
	[CommentType]			VARCHAR(10) NULL,
	[CommentForId]			INT NULL,
	[Level]					INT NULL,
	[Content]				NVARCHAR(MAX) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[ApprovedBy]			INT NULL,
	[ApprovedDate]			DATETIME NULL,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.Teacher', 'U') IS NOT NULL
	DROP TABLE [Business].[Teacher]
CREATE TABLE [Business].[Teacher]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[UserId]				INT NULL, -- linked to [User] table
	[Birthday]				DATETIME NULL,
	[FullName]				NVARCHAR(200) NULL,
	[Address]				NVARCHAR(500) NULL,
	[PhoneNumber]			VARCHAR(100) NULL,
	[Introduction]			NVARCHAR(MAX) NULL,
	[Email]					VARCHAR(200) NULL,
	[Title]					NVARCHAR(50) NULL,
	[SchoolId]				INT NULL,
	[Gender]				BIT NULL,
	[ViewGroup]				VARCHAR NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.TeacherMajor', 'U') IS NOT NULL
	DROP TABLE [Business].[TeacherMajor]
CREATE TABLE [Business].[TeacherMajor]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[TeacherId]				INT NULL,
	[MajorName]				NVARCHAR(500) NULL,
	[MajorNameEng]			NVARCHAR(500) NULL,
	[MajorCode]				NVARCHAR(50) NULL,
	[Field]					NVARCHAR(250) NULL,
	[FieldEng]				NVARCHAR(250) NULL,
	[Description]			NVARCHAR(MAX) NULL,
	[StartFrom]				INT NULL,
	[CanDelete]				BIT NULL DEFAULT 0,
	[ViewGroup]				VARCHAR NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.TeacherEduBackground', 'U') IS NOT NULL
	DROP TABLE [Business].[TeacherEduBackground]
CREATE TABLE [Business].[TeacherEduBackground]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[TeacherId]				INT NULL,
	[Title]					NVARCHAR(2000) NULL,
	[Degree]				NVARCHAR(MAX) NULL,
	[DegreeNo]				NVARCHAR(200) NULL,
	[DegreeRegNo]			NVARCHAR(200) NULL,
	[DegreeDate]			DATETIME NULL,
	[SchoolId]				INT NULL,
	[Type]					VARCHAR(50) NULL,
	[Duration]				VARCHAR(200) NULL,
	[YearOfGrad]			INT NULL,
	[Result]				NVARCHAR(MAX) NULL,
	[RefUrl1]				VARCHAR(250) NULL,
	[RefUrl2]				VARCHAR(250) NULL,
	[ViewGroup]				VARCHAR NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.TeacherSkill', 'U') IS NOT NULL
	DROP TABLE [Business].[TeacherSkill]
CREATE TABLE [Business].[TeacherSkill]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[TeacherId]				INT NULL,
	[Name]					NVARCHAR(2000) NULL,
	[Description]			NVARCHAR(2000) NULL,
	[Type]					VARCHAR(20) NULL,
	[RefUrl]				VARCHAR(500) NULL,
	[Note]					NVARCHAR(MAX) NULL,
	[SeftEvaluate]			INT NULL, -- over 100 points
	[StartYear]				INT NULL,
	[ViewGroup]				VARCHAR NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.TeacherResearchWork', 'U') IS NOT NULL
	DROP TABLE [Business].[TeacherResearchWork]
CREATE TABLE [Business].[TeacherResearchWork]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[TeacherId]				INT NULL,
	[Type]					VARCHAR(100) NULL,
	[Title]					NVARCHAR(MAX) NULL,
	[CoAuthors]				NVARCHAR(MAX) NULL,
	[Day]					INT NULL,
	[Month]					INT NULL,
	[Year]					INT NULL,
	[City]					NVARCHAR(200) NULL,
	[Publisher]				NVARCHAR(500) NULL,
	[PublisherUrl]			VARCHAR(500) NULL,
	[Pages]					VARCHAR(100) NULL,
	[Doi]					VARCHAR(500) NULL,
	[Issn]					VARCHAR(100) NULL,
	[Isbn]					VARCHAR(100) NULL,
	[IndexedBy]				NVARCHAR(512) NULL,
	[DownloadUrl]			VARCHAR(500) NULL,
	[RefUrl]				VARCHAR(500) NULL,
	[Introduction]			NVARCHAR(MAX) NULL,
	[Keywords]				NVARCHAR(MAX) NULL,
	[ViewGroup]				VARCHAR NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.TeacherStudy', 'U') IS NOT NULL
	DROP TABLE [Business].[TeacherStudy]
CREATE TABLE [Business].[TeacherStudy]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[TeacherId]				INT NULL,
	[TeacherRole]			NVARCHAR(1000) NULL,
	[Title]					NVARCHAR(1000) NULL,
	[Description]			NVARCHAR(2000) NULL,
	[Type]					NVARCHAR(100) NULL,
	[Color]					NVARCHAR(150) NULL,
	[Time]					NVARCHAR(100) NULL,
	[City]					NVARCHAR(200) NULL,
	[Publisher]				NVARCHAR(500) NULL,
	[StudyLevel]			NVARCHAR(250) NULL,
	[Result]				NVARCHAR(500) NULL,
	[RefUrl]				VARCHAR(500) NULL,
	[Introduction]			NVARCHAR(MAX) NULL,
	[Keywords]				NVARCHAR(MAX) NULL,
	[ViewGroup]				VARCHAR NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.TeacherExperience', 'U') IS NOT NULL
	DROP TABLE [Business].[TeacherExperience]
CREATE TABLE [Business].[TeacherExperience]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[TeacherId]				INT NULL,
	[WorkingTime]			NVARCHAR(100) NULL,
	[WorkTitle]				NVARCHAR(1000) NULL,
	[Description]			NTEXT NULL,
	[WorkType]				VARCHAR(100) NULL,
	[WorkLocation]			NVARCHAR(200) NULL,
	[WorkLevel]				NVARCHAR(250) NULL,
	[ReasonOfQuit]			NVARCHAR(MAX) NULL,
	[References]			NVARCHAR(MAX) NULL,
	[ViewGroup]				VARCHAR NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.TeacherDelegateStudent', 'U') IS NOT NULL
	DROP TABLE [Business].[TeacherDelegateStudent]
CREATE TABLE [Business].[TeacherDelegateStudent]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[TeacherId]				INT NULL,
	[StudentId]				INT NULL,
	[Topic]					NVARCHAR(1000) NULL,
	[Description]			NVARCHAR(2000) NULL,
	[Time]					NVARCHAR(100) NULL,
	[SupervisedType]		NVARCHAR(1000) NULL,
	[RefUrl]				VARCHAR(500) NULL,
	[Note]					NVARCHAR(MAX) NULL,
	[ViewGroup]				VARCHAR NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.TeacherPublicProfile', 'U') IS NOT NULL
	DROP TABLE [Business].[TeacherPublicProfile]
CREATE TABLE [Business].[TeacherPublicProfile]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[TeacherId]				INT NULL,
	[SourceName]			NVARCHAR(1000) NULL,
	[Description]			NVARCHAR(2000) NULL,
	[SourceType]			NVARCHAR(1000) NULL,
	[RefUrl]				VARCHAR(500) NULL,
	[SourceLogoUrl]			VARCHAR(500) NULL,
	[Note]					NVARCHAR(MAX) NULL,
	[ViewGroup]				VARCHAR NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.Request', 'U') IS NOT NULL
	DROP TABLE [Business].[Request]
CREATE TABLE [Business].[Request]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,	
	[RequestBy]				INT NULL,
	[RequestName]			NVARCHAR(100) NULL,
	[RequestType]			VARCHAR(50) NULL,
	[IsFromContact]			BIT NULL,
	[Content]				NTEXT NULL,
	[Result]				NVARCHAR(200) NULL,
	[ResultBy]				INT NULL,
	[ViewGroup]				VARCHAR NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.News', 'U') IS NOT NULL
	DROP TABLE [Business].[News]
CREATE TABLE [Business].[News]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[Title]					NVARCHAR(512),
	[Brief]					NVARCHAR(512),
	[Content]				NTEXT,
	[Category]				VARCHAR(64),
	[NewsType]				VARCHAR(64),
	[Group]					INT,
	[ImgUrl]				VARCHAR(MAX),
	[Thumbnail]				VARCHAR(MAX),
	[NewsBy]				INT, 
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT,
	[CreatedOn]				DATETIME,
	[ModifiedBy]			INT,
	[ModifiedOn]			DATETIME
);

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--- Đề thi online-----------------------------------------------------------------
IF OBJECT_ID('Business.Exam', 'U') IS NOT NULL
	DROP TABLE [Business].[Exam]
CREATE TABLE [Business].[Exam]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ExamTitle]				NVARCHAR(MAX) NULL,
	[ExamDepartment]		NVARCHAR(500) NULL,
	[ExamSchool]			NVARCHAR(500) NULL,
	[ExamType]				VARCHAR(50) NULL,
	[ExamLevel]				INT NULL,
	[TotMinutes]			INT NULL,
	[TotalQuestion]			INT NULL,
	[TotalScore]			INT NULL,
	[Note]					NVARCHAR(MAX),
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ExamDetail', 'U') IS NOT NULL
	DROP TABLE [Business].[ExamDetail]
CREATE TABLE [Business].[ExamDetail]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,	
	[ExamId]				INT NULL,
	[QuestionId]			INT NULL,
	[Score]					INT NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ExamQuestion', 'U') IS NOT NULL
	DROP TABLE [Business].[ExamQuestion]
CREATE TABLE [Business].[ExamQuestion]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,	
	[QuestionInstruction]	NVARCHAR(500) NULL,	
	[QuestionContent]		NVARCHAR(MAX) NULL,	
	[QuestionImage]			VARCHAR(500) NULL,
	[QuestionType]			VARCHAR(50) NULL,
	[TotMinutes]			INT NULL,
	[TotScore]				INT NULL,
	[SubjectId]				INT NULL,
	[Note]					NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ExamAnswer', 'U') IS NOT NULL
	DROP TABLE [Business].[ExamAnswer]
CREATE TABLE [Business].[ExamAnswer]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,	
	[QuestionId]			INT NULL,
	[AnswerContent]			NVARCHAR(MAX) NULL,
	[AnswerImage]			VARCHAR(500) NULL,
	[AnswerType]			VARCHAR(50) NULL,
	[IsCorrect]				BIT NULL DEFAULT 0,
	[Score]					INT NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

--- Làm test online
IF OBJECT_ID('Business.ClassAssignmentExam', 'U') IS NOT NULL
	DROP TABLE [Business].[ClassAssignmentExam]
CREATE TABLE [Business].[ClassAssignmentExam]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,	
	[ClassAssignmentId]		INT NULL,
	[ExamId]				INT NULL,
	[Note]					NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--- Làm test online
IF OBJECT_ID('Business.StudentExam', 'U') IS NOT NULL
	DROP TABLE [Business].[StudentExam]
CREATE TABLE [Business].[StudentExam]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,	
	[StudentId]				INT NULL,
	[ExamId]				INT NULL,
	[ClassAssignmentId]		INT NULL,
	[StartTime]				DATETIME NULL,
	[EndTime]				DATETIME NULL,
	[Score]					INT NULL,
	[TotScore]				INT NULL,
	[TotQuestion]			INT NULL,
	[TotMinutes]			INT NULL,
	[Note]					NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL
);

IF OBJECT_ID('Business.StudentExamDetail', 'U') IS NOT NULL
	DROP TABLE [Business].[StudentExamDetail]
CREATE TABLE [Business].[StudentExamDetail]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,	
	[StudentExamId]			INT NULL,
	[QuestionId]			INT NULL,
	[Score]					INT NULL,
	[Answers]				NVARCHAR(500) NULL,
	[Note]					NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL
);

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--- Luận văn
IF OBJECT_ID('Business.Thesis', 'U') IS NOT NULL
	DROP TABLE [Business].[Thesis]
CREATE TABLE [Business].[Thesis]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ThesisTitle]			NVARCHAR(2000) NULL,
	[Description]			NVARCHAR(MAX) NULL,
	[ThesisType]			VARCHAR(100) NULL,
	[ThesisLevel]			VARCHAR(100) NULL,
	[ThesisCategory]		NVARCHAR(2000) NULL,
	[StudyField]			NVARCHAR(2000) NULL,
	[StudyCode]				NVARCHAR(100) NULL,
	[Keyword]				NVARCHAR(2000) NULL,
	[ThesisYear]			INT NULL,
	[Members]				INT NULL,
	[Note]					NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ThesisTeacher', 'U') IS NOT NULL
	DROP TABLE [Business].[ThesisTeacher]
CREATE TABLE [Business].[ThesisTeacher]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ThesisId]				INT NULL,
	[TeacherId]				INT NULL,
	[Role]					VARCHAR(50) NULL,
	[Note]					NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ThesisStudent', 'U') IS NOT NULL
	DROP TABLE [Business].[ThesisStudent]
CREATE TABLE [Business].[ThesisStudent]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ThesisId]				INT NULL,
	[StudentId]				INT NULL,
	[StartTime]				DATETIME NULL,
	[EndTime]				DATETIME NULL,
	[Role]					NVARCHAR(500) NULL,
	[Note]					NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);


IF OBJECT_ID('Business.ThesisDoc', 'U') IS NOT NULL
	DROP TABLE [Business].[ThesisDoc]
CREATE TABLE [Business].[ThesisDoc]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ThesisId]				INT NULL,
	[DocName]				NVARCHAR(500) NULL,
	[Description]			NVARCHAR(MAX) NULL,
	[Url]					NVARCHAR(500) NULL,
	[Note]					NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ThesisWork', 'U') IS NOT NULL
	DROP TABLE [Business].[ThesisWork]
CREATE TABLE [Business].[ThesisWork]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ThesisId]				INT NULL,
	[WorkType]				VARCHAR(50) NULL,
	[WorkName]				NVARCHAR(500) NULL,
	[Note]					NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ThesisWorkAttachment', 'U') IS NOT NULL
	DROP TABLE [Business].[ThesisWorkAttachment]
CREATE TABLE [Business].[ThesisWorkAttachment]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ThesisWorkId]			INT NULL,
	[DisplayName]			NVARCHAR(500) NULL,
	[Version]				VARCHAR(50) NULL,
	[GuidName]				NVARCHAR(MAX) NULL,
	[Extension]				NVARCHAR(250) NULL,
	[ContentType]			NVARCHAR(MAX) NULL,
	[Url]					VARCHAR(500) NULL,
	[Note]					NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL
);

IF OBJECT_ID('Business.ThesisReference', 'U') IS NOT NULL
	DROP TABLE [Business].[ThesisReference]
CREATE TABLE [Business].[ThesisReference]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ThesisId]				INT NULL,
	[ReferenceId]			INT NULL,
	[Note]					NVARCHAR(MAX) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ThesisPublication', 'U') IS NOT NULL
	DROP TABLE [Business].[ThesisPublication]
CREATE TABLE [Business].[ThesisPublication]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,
	[ThesisId]				INT NULL,
	[PublicationId]			INT NULL,
	[Note]					NVARCHAR(500) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);

IF OBJECT_ID('Business.ReferenceDocument', 'U') IS NOT NULL
	DROP TABLE [Business].[ReferenceDocument]
CREATE TABLE [Business].[ReferenceDocument]
(
	[Id]					INT IDENTITY(1, 1) PRIMARY KEY,	
	[Type]					VARCHAR(100) NULL,
	[Title]					NVARCHAR(MAX) NULL,
	[Authors]				NVARCHAR(MAX) NULL,
	[Day]					INT NULL,
	[Month]					INT NULL,
	[Year]					INT NULL,
	[City]					NVARCHAR(200) NULL,
	[Publisher]				NVARCHAR(500) NULL,
	[PublisherUrl]			VARCHAR(500) NULL,
	[Pages]					VARCHAR(100) NULL,
	[Doi]					VARCHAR(500) NULL,
	[Issn]					VARCHAR(100) NULL,
	[Isbn]					VARCHAR(100) NULL,
	[IndexedBy]				NVARCHAR(500) NULL,
	[DownloadUrl]			VARCHAR(500) NULL,
	[RefUrl]				VARCHAR(500) NULL,
	[Introduction]			NVARCHAR(MAX) NULL,
	[Content]				NTEXT NULL,
	[Keywords]				NVARCHAR(MAX) NULL,
	[ViewGroup]				VARCHAR(50) NULL,
	[Status]				SMALLINT NULL DEFAULT 0,
	[CreatedBy]				INT NULL,
	[CreatedOn]				DATETIME NULL,
	[ModifiedBy]			INT NULL,
	[ModifiedOn]			DATETIME NULL
);
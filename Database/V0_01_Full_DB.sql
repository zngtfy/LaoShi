USE [master]
GO
/****** Object:  Database [LaoShi]    Script Date: 2/26/2020 2:42:04 PM ******/
CREATE DATABASE [LaoShi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaoShi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LaoShi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LaoShi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LaoShi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LaoShi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaoShi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaoShi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaoShi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaoShi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaoShi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaoShi] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaoShi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LaoShi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaoShi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaoShi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaoShi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaoShi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaoShi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaoShi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaoShi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaoShi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LaoShi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaoShi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaoShi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaoShi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaoShi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaoShi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaoShi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaoShi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LaoShi] SET  MULTI_USER 
GO
ALTER DATABASE [LaoShi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaoShi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaoShi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaoShi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LaoShi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LaoShi] SET QUERY_STORE = OFF
GO
USE [LaoShi]
GO
/****** Object:  Schema [Business]    Script Date: 2/26/2020 2:42:04 PM ******/
CREATE SCHEMA [Business]
GO
/****** Object:  Schema [System]    Script Date: 2/26/2020 2:42:04 PM ******/
CREATE SCHEMA [System]
GO
/****** Object:  Table [Business].[AssignmentSubmission]    Script Date: 2/26/2020 2:42:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[AssignmentSubmission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassAssignmentId] [int] NULL,
	[SubmitForGroup] [varchar](50) NULL,
	[SubmitForMembers] [varchar](max) NULL,
	[SubmissionUrl] [varchar](500) NULL,
	[SubmitType] [varchar](20) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[Class]    Script Date: 2/26/2020 2:42:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[Class](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](500) NULL,
	[SubjectId] [int] NULL,
	[Venue] [nvarchar](4000) NULL,
	[Description] [nvarchar](max) NULL,
	[ClassTime] [nvarchar](500) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Prerequisition] [nvarchar](max) NULL,
	[Images] [varchar](255) NULL,
	[Semester] [int] NULL,
	[SchoolYear] [varchar](50) NULL,
	[TotalSession] [int] NULL,
	[Note] [ntext] NULL,
	[TeacherId] [int] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ClassAnnouncement]    Script Date: 2/26/2020 2:42:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ClassAnnouncement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[Title] [nvarchar](500) NULL,
	[Brief] [nvarchar](500) NULL,
	[Type] [nvarchar](500) NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ClassAssignment]    Script Date: 2/26/2020 2:42:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ClassAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[AssignmentType] [varchar](20) NULL,
	[AssignmentContent] [ntext] NULL,
	[AssignmentUrl] [varchar](500) NULL,
	[GroupNo] [int] NULL,
	[DueDate] [datetime] NULL,
	[RequireSubmit] [bit] NULL,
	[SubmitType] [varchar](20) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ClassAssignmentExam]    Script Date: 2/26/2020 2:42:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ClassAssignmentExam](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassAssignmentId] [int] NULL,
	[ExamId] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Business].[ClassAssignmentGroup]    Script Date: 2/26/2020 2:42:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ClassAssignmentGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassAssignmentId] [int] NULL,
	[GroupNo] [int] NULL,
	[StudentId] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Business].[ClassAttendance]    Script Date: 2/26/2020 2:42:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ClassAttendance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[StudentId] [int] NULL,
	[DeviceId] [varchar](200) NULL,
	[Latitude] [varchar](200) NULL,
	[Longtitude] [varchar](200) NULL,
	[Altitude] [varchar](200) NULL,
	[Address] [nvarchar](max) NULL,
	[Note] [nvarchar](500) NULL,
	[RefSessionId] [int] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ClassDocument]    Script Date: 2/26/2020 2:42:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ClassDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[LinkUrl] [varchar](200) NULL,
	[ImageUrl] [varchar](200) NULL,
	[DocumentType] [nvarchar](20) NULL,
	[Type] [nvarchar](20) NULL,
	[Content] [ntext] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ClassMember]    Script Date: 2/26/2020 2:42:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ClassMember](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[MemberId] [int] NULL,
	[MemberRole] [nvarchar](4000) NULL,
	[Description] [nvarchar](max) NULL,
	[Note] [ntext] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ClassScoreConfig]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ClassScoreConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[ScoreType] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Percentage] [int] NULL,
	[RefAssignmentId] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ClassSession]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ClassSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[Session] [varchar](20) NULL,
	[Brief] [nvarchar](max) NULL,
	[ClassContent] [ntext] NULL,
	[DateOfClass] [datetime] NULL,
	[SessionType] [varchar](50) NULL,
	[FromTime] [varchar](5) NULL,
	[ToTime] [varchar](5) NULL,
	[TotalClassUnit] [int] NULL,
	[Location] [nvarchar](500) NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ClassStudent]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ClassStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[StudentId] [int] NULL,
	[StudentRole] [varchar](50) NULL,
	[FinalScore] [decimal](5, 2) NULL,
	[FinalResult] [varchar](50) NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ClassStudentScore]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ClassStudentScore](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[StudentId] [int] NULL,
	[ClassStudentId] [int] NULL,
	[Score] [decimal](5, 2) NULL,
	[ScoreType] [varchar](20) NULL,
	[Percentage] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[RefScoreConfig] [int] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Business].[Comment]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[CommentType] [varchar](10) NULL,
	[CommentForId] [int] NULL,
	[Level] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [smallint] NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[Exam]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[Exam](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamTitle] [nvarchar](max) NULL,
	[ExamDepartment] [nvarchar](500) NULL,
	[ExamSchool] [nvarchar](500) NULL,
	[SubjectId] [int] NULL,
	[ExamType] [varchar](50) NULL,
	[ExamLevel] [int] NULL,
	[TotMinutes] [int] NULL,
	[TotalQuestion] [int] NULL,
	[TotalScore] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK__Exam__3214EC07CB7BB95A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ExamAnswer]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ExamAnswer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NULL,
	[AnswerContent] [nvarchar](max) NULL,
	[AnswerImage] [varchar](500) NULL,
	[AnswerType] [varchar](50) NULL,
	[IsCorrect] [bit] NULL,
	[Score] [int] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ExamDetail]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ExamDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamId] [int] NULL,
	[QuestionId] [int] NULL,
	[Score] [int] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Business].[ExamQuestion]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ExamQuestion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionInstruction] [nvarchar](500) NULL,
	[QuestionContent] [nvarchar](max) NULL,
	[QuestionImage] [varchar](500) NULL,
	[QuestionType] [varchar](50) NULL,
	[TotMinutes] [int] NULL,
	[TotScore] [int] NULL,
	[SubjectId] [int] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[News]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](512) NULL,
	[Brief] [nvarchar](512) NULL,
	[Content] [ntext] NULL,
	[Category] [varchar](64) NULL,
	[NewsType] [varchar](64) NULL,
	[Group] [int] NULL,
	[ImgUrl] [varchar](max) NULL,
	[Thumbnail] [varchar](max) NULL,
	[NewsBy] [int] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ReferenceDocument]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ReferenceDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](100) NULL,
	[Title] [nvarchar](max) NULL,
	[Authors] [nvarchar](max) NULL,
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[City] [nvarchar](200) NULL,
	[Publisher] [nvarchar](500) NULL,
	[PublisherUrl] [varchar](500) NULL,
	[Pages] [varchar](100) NULL,
	[Doi] [varchar](500) NULL,
	[Issn] [varchar](100) NULL,
	[Isbn] [varchar](100) NULL,
	[IndexedBy] [nvarchar](500) NULL,
	[DownloadUrl] [varchar](500) NULL,
	[RefUrl] [varchar](500) NULL,
	[Introduction] [nvarchar](max) NULL,
	[Content] [ntext] NULL,
	[Keywords] [nvarchar](max) NULL,
	[ViewGroup] [varchar](50) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[Request]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestBy] [int] NULL,
	[RequestName] [nvarchar](100) NULL,
	[RequestType] [varchar](50) NULL,
	[IsFromContact] [bit] NULL,
	[Content] [ntext] NULL,
	[Result] [nvarchar](200) NULL,
	[ResultBy] [int] NULL,
	[ViewGroup] [varchar](1) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[School]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[School](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SchoolCode] [nvarchar](50) NULL,
	[SchoolName] [nvarchar](500) NULL,
	[SchoolNameEng] [nvarchar](500) NULL,
	[SchoolType] [nvarchar](200) NULL,
	[YearOfFoundation] [int] NULL,
	[SchoolAddress] [nvarchar](500) NULL,
	[SchoolPhone] [nvarchar](50) NULL,
	[WebSite] [nvarchar](2000) NULL,
	[Description] [ntext] NULL,
	[BriefName] [nvarchar](500) NULL,
	[LogoUrl] [nvarchar](500) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[Student]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OfficialStudentId] [varchar](50) NULL,
	[UserId] [int] NULL,
	[Birthday] [datetime] NULL,
	[Gender] [bit] NULL,
	[StudentType] [varchar](128) NULL,
	[Class] [nvarchar](512) NULL,
	[CourseName] [nvarchar](512) NULL,
	[Note] [nvarchar](500) NULL,
	[SchoolId] [int] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Business].[StudentExam]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[StudentExam](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[ExamId] [int] NULL,
	[ClassAssignmentId] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Score] [int] NULL,
	[TotScore] [int] NULL,
	[TotQuestion] [int] NULL,
	[TotMinutes] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Business].[StudentExamDetail]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[StudentExamDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentExamId] [int] NULL,
	[QuestionId] [int] NULL,
	[Score] [int] NULL,
	[Answers] [nvarchar](500) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Business].[Subject]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[Subject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectCode] [nvarchar](50) NULL,
	[SubjectName] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[SubjectType] [nvarchar](20) NULL,
	[TotalCredit] [int] NULL,
	[PracticeCredit] [int] NULL,
	[TheoryCredit] [int] NULL,
	[SchoolId] [int] NULL,
	[Department] [nvarchar](500) NULL,
	[Note] [ntext] NULL,
	[MajorGroup] [nvarchar](50) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[SubmissionAttachment]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[SubmissionAttachment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubmissionId] [int] NULL,
	[DisplayName] [nvarchar](512) NULL,
	[GuidName] [nvarchar](max) NULL,
	[Extension] [nvarchar](250) NULL,
	[ContentType] [nvarchar](max) NULL,
	[Url] [varchar](max) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[Teacher]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Birthday] [datetime] NULL,
	[FullName] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[PhoneNumber] [varchar](100) NULL,
	[Introduction] [nvarchar](max) NULL,
	[Email] [varchar](200) NULL,
	[Title] [nvarchar](50) NULL,
	[SchoolId] [int] NULL,
	[Gender] [bit] NULL,
	[ViewGroup] [varchar](1) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK__Teacher__3214EC07F70EF23A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[TeacherDelegateStudent]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[TeacherDelegateStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NULL,
	[StudentId] [int] NULL,
	[Topic] [nvarchar](1000) NULL,
	[Description] [nvarchar](2000) NULL,
	[Time] [nvarchar](100) NULL,
	[SupervisedType] [nvarchar](1000) NULL,
	[RefUrl] [varchar](500) NULL,
	[Note] [nvarchar](max) NULL,
	[ViewGroup] [varchar](1) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[TeacherEduBackground]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[TeacherEduBackground](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NULL,
	[Title] [nvarchar](2000) NULL,
	[Degree] [nvarchar](max) NULL,
	[DegreeNo] [nvarchar](200) NULL,
	[DegreeRegNo] [nvarchar](200) NULL,
	[DegreeDate] [datetime] NULL,
	[SchoolId] [int] NULL,
	[Type] [varchar](50) NULL,
	[Duration] [varchar](200) NULL,
	[YearOfGrad] [int] NULL,
	[Result] [nvarchar](max) NULL,
	[RefUrl1] [varchar](250) NULL,
	[RefUrl2] [varchar](250) NULL,
	[ViewGroup] [varchar](1) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[TeacherExperience]    Script Date: 2/26/2020 2:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[TeacherExperience](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NULL,
	[WorkingTime] [nvarchar](100) NULL,
	[WorkTitle] [nvarchar](1000) NULL,
	[Description] [ntext] NULL,
	[WorkType] [varchar](100) NULL,
	[WorkLocation] [nvarchar](200) NULL,
	[WorkLevel] [nvarchar](250) NULL,
	[ReasonOfQuit] [nvarchar](max) NULL,
	[References] [nvarchar](max) NULL,
	[ViewGroup] [varchar](1) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[TeacherMajor]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[TeacherMajor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NULL,
	[MajorName] [nvarchar](500) NULL,
	[MajorNameEng] [nvarchar](500) NULL,
	[MajorCode] [nvarchar](50) NULL,
	[Field] [nvarchar](250) NULL,
	[FieldEng] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[StartFrom] [int] NULL,
	[CanDelete] [bit] NULL,
	[ViewGroup] [varchar](1) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[TeacherPublicProfile]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[TeacherPublicProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NULL,
	[SourceName] [nvarchar](1000) NULL,
	[Description] [nvarchar](2000) NULL,
	[SourceType] [nvarchar](1000) NULL,
	[RefUrl] [varchar](500) NULL,
	[SourceLogoUrl] [varchar](500) NULL,
	[Note] [nvarchar](max) NULL,
	[ViewGroup] [varchar](1) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[TeacherResearchWork]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[TeacherResearchWork](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NULL,
	[Type] [varchar](100) NULL,
	[Title] [nvarchar](max) NULL,
	[CoAuthors] [nvarchar](max) NULL,
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[City] [nvarchar](200) NULL,
	[Publisher] [nvarchar](500) NULL,
	[PublisherUrl] [varchar](500) NULL,
	[Pages] [varchar](100) NULL,
	[Doi] [varchar](500) NULL,
	[Issn] [varchar](100) NULL,
	[Isbn] [varchar](100) NULL,
	[IndexedBy] [nvarchar](512) NULL,
	[DownloadUrl] [varchar](500) NULL,
	[RefUrl] [varchar](500) NULL,
	[Introduction] [nvarchar](max) NULL,
	[Keywords] [nvarchar](max) NULL,
	[ViewGroup] [varchar](1) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[TeacherSkill]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[TeacherSkill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NULL,
	[Name] [nvarchar](2000) NULL,
	[Description] [nvarchar](2000) NULL,
	[Type] [varchar](20) NULL,
	[RefUrl] [varchar](500) NULL,
	[Note] [nvarchar](max) NULL,
	[SeftEvaluate] [int] NULL,
	[StartYear] [int] NULL,
	[ViewGroup] [varchar](1) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[TeacherStudy]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[TeacherStudy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NULL,
	[TeacherRole] [nvarchar](1000) NULL,
	[Title] [nvarchar](1000) NULL,
	[Description] [nvarchar](2000) NULL,
	[Type] [nvarchar](100) NULL,
	[Color] [nvarchar](150) NULL,
	[Time] [nvarchar](100) NULL,
	[City] [nvarchar](200) NULL,
	[Publisher] [nvarchar](500) NULL,
	[StudyLevel] [nvarchar](250) NULL,
	[Result] [nvarchar](500) NULL,
	[RefUrl] [varchar](500) NULL,
	[Introduction] [nvarchar](max) NULL,
	[Keywords] [nvarchar](max) NULL,
	[ViewGroup] [varchar](1) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[Thesis]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[Thesis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ThesisTitle] [nvarchar](2000) NULL,
	[Description] [nvarchar](max) NULL,
	[ThesisType] [varchar](100) NULL,
	[ThesisLevel] [varchar](100) NULL,
	[ThesisCategory] [nvarchar](2000) NULL,
	[StudyField] [nvarchar](2000) NULL,
	[StudyCode] [nvarchar](100) NULL,
	[Keyword] [nvarchar](2000) NULL,
	[ThesisYear] [int] NULL,
	[Members] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ThesisDoc]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ThesisDoc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ThesisId] [int] NULL,
	[DocName] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[Url] [nvarchar](500) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ThesisPublication]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ThesisPublication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ThesisId] [int] NULL,
	[PublicationId] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Business].[ThesisReference]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ThesisReference](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ThesisId] [int] NULL,
	[ReferenceId] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Business].[ThesisStudent]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ThesisStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ThesisId] [int] NULL,
	[StudentId] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Role] [nvarchar](500) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Business].[ThesisTeacher]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ThesisTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ThesisId] [int] NULL,
	[TeacherId] [int] NULL,
	[Role] [varchar](50) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Business].[ThesisWork]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ThesisWork](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ThesisId] [int] NULL,
	[WorkType] [varchar](50) NULL,
	[WorkName] [nvarchar](500) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Business].[ThesisWorkAttachment]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business].[ThesisWorkAttachment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ThesisWorkId] [int] NULL,
	[DisplayName] [nvarchar](500) NULL,
	[Version] [varchar](50) NULL,
	[GuidName] [nvarchar](max) NULL,
	[Extension] [nvarchar](250) NULL,
	[ContentType] [nvarchar](max) NULL,
	[Url] [varchar](500) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK__ThesisWo__3214EC07A698017C] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [System].[Code]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[Code](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[CodeType] [varchar](64) NULL,
	[Value] [nvarchar](max) NULL,
	[DisplayAs] [ntext] NULL,
	[Sequence] [int] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [System].[CodeType]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[CodeType](
	[Code] [varchar](64) NOT NULL,
	[DisplayAs] [ntext] NULL,
	[Sequence] [int] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [System].[Function]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[Function](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Code] [varchar](64) NULL,
	[Url] [varchar](128) NULL,
	[Sequence] [int] NULL,
	[Description] [varchar](512) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [System].[FunctionRole]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[FunctionRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FunctionId] [int] NULL,
	[RoleId] [int] NULL,
	[Description] [varchar](512) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [System].[Group]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Level] [int] NULL,
	[Pid] [int] NULL,
	[InitialChar] [nvarchar](32) NULL,
	[Description] [nvarchar](512) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [System].[LoginHistory]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[LoginHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](128) NULL,
	[Uuid] [uniqueidentifier] NULL,
	[SignInOn] [datetime] NULL,
	[SignOutOn] [datetime] NULL,
	[LastAccessedOn] [datetime] NULL,
	[Host] [varchar](256) NULL,
	[UserAgent] [varchar](256) NULL,
	[SingleSession] [bit] NOT NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [System].[PasswordHistory]    Script Date: 2/26/2020 2:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[PasswordHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PasswordHash] [text] NULL,
	[PasswordSalt] [text] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [System].[Role]    Script Date: 2/26/2020 2:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](512) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [System].[Setting]    Script Date: 2/26/2020 2:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[Setting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Code] [varchar](64) NULL,
	[DataType] [varchar](32) NULL,
	[Value] [varchar](1024) NULL,
	[Description] [varchar](512) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [System].[User]    Script Date: 2/26/2020 2:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](128) NULL,
	[FirstName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL,
	[Email] [varchar](128) NULL,
	[Phone] [varchar](64) NULL,
	[Address] [nvarchar](256) NULL,
	[Avatar] [varchar](512) NULL,
	[PasswordHash] [text] NULL,
	[PasswordSalt] [text] NULL,
	[ReminderToken] [varchar](128) NULL,
	[ReminderExpired] [datetime] NULL,
	[LastSignIn] [datetime] NULL,
	[InvalidAttempts] [smallint] NULL,
	[LockExpired] [datetime] NULL,
	[LastPasswordChanged] [datetime] NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [System].[UserGroup]    Script Date: 2/26/2020 2:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[UserGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[GroupId] [int] NULL,
	[Description] [varchar](512) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [System].[UserRole]    Script Date: 2/26/2020 2:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [System].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
	[Description] [varchar](512) NULL,
	[Status] [smallint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Business].[AssignmentSubmission] ON 
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (1, 1, NULL, NULL, N'abc.pdf', N'Online', 1, 15, CAST(N'2020-01-15T00:00:00.000' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (2, 1, NULL, NULL, NULL, N'Per-Online-Doc', 1, 15, CAST(N'2020-01-28T17:22:44.770' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (3, 1, NULL, NULL, NULL, N'Per-Online-Doc', 1, 15, CAST(N'2020-01-28T18:13:47.550' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (4, 1, NULL, NULL, NULL, N'Per-Online-Doc', 1, 15, CAST(N'2020-01-28T18:27:34.690' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (5, 1, NULL, NULL, NULL, N'Per-Online-Doc', 1, 15, CAST(N'2020-01-28T18:31:54.153' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (6, 3, NULL, NULL, NULL, N'Per-Online-Doc', 1, 15, CAST(N'2020-01-28T19:46:37.420' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (7, 2, NULL, NULL, N'https://github.com/occbuu/hss', N'Grp-Online-Git', 1, 15, CAST(N'2020-01-28T22:00:41.213' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (8, 2, NULL, NULL, N'https://stackoverflow.com/questions/5717093/check-if-a-javascript-string-is-a-url', N'Grp-Online-Git', 1, 15, CAST(N'2020-01-28T22:17:47.030' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (9, 1, NULL, NULL, NULL, N'Per-Online-Doc', 1, 14, CAST(N'2020-01-28T22:21:45.213' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (10, 2, NULL, NULL, N'https://css-tricks.com/almanac/properties/o/overflow-wrap/', N'Grp-Online-Git', 1, 14, CAST(N'2020-01-28T22:22:15.513' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (11, 2, NULL, NULL, N'https://css-tricks.com/almanac/properties/o/overflow-wrap/', N'Grp-Online-Git', 1, 18, CAST(N'2020-01-28T22:32:26.950' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (12, 1, NULL, NULL, NULL, N'Per-Online-Doc', 1, 16, CAST(N'2020-02-09T19:52:56.227' AS DateTime))
GO
INSERT [Business].[AssignmentSubmission] ([Id], [ClassAssignmentId], [SubmitForGroup], [SubmitForMembers], [SubmissionUrl], [SubmitType], [Status], [CreatedBy], [CreatedOn]) VALUES (13, 8, NULL, NULL, N'https://www.google.com/', N'Grp-Online-Git', 1, 15, CAST(N'2020-02-18T23:24:08.100' AS DateTime))
GO
SET IDENTITY_INSERT [Business].[AssignmentSubmission] OFF
GO
SET IDENTITY_INSERT [Business].[Class] ON 
GO
INSERT [Business].[Class] ([Id], [Code], [Name], [SubjectId], [Venue], [Description], [ClassTime], [StartDate], [EndDate], [Prerequisition], [Images], [Semester], [SchoolYear], [TotalSession], [Note], [TeacherId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'192-CTDL-HLI', N'Cấu trúc dữ liệu', 1, N'NK.PM05  &  NK.002 Cơ sở Nguyễn Kiệm, TP.HCM', N'Lớp học lại cho khóa 2015 trở về trước, ngành KHMT', N'Lý thuyết: tiết 7-10 thứ Sáu, Thực hành: tiết 1-6 thứ Sáu', CAST(N'2020-02-21T00:00:00.000' AS DateTime), CAST(N'2020-05-15T00:00:00.000' AS DateTime), N'Học môn nhập môn tin học', N'assets/subject/ctdl_ou.png', 2, N'2019-2020', 20, N'10 buổi LT, 10 buổi TH', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-13T20:09:22.937' AS DateTime))
GO
SET IDENTITY_INSERT [Business].[Class] OFF
GO
SET IDENTITY_INSERT [Business].[ClassAnnouncement] ON 
GO
INSERT [Business].[ClassAnnouncement] ([Id], [ClassId], [Title], [Brief], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'Chào mừng các bạn đến với môn CTDL', N'Chào mừng các bạn đến với môn CTDL, lớp học lại học kỳ 2 năm 2019-2020', N'GioiThieu', N'<p>
Trong khoa học máy tính, cấu trúc dữ liệu là một cách lưu dữ liệu trong máy tính sao cho nó có thể được sử dụng một cách hiệu quả.<br/>
Trong thiết kế nhiều loại chương trình, việc chọn cấu trúc dữ liệu là vấn đề quan trọng. Kinh nghiệm trong việc xây dựng các hệ thống lớn cho thấy khó khăn của việc triển khai chương trình, chất lượng và hiệu năng của kết quả cuối cùng phụ thuộc rất nhiều vào việc chọn cấu trúc dữ liệu tốt nhất.
<br/>
Mỗi loại cấu trúc dữ liệu phù hợp với một vài loại ứng dụng khác nhau, một số cấu trúc dữ liệu dành cho những công việc đặc biệt. Ví dụ, các B-tree đặc biệt phù hợp trong việc thiết kế cơ sở dữ liệu. Sau khi cấu trúc dữ liệu được chọn, người ta thường dễ nhận thấy thuật toán cần sử dụng. Đôi khi trình tự công việc diễn ra theo thứ tự ngược lại: cấu trúc dữ liệu được chọn do những bài toán quan trọng nhất định có thuật toán chạy tốt nhất với một số cấu trúc dữ liệu cụ thể. Trong cả hai trường hợp, việc lựa chọn cấu trúc dữ liệu là rất quan trọng.
</p>
<p class="text-success">Chào mừng bạn đến với CTDL !</p>', 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassAnnouncement] ([Id], [ClassId], [Title], [Brief], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'Thông báo về môn CTDL-HLI1', N'Thông báo về môn CTDL-HLI1, trường ĐH Mở TP.HCM', N'ThongBao', N'<p>
	Thông báo về môn CTDL-HLI1 như sau: <br/>
	- Mã MH: ITEC2501 <br/>
	- Thời gian học: từ ngày 07/02/20-  đến ngày 10/04/20 <br/>
	- Khoa phụ trách: Công Nghệ Thông Tin <br/>
	- Khoa phụ trách: Công Nghệ Thông Tin <br/>
	- Số tín chỉ: 04 (03 LT, 01 TH) <br/>
	- Tổng số buổi: 10 buổi LT + 10 buổi thực hành <br/>
	- Phòng học thực hành: NK.PM05 (Tiết 123456 - các ngày thứ 6) <br/>
	- Phòng học lý thuyết: NK.002 (Tiết 7890 - các ngày thứ 6) 
</p>', 1, 1, CAST(N'2020-01-02T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassAnnouncement] ([Id], [ClassId], [Title], [Brief], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'Thông báo chung về môn học', N'Các thông tin, quy định và cách làm việc của môn học', N'ThongBao', N'<p>
	Các thông tin cần biết về môn CTDL-HLI1 như sau: <br/>
	- Đánh giá quá trình: là điểm tổng của các bài tập (Lý thuyết và thực hành) <br/>
	- Điểm quá trình chiếm 40% tổng điểm <br/>
	- Đánh giá cuối kỳ: thi cuối kỳ trên giấy, được sử dụng tài liệu, do phòng khảo thí phụ trách.<br/>
	- Điểm cuối kỳ chiếm 60% tổng điểm <br/>
	<br/>
	Ngoài ra, các bạn cần trang bị một số kỹ năng như sau:
	<ul>
		<li>Kỹ năng sử dụng Visual Studio 2010, với ngôn ngữ lập trình C++</li>
		<li>Kỹ năng sử dụng GitHub, để nộp bài !</li>
		<li>Kỹ năng làm việc nhóm, để làm bài nhóm !</li>
	<ul>
</p>
<p class="text-info">Các bạn sinh viên lưu ý ! Chúc các bạn học tốt !</p>', 1, 1, CAST(N'2020-01-03T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ClassAnnouncement] OFF
GO
SET IDENTITY_INSERT [Business].[ClassAssignment] ON 
GO
INSERT [Business].[ClassAssignment] ([Id], [ClassId], [Name], [AssignmentType], [AssignmentContent], [AssignmentUrl], [GroupNo], [DueDate], [RequireSubmit], [SubmitType], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'Bài tập LT chương 1 và 2 xx', N'BaiTapGK', N'Yêu cầu làm thành file Word, và nộp online! xx', N'assets/Class/1/Assignment\436a4f16-3c2c-4156-a063-0c4174d89fb2.xlsx', 1, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 1, N'Per-Online-Doc', 1, 1, CAST(N'2019-12-20T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-20T23:00:44.247' AS DateTime))
GO
INSERT [Business].[ClassAssignment] ([Id], [ClassId], [Name], [AssignmentType], [AssignmentContent], [AssignmentUrl], [GroupNo], [DueDate], [RequireSubmit], [SubmitType], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'Bài tập TH chương 1 và 2', N'BaiTapGK', N'Yêu cầu nộp qua GitHub', N'assets/Class/Assignment/ctdl/c1.pdf', 3, CAST(N'2020-02-28T00:00:00.000' AS DateTime), 1, N'Grp-Online-Git', 1, 1, CAST(N'2019-12-20T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassAssignment] ([Id], [ClassId], [Name], [AssignmentType], [AssignmentContent], [AssignmentUrl], [GroupNo], [DueDate], [RequireSubmit], [SubmitType], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'Bài tập LT chương 3', N'BaiTapGK', N'Yêu cầu làm thành file Word, và nộp online!', N'assets/Class/Assignment/ctdl/c1.pdf', 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), 1, N'Per-Online-Doc', 1, 1, CAST(N'2019-12-20T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassAssignment] ([Id], [ClassId], [Name], [AssignmentType], [AssignmentContent], [AssignmentUrl], [GroupNo], [DueDate], [RequireSubmit], [SubmitType], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'Bài tập TH chương 3', N'BaiTapGK', N'Yêu cầu nộp qua GitHub', N'assets/Class/Assignment/ctdl/c1.pdf', 3, CAST(N'2020-02-28T00:00:00.000' AS DateTime), 1, N'Grp-Online-Git', 1, 1, CAST(N'2019-12-20T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassAssignment] ([Id], [ClassId], [Name], [AssignmentType], [AssignmentContent], [AssignmentUrl], [GroupNo], [DueDate], [RequireSubmit], [SubmitType], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'Bài tập LT chương 4', N'BaiTapGK', N'Yêu cầu làm Online trên hệ thống !', NULL, 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), 1, N'Per-Online-Test', 1, 1, CAST(N'2019-12-20T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassAssignment] ([Id], [ClassId], [Name], [AssignmentType], [AssignmentContent], [AssignmentUrl], [GroupNo], [DueDate], [RequireSubmit], [SubmitType], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'Bài tập TH chương 4', N'BaiTapGK', N'Yêu cầu nộp qua GitHub', N'assets/Class/Assignment/ctdl/c1.pdf', 3, CAST(N'2020-02-28T00:00:00.000' AS DateTime), 1, N'Grp-Online-Git', 1, 1, CAST(N'2019-12-20T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassAssignment] ([Id], [ClassId], [Name], [AssignmentType], [AssignmentContent], [AssignmentUrl], [GroupNo], [DueDate], [RequireSubmit], [SubmitType], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, N'Bài tập LT chương 5', N'BaiTapGK', N'Yêu cầu làm Online trên hệ thống !', NULL, 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), 1, N'Per-Online-Test', 1, 1, CAST(N'2019-12-20T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassAssignment] ([Id], [ClassId], [Name], [AssignmentType], [AssignmentContent], [AssignmentUrl], [GroupNo], [DueDate], [RequireSubmit], [SubmitType], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, N'Bài tập TH chương 5', N'BaiTapGK', N'Yêu cầu nộp qua GitHub', N'assets/Class/Assignment/ctdl/c1.pdf', 3, CAST(N'2020-02-28T00:00:00.000' AS DateTime), 1, N'Grp-Online-Git', 1, 1, CAST(N'2019-12-20T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassAssignment] ([Id], [ClassId], [Name], [AssignmentType], [AssignmentContent], [AssignmentUrl], [GroupNo], [DueDate], [RequireSubmit], [SubmitType], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 1, N'Bài tập rèn luyện và nâng cao', N'BaiTapRenLuyen', N'Không cần nộp', N'assets/Class/Assignment/ctdl/c1.pdf', 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), 0, N'Per-Offline', 2, 1, CAST(N'2019-12-20T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-21T13:24:51.707' AS DateTime))
GO
INSERT [Business].[ClassAssignment] ([Id], [ClassId], [Name], [AssignmentType], [AssignmentContent], [AssignmentUrl], [GroupNo], [DueDate], [RequireSubmit], [SubmitType], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 1, N'test online new xay xay asda s', N'BaiTapRenLuyen', N'test online new abc xay xay asdasd', NULL, 1, CAST(N'2020-04-14T00:00:00.000' AS DateTime), 0, N'Per-Online-Test', 1, 27, CAST(N'2020-02-21T21:07:57.680' AS DateTime), 27, CAST(N'2020-02-21T21:11:52.343' AS DateTime))
GO
SET IDENTITY_INSERT [Business].[ClassAssignment] OFF
GO
SET IDENTITY_INSERT [Business].[ClassAssignmentExam] ON 
GO
INSERT [Business].[ClassAssignmentExam] ([Id], [ClassAssignmentId], [ExamId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 5, 1, N'KTRA [CẤU TRÚC DỮ LIỆU] CHƯƠNG 1 | Khoa Công Nghệ Thông Tin | Trường Đại học Mở TP.HCM', 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-21T21:00:04.123' AS DateTime))
GO
INSERT [Business].[ClassAssignmentExam] ([Id], [ClassAssignmentId], [ExamId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 7, 2, N'KTRA [CẤU TRÚC DỮ LIỆU] CHƯƠNG 2 | Khoa Công Nghệ Thông Tin | Trường Đại học Mở TP.HCM', 1, 27, CAST(N'2020-02-21T21:00:22.423' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassAssignmentExam] ([Id], [ClassAssignmentId], [ExamId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 12, 3, N'KTRA [CẤU TRÚC DỮ LIỆU] CHƯƠNG 3 | Khoa Công Nghệ Thông Tin | Trường Đại học Mở TP.HCM', 1, 27, CAST(N'2020-02-21T21:08:18.913' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ClassAssignmentExam] OFF
GO
SET IDENTITY_INSERT [Business].[ClassAssignmentGroup] ON 
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (1, 2, 2, 8, 13)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (2, 2, 2, 9, 14)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (3, 2, 3, 10, 15)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (4, 2, 1, 11, 16)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (5, 2, 2, 12, 17)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (6, 2, 3, 13, 18)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (7, 2, 1, 14, 19)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (8, 2, 2, 15, 20)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (9, 2, 3, 16, 21)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (10, 2, 1, 17, 22)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (11, 2, 2, 18, 23)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (12, 2, 3, 19, 24)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (13, 2, 1, 20, 25)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (14, 2, 2, 21, 26)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (15, 4, 3, 8, 13)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (16, 4, 1, 9, 14)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (17, 4, 2, 10, 15)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (18, 4, 3, 11, 16)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (19, 4, 1, 12, 17)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (20, 4, 2, 13, 18)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (21, 4, 3, 14, 19)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (22, 4, 1, 15, 20)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (23, 4, 2, 16, 21)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (24, 4, 3, 17, 22)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (25, 4, 1, 18, 23)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (26, 4, 2, 19, 24)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (27, 4, 3, 20, 25)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (28, 4, 1, 21, 26)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (29, 6, 2, 8, 13)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (30, 6, 3, 9, 14)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (31, 6, 1, 10, 15)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (32, 6, 2, 11, 16)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (33, 6, 3, 12, 17)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (34, 6, 1, 13, 18)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (35, 6, 2, 14, 19)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (36, 6, 3, 15, 20)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (37, 6, 1, 16, 21)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (38, 6, 2, 17, 22)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (39, 6, 3, 18, 23)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (40, 6, 1, 19, 24)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (41, 6, 2, 20, 25)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (42, 6, 3, 21, 26)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (43, 8, 1, 8, 13)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (44, 8, 1, 9, 14)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (45, 8, 2, 10, 15)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (46, 8, 2, 11, 16)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (47, 8, 3, 12, 17)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (48, 8, 3, 13, 18)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (49, 8, 1, 14, 19)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (50, 8, 1, 15, 20)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (51, 8, 2, 16, 21)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (52, 8, 2, 17, 22)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (53, 8, 3, 18, 23)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (54, 8, 3, 19, 24)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (55, 8, 1, 20, 25)
GO
INSERT [Business].[ClassAssignmentGroup] ([Id], [ClassAssignmentId], [GroupNo], [StudentId], [UserId]) VALUES (56, 8, 2, 21, 26)
GO
SET IDENTITY_INSERT [Business].[ClassAssignmentGroup] OFF
GO
SET IDENTITY_INSERT [Business].[ClassDocument] ON 
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'Đề cương môn học', N'Đề cương môn học CTDL', N'assets/Class/Document/DCMH/ctdl/DCMH_CTDL_2015.pdf', NULL, N'DCMH', N'Doc', N'Sau khi hoàn tất môn học, sinh viên có khả năng phân tích một vấn đề, xác định cấu
trúc dữ liệu cùng với giải thuật thích hợp để giải quyết vấn đề', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'Chương 1 - Danh sách', N'Chương 1 - Danh sách: Danh sách đặc, danh sách đơn, danh sách liên kết kép...', N'assets/Class/Document/slide/ctdl/C1_CTDL_va_GT.pptx', NULL, N'BaiGiang', N'Slide', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'Chương 2 - Xếp thứ tự –
Tìm kiếm', N'2.1 Xếp thứ tự.
2.1.1 BubbleSort.
2.1.2 SelectionSort.
2.1.3 InsertionSort.
2.1.4 InterchangeSort.
2.1.6 MergeSort.
2.2 Tìm kiếm (trên danh sách
đặc).
2.2.1 Tìm kiếm tuần tuần tự.
2.2.2 Tìm kiếm nhị phân', N'assets/Class/Document/slide/ctdl/C2_CTDL_CoBan.pptx', NULL, N'BaiGiang', N'Slide', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'Chương 3 - Cây', N'3.1 Khái niệm cơ bản.
3.1.1 Một số khái niệm: Định nghĩa
cây, bậc của nút, bậc của cây,
nút cha, nút con, chiều dài
đường đi.
3.1.2 Định nghĩa cây nhị phân.
3.2 Cây nhị phân tìm kiếm.
3.2.1 Định nghĩa.
3.2.2 Khai báo cấu trúc; Khởi tạo
cây rỗng.
3.2.3 Các thao tác cơ bản: Thêm,
tìm, xóa, duyệt (NLR, LNR,
LRN)', N'assets/Class/Document/slide/ctdl/C3_XepThuTu_TimKiem.pptx', NULL, N'BaiGiang', N'Slide', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'Chương 4 - Bảng băm', N'4.1 Các khái niệm.
4.2 Biến đổi khóa.
4.3 Giải quyết đụng độ', N'assets/Class/Document/slide/ctdl/C4_HashTable.pptx', NULL, N'BaiGiang', N'Slide', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'Chương 5 - B-Tree', N'5.1 Khái niệm B-cây.
5.1.1 Định nghĩa B-cây.
5.1.2 Chiều cao của B-cây.
5.2 Các thao tác cơ bản trên Bcây.
5.2.1 Tìm kiếm trên B-cây.
5.2.2 Tạo một B-cây.
5.2.3 Tách một nút trong B-cây.
5.2.4 Chèn một khóa vào B-cây.
5.3 Xóa một khóa khỏi B-cây.', N'assets/Class/Document/slide/ctdl/C5_BTree.pptx', NULL, N'BaiGiang', N'Slide', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, N'Sách Cấu trúc dữ liệu và giải thuật', N'Lê Xuân trường, Giáo trình Cấu trúc Dữ liệu, Đại học Mở TP.HCM, 2015', N'assets/Class/Document/book/ctdl/ctdl1.pdf', NULL, N'Book', N'Doc', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, N'Sách Cấu trúc dữ liệu và giải thuật', N'Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein,
Introduction to Algorithms, Third Edition, The MIT Press, 2009.', N'assets/Class/Document/book/ctdl/ctdl1.pdf', NULL, N'DocThem', N'Doc', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 1, N'Bài tập CTDL', N'Bài luyện tập', N'assets/Class/Document/bt/ctdl1.pdf', NULL, N'BaiTap', N'Doc', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 1, N'Đề thi thử giữa kỳ', N'Đề thi giữa kỳ', N'assets/Class/Document/dethi/ctdl1.pdf', NULL, N'DeThiMau', N'Doc', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 1, N'Đề thi thử cuối kỳ', N'Đề thi cuối kỳ', N'assets/Class/Document/dethi/ctdl1.pdf', NULL, N'DeThiMau', N'Doc', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 1, N'Code mẫu chương 1', N'Source code các bài tập chương 1', N'assets/Class/Document/code/code_c1.rar', NULL, N'SourceCode', N'Zip', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 1, N'Code mẫu chương 2', N'Source code các bài tập chương 2', N'assets/Class/Document/code/code_c1.rar', NULL, N'SourceCode', N'Zip', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 1, N'Code mẫu chương 3', N'Source code các bài tập chương 3', N'assets/Class/Document/code/code_c1.rar', NULL, N'SourceCode', N'Zip', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 1, N'Code mẫu chương 4', N'Source code các bài tập chương 4', N'assets/Class/Document/code/code_c1.rar', NULL, N'SourceCode', N'Zip', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassDocument] ([Id], [ClassId], [Title], [Description], [LinkUrl], [ImageUrl], [DocumentType], [Type], [Content], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, 1, N'Code mẫu chương 5', N'Source code các bài tập chương 5', N'assets/Class/Document/code/code_c1.rar', NULL, N'SourceCode', N'Zip', NULL, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ClassDocument] OFF
GO
SET IDENTITY_INSERT [Business].[ClassMember] ON 
GO
INSERT [Business].[ClassMember] ([Id], [ClassId], [MemberId], [MemberRole], [Description], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 1, N'Giảng viên', N'Giảng viên phụ trách môn học', N'Phụ trách các công việc trực tiếp trong dạy học', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassMember] ([Id], [ClassId], [MemberId], [MemberRole], [Description], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, 2, N'Trợ giảng 1', N'Trợ lý giảng viên phụ trách môn học', N'Phụ trách các công việc gián tiếp trong dạy học', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassMember] ([Id], [ClassId], [MemberId], [MemberRole], [Description], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, 3, N'Trợ giảng 2', N'Trợ lý giảng viên phụ trách môn học', N'Phụ trách các công việc gián tiếp trong dạy học', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ClassMember] OFF
GO
SET IDENTITY_INSERT [Business].[ClassScoreConfig] ON 
GO
INSERT [Business].[ClassScoreConfig] ([Id], [ClassId], [ScoreType], [Description], [Percentage], [RefAssignmentId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'QuaTrinh', N'Chương 1 và 2, phần lý thuyết', 5, 1, N'BT cá nhân', 2, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-16T18:01:32.557' AS DateTime))
GO
INSERT [Business].[ClassScoreConfig] ([Id], [ClassId], [ScoreType], [Description], [Percentage], [RefAssignmentId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'QuaTrinh', N'Chương 1 và 2, phần thực hành', 5, 2, N'BT nhóm', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassScoreConfig] ([Id], [ClassId], [ScoreType], [Description], [Percentage], [RefAssignmentId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'QuaTrinh', N'Chương 3, phần lý thuyết', 5, 3, N'BT cá nhân', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassScoreConfig] ([Id], [ClassId], [ScoreType], [Description], [Percentage], [RefAssignmentId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'QuaTrinh', N'Chương 3, phần thực hành', 5, 4, N'BT nhóm', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassScoreConfig] ([Id], [ClassId], [ScoreType], [Description], [Percentage], [RefAssignmentId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'QuaTrinh', N'Chương 4, phần lý thuyết', 5, 5, N'BT cá nhân', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassScoreConfig] ([Id], [ClassId], [ScoreType], [Description], [Percentage], [RefAssignmentId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'QuaTrinh', N'Chương 4, phần thực hành', 5, 6, N'BT nhóm', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassScoreConfig] ([Id], [ClassId], [ScoreType], [Description], [Percentage], [RefAssignmentId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, N'QuaTrinh', N'Chương 5, phần lý thuyết', 5, 7, N'BT cá nhân', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassScoreConfig] ([Id], [ClassId], [ScoreType], [Description], [Percentage], [RefAssignmentId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, N'QuaTrinh', N'Chương 5, phần thực hành', 5, 8, N'BT nhóm', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassScoreConfig] ([Id], [ClassId], [ScoreType], [Description], [Percentage], [RefAssignmentId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 1, N'CuoiKy', N'Thi cuối kỳ, tâp trung theo phòng khảo thí (Đề đóng)', 60, NULL, N'Cá nhân', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-16T18:01:18.653' AS DateTime))
GO
SET IDENTITY_INSERT [Business].[ClassScoreConfig] OFF
GO
SET IDENTITY_INSERT [Business].[ClassSession] ON 
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'LT-01', N'Chương 1', N'Chương 1', CAST(N'2020-02-28T00:00:00.000' AS DateTime), N'LT', N'13:00', N'16:00', 4, N'OU - NK.002', N'Buổi 1 - Lý thuyết', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-13T20:08:06.910' AS DateTime))
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'LT-02', N'Chương 1', N'Chương 1', CAST(N'2020-03-06T00:00:00.000' AS DateTime), N'LT', N'13:00', N'16:00', 4, N'OU - NK.002', N'Buổi 2 - Lý thuyết', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-13T20:08:25.927' AS DateTime))
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'LT-03', N'Chương 2', N'Chương 2', CAST(N'2020-02-21T00:00:00.000' AS DateTime), N'LT', N'13:00', N'16:00', 4, N'OU - NK.002', N'Buổi 3 - Lý thuyết', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'LT-04', N'Chương 2', N'Chương 2', CAST(N'2020-02-28T00:00:00.000' AS DateTime), N'LT', N'13:00', N'16:00', 4, N'OU - NK.002', N'Buổi 4 - Lý thuyết', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'LT-05', N'Chương 3', N'Chương 2', CAST(N'2020-03-06T00:00:00.000' AS DateTime), N'LT', N'13:00', N'16:00', 4, N'OU - NK.002', N'Buổi 5 - Lý thuyết', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'LT-06', N'Chương 3', N'Chương 2', CAST(N'2020-03-13T00:00:00.000' AS DateTime), N'LT', N'13:00', N'16:00', 4, N'OU - NK.002', N'Buổi 6 - Lý thuyết', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, N'LT-07', N'Chương 4', N'Chương 2', CAST(N'2020-03-20T00:00:00.000' AS DateTime), N'LT', N'13:00', N'16:00', 4, N'OU - NK.002', N'Buổi 7 - Lý thuyết', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, N'LT-08', N'Chương 4', N'Chương 2', CAST(N'2020-03-27T00:00:00.000' AS DateTime), N'LT', N'13:00', N'16:00', 4, N'OU - NK.002', N'Buổi 8 - Lý thuyết', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 1, N'LT-09', N'Chương 5', N'Chương 2', CAST(N'2020-04-03T00:00:00.000' AS DateTime), N'LT', N'13:00', N'16:00', 4, N'OU - NK.002', N'Buổi 9 - Lý thuyết', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 1, N'LT-10', N'Chương 5', N'Chương 2', CAST(N'2020-04-10T00:00:00.000' AS DateTime), N'LT', N'13:00', N'16:00', 4, N'OU - NK.002', N'Buổi 10 - Lý thuyết', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 1, N'TH-01', N'Chương 1', N'Chương 1', CAST(N'2020-02-14T00:00:00.000' AS DateTime), N'TH', N'07:00', N'11:30', 6, N'OU - NK.PM05', N'Buổi 1 - Thực hành', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 1, N'TH-02', N'Chương 1', N'Chương 1', CAST(N'2020-02-21T00:00:00.000' AS DateTime), N'TH', N'07:00', N'11:30', 6, N'OU - NK.PM05', N'Buổi 2 - Thực hành', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 1, N'TH-03', N'Chương 2', N'Chương 1', CAST(N'2020-02-28T00:00:00.000' AS DateTime), N'TH', N'07:00', N'11:30', 6, N'OU - NK.PM05', N'Buổi 3 - Thực hành', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 1, N'TH-04', N'Chương 2', N'Chương 1', CAST(N'2020-03-06T00:00:00.000' AS DateTime), N'TH', N'07:00', N'11:30', 6, N'OU - NK.PM05', N'Buổi 4 - Thực hành', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 1, N'TH-05', N'Chương 3', N'Chương 1', CAST(N'2020-03-13T00:00:00.000' AS DateTime), N'TH', N'07:00', N'11:30', 6, N'OU - NK.PM05', N'Buổi 5 - Thực hành', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, 1, N'TH-06', N'Chương 3', N'Chương 1', CAST(N'2020-03-20T00:00:00.000' AS DateTime), N'TH', N'07:00', N'11:30', 6, N'OU - NK.PM05', N'Buổi 6 - Thực hành', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 1, N'TH-07', N'Chương 4', N'Chương 1', CAST(N'2020-03-27T00:00:00.000' AS DateTime), N'TH', N'07:00', N'11:30', 6, N'OU - NK.PM05', N'Buổi 7 - Thực hành', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, 1, N'TH-08', N'Chương 4', N'Chương 1', CAST(N'2020-04-03T00:00:00.000' AS DateTime), N'TH', N'07:00', N'11:30', 6, N'OU - NK.PM05', N'Buổi 8 - Thực hành', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, 1, N'TH-09', N'Chương 5', N'Chương 1', CAST(N'2020-04-10T00:00:00.000' AS DateTime), N'TH', N'07:00', N'11:30', 6, N'OU - NK.PM05', N'Buổi 9 - Thực hành', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ClassSession] ([Id], [ClassId], [Session], [Brief], [ClassContent], [DateOfClass], [SessionType], [FromTime], [ToTime], [TotalClassUnit], [Location], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, 1, N'TH-10', N'Chương 5', N'Chương 1', CAST(N'2020-04-17T00:00:00.000' AS DateTime), N'TH', N'07:00', N'11:30', 6, N'OU - NK.PM05', N'Buổi 10 - Thực hành', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ClassSession] OFF
GO
SET IDENTITY_INSERT [Business].[ClassStudent] ON 
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 8, N'Thành viên', CAST(1.20 AS Decimal(5, 2)), N'Failed', N'Lớp [DH16CS01], Khoa học máy tính, khóa 2016-2020 | Update tự động bởi GV !', 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, 9, N'Thành viên', CAST(2.23 AS Decimal(5, 2)), N'Failed', N'Lớp [DH19IM01], Khoa học máy tính, khóa 2018-2020 | Update tự động bởi GV !', 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, 10, N'Thành viên', CAST(2.93 AS Decimal(5, 2)), N'Failed', N'Lớp [DH19IM01], Khoa học máy tính, khóa 2018-2020 | Update tự động bởi GV !', 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, 11, N'Thành viên', CAST(3.92 AS Decimal(5, 2)), N'Failed', N'Lớp [DH19IM01], Khoa học máy tính, khóa 2018-2020 | Update tự động bởi GV !', 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, 12, N'Thành viên', CAST(4.80 AS Decimal(5, 2)), N'Failed', N'Lớp [DH19IM01], Khoa học máy tính, khóa 2018-2020 | Update tự động bởi GV !', 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, 13, N'Thành viên', CAST(3.90 AS Decimal(5, 2)), N'Failed', NULL, 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, 14, N'Thành viên', CAST(4.98 AS Decimal(5, 2)), N'Failed', NULL, 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, 15, N'Thành viên', CAST(3.48 AS Decimal(5, 2)), N'Failed', NULL, 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 1, 16, N'Thành viên', CAST(5.51 AS Decimal(5, 2)), N'Passed', NULL, 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 1, 17, N'Thành viên', CAST(2.88 AS Decimal(5, 2)), N'Failed', NULL, 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 1, 18, N'Thành viên', CAST(3.36 AS Decimal(5, 2)), N'Failed', NULL, 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 1, 19, N'Thành viên', CAST(4.50 AS Decimal(5, 2)), N'Failed', NULL, 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 1, 20, N'Thành viên', CAST(4.14 AS Decimal(5, 2)), N'Failed', NULL, 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudent] ([Id], [ClassId], [StudentId], [StudentRole], [FinalScore], [FinalResult], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 1, 21, N'Thành viên', CAST(4.76 AS Decimal(5, 2)), N'Failed', NULL, 1, 1, CAST(N'2020-01-20T23:05:30.047' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
SET IDENTITY_INSERT [Business].[ClassStudent] OFF
GO
SET IDENTITY_INSERT [Business].[ClassStudentScore] ON 
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, 11, 4, CAST(3.33 AS Decimal(5, 2)), N'QuaTrinh', 5, N'Sinh viên làm bài test online trên hệ thống !', 5, 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime), 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, 8, 1, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 1, 9, 2, CAST(8.50 AS Decimal(5, 2)), N'QuaTrinh', 5, N'MSSV: 1551010010
', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-18T22:42:19.943' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 1, 10, 3, CAST(7.50 AS Decimal(5, 2)), N'QuaTrinh', 5, N'MSSV: 1751012087
', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-18T22:42:19.943' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 1, 11, 4, CAST(6.50 AS Decimal(5, 2)), N'QuaTrinh', 5, N'MSSV: 1651012040
', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-18T22:42:19.943' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 1, 12, 5, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 1, 13, 6, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 1, 14, 7, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 1, 15, 8, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, 1, 16, 9, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 1, 17, 10, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, 1, 18, 11, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, 1, 19, 12, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, 1, 20, 13, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, 1, 21, 14, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 1, 1, 27, CAST(N'2020-02-18T15:55:33.757' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, 1, 8, 1, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, 1, 9, 2, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, 1, 10, 3, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, 1, 11, 4, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, 1, 12, 5, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, 1, 13, 6, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, 1, 14, 7, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, 1, 15, 8, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, 1, 16, 9, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, 1, 17, 10, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (32, 1, 18, 11, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (33, 1, 19, 12, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (34, 1, 20, 13, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (35, 1, 21, 14, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 2, 1, 27, CAST(N'2020-02-18T16:19:38.140' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (36, 1, 8, 1, CAST(2.00 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1651012009
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (37, 1, 9, 2, CAST(3.00 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1551010010
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (38, 1, 10, 3, CAST(3.00 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1751012087
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (39, 1, 11, 4, CAST(5.50 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1651012040
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (40, 1, 12, 5, CAST(8.00 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1851010037
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (41, 1, 13, 6, CAST(6.50 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1351010056
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (42, 1, 14, 7, CAST(8.30 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1851010064
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (43, 1, 15, 8, CAST(5.80 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1651010108
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (44, 1, 16, 9, CAST(8.50 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1851010109
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (45, 1, 17, 10, CAST(4.50 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1854060203
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (46, 1, 18, 11, CAST(5.60 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1551010123
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (47, 1, 19, 12, CAST(7.50 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1751010169
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (48, 1, 20, 13, CAST(6.90 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1551010137
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (49, 1, 21, 14, CAST(7.70 AS Decimal(5, 2)), N'CuoiKy', 60, N'MSSV: 1651012213
', 9, 1, 27, CAST(N'2020-02-18T20:05:26.060' AS DateTime), 27, CAST(N'2020-02-18T23:46:52.887' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (50, 1, 8, 1, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (51, 1, 9, 2, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (52, 1, 10, 3, CAST(10.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N'MSSV: 1751012087
', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-18T23:45:29.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (53, 1, 11, 4, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (54, 1, 12, 5, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (55, 1, 13, 6, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (56, 1, 14, 7, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (57, 1, 15, 8, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (58, 1, 16, 9, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (59, 1, 17, 10, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (60, 1, 18, 11, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (61, 1, 19, 12, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (62, 1, 20, 13, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (63, 1, 21, 14, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 3, 1, 27, CAST(N'2020-02-18T20:20:36.107' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (64, 1, 8, 1, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (65, 1, 9, 2, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (66, 1, 10, 3, CAST(5.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N'MSSV: 1751012087', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-25T00:24:07.703' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (67, 1, 11, 4, CAST(2.50 AS Decimal(5, 2)), N'QuaTrinh', 5, N'MSSV: 1651012040', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-25T00:24:07.703' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (68, 1, 12, 5, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (69, 1, 13, 6, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (70, 1, 14, 7, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (71, 1, 15, 8, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (72, 1, 16, 9, CAST(8.20 AS Decimal(5, 2)), N'QuaTrinh', 5, N'MSSV: 1851010109', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-25T00:24:07.703' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (73, 1, 17, 10, CAST(3.50 AS Decimal(5, 2)), N'QuaTrinh', 5, N'MSSV: 1854060203', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-25T00:24:07.703' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (74, 1, 18, 11, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (75, 1, 19, 12, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (76, 1, 20, 13, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-26T10:32:45.760' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (77, 1, 21, 14, CAST(2.70 AS Decimal(5, 2)), N'QuaTrinh', 5, N'MSSV: 1651012213', 8, 1, 27, CAST(N'2020-02-25T00:07:10.847' AS DateTime), 27, CAST(N'2020-02-25T00:24:07.703' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (78, 1, 8, 1, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (79, 1, 9, 2, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (80, 1, 10, 3, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (81, 1, 11, 4, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (82, 1, 12, 5, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (83, 1, 13, 6, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (84, 1, 14, 7, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (85, 1, 15, 8, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (86, 1, 16, 9, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (87, 1, 17, 10, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (88, 1, 18, 11, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (89, 1, 19, 12, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (90, 1, 20, 13, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (91, 1, 21, 14, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 4, 1, 27, CAST(N'2020-02-26T11:47:38.030' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (92, 1, 8, 1, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (93, 1, 9, 2, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (94, 1, 10, 3, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (95, 1, 12, 5, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (96, 1, 13, 6, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (97, 1, 14, 7, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (98, 1, 15, 8, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (99, 1, 16, 9, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (100, 1, 17, 10, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (101, 1, 18, 11, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (102, 1, 19, 12, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (103, 1, 20, 13, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (104, 1, 21, 14, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 5, 1, 27, CAST(N'2020-02-26T11:47:38.407' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (105, 1, 8, 1, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (106, 1, 9, 2, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (107, 1, 10, 3, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (108, 1, 11, 4, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (109, 1, 12, 5, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (110, 1, 13, 6, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (111, 1, 14, 7, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (112, 1, 15, 8, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (113, 1, 16, 9, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (114, 1, 17, 10, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (115, 1, 18, 11, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (116, 1, 19, 12, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (117, 1, 20, 13, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (118, 1, 21, 14, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 6, 1, 27, CAST(N'2020-02-26T11:47:38.453' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (119, 1, 8, 1, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (120, 1, 9, 2, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (121, 1, 10, 3, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (122, 1, 11, 4, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (123, 1, 12, 5, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (124, 1, 13, 6, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (125, 1, 14, 7, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (126, 1, 15, 8, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (127, 1, 16, 9, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (128, 1, 17, 10, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (129, 1, 18, 11, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (130, 1, 19, 12, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (131, 1, 20, 13, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
INSERT [Business].[ClassStudentScore] ([Id], [ClassId], [StudentId], [ClassStudentId], [Score], [ScoreType], [Percentage], [Note], [RefScoreConfig], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (132, 1, 21, 14, CAST(0.00 AS Decimal(5, 2)), N'QuaTrinh', 5, N' Do không có điểm, nên hệ thống tự cập nhật về 0.0 !', 7, 1, 27, CAST(N'2020-02-26T11:47:38.490' AS DateTime), 27, CAST(N'2020-02-26T11:47:38.550' AS DateTime))
GO
SET IDENTITY_INSERT [Business].[ClassStudentScore] OFF
GO
SET IDENTITY_INSERT [Business].[Comment] ON 
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, NULL, N'Class', 1, 1, N'Xin chào các bạn sinh viên! Chào mừng bạn đến với lớp học CTDL của thầy Hiếu. Bạn nào có thắc mắc gì hay trao đổi gì, hãy comment trên trang này nhé!', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'Class', 1, 2, N'Xin chào thầy và các bạn, mình là TA của lớp mình !', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 2, CAST(N'2020-01-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'Class', 1, 2, N'Xin chào thầy và các bạn, mình là TA của lớp mình !', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 3, CAST(N'2020-01-16T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'Class', 1, 2, N'Em xin chào thầy ạ', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 14, CAST(N'2020-01-16T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, NULL, N'Class', 1, 1, N'Gastropub cardigan jean shorts, kogi Godard PBR&B lo-fi locavore. Organic chillwave vinyl Neutra. Bushwick Helvetica cred freegan, crucifix Godard craft beer deep v mixtape cornhole Truffaut master cleanse pour-over Odd Future beard. Portland polaroid iPhone.', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 13, CAST(N'2020-01-14T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, NULL, N'Class', 1, 1, N'Tại tiệc cưới sáng 30/1, Văn Đức trao nhẫn cho Nhật Linh, trước khi cùng nhau rót rượu, cắt bánh mừng hạnh phúc để khép lại buổi hôn lễ.', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 14, CAST(N'2020-01-14T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, NULL, N'Class', 1, 1, N'Ông Nguyễn Đức Chung nói Hà Nội cần chuẩn bị từ 15 đến 20 triệu khẩu trang để đủ cung cấp cho người dân phòng dịch viêm phổi.', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 13, CAST(N'2020-01-14T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, NULL, N'Class', 1, 1, N'Tỉnh trưởng Hồ Bắc nói viêm phổi cấp do virus nCoV gây ra đặc biệt nghiêm trọng tại thành phố Hoàng Cương.', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 15, CAST(N'2020-01-14T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, NULL, N'Class', 1, 1, N'Chưa từng kết hôn nhưng ông Đinh Minh Nhật, 57 tuổi, ở xã Ia Hlốp, huyện Chư Sê có 106 con là trẻ mồ côi hoặc bị bỏ rơi từ lọt lòng.', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 16, CAST(N'2020-01-14T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, NULL, N'Class', 1, 1, N'Giới chức Trung Quốc cho biết số người thiệt mạng do dịch viêm phổi cấp đã tăng lên 170 và số ca nhiễm bệnh là 7.711.', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), 15, CAST(N'2020-01-14T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, NULL, N'Class', 1, 1, N'Test cái xem nào!', 1, NULL, NULL, 15, CAST(N'2020-01-30T16:33:04.050' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, NULL, N'Class', 1, 1, N'không biết xài sao nữa !', 1, NULL, NULL, 18, CAST(N'2020-01-30T16:51:40.403' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 11, N'Class', 1, 2, N'Hey, bạn có biết xài ko?', 1, NULL, NULL, 18, CAST(N'2020-01-30T16:51:52.747' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 11, N'Class', 1, 2, N'Tính đến 15h20 ngày 30/1, có 3 trường hợp là công dân Việt Nam dương tính với virus corona gồm 2 người ở Hà Nội, 1 ở Thanh Hóa.', 1, NULL, NULL, 18, CAST(N'2020-01-30T16:54:32.647' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 12, N'Class', 1, 2, N'Các ổ mại dâm Trung Quốc tại Philippines dùng ứng dụng trò chuyện trực tuyến để che giấu hoạt động của mình. Hoạt động bán dâm được thực hiện qua ứng dụng như đặt đồ ăn nhanh.', 1, NULL, NULL, 18, CAST(N'2020-01-30T16:56:04.933' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, NULL, N'Class', 1, 1, N'Tác phẩm hợp tác giữa Việt Nam và Hong Kong xứng đáng bị gọi là thảm họa của mùa phim Tết năm nay bởi chất lượng tệ hại cùng nội dung rối rắm, phi lý.', 1, NULL, NULL, 18, CAST(N'2020-01-30T16:57:02.817' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 12, N'Class', 1, 2, N'Trên chuyến bay từ TP.HCM ra Hải Phòng, hai mẹ con trú ở Cần Thơ có biểu hiện ngứa họng, khó thở và sốt. Một hành khách khác bị sốt nhưng đã bỏ đi sau khi hạ cánh.', 1, NULL, NULL, 18, CAST(N'2020-01-30T16:57:21.617' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, 5, N'Class', 1, 2, N'Huyền My, người yêu tin đồn của Quang Hải, chơi thân với vợ Văn Đức. Trên trang cá nhân, cô đăng ảnh chụp ở lễ cưới và gửi lời chúc hạnh phúc đến người bạn thân.', 1, NULL, NULL, 18, CAST(N'2020-01-30T16:57:58.240' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, 16, N'Class', 1, 2, N'Ngoài người yêu tin đồn của Quang Hải, cầu thủ Phạm Xuân Mạnh cũng gây chú ý khi sánh đôi cùng bạn gái Dung Trần tại lễ cưới của Văn Đức - Nhật Linh.', 1, NULL, NULL, 18, CAST(N'2020-01-30T16:58:54.747' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, NULL, N'Class', 1, 1, N'Sau khi tốt nghiệp chuyên ngành Sư phạm Giáo dục Mầm non của Cao đẳng Sư phạm Nghệ An, bà xã Văn Đức hiện làm công việc chuyên viên trang điểm.', 1, NULL, NULL, 16, CAST(N'2020-01-30T17:02:13.440' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, NULL, N'Class', 1, 1, N'Ngoài việc bị tống tiền 100 triệu đồng để chuộc lại trang cá nhân, Huyền Trang lo sợ sẽ bị phát tán hình ảnh nhạy cảm từng gửi cho bạn trai cách đây 2 năm lên mạng xã hội.', 1, NULL, NULL, 16, CAST(N'2020-01-30T17:04:19.853' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, 20, N'Class', 1, 2, N'Trên trang cá nhân, K-ICM úp mở việc đi du học trong thời gian ngắn. Nhà sản xuất 9X cho biết anh sẽ đi vào tháng 2 để thực hiện ước mơ của mình.', 1, NULL, NULL, 16, CAST(N'2020-01-30T17:04:48.877' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, 12, N'Class', 1, 2, N'Trên trang cá nhân, K-ICM úp mở việc đi du học trong thời gian ngắn. Nhà sản xuất 9X cho biết anh sẽ đi vào tháng 2 để thực hiện ước mơ của mình.', 1, NULL, NULL, 16, CAST(N'2020-01-30T17:06:16.737' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, NULL, N'Class', 1, 1, N'Tóc Tiên, Thiều Bảo Trâm và dàn sao diện áo 2 dây xuyên thấu sau Tết', 1, NULL, NULL, 16, CAST(N'2020-01-30T17:06:33.427' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, 12, N'Class', 1, 2, N'Sau kỳ nghỉ Tết Nguyên đán, dàn mỹ nhân Việt như Minh Hằng, Chi Pu, ca sĩ Lệ Quyên... vẫn giữ được vóc dáng thon thả, gợi cảm với vòng eo con kiến.', 1, NULL, NULL, 16, CAST(N'2020-01-30T17:06:45.913' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, 24, N'Class', 1, 2, N'Khánh Linh (The Face) mặc nhiều đồ bơi, áo hở eo... để phù hợp với không khí vùng biển Bali (Indonesia). Là người mẫu, chân dài 24 tuổi có chế độ giữ dáng khắt khe.', 1, NULL, NULL, 17, CAST(N'2020-01-30T17:08:44.883' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, 12, N'Class', 1, 2, N'Mới đây, cộng đồng mạng chia sẻ thông tin K-ICM chuẩn bị đi du học. Nhiều người hâm mộ cho biết nhà sản xuất trẻ sẽ đi du học từ tháng 2 và kéo dài trong thời gian ngắn.', 1, NULL, NULL, 17, CAST(N'2020-01-30T17:12:35.927' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, 12, N'Class', 1, 2, N'Ngoài việc bị tống tiền 100 triệu đồng để chuộc lại trang cá nhân, Huyền Trang lo sợ sẽ bị phát tán hình ảnh nhạy cảm từng gửi cho bạn trai cách đây 2 năm lên mạng xã hội.', 1, NULL, NULL, 17, CAST(N'2020-01-30T17:13:00.263' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, NULL, N'Class', 1, 1, N'Key event filtering (with key.enter )link There''s an easier way: bind to Angular''s keyup.enter pseudo-event. Then Angular calls the event handler only when the user presses Enter.', 1, NULL, NULL, 17, CAST(N'2020-01-30T17:16:51.147' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, 29, N'Class', 1, 2, N'Chào em !', 1, NULL, NULL, 27, CAST(N'2020-02-15T11:50:36.110' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Comment] ([Id], [ParentId], [CommentType], [CommentForId], [Level], [Content], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, NULL, N'Class', 1, 1, N'Thầy test cái nhé !', 1, NULL, NULL, 27, CAST(N'2020-02-15T11:50:52.590' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[Comment] OFF
GO
SET IDENTITY_INSERT [Business].[Exam] ON 
GO
INSERT [Business].[Exam] ([Id], [ExamTitle], [ExamDepartment], [ExamSchool], [SubjectId], [ExamType], [ExamLevel], [TotMinutes], [TotalQuestion], [TotalScore], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'KTRA [CẤU TRÚC DỮ LIỆU] CHƯƠNG 1', N'Khoa Công Nghệ Thông Tin', N'Trường Đại học Mở TP.HCM', 1, N'TracNghiem', 3, 15, 15, 15, N'Mã đề thi: 1911 (Sinh viên được sử dụng tài liệu giấy)
', 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Exam] ([Id], [ExamTitle], [ExamDepartment], [ExamSchool], [SubjectId], [ExamType], [ExamLevel], [TotMinutes], [TotalQuestion], [TotalScore], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'KTRA [CẤU TRÚC DỮ LIỆU] CHƯƠNG 2', N'Khoa Công Nghệ Thông Tin', N'Trường Đại học Mở TP.HCM', 1, N'TracNghiem', 3, 15, 15, 15, N'Mã đề thi: 1911 (Sinh viên được sử dụng tài liệu giấy)', 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Exam] ([Id], [ExamTitle], [ExamDepartment], [ExamSchool], [SubjectId], [ExamType], [ExamLevel], [TotMinutes], [TotalQuestion], [TotalScore], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'KTRA [CẤU TRÚC DỮ LIỆU] CHƯƠNG 3', N'Khoa Công Nghệ Thông Tin', N'Trường Đại học Mở TP.HCM', 1, N'TracNghiem', 3, 15, 15, 15, N'Mã đề thi: 1911 (Sinh viên được sử dụng tài liệu giấy)', 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[Exam] OFF
GO
SET IDENTITY_INSERT [Business].[ExamAnswer] ON 
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'CPU, Memory, RAM, HDD', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'CPU, Memory, Storage, I/O Devices', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'CPU, RAM, HDD, Mouse', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'Keyboard, Memory, RAM, Flash-Drive', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 2, N'Chi phí', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 2, N'Tính di động', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 2, N'Tốc độ', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 2, N'Kích thước', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 3, N'Nó biến mất khi máy tính tắt hoặc khởi động lại', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 3, N'Nội dung của nó không thể thay đổi', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 3, N'Nó không ổn định ', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 3, N'Dung lượng của RAM không thể thay đổi được', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 5, N'thành phần quan trọng nhất của máy tính', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 5, N'phần mềm quan trọng nhất của máy tính', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 5, N'yếu tố quan trọng nhất của máy tính', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, 5, N'phần cứng quan trọng nhất của máy tính', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 4, N'ROM –BIOS', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, 4, N'Bo mạch chủ', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, 4, N'Các chip RAM', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, 4, N'Bộ vi xử lý', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, 6, N'Phần mềm được nhúng vào trong một phần cứng và kiểm soát các chức năng của thiết bị ', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, 6, N'Phần mềm cho phép một hệ điều hành giao tiếp với một thiết bị. ', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, 6, N'Một loại phương tiện lưu trữ', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, 6, N'Một tiêu chuẩn mà một công ty muốn thực thi trên mỗi máy tính công ty', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, 7, N'Hình oval, hình chữ nhật có bo tròn thể hiện bắt đầu hoặc kết thúc', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, 7, N'Mũi tên thể hiện vòng lặp', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, 7, N'Hình bình hành thể hiện các lệnh vào, lệnh ra', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, 7, N'Hình chữ nhật thể hiện thao tác tính toán', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, 8, N'120 ký tự', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, 8, N'250 ký tự', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, 8, N'128 ký tự', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (32, 8, N'256 ký tự', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (33, 9, N'Ubuntu, Redhat, Windows', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (34, 9, N'iOS, Android, Ubuntu', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (35, 9, N'Redhat, Ubuntu, CentOS', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (36, 9, N'Windows, iOS, Redhat', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (37, 10, N'B2B', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (38, 10, N'B2C', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (39, 10, N'PPP', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (40, 10, N'G2C', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (41, 11, N'Ðúng', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:18:18.257' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (42, 11, N'Sai', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:18:39.493' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (43, 12, N'Ðúng', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:19:29.447' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (44, 12, N'Sai', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:29.450' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (45, 13, N'Ðúng', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:19:32.533' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (46, 13, N'Sai', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:32.537' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (47, 14, N'Ðúng', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:19:35.650' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (48, 14, N'Sai', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:35.657' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (49, 15, N'Ðúng', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:37.680' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (50, 15, N'Sai', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:19:37.683' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (51, 16, N'Ðúng', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:39.370' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (52, 16, N'Sai', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:19:39.377' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (53, 17, N'Ðúng', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:19:41.227' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (54, 17, N'Sai', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:41.233' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (55, 18, N'Ðúng', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:43.103' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (56, 18, N'Sai', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:19:43.110' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (57, 19, N'Ðúng', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:19:44.830' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (58, 19, N'Sai', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:44.837' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (59, 20, N'Ðúng', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:49.570' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (60, 20, N'Sai', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:19:49.573' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (61, 21, N'Công nghiệp', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:49.573' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (62, 21, N'Công nghệ', NULL, N'Ans-Text', 1, 2, 1, 1, CAST(N'2020-01-29T18:19:49.573' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (63, 21, N'Kỹ thuật', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:49.573' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (64, 21, N'Phương pháp', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:19:49.573' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (65, 22, N'Kinh nghiệm', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:28:59.740' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (66, 22, N'nhiệm vụ', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:28:59.743' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (67, 22, N'trải nghiệm', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:28:59.747' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (68, 22, N'trách nhiệm', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:28:59.747' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (69, 22, N'nghĩa vụ', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:28:59.747' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (70, 22, N'quá trình', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:28:59.747' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (71, 23, N'1024*1024*1024*1024', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:31:21.760' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (72, 23, N'1024*1024*1024', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:31:21.770' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (73, 23, N'1024*1024', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:31:21.770' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (74, 23, N'1024^4', NULL, N'Ans-Text', 1, 1, 1, 1, CAST(N'2020-01-29T18:31:21.770' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (75, 24, N'Read Only Memory / Read Access Memory', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:33:56.597' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (76, 24, N'Read Only Memory / Random Access Memory', NULL, N'Ans-Text', 1, 2, 1, 1, CAST(N'2020-01-29T18:33:56.607' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (77, 24, N'Random Only Memory / Read Access Memory', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:33:56.607' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (78, 24, N'Random Only Memory / Random Access Memory', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:33:56.610' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (79, 25, N'All Logic Union', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:35:11.810' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (80, 25, N'Arithmetic Logic Unit', NULL, N'Ans-Text', 1, 2, 1, 1, CAST(N'2020-01-29T18:35:11.810' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (81, 25, N'Arithmetic Logic Union', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:35:11.813' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamAnswer] ([Id], [QuestionId], [AnswerContent], [AnswerImage], [AnswerType], [IsCorrect], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (82, 25, N'Arithmetic Legal Unit', NULL, N'Ans-Text', 0, 0, 1, 1, CAST(N'2020-01-29T18:35:11.813' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ExamAnswer] OFF
GO
SET IDENTITY_INSERT [Business].[ExamDetail] ON 
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 1, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, 2, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, 3, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, 4, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, 5, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, 6, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, 7, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, 8, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 1, 9, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 1, 10, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 1, 11, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 1, 12, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 1, 13, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 1, 14, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 1, 15, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, 1, 16, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 1, 17, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, 1, 18, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, 1, 19, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, 1, 20, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, 1, 21, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, 1, 22, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, 1, 23, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, 1, 24, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamDetail] ([Id], [ExamId], [QuestionId], [Score], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, 1, 25, NULL, 1, 1, CAST(N'2020-02-03T20:37:18.687' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ExamDetail] OFF
GO
SET IDENTITY_INSERT [Business].[ExamQuestion] ON 
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Lựa chọn đáp án trả lời đúng nhất', N'Theo kiến trúc máy tính điện tử hiện đại, một máy tính bao gồm các thành phần', NULL, N'Text-1-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Lựa chọn đáp án trả lời đúng nhất', N'Điều gì sẽ được coi là một lợi thế của việc sử dụng một máy tính xách tay để ghi chép trên lớp nếu bạn là sinh viên?', NULL, N'Text-1-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Lựa chọn đáp án trả lời đúng nhất', N'Tại sao RAM được coi là bốc hơi?', NULL, N'Text-1-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'Lựa chọn đáp án trả lời đúng nhất', N'Thành phần bên trong nào thực hiện các tính toán và các phép toán logic?', NULL, N'Text-1-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'Lựa chọn đáp án trả lời đúng nhất', N'Hệ điều hành là', NULL, N'Text-1-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'Lựa chọn đáp án trả lời đúng nhất', N'Firmware đề cập đến điều gì?', NULL, N'Text-1-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'Lựa chọn đáp án trả lời đúng nhất', N'Phát biểu nào không chính xác về ngôn ngữ lưu đồ', NULL, N'Text-1-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'Lựa chọn đáp án trả lời đúng nhất', N'Mã ASCII chuẩn dùng 7 bit, biểu diễn được: ', NULL, N'Text-1-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'Lựa chọn đáp án trả lời đúng nhất', N'Các hệ điều hành họ Linux phổ biến bao gồm:', NULL, N'Text-1-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'Lựa chọn đáp án trả lời đúng nhất', N'Mô hình nào không phải là mô hình thương mại điện tử:', NULL, N'Text-1-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'Lựa chọn đúng sai', N'Mỗi ô nhớ có địa chỉ (address) dạng số thực và nội dung (content) dạng nhị phân.', NULL, N'Text-TF-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, N'Lựa chọn đúng sai', N'Trong ngôn ngữ C++, kiểu int có kích thước là 32 bit', NULL, N'Text-TF-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, N'Lựa chọn đúng sai', N'Con chuột, bàn phím, ổ cứng đều được gọi là thiết bị ngoại vi.', NULL, N'Text-TF-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, N'Lựa chọn đúng sai', N'Ổ đĩa cứng là bộ nhớ “dài hạn”, lưu trữ thông tin lâu dài.', NULL, N'Text-TF-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, N'Lựa chọn đúng sai', N'TCP là giao thức duy nhất được sử dụng trên mạng Internet', NULL, N'Text-TF-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, N'Lựa chọn đúng sai', N'Opera là chương trình soạn thảo văn bản trên Linux.', NULL, N'Text-TF-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, N'Lựa chọn đúng sai', N'Microsoft Excel không thể cài đặt trên hệ điều hành Linux', NULL, N'Text-TF-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, N'Lựa chọn đúng sai', N'Trong phần cứng máy tính, ta có thể thay đổi địa chỉ vật lý của NIC một cách dễ dàng.', NULL, N'Text-TF-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, N'Lựa chọn đúng sai', N'DNS là một dịch vụ ánh xạ các tên miền duy nhất tới các địa chỉ IP cụ thể.', NULL, N'Text-TF-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, N'Lựa chọn đúng sai', N'Hình ảnh dạng vector graphic được lưu dựa trên thông tin các điểm ảnh.', NULL, N'Text-TF-Choice', 1, 1, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, N'Lựa chọn đáp án phù hợp, chọn nhiều đáp án', N'_________________ là khái niệm dùng chỉ việc nghiên cứu và ứng dụng những thành tựu của một hay nhiều ngành khoa học, gắn liền với các giải pháp, các nguồn lực, nhằm giải quyết một công việc nào đó của xã hội.', NULL, N'Text-n-Choice', 2, 2, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, N'Lựa chọn đáp án phù hợp, chọn nhiều đáp án', N'Có nhiều định nghĩa khác nhau về tri thức. Có thể xem Tri thức là các cơ sở, thông tin, tài liệu, các hiểu biết có được bằng _______________________ hoặc do những tình huống, hoàn cảnh cụ thể.', NULL, N'Text-n-Choice', 2, 2, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, N'Lựa chọn đáp án phù hợp, chọn nhiều đáp án', N'1 PB = _______________________________________________ KB', NULL, N'Text-n-Choice', 2, 2, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, N'Lựa chọn đáp án phù hợp, chọn nhiều đáp án', N'ROM được viết tắt từ cụm từ ______________________________________, còn RAM thì được viết tắt từ cụm từ ___________________________________________', NULL, N'Text-n-Choice', 2, 2, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ExamQuestion] ([Id], [QuestionInstruction], [QuestionContent], [QuestionImage], [QuestionType], [TotMinutes], [TotScore], [SubjectId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, N'Lựa chọn đáp án phù hợp, chọn nhiều đáp án', N'ALU được viết tắt từ cụm từ _____________________________, dùng để thực hiện các phép tính _______________________, sử dụng dữ liệu trong thanh ghi', NULL, N'Text-n-Choice', 2, 2, 1, 1, 1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ExamQuestion] OFF
GO
SET IDENTITY_INSERT [Business].[News] ON 
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Traveling MRT with team', N'Traveling MRT with team', N'The Singapore Tourist Pass is a special ez-link card that offers tourist unlimited travel* on Singapore’s basic bus services, MRT and LRT trains for the duration that it is valid. You can now take in the sights and sounds of Singapore in the comfort of the island’s extensive train system and public bus network. At wallet-friendly prices, you do not have to worry about having insufficient funds for your transport needs with the Singapore Tourist Pass. All you have to do is to purchase the Singapore Tourist Pass, choose the number of day passes you require, use for your unlimited rides on buses and trains, and refund the card before you leave Singapore!', N'Company', N'Internal', 2, N'assets/img/news/news11.jpg', N'assets/img/news/news11_thump.jpg', 1, 1, 1, CAST(N'2018-11-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'VOST visitied Merlion', N'The Merlion (Malay: Singa-Laut, Chinese: 鱼尾狮, Tamil: மெர்லயன்) is the official mascot of Singapore, depicted as a mythical creature with a lion''s head and the body of a fish. Being of prominent symbolic nature to Singapore and Singaporeans in general, it is widely used to represent both the city state and its people in sports teams, advertising, branding, tourism and as a national personification.', N'Its name combines "mer", meaning the sea, and "lion". The fish body represents Singapore''s origin as a fishing village when it was called Temasek, which means "sea town" in Javanese. The lion head represents Singapore''s original name—Singapura—meaning "lion city" or "kota singa".

The symbol was designed by Alec Fraser-Brunner, a member of the Souvenir Committee and curator of the Van Kleef Aquarium, for the logo of the Singapore Tourism Board (STB) in use from 26 March 1964 to 1997 and has been its trademarked symbol since 20 July 1966. Although the STB changed their logo in 1997, the STB Act continues to protect the Merlion symbol.[2] Approval must be received from STB before it can be used. The Merlion appears frequently on STB-approved souvenirs. <br/> You’ve probably seen images of Singapore’s national icon, the mythical Merlion with the head of a lion and the body of a fish.

A fishy tale
A family of tourists posing in front of the Merlion
The body symbolises Singapore''s humble beginnings as a fishing village when it was called Temasek, meaning ''sea town'' in Old Javanese.
Its head represents Singapore’s original name, Singapura, or ‘lion city’ in Malay.

Today, you can glimpse this legend at Merlion Park. Spouting water from its mouth, the Merlion statue stands tall at 8.6 metres and weighs 70 tonnes.

This icon is a ‘must-see’ for tourists visiting Singapore, similar to other significant landmarks around the world.

Built by local craftsman Lim Nang Seng, it was unveiled on 15 September 1972 by then Prime Minister Lee Kuan Yew at the mouth of the Singapore River, to welcome all visitors to Singapore. ', N'Company', N'Internal', 2, N'assets/img/news/news10.jpg', N'Img/News/news10_thump.jpg', 2, 1, 1, CAST(N'2018-11-06T10:30:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'A night in Singapore', N'Singapore is a bustling city full of entertainment, culture, and friendly people.

Known for its multiculturalism and excessive wealth, there was no shortage spent on making it a number one destination for tourists.', N'Like any big city, during the day people are rushing to and from work.

But at night, the best parts of Singapore light up.

Check out our list of the best things to do in Singapore at night.', N'Company', N'Internal', 2, N'assets/img/news/news09.jpg', N'Img/News/news9.jpg', 3, 1, 1, CAST(N'2018-11-06T22:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'VOST enjoyed Gardens by the bay, Singapore', N'Gardens by the Bay is a nature park spanning 101 hectares (250 acres) of reclaimed land[2] in the Central Region of Singapore, adjacent to the Marina Reservoir. The park consists of three waterfront gardens: Bay South Garden (in Marina South), Bay East Garden (in Marina East) and Bay Central Garden (in Downtown Core and Kallang).[3] The largest of the gardens is Bay South Garden at 54 hectares (130 acres). Its Flower Dome is the largest glass greenhouse in the world.[4]', N'Gardens by the Bay is part of the nation''s plans to transform its "Garden City" to a "City in a Garden", with the aim of raising the quality of life by enhancing greenery and flora in the city. First announced by the Prime Minister, Lee Hsien Loong, at the National Day Rally in 2005, Gardens by the Bay was intended to be Singapore''s premier urban outdoor recreation space, and a national icon.

Being one of the popular tourist attractions in Singapore, the park received 6.4 million visitors in 2014, while topping its 20 millionth visitor mark in November 2015.[5]', N'Company', N'Internal', 2, N'assets/img/news/news08.jpg', N'Img/News/news08.jpg', 4, 1, 1, CAST(N'2018-11-05T15:30:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'VOST are having Sweetsoups', N'The 10 Most Delightful Popular Vietnamese Desserts to Indulge In', N'Vietnam is famous for its Pho soup, Bánh Mì sandwiches, and other delicious soups and rice noodles meals.

What about Vietnamese desserts?

Well, you will find yourself in dessert heaven if you like sweets and are open to trying new flavors and textures. Indeed, Vietnam has an endless list of desserts, from sweet soups to doughy rolls and cakes.

Not only you will find a wide variety of Vietnamese sweets to choose from, the best part is that they are made with healthy ingredients and are low in sugar!

In this article, you find a selection of 10 of the most delightful popular Vietnamese desserts. Get ready for an indulgent and exotic Vietnam dessert adventure.', N'Company', N'Internal', 2, N'assets/img/news/news07.jpg', N'Img/News/news07.jpg', 1, 1, 1, CAST(N'2018-11-14T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'VOST are having some snacks', N'We were looking for a quick and easy pizza recipe… just wanted a quick snack and Friday is always pizza night in our house!  I didn’t want to make dough, I was looking for something easier.', N'These Easy Pizza Snack Bites are what we came up with, we were shocked at how delicious these were!  The snack quickly became a second batch known as dinner!  These little guys took 8 minutes to whip up start to finish!', N'Company', N'Internal', 2, N'assets/img/news/news06.jpg', N'Img/News/news06.jpg', 3, 1, 1, CAST(N'2018-11-16T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'The 1st break-tea in the new Office', N'New spaces can sometimes be difficult to adjust to. Even if you’re relocating to a new area where you’ll be working for a company you’ve been with for years, the new environment itself can be distracting to your day to day work.', N'One of the best ways to get to work is to first ensure your surroundings maintain the important aspects of work environment: organisation, comfort, and functionality. <br/> “Having a cup of tea is not only tasty and refreshing, it gives you a moment to stop and think without distraction. Whether it’s to have a chat with a friend, ponder a business idea, or watch an inspirational video, the simple act of enjoying a cuppa can give you the time you need. All over the world, but especially in the UK, cups of tea provide a great excuse for colleagues to join together and have a chat. There’s no end to the great ideas dreamed up by people talking around the kettle or the water cooler.”
And that’s the point; the most important benefits of a tea break are reasonably unmeasurable. At the very least, they give us a chance to have a laugh and enjoy the company of our colleagues, most of the time.”', N'Company', N'Internal', NULL, N'assets/img/news/news05.jpg', N'Img/News/news05.jpg', 4, 1, 1, CAST(N'2018-12-18T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'Merry Xmas 2018', N'Wishing everyone a Merry Christmas and a Happy New year!', N'One of the best ways to get to work is to first ensure your surroundings maintain the important aspects of work environment: organisation, comfort, and functionality. <br/> “Having a cup of tea is not only tasty and refreshing, it gives you a moment to stop and think without distraction. Whether it’s to have a chat with a friend, ponder a business idea, or watch an inspirational video, the simple act of enjoying a cuppa can give you the time you need. All over the world, but especially in the UK, cups of tea provide a great excuse for colleagues to join together and have a chat. There’s no end to the great ideas dreamed up by people talking around the kettle or the water cooler.”', N'Company', N'Internal', NULL, N'assets/img/news/news05a.jpg', N'Img/News/news05a.jpg', 1, 1, 1, CAST(N'2018-12-25T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'Happy new Year 2019', N'Haaaaaappppyyy New Year!!', N'The new year is here and it’s time we celebrate with tons of excitement! We survived 2018 (and what a year that was) and now we’re rolling happily into 2019. The past year was pretty amazing for the Labiotech team, filled with great success and fantastic new members. As we enter the new year, we hope you’ll continue supporting up as you have and help us grow even more! Cheeeeeers! <br/> Overall, 2018 was a lot of fun and we’re pretty proud of our achievements. Now we’re going to rock on into 2019 and continue with our goal of bringing you the best biotech news in Europe. Stay tuned for more exciting developments. Bring it on!

We would love to hear your feedback – tell us what you love, what you don’t love so much, and what you would like to see happen in the future. ', N'Company', N'Internal', NULL, N'assets/img/news/news04.jpg', N'Img/News/news04.jpg', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'Annual Company Dinner 2019', N'The Annual Dinner 2019 will be held on Friday the 8th of March @ 7.30pm in the Radisson Blu Hotel, Golden Lane, Dublin 8.

Dress code is smart casual and there is a late bar extension, tickets are now on sale €65 each. All tickets must be pre-booked no walk up facility on the night.', N'Some background


The Past Pupils Annual dinner is the Union’s single biggest event. The dinner has occurred for over 80 years and is a unique gathering of past pupils of Terenure College in a relaxed and friendly setting.


The dinner occurs usually either in February or March each year. The dinner is held in a Dublin hotel and is pre booked by availing of the automated booking system on this web site. Details of the dinner (cost , location , dress code ,times etc) are all set out on this web site and are typically available at least two months before the dinner takes place. All tickets must be paid prior to the dinner and no money can be accepted on the evening of the dinner.', N'Company', N'Internal', NULL, N'assets/img/news/news03.jpg', N'Img/News/news03.jpg', 1, 1, 1, CAST(N'2019-02-22T18:30:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'Happy Women day ', N'Happy Women day  2019', N'Celebrate International Women’s Day with these empowering Happy Women’s Day quotes. International Women’s Day or IWD is remembered all around the world every March 8. It’s also celebrated on August 9th each year in South Africa under the name National Women’s Day as a public holiday. It is the celebration of the achievements of women all over the planet for their achievements in all aspects of society and civilization including social, economic, cultural and political arenas.

In some countries, IWD is celebrated as a day of appreciation much like Mother’s Day. For other countries, however, International Women’s Day is a day which highlights the political and human rights struggles of women worldwide.', N'Company', N'Internal', NULL, N'assets/img/news/news02.jpg', N'Img/News/news02.jpg', 1, 1, 1, CAST(N'2019-03-08T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, N'Thank you', N'Thank you', N'The dinner is open to all past pupils of Terenure College no matter what year you have left the College.
While any past pupil is welcome to attend the dinner any year it is the common practice that year groups attend in five year cycles with the pupils leaving this year for example enjoying their first annual re union dinner five years from now and then repeating thereafter every five years. It is also typical that a number of co coordinators from each year group work to publicise the dinner with their fellow past pupils to generate support and ensure a successful dinner for that year group attending. Details of the co coordinators are also posted on the website well in advance of the dinner.

The President of the Past Pupils Union invites a number of guests each year. The guests include presidents of other past pupils unions, Carmelites, teaching staff from the College and friends of the College.', N'Company', N'Internal', NULL, N'assets/img/news/news01a.jpg', N'Img/News/news01a.jpg', 1, 1, 1, CAST(N'2019-02-22T18:30:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, N'The Power of Teamwork', N'We believe in the power of teamwork, not just between individuals but also between companies and organisations. No man is an island, no company too.', N'The Power of Teamwork

We believe in the power of teamwork, not just between individuals but also between companies and organisations. No man is an island, no company too.

At APPOiNT we believe that our unique positions (locations too), experience and the synergy of our team can help companies scale their backend support without limits. (They say sky in the limit, we believe the universe is)

Our company was born with the understanding of the growing pains and challenges that tech companies are facing in developed countries i.e. Scarcity of human resources and space cost and constraint. Therefore we think out of the box(country) and look-out to develop solutions for these challenges.

We are looking forward to an opportunity to work with you. We believe our solution will ease your growing pains. Allow us to talk to you. We are based in Singapore and operating in Vietnam.', N'Company', N'Internal', NULL, N'assets/img/news/news01.jpg', N'Img/News/news01.jpg', 1, 1, 1, CAST(N'2019-02-22T18:30:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[News] OFF
GO
SET IDENTITY_INSERT [Business].[ReferenceDocument] ON 
GO
INSERT [Business].[ReferenceDocument] ([Id], [Type], [Title], [Authors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Content], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Conference-Proceeding', N'Handling Organization Name Unknown Word in
Chinese-Vietnamese Machine Translation', N'Phuoc Tran, Tan Le, Dien Dinh, Thao Nguyen ', 10, 11, 2013, N'Hanoi, Vietnam', N'2013 International Conference on Computing & Communication Technologies -
Research, Innovation, and Vision for the Future', N'https://rivf2020.rmit.edu.vn/', N'242 - 248', NULL, NULL, N'978-1-4799-1349-7', N'IEEE, Scopus', N'assets/Thesis/Reference/4_1.pdf', NULL, N'Unknown word (UKW) is an obvious problem of
machine translation and named entity (NE) is the most common
UKW type. In this paper, we will present a new approach based
on the meaning relationship in Chinese and Vietnamese to retranslate organization name UKW. This is the most complicated
NE because it consists of other NEs and entities. Applying this
approach to Chinese-Vietnamese statistical machine translation
(SMT), experimental results show that our approach has
significantly improved machine’s performance.', NULL, N'Chinese-Vietnamese SMT, unknown word, named
entity, organization name', N'1', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ReferenceDocument] ([Id], [Type], [Title], [Authors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Content], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Book', N'Foundations of Computational Linguistics, Man-Machine Communication in natural language Version 8.0', N'ROLAND HAUSSER', NULL, NULL, 2010, N'Germany', N'Institut für Germanistik', NULL, NULL, NULL, NULL, NULL, NULL, N'assets/Thesis/Reference/4_2.pdf', NULL, NULL, NULL, NULL, N'1', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ReferenceDocument] ([Id], [Type], [Title], [Authors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Content], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Conference-Proceeding', N'Informational Linguistics: Computer, Internet, Artificial Intelligence and Language', N'Barovich A.', 10, 2, 2019, N'Okinawa, Japan', N'ICAIIC 2019 - Artificial Intelligence in Information and Communication', N'https://ieeexplore.ieee.org/xpl/conhome/8665865/proceeding', N'008-013', N'10.1109/ICAIIC.2019.8668989', NULL, N'978-1-5386-7822-0', N'IEEE, Scopus', N'assets/Thesis/Reference/4_6.pdf', NULL, N'Modern technological progress is clearly mediated via the informational and communicational conceptualizations, which are first of all of language nature. Interdependence and syncretism of human cognitive activity create unlimited demand for knowledge interpretation of certain semantic format - information. Informational Linguistics is a discipline, dedicated to the interdisciplinary investigation of the specifics of communication contents.', NULL, N'Linguistics
,
Semantics
,
Internet
,
Computational modeling
,
Artificial intelligence
,
Informatics
,
Programming', N'1', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ReferenceDocument] ([Id], [Type], [Title], [Authors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Content], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'Conference-Proceeding', N'Language Post Positioned Characteristic Based Chinese-Vietnamese
Statistical Machine Translation Method', N'Jianyalin He, Zhengtao Yu, Changtao Lv, Hua Lai, Shengxiang Gao ,Yang Zhang', 5, 12, 2017, N'Singapore, Singapore', N'Asian Language Processing (IALP), International Conference 2017', NULL, N'180-187', N'10.1109/IALP.2017.8300574', NULL, N'978-1-5386-1981-0', N'IEEE, Scopus', N'assets/Thesis/Reference/4_7.pdf', NULL, N'According to the typical characteristics of Vietnamese modifiers post positioned, a Chinese Vietnamese statistical machine translation method that fuses language post positioned characteristic function was proposed. In this method, firstly we analyzed the grammar differences between Chinese and Vietnamese, and extracted the difference of attribute position, adverbial position and qualifier order. Secondly we defined ordering block based on those difference, and added mapping method of ordering block to decoding algorithm in phrase based statistical machine translation model, then recorded N-best candidate translations and its score P produced by decoding. Thirdly reordered ordering block with language post positioned characteristic reordering algorithm and estimated score D by unconditional maximum likelihood probability distribution. Finally we chose the best translation based on score P and score D. We used lexicalized reordering model based phrase statistical machine translation as contrast experiment. The results of experiment show that our method effectively improves the quality of translation.', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ReferenceDocument] ([Id], [Type], [Title], [Authors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Content], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'Journal-Article', N'Modeling workflow to design machine translation applications for public
health practice', N'Anne M. Turner, Megumu K. Brownstein, Kate Cole, Hilary Karasz, Katrin Kirchhoff', 7, 10, 2014, N'USA', N'Journal of Biomedical Informatics, Elsevier Inc', NULL, N'10-15', N'http://dx.doi.org/10.1016/j.jbi.2014.10.005', NULL, NULL, N'ISI, Web of Science', N'assets/Thesis/Reference/4_8.pdf', NULL, N'Objective: Provide a detailed understanding of the information workflow processes related to translating
health promotion materials for limited English proficiency individuals in order to inform the design of
context-driven machine translation (MT) tools for public health (PH).
Materials and methods: We applied a cognitive work analysis framework to investigate the translation
information workflow processes of two large health departments in Washington State. Researchers conducted interviews, performed a task analysis, and validated results with PH professionals to model translation workflow and identify functional requirements for a translation system for PH.
Results: The study resulted in a detailed description of work related to translation of PH materials, an
information workflow diagram, and a description of attitudes towards MT technology. We identified a
number of themes that hold design implications for incorporating MT in PH translation practice. A PH
translation tool prototype was designed based on these findings.
Discussion: This study underscores the importance of understanding the work context and information
workflow for which systems will be designed. Based on themes and translation information workflow
processes, we identified key design guidelines for incorporating MT into PH translation work. Primary
amongst these is that MT should be followed by human review for translations to be of high quality
and for the technology to be adopted into practice.
Conclusion: The time and costs of creating multilingual health promotion materials are barriers to translation. PH personnel were interested in MT’s potential to improve access to low-cost translated PH materials, but expressed concerns about ensuring quality. We outline design considerations and a potential
machine translation tool to best fit MT systems into PH practice.', NULL, N'Public health informatics, 
Workflow
Public health practice, 
Natural language processing, 
Human centered design', N'1', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ReferenceDocument] ([Id], [Type], [Title], [Authors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Content], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'Journal-Article', N'A Character Level Based and Word Level Based Approach for ChineseVietnamese Machine Translation', N'Phuoc Tran, Dien Dinh, and Hien T. Nguyen', NULL, 6, 2016, NULL, N'Computational Intelligence and Neuroscience', N'http://dx.doi.org/10.1155/2016/9821608', NULL, N'10.1155/2016/9821608', NULL, NULL, N'ISI, Web of Science', N'assets/Thesis/Reference/4_9.pdf', NULL, N'Chinese and Vietnamese have the same isolated language; that is, the words are not delimited by spaces. In machine translation,
word segmentation is often done first when translating from Chinese or Vietnamese into different languages (typically English)
and vice versa. However, it is a matter for consideration that words may or may not be segmented when translating between two
languages in which spaces are not used between words, such as Chinese and Vietnamese. Since Chinese-Vietnamese is a lowresource language pair, the sparse data problem is evident in the translation system of this language pair.Therefore, while translating,
whether it should be segmented or not becomes more important. In this paper, we propose a new method for translating Chinese to
Vietnamese based on a combination of the advantages of character level and word level translation. In addition, a hybrid approach
that combines statistics and rules is used to translate on the word level. And at the character level, a statistical translation is used.
The experimental results showed that our method improved the performance of machine translation over that of character or word
level translation.', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ReferenceDocument] ([Id], [Type], [Title], [Authors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Content], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'Journal-Article', N'Combining Advanced Methods in
Japanese-Vietnamese Neural Machine Translation', N'Thi-Vinh Ngo, Thanh-Le Ha, Phuong-Thai Nguyen, Le-Minh Nguyen', NULL, 5, 2018, NULL, N'Computational Intelligence and Neuroscience', N'http://dx.doi.org/10.1155/2016/9821608', NULL, N'10.1155/2016/9821608', NULL, NULL, N'ISI, Web of Science', N'assets/Thesis/Reference/4_11.pdf', NULL, N'Neural machine translation (NMT) systems have
recently obtained state-of-the art in many machine translation
systems between popular language pairs because of the availability of data. For low-resourced language pairs, there are
few researches in this field due to the lack of bilingual data.
In this paper, we attempt to build the first NMT systems for
a low-resourced language pairs:Japanese-Vietnamese. We have
also shown significant improvements when combining advanced
methods to reduce the adverse impacts of data sparsity and
improve the quality of NMT systems. In addition, we proposed
a variant of Byte-Pair Encoding algorithm to perform effective
word segmentation for Vietnamese texts and alleviate the rareword problem that persists in NMT systems.', NULL, N'Neural Machine Translation, Japanese - Vietnamese Translation, Low-resourced Neural Machine Translation,
Byte-Pair Encoding, Back Translation, Mix-Source', N'1', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ReferenceDocument] OFF
GO
SET IDENTITY_INSERT [Business].[School] ON 
GO
INSERT [Business].[School] ([Id], [SchoolCode], [SchoolName], [SchoolNameEng], [SchoolType], [YearOfFoundation], [SchoolAddress], [SchoolPhone], [WebSite], [Description], [BriefName], [LogoUrl], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'HCMOU', N'Trường Đại học Mở TP.HCM', N'Ho Chi Minh City Open University', N'Public School', 1990, N'35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'+8428-38364748', N'http://ou.edu.vn/', N'Được thành lập vào năm 1990 và trở thành trường đại học công lập từ năm 2006, đến nay Trường Đại học Mở Thành phố Hồ Chí Minh là trường đại học đa ngành trực thuộc Bộ Giáo dục và Đào tạo, có nhiệm vụ đào tạo đại học và sau đại học, với các hình thức đào tạo chính quy và giáo dục thường xuyên, đào tạo các điểm vệ tinh,…nhằm đáp ứng nhu cầu học tập đa dạng của xã hội, góp phần tăng cường đội ngũ cán bộ khoa học-kỹ thuật cho đất nước.', N'HCMC OU', N'assets/img/logo/logo-ou.png', 1, 1, CAST(N'2019-12-30T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[School] ([Id], [SchoolCode], [SchoolName], [SchoolNameEng], [SchoolType], [YearOfFoundation], [SchoolAddress], [SchoolPhone], [WebSite], [Description], [BriefName], [LogoUrl], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'HCMUTE', N'Trường Đại Học Sư Phạm Kỹ Thuật - Tp.HCM', N'HCMC University of Technology and Education', N'Public School', 1972, NULL, NULL, N'http://hcmute.edu.vn/', N'Trường đại học Sư phạm Kỹ thuật Tp. Hồ Chí Minh được hình thành và phát triển trên cơ sở Ban Cao đẳng Sư phạm Kỹ thuật - thành lập ngày 05.10.1962. Ngày 21.9.1972, Trường được đổi tên thành Trung tâm Cao đẳng Sư phạm Kỹ thuật Nguyễn Trường Tộ Thủ Đức và được nâng cấp thành Trường đại học Giáo dục Thủ Đức vào năm 1974.

Ngày 27.10.1976, Thủ tướng Chính phủ đã ký quyết định thành lập Trường đại học Sư phạm Kỹ thuật Thủ Đức trên cơ sở Trường đại học Giáo dục Thủ Đức. Năm 1984, Trường đại học Sư phạm Kỹ thuật Thủ Đức hợp nhất với Trường trung học Công nghiệp Thủ Đức và đổi tên thành Trường đại học Sư phạm Kỹ thuật Tp. Hồ Chí Minh. Năm 1991, Trường đại học Sư phạm Kỹ thuật Tp. Hồ Chí Minh sát nhập thêm Trường Sư phạm Kỹ thuật 5 và phát triển cho đến ngày nay.', N'HCMC UTE', N'assets/img/logo/logo-hcmute.png', 1, 1, CAST(N'2019-12-30T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[School] ([Id], [SchoolCode], [SchoolName], [SchoolNameEng], [SchoolType], [YearOfFoundation], [SchoolAddress], [SchoolPhone], [WebSite], [Description], [BriefName], [LogoUrl], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'HCMUIT', N'Trường Đại học Công nghệ Thông Tin, ĐHQGHCM', N'HCMC University of Information Technology – Viet Nam National University Ho Chi Minh City', N'Public School', 2006, NULL, NULL, N'https://www.uit.edu.vn/', N'Trường Đại học Công nghệ Thông tin, Đại học Quốc gia Thành phố Hồ Chí Minh (ĐHQG-HCM) là trường đại học công lập đào tạo về công nghệ thông tin và truyền thông (CNTT&TT) được thành lập theo quyết định số 134/2006/QĐ-TTg ngày 08/06/2006 của Thủ tướng Chính phủ trên cơ sở Trung tâm Phát triển Công nghệ Thông tin. Là trường thành viên của ĐHQG-HCM, trường ĐH CNTT có nhiệm vụ đào tạo nguồn nhân lực công nghệ thông tin góp phần tích cực vào sự phát triển của nền công nghiệp công nghệ thông tin Việt Nam, đồng thời tiến hành nghiên cứu khoa học và chuyển giao công nghệ thông tin tiên tiến, đặc biệt là hướng vào các ứng dụng nhằm góp phần đẩy mạnh sự nghiệp công nghiệp hóa, hiện đại hóa đất nước.', N'VNUHCM - UIT', N'assets/img/logo/logo-uit.png', 1, 1, CAST(N'2019-12-30T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[School] ([Id], [SchoolCode], [SchoolName], [SchoolNameEng], [SchoolType], [YearOfFoundation], [SchoolAddress], [SchoolPhone], [WebSite], [Description], [BriefName], [LogoUrl], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'HCMUSSH', N'rường Đại học Khoa học Xã hội và Nhân văn, ĐHQGHCM', N'University of Social Sciences and Humanities – Viet Nam National University Ho Chi Minh City', N'Public School', 1954, NULL, NULL, N'http://hcmussh.edu.vn/', N'Trường ĐH KHXH&NV có lịch sử hơn 60 năm hình thành và phát triển. Sau Hiệp định Genève 1954, trên cơ sở Đại học Văn khoa ở Hà Nội, Trường được tái lập ở Sài Gòn vào tháng 11 năm 1955 với tên gọi là Trường Cao đẳng dự bị Văn khoa Pháp và là trường thành viên của Viện Đại học Quốc gia Việt Nam ở Sài Gòn. Đến ngày 01-3-1957, Trường chính thức thành lập với tên gọi Trường Đại học Văn khoa thuộc Viện Đại học Sài Gòn. Từ năm 1976 đến năm 1996, Trường trở thành bộ phận các ngành khoa học xã hội và nhân văn trong Đại học Tổng hợp Thành phố Hồ Chí Minh.

Ngày 30-3-1996, Trường mang tên Trường Đại học Khoa học Xã hội và Nhân văn thuộc hệ thống Đại học Quốc gia Thành phố Hồ Chí Minh theo quyết định số 1233/QĐ-BGD&ĐT của Bộ trưởng Bộ Giáo dục và Đào tạo.', N'VNUHCM - USSH', N'assets/img/logo/logo-hcmussh.png', 1, 1, CAST(N'2019-12-30T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[School] ([Id], [SchoolCode], [SchoolName], [SchoolNameEng], [SchoolType], [YearOfFoundation], [SchoolAddress], [SchoolPhone], [WebSite], [Description], [BriefName], [LogoUrl], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'HCMUS', N'Trường Đại học Khoa học Tự nhiên, ĐHQG-HCM', N'University of Natural Sciences  – Viet Nam National University Ho Chi Minh City', N'Public School', 1954, NULL, NULL, N'https://www.hcmus.edu.vn/', N'Trường ĐH KHTN, ĐHQG-HCM là trung tâm đào tạo đại học, sau đại học, cung cấp nguồn nhân lực, đội ngũ chuyên gia trình độ cao trong các lĩnh vực khoa học cơ bản, khoa học liên ngành, khoa học công nghệ mũi nhọn, có năng lực sáng tạo, làm việc trong môi trường cạnh tranh quốc tế; là nơi thực hiện những nghiên cứu khoa học đỉnh cao tạo ra các sản phẩm tinh hoa đáp ứng nhu cầu phát triển KHCN và yêu cầu phát triển kinh tế - xã hội ngày càng cao của đất nước, phù hợp với xu thế phát triển thế giới.', N'VNUHCM - US', N'assets/img/logo/logo-hcmus.png', 1, 1, CAST(N'2019-12-30T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[School] ([Id], [SchoolCode], [SchoolName], [SchoolNameEng], [SchoolType], [YearOfFoundation], [SchoolAddress], [SchoolPhone], [WebSite], [Description], [BriefName], [LogoUrl], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'UAH', N'Đại học Kiến trúc TP.Hồ Chí Minh', N'University of Architecture HCMC ', N'Public School', 1926, NULL, NULL, N'http://uah.edu.vn/', N'Năm 2016 này Đại học Kiến trúc TP.Hồ Chí Minh sẽ kỷ niệm 40 năm ngày thành lập trường.  Nếu coi việc thành lập ban Kiến trúc (hay còn gọi là khoa Kiến trúc) năm 1926 của trường Mỹ thuật Đông Dương là khởi đầu công cuộc đào tạo KTS ở Việt Nam, thì đây là dịp kỷ niệm 40 năm của Đại học Kiến trúc TP.Hồ Chí Minh và tiếp nối 65 năm ĐH Kiến trúc Sài Gòn – 90 năm đào tạo kiến trúc sư.', N'UAH', N'assets/img/logo/logo-uah.png', 1, 1, CAST(N'2019-12-30T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[School] ([Id], [SchoolCode], [SchoolName], [SchoolNameEng], [SchoolType], [YearOfFoundation], [SchoolAddress], [SchoolPhone], [WebSite], [Description], [BriefName], [LogoUrl], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'PTIT', N'Học viện Công nghệ Bưu Chính Viễn Thông', N'Posts and Telecommunications Institute of Technology', N'Public School', 1953, NULL, NULL, N'http://portal.ptit.edu.vn/', N'Học viện Công nghệ Bưu chính Viễn thông – trường đại học công lập trực thuộc Bộ Thông tin & Truyền thông thực hiện sứ mạng Nghiên cứu khoa học, Đào tạo phát triển nguồn nhân lực chất lượng cao trong lĩnh vực Thông tin và Truyền thông với mục tiêu“Xây dựng Học viện Công nghệ Bưu chính Viễn thông trở thành trường Đại học trọng điểm quốc gia trong lĩnh vực Thông tin và Truyền thông tại Việt Nam”.

Để đạt được mục tiêu trên, chúng ta sẽ không ngừng nâng cao chất lượng, mở rộng quy mô nghiên cứu và đào tạo, tăng cường hợp tác với các cơ quan tổ chức, cá nhân trong và ngoài nước góp phần đào tạo nên những giá trị tri thức mới của Việt Nam, với đội ngũ chuyên nghiệp tâm huyết, đủ bản lĩnh và năng lực hội nhập quốc tế.', N'PTIT', N'assets/img/logo/logo-ptit.png', 1, 1, CAST(N'2019-12-30T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[School] ([Id], [SchoolCode], [SchoolName], [SchoolNameEng], [SchoolType], [YearOfFoundation], [SchoolAddress], [SchoolPhone], [WebSite], [Description], [BriefName], [LogoUrl], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'HCMUE', N'Trường Đại học Sư pham Thành phố Hồ Chí Minh', N'Ho Chi Minh City University of Education', N'Public School', 1976, NULL, NULL, N'https://hcmue.edu.vn/', N'Hiện nay Trường ĐH Sư Phạm TP.HCM là một trong 22 trường Đại học trọng điểm quốc gia, và là 1 trong 2 trường đại học sư phạm trọng điểm của cả nước, đóng vai trò nòng cốt, đầu tàu đối với hệ thống các trường sư phạm và phổ thông ở phía Nam.', N'HCMUE', N'assets/img/logo/logo-hcmue.png', 1, 1, CAST(N'2019-12-30T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[School] ([Id], [SchoolCode], [SchoolName], [SchoolNameEng], [SchoolType], [YearOfFoundation], [SchoolAddress], [SchoolPhone], [WebSite], [Description], [BriefName], [LogoUrl], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'TDTU', N'Trường Đại học Tôn Đức Thắng', N'Ton Duc Thang University', N'Public School', 1996, NULL, NULL, N'https://www.tdtu.edu.vn/', N'Đại học Tôn Đức Thắng (TDTU) là đại học công lập thuộc Tổng Liên đoàn Lao động Việt Nam; thành lập ngày 24/9/1997. Đến tháng 8/2019, TDTU được Hệ thống xếp hạng ARWU (Academic Ranking of World Universities) xếp vị trí số 1 Việt Nam và thuộc Top 1000 đại học tốt nhất thế giới.', N'TDTU', N'assets/img/logo/logo-tdtu.png', 1, 1, CAST(N'2019-12-30T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[School] ([Id], [SchoolCode], [SchoolName], [SchoolNameEng], [SchoolType], [YearOfFoundation], [SchoolAddress], [SchoolPhone], [WebSite], [Description], [BriefName], [LogoUrl], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'SGU', N'Trường Đại học Sài Gòn', N'Saigon University', N'Public School', 2007, NULL, NULL, N'https://sgu.edu.vn/', N'Trường Đại học Sài Gòn được thành lập theo Quyết định số 478/QĐ-TTg ngày 25/04/2007 của Thủ tướng Chính phủ trên cơ sở nâng cấp Trường Cao đẳng Sư phạm Thành phố Hồ Chí Minh. Đại học Sài Gòn là cơ sở giáo dục Đại học công lập trực thuộc UBND TP. Hồ Chí Minh và chịu sự quản lý Nhà nước về giáo dục của Bộ Giáo dục và Đào tạo. Đại học Sài Gòn là trường đào tạo đa ngành, đa lĩnh vực. Đại học Sài Gòn đào tạo từ trình độ cao đẳng, đại học và sau đại học. Đại học Sài Gòn đào tạo theo 2 phương thức: chính quy và không chính quy (vừa làm vừa học, liên thông). Tốt nghiệp Đại học Sài Gòn người học được cấp các bằng cấp: cử nhân, kỹ sư, thạc sỹ..', N'SGU', N'assets/img/logo/logo-sgu.png', 1, 1, CAST(N'2019-12-30T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[School] OFF
GO
SET IDENTITY_INSERT [Business].[Student] ON 
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'1654050052', 5, CAST(N'1998-01-01T00:00:00.000' AS DateTime), 1, N'Under-Student', N'DH19IM01', N'Hệ thống thông tin quản lý , Khóa 2016', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'1654050051', 6, CAST(N'1998-10-19T00:00:00.000' AS DateTime), 1, N'Under-Student', N'DH19IM01', N'Hệ thống thông tin quản lý , Khóa 2016', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'1654052049', 7, CAST(N'1998-03-11T00:00:00.000' AS DateTime), 1, N'Under-Student', N'DH19IM01', N'Hệ thống thông tin quản lý , Khóa 2016', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'1654050032', 8, CAST(N'1997-02-04T00:00:00.000' AS DateTime), 1, N'Under-Student', N'DH19IM01', N'Hệ thống thông tin quản lý , Khóa 2016', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'1654050100', 9, CAST(N'1998-05-14T00:00:00.000' AS DateTime), 1, N'Under-Student', N'DH19IM01', N'Hệ thống thông tin quản lý , Khóa 2016', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'1551040043', 10, CAST(N'1997-11-21T00:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Hệ thống thông tin quản lý , Khóa 2016', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'MCOM18A01', 11, CAST(N'1985-05-05T00:00:00.000' AS DateTime), 0, N'Grad-Student', N'MCOM18A', N'Khoa học máy tính, khóa 2018-2020', N'HVCH khóa 2018, ngành KHMT', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'1651012009', 13, CAST(N'1998-09-11T17:00:00.000' AS DateTime), 0, N'Under-Student', N'DH16CS01', N'Khoa học máy tính, khóa 2016-2020', NULL, 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-25T14:02:28.597' AS DateTime))
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'1551010010', 14, CAST(N'1997-01-08T17:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', NULL, 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-25T14:02:28.597' AS DateTime))
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'1751012087', 15, CAST(N'1999-03-17T17:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', NULL, 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-25T14:02:28.597' AS DateTime))
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'1651012040', 16, CAST(N'1998-03-28T17:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', NULL, 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-25T14:02:28.597' AS DateTime))
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, N'1851010037', 17, CAST(N'2000-06-27T00:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', NULL, 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-25T14:02:28.597' AS DateTime))
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, N'1351010056', 18, CAST(N'1995-09-05T00:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, N'1851010064', 19, CAST(N'2000-11-04T00:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, N'1651010108', 20, CAST(N'1998-07-05T00:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, N'1851010109', 21, CAST(N'2000-03-29T00:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, N'1854060203', 22, CAST(N'2000-03-24T00:00:00.000' AS DateTime), 1, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, N'1551010123', 23, CAST(N'1997-10-05T00:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, N'1751010169', 24, CAST(N'1999-06-07T00:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, N'1551010137', 25, CAST(N'1997-07-24T00:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, N'1651012213', 26, CAST(N'1998-04-06T00:00:00.000' AS DateTime), 0, N'Under-Student', N'DH19IM01', N'Khoa học máy tính, khóa 2018-2020', N'Sinh viên khóa 2016, ngành HTTTQL', 1, 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Student] ([Id], [OfficialStudentId], [UserId], [Birthday], [Gender], [StudentType], [Class], [CourseName], [Note], [SchoolId], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, N'123456789', 28, CAST(N'2000-02-03T00:00:00.000' AS DateTime), 0, N'Under-Student', N'', N'KNMGHS', N'klafdj lksdjklf askl', 1, 1, 27, CAST(N'2020-02-25T16:16:09.637' AS DateTime), 27, CAST(N'2020-02-25T16:16:57.760' AS DateTime))
GO
SET IDENTITY_INSERT [Business].[Student] OFF
GO
SET IDENTITY_INSERT [Business].[StudentExam] ON 
GO
INSERT [Business].[StudentExam] ([Id], [StudentId], [ExamId], [ClassAssignmentId], [StartTime], [EndTime], [Score], [TotScore], [TotQuestion], [TotMinutes], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (4, 11, 1, 5, CAST(N'2020-02-04T14:32:21.150' AS DateTime), CAST(N'2020-02-04T14:32:55.980' AS DateTime), 4, 16, 14, 16, N'Chấm bài tự động bằng hệ thống Online ! Role: Thành viên', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExam] ([Id], [StudentId], [ExamId], [ClassAssignmentId], [StartTime], [EndTime], [Score], [TotScore], [TotQuestion], [TotMinutes], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (5, 11, 1, 5, CAST(N'2020-02-05T05:20:33.107' AS DateTime), CAST(N'2020-02-05T05:20:45.433' AS DateTime), 0, 16, 13, 16, N'Chấm bài tự động bằng hệ thống Online ! Role: Thành viên', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExam] ([Id], [StudentId], [ExamId], [ClassAssignmentId], [StartTime], [EndTime], [Score], [TotScore], [TotQuestion], [TotMinutes], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (6, 11, 1, 5, CAST(N'2020-02-05T05:26:04.997' AS DateTime), CAST(N'2020-02-05T05:27:02.720' AS DateTime), 10, 17, 15, 17, N'Chấm bài tự động bằng hệ thống Online ! Role: Thành viên', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExam] ([Id], [StudentId], [ExamId], [ClassAssignmentId], [StartTime], [EndTime], [Score], [TotScore], [TotQuestion], [TotMinutes], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (7, 11, 1, 5, CAST(N'2020-02-07T04:35:14.750' AS DateTime), CAST(N'2020-02-07T04:36:04.963' AS DateTime), 6, 18, 16, 18, N'Chấm bài tự động bằng hệ thống Online ! Role: Thành viên', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
SET IDENTITY_INSERT [Business].[StudentExam] OFF
GO
SET IDENTITY_INSERT [Business].[StudentExamDetail] ON 
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (44, 4, 3, 0, N'10', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (45, 4, 14, 1, N'47', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (46, 4, 23, 0, N'72', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (47, 4, 15, 0, N'49', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (48, 4, 21, 0, N'64', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (49, 4, 8, 0, N'30', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (50, 4, 16, 0, N'51', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (51, 4, 4, 0, N'19', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (52, 4, 9, 0, N'36', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (53, 4, 19, 1, N'57', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (54, 4, 13, 1, N'45', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (55, 4, 5, 0, N'15', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (56, 4, 17, 1, N'53', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (57, 4, 20, 0, N'59', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-04T21:32:56.093' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (58, 5, 2, 0, N'8', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (59, 5, 6, 0, N'22', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (60, 5, 15, 0, N'49', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (61, 5, 3, 0, N'', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (62, 5, 9, 0, N'', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (63, 5, 13, 0, N'', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (64, 5, 11, 0, N'', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (65, 5, 1, 0, N'', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (66, 5, 22, 0, N'', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (67, 5, 10, 0, N'', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (68, 5, 23, 0, N'', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (69, 5, 21, 0, N'', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (70, 5, 20, 0, N'', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:20:45.513' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (71, 6, 5, 1, N'14', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (72, 6, 6, 0, N'24', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (73, 6, 13, 1, N'45', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (74, 6, 9, 1, N'35', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (75, 6, 24, 2, N'76', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (76, 6, 10, 1, N'39', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (77, 6, 17, 1, N'53', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (78, 6, 7, 0, N'25', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (79, 6, 2, 0, N'7', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (80, 6, 8, 1, N'31', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (81, 6, 1, 0, N'1', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (82, 6, 11, 0, N'41', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (83, 6, 15, 0, N'49', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (84, 6, 25, 2, N'80', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (85, 6, 16, 0, N'51', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-05T12:27:02.770' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (86, 7, 7, 1, N'26', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (87, 7, 14, 1, N'47', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (88, 7, 19, 1, N'57', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (89, 7, 20, 0, N'59', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (90, 7, 16, 0, N'51', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (91, 7, 9, 0, N'36', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (92, 7, 12, 0, N'44', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (93, 7, 6, 0, N'22', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (94, 7, 21, 0, NULL, N'Lựa chọn quá nhiều đáp án! Phạm quy !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (95, 7, 4, 0, N'18', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (96, 7, 22, 1, N'69;67', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (97, 7, 11, 1, N'42', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (98, 7, 10, 1, N'39', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (99, 7, 18, 0, N'55', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (100, 7, 1, 0, N'3', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
INSERT [Business].[StudentExamDetail] ([Id], [StudentExamId], [QuestionId], [Score], [Answers], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (101, 7, 15, 0, N'49', N'Chấm bài tự động bằng hệ thống Online !', 1, 16, CAST(N'2020-02-07T11:36:05.057' AS DateTime))
GO
SET IDENTITY_INSERT [Business].[StudentExamDetail] OFF
GO
SET IDENTITY_INSERT [Business].[Subject] ON 
GO
INSERT [Business].[Subject] ([Id], [SubjectCode], [SubjectName], [Description], [SubjectType], [TotalCredit], [PracticeCredit], [TheoryCredit], [SchoolId], [Department], [Note], [MajorGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'ITEC2501', N'Cấu trúc dữ liệu', N'Cấu trúc dữ liệu là một trong những môn học cơ bản của ngành khoa học máy tính,
trang bị cho sinh viên các phương pháp tiếp cận với giải pháp giải quyết vấn đề và phân
tích tính hiệu quả của giải pháp.
Môn học này cung cấp cho sinh viên các kiến thức sau: danh sách đặc, danh sách
liên kết, cây nhị phân tìm kiếm, B-cây, bảng băm và các thuật toán sắp xếp, tìm kiếm', N'LT-TH', 4, 1, 3, 1, N'Khoa Công nghệ Thông tin', N'', N'CNTT', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Subject] ([Id], [SubjectCode], [SubjectName], [Description], [SubjectType], [TotalCredit], [PracticeCredit], [TheoryCredit], [SchoolId], [Department], [Note], [MajorGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'ITEC3406', N'Lập trình cơ sở dữ liệu', N'Môn học cung cấp cho sinh viên kiến thức và kỹ năng lập trình ứng dụng tương tác với cơ sở dữ liệu (CSDL quan hệ, XML) bằng ADO.NET. Ứng dụng được xây dựng theo kiến trúc 3 lớp và sử dụng các kỹ thuật lập trình hiện đại trong phát triển ứng dụng như LINQ, Entity Framework..', N'LT-TH', 4, 1, 3, 1, N'Khoa Công nghệ Thông tin', NULL, N'CNTT', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Subject] ([Id], [SubjectCode], [SubjectName], [Description], [SubjectType], [TotalCredit], [PracticeCredit], [TheoryCredit], [SchoolId], [Department], [Note], [MajorGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'ITEC4417', N'Lập trình trên thiết bị DĐ
', N'Môn học cung cấp cho sinh viên kiến thức và kỹ năng trong lĩnh vực phát triển ứng dụng cho thiết bị di động như môi trường phát triển ứng dụng, cách tiếp cận thiết kế ứng dụng, công cụ và các thư viện hỗ trợ để tạo, thử nghiệm và triển khai ứng dụng. Các chủ đề chính bao gồm thiết kế giao diện người dùng, vòng đời ứng dụng, đa tiểu trình, giao tiếp giữa các ứng dụng, lưu trữ và truy cập dữ liệu, các dịch vụ chạy nền, định vị, bản đồ, mạng, web services, điện thoại, tin nhắn, ... Nội dung môn học minh họa trên hệ điều hành Android', N'LT-TH', 4, 1, 3, 1, N'Khoa Công nghệ Thông tin', NULL, N'CNTT', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Subject] ([Id], [SubjectCode], [SubjectName], [Description], [SubjectType], [TotalCredit], [PracticeCredit], [TheoryCredit], [SchoolId], [Department], [Note], [MajorGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'APCM230307', N'Tin học ứng dụng', N'Khóa học này cung cấp cho người học nhưng kiến cơ bản và nâng cao về tin học ứng dụng trong quản lý như thống kê các dữ liệu lớn (big data), quản lý các hàng tồn kho, các đơn hàng xuất khẩu và nhập khẩu, quản lý tiền lương, thuế TNCN của người lao động,.. bằng các công cụ Excel  nâng cao và Visual basics. Bên cạnh đó, khóa học này trang bị cho người học kỹ năng mềm, làm việc nhóm và kỹ năng thuyết trình.', N'LT-TH', 2, 1, 1, 2, N'Khoa kinh tế', N'1', N'CNTT, Kinh tế', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[Subject] OFF
GO
SET IDENTITY_INSERT [Business].[SubmissionAttachment] ON 
GO
INSERT [Business].[SubmissionAttachment] ([Id], [SubmissionId], [DisplayName], [GuidName], [Extension], [ContentType], [Url], [Status], [CreatedBy], [CreatedOn]) VALUES (1, 2, N'BaiGiang_2.pptx', N'e8f7f844-20e2-45b9-8d23-8344b4b42b9f', N'.pptx', N'application/vnd.openxmlformats-officedocument.presentationml.presentation', N'Upload/Class_1/User_15\e8f7f844-20e2-45b9-8d23-8344b4b42b9f.pptx', 0, 15, CAST(N'2020-01-28T17:22:44.770' AS DateTime))
GO
INSERT [Business].[SubmissionAttachment] ([Id], [SubmissionId], [DisplayName], [GuidName], [Extension], [ContentType], [Url], [Status], [CreatedBy], [CreatedOn]) VALUES (2, 2, N'DCMH_1.pdf', N'e417a8b9-03dc-433b-82eb-3fe0ee762da7', N'.pdf', N'application/pdf', N'Upload/Class_1/User_15\e417a8b9-03dc-433b-82eb-3fe0ee762da7.pdf', 0, 15, CAST(N'2020-01-28T17:22:44.770' AS DateTime))
GO
INSERT [Business].[SubmissionAttachment] ([Id], [SubmissionId], [DisplayName], [GuidName], [Extension], [ContentType], [Url], [Status], [CreatedBy], [CreatedOn]) VALUES (3, 3, N'BaoCaoNghienCuuKhoaHoc_BuiDanKhue_V2.docx', N'a4f1a4fe-dbe9-482c-977e-3a12a618c894', N'.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', N'Upload/Class_1/User_15\a4f1a4fe-dbe9-482c-977e-3a12a618c894.docx', 0, 15, CAST(N'2020-01-28T18:13:47.550' AS DateTime))
GO
INSERT [Business].[SubmissionAttachment] ([Id], [SubmissionId], [DisplayName], [GuidName], [Extension], [ContentType], [Url], [Status], [CreatedBy], [CreatedOn]) VALUES (4, 3, N'publication_2.pdf', N'3d45730d-8812-4c54-b025-667bd371f1a0', N'.pdf', N'application/pdf', N'Upload/Class_1/User_15\3d45730d-8812-4c54-b025-667bd371f1a0.pdf', 0, 15, CAST(N'2020-01-28T18:13:47.550' AS DateTime))
GO
INSERT [Business].[SubmissionAttachment] ([Id], [SubmissionId], [DisplayName], [GuidName], [Extension], [ContentType], [Url], [Status], [CreatedBy], [CreatedOn]) VALUES (5, 4, N'He thong ma nganh kinh te moi 2018.doc', N'ef50c5de-9651-4e2e-aacc-b306428e4bf3', N'.doc', N'application/msword', N'Upload/Class_1/User_15\ef50c5de-9651-4e2e-aacc-b306428e4bf3.doc', 0, 15, CAST(N'2020-01-28T18:27:34.690' AS DateTime))
GO
INSERT [Business].[SubmissionAttachment] ([Id], [SubmissionId], [DisplayName], [GuidName], [Extension], [ContentType], [Url], [Status], [CreatedBy], [CreatedOn]) VALUES (6, 4, N'DSGhiDiemCuoiKyTheoTo_129681.pdf', N'eb7dc1c1-9f3e-429d-a2f5-b0919fc3dd8f', N'.pdf', N'application/pdf', N'Upload/Class_1/User_15\eb7dc1c1-9f3e-429d-a2f5-b0919fc3dd8f.pdf', 0, 15, CAST(N'2020-01-28T18:27:34.690' AS DateTime))
GO
INSERT [Business].[SubmissionAttachment] ([Id], [SubmissionId], [DisplayName], [GuidName], [Extension], [ContentType], [Url], [Status], [CreatedBy], [CreatedOn]) VALUES (7, 5, N'DSGhiDiemCuoiKyTheoTo_128653.pdf', N'088580d6-ee71-4625-a557-37e7138df0bf', N'.pdf', N'application/pdf', N'Upload/Class_1/User_15\088580d6-ee71-4625-a557-37e7138df0bf.pdf', 0, 15, CAST(N'2020-01-28T18:31:54.153' AS DateTime))
GO
INSERT [Business].[SubmissionAttachment] ([Id], [SubmissionId], [DisplayName], [GuidName], [Extension], [ContentType], [Url], [Status], [CreatedBy], [CreatedOn]) VALUES (8, 5, N'CNTT 53 ITEC4416 Dien Toan Dam May 251219.docx', N'379fcfd4-c6ea-4f7f-9ee4-9c37b6f8be96', N'.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', N'Upload/Class_1/User_15\379fcfd4-c6ea-4f7f-9ee4-9c37b6f8be96.docx', 0, 15, CAST(N'2020-01-28T18:31:54.153' AS DateTime))
GO
INSERT [Business].[SubmissionAttachment] ([Id], [SubmissionId], [DisplayName], [GuidName], [Extension], [ContentType], [Url], [Status], [CreatedBy], [CreatedOn]) VALUES (9, 6, N'ThS_Phieu dang ky nhap hoc thạc sĩ.doc', N'817f36a1-a41e-48e6-9cb2-a4126a9165a5', N'.doc', N'application/msword', N'Upload/Class_1/User_15\817f36a1-a41e-48e6-9cb2-a4126a9165a5.doc', 0, 15, CAST(N'2020-01-28T19:46:37.420' AS DateTime))
GO
INSERT [Business].[SubmissionAttachment] ([Id], [SubmissionId], [DisplayName], [GuidName], [Extension], [ContentType], [Url], [Status], [CreatedBy], [CreatedOn]) VALUES (10, 9, N'DCMH_1.pdf', N'a4b71cb0-cd35-4a33-992e-a46bab791c7a', N'.pdf', N'application/pdf', N'Upload/Class_1/User_14\a4b71cb0-cd35-4a33-992e-a46bab791c7a.pdf', 0, 14, CAST(N'2020-01-28T22:21:45.213' AS DateTime))
GO
INSERT [Business].[SubmissionAttachment] ([Id], [SubmissionId], [DisplayName], [GuidName], [Extension], [ContentType], [Url], [Status], [CreatedBy], [CreatedOn]) VALUES (11, 12, N'Conference-template-A4.doc', N'd6bf7e5e-52fe-4081-ba08-3e5e66dc5142', N'.doc', N'application/msword', N'Upload/Class_1/User_16\d6bf7e5e-52fe-4081-ba08-3e5e66dc5142.doc', 0, 16, CAST(N'2020-02-09T19:52:56.227' AS DateTime))
GO
SET IDENTITY_INSERT [Business].[SubmissionAttachment] OFF
GO
SET IDENTITY_INSERT [Business].[Teacher] ON 
GO
INSERT [Business].[Teacher] ([Id], [UserId], [Birthday], [FullName], [Address], [PhoneNumber], [Introduction], [Email], [Title], [SchoolId], [Gender], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 27, CAST(N'1984-12-16T00:00:00.000' AS DateTime), N'Lê Ngọc Hiếu', N'207/12A Bạch Đằng, Phường 15, Quận Bình Thạnh, TP.HCM', N'+84 919 004 169', NULL, N'hieu.ln@ou.edu.vn', N'ThS. NCS', 1, 0, N'1', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[Teacher] ([Id], [UserId], [Birthday], [FullName], [Address], [PhoneNumber], [Introduction], [Email], [Title], [SchoolId], [Gender], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, NULL, CAST(N'1961-05-09T00:00:00.000' AS DateTime), N'Trần Công Hùng', N'Lê Quang Định, Quận Bình Thạnh, TP.HCM', N'+84-903 918 043', NULL, N'conghung@ptithcm.edu.vn', N'PGS.TS', 7, 0, N'1', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[Teacher] OFF
GO
SET IDENTITY_INSERT [Business].[TeacherDelegateStudent] ON 
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 1, N'NGHIÊN CỨU VÀ ỨNG DỤNG AI VÀO HỆ THỐNG PHỎNG VẤN ẢO HỖ TRỢ DOANH NGHIỆP (VIS)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, 2, N'Áp dụng và nghiên cứu công nghệ AI nhằm phát triển ứng dụng dịch tự động Trung - Việt (cơ bản)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, 3, N'Áp dụng và nghiên cứu công nghệ AI nhằm phát triển ứng dụng dịch tự động Trung - Việt (cơ bản)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, 4, N'NGHIÊN CỨU VÀ ỨNG DỤNG AI VÀO HỆ THỐNG PHỎNG VẤN ẢO HỖ TRỢ DOANH NGHIỆP (VIS)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, 5, N'NGHIÊN CỨU VÀ ỨNG DỤNG AI VÀO HỆ THỐNG PHỎNG VẤN ẢO HỖ TRỢ DOANH NGHIỆP (VIS)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, 6, N'Áp dụng và nghiên cứu công nghệ AI nhằm phát triển ứng dụng dịch tự động Trung - Việt (cơ bản)', N'Nghiên cứu khoa học sinh viên, Đồ án tốt nghiệp đai học', N'2019-2020', N'SV-TNDH', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherDelegateStudent] ([Id], [TeacherId], [StudentId], [Topic], [Description], [Time], [SupervisedType], [RefUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, 7, N'NGHIÊN CỨU XÂY DỰNG ỨNG DỤNG DỊCH TỰ ĐỘNG ĐƠN GIẢN NGÔN NGỮ TRUNG-VIỆT DỰA TRÊN THÀNH QUẢ                  CÔNG NGHỆ AI HIỆN ĐẠI', N'Luận văn thạc sĩ', N'2019-2020', N'LV-ThS', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[TeacherDelegateStudent] OFF
GO
SET IDENTITY_INSERT [Business].[TeacherEduBackground] ON 
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'BS of Computer Science', N'Bachelor of Science', NULL, NULL, NULL, 3, N'Under-Graduate', N'2005-2009', 2010, N'Khá', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'BA of Interpreter of Chinese Business & Traveling', N'Bachelor of Art', NULL, NULL, NULL, 1, N'Under-Graduate', N'2006-2009', 2010, N'TB-Khá', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'BA of Interpreting in English', N'Bachelor of Art', NULL, NULL, NULL, 4, N'Under-Graduate', N'2009-2013', 2015, N'TB-Khá', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'BS of Civilization Architecture', N'Architect', NULL, NULL, NULL, 6, N'Under-Graduate', N'2003-2009', 2010, N'', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'Civilization Engineering', N'Engineer', NULL, NULL, NULL, 6, N'Under-Graduate', N'2011-2013', 2014, N'', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'BS of Geology', N'Bachelor of Science', NULL, NULL, NULL, 5, N'Under-Graduate', N'2005-2009', 2009, N'', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, N'Master of Computer Science', N'Master of Science', NULL, NULL, NULL, 3, N'Post-Graduate', N'2011-2013', 2014, N'', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, N'Master of Education', N'Master of Art', NULL, NULL, NULL, 2, N'Post-Graduate', N'2017-2019', 2019, N'Khá', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 1, N'Master of Economic', N'Master of Art', NULL, NULL, NULL, 1, N'Post-Graduate', N'2014-2016', 2016, N'', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 1, N'Master of Environment Management', N'Master of Science', NULL, NULL, NULL, 5, N'Post-Graduate', N'2015-2017', 2017, N'', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 1, N'Master of Information System', N'Master of Science', NULL, NULL, NULL, 7, N'Post-Graduate', N'2016-2018', 2018, N'Giỏi', NULL, NULL, N'1', 1, 1, CAST(N'2020-01-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 1, N'Master of Economy Management', N'Master of Art', NULL, NULL, NULL, 2, N'Post-Graduate', N'2018-2020', 2020, N'Khá', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 1, N'Doctor of Information System', N'PhD', NULL, NULL, NULL, 7, N'Doctoral', N'2019-2022', 2022, N'', NULL, NULL, N'1', 1, 1, CAST(N'2020-01-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 1, N'Doctor of Computational Science', N'PhD', NULL, NULL, NULL, 9, N'Doctoral', N'2019-2022', 2022, N'', NULL, NULL, N'1', 1, 1, CAST(N'2020-01-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 1, N'Doctor of Education Management', N'PhD', NULL, NULL, NULL, 10, N'Doctoral', N'2020-2023', 2023, N'', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, 1, N'Master of Chinese Teaching', N'Master of Art', NULL, NULL, NULL, 8, N'Post-Graduate', N'2017-2019', 2020, N'Khá', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherEduBackground] ([Id], [TeacherId], [Title], [Degree], [DegreeNo], [DegreeRegNo], [DegreeDate], [SchoolId], [Type], [Duration], [YearOfGrad], [Result], [RefUrl1], [RefUrl2], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 1, N'Master of English Teaching', N'Master of Art', NULL, NULL, NULL, 4, N'Post-Graduate', N'2020-2022', 2022, N'', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[TeacherEduBackground] OFF
GO
SET IDENTITY_INSERT [Business].[TeacherExperience] ON 
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'In middle of  2008 to the end 2008', N'Interior Designer', N'-	Administrate IT system of the Company, 
-	Translate documents (Vietnamese – English, Vietnamese – Chinese, Chinese – English )
-	Prepare and edit the contract on purchasing.
-	Seek and negotiate with the supplier for the company.
-	Coordinate with sale department, support sale management
-	Project management.', N'Working', N'ICONOS Vietnam - IT - Ho Chi Minh – Vietnam (Singapore company)', N'Fresher', NULL, N': Mr. Chua Jin How -  Director - Professional  - 0837263199 - joseph@iconoffice.com', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'Dec 2008 to May 2009', N'Graphic Designer ( work as a team leader)', N'-	Team building and leading.
-	Translate documents (Vietnamese – English)
-	Sport team leader, celebrate and hold the activities besides work.
-	Assist the art director to come up idea and manage the different teams.
', N'Working', N'DXP Vietnam - Arts/Design - Ho Chi Minh – Vietnam (Denmark company)', N'Leader', NULL, N'Mrs. Nguyen Thi Yen Phuong, Graphic Manager  0908300332 gunasekera31@gmail.com', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'May 2009 to July 2010', N'Project Manager (Junior in management)', N'-	Assist Construction Manager in celebrating customers meeting,
-	Plan bidding activities for the construction projects of the company
-	Edit & translate bidding documents, bidding contract from Chinese – English – Vietnamese
-	Interpreting for the managers in all business activities
-	Launch the construction projects for the new IP zones, office building in Linh Trung Thu Duc District, supermarket, trade centre, etc
-	On behalf of the manager, welcoming the delegate from China', N'Working', N'SEPZONE Linh Trung Joint Venture Company - Ho Chi Minh – Vietnam (Between Vietnam and Beijing China)', N'Senior', NULL, N'Mr. Zhang Li Dong, Construction Department Manager 0918.385.033 zhanglidong@linhtrungepz.com', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'Aug 2010 to Mar 2011', N'Project Manager Assistant (Senior)', N'-	Assist Architect Manager in celebrating customers meeting, holding the meeting with the sub-contractors, Sellers. 
-	Plan bidding activities for the construction projects of the projects.
-	Report to the investor (Capital Land)
-	Edit & translate bidding documents, bidding contract from Chinese – English – Vietnamese
-	Redesign or modify the details of the architecture of the whole project.
-	Check the quality of the materials & calculate the need of them…
', N'Working', N'CSCEC – China State Construction Engineering Corporation Limited, The main contractor of The Vista project, a civil project from Capital Land (Singapore)', N'Senior', NULL, N'Mr. Alex Chua, Project Architect 0909.781.567  alexchua@cscecvn.com ', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'June 2011 to June  2012', N'Project Manager (Senior)', N'-	Assist Manager in managing with customers meeting, suppliers, partners (inventors). 
-	Edit & translate documents, contract Chinese – English – Vietnamese
-	Modify the details of the architecture project.
-	Support partners for more information.
-	Contact and solve the government’s documents and things involved…
', N'Working', N'Luk Land Vietnam –  Owner of Saigon Trade Center building (Hongkong)', N'Senior', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'August  2012  to March 2013', N'DOTNET Developer (Senior)', N'-	Develop website based on .net architecture. 
-	Asp.net, C#, javascript, Css, HTML, Jquery, Ajax…
-	Store procedure, Web service, …', N'Working', N'GE Software (Malaysia)', N'Senior', NULL, N'Mr. Elijah Francis Kok, PM', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, N'May  2013  to Dec 2013', N'Business’s process developer (Senior – working as PM)', N'-	Joining building AAA’s User requirements and AAA assurances’ business.
-	Leading to developing website as business Application based on .net architecture. 
-	Technical: Asp.net, C#, JavaScript, Css, HTML, Jquery, Ajax…, Database analysis, building Store procedure using SQL Server
-	Building web-services for Third-Party…
-	Integrating with AAA’s data core using PREMIA', N'Working', N'AAA Assurance Corporation (IAG ‘s member, top 10 Insurances in Vietnam)', N'Senior', NULL, N'Ms. Le Hai Thanh, Head of BA Department', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, N'April  2014  to Sep 2014', N'Project Manager - Marketing Development Manager', N'-	Building & planning for new projects (Software projects, ERP projects, Maintenance projects from Japan,…); Leading & managing the run of each project (even about Technical skills).
-	Controlling & evaluating MySQL database (Including analysis, maintenance, tuning…. Involved store procedures, triggers, transactions…). 
-	Contacting to Customers, and persuading their agreement about the new contract. 
-	Supporting all other teams in operating, especially technologies & interacting with the Customers.
-	PM of the project of AEON POS (AEON Center in Binh Duong Province). (AEON is one of the biggest corporation in Japan)
-	Support team maintenance of www.casec.jp (one of the biggest Online TOEIC of Japan since 2001)
', N'Working', N'Viet Vang JSC.  (Vietnamese Company)', N'Leader', NULL, N'Mr. Hoang Hai Trieu, Company Director', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 1, N'Sep 2014 to Now', N'Manager', N'- Building & planning for new projects (Software projects, ERP projects, Maintenance projects from Japan,…); Leading & managing the run of each project (even about Technical skills).', N'Working', N'Crimsonworks, Singapore Offshore team', N'Manager', NULL, NULL, N'1', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 1, N'May  2014 to Dec 2016', N'Teacher of Chinese ', N'-	Teach 2 hours per day , 2 days per week based on basic program and advanced program of Chinese.', N'Teaching', N'Center of Foreign Languages – HCMC University of Science (HCMUS) ', N'Teacher', NULL, N'Ms.Duong Hong Quy, ', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 1, N'May  2012 to November  2012', N'Teacher of Chinese ', N'-	Teach 3 hours per day based on basic program and advanced program of Chinese.', N'Teaching', N'Vinh Xuyen Elementary School – District 6, Ho Chi Minh City – Vietnam ', N'Teacher', NULL, N'Ms.Duong Hong Quy, ', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 1, N'June 2011 to December  2012', N'Teacher of Chinese ', N'-	Teach 2 hours per day, 3 days per week based on basic program and advanced program of Chinese.', N'Teaching', N'Center of Foreign languages (Lien Viet Uc) – District 6, Ho Chi Minh City – Vietnam ', N'Teacher', NULL, N'Mr.Au Tuyen Dieu ', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 1, N'September  2007 to September 2008', N'Teacher of IT', N'-	Teach 9 hours per week on basic program, & 9 hours at night and on Saturday on advance program
-	Teach IT according to the textbook for high school published by Ministry of Education and Training
-	Teach the Olympic class from the district level to national level
-	01 pupil gained the National encouraging award 2007
-	01 pupil gained the HCMC encouraging award 2007
-	03 pupils gained the District 3 award 2008', N'Teaching', N'Lê Thị Hồng Gấm High School – District 3, Ho Chi Minh City – Vietnam ', N'Teacher', NULL, N'Ms. Quỳnh, Lê Thị Hồng Gấm High School', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 1, N'October 2007 to June 2008', N'Teacher of English ', N'-	Teach more than 11 hours per week in the evening of Monday, Wednesday, and Friday. At Xuan Truong Secondary School, 1k Road, Linh Trung, Thu Duc
-	Teaching Materials: 301 statements of Chinese, New Headway Beginner
-	Focus on speaking & listening for the workers, for better conversation.
', N'Teaching', N'HCMC University of Social Science & Humanity, Department of Social works, District 1, HCMC – Vietnam ', N'Teacher', NULL, N'Ms. Phan Thị Thu Nguyệt, Lecturer of Department of Social works, 0917.151.767', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 1, N'Dec 2018 to Now', N'Teacher of IT', NULL, N'Teaching', N'HCMC Open University', N'Teacher', NULL, NULL, N'1', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, 1, N'Dec 2017 to Now', N'Teacher of Chinese ', NULL, N'Teaching', N'SDTC, TDTU', N'Teacher', NULL, NULL, N'1', 1, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 1, N'Sep 2019 to Now', N'Teacher of Applied IT in Business', NULL, N'Teaching', N'HCMUTE', N'Teacher', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherExperience] ([Id], [TeacherId], [WorkingTime], [WorkTitle], [Description], [WorkType], [WorkLocation], [WorkLevel], [ReasonOfQuit], [References], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, 1, N'Sep 2019 to Dec 2019', N'Teacher of IT', NULL, N'Teaching', N'IT -TDTU', N'Teacher', NULL, NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[TeacherExperience] OFF
GO
SET IDENTITY_INSERT [Business].[TeacherMajor] ON 
GO
INSERT [Business].[TeacherMajor] ([Id], [TeacherId], [MajorName], [MajorNameEng], [MajorCode], [Field], [FieldEng], [Description], [StartFrom], [CanDelete], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'Công nghệ phần mềm', N'Software Developmet', N'7480103', N'CNTT', N'IT', NULL, 2011, 0, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherMajor] ([Id], [TeacherId], [MajorName], [MajorNameEng], [MajorCode], [Field], [FieldEng], [Description], [StartFrom], [CanDelete], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'Khoa học máy tính', N'Computer Science', N'7480101', N'CNTT', N'IT', NULL, 2005, 0, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherMajor] ([Id], [TeacherId], [MajorName], [MajorNameEng], [MajorCode], [Field], [FieldEng], [Description], [StartFrom], [CanDelete], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'Kiến trúc', N'Architecture', N'7580101', N'Kiến trúc - Xây dựng', N'Architecture', NULL, 2003, 0, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherMajor] ([Id], [TeacherId], [MajorName], [MajorNameEng], [MajorCode], [Field], [FieldEng], [Description], [StartFrom], [CanDelete], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'Xây dựng dân dụng', N'Civilization Construction', N'7510102', N'Kiến trúc - Xây dựng', N'Architecture', NULL, 2002, 0, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherMajor] ([Id], [TeacherId], [MajorName], [MajorNameEng], [MajorCode], [Field], [FieldEng], [Description], [StartFrom], [CanDelete], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'Kinh tế, quản ly', N'Economic Management', N'7310101', N'Kinh tế', N'Economic', NULL, 2012, 0, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherMajor] ([Id], [TeacherId], [MajorName], [MajorNameEng], [MajorCode], [Field], [FieldEng], [Description], [StartFrom], [CanDelete], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'Giáo dục học', N'Education', N'7140101', N'Giáo dục', N'Education', NULL, 2011, 0, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[TeacherMajor] OFF
GO
SET IDENTITY_INSERT [Business].[TeacherPublicProfile] ON 
GO
INSERT [Business].[TeacherPublicProfile] ([Id], [TeacherId], [SourceName], [Description], [SourceType], [RefUrl], [SourceLogoUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'ORCiD - Connecting Research and Researchers', N'ORCID provides a persistent digital identifier (an ORCID iD) that you own and control, and that distinguishes you from every other researcher. You can connect your iD with your professional information — affiliations, grants, publications, peer review, and more. You can use your iD to share your information with other systems, ensuring you get recognition for all your contributions, saving you time and hassle, and reducing the risk of errors.', N'Web', N'https://orcid.org/0000-0002-1133-1433', N'assets/img/logo/logo-orcid.svg', NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherPublicProfile] ([Id], [TeacherId], [SourceName], [Description], [SourceType], [RefUrl], [SourceLogoUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'Publons', N'Use Publons to track your publications, citation metrics, peer reviews, and journal editing work in a single, easy-to-maintain profile. 

All your publications, instantly imported from Web of Science, ORCID, or your bibliographic reference manager (e.g. EndNote or Mendeley).

Trusted citation metrics, automatically imported from the Web of Science Core Collection.

Correct author attribution, with your unique ResearcherID automatically added to the publications you claim in Web of Science collections.

Your verified peer review and journal editing history, powered by partnerships with thousands of scholarly journals.

Downloadable record summarising your scholarly impact as an author, editor and peer reviewer.  ', N'Web', N'https://publons.com/researcher/3207281/hieu-le-ngoc/', N'assets/img/logo/logo-publons.png', NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherPublicProfile] ([Id], [TeacherId], [SourceName], [Description], [SourceType], [RefUrl], [SourceLogoUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'Google Scholar', N'Google Scholar provides a simple way to broadly search for scholarly literature. From one place, you can search across many disciplines and sources: articles, theses, books, abstracts and court opinions, from academic publishers, professional societies, online repositories, universities and other web sites. Google Scholar helps you find relevant work across the world of scholarly research.', N'Web', N'https://scholar.google.com/citations?user=38inQJwAAAAJ&hl=vi&authuser=4', N'assets/img/logo/logo-google-scholar.png', NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherPublicProfile] ([Id], [TeacherId], [SourceName], [Description], [SourceType], [RefUrl], [SourceLogoUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'ResearchGate', N'ResearchGate is the professional network for scientists and researchers. Over 15 million members from all over the world use it to share, discover, and discuss research. We''re guided by our mission to connect the world of science and make research open to all.', N'Web', N'https://www.researchgate.net/profile/Hieu_Le61', N'assets/img/logo/logo-rg.png', N'It started when two researchers discovered first-hand that collaborating with a friend or colleague on the other side of the world was no easy task.
Founded in 2008 by physicians Dr. Ijad Madisch and Dr. Sören Hofmayer, and computer scientist Horst Fickenscher, ResearchGate has more than 15 million members today. We strive to help them make progress happen faster.', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherPublicProfile] ([Id], [TeacherId], [SourceName], [Description], [SourceType], [RefUrl], [SourceLogoUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'Scopus', N'The world of scientific research is more demanding than ever before
Whether it’s to discover funding information, advance your career, make strategic decisions, prove ROI or simply to save time, being able to quickly access and make sense of emerging trends, find collaborators and discover competitive insights is crucial.', N'Web', N'https://www.scopus.com/', N'assets/img/logo/logo-elsevier-wordmark.svg', NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherPublicProfile] ([Id], [TeacherId], [SourceName], [Description], [SourceType], [RefUrl], [SourceLogoUrl], [Note], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, N'IEEE Xplore.', N'The IEEE Xplore digital library is a powerful resource for discovery of scientific and technical content published by the IEEE (Institute of Electrical and Electronics Engineers) and its publishing partners.

IEEE Xplore provides web access to more than four-million full-text documents from some of the world''s most highly-cited publications in electrical engineering, computer science, and electronics.', N'Web', N'https://ieeexplore.ieee.org/author/37086825363', N'assets/img/logo/logo-ieee-xplore.png', NULL, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[TeacherPublicProfile] OFF
GO
SET IDENTITY_INSERT [Business].[TeacherResearchWork] ON 
GO
INSERT [Business].[TeacherResearchWork] ([Id], [TeacherId], [Type], [Title], [CoAuthors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'Domestic-Journal', N'Thuật toán cân bằng tải nhằm giảm thời gian đáp ứng dựa vào ngưỡng thời gian trên điện toán đám mây', N'Trần Công Hùng, Nguyễn Xuân Phi', NULL, 12, 2018, N'Hà Nội City', N'Journal on Information and Communications', N'http://ictvietnam.vn/', N'43-48', NULL, N'2525-2224', NULL, N'Hội đồng GSNN', N'assets/teacher/ReasearchWork/1.pdf', NULL, NULL, N'Cân bằng tải, điện toán đám mây, thời gian đáp ứng, thời gian đáp ứng dự báo', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherResearchWork] ([Id], [TeacherId], [Type], [Title], [CoAuthors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'International-Conference', N'MMSIA: Improved Max-Min Scheduling Algorithm for Load
Balancing on Cloud Computing', N'Tran Cong Hung, Phan Thanh Hy, Nguyen Xuan Phi', 25, 1, 2019, N'Đà Lạt City', N'ICMLSC 2019', N'http://www.icmlsc.org/', NULL, N'https://doi.org/10.1145/3310986.3311017', NULL, N'9781450366120', N'Scopus', N'assets/teacher/ReasearchWork/2.pdf', NULL, N'Cloud computing is one of the most advanced technologies in
information technology, a convergence of many achievements in
research and development and application of new technologies.
Cloud computing has also helped to reduce the cost of small and
medium enterprises based on cloud provider services. As cloud
computing evolves rapidly, researching optimizations such as task
execution time, completion time, responce time, and virtual
machine resources (VMs) are tremendous challenges. This article
proposes an MMSIA algorithm to improve the Max-Min
scheduling algorithm, which improves the completion time of the
requests by using the "learned learning" machine learning, by
clustering size of requests and clustering utilization percent of
VMs. The algorithm then assigns the largest cluster requests to the
VM with the least utilization percent, which is repeated when the
request list is empty. In particular, the MMSIA algorithm has
improved the completion time. The simulation results show that
the proposed MMSIA algorithm has improved the completion
time compared to the three algorithms: Max-Min, Min-Min and
Roud Robin', N'Max – Min, load balancing, improve Max – Min algorithm,
comple, processing time', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherResearchWork] ([Id], [TeacherId], [Type], [Title], [CoAuthors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'International-Conference', N'A MOVING DIRECTION PROPOSAL TO SAVE
ENERGY CONSUMPTION FOR MOBILE SINK
IN WIRELESS SENSOR NETWORK', N'Tran Cong Hung, Dang Thi Ngoc, Phan Thi The, Luan N.T. Huynh, Le Dien Tam', 17, 2, 2019, N'Phoenix Park, PyeongChang, Korea', N'ICACT 2019', N'http://www.icact.org/', NULL, N'https://doi.org/10.23919/icact.2019.8701971', NULL, N'9791188428021', N'Scopus, IEEE', N'assets/teacher/ReasearchWork/3.pdf', NULL, N'Wireless sensor network is useful for human that
attract more scientists although they are still limited and limited
energy is a weakness of wireless sensor that make getting
information is interrupted. To improve energy consumption in
WSN, in this paper we show a routing algorithm combined of
LEACH_C and Dijkstra algorithm. A mobile sink move from
Base Station (BS) to the Cluster Head (CHs) to get data, the
direction of mobile sink is decided by Dijkstra algorithm. An
efficient is saving energy and expand alive time of the sensor
network.', N'LEACH-C, Mobile sink, Dijkstra, Cluster Head', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherResearchWork] ([Id], [TeacherId], [Type], [Title], [CoAuthors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'International-Conference', N'ACTIVE MOBILE CHINESE, A NEW APPROACH IN LEARNING CHINESE AS A FOREIGN LANGUAGE', N'Tran Khai Xuan', 11, 11, 2019, N'Seville (Spain)', N'ICERI2019 Proceedings', N'https://iated.org/iceri/', NULL, N'https://doi.org/10.21125/iceri.2019.0770', NULL, N'9788409147557', N'ISI, Web of Science', N'assets/teacher/ReasearchWork/4.pdf', NULL, N'Looking at the recent data of the Chinese economy growth and the amount of Chinese companies and tourism, we can see the big grow of Chinese and its influences. That is the reason why learning Mandarin Chinese is rapidly developing nowadays and it becomes one of the most popular languages in the world. Due to the expanding of Chinese and users’ demand in over the world, teaching Chinese as foreign language is a very necessary mission in Chinese Language Studies. In the past few decades, there are a lot of traditional studies and researches how to teach Chinese as foreign language in around the world, especially speaking English areas. The aim of this paper is to critically analyse a few new methodologies of learning and teaching Chinese recently, to generate those researches’ result to propose a new approach of teaching Chinese as foreign language. This approach, called “Active Mobile Chinese”, is illustrated by using mobile learning method to create a new learning environment for Chinese learners. With this new idea, we can bring the Chinese language to learners anywhere and anytime. Due to the flexibility of mobile learning style, we would propose the content of this method is more on vocabulary: common words and expressions. This seems to be very active because the languages are very common and can be used in daily lives of the society. Our new approach focuses on using the sense of language that learners can easily absorb how to use Chinese with very common words, characters and even expressions. With this language sense, people can slowly grasp and understand Chinese grammar rules. We can do the adjustment for every culture based on this core approach', N'Active Mobile Chinese, Mobile Learning Style, Chinese for Foreigner, Learning Chinese, Teaching Chinese as a foreign language', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherResearchWork] ([Id], [TeacherId], [Type], [Title], [CoAuthors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'International-Conference', N'THE NEW “CONNECTING MODEL” IN UNDERGRADUATE EDUCATION', N'Truong Doan Viet', 11, 11, 2019, N'Seville (Spain)', N'ICERI2019 Proceedings', N'https://iated.org/iceri/', NULL, N'https://doi.org/10.21125/iceri.2019.0771', NULL, N'9788409147557', N'ISI, Web of Science', N'assets/teacher/ReasearchWork/5.pdf', NULL, N'The linkages between schools and enterprises are becoming the most important means of undergraduate education outcome. Universities always stand in need of coordinating with employers to help themselves catch the demand of market on the labor force. On the other hand, it is good news for enterprises if there is a training agent that can provide labors who can meet their demand. There was a lot of reliable evidence to show that students, teachers, parents, business, schools as a whole and the wider community can all benefit from school–business partnerships.
The Industry 4.0 is an indispensable technology trend that Vietnam must aim to catch up with developed countries in the world with intelligent technologies such as artificial intelligence, Internet, automation, technology of 3D printing. Therefore, the demand of quantity and quality human resources in information technology is quite enormously. In this article, we propose a new “connecting model” in undergraduate education to make a closer coordination between enterprises and universities. That is, businesses and enterprises will be directly involved in teaching and training in the course of the school. Content such as training syllabus, assessment process, facilities, teaching staff that are decided by the related businesses. Those solutions relate to universities, enterprises and the labor market as well.
', N'linkages in education, connecting model, training link model, undergraduate education', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherResearchWork] ([Id], [TeacherId], [Type], [Title], [CoAuthors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'Domestic-Journal', N'PHÁT TRIỂN CHƯƠNG TRÌNH MÔN HỌC TÍNH TOÁN DI ĐỘNG VÀ INTERNET (MOBILE COMPUTING & INTERNET) THEO TIẾP CẬN CDIO TẠI TRƯỜNG ĐẠI HỌC MỞ THÀNH PHỐ HỒ CHÍ MINH.', N'Nguyễn Phước Lâm', NULL, 1, 2020, N'TP.HCM', N'Tạp chí khoa học Đại học Sài Gòn', N'https://tapchikhoahoc.sgu.edu.vn/', NULL, NULL, NULL, NULL, N'Hội đồng GSNN', N'assets/teacher/ReasearchWork/6.pdf', NULL, N'The program curriculum of Information Technology at HCMC Open University has been built and developed by the social demands, integrated mostly applicable skills. Therefore, this program has been come out by the demands of society and technologies. According CDIO approach, the learning outcome of a program must adapt the position demands from the society. One of the technology’s demands is Mobile Computing and Internet. Mobile computing and Internet is a subject which overviews about the mobile technologies and the career skills respectively, and it also provisions more knowledges about the internet and its relevant tech. With the knowledges, skills and good attitudes about Mobile Computing & Internet, this subject will help the students be more skillful and adapt the requires from current technologies, especially the students can independently study and research more about the field of Mobile Computing & Internet in order to have a better performance in working', N'Syllabus development; CDIO; Mobile computing and Internet; ', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherResearchWork] ([Id], [TeacherId], [Type], [Title], [CoAuthors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, N'International-Conference', N'Early Phase Warning Solution About System Security Based on Log Analysis', N'Tran Cong Hung, Nguyen Duc Huy, Nguyen Thi Thanh Hang', 11, 12, 2019, N'Hà Nội City', N'NICS 2019', N'http://nafosted-nics.org/', NULL, NULL, NULL, NULL, N'Scopus, IEEE', N'assets/teacher/ReasearchWork/7.pdf', NULL, N'Nowadays when the technology develops day by day, safety information and security system have become one of the biggest issues that many people are concerned about and research in order to find solutions to ensure the security of information systems. At present, the most important thing that network administrators care about is minimizing the damage to the enterprises when cyber security crimes invade the information system or attack the system anytime. Therefore, how they can proactively protect information, ensure the privacy of users, how to improve the confidentiality and security of information in business system. To solve the problem above, the research "Early warning solution about system security based on log analysis" is extremely necessary, because it can help to warn and detect early-attacking information when there are abnormal signs in systems via logs. By inheriting the advantages, as well as overcoming the limitations of those previous related topics in the world, in this paper, we would like to develop and to build an early warning application tool capable of interacting, monitoring, adjusting, notifying from the scouting process of the attackers. The new proposed system in this research is based on the characteristics of attack techniques, components and packets through the system, we design a data collection model of Logs input and output. In order to detect and explore abnormal activities in network which are harmful for information systems, we use the log analysis of the information system with the method of analyzing APT target. We study the APT and its characteristic to build the knowledge that we can use an advanced AI algorithm, Deep & Wide Learning algorithm. With logs testing data we conducted in our LAN, we have reached some good results showed the potential of our proposals.  ', N'Network security; Advanced Persistent Threat – APT; Early warning solutions; Log analysis; Artificial Intelligence (AI); Deep - Wide Learning', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherResearchWork] ([Id], [TeacherId], [Type], [Title], [CoAuthors], [Day], [Month], [Year], [City], [Publisher], [PublisherUrl], [Pages], [Doi], [Issn], [Isbn], [IndexedBy], [DownloadUrl], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, N'International-Conference', N'Developing the New Proposal of Intelligence System in Heart and Cardiovascular Diagnosis', N'Tran Cong Hung, Do Phuoc Sang, Bui Dan Khue', 11, 12, 2019, N'Hà Nội City', N'NICS 2019', N'http://nafosted-nics.org/', NULL, NULL, NULL, NULL, N'Scopus, IEEE', N'assets/teacher/ReasearchWork/8.pdf', NULL, N'The World Health Organization estimates that annually, there are 17.5 million deaths due to cardiovascular-related diseases and the number of patients accumulates. This study aims to apply some AI technologies to the system of cardiovascular diagnosis, to provide a solution for building information channels so that people have an overview of cardiovascular pathology. With this approach, people can have self-diagnosis, classification of cardiovascular pathology and know how to plan the examination and treatment to achieve better outcomes. In this paper, the system is built by using reasoning algorithm combined with supervised learning to carry the diagnosis process through the collection of symptoms. The study was experimented on data collected directly from the medical records at General Hospital of Binh Duong Province, and the experimental results show that the accuracy of diagnosis is over 75% compared to the actual diagnostic results.', N'Cardiovascular diagnosis, Expert system, Supervised Learning, Diagnosis of the disease, Artificial intelligence', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[TeacherResearchWork] OFF
GO
SET IDENTITY_INSERT [Business].[TeacherSkill] ON 
GO
INSERT [Business].[TeacherSkill] ([Id], [TeacherId], [Name], [Description], [Type], [RefUrl], [Note], [SeftEvaluate], [StartYear], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'Tiếng Anh', N'English Language', N'Language', NULL, N'Tương đương IETS 7.0', 75, 1990, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherSkill] ([Id], [TeacherId], [Name], [Description], [Type], [RefUrl], [Note], [SeftEvaluate], [StartYear], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'Tiếng Trung Quốc (Phổ thông)', N'Chinese Mandarin Languages', N'Language', NULL, N'Tương đương HSK6', 70, 1998, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherSkill] ([Id], [TeacherId], [Name], [Description], [Type], [RefUrl], [Note], [SeftEvaluate], [StartYear], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'Thiết kế UI/UX', N'UI/UX Design', N'Design', NULL, NULL, 85, 2002, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherSkill] ([Id], [TeacherId], [Name], [Description], [Type], [RefUrl], [Note], [SeftEvaluate], [StartYear], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'PHP MySQL', N'PHP MySQL', N'Coding', NULL, NULL, 85, 2011, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherSkill] ([Id], [TeacherId], [Name], [Description], [Type], [RefUrl], [Note], [SeftEvaluate], [StartYear], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'Bootstrap', N'Bootstrap', N'Coding', NULL, NULL, 75, 2014, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherSkill] ([Id], [TeacherId], [Name], [Description], [Type], [RefUrl], [Note], [SeftEvaluate], [StartYear], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'Công nghệ Dotnet với C# - MS SQL', N'Dotnet C# - MS SQL', N'Coding', NULL, NULL, 85, 2010, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherSkill] ([Id], [TeacherId], [Name], [Description], [Type], [RefUrl], [Note], [SeftEvaluate], [StartYear], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, N'Công nghệ JAVA với Postgres', N' JAVA - Postgres', N'Coding', NULL, NULL, 80, 2010, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherSkill] ([Id], [TeacherId], [Name], [Description], [Type], [RefUrl], [Note], [SeftEvaluate], [StartYear], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, N'Tiếng Việt Nam', N'Vietnamese Language', N'Language', NULL, N'Tiếng mẹ đẻ', 95, 1984, N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[TeacherSkill] OFF
GO
SET IDENTITY_INSERT [Business].[TeacherStudy] ON 
GO
INSERT [Business].[TeacherStudy] ([Id], [TeacherId], [TeacherRole], [Title], [Description], [Type], [Color], [Time], [City], [Publisher], [StudyLevel], [Result], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'Thành viên chính', N'Tính toán hiệu năng cao cân bằng tải trên điện toán đám mây', N'Công nghệ thông tin', N'Công nghệ thông tin', N'badge-primary', N'Từ 2016', N'HCMC', NULL, NULL, NULL, NULL, NULL, N'High Performance, Load Balancing, Cloud computing', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherStudy] ([Id], [TeacherId], [TeacherRole], [Title], [Description], [Type], [Color], [Time], [City], [Publisher], [StudyLevel], [Result], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'Thành viên chính', N'Nâng cao cân bằng tải trên điện toán đám mây bằng các phương pháp dự đoán', N'Hệ Thống Thông Tin', N'Hệ Thống Thông Tin', N'badge-primary', N'Từ 2018', N'HCMC', NULL, NULL, NULL, NULL, NULL, N'Prediction, AI Prediction, Load Balancing, Cloud computing', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherStudy] ([Id], [TeacherId], [TeacherRole], [Title], [Description], [Type], [Color], [Time], [City], [Publisher], [StudyLevel], [Result], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'Thành viên chính', N'Nghiên cứu ứng dụng AI vào cân bằng tải trên điện toán đám mây', N'Trí tuệ nhân tạo', N'Trí tuệ nhân tạo', N'badge-primary', N'Từ 2018', N'HCMC', NULL, NULL, NULL, NULL, NULL, N'AI, Load Balancing, Cloud computing', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherStudy] ([Id], [TeacherId], [TeacherRole], [Title], [Description], [Type], [Color], [Time], [City], [Publisher], [StudyLevel], [Result], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'Thành viên chính', N'Nghiên cứu ứng dụng AI vào chuẩn đoán, phác đồ điều trị một số bệnh như: Tim mạch...', N'Trí tuệ nhân tạo', N'Trí tuệ nhân tạo', N'badge-primary', N'Từ 2018', N'HCMC', NULL, NULL, NULL, NULL, NULL, N'Diagnosis of the disease, Artificial 
intelligence', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherStudy] ([Id], [TeacherId], [TeacherRole], [Title], [Description], [Type], [Color], [Time], [City], [Publisher], [StudyLevel], [Result], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'Thành viên chính', N'Nghiên cứu ứng dụng AI vào cảnh báo sớm APT trên mạng máy tính.', N'CNTT-Mạng', N'CNTT-Mạng', N'badge-primary', N'Từ 2018', N'HCMC', NULL, NULL, NULL, NULL, NULL, N'Advanced Persistent Threat – APT; Early warning solutions; Log analysis; Artificial Intelligence (AI); Deep - Wide Learning', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherStudy] ([Id], [TeacherId], [TeacherRole], [Title], [Description], [Type], [Color], [Time], [City], [Publisher], [StudyLevel], [Result], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'Thành viên chính', N'Nghiên cứu dịch nâng cao chất lượng dịch tự động Trung - Việt, Việt - Trung', N'Ngôn ngữ học máy tính', N'Ngôn ngữ học máy tính', N'badge-success', N'Từ 2019', N'HCMC', NULL, NULL, NULL, NULL, NULL, N'Chinese Vietnamese Translation, Auto Translation, Machine Translation', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherStudy] ([Id], [TeacherId], [TeacherRole], [Title], [Description], [Type], [Color], [Time], [City], [Publisher], [StudyLevel], [Result], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, N'Thành viên chính', N'Nghiên cứu học tập di động, ứng dụng vào học ngoại ngữ (Trung, Anh)', N'Phương pháp dạy học', N'Phương pháp dạy học', N'badge-danger', N'Từ 2017', N'HCMC', NULL, NULL, NULL, NULL, NULL, N'Mobile Learning, Language Teaching', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherStudy] ([Id], [TeacherId], [TeacherRole], [Title], [Description], [Type], [Color], [Time], [City], [Publisher], [StudyLevel], [Result], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 1, N'Thành viên chính', N'Nghiên cứu phát triển dạy học tích cực trong ngành CNTT', N'Phương pháp dạy học', N'Phương pháp dạy học', N'badge-danger', N'Từ 2019', N'HCMC', NULL, NULL, NULL, NULL, NULL, N'Effective Teaching', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherStudy] ([Id], [TeacherId], [TeacherRole], [Title], [Description], [Type], [Color], [Time], [City], [Publisher], [StudyLevel], [Result], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 1, N'Thành viên chính', N'Nghiên cứu phát triển mô hình hợp tác liên kết đào tạo chuyên ngành CNTT', N'Quản lý giáo dục', N'Quản lý giáo dục', N'badge-warning', N'Từ 2017', N'HCMC', NULL, NULL, NULL, NULL, NULL, N'linkages in education, connecting model, training link model, undergraduate education', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherStudy] ([Id], [TeacherId], [TeacherRole], [Title], [Description], [Type], [Color], [Time], [City], [Publisher], [StudyLevel], [Result], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 1, N'Thành viên chính', N'Nghiên cứu quản lý dự án tích cực và hiệu quả trong ngành CNTT', N'Quản lý kinh tế', N'Quản lý kinh tế', N'badge-secondary', N'Từ 2014', N'HCMC', NULL, NULL, NULL, NULL, NULL, N'Management in IT, Project Management in IT', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[TeacherStudy] ([Id], [TeacherId], [TeacherRole], [Title], [Description], [Type], [Color], [Time], [City], [Publisher], [StudyLevel], [Result], [RefUrl], [Introduction], [Keywords], [ViewGroup], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 1, N'Thành viên chính', N'Nghiên cứu vai trò ngành CNTT trong tổng thể nền kinh tế', N'Kinh tế học', N'Kinh tế học', N'badge-secondary', N'Từ 2014', N'HCMC', NULL, NULL, NULL, NULL, NULL, N'IT in Economic', N'1', 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[TeacherStudy] OFF
GO
SET IDENTITY_INSERT [Business].[Thesis] ON 
GO
INSERT [Business].[Thesis] ([Id], [ThesisTitle], [Description], [ThesisType], [ThesisLevel], [ThesisCategory], [StudyField], [StudyCode], [Keyword], [ThesisYear], [Members], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'NGHIÊN CỨU XÂY DỰNG ỨNG DỤNG DỊCH TỰ ĐỘNG ĐƠN GIẢN NGÔN NGỮ TRUNG-VIỆT DỰA TRÊN THÀNH QUẢ                  CÔNG NGHỆ AI HIỆN ĐẠI', N'Chúng tôi nghiên cứu chủ yếu các khâu quan trọng để xây dựng một ứng dụng đơn giản sinh ra các cặp câu Trung-Việt song song giả lập dựa vào cụm. Chúng tôi áp dụng phương pháp dịch máy thống kê để xác thực độ chính xác tương đối của kết quả của chúng tôi như thế nào sau khi thu thập bộ tài liệu Trung-Việt song song giả lập.', N'Master-Thesis', N'Master', N'Khoa học máy tính', N'Ngôn ngữ học máy tính, dịch tự động, AI', N'60.48.01.01', N'Computer Linguistic, Chinese – Vietnamese machine translator, AI Technologies', 2020, 1, NULL, 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[Thesis] OFF
GO
SET IDENTITY_INSERT [Business].[ThesisDoc] ON 
GO
INSERT [Business].[ThesisDoc] ([Id], [ThesisId], [DocName], [Description], [Url], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'Quyết định giao đề tài', N'Quyết định giao đề tài và phân công người hướng dẫn thực hiện luận văn thạc sĩ TP.HCM', N'assets/Thesis/Document/test_qdgdt.pdf', N'Quyết định giao đề tài và phân công người hướng dẫn thực hiện luận văn thạc sĩ TP.HCM', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisDoc] ([Id], [ThesisId], [DocName], [Description], [Url], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'Đơn đăng ký tên LVTN ', N'Đơn đăng ký tên LVTN ', N'assets/Thesis/Document/MauDK_TenDeTaiLVTN.doc', N'Đơn đăng ký tên LVTN ', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisDoc] ([Id], [ThesisId], [DocName], [Description], [Url], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'kế hoạch thực hiện Chuyên đề, LVTN', N'kế hoạch thực hiện Chuyên đề, LVTN', N'assets/Thesis/Document/KeHoachThucHien_LVTN.xlsx', N'kế hoạch thực hiện Chuyên đề, LVTN', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisDoc] ([Id], [ThesisId], [DocName], [Description], [Url], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N' Đơn Liên quan đến LVTN ', N'Đơn Liên quan đến LVTN (áp dụng trường hợp đã có Quyết định giao đề tài)', N'assets/Thesis/Document/GiayTo_LienQuan_LVTN.doc', N'Đơn Liên quan đến LVTN (áp dụng trường hợp đã có Quyết định giao đề tài)', 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ThesisDoc] OFF
GO
SET IDENTITY_INSERT [Business].[ThesisPublication] ON 
GO
INSERT [Business].[ThesisPublication] ([Id], [ThesisId], [PublicationId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 1, N'Test 1', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisPublication] ([Id], [ThesisId], [PublicationId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, 2, N'Test 2', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ThesisPublication] OFF
GO
SET IDENTITY_INSERT [Business].[ThesisReference] ON 
GO
INSERT [Business].[ThesisReference] ([Id], [ThesisId], [ReferenceId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 1, NULL, 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisReference] ([Id], [ThesisId], [ReferenceId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, 2, NULL, 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisReference] ([Id], [ThesisId], [ReferenceId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, 3, NULL, 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisReference] ([Id], [ThesisId], [ReferenceId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, 4, NULL, 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisReference] ([Id], [ThesisId], [ReferenceId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, 5, NULL, 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisReference] ([Id], [ThesisId], [ReferenceId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, 6, NULL, 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisReference] ([Id], [ThesisId], [ReferenceId], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, 7, NULL, 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ThesisReference] OFF
GO
SET IDENTITY_INSERT [Business].[ThesisStudent] ON 
GO
INSERT [Business].[ThesisStudent] ([Id], [ThesisId], [StudentId], [StartTime], [EndTime], [Role], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 7, CAST(N'2020-01-30T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), N'Thành viên chính', N'Luận văn thạc sĩ KHMT', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ThesisStudent] OFF
GO
SET IDENTITY_INSERT [Business].[ThesisTeacher] ON 
GO
INSERT [Business].[ThesisTeacher] ([Id], [ThesisId], [TeacherId], [Role], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 2, N'Main-Supervisor', N'Hướng dẫn chính', 1, 1, CAST(N'2019-12-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisTeacher] ([Id], [ThesisId], [TeacherId], [Role], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, 1, N'Sub-Supervisor', N'Hướng dẫn phụ', 1, 1, CAST(N'2019-12-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ThesisTeacher] OFF
GO
SET IDENTITY_INSERT [Business].[ThesisWork] ON 
GO
INSERT [Business].[ThesisWork] ([Id], [ThesisId], [WorkType], [WorkName], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'Master-Outline', N'Đề cương LVTh.S', NULL, 1, 11, CAST(N'2020-02-09T20:30:42.403' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisWork] ([Id], [ThesisId], [WorkType], [WorkName], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'Master-Outline', N'Đề cương LVTh.S', NULL, 1, 11, CAST(N'2020-02-09T20:48:31.007' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisWork] ([Id], [ThesisId], [WorkType], [WorkName], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, N'Master-Outline', N'Đề cương LVTh.S', NULL, 1, 11, CAST(N'2020-02-09T20:48:45.007' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisWork] ([Id], [ThesisId], [WorkType], [WorkName], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 1, N'Master-Outline', N'Đề cương LVTh.S', NULL, 1, 11, CAST(N'2020-02-09T20:49:05.650' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisWork] ([Id], [ThesisId], [WorkType], [WorkName], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'Master-Outline', N'Đề cương LVTh.S', NULL, 1, 11, CAST(N'2020-02-09T20:49:19.973' AS DateTime), NULL, NULL)
GO
INSERT [Business].[ThesisWork] ([Id], [ThesisId], [WorkType], [WorkName], [Note], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N'Master-Outline', N'Đề cương LVTh.S', NULL, 1, 11, CAST(N'2020-02-09T20:49:29.433' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[ThesisWork] OFF
GO
SET IDENTITY_INSERT [Business].[ThesisWorkAttachment] ON 
GO
INSERT [Business].[ThesisWorkAttachment] ([Id], [ThesisWorkId], [DisplayName], [Version], [GuidName], [Extension], [ContentType], [Url], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (1, 1, N'DCMH_1.pdf', NULL, N'5af8abe1-b4e1-4b55-a123-6b52de076ae3', N'.pdf', N'application/pdf', N'Upload/Thesis_1/Master-Outline/User_11\5af8abe1-b4e1-4b55-a123-6b52de076ae3.pdf', NULL, 0, 11, CAST(N'2020-02-09T20:30:42.403' AS DateTime))
GO
INSERT [Business].[ThesisWorkAttachment] ([Id], [ThesisWorkId], [DisplayName], [Version], [GuidName], [Extension], [ContentType], [Url], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (2, 2, N'5_HE NOI.doc', NULL, N'4c66e807-647c-4806-989c-fdd17ca9d807', N'.doc', N'application/msword', N'Upload/Thesis_1/Master-Outline/User_11\4c66e807-647c-4806-989c-fdd17ca9d807.doc', NULL, 0, 11, CAST(N'2020-02-09T20:48:31.007' AS DateTime))
GO
INSERT [Business].[ThesisWorkAttachment] ([Id], [ThesisWorkId], [DisplayName], [Version], [GuidName], [Extension], [ContentType], [Url], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (3, 2, N'2019-03-04_135004.png', NULL, N'178cfe84-7058-45f2-aede-4ae8d1be0353', N'.png', N'image/png', N'Upload/Thesis_1/Master-Outline/User_11\178cfe84-7058-45f2-aede-4ae8d1be0353.png', NULL, 0, 11, CAST(N'2020-02-09T20:48:31.007' AS DateTime))
GO
INSERT [Business].[ThesisWorkAttachment] ([Id], [ThesisWorkId], [DisplayName], [Version], [GuidName], [Extension], [ContentType], [Url], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (4, 3, N'Ab-intro-V1.docx', NULL, N'842ff784-55df-4a87-b8bc-50a7fe484729', N'.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', N'Upload/Thesis_1/Master-Outline/User_11\842ff784-55df-4a87-b8bc-50a7fe484729.docx', NULL, 0, 11, CAST(N'2020-02-09T20:48:45.007' AS DateTime))
GO
INSERT [Business].[ThesisWorkAttachment] ([Id], [ThesisWorkId], [DisplayName], [Version], [GuidName], [Extension], [ContentType], [Url], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (5, 4, N'BAO_LVTS_NGUYENDUCHUY.docx', NULL, N'f729b9d2-aa47-4475-8f87-b43cdf045e1c', N'.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', N'Upload/Thesis_1/Master-Outline/User_11\f729b9d2-aa47-4475-8f87-b43cdf045e1c.docx', NULL, 0, 11, CAST(N'2020-02-09T20:49:05.650' AS DateTime))
GO
INSERT [Business].[ThesisWorkAttachment] ([Id], [ThesisWorkId], [DisplayName], [Version], [GuidName], [Extension], [ContentType], [Url], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (6, 5, N'Vo_Thi_Kim_Cam_1017196_assignsub.xlsx', NULL, N'dd2f98cc-bb35-47b9-b82e-f741bb0378c8', N'.xlsx', N'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', N'Upload/Thesis_1/Master-Outline/User_11\dd2f98cc-bb35-47b9-b82e-f741bb0378c8.xlsx', NULL, 0, 11, CAST(N'2020-02-09T20:49:19.973' AS DateTime))
GO
INSERT [Business].[ThesisWorkAttachment] ([Id], [ThesisWorkId], [DisplayName], [Version], [GuidName], [Extension], [ContentType], [Url], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (7, 5, N'VOST annual leave for Lunar new year (2).xlsx', NULL, N'73056698-823c-4a5a-8cf6-f462dac8ecd4', N'.xlsx', N'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', N'Upload/Thesis_1/Master-Outline/User_11\73056698-823c-4a5a-8cf6-f462dac8ecd4.xlsx', NULL, 0, 11, CAST(N'2020-02-09T20:49:19.973' AS DateTime))
GO
INSERT [Business].[ThesisWorkAttachment] ([Id], [ThesisWorkId], [DisplayName], [Version], [GuidName], [Extension], [ContentType], [Url], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (8, 5, N'VOST Meeting - 20190221.pptx', NULL, N'035e63d1-b566-4c6f-9880-3d3c605e22ef', N'.pptx', N'application/vnd.openxmlformats-officedocument.presentationml.presentation', N'Upload/Thesis_1/Master-Outline/User_11\035e63d1-b566-4c6f-9880-3d3c605e22ef.pptx', NULL, 0, 11, CAST(N'2020-02-09T20:49:19.973' AS DateTime))
GO
INSERT [Business].[ThesisWorkAttachment] ([Id], [ThesisWorkId], [DisplayName], [Version], [GuidName], [Extension], [ContentType], [Url], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (9, 6, N'SO 2331.xlsm', NULL, N'a6402e2d-d69e-4822-a90d-d5f66c1adc00', N'.xlsm', N'application/vnd.ms-excel.sheet.macroenabled.12', N'Upload/Thesis_1/Master-Outline/User_11\a6402e2d-d69e-4822-a90d-d5f66c1adc00.xlsm', NULL, 0, 11, CAST(N'2020-02-09T20:49:29.433' AS DateTime))
GO
INSERT [Business].[ThesisWorkAttachment] ([Id], [ThesisWorkId], [DisplayName], [Version], [GuidName], [Extension], [ContentType], [Url], [Note], [Status], [CreatedBy], [CreatedOn]) VALUES (10, 6, N'Sơ đồ system.docx', NULL, N'5ed7a8b9-7607-4451-ba66-ad05fe0913fe', N'.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', N'Upload/Thesis_1/Master-Outline/User_11\5ed7a8b9-7607-4451-ba66-ad05fe0913fe.docx', NULL, 0, 11, CAST(N'2020-02-09T20:49:29.433' AS DateTime))
GO
SET IDENTITY_INSERT [Business].[ThesisWorkAttachment] OFF
GO
SET IDENTITY_INSERT [System].[Code] ON 
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, NULL, N'NewsCategory', N'Social', N'Social', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, NULL, N'NewsCategory', N'Economic', N'Economic', 2, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, NULL, N'NewsCategory', N'IT', N'Information Technology', 3, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, NULL, N'NewsCategory', N'Sport', N'Sports', 4, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, NULL, N'NewsType', N'Internal', N'Company Internal', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, NULL, N'NewsType', N'External', N'Company External', 2, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, NULL, N'NewsCategory', N'Company', N'Compamy News', 0, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, NULL, N'HomeBanner', N'/assets/img/slide/91.png', N'<h1 class="display-5 font-weight-normal">Hao Lee laoshi</h1>
<p class="lead font-weight-normal">Chào mừng bạn đến với trang thông tin Hao Lee LaoShi, đây là trang thông tin về Hao Lee và là ứng dụng hỗ trợ học tập cho các bạn sinh viên, học viên!</p>', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, NULL, N'HomeBanner', N'/assets/img/slide/92.png', N'<h1 class="display-5 font-weight-normal">Chào  mừng đến với Website Thầy Hiếu!</h1>
<p class="lead font-weight-normal">Chào mừng bạn đến với trang thông tin Hao Lee LaoShi, đây là trang thông tin về Hao Lee và là ứng dụng hỗ trợ học tập cho các bạn sinh viên, học viên!</p>', 2, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, NULL, N'HomeBanner', N'/assets/img/slide/90.png', N'<h1 class="display-5 font-weight-normal">Xin chào các bạn !!</h1>
<p class="lead font-weight-normal">Chào mừng bạn đến với trang thông tin Hao Lee LaoShi, đây là trang thông tin về Hao Lee và là ứng dụng hỗ trợ học tập cho các bạn sinh viên, học viên!</p>', 3, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, NULL, N'ImageGallery', N'/assets/imageGallery/_MG_4554.JPG', N'Sinh viên Bùi Đan Khuê đang trình bày bài báo cáo tại hội nghị NICS 2019, Hà Nội', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, NULL, N'ImageGallery', N'/assets/imageGallery/DSC00221.JPG', N'Thầy trò cùng tham gia hội nghị NICS 2019, Hà Nội', 2, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, NULL, N'ImageGallery', N'/assets/imageGallery/DSC00261.JPG', N'Thầy trò cùng tham gia hội nghị NICS 2019, Hà Nội', 3, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, NULL, N'ImageGallery', N'/assets/imageGallery/DSC00277.JPG', N'Thầy trò cùng tham gia hội nghị NICS 2019, Hà Nội', 4, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, NULL, N'ImageGallery', N'/assets/imageGallery/DSC00301.JPG', N'Sinh viên Bùi Đan Khuê đang trình bày bài báo cáo tại hội nghị NICS 2019, Hà Nội', 5, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, NULL, N'ImageGallery', N'/assets/imageGallery/DSC00306.JPG', N'Sinh viên Bùi Đan Khuê đang trình bày bài báo cáo tại hội nghị NICS 2019, Hà Nội', 6, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, NULL, N'ImageGallery', N'/assets/imageGallery/DSC00475.JPG', N'Sinh viên Nguyễn Thị Thanh Hằng đang trình bày bài báo cáo tại hội nghị NICS 2019, Hà Nội', 7, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, NULL, N'ImageGallery', N'/assets/imageGallery/DSC00481.JPG', N'Sinh viên Bùi Đan Khuê đang trình bày bài báo cáo tại hội nghị NICS 2019, Hà Nội', 8, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, NULL, N'ImageGallery', N'/assets/imageGallery/DSC00483.JPG', N'Sinh viên Nguyễn Thị Thanh Hằng đang trình bày bài báo cáo tại hội nghị NICS 2019, Hà Nội', 9, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, NULL, N'ImageGallery', N'/assets/imageGallery/DSC00576.JPG', N'PGS.TS Trần Công Hùng chụp hình lưu niệm cùng ban tổ chức NICS2019, Hà Nội', 10, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, NULL, N'ImageGallery', N'/assets/imageGallery/DSC00585.JPG', N'Sinh viên Bùi Đan Khuê và học viên Đỗ Phước Sang chụp hình lưu niệm tại NICS 2019, Hà Nội', 11, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, NULL, N'ImageGallery', N'/assets/imageGallery/gv_nics2019_01.jpg', N'PGS.TS Trần Công Hùng, TS.Tân Hạnh cùng chụp hình lưu niệm với học sinh của mình tại NICS 2019, Hà Nội', 12, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, NULL, N'ImageGallery', N'/assets/imageGallery/ou_phatbang_2019.jpg', N'Các thầy cô, giảng viên khoa CNTT, Đai học Mở TP.HCM dự lễ tốt nghiệp sinh viên khóa 2015, tháng 12 năm 2019,', 13, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, NULL, N'ImageGallery', N'/assets/imageGallery/iceri_01.jpg', N'Bài báo tham dự hội nghị ICERI 2019 tại Seville, Spain vào tháng 11 năm 2019', 14, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, NULL, N'ImageGallery', N'/assets/imageGallery/iceri_02.jpg', N'Bài báo tham dự hội nghị ICERI 2019 tại Seville, Spain vào tháng 11 năm 2019', 15, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, NULL, N'SubmitType', N'Per-Online-Doc', N'Nộp onine bằng các tập office (doc, xls, pdf...), nộp cá nhân.', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, NULL, N'SubmitType', N'Per-Online-Git', N'Nộp onine bằng url của GitHub hoặc BitBucket, nộp cá nhân.', 2, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, NULL, N'SubmitType', N'Per-Online-Url', N'Nộp onine bằng url của bên thứ 3 như Google Drive, nộp cá nhân.', 3, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, NULL, N'SubmitType', N'Grp-Online-Url', N'Nộp onine bằng url của bên thứ 3 như Google Drive, nộp theo nhóm.', 4, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, NULL, N'SubmitType', N'Grp-Online-Doc', N'Nộp onine bằng các tập office (doc, xls, pdf...), nộp theo nhóm.', 5, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (32, NULL, N'SubmitType', N'Grp-Online-Git', N'Nộp onine bằng url của GitHub hoặc BitBucket, nộp theo nhóm.', 6, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (33, NULL, N'SubmitType', N'Per-Offline', N'Bài cá nhân, nộp tại lớp cho giáo viên', 7, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (34, NULL, N'SubmitType', N'Grp-Offline', N'Bài nhóm, nộp tại lớp cho giáo viên', 8, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (35, NULL, N'SubmitType', N'Per-Online-Test', N'Bài cá nhân, làm test online trên hệ thống.', 9, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1027, NULL, N'RequestType', N'Create-Account', N'Về việc tạo tài khoản để xem thông tin', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1028, NULL, N'RequestType', N'General', N'Về thông tin chung', 2, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1029, NULL, N'RequestType', N'Study', N'Về hợp tác nghiên cứu khoa học', 3, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1030, NULL, N'RequestType', N'Train', N'Về hợp tác đào tạo', 4, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1031, NULL, N'ThesisWorkType', N'Master-Outline', N'Đề cương LVTh.S', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1032, NULL, N'ThesisWorkType', N'Bachelor-Outline', N'Đề cương LVĐH', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1033, NULL, N'ThesisWorkType', N'Doctor-Outline', N'Đề cương LATS', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1034, NULL, N'ThesisWorkType', N'Master-Thesis', N'Luận văn Thạc sĩ', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1035, NULL, N'ThesisWorkType', N'Bachelor-Thesis', N'Luận văn Đại học', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1036, NULL, N'ThesisWorkType', N'Doctor-Thesis', N'Luận Án Tiến Sĩ', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1037, NULL, N'ThesisWorkType', N'Master-Present', N'Báo cáo luận văn Th.S', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1038, NULL, N'ThesisWorkType', N'Bachelor-Present', N'Báo cáo luận văn Đại học', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1039, NULL, N'ThesisWorkType', N'Doctor-Present', N'Báo cáo luận án TS', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1040, NULL, N'ThesisWorkType', N'Publication', N'Bài báo công bố', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1041, NULL, N'ReferenceType', N'Book', N'Sách', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1042, NULL, N'ReferenceType', N'Journal-Article', N'Bài báo tạp chí', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1043, NULL, N'ReferenceType', N'Conference-Proceeding', N'Bài báo hội nghị', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1044, NULL, N'ReferenceType', N'Report', N'Báo cáo', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1045, NULL, N'ReferenceType', N'Website', N'Trang web', 1, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[Code] OFF
GO
INSERT [System].[CodeType] ([Code], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'HomeBanner', N'Home Banner', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[CodeType] ([Code], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'ImageGallery', N'Thư viện ảnh', 2, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[CodeType] ([Code], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'NewsCategory', N'Category', 3, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[CodeType] ([Code], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'NewsType', N'News Type', 4, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[CodeType] ([Code], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'ReferenceType', N'Loại tài liệu tham khảo', 8, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[CodeType] ([Code], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'RequestType', N'Nhóm yêu cầu ', 6, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[CodeType] ([Code], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'SubmitType', N'Cách thức nộp bài', 5, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[CodeType] ([Code], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'ThesisWorkType', N'Loại công việc Luận văn', 7, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[Function] ON 
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, NULL, N'S0', N'transfer', 0, N'Select Class', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, NULL, N'S1', NULL, 1, N'Class info', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 2, N'S1-01', N'dashboard', 1, N'Class info - Dashboard', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 2, N'S1-02', N'mycourse-intro', 2, N'Class info - Course Introduction', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 2, N'S1-03', N'mycourse-student-list', 3, N'Class info - Course Student List', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 2, N'S1-04', N'mycourse-material', 4, N'Class info - Course Materials', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 2, N'S1-05', N'mycourse-assignment', 5, N'Class info - Course Assignment', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 2, N'S1-06', N'mycourse-score', 6, N'Class info - Course Score', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 2, N'S1-07', N'mycourse-discussion', 7, N'Class info - Course Discussion', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 2, N'S1-08', N'mycourse-teacher', 8, N'Class info - Course''s instructor info', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, NULL, N'C0', NULL, 1, N'User profile', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 11, N'C0-01', N'user-profile', 1, N'User profile - Edit profile info', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 11, N'C0-02', N'user-change-pass', 2, N'User profile - Change pass', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, NULL, N'A1', NULL, 1, N'User Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 14, N'A1-01', N'user-create', 1, N'User Management - Create new User', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, 14, N'A1-02', N'user-search', 2, N'User Management - Search & edit user', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 14, N'A1-03', N'user-upload-list', 3, N'User Management - Upload user list', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, NULL, N'A2', NULL, 2, N'Role Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, 18, N'A2-01', N'role-create', 1, N'Role Management - Create new role', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, 18, N'A2-02', N'role-search', 2, N'Role Management - Search & edit role', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, NULL, N'A3', NULL, 3, N'Group Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, 21, N'A3-01', N'group-create', 1, N'Group Management - Create new group', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, 21, N'A3-02', N'group-search', 2, N'Group Management - Search & edit group', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, NULL, N'A4', NULL, 4, N'School Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, 24, N'A4-01', N'school-create', 1, N'School Management - Create new school', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, 24, N'A4-02', N'school-search', 2, N'School Management -  Search & edit school', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, NULL, N'A5', NULL, 5, N'Subject Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, 27, N'A5-01', N'subject-create', 1, N'Subject Management - Create new subject', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, 27, N'A5-02', N'subject-search', 2, N'Subject Management -  Search & edit subject', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, NULL, N'A6', NULL, 6, N'Class/ Course Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, 30, N'A6-01', N'class-create', 1, N'Class/ Course Management - Create new class', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (32, 30, N'A6-02', N'class-search', 2, N'Class/ Course Management -  Search & edit Class ', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (33, NULL, N'A7', NULL, 7, N'Teacher Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (34, 33, N'A7-01', N'teacher-create', 1, N'Teacher Management - Create new teacher', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (35, 33, N'A7-02', N'teacher-search', 2, N'Teacher Management - Search & edit teacher', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (36, 30, N'A6-03', N'class-report', 3, N'Class/ Course Management -  Class Report', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (37, NULL, N'A9', N'request-management', 9, N'Request Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (39, NULL, N'P0', NULL, 0, N'Home page', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (40, NULL, N'P1', NULL, 1, N'LaoShi Introduction', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (41, NULL, N'P2', NULL, 2, N'LaoShi Information', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (42, NULL, N'P3', NULL, 3, N'LaoShi Studies & Works', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (43, NULL, N'P4', NULL, 4, N'LaoShi ''s students', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (44, NULL, N'P5', NULL, 5, N'LaoShi ''s contact (Make request)', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (45, NULL, N'P6', NULL, 6, N'Login page', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (46, NULL, N'A0', N'dashboard-admin', 0, N'Dashboard of Admin', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (47, NULL, N'G0', N'dashboard-grad', 0, N'Dashboard of Thesis', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (48, NULL, N'S3', N'student-test', 1, N'Student test', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (49, NULL, N'G1', N'thesis-intro', 1, N'Thesis introduction', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (50, NULL, N'G2', N'thesis-document', 2, N'Thesis documents', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (51, NULL, N'G3', N'thesis-student-work', 3, N'Thesis student works', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (52, NULL, N'G4', N'thesis-reference', 4, N'Thesis references', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (53, NULL, N'T1', NULL, 1, N'Teacher ''s class', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (54, NULL, N'T1-01', N'teacher-class-info', 1, N'Teacher -Class ''s info', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (55, NULL, N'T1-02', N'teacher-class-score-config', 2, N'Teacher -Class score config', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (56, NULL, N'T1-03', N'teacher-class-discuss', 3, N'Teacher -Class discussion', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (57, NULL, N'T1-04', N'teacher-class-assignment', 4, N'Teacher -Class assignment', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (58, NULL, N'T1-05', N'teacher-class-student', 5, N'Teacher -Class ''s student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (59, NULL, N'T1-06', N'teacher-class-attendance', 6, N'Teacher -Class ''s attendance', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (60, NULL, N'T1-07', N'teacher-class-document', 7, N'Teacher -Class ''s materials', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (61, NULL, N'T1-08', N'teacher-class-announce', 8, N'Teacher -Class ''s announcement', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (62, NULL, N'T2', NULL, 2, N'Teacher - thesis', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (63, NULL, N'T2-01', N'teacher-thesis-info', 1, N'Teacher -Thesis info', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (64, NULL, N'T2-02', N'teacher-thesis-doc', 2, N'Teacher -Thesis document', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (65, NULL, N'T2-03', N'teacher-thesis-work', 3, N'Teacher -Thesis student work', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (66, NULL, N'G5', N'thesis-discussion', 5, N'Teacher -Thesis discussion', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (67, NULL, N'T2-04', N'teacher-thesis-discussion', 3, N'Teacher -Thesis discussion', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (68, NULL, N'T1-09', N'teacher-exam', 9, N'Teacher - Exam', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (69, NULL, N'A8', NULL, 8, N'Thesis Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (70, NULL, N'A8-01', N'thesis-create', 1, N'Thesis Management - Create new thesis', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (71, NULL, N'A8-02', N'thesis-search', 2, N'Thesis Management - Search & Edit thesis', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (72, NULL, N'A10', NULL, 10, N'Settings', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (73, NULL, N'A10-01', N'type-management', 1, N'CodeType Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (74, NULL, N'A10-02', N'code-management', 1, N'Code Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (75, NULL, N'T0', N'dashboard-teacher', 1, N'Teacher ''s class', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (76, NULL, N'A10-03', N'news-management', 1, N'News Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (77, NULL, N'A11', NULL, 11, N'Student Management', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (78, NULL, N'A11-01', N'student-create', 1, N'Student Management - Create new student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Function] ([Id], [ParentId], [Code], [Url], [Sequence], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (79, NULL, N'A11-02', N'student-search', 1, N'Student Management - Search edit student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[Function] OFF
GO
SET IDENTITY_INSERT [System].[FunctionRole] ON 
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 11, 1, N'[Admin] - C0 - User profile', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 12, 1, N'[Admin] - C0-01 - User profile - Edit profile info', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 13, 1, N'[Admin] - C0-02 - User profile - Change pass', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 14, 1, N'[Admin] - A1 - User Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 15, 1, N'[Admin] - A1-01 - User Management - Create new User', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 16, 1, N'[Admin] - A1-02 - User Management - Search & edit user', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 17, 1, N'[Admin] - A1-03 - User Management - Upload user list', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 18, 1, N'[Admin] - A2 - Role Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 19, 1, N'[Admin] - A2-01 - Role Management - Create new role', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 20, 1, N'[Admin] - A2-02 - Role Management - Search & edit role', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 21, 1, N'[Admin] - A3 - Group Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 22, 1, N'[Admin] - A3-01 - Group Management - Create new group', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 23, 1, N'[Admin] - A3-02 - Group Management - Search & edit group', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 24, 1, N'[Admin] - A4 - School Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 25, 1, N'[Admin] - A4-01 - School Management - Create new school', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, 26, 1, N'[Admin] - A4-02 - School Management -  Search & edit school', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 27, 1, N'[Admin] - A5 - Subject Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, 28, 1, N'[Admin] - A5-01 - Subject Management - Create new subject', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, 29, 1, N'[Admin] - A5-02 - Subject Management -  Search & edit subject', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, 30, 1, N'[Admin] - A6 - Class/ Course Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, 31, 1, N'[Admin] - A6-01 - Class/ Course Management - Create new class', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, 32, 1, N'[Admin] - A6-02 - Class/ Course Management -  Search & edit Class ', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, 33, 1, N'[Admin] - A7 - Teacher Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, 34, 1, N'[Admin] - A7-01 - Teacher Management - Create new teacher', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, 35, 1, N'[Admin] - A7-02 - Teacher Management - Search & edit teacher', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, 36, 1, N'[Admin] - A6-03 - Class/ Course Management -  Class Report', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, 37, 1, N'[Admin] - A9 - Request Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, 46, 1, N'[Admin] - A0 - Dashboard of Admin', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, 69, 1, N'[Admin] - A8 - Thesis Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, 70, 1, N'[Admin] - A8-01 - Thesis Management - Create new thesis', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, 71, 1, N'[Admin] - A8-02 - Thesis Management - Search & Edit thesis', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (32, 72, 1, N'[Admin] - A10 - Code-Type Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (33, 73, 1, N'[Admin] - A10-01 - CodeType Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (34, 74, 1, N'[Admin] - A10-02 - Code Management', 1, 1, CAST(N'2020-02-06T15:07:01.847' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (35, 1, 3, N'[Student] - S0 - Select Class', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (36, 2, 3, N'[Student] - S1 - Class info', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (37, 3, 3, N'[Student] - S1-01 - Class info - Dashboard', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (38, 4, 3, N'[Student] - S1-02 - Class info - Course Introduction', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (39, 5, 3, N'[Student] - S1-03 - Class info - Course Student List', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (40, 6, 3, N'[Student] - S1-04 - Class info - Course Materials', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (41, 7, 3, N'[Student] - S1-05 - Class info - Course Assignment', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (42, 8, 3, N'[Student] - S1-06 - Class info - Course Score', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (43, 9, 3, N'[Student] - S1-07 - Class info - Course Discussion', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (44, 10, 3, N'[Student] - S1-08 - Class info - Course''s instructor info', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (45, 11, 3, N'[Student] - C0 - User profile', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (46, 12, 3, N'[Student] - C0-01 - User profile - Edit profile info', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (47, 13, 3, N'[Student] - C0-02 - User profile - Change pass', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (48, 47, 3, N'[Student] - G0 - Dashboard of Thesis', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (49, 48, 3, N'[Student] - S3 - Student test', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (50, 49, 3, N'[Student] - G1 - Thesis introduction', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (51, 50, 3, N'[Student] - G2 - Thesis documents', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (52, 51, 3, N'[Student] - G3 - Thesis student works', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (53, 52, 3, N'[Student] - G4 - Thesis references', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (54, 66, 3, N'[Student] - G5 - Teacher -Thesis discussion', 1, 1, CAST(N'2020-02-06T15:07:56.430' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (55, 11, 2, N'[Teacher-TA] - C0 - User profile', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (56, 12, 2, N'[Teacher-TA] - C0-01 - User profile - Edit profile info', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (57, 13, 2, N'[Teacher-TA] - C0-02 - User profile - Change pass', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (58, 53, 2, N'[Teacher-TA] - T1 - Teacher ''s class', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (59, 54, 2, N'[Teacher-TA] - T1-01 - Teacher -Class ''s info', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (60, 55, 2, N'[Teacher-TA] - T1-02 - Teacher -Class score config', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (61, 56, 2, N'[Teacher-TA] - T1-03 - Teacher -Class discussion', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (62, 57, 2, N'[Teacher-TA] - T1-04 - Teacher -Class assignment', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (63, 58, 2, N'[Teacher-TA] - T1-05 - Teacher -Class ''s student', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (64, 59, 2, N'[Teacher-TA] - T1-06 - Teacher -Class ''s attendance', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (65, 60, 2, N'[Teacher-TA] - T1-07 - Teacher -Class ''s materials', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (66, 61, 2, N'[Teacher-TA] - T1-08 - Teacher -Class ''s announcement', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (67, 62, 2, N'[Teacher-TA] - T2 - Teacher - thesis', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (68, 63, 2, N'[Teacher-TA] - T2-01 - Teacher -Thesis info', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (69, 64, 2, N'[Teacher-TA] - T2-02 - Teacher -Thesis document', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (70, 65, 2, N'[Teacher-TA] - T2-03 - Teacher -Thesis student work', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (71, 67, 2, N'[Teacher-TA] - T2-04 - Teacher -Thesis discussion', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (72, 68, 2, N'[Teacher-TA] - T1-09 - Teacher - Exam', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (73, 75, 2, N'[Teacher-TA] - T0 - Teacher dashboard', 1, 1, CAST(N'2020-02-06T15:09:31.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (74, 76, 1, N'Admin - A10-03 - News Management', 1, 1, CAST(N'2020-02-11T11:40:44.810' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (75, 77, 1, N'Admin - A11 - Student Management', 1, 1, CAST(N'2020-02-11T11:40:44.810' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (76, 78, 1, N'Admin - A11-01 - Student Management - Create new student', 1, 1, CAST(N'2020-02-11T11:40:44.810' AS DateTime), NULL, NULL)
GO
INSERT [System].[FunctionRole] ([Id], [FunctionId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (77, 79, 1, N'Admin - A11-02 - Student Management - Search edit student', 1, 1, CAST(N'2020-02-11T11:40:44.810' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[FunctionRole] OFF
GO
SET IDENTITY_INSERT [System].[Group] ON 
GO
INSERT [System].[Group] ([Id], [Level], [Pid], [InitialChar], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, NULL, N'OWNER', N'Website owner', 1, 1, CAST(N'2019-12-19T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Group] ([Id], [Level], [Pid], [InitialChar], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 2, 1, N'VIEW-A-1', N'Website Viewer level A-1', 1, 1, CAST(N'2019-12-19T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Group] ([Id], [Level], [Pid], [InitialChar], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 3, 2, N'VIEW-A-2', N'Website Viewer level A-2', 1, 1, CAST(N'2019-12-19T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Group] ([Id], [Level], [Pid], [InitialChar], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 2, 1, N'VIEW-B-1', N'Website Viewer level B-1', 1, 1, CAST(N'2019-12-19T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Group] ([Id], [Level], [Pid], [InitialChar], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 3, 4, N'VIEW-B-2', N'Website Viewer level B-2', 1, 1, CAST(N'2019-12-19T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[Group] OFF
GO
SET IDENTITY_INSERT [System].[LoginHistory] ON 
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'admin', N'f95b07ce-c5d3-4c63-91c3-7c2a5c65b985', CAST(N'2020-01-20T14:35:26.593' AS DateTime), NULL, CAST(N'2020-01-20T14:35:26.593' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'admin', N'51d3acf5-c624-4df9-8e28-149f0a3c0e80', CAST(N'2020-01-20T14:36:28.747' AS DateTime), NULL, CAST(N'2020-01-20T14:36:28.747' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'admin', N'23bc4b7c-f1d5-4c5d-b593-2c3956d13408', CAST(N'2020-01-20T14:38:27.710' AS DateTime), NULL, CAST(N'2020-01-20T14:38:27.710' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'admin', N'aa43a6a3-1b35-4d48-be62-e6dba4ac9166', CAST(N'2020-01-20T14:42:52.023' AS DateTime), NULL, CAST(N'2020-01-20T14:42:52.023' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'admin', N'f6c36866-262c-4b5c-905c-e70bc8132d2a', CAST(N'2020-01-20T14:43:48.187' AS DateTime), NULL, CAST(N'2020-01-20T14:43:48.187' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'admin', N'7e0646ac-9cd9-41a5-9dfa-c7a3de4860a2', CAST(N'2020-01-20T14:45:18.717' AS DateTime), NULL, CAST(N'2020-01-20T14:45:18.717' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'admin', N'778243ad-5d4e-46fb-a99a-1dcd6fb97798', CAST(N'2020-01-20T14:46:17.770' AS DateTime), NULL, CAST(N'2020-01-20T14:46:17.770' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'admin', N'c57fc0df-de0f-47d4-bef5-fc1a43dacfe5', CAST(N'2020-01-20T14:46:31.127' AS DateTime), NULL, CAST(N'2020-01-20T14:46:31.127' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'admin', N'd78806e3-7a8a-4c80-8c19-c917e5b92563', CAST(N'2020-01-20T14:47:34.723' AS DateTime), NULL, CAST(N'2020-01-20T14:47:34.723' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'admin', N'7626996d-7822-4058-b13f-86c420297a0b', CAST(N'2020-01-20T14:48:23.490' AS DateTime), NULL, CAST(N'2020-01-20T14:48:23.490' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'admin', N'c5bf1bb3-63f6-4821-8c99-50fd75bf9ec6', CAST(N'2020-01-20T14:51:42.060' AS DateTime), NULL, CAST(N'2020-01-20T14:51:42.060' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, N'admin', N'188db7e4-bbe7-4c8b-bb26-13d1cf040139', CAST(N'2020-01-20T15:57:54.203' AS DateTime), NULL, CAST(N'2020-01-20T15:57:54.203' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, N'admin', N'767f1caf-34a8-4970-a253-aed392d225f0', CAST(N'2020-01-20T16:02:00.440' AS DateTime), NULL, CAST(N'2020-01-20T16:02:00.440' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, N'admin', N'b32deeac-0a01-418e-9f33-6cab919e380b', CAST(N'2020-01-20T17:07:13.097' AS DateTime), NULL, CAST(N'2020-01-20T17:07:13.097' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, N'yenkhuong214@gmail.com', N'7d5408e7-ef2e-44ae-9f7e-a218be79a90e', CAST(N'2020-01-20T17:08:10.083' AS DateTime), NULL, CAST(N'2020-01-20T17:08:10.083' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, N'admin', N'fdb702a8-f0d3-4b37-a209-050dd7a2a810', CAST(N'2020-01-20T17:14:31.020' AS DateTime), NULL, CAST(N'2020-01-20T17:14:31.020' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, N'admin', N'9ec9db5d-b3fb-47a5-98b9-65494bbe4f31', CAST(N'2020-01-20T17:43:21.080' AS DateTime), NULL, CAST(N'2020-01-20T17:43:21.080' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, N'yenkhuong214@gmail.com', N'80914ece-88bb-4488-af89-46bb2f5666b8', CAST(N'2020-01-20T18:09:20.913' AS DateTime), NULL, CAST(N'2020-01-20T18:09:20.913' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, N'hanh', N'5c1769d9-3f51-4f41-8f77-3157fc4b7bae', CAST(N'2020-01-21T15:50:38.000' AS DateTime), NULL, CAST(N'2020-01-21T15:50:38.000' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, N's15', N'1aa988e4-52f5-4184-930e-96c2d7a63919', CAST(N'2020-01-21T16:49:48.217' AS DateTime), NULL, CAST(N'2020-01-21T16:49:48.217' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, N's15', N'f3632f83-bcd2-4cbd-bb15-dcec7281da16', CAST(N'2020-01-21T16:50:31.480' AS DateTime), NULL, CAST(N'2020-01-21T16:50:31.480' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, N's15', N'24db03f3-b8ae-4c41-810f-937488d447fb', CAST(N'2020-01-21T16:51:15.457' AS DateTime), NULL, CAST(N'2020-01-21T16:51:15.457' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, N'yenkhuong214@gmail.com', N'f5a0b8f3-adba-4eea-9a98-6f8fcea5f09b', CAST(N'2020-01-21T18:18:46.050' AS DateTime), NULL, CAST(N'2020-01-21T18:18:46.050' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, N's15', N'38d14352-9e8d-4900-8bed-51eb6c87ab67', CAST(N'2020-01-21T21:20:49.257' AS DateTime), NULL, CAST(N'2020-01-21T21:20:49.257' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, N's15', N'e69288c7-dff8-4fbc-aa77-aa25064ff340', CAST(N'2020-01-25T18:44:59.353' AS DateTime), NULL, CAST(N'2020-01-25T18:44:59.353' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, N's15', N'ed9af747-8844-498d-906e-39c0f4a6279f', CAST(N'2020-01-25T18:51:35.507' AS DateTime), NULL, CAST(N'2020-01-25T18:51:35.507' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, N's15', N'740cb47c-4f1e-4023-b4ef-77a51adad106', CAST(N'2020-01-25T18:59:32.120' AS DateTime), NULL, CAST(N'2020-01-25T18:59:32.120' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, N's15', N'f776d9d3-d64c-4d28-a5b3-db3f54e7304c', CAST(N'2020-01-25T19:02:01.960' AS DateTime), NULL, CAST(N'2020-01-25T19:02:01.960' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, N's18', N'0f4fcfba-54bf-4490-8e17-f3f63be2cd46', CAST(N'2020-01-28T22:20:13.817' AS DateTime), NULL, CAST(N'2020-01-28T22:20:13.817' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, N's18', N'4b536f0f-2d6a-46b3-af19-028839cc32c2', CAST(N'2020-01-28T22:20:30.603' AS DateTime), NULL, CAST(N'2020-01-28T22:20:30.603' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, N's14', N'2376469e-3e8c-4bdf-9849-8cc9198ab4a7', CAST(N'2020-01-28T22:20:43.283' AS DateTime), NULL, CAST(N'2020-01-28T22:20:43.283' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (32, N's18', N'088329c4-13ae-46e8-a935-565160088e6c', CAST(N'2020-01-28T22:32:01.000' AS DateTime), NULL, CAST(N'2020-01-28T22:32:01.000' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (33, N's15', N'770d0b6b-84f1-423f-9002-fc05e738845f', CAST(N'2020-01-29T19:01:41.880' AS DateTime), NULL, CAST(N'2020-01-29T19:01:41.880' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (34, N's15', N'78f3c1e8-c803-4be9-86af-167f2f1c6aa2', CAST(N'2020-01-30T10:48:54.090' AS DateTime), NULL, CAST(N'2020-01-30T10:48:54.090' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (35, N's18', N'23cf8a2f-4af8-4eb5-a257-93106402b169', CAST(N'2020-01-30T16:51:23.153' AS DateTime), NULL, CAST(N'2020-01-30T16:51:23.153' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (36, N's16', N'c193ae3f-9cd9-424c-b65c-7992d7590884', CAST(N'2020-01-30T17:01:45.490' AS DateTime), NULL, CAST(N'2020-01-30T17:01:45.490' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (37, N's17', N'72fca4aa-4596-4d00-8bad-d98fab8e3390', CAST(N'2020-01-30T17:08:10.167' AS DateTime), NULL, CAST(N'2020-01-30T17:08:10.167' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1025, N's16', N'67cf90ae-c130-4630-97b5-e9fa5f93c6e0', CAST(N'2020-02-03T14:46:17.913' AS DateTime), NULL, CAST(N'2020-02-03T14:46:17.913' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1026, N'gs11', N'5ca2dd92-f808-4b0f-8298-89c564c753f0', CAST(N'2020-02-05T16:24:13.857' AS DateTime), NULL, CAST(N'2020-02-05T16:24:13.857' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1027, N'gs11', N'dba9956a-cde2-4611-b8e6-548929c35042', CAST(N'2020-02-05T16:24:33.633' AS DateTime), NULL, CAST(N'2020-02-05T16:24:33.633' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1028, N'gs11', N'24e9c6f2-480a-49b7-ade0-20324f0afa08', CAST(N'2020-02-05T16:32:01.433' AS DateTime), NULL, CAST(N'2020-02-05T16:32:01.433' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1029, N'gs11', N'b9ba8335-40ba-4a20-853e-948833b803e3', CAST(N'2020-02-05T16:41:43.583' AS DateTime), NULL, CAST(N'2020-02-05T16:41:43.583' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1030, N'gs11', N'65988dff-3f1d-4f23-a858-16df398432d8', CAST(N'2020-02-05T16:55:20.260' AS DateTime), NULL, CAST(N'2020-02-05T16:55:20.260' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1031, N'gs11', N'a17b7b29-4ab2-44dd-8736-4b9b54089769', CAST(N'2020-02-05T18:49:16.467' AS DateTime), NULL, CAST(N'2020-02-05T18:49:16.467' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1032, N'gs11', N'220db631-01f5-424a-8f4a-478d56fe6978', CAST(N'2020-02-05T18:52:16.947' AS DateTime), NULL, CAST(N'2020-02-05T18:52:16.947' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1033, N'gs11', N'9b7dad18-d813-4e8b-855a-4101036a90a9', CAST(N'2020-02-05T18:57:54.873' AS DateTime), NULL, CAST(N'2020-02-05T18:57:54.873' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1034, N'gs11', N'b999d54d-89f7-48d6-8cde-1f62b6a709e9', CAST(N'2020-02-06T00:37:38.607' AS DateTime), NULL, CAST(N'2020-02-06T00:37:38.607' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1035, N's15', N'2735b150-9d92-47e7-b5d4-00a3952909f0', CAST(N'2020-02-06T00:43:29.763' AS DateTime), NULL, CAST(N'2020-02-06T00:43:29.763' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1036, N'gs11', N'4717e84a-bedc-454d-9e5e-6c13216b1b72', CAST(N'2020-02-06T00:44:48.083' AS DateTime), NULL, CAST(N'2020-02-06T00:44:48.083' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1037, N's13', N'a3d6eb88-99ed-4d5b-aaef-3aaf94a65ccd', CAST(N'2020-02-06T15:22:13.733' AS DateTime), NULL, CAST(N'2020-02-06T15:22:13.733' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1038, N's15', N'4f77f8a6-453a-46e1-8963-6e7969819d4c', CAST(N'2020-02-06T15:27:42.703' AS DateTime), NULL, CAST(N'2020-02-06T15:27:42.703' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1039, N's15', N'53682948-117a-4f41-965f-d35f70ec8aee', CAST(N'2020-02-06T15:32:27.817' AS DateTime), NULL, CAST(N'2020-02-06T15:32:27.817' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1040, N's15', N'14cfa064-5df0-42b3-b0d2-73396247e051', CAST(N'2020-02-06T15:35:51.333' AS DateTime), NULL, CAST(N'2020-02-06T15:35:51.333' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1041, N'gs11', N'b0414ea0-0465-49b3-be35-b7f307cfaa03', CAST(N'2020-02-06T21:41:49.373' AS DateTime), NULL, CAST(N'2020-02-06T21:41:49.373' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1042, N'admin', N'225bfe1f-535d-451c-a8ee-f2abc0e89452', CAST(N'2020-02-06T21:42:59.423' AS DateTime), NULL, CAST(N'2020-02-06T21:42:59.423' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1043, N'admin', N'89f38750-28c5-4a49-b14e-da0a45499e61', CAST(N'2020-02-07T11:19:19.810' AS DateTime), NULL, CAST(N'2020-02-07T11:19:19.810' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1044, N's13', N'4408a5ee-a67c-4470-b15a-04150fe98411', CAST(N'2020-02-07T11:30:36.367' AS DateTime), NULL, CAST(N'2020-02-07T11:30:36.367' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1045, N'hanh', N'891c29f6-bb8c-4a7b-9c27-23c3cbf6d510', CAST(N'2020-02-07T11:33:01.560' AS DateTime), NULL, CAST(N'2020-02-07T11:33:01.560' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1046, N's16', N'e0c65107-2ed8-4b5c-ba74-8676fad3a704', CAST(N'2020-02-07T11:35:01.720' AS DateTime), NULL, CAST(N'2020-02-07T11:35:01.720' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1047, N'gs11', N'c4b9597d-1a62-4010-9bb1-5fb461be6c6c', CAST(N'2020-02-07T11:40:08.893' AS DateTime), NULL, CAST(N'2020-02-07T11:40:08.893' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1048, N'hanh', N'46cd8fe1-ceff-4e79-b717-948b73bfaa72', CAST(N'2020-02-07T11:40:56.180' AS DateTime), NULL, CAST(N'2020-02-07T11:40:56.180' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1049, N'gs11', N'70a3ad7f-11cf-4cb2-b4d3-93bd09d8fa7a', CAST(N'2020-02-07T14:51:38.293' AS DateTime), NULL, CAST(N'2020-02-07T14:51:38.293' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1050, N'gs11', N'3bd4c395-4584-484a-afc6-63144ad062a4', CAST(N'2020-02-08T17:45:49.377' AS DateTime), NULL, CAST(N'2020-02-08T17:45:49.377' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1051, N's16', N'ed1d880e-6af2-447d-a086-ea9d8e7cb3d7', CAST(N'2020-02-09T19:52:33.767' AS DateTime), NULL, CAST(N'2020-02-09T19:52:33.767' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1052, N'gs11', N'4f34c0e5-ddd7-4ab8-84a2-84fc28f3642f', CAST(N'2020-02-09T19:56:19.363' AS DateTime), NULL, CAST(N'2020-02-09T19:56:19.363' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1053, N'admin', N'9d20f157-20e2-4b8c-b48c-d8918b0efbef', CAST(N'2020-02-10T15:45:14.977' AS DateTime), NULL, CAST(N'2020-02-10T15:45:14.977' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1054, N'admin', N'0d2fb3ba-4e4d-4e60-94d9-7c81096bac51', CAST(N'2020-02-11T11:51:06.130' AS DateTime), NULL, CAST(N'2020-02-11T11:51:06.130' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1055, N'hanh', N'08e551c4-dd74-4945-8d0a-774df44447ea', CAST(N'2020-02-11T13:56:44.867' AS DateTime), NULL, CAST(N'2020-02-11T13:56:44.867' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1056, N'hieu', N'297b6f90-0a90-4e36-9581-19ae5e2a4f42', CAST(N'2020-02-11T15:14:44.323' AS DateTime), NULL, CAST(N'2020-02-11T15:14:44.323' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1057, N'admin', N'7ed53805-d19e-480f-a1f4-efcb7a444ba9', CAST(N'2020-02-12T12:07:24.653' AS DateTime), NULL, CAST(N'2020-02-12T12:07:24.653' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1058, N'hieu', N'ac3806d1-5609-4852-a51a-b8740f932280', CAST(N'2020-02-12T12:09:18.320' AS DateTime), NULL, CAST(N'2020-02-12T12:09:18.320' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1059, N'hieu', N'd73c8620-b109-4ae9-9be4-22f4873b7b53', CAST(N'2020-02-13T19:30:40.693' AS DateTime), NULL, CAST(N'2020-02-13T19:30:40.693' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1060, N'admin', N'e1cc1455-3d2b-4b4d-b4cf-cd28a52e22dc', CAST(N'2020-02-18T10:19:58.747' AS DateTime), NULL, CAST(N'2020-02-18T10:19:58.747' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1061, N'hieu', N'7304a1fe-cdfd-48d7-9307-c86a8e5811f4', CAST(N'2020-02-18T10:32:18.790' AS DateTime), NULL, CAST(N'2020-02-18T10:32:18.790' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1062, N's15', N'f95063a3-e7c8-40b1-8c12-4f9f92f839e0', CAST(N'2020-02-18T22:49:10.393' AS DateTime), NULL, CAST(N'2020-02-18T22:49:10.393' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1063, N'hieu', N'b4d648ec-1cad-4b43-acde-f38fa70ba560', CAST(N'2020-02-18T23:24:36.737' AS DateTime), NULL, CAST(N'2020-02-18T23:24:36.737' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [System].[LoginHistory] ([Id], [UserName], [Uuid], [SignInOn], [SignOutOn], [LastAccessedOn], [Host], [UserAgent], [SingleSession], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1064, N'hieu', N'aa034f52-bb42-43da-b213-4fb265187505', CAST(N'2020-02-26T10:27:33.473' AS DateTime), NULL, CAST(N'2020-02-26T10:27:33.473' AS DateTime), N'localhost:44307', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 0, 0, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [System].[LoginHistory] OFF
GO
SET IDENTITY_INSERT [System].[Role] ON 
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Administration', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Teacher-Assistant', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'Other-Teacher', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'School-Staff', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Role] ([Id], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'Guest', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[Role] OFF
GO
SET IDENTITY_INSERT [System].[Setting] ON 
GO
INSERT [System].[Setting] ([Id], [UserId], [Code], [DataType], [Value], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, N'vi-vn', NULL, NULL, NULL, 1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[Setting] OFF
GO
SET IDENTITY_INSERT [System].[User] ON 
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'admin', N'Hao', N'Lee', N'occbuu@gmail.com', N'+84919004169', N'39-41 Lê Thạch, Phường 12, Quận 4, TP.HCM', N'assets/img/avatars/ava2.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', N'4c4b781b7f3e4ae9b79efea4e3ee0bbb', CAST(N'2020-01-25T18:43:21.613' AS DateTime), CAST(N'2020-02-18T10:19:58.747' AS DateTime), 0, NULL, CAST(N'2020-01-20T14:21:48.233' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'hanh', N'Phúc Hạnh', N'Nguyễn Thị', N'nguyenthiphuchanh@gmail.com', N'+84 975221728', N'39-41 Lê Thạch, Phường 12, Quận 4, TP.HCM', N'assets/img/avatars/ava3.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, CAST(N'2020-02-11T13:56:44.867' AS DateTime), 0, NULL, CAST(N'2020-01-20T14:21:48.237' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'nhat', N'Duy Nhật', N'Nguyễn', N'duynhat240896@gmail.com', N'+84 792073173', N'39-41 Lê Thạch, Phường 12, Quận 4, TP.HCM', N'assets/img/avatars/ava4.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.240' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'an', N'Trường An', N'Nguyễn Dương', N'anannguyen202@gmail.com', N'+84 398131428', N'39-41 Lê Thạch, Phường 12, Quận 4, TP.HCM', N'assets/img/avatars/ava5.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.240' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'yenkhuong214@gmail.com', N'Khương', N'Nguyễn Thị Yến', N'yenkhuong214@gmail.com', N'+84 764668557', N'59/39/15B Đỗ Thúc Tịnh, phường 12, quận Gò Vấp, thành phố Hồ Chí Minh', N'assets/img/avatars/ava6.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, CAST(N'2020-01-21T18:18:46.050' AS DateTime), 0, NULL, CAST(N'2020-01-20T14:21:48.243' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'buikhue0959@gmail.com', N'Khuê', N'Bùi Đan', N'buikhue0959@gmail.com', N'+84 907940889', N'401 Nguyễn Trãi, phường 7, quận 5, Tp.HCM', N'assets/img/avatars/ava1.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.247' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'tranthihonghuong176@gmail.com', N'Hường', N'Trần Thị Hồng', N'tranthihonghuong176@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava5.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.250' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'hangntt2398@gmail.com', N'Hằng', N'Nguyễn Thị Thanh', N'hangntt2398@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava4.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.250' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'thanhnguyen145.ou@gmail.com', N'Thanh', N'Nguyễn Thị Thu', N'thanhnguyen145.ou@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava3.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.253' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'nguyentankhoi97@gmail.com', N'Khôi', N'Nguyễn Tấn', N'nguyentankhoi97@gmail.com', N'+84 329746982', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava5.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.257' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'gs11', N'Lộc', N'Huỳnh Hoàng', N'lochh.188i@ou.edu.vn', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava2.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, CAST(N'2020-02-09T19:56:19.363' AS DateTime), 0, NULL, CAST(N'2020-01-20T14:21:48.257' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, N'toan.nguyen@tanvieta.co', N'Zng', N'Tfy', N'toan.nguyen@tanvieta.co', N'+84345 515 010', N'39-41 Lê Thạch, Phường 12, Quận 4, TP.HCM', N'assets/img/avatars/ava2.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, N's13', N'Ân

', N'Đỗ Quang

', N'doquangan@gmail.com', N'+84 998541717', N'15 Xô Viết Nghệ Tĩnh, Phường 23, Quận Bình Thạnh, TP.HCM', N'assets/img/avatars/1.jpg', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, CAST(N'2020-02-07T11:30:36.367' AS DateTime), 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-25T14:02:28.597' AS DateTime))
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, N's14', N'Bảo

', N'Lê Văn Lương

', N'luongbao@gmail.com', N'+84 924567814', N'TRương Định, Quận 3, TP. HCM.', N'assets/img/avatars/2.jpg', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, CAST(N'2020-01-28T22:20:43.283' AS DateTime), 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-25T14:02:28.597' AS DateTime))
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, N's15', N'Bảo

', N'Phan

', N'phanbaoou@gmail.com', N'+84 9124567811', N'Âu Cơ, Quận Tân Phú, TP. HCM.', N'assets/img/avatars/3.jpg', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', N'b30ec8d351264ee3b0807f5ea38e2670', CAST(N'2020-01-25T18:47:30.013' AS DateTime), CAST(N'2020-02-18T22:49:10.393' AS DateTime), 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-25T14:02:28.597' AS DateTime))
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, N's16', N'Đức', N'Hà Tấn

', N'tanha@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/4.jpg', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, CAST(N'2020-02-09T19:52:33.767' AS DateTime), 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-25T14:02:28.597' AS DateTime))
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, N's17', N'Hào', N'Quách Phú

', N'quachphuchao@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/5.jpg', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, CAST(N'2020-01-30T17:08:10.167' AS DateTime), 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 27, CAST(N'2020-02-25T14:02:28.597' AS DateTime))
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, N's18', N'Khang', N'Đỗ Duy
', N'doduykhang@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/6.jpg', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, CAST(N'2020-01-30T16:51:23.153' AS DateTime), 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, N's19', N'Lâm', N'Trần Ngọc Tuyền
', N'tranlamtuyen@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/7.jpg', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, N's20', N'Phong', N'Hoàng Văn
', N'hoangvanphong@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/8.jpg', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, N's21', N'Quân', N'Nguyễn Minh
', N'nguyenminhquan@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/2.jpg', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, N's22', N'Quỳnh', N'Lê Dạ
', N'ledaquynh@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava3.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, N's23', N'Thành', N'Vũ Hoàng
', N'vuhoangthanh@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava3.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, N's24', N'Trí', N'Hồ Minh
', N'hominhtri@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava3.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, N's25', N'Trí', N'Trần Nhơn Viên
', N'tranviennhontri@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava3.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, N's26', N'Tuấn', N'Nguyễn Xuân
', N'nguyenxuantuan@gmail.com', N'+84 987654321', N' 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.', N'assets/img/avatars/ava3.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', NULL, NULL, NULL, 0, NULL, CAST(N'2020-01-20T14:21:48.260' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, N'hieu', N'Hiếu ', N'Lê Ngọc', N'occbuu@gmail.com', N'+84919004169', N'39-41 Lê Thạch, Phường 12, Quận 4, TP.HCM', N'assets/img/avatars/ava2.png', N'AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==', N'NyLA01m7RmjAyY2WF961nDK4uMA=', N'4c4b781b7f3e4ae9b79efea4e3ee0bbb', CAST(N'2020-01-25T18:43:21.613' AS DateTime), CAST(N'2020-02-26T10:27:33.473' AS DateTime), 0, NULL, CAST(N'2020-01-20T14:21:48.233' AS DateTime), 1, 1, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[User] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Address], [Avatar], [PasswordHash], [PasswordSalt], [ReminderToken], [ReminderExpired], [LastSignIn], [InvalidAttempts], [LockExpired], [LastPasswordChanged], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, N'', N'An', N'Tran Van', N'vanan@gmail.com', N'564654654', N' fadsf sdaf asdhf asdhfk jasd', N'assets/img/avatars/ava1.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 27, CAST(N'2020-02-25T16:16:09.637' AS DateTime), 27, CAST(N'2020-02-25T16:16:57.760' AS DateTime))
GO
SET IDENTITY_INSERT [System].[User] OFF
GO
SET IDENTITY_INSERT [System].[UserGroup] ON 
GO
INSERT [System].[UserGroup] ([Id], [UserId], [GroupId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 1, N'The owner of the site', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserGroup] ([Id], [UserId], [GroupId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 2, 2, N'level 2 - TA', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserGroup] ([Id], [UserId], [GroupId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 3, 2, N'level 2 - TA', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserGroup] ([Id], [UserId], [GroupId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 4, 2, N'level 2 - TA', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserGroup] ([Id], [UserId], [GroupId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 5, 3, N'level 3 - Student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserGroup] ([Id], [UserId], [GroupId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 6, 3, N'level 3 - Student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[UserGroup] OFF
GO
SET IDENTITY_INSERT [System].[UserRole] ON 
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 1, N'Admin role ', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 2, 2, N'Hanh is TA', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 3, 2, N'Nhat is TA', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 4, 2, N'An is TA', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 5, 3, N'Student 1 is Student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 6, 3, N'Student 2 is Student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 13, 3, N'Under student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 14, 3, N'Under student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 15, 3, N'Under student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 16, 3, N'Under student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, 17, 3, N'Under student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, 18, 3, N'Under student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, 19, 3, N'Under student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, 11, 3, N'Grad student', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[UserRole] ([Id], [UserId], [RoleId], [Description], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, 27, 2, N'Hieu is teacher', 1, 1, CAST(N'2019-12-15T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[UserRole] OFF
GO
ALTER TABLE [Business].[AssignmentSubmission] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[Class] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ClassAnnouncement] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ClassAssignment] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ClassAssignmentExam] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ClassAttendance] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ClassDocument] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ClassMember] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ClassScoreConfig] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ClassSession] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ClassStudent] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ClassStudentScore] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[Comment] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[Exam] ADD  CONSTRAINT [DF__Exam__Status__2CF2ADDF]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ExamAnswer] ADD  DEFAULT ((0)) FOR [IsCorrect]
GO
ALTER TABLE [Business].[ExamAnswer] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ExamDetail] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ExamQuestion] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[News] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ReferenceDocument] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[Request] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[School] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[Student] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[StudentExam] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[StudentExamDetail] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[Subject] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[SubmissionAttachment] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[Teacher] ADD  CONSTRAINT [DF__Teacher__Status__3A4CA8FD]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[TeacherDelegateStudent] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[TeacherEduBackground] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[TeacherExperience] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[TeacherMajor] ADD  DEFAULT ((0)) FOR [CanDelete]
GO
ALTER TABLE [Business].[TeacherMajor] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[TeacherPublicProfile] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[TeacherResearchWork] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[TeacherSkill] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[TeacherStudy] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[Thesis] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ThesisDoc] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ThesisPublication] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ThesisReference] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ThesisStudent] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ThesisTeacher] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ThesisWork] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Business].[ThesisWorkAttachment] ADD  CONSTRAINT [DF__ThesisWor__Statu__4A8310C6]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[Code] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[CodeType] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[Function] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[FunctionRole] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[Group] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[LoginHistory] ADD  DEFAULT ((0)) FOR [SingleSession]
GO
ALTER TABLE [System].[LoginHistory] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[PasswordHistory] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[Role] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[Setting] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[User] ADD  DEFAULT ((0)) FOR [InvalidAttempts]
GO
ALTER TABLE [System].[User] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[UserGroup] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[UserRole] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [System].[Code]  WITH CHECK ADD  CONSTRAINT [FkCodeParent] FOREIGN KEY([ParentId])
REFERENCES [System].[Code] ([Id])
GO
ALTER TABLE [System].[Code] CHECK CONSTRAINT [FkCodeParent]
GO
ALTER TABLE [System].[Code]  WITH CHECK ADD  CONSTRAINT [FkCodeType] FOREIGN KEY([CodeType])
REFERENCES [System].[CodeType] ([Code])
GO
ALTER TABLE [System].[Code] CHECK CONSTRAINT [FkCodeType]
GO
USE [master]
GO
ALTER DATABASE [LaoShi] SET  READ_WRITE 
GO

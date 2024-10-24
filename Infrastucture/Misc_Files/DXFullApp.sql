USE [master]
GO
/****** Object:  Database [DXFullApp]    Script Date: 1/3/2024 11:27:35 PM ******/
CREATE DATABASE [DXFullApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DXFullApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DXFullApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DXFullApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DXFullApp_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DXFullApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DXFullApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DXFullApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DXFullApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DXFullApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DXFullApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DXFullApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [DXFullApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DXFullApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DXFullApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DXFullApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DXFullApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DXFullApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DXFullApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DXFullApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DXFullApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DXFullApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DXFullApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DXFullApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DXFullApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DXFullApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DXFullApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DXFullApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DXFullApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DXFullApp] SET RECOVERY FULL 
GO
ALTER DATABASE [DXFullApp] SET  MULTI_USER 
GO
ALTER DATABASE [DXFullApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DXFullApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DXFullApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DXFullApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DXFullApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DXFullApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DXFullApp', N'ON'
GO
ALTER DATABASE [DXFullApp] SET QUERY_STORE = OFF
GO
USE [DXFullApp]
GO
/****** Object:  Schema [app]    Script Date: 1/3/2024 11:27:35 PM ******/
CREATE SCHEMA [app]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 1/3/2024 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 1/3/2024 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 1/3/2024 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] NOT NULL,
	[AssignedTo] [varchar](50) NULL,
	[Company] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Name] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[StateId] [int] NULL,
	[ZipCode] [int] NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DXContact]    Script Date: 1/3/2024 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DXContact](
	[ID] [int] NOT NULL,
	[AssignedTo] [varchar](50) NULL,
	[Company] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Phone] [float] NULL,
	[Position] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_DXContact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opportunities]    Script Date: 1/3/2024 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opportunities](
	[Name] [varchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opportunity]    Script Date: 1/3/2024 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opportunity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Opportunity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priorities]    Script Date: 1/3/2024 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priorities](
	[Name] [varchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 1/3/2024 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [int] NOT NULL,
	[StateShort] [varchar](2) NOT NULL,
	[StateLong] [varchar](50) NOT NULL,
	[StateCoords] [varchar](50) NOT NULL,
	[flag48px] [varchar](10) NULL,
	[flag24px] [varchar](10) NULL,
	[ssmaTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 1/3/2024 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Name] [varchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 1/3/2024 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactId] [int] NOT NULL,
	[Text] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Priority] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 1/3/2024 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Name] [varchar](100) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activities] ON 

INSERT [dbo].[Activities] ([Id], [Name]) VALUES (1, N'Qualified')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (2, N'Task created')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (3, N'Incoming call logged')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (4, N'Outbound call logged')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (5, N'Message sent')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (6, N'Message received')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (7, N'Quote sent')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (8, N'Appointment logged')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (9, N'Opportunity closed')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (10, N'Payment received')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (11, N'Disqualified')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (12, N'Call planned')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (13, N'Email received')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (14, N'Order created')
INSERT [dbo].[Activities] ([Id], [Name]) VALUES (15, N'Shipped')
SET IDENTITY_INSERT [dbo].[Activities] OFF
GO
SET IDENTITY_INSERT [dbo].[Activity] ON 

INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (311, 1, N'Email received', CAST(N'2023-01-03T18:34:40.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (312, 1, N'Incoming call logged', CAST(N'2023-06-16T07:03:31.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (313, 1, N'Payment received', CAST(N'2023-02-16T17:30:54.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (314, 1, N'Disqualified', CAST(N'2023-01-26T14:41:07.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (315, 1, N'Outbound call logged', CAST(N'2023-07-10T10:59:50.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (316, 1, N'Opportunity closed', CAST(N'2023-10-11T16:58:34.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (317, 1, N'Qualified', CAST(N'2023-09-10T05:19:12.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (318, 2, N'Quote sent', CAST(N'2023-03-29T20:47:34.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (319, 2, N'Outbound call logged', CAST(N'2023-11-07T19:26:46.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (320, 2, N'Email received', CAST(N'2023-02-13T18:35:17.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (321, 2, N'Order created', CAST(N'2023-10-14T20:08:44.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (322, 2, N'Task created', CAST(N'2023-12-03T00:17:20.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (323, 2, N'Appointment logged', CAST(N'2023-02-14T18:45:48.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (324, 2, N'Incoming call logged', CAST(N'2023-10-22T16:15:36.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (325, 3, N'Shipped', CAST(N'2023-12-08T22:19:23.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (326, 3, N'Task created', CAST(N'2023-01-17T17:07:59.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (327, 3, N'Email received', CAST(N'2023-07-16T12:51:11.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (328, 3, N'Message sent', CAST(N'2023-07-25T20:13:11.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (329, 3, N'Payment received', CAST(N'2023-04-10T05:11:23.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (330, 3, N'Appointment logged', CAST(N'2023-11-09T22:12:55.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (331, 3, N'Incoming call logged', CAST(N'2023-07-02T03:40:54.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (332, 4, N'Appointment logged', CAST(N'2023-10-28T12:12:14.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (333, 4, N'Email received', CAST(N'2023-08-12T07:24:35.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (334, 4, N'Call planned', CAST(N'2023-01-18T12:51:18.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (335, 4, N'Opportunity closed', CAST(N'2023-01-09T19:00:34.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (336, 4, N'Task created', CAST(N'2023-08-03T14:59:32.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (337, 4, N'Shipped', CAST(N'2023-02-02T20:42:53.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (338, 4, N'Incoming call logged', CAST(N'2023-07-03T07:37:46.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (339, 5, N'Appointment logged', CAST(N'2023-09-11T16:59:04.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (340, 5, N'Call planned', CAST(N'2023-06-22T19:42:24.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (341, 5, N'Message received', CAST(N'2023-11-12T02:39:54.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (342, 5, N'Message sent', CAST(N'2023-06-07T15:08:52.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (343, 5, N'Outbound call logged', CAST(N'2023-02-13T19:55:47.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (344, 5, N'Qualified', CAST(N'2023-02-21T11:25:07.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (345, 5, N'Opportunity closed', CAST(N'2023-02-08T03:49:47.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (346, 6, N'Payment received', CAST(N'2023-03-12T04:39:04.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (347, 6, N'Order created', CAST(N'2023-11-24T21:52:18.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (348, 6, N'Email received', CAST(N'2023-11-23T00:34:42.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (349, 6, N'Disqualified', CAST(N'2023-02-15T08:05:43.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (350, 6, N'Incoming call logged', CAST(N'2023-02-18T22:44:30.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (351, 6, N'Outbound call logged', CAST(N'2023-06-12T14:28:25.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (352, 6, N'Opportunity closed', CAST(N'2023-08-27T00:11:23.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (353, 7, N'Opportunity closed', CAST(N'2023-12-29T09:27:51.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (354, 7, N'Shipped', CAST(N'2023-05-30T03:10:08.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (355, 7, N'Quote sent', CAST(N'2023-02-17T14:46:08.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (356, 7, N'Outbound call logged', CAST(N'2023-09-19T08:25:58.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (357, 7, N'Appointment logged', CAST(N'2023-10-22T20:18:21.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (358, 7, N'Message received', CAST(N'2023-04-07T00:35:07.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (359, 7, N'Order created', CAST(N'2023-04-08T05:04:04.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (360, 8, N'Quote sent', CAST(N'2023-08-18T14:56:08.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (361, 8, N'Task created', CAST(N'2023-04-04T01:32:57.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (362, 8, N'Call planned', CAST(N'2023-05-17T14:17:55.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (363, 8, N'Qualified', CAST(N'2023-01-22T23:41:16.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (364, 8, N'Email received', CAST(N'2023-11-27T09:54:33.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (365, 8, N'Appointment logged', CAST(N'2023-02-16T12:20:59.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (366, 8, N'Opportunity closed', CAST(N'2023-06-13T07:56:05.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (367, 9, N'Email received', CAST(N'2023-06-27T11:26:29.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (368, 9, N'Outbound call logged', CAST(N'2023-10-22T21:11:42.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (369, 9, N'Task created', CAST(N'2023-09-23T05:44:10.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (370, 9, N'Order created', CAST(N'2023-01-17T06:21:43.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (371, 9, N'Appointment logged', CAST(N'2023-09-11T13:48:16.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (372, 9, N'Quote sent', CAST(N'2023-05-31T08:39:03.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (373, 9, N'Incoming call logged', CAST(N'2023-04-10T22:34:40.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (374, 10, N'Order created', CAST(N'2023-05-28T01:54:10.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (375, 10, N'Quote sent', CAST(N'2023-04-12T03:29:45.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (376, 10, N'Message received', CAST(N'2023-05-25T21:31:54.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (377, 10, N'Outbound call logged', CAST(N'2023-09-18T12:54:28.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (378, 10, N'Email received', CAST(N'2023-06-30T17:44:55.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (379, 10, N'Shipped', CAST(N'2023-12-20T18:27:46.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (380, 10, N'Message sent', CAST(N'2023-09-16T19:19:59.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (381, 11, N'Disqualified', CAST(N'2023-10-22T11:26:12.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (382, 11, N'Opportunity closed', CAST(N'2023-04-27T13:30:08.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (383, 11, N'Incoming call logged', CAST(N'2023-10-02T16:12:29.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (384, 11, N'Appointment logged', CAST(N'2023-05-28T17:39:53.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (385, 11, N'Call planned', CAST(N'2023-08-01T13:16:11.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (386, 11, N'Quote sent', CAST(N'2023-02-16T03:22:14.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (387, 11, N'Task created', CAST(N'2023-07-28T08:30:55.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (388, 12, N'Call planned', CAST(N'2023-09-21T19:20:04.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (389, 12, N'Disqualified', CAST(N'2023-07-22T21:09:26.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (390, 12, N'Qualified', CAST(N'2023-12-14T20:45:15.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (391, 12, N'Task created', CAST(N'2023-09-13T09:15:25.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (392, 12, N'Message received', CAST(N'2023-09-20T21:32:11.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (393, 12, N'Email received', CAST(N'2023-02-27T04:02:41.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (394, 12, N'Shipped', CAST(N'2023-03-24T07:48:23.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (395, 13, N'Email received', CAST(N'2023-06-27T10:05:36.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (396, 13, N'Qualified', CAST(N'2023-01-17T07:41:08.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (397, 13, N'Message sent', CAST(N'2023-10-05T06:07:00.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (398, 13, N'Appointment logged', CAST(N'2023-06-22T20:33:08.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (399, 13, N'Payment received', CAST(N'2023-01-28T11:50:46.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (400, 13, N'Opportunity closed', CAST(N'2023-01-26T20:50:25.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (401, 13, N'Quote sent', CAST(N'2023-01-18T15:41:24.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (402, 14, N'Task created', CAST(N'2023-06-04T02:44:36.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (403, 14, N'Message received', CAST(N'2023-03-12T05:41:22.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (404, 14, N'Order created', CAST(N'2023-02-10T16:18:31.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (405, 14, N'Message sent', CAST(N'2023-06-10T18:24:41.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (406, 14, N'Outbound call logged', CAST(N'2023-03-11T02:22:53.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (407, 14, N'Disqualified', CAST(N'2023-05-17T09:41:24.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (408, 14, N'Call planned', CAST(N'2023-11-09T22:43:49.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (409, 15, N'Quote sent', CAST(N'2023-12-20T10:55:16.000' AS DateTime))
GO
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (410, 15, N'Incoming call logged', CAST(N'2023-07-25T12:04:42.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (411, 15, N'Shipped', CAST(N'2023-05-12T17:34:55.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (412, 15, N'Order created', CAST(N'2023-07-08T09:44:39.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (413, 15, N'Disqualified', CAST(N'2023-08-31T17:49:30.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (414, 15, N'Message received', CAST(N'2023-05-17T23:40:48.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (415, 15, N'Task created', CAST(N'2023-03-23T14:13:53.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (416, 16, N'Order created', CAST(N'2023-08-21T22:30:00.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (417, 16, N'Message sent', CAST(N'2023-08-29T05:03:31.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (418, 16, N'Payment received', CAST(N'2023-01-17T14:18:28.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (419, 16, N'Call planned', CAST(N'2023-11-14T01:59:29.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (420, 16, N'Appointment logged', CAST(N'2023-12-08T01:21:39.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (421, 16, N'Email received', CAST(N'2023-01-23T01:25:28.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (422, 16, N'Opportunity closed', CAST(N'2023-04-21T04:55:16.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (423, 17, N'Disqualified', CAST(N'2023-10-23T14:06:37.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (424, 17, N'Payment received', CAST(N'2023-09-02T14:17:07.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (425, 17, N'Call planned', CAST(N'2023-03-14T15:07:07.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (426, 17, N'Qualified', CAST(N'2023-06-17T00:23:35.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (427, 17, N'Message received', CAST(N'2023-11-25T06:37:47.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (428, 17, N'Email received', CAST(N'2023-11-13T09:49:56.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (429, 17, N'Opportunity closed', CAST(N'2023-02-19T04:06:34.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (430, 18, N'Payment received', CAST(N'2023-10-21T07:37:54.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (431, 18, N'Incoming call logged', CAST(N'2023-07-28T01:59:33.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (432, 18, N'Opportunity closed', CAST(N'2023-12-31T06:04:39.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (433, 18, N'Task created', CAST(N'2023-03-12T02:19:35.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (434, 18, N'Message sent', CAST(N'2023-04-11T02:20:34.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (435, 18, N'Qualified', CAST(N'2023-12-02T23:49:17.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (436, 18, N'Call planned', CAST(N'2023-12-11T11:12:39.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (437, 19, N'Payment received', CAST(N'2023-03-09T00:35:10.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (438, 19, N'Shipped', CAST(N'2023-02-02T13:02:09.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (439, 19, N'Opportunity closed', CAST(N'2023-05-15T07:54:27.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (440, 19, N'Message received', CAST(N'2023-11-12T08:11:58.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (441, 19, N'Call planned', CAST(N'2023-01-22T09:50:58.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (442, 19, N'Email received', CAST(N'2023-07-07T04:43:16.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (443, 19, N'Qualified', CAST(N'2023-05-19T20:47:49.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (444, 20, N'Task created', CAST(N'2023-07-18T10:48:22.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (445, 20, N'Message sent', CAST(N'2023-02-26T11:39:04.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (446, 20, N'Call planned', CAST(N'2023-10-27T00:25:24.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (447, 20, N'Email received', CAST(N'2023-01-06T13:51:06.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (448, 20, N'Qualified', CAST(N'2023-04-22T05:33:01.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (449, 20, N'Incoming call logged', CAST(N'2023-01-17T22:38:19.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (450, 20, N'Opportunity closed', CAST(N'2023-09-12T01:31:44.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (451, 21, N'Payment received', CAST(N'2023-09-25T14:35:00.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (452, 21, N'Appointment logged', CAST(N'2023-07-27T21:05:27.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (453, 21, N'Message sent', CAST(N'2023-12-25T02:45:01.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (454, 21, N'Outbound call logged', CAST(N'2023-11-27T08:30:24.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (455, 21, N'Disqualified', CAST(N'2023-12-07T04:34:38.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (456, 21, N'Qualified', CAST(N'2023-11-17T13:31:47.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (457, 21, N'Order created', CAST(N'2023-07-25T01:57:24.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (458, 22, N'Payment received', CAST(N'2023-04-05T15:43:58.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (459, 22, N'Incoming call logged', CAST(N'2023-08-27T18:27:55.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (460, 22, N'Shipped', CAST(N'2023-12-19T03:20:15.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (461, 22, N'Qualified', CAST(N'2023-05-02T01:23:33.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (462, 22, N'Task created', CAST(N'2023-01-19T22:02:56.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (463, 22, N'Outbound call logged', CAST(N'2023-07-03T07:13:28.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (464, 22, N'Disqualified', CAST(N'2023-02-28T00:33:20.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (465, 23, N'Quote sent', CAST(N'2023-04-09T09:30:46.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (466, 23, N'Payment received', CAST(N'2023-06-02T11:54:20.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (467, 23, N'Opportunity closed', CAST(N'2023-01-28T20:33:06.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (468, 23, N'Call planned', CAST(N'2023-12-05T02:32:00.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (469, 23, N'Outbound call logged', CAST(N'2023-11-05T17:17:21.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (470, 23, N'Order created', CAST(N'2023-11-03T17:46:36.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (471, 23, N'Message received', CAST(N'2023-10-29T05:25:16.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (472, 24, N'Order created', CAST(N'2023-09-22T03:58:43.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (473, 24, N'Quote sent', CAST(N'2023-05-20T04:42:02.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (474, 24, N'Payment received', CAST(N'2023-02-21T19:51:23.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (475, 24, N'Incoming call logged', CAST(N'2023-10-06T16:49:29.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (476, 24, N'Opportunity closed', CAST(N'2023-03-30T14:56:15.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (477, 24, N'Outbound call logged', CAST(N'2023-05-02T02:55:15.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (478, 24, N'Task created', CAST(N'2023-08-12T15:20:35.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (479, 25, N'Order created', CAST(N'2023-11-07T12:18:08.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (480, 25, N'Shipped', CAST(N'2023-01-02T20:21:07.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (481, 25, N'Message received', CAST(N'2023-08-13T13:19:20.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (482, 25, N'Message sent', CAST(N'2023-06-08T11:42:37.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (483, 25, N'Task created', CAST(N'2023-07-20T22:50:46.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (484, 25, N'Quote sent', CAST(N'2023-03-29T10:18:54.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (485, 25, N'Email received', CAST(N'2023-10-15T04:09:01.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (486, 26, N'Payment received', CAST(N'2023-08-19T10:26:50.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (487, 26, N'Task created', CAST(N'2023-10-08T13:17:41.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (488, 26, N'Opportunity closed', CAST(N'2023-01-16T17:04:08.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (489, 26, N'Message received', CAST(N'2023-10-04T19:57:13.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (490, 26, N'Incoming call logged', CAST(N'2023-03-13T13:41:12.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (491, 26, N'Order created', CAST(N'2023-01-09T09:18:25.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (492, 26, N'Email received', CAST(N'2023-09-04T13:04:51.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (493, 27, N'Call planned', CAST(N'2023-07-31T22:10:03.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (494, 27, N'Email received', CAST(N'2023-08-08T12:14:29.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (495, 27, N'Message sent', CAST(N'2023-08-10T22:47:51.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (496, 27, N'Quote sent', CAST(N'2023-10-13T15:23:47.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (497, 27, N'Order created', CAST(N'2023-04-08T14:13:33.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (498, 27, N'Incoming call logged', CAST(N'2023-03-30T12:38:27.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (499, 27, N'Disqualified', CAST(N'2023-09-02T02:47:13.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (500, 28, N'Email received', CAST(N'2023-02-02T13:35:54.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (501, 28, N'Message received', CAST(N'2023-11-23T16:44:06.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (502, 28, N'Quote sent', CAST(N'2023-06-21T02:24:01.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (503, 28, N'Order created', CAST(N'2023-10-21T03:37:49.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (504, 28, N'Message sent', CAST(N'2023-12-05T07:03:14.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (505, 28, N'Task created', CAST(N'2023-11-17T09:43:23.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (506, 28, N'Opportunity closed', CAST(N'2023-09-05T02:37:09.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (507, 29, N'Call planned', CAST(N'2023-11-21T15:53:58.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (508, 29, N'Incoming call logged', CAST(N'2023-12-07T08:34:27.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (509, 29, N'Message received', CAST(N'2023-07-19T12:19:48.000' AS DateTime))
GO
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (510, 29, N'Message sent', CAST(N'2023-11-21T07:40:54.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (511, 29, N'Payment received', CAST(N'2023-10-18T20:38:49.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (512, 29, N'Opportunity closed', CAST(N'2023-05-09T09:04:02.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (513, 29, N'Disqualified', CAST(N'2023-06-15T16:07:14.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (514, 30, N'Outbound call logged', CAST(N'2023-01-02T07:22:54.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (515, 30, N'Opportunity closed', CAST(N'2023-09-16T15:43:49.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (516, 30, N'Payment received', CAST(N'2023-10-03T08:54:51.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (517, 30, N'Shipped', CAST(N'2023-10-04T01:07:52.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (518, 30, N'Appointment logged', CAST(N'2023-07-03T11:25:41.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (519, 30, N'Quote sent', CAST(N'2023-04-11T10:43:01.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (520, 30, N'Qualified', CAST(N'2023-11-24T14:53:29.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (521, 31, N'Outbound call logged', CAST(N'2023-11-15T06:10:02.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (522, 31, N'Order created', CAST(N'2023-01-17T01:36:19.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (523, 31, N'Payment received', CAST(N'2023-04-27T05:10:01.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (524, 31, N'Opportunity closed', CAST(N'2023-12-08T04:34:32.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (525, 31, N'Task created', CAST(N'2023-09-17T05:31:20.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (526, 31, N'Qualified', CAST(N'2023-12-28T17:23:14.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (527, 31, N'Disqualified', CAST(N'2023-03-15T05:25:14.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (528, 32, N'Incoming call logged', CAST(N'2023-04-11T04:12:51.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (529, 32, N'Qualified', CAST(N'2023-11-26T05:34:51.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (530, 32, N'Shipped', CAST(N'2023-12-23T12:17:33.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (531, 32, N'Order created', CAST(N'2023-03-15T13:00:11.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (532, 32, N'Message sent', CAST(N'2023-04-27T17:20:05.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (533, 32, N'Payment received', CAST(N'2023-02-21T13:02:13.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (534, 32, N'Disqualified', CAST(N'2023-03-03T05:12:59.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (535, 33, N'Appointment logged', CAST(N'2023-06-05T20:02:50.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (536, 33, N'Disqualified', CAST(N'2023-06-25T14:37:20.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (537, 33, N'Incoming call logged', CAST(N'2023-10-29T05:01:07.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (538, 33, N'Order created', CAST(N'2023-08-19T16:01:03.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (539, 33, N'Email received', CAST(N'2023-07-27T08:01:17.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (540, 33, N'Opportunity closed', CAST(N'2023-10-15T06:51:35.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (541, 33, N'Task created', CAST(N'2023-02-02T10:23:12.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (542, 34, N'Task created', CAST(N'2023-12-22T22:25:09.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (543, 34, N'Qualified', CAST(N'2023-02-28T11:26:24.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (544, 34, N'Outbound call logged', CAST(N'2023-11-09T14:05:45.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (545, 34, N'Payment received', CAST(N'2023-12-29T22:49:10.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (546, 34, N'Shipped', CAST(N'2023-12-28T22:38:57.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (547, 34, N'Order created', CAST(N'2023-08-05T14:09:24.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (548, 34, N'Opportunity closed', CAST(N'2023-08-14T18:10:17.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (549, 35, N'Disqualified', CAST(N'2023-10-26T02:35:39.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (550, 35, N'Appointment logged', CAST(N'2023-11-05T09:25:41.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (551, 35, N'Call planned', CAST(N'2023-01-18T18:56:21.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (552, 35, N'Message received', CAST(N'2023-06-22T15:08:41.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (553, 35, N'Message sent', CAST(N'2023-09-27T09:29:29.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (554, 35, N'Qualified', CAST(N'2023-08-30T03:15:15.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (555, 35, N'Shipped', CAST(N'2023-10-23T22:24:45.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (556, 36, N'Opportunity closed', CAST(N'2023-05-26T23:26:21.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (557, 36, N'Outbound call logged', CAST(N'2023-03-30T07:15:19.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (558, 36, N'Appointment logged', CAST(N'2023-01-11T04:29:02.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (559, 36, N'Task created', CAST(N'2023-02-14T05:48:43.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (560, 36, N'Order created', CAST(N'2023-03-31T13:23:59.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (561, 36, N'Quote sent', CAST(N'2023-04-12T06:47:27.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (562, 36, N'Message sent', CAST(N'2023-06-18T05:42:51.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (563, 37, N'Appointment logged', CAST(N'2023-08-26T00:47:30.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (564, 37, N'Message sent', CAST(N'2023-09-09T16:42:57.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (565, 37, N'Task created', CAST(N'2023-04-05T00:06:08.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (566, 37, N'Email received', CAST(N'2023-03-13T23:07:35.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (567, 37, N'Payment received', CAST(N'2023-05-29T11:03:50.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (568, 37, N'Call planned', CAST(N'2023-04-25T23:10:46.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (569, 37, N'Shipped', CAST(N'2023-10-26T00:31:49.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (570, 38, N'Quote sent', CAST(N'2023-06-16T02:27:06.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (571, 38, N'Shipped', CAST(N'2023-01-28T18:21:28.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (572, 38, N'Message sent', CAST(N'2023-11-17T11:45:53.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (573, 38, N'Payment received', CAST(N'2023-08-06T07:24:29.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (574, 38, N'Incoming call logged', CAST(N'2023-09-15T06:03:17.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (575, 38, N'Disqualified', CAST(N'2023-09-02T14:50:38.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (576, 38, N'Email received', CAST(N'2023-05-19T12:00:08.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (577, 39, N'Email received', CAST(N'2023-08-26T09:00:31.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (578, 39, N'Shipped', CAST(N'2023-02-12T00:29:43.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (579, 39, N'Quote sent', CAST(N'2023-09-25T00:14:35.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (580, 39, N'Disqualified', CAST(N'2023-11-19T00:33:27.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (581, 39, N'Outbound call logged', CAST(N'2023-12-21T17:15:32.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (582, 39, N'Message sent', CAST(N'2023-01-02T04:39:17.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (583, 39, N'Message received', CAST(N'2023-12-16T04:37:19.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (584, 40, N'Message sent', CAST(N'2023-04-15T03:10:46.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (585, 40, N'Email received', CAST(N'2023-07-18T02:17:26.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (586, 40, N'Message received', CAST(N'2023-07-23T15:26:22.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (587, 40, N'Task created', CAST(N'2023-07-15T14:42:12.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (588, 40, N'Call planned', CAST(N'2023-11-07T07:44:47.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (589, 40, N'Appointment logged', CAST(N'2023-10-16T11:09:32.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (590, 40, N'Opportunity closed', CAST(N'2023-05-17T20:39:19.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (591, 41, N'Disqualified', CAST(N'2023-12-29T08:31:44.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (592, 41, N'Email received', CAST(N'2023-06-22T06:21:50.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (593, 41, N'Message sent', CAST(N'2023-12-11T08:24:06.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (594, 41, N'Payment received', CAST(N'2023-05-13T00:36:18.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (595, 41, N'Shipped', CAST(N'2023-08-11T01:06:32.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (596, 41, N'Task created', CAST(N'2023-10-30T14:00:28.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (597, 41, N'Opportunity closed', CAST(N'2023-10-01T11:35:10.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (598, 42, N'Message received', CAST(N'2023-02-10T08:40:47.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (599, 42, N'Email received', CAST(N'2023-04-15T04:10:21.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (600, 42, N'Task created', CAST(N'2023-11-05T22:59:18.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (601, 42, N'Appointment logged', CAST(N'2023-07-07T20:48:48.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (602, 42, N'Disqualified', CAST(N'2023-02-18T17:53:47.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (603, 42, N'Call planned', CAST(N'2023-07-11T12:48:00.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (604, 42, N'Order created', CAST(N'2023-08-24T03:34:17.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (605, 43, N'Email received', CAST(N'2023-06-18T21:13:51.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (606, 43, N'Quote sent', CAST(N'2023-07-04T00:16:44.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (607, 43, N'Order created', CAST(N'2023-11-14T15:20:50.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (608, 43, N'Shipped', CAST(N'2023-09-02T06:58:25.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (609, 43, N'Call planned', CAST(N'2023-12-16T13:51:14.000' AS DateTime))
GO
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (610, 43, N'Appointment logged', CAST(N'2023-04-09T09:16:54.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (611, 43, N'Outbound call logged', CAST(N'2023-07-10T15:32:00.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (612, 44, N'Quote sent', CAST(N'2023-07-04T12:12:08.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (613, 44, N'Call planned', CAST(N'2023-09-07T11:50:17.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (614, 44, N'Payment received', CAST(N'2023-12-25T08:42:55.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (615, 44, N'Appointment logged', CAST(N'2023-09-02T01:01:26.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (616, 44, N'Opportunity closed', CAST(N'2023-09-10T22:54:55.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (617, 44, N'Message received', CAST(N'2023-11-20T00:11:43.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (618, 44, N'Qualified', CAST(N'2023-01-13T11:52:57.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (619, 45, N'Email received', CAST(N'2023-05-12T06:07:11.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (620, 45, N'Opportunity closed', CAST(N'2023-02-02T05:00:53.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (621, 45, N'Payment received', CAST(N'2023-09-23T00:31:01.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (622, 45, N'Outbound call logged', CAST(N'2023-05-08T22:33:20.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (623, 45, N'Qualified', CAST(N'2023-03-19T22:58:28.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (624, 45, N'Incoming call logged', CAST(N'2023-10-11T21:04:34.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (625, 45, N'Shipped', CAST(N'2023-09-30T02:24:52.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (626, 46, N'Call planned', CAST(N'2023-11-10T21:41:05.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (627, 46, N'Quote sent', CAST(N'2023-07-04T11:06:40.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (628, 46, N'Payment received', CAST(N'2023-02-24T16:43:26.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (629, 46, N'Shipped', CAST(N'2023-01-30T07:08:10.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (630, 46, N'Message sent', CAST(N'2023-02-12T01:24:58.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (631, 46, N'Message received', CAST(N'2023-12-04T11:42:40.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (632, 46, N'Order created', CAST(N'2023-10-30T16:25:17.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (633, 47, N'Outbound call logged', CAST(N'2023-11-07T15:04:09.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (634, 47, N'Qualified', CAST(N'2023-02-06T23:17:57.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (635, 47, N'Message sent', CAST(N'2023-05-24T05:37:58.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (636, 47, N'Quote sent', CAST(N'2023-06-11T04:20:42.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (637, 47, N'Opportunity closed', CAST(N'2023-10-12T08:48:26.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (638, 47, N'Call planned', CAST(N'2023-12-27T09:39:47.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (639, 47, N'Payment received', CAST(N'2023-07-20T11:23:56.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (640, 48, N'Appointment logged', CAST(N'2023-10-05T11:56:03.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (641, 48, N'Order created', CAST(N'2023-09-19T15:16:12.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (642, 48, N'Shipped', CAST(N'2023-07-13T14:23:11.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (643, 48, N'Task created', CAST(N'2023-10-13T02:52:13.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (644, 48, N'Payment received', CAST(N'2023-05-16T04:47:33.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (645, 48, N'Call planned', CAST(N'2023-11-03T21:30:05.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (646, 48, N'Message sent', CAST(N'2023-08-22T10:34:00.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (647, 49, N'Call planned', CAST(N'2023-03-30T13:56:24.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (648, 49, N'Email received', CAST(N'2023-03-05T15:11:00.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (649, 49, N'Disqualified', CAST(N'2023-08-14T22:07:52.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (650, 49, N'Qualified', CAST(N'2023-04-17T10:47:12.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (651, 49, N'Message sent', CAST(N'2023-02-07T06:02:19.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (652, 49, N'Shipped', CAST(N'2023-11-25T19:40:20.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (653, 49, N'Task created', CAST(N'2023-11-24T21:04:57.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (654, 50, N'Task created', CAST(N'2023-06-28T13:00:16.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (655, 50, N'Appointment logged', CAST(N'2023-08-15T18:25:20.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (656, 50, N'Email received', CAST(N'2023-10-05T14:32:13.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (657, 50, N'Message sent', CAST(N'2023-02-21T10:40:41.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (658, 50, N'Incoming call logged', CAST(N'2023-05-06T15:21:21.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (659, 50, N'Outbound call logged', CAST(N'2023-09-24T01:22:57.000' AS DateTime))
INSERT [dbo].[Activity] ([Id], [ContactId], [Name], [Date]) VALUES (660, 50, N'Order created', CAST(N'2023-08-04T16:39:06.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Activity] OFF
GO
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (1, N'Claire Bell', N'Widget Technologies', N'bsmith@example.com', N'Brock', N'Smith', N'Brock Smith', N'818555238', N'Marketing Manager', N'Salaried', N'1.jpg', N'1 Century Park E', N'San Diego', 5, 92110)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (2, N'Michael Green', N'Pine Construction', N'tlowe@example.com', N'Tina', N'Lowe', N'Tina Lowe', N'818555654', N'Project Manager', N'Salaried', N'2.jpg', N'62 Monroe St', N'Thousand Palms', 5, 92276)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (3, N'Sophia Wilson', N'United Insurance', N'blee@example.com', N'Brian', N'Lee', N'Brian Lee', N'626555035', N'CTO', N'Salaried', N'3.jpg', N'3196 S Rider Trl', N'Stockton', 5, 95207)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (4, N'David Kim', N'Summit Technologies', N'asanchez@example.com', N'Ashley', N'Sanchez', N'Ashley Sanchez', N'562555208', N'CMO', N'Salaried', N'4.jpg', N'72119 S Walker Ave #63', N'Anaheim', 5, 92801)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (5, N'Jennifer White', N'Global Logistics Inc', N'mroberts@example.com', N'Michael', N'Roberts', N'Michael Roberts', N'310555128', N'HR Manager', N'Salaried', N'5.jpg', N'87 Sierra Rd', N'El Monte', 5, 91731)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (6, N'Amanda Johnson', N'Acme Financial', N'dcox@example.com', N'David', N'Cox', N'David Cox', N'310555335', N'IT Manager', N'Salaried', N'6.jpg', N'22 Spruce St #595', N'Gardena', 5, 90248)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (7, N'Robert Thompson', N'Edge Technologies', N'sryan@example.com', N'Stacy', N'Ryan', N'Stacy Ryan', N'213555284', N'Controller', N'Salaried', N'7.jpg', N'701 S Harrison Rd', N'San Francisco', 5, 94104)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (8, N'James Anderson', N'Southside Auto Repair', N'tedwards@example.com', N'Thomas', N'Edwards', N'Thomas Edwards', N'818555665', N'Sales Manager', N'Salaried', N'8.jpg', N'985 E 6th Ave', N'Santa Rosa', 5, 95407)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (9, N'Jessica Moore', N'City Hospital', N'slee@example.com', N'Sarah', N'Lee', N'Sarah Lee', N'626555729', N'Support Manager', N'Salaried', N'9.jpg', N'2140 Diamond Blvd', N'Rohnert Park', 5, 94928)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (10, N'William Davis', N'Global Advertising Inc', N'mtaylor@example.com', N'Mark', N'Taylor', N'Mark Taylor', N'626555028', N'Shipping Manager', N'Salaried', N'10.jpg', N'82 N Highway 67', N'Oakley', 5, 94561)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (11, N'Patricia Miller', N'Acme Law Firm', N'mjohnson@example.com', N'Michael', N'Johnson', N'Michael Johnson', N'213555927', N'HR Assistant', N'Salaried', N'11.jpg', N'4800 Black Horse Pike', N'Burlingame', 5, 94010)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (12, N'Charles Wilson', N'City Power', N'lscott@example.com', N'Laura', N'Scott', N'Laura Scott', N'818555785', N'Sales Assistant', N'Salaried', N'12.jpg', N'52777 Leaders Heights Rd', N'Ontario', 5, 91761)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (13, N'Lisa Garcia', N'Southside Hospital', N'klee@example.com', N'Kevin', N'Lee', N'Kevin Lee', N'818555094', N'Shipping Assistant', N'Salaried', N'13.jpg', N'17 Morena Blvd', N'Camarillo', 5, 93012)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (14, N'Nancy Rodriguez', N'Global Software Inc', N'cjenkins@example.com', N'Christopher', N'Jenkins', N'Christopher Jenkins', N'818555924', N'Shipping Assistant', N'Salaried', N'14.jpg', N'20932 Hedley St', N'Concord', 5, 94520)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (15, N'Karen Martinez', N'Acme Financial', N'bharris@example.com', N'Brenda', N'Harris', N'Brenda Harris', N'323555470', N'Shipping Assistant', N'Salaried', N'15.jpg', N'524 Louisiana Ave Nw', N'San Leandro', 5, 94577)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (16, N'Edward Hernandez', N'United Logistics', N'kphillips@example.com', N'Kimberly', N'Phillips', N'Kimberly Phillips', N'310555662', N'Shipping Assistant', N'Salaried', N'16.jpg', N'13252 Lighthouse Ave', N'Cathedral City', 5, 92234)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (17, N'Daniel Lewis', N'Edge Robotics', N'bcampbell@example.com', N'Brandon', N'Campbell', N'Brandon Campbell', N'310555272', N'Support Assistant', N'Salaried', N'17.jpg', N'3989 Portage Tr', N'Escondido', 5, 92025)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (18, N'Cheryl Perez', N'Summit Healthcare', N'kcook@example.com', N'Keith', N'Cook', N'Keith Cook', N'310555727', N'Support Assistant', N'Salaried', N'18.jpg', N'251 Park Ave #979', N'Saratoga', 5, 95070)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (19, N'Julie Walker', N'Central Hospital', N'jwright@example.com', N'Jennifer', N'Wright', N'Jennifer Wright', N'213555427', N'Support Assistant', N'Salaried', N'19.jpg', N'87895 Concord Rd', N'La Mesa', 5, 91942)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (20, N'Stephen Gonzales', N'National Bank', N'jevans@example.com', N'Jacqueline', N'Evans', N'Jacqueline Evans', N'818555887', N'Sales Assistant', N'Salaried', N'20.jpg', N'598 43rd St', N'Beverly Hills', 5, 90210)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (21, N'Debra Baker', N'Central Hospital', N'awilliams@example.com', N'Adam', N'Williams', N'Adam Williams', N'818555464', N'Network Admin', N'Salaried', N'21.jpg', N'39 Moccasin Dr', N'San Francisco', 5, 94104)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (22, N'Roy Phillips', N'Acme Auto Manufacturing', N'jhall@example.com', N'James', N'Hall', N'James Hall', N'626555090', N'Network Admin', N'Salaried', N'22.jpg', N'7 W Jackson Blvd', N'San Jose', 5, 95111)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (23, N'Richard Rivera', N'Global Software Inc', N'myoung@example.com', N'Mark', N'Young', N'Mark Young', N'213555709', N'Programmer', N'Salaried', N'23.jpg', N'4 S Washington Ave', N'San Bernardino', 5, 92410)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (24, N'Albert Kelly', N'United Bank', N'cking@example.com', N'Christina', N'King', N'Christina King', N'818555052', N'Programmer', N'Salaried', N'24.jpg', N'5 Tomahawk Dr', N'Los Angeles', 5, 90006)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (25, N'Roger Cooper', N'Central Advertising', N'ehoward@example.com', N'Erica', N'Howard', N'Erica Howard', N'818555823', N'Programmer', N'Salaried', N'25.jpg', N'11360 S Halsted St', N'Santa Ana', 5, 92705)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (26, N'Katherine Howard', N'Acme Technologies', N'pthomas@example.com', N'Paul', N'Thomas', N'Paul Thomas', N'818555247', N'Travel Coordinator', N'Salaried', N'26.jpg', N'3882 W Congress St #799', N'Los Angeles', 5, 90016)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (27, N'Victor Ward', N'Summit Robotics', N'rlewis@example.com', N'Rachel', N'Lewis', N'Rachel Lewis', N'562555928', N'Benefits Coordinator', N'Salaried', N'27.jpg', N'72868 Blackington Ave', N'Oakland', 5, 94606)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (28, N'Susan Washington', N'National Hospital', N'tbryant@example.com', N'Tracy', N'Bryant', N'Tracy Bryant', N'562555837', N'Graphic Designer', N'Salaried', N'28.jpg', N'577 Parade St', N'South San Francisco', 5, 94080)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (29, N'Randy Torres', N'Central Hospital', N'mhoward@example.com', N'Michael', N'Howard', N'Michael Howard', N'714555200', N'Jr Graphic Designer', N'Salaried', N'29.jpg', N'326 E Main St #6496', N'Thousand Oaks', 5, 91362)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (30, N'Philip Cox', N'Global Advertising Inc', N'tmurphy@example.com', N'Tina', N'Murphy', N'Tina Murphy', N'562559583', N'Ombudsman', N'Salaried', N'30.jpg', N'60 Fillmore Ave', N'Huntington Beach', 5, 92647)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (31, N'Samuel Mitchell', N'Southside Technologies', N'bbell@example.com', N'Brandon', N'Bell', N'Brandon Bell', N'714555888', N'Trainer', N'Salaried', N'31.jpg', N'395 S 6th St #2', N'El Cajon', 5, 92020)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (32, N'Denise Coleman', N'Edge Robotics', N'swalker@example.com', N'Stanley', N'Walker', N'Stanley Walker', N'909555693', N'Director of Engineering', N'Salaried', N'32.jpg', N'2887 Knowlton St #5435', N'Berkeley', 5, 94710)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (33, N'Janet Reyes', N'Acme Financial', N'dwilliams@example.com', N'Donna', N'Williams', N'Donna Williams', N'323555451', N'Test Coordinator', N'Salaried', N'33.jpg', N'105 Richmond Valley Rd', N'Escondido', 5, 92025)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (34, N'Joe Evans', N'Central Power', N'wwatson@example.com', N'Wendy', N'Watson', N'Wendy Watson', N'714555723', N'Engineer', N'Salaried', N'34.jpg', N'195 13n N', N'Santa Clara', 5, 95054)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (35, N'Aaron Washington', N'City Hospital', N'qnguyen@example.com', N'Ralph', N'Walker', N'Ralph Walker', N'805555278', N'Engineer', N'Salaried', N'35.jpg', N'99385 Charity St #840', N'San Jose', 5, 95110)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (36, N'Debra Moore', N'Summit Technologies', N'jprice@example.com', N'John', N'Price', N'John Price', N'310555539', N'Engineer', N'Salaried', N'36.jpg', N'1128 Delaware St', N'San Jose', 5, 95132)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (37, N'Amy Henderson', N'Global Software Inc', N'ewilliams@example.com', N'Eric', N'Williams', N'Eric Williams', N'310555335', N'Engineer', N'Salaried', N'37.jpg', N'48 Stratford Ave', N'Pomona', 5, 91768)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (38, N'Philip Scott', N'Central Hospital', N'ascott@example.com', N'Amanda', N'Scott', N'Amanda Scott', N'661555822', N'QA Engineer', N'Salaried', N'38.jpg', N'26659 N 13th St', N'Costa Mesa', 5, 92626)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (39, N'Rachel Martin', N'Summit Advertising', N'asimmons@example.com', N'Anthony', N'Simmons', N'Anthony Simmons', N'805555362', N'Retail Coordinator', N'Salaried', N'39.jpg', N'47939 Porter Ave', N'Gardena', 5, 90248)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (40, N'Irene Perry', N'Global Logistics Inc', N'bjames@example.com', N'Bryan', N'James', N'Bryan James', N'831555389', N'Sales Assistant', N'Salaried', N'40.jpg', N'2409 Alabama Rd', N'Riverside', 5, 92501)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (41, N'Ian Henderson', N'Acme Financial', N'panderson@example.com', N'Patricia', N'Anderson', N'Patricia Anderson', N'925555252', N'Retail Sales Manager', N'Commission', N'41.jpg', N'98 University Dr', N'San Ramon', 5, 94583)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (42, N'Edward Campbell', N'United Technologies', N'jwalker@example.com', N'Jacob', N'Walker', N'Jacob Walker', N'925555357', N'Online Sales Manager', N'Commission', N'42.jpg', N'5 Washington St #1', N'Roseville', 5, 95678)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (43, N'Ralph Lopez', N'Central Technologies', N'mgray@example.com', N'Michelle', N'Gray', N'Michelle Gray', N'213555182', N'Retail Sales Manager', N'Commission', N'43.jpg', N'68556 Central Hwy', N'San Leandro', 5, 94577)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (44, N'Joshua Brooks', N'Global Insurance Group', N'jmartin@example.com', N'John', N'Martin', N'John Martin', N'213555827', N'Retail Sales Manager', N'Commission', N'44.jpg', N'5 N Cleveland Massillon Rd', N'Thousand Oaks', 5, 91362)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (45, N'Keith Johnston', N'Central Advertising', N'rlee@example.com', N'Robert', N'Lee', N'Robert Lee', N'213555362', N'Retail Sales Manager', N'Commission', N'45.jpg', N'70 Mechanic St', N'Northridge', 5, 91325)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (46, N'Nancy Green', N'City Hospital', N'wmartinez@example.com', N'William', N'Martinez', N'William Martinez', N'310555266', N'Support Assistant', N'Salaried', N'46.jpg', N'18 Coronado Ave #563', N'Pasadena', 5, 91106)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (47, N'Deborah Ruiz', N'Global Technologies', N'sbrown@example.com', N'Samantha', N'Brown', N'Samantha Brown', N'213555835', N'Sales Assistant', N'Salaried', N'47.jpg', N'30 W 80th St #1995', N'San Carlos', 5, 94070)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (48, N'Kathleen Wood', N'Southside Auto Repair', N'jthomas@example.com', N'Jack', N'Thomas', N'Jack Thomas', N'213555255', N'Engineer', N'Terminated', N'48.jpg', N'94290 S Buchanan St', N'Pacifica', 5, 94044)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (49, N'Emily Barnes', N'City Power', N'thill@example.com', N'Trevor', N'Hill', N'Trevor Hill', N'', N'Shipping Assistant', N'Terminated', N'49.jpg', N'6916 W Main St', N'Sacramento', 5, 95827)
INSERT [dbo].[Contact] ([ID], [AssignedTo], [Company], [Email], [FirstName], [LastName], [Name], [Phone], [Position], [Status], [Image], [Address], [City], [StateId], [ZipCode]) VALUES (50, N'Wayne Hayes', N'Acme Manufacturing', N'rmiller@example.com', N'Ronald', N'Miller', N'Ronald Miller', N'', N'Shipping Assistant', N'Terminated', N'50.jpg', N'77 222 Dr', N'Oroville', 5, 95965)
GO
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (3, N'Samantha Bright', N'Super Mart of the West', N'arthurm@dx-email.com', N'Arthur Miller', 3105558583, N'CTO', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (4, N'John Heart', N'Electronics Depot', N'robertr@dx-email.com', N'Robert Reagan', 8185552387, N'CMO', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (5, N'Samantha Bright', N'K&S Music', N'gretas@dx-email.com', N'Greta Sims', 8185556546, N'HR Manager', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (6, N'John Heart', N'Tom''s Club', N'brettw@dx-email.com', N'Brett Wade', 6265550358, N'IT Manager', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (7, N'Samantha Bright', N'E-Mart', N'sandraj@dx-email.com', N'Sandra Johnson', 5625552082, N'Controller', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (8, N'John Heart', N'Walters', N'edwardh@dx-email.com', N'Ed Holmes', 3105551288, N'Sales Manager', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (9, N'Samantha Bright', N'StereoShack', N'barbarab@dx-email.com', N'Barb Banks', 3105553355, N'Support Manager', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (10, N'John Heart', N'Circuit Town', N'kevinc@dx-email.com', N'Kevin Carter', 2135552840, N'Shipping Manager', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (11, N'Samantha Bright', N'Premier Buy', N'cindys@dx-email.com', N'Cindy Stanwick', 8185556655, N'HR Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (12, N'John Heart', N'ElectrixMax', N'sammyh@dx-email.com', N'Sammy Hill', 6265557292, N'Sales Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (13, N'Samantha Bright', N'Video Emporium', N'davidj@dx-email.com', N'Davey Jones', 6265550281, N'Shipping Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (14, N'John Heart', N'Screen Shop', N'victorn@dx-email.com', N'Victor Norris', 2135559278, N'Shipping Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (15, N'Samantha Bright', N'Braeburn', N'marys@dx-email.com', N'Mary Stern', 8185557857, N'Shipping Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (16, N'John Heart', N'PriceCo', N'robinc@dx-email.com', N'Robin Cosworth', 8185550942, N'Shipping Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (17, N'Samantha Bright', N'Ultimate Gadget', N'kellyr@dx-email.com', N'Kelly Rodriguez', 8185559248, N'Support Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (18, N'John Heart', N'EZ Stop', N'jamesa@dx-email.com', N'James Anderson', 3235554702, N'Support Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (19, N'Samantha Bright', N'Clicker', N'anthonyr@dx-email.com', N'Antony Remmen', 3105556625, N'Support Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (20, N'John Heart', N'Store of America', N'oliviap@dx-email.com', N'Olivia Peyton', 3105552728, N'Sales Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (21, N'Samantha Bright', N'Zone Toys', N'taylorr@dx-email.com', N'Taylor Riley', 3105557276, N'Network Admin', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (22, N'John Heart', N'ACME', N'ameliah@dx-email.com', N'Amelia Harper', 2135554276, N'Network Admin', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (23, N'Samantha Bright', N'Super Mart of the West', N'wallyh@dx-email.com', N'Wally Hobbs', 8185558872, N'Programmer', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (24, N'John Heart', N'Electronics Depot', N'bradleyj@dx-email.com', N'Brad Jameson', 8185554646, N'Programmer', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (25, N'Samantha Bright', N'K&S Music', N'kareng@dx-email.com', N'Karen Goodson', 6265550908, N'Programmer', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (26, N'John Heart', N'Tom''s Club', N'marcuso@dx-email.com', N'Marcus Orbison', 2135557098, N'Travel Coordinator', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (27, N'Samantha Bright', N'E-Mart', N'sandrab@dx-email.com', N'Sandy Bright', 8185550524, N'Benefits Coordinator', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (28, N'John Heart', N'Walters', N'morgank@dx-email.com', N'Morgan Kennedy', 8185558238, N'Graphic Designer', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (29, N'Samantha Bright', N'StereoShack', N'violetb@dx-email.com', N'Violet Bailey', 8185552478, N'Jr Graphic Designer', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (30, N'John Heart', N'Circuit Town', N'kents@dx-email.com', N'Ken Samuelson', 5625559282, N'Ombudsman', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (31, N'Samantha Bright', N'Premier Buy', N'nataliem@dx-email.com', N'Nat Maguiree', 5625558377, N'Trainer', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (32, N'John Heart', N'ElectrixMax', N'barta@dx-email.com', N'Bart Arnaz', 7145552000, N'Director of Engineering', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (33, N'Samantha Bright', N'Video Emporium', N'leahs@dx-email.com', N'Leah Simpson', 5625595830, N'Test Coordinator', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (34, N'John Heart', N'Screen Shop', N'arnolds@dx-email.com', N'Arnie Schwartz', 7145558882, N'Engineer', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (35, N'Samantha Bright', N'Braeburn', N'williamz@dx-email.com', N'Billy Zimmer', 9095556939, N'Engineer', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (36, N'John Heart', N'PriceCo', N'samanthap@dx-email.com', N'Samantha Piper', 3235554512, N'Engineer', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (37, N'Samantha Bright', N'Ultimate Gadget', N'margaretb@dx-email.com', N'Maggie Boxter', 7145557239, N'Engineer', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (38, N'John Heart', N'EZ Stop', N'terryb@dx-email.com', N'Terry Bradley', 8055552788, N'QA Engineer', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (39, N'Samantha Bright', N'Clicker', N'gabrielj@dx-email.com', N'Gabe Jones', 3105555395, N'Retail Coordinator', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (40, N'John Heart', N'Store of America', N'lucyb@dx-email.com', N'Lucy Ball', 3105553357, N'Sales Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (41, N'Samantha Bright', N'Zone Toys', N'jamesp@dx-email.com', N'Jim Packard', 6615558224, N'Retail Sales Manager', N'Commission')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (42, N'John Heart', N'ACME', N'hannahb@dx-email.com', N'Hannah Brookly', 8055553627, N'Online Sales Manager', N'Commission')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (43, N'Samantha Bright', N'Super Mart of the West', N'harveym@dx-email.com', N'Harv Mudd', 8315553895, N'Retail Sales Manager', N'Commission')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (44, N'John Heart', N'Electronics Depot', N'clarkm@dx-email.com', N'Clark Morgan', 9255552525, N'Retail Sales Manager', N'Commission')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (45, N'Samantha Bright', N'K&S Music', N'toddh@dx-email.com', N'Todd Hoffman', 9255553579, N'Retail Sales Manager', N'Commission')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (46, N'John Heart', N'Tom''s Club', N'jackg@dx-email.com', N'Jackie Garmin', 2135551824, N'Support Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (47, N'Samantha Bright', N'E-Mart', N'lincolnb@dx-email.com', N'Lincoln Bartlett', 2135558272, N'Sales Assistant', N'Salaried')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (48, N'John Heart', N'Walters', N'bradf@dx-email.com', N'Brad Farkus', 2135553626, N'Engineer', N'Terminated')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (49, N'Samantha Bright', N'StereoShack', N'jennyh@dx-email.com', N'Jenny Hobbs', 3105552668, N'Shipping Assistant', N'Terminated')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (50, N'John Heart', N'Circuit Town', N'dallas@dx-email.com', N'Dallas Lou', 2135558357, N'Shipping Assistant', N'Terminated')
INSERT [dbo].[DXContact] ([ID], [AssignedTo], [Company], [Email], [Name], [Phone], [Position], [Status]) VALUES (51, N'Samantha Bright', N'Premier Buy', N'stu@dx-email.com', N'Stu Pizaro', 2135552552, N'Engineer', N'Terminated')
GO
SET IDENTITY_INSERT [dbo].[Opportunities] ON 

INSERT [dbo].[Opportunities] ([Name], [Id]) VALUES (N'Hospital Conference Room Set', 1)
INSERT [dbo].[Opportunities] ([Name], [Id]) VALUES (N'Audio/Video Upgrade', 2)
INSERT [dbo].[Opportunities] ([Name], [Id]) VALUES (N'School A/V Equipment', 3)
INSERT [dbo].[Opportunities] ([Name], [Id]) VALUES (N'POS Touch Screens', 4)
INSERT [dbo].[Opportunities] ([Name], [Id]) VALUES (N'Black Friday Offer', 5)
INSERT [dbo].[Opportunities] ([Name], [Id]) VALUES (N'First Sale Opportunity', 6)
INSERT [dbo].[Opportunities] ([Name], [Id]) VALUES (N'Incoming Request for Conference Room', 7)
INSERT [dbo].[Opportunities] ([Name], [Id]) VALUES (N'Summer Discount Offer', 8)
INSERT [dbo].[Opportunities] ([Name], [Id]) VALUES (N'Mini Cinema Equipment', 9)
SET IDENTITY_INSERT [dbo].[Opportunities] OFF
GO
SET IDENTITY_INSERT [dbo].[Opportunity] ON 

INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (351, 1, N'Hospital Conference Room Set', CAST(3465.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (352, 1, N'POS Touch Screens', CAST(938.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (353, 1, N'First Sale Opportunity', CAST(4385.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (354, 2, N'Mini Cinema Equipment', CAST(1809.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (355, 2, N'Audio/Video Upgrade', CAST(3382.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (356, 2, N'Black Friday Offer', CAST(4192.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (357, 3, N'Mini Cinema Equipment', CAST(2979.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (358, 3, N'Summer Discount Offer', CAST(2177.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (359, 3, N'First Sale Opportunity', CAST(3492.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (360, 4, N'School A/V Equipment', CAST(3548.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (361, 4, N'First Sale Opportunity', CAST(3469.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (362, 4, N'Black Friday Offer', CAST(3952.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (363, 5, N'Hospital Conference Room Set', CAST(1622.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (364, 5, N'School A/V Equipment', CAST(4952.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (365, 5, N'Summer Discount Offer', CAST(3252.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (366, 6, N'Hospital Conference Room Set', CAST(4408.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (367, 6, N'Summer Discount Offer', CAST(949.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (368, 6, N'First Sale Opportunity', CAST(1936.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (369, 7, N'Hospital Conference Room Set', CAST(3631.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (370, 7, N'Incoming Request for Conference Room', CAST(4009.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (371, 7, N'Black Friday Offer', CAST(4550.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (372, 8, N'Summer Discount Offer', CAST(3474.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (373, 8, N'Incoming Request for Conference Room', CAST(2357.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (374, 8, N'Mini Cinema Equipment', CAST(3312.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (375, 9, N'Hospital Conference Room Set', CAST(3291.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (376, 9, N'Audio/Video Upgrade', CAST(3925.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (377, 9, N'Mini Cinema Equipment', CAST(4484.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (378, 10, N'Hospital Conference Room Set', CAST(1628.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (379, 10, N'POS Touch Screens', CAST(2958.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (380, 10, N'Black Friday Offer', CAST(1227.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (381, 11, N'Black Friday Offer', CAST(3702.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (382, 11, N'POS Touch Screens', CAST(2942.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (383, 11, N'Mini Cinema Equipment', CAST(3040.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (384, 12, N'Summer Discount Offer', CAST(1481.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (385, 12, N'First Sale Opportunity', CAST(2681.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (386, 12, N'POS Touch Screens', CAST(2172.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (387, 13, N'POS Touch Screens', CAST(1631.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (388, 13, N'School A/V Equipment', CAST(4390.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (389, 13, N'Audio/Video Upgrade', CAST(4459.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (390, 14, N'Mini Cinema Equipment', CAST(2192.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (391, 14, N'Audio/Video Upgrade', CAST(3697.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (392, 14, N'POS Touch Screens', CAST(3800.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (393, 15, N'Summer Discount Offer', CAST(2528.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (394, 15, N'POS Touch Screens', CAST(920.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (395, 15, N'Black Friday Offer', CAST(4275.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (396, 16, N'Incoming Request for Conference Room', CAST(1426.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (397, 16, N'School A/V Equipment', CAST(4819.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (398, 16, N'Audio/Video Upgrade', CAST(3548.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (399, 17, N'Hospital Conference Room Set', CAST(1974.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (400, 17, N'POS Touch Screens', CAST(2942.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (401, 17, N'Black Friday Offer', CAST(4233.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (402, 18, N'Mini Cinema Equipment', CAST(4990.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (403, 18, N'Black Friday Offer', CAST(4528.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (404, 18, N'Audio/Video Upgrade', CAST(2366.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (405, 19, N'Mini Cinema Equipment', CAST(2481.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (406, 19, N'Incoming Request for Conference Room', CAST(4960.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (407, 19, N'School A/V Equipment', CAST(3977.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (408, 20, N'School A/V Equipment', CAST(1847.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (409, 20, N'Summer Discount Offer', CAST(4838.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (410, 20, N'Incoming Request for Conference Room', CAST(908.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (411, 21, N'Hospital Conference Room Set', CAST(3863.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (412, 21, N'School A/V Equipment', CAST(1254.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (413, 21, N'Black Friday Offer', CAST(2408.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (414, 22, N'Black Friday Offer', CAST(1792.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (415, 22, N'POS Touch Screens', CAST(1473.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (416, 22, N'Hospital Conference Room Set', CAST(3065.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (417, 23, N'First Sale Opportunity', CAST(3835.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (418, 23, N'POS Touch Screens', CAST(1226.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (419, 23, N'School A/V Equipment', CAST(971.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (420, 24, N'Summer Discount Offer', CAST(4426.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (421, 24, N'Hospital Conference Room Set', CAST(4378.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (422, 24, N'POS Touch Screens', CAST(3381.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (423, 25, N'First Sale Opportunity', CAST(4552.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (424, 25, N'Hospital Conference Room Set', CAST(3330.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (425, 25, N'School A/V Equipment', CAST(2914.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (426, 26, N'Black Friday Offer', CAST(1952.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (427, 26, N'POS Touch Screens', CAST(3641.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (428, 26, N'Summer Discount Offer', CAST(3536.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (429, 27, N'Hospital Conference Room Set', CAST(3030.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (430, 27, N'POS Touch Screens', CAST(1090.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (431, 27, N'Incoming Request for Conference Room', CAST(4555.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (432, 28, N'Black Friday Offer', CAST(3788.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (433, 28, N'School A/V Equipment', CAST(2852.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (434, 28, N'Summer Discount Offer', CAST(4389.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (435, 29, N'School A/V Equipment', CAST(3175.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (436, 29, N'First Sale Opportunity', CAST(4645.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (437, 29, N'POS Touch Screens', CAST(3979.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (438, 30, N'Black Friday Offer', CAST(2482.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (439, 30, N'First Sale Opportunity', CAST(2268.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (440, 30, N'Hospital Conference Room Set', CAST(1393.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (441, 31, N'Hospital Conference Room Set', CAST(2681.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (442, 31, N'First Sale Opportunity', CAST(2159.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (443, 31, N'Audio/Video Upgrade', CAST(2059.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (444, 32, N'Summer Discount Offer', CAST(4218.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (445, 32, N'Audio/Video Upgrade', CAST(1849.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (446, 32, N'POS Touch Screens', CAST(4868.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (447, 33, N'POS Touch Screens', CAST(4548.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (448, 33, N'Mini Cinema Equipment', CAST(4978.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (449, 33, N'Black Friday Offer', CAST(1759.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (450, 34, N'POS Touch Screens', CAST(2383.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (451, 34, N'Summer Discount Offer', CAST(3544.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (452, 34, N'School A/V Equipment', CAST(2218.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (453, 35, N'School A/V Equipment', CAST(2391.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (454, 35, N'Audio/Video Upgrade', CAST(1221.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (455, 35, N'First Sale Opportunity', CAST(1584.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (456, 36, N'Audio/Video Upgrade', CAST(3956.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (457, 36, N'School A/V Equipment', CAST(3647.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (458, 36, N'POS Touch Screens', CAST(2809.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (459, 37, N'Black Friday Offer', CAST(3160.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (460, 37, N'School A/V Equipment', CAST(1831.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (461, 37, N'Audio/Video Upgrade', CAST(3506.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (462, 38, N'School A/V Equipment', CAST(3524.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (463, 38, N'Summer Discount Offer', CAST(2027.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (464, 38, N'Mini Cinema Equipment', CAST(2686.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (465, 39, N'Black Friday Offer', CAST(3433.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (466, 39, N'Mini Cinema Equipment', CAST(2296.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (467, 39, N'POS Touch Screens', CAST(3827.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (468, 40, N'Hospital Conference Room Set', CAST(1938.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (469, 40, N'Incoming Request for Conference Room', CAST(3543.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (470, 40, N'Mini Cinema Equipment', CAST(3301.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (471, 41, N'POS Touch Screens', CAST(1732.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (472, 41, N'First Sale Opportunity', CAST(3981.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (473, 41, N'Mini Cinema Equipment', CAST(960.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (474, 42, N'POS Touch Screens', CAST(904.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (475, 42, N'Summer Discount Offer', CAST(2389.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (476, 42, N'Mini Cinema Equipment', CAST(1684.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (477, 43, N'Mini Cinema Equipment', CAST(4669.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (478, 43, N'Black Friday Offer', CAST(4206.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (479, 43, N'Hospital Conference Room Set', CAST(1920.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (480, 44, N'School A/V Equipment', CAST(2521.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (481, 44, N'Hospital Conference Room Set', CAST(3629.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (482, 44, N'Audio/Video Upgrade', CAST(2262.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (483, 45, N'Black Friday Offer', CAST(3925.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (484, 45, N'Incoming Request for Conference Room', CAST(1972.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (485, 45, N'Summer Discount Offer', CAST(1934.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (486, 46, N'Audio/Video Upgrade', CAST(1200.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (487, 46, N'School A/V Equipment', CAST(1742.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (488, 46, N'Hospital Conference Room Set', CAST(4170.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (489, 47, N'Incoming Request for Conference Room', CAST(2181.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (490, 47, N'School A/V Equipment', CAST(1991.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (491, 47, N'First Sale Opportunity', CAST(4464.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (492, 48, N'Incoming Request for Conference Room', CAST(1671.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (493, 48, N'School A/V Equipment', CAST(2380.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (494, 48, N'Audio/Video Upgrade', CAST(3189.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (495, 49, N'School A/V Equipment', CAST(3244.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (496, 49, N'Black Friday Offer', CAST(1382.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (497, 49, N'Audio/Video Upgrade', CAST(3500.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (498, 50, N'Mini Cinema Equipment', CAST(2914.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (499, 50, N'Summer Discount Offer', CAST(2138.00 AS Decimal(8, 2)))
INSERT [dbo].[Opportunity] ([Id], [ContactId], [Name], [Price]) VALUES (500, 50, N'Audio/Video Upgrade', CAST(3886.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[Opportunity] OFF
GO
SET IDENTITY_INSERT [dbo].[Priorities] ON 

INSERT [dbo].[Priorities] ([Name], [Id]) VALUES (N'Low', 1)
INSERT [dbo].[Priorities] ([Name], [Id]) VALUES (N'Normal', 2)
INSERT [dbo].[Priorities] ([Name], [Id]) VALUES (N'High', 3)
SET IDENTITY_INSERT [dbo].[Priorities] OFF
GO
INSERT [dbo].[State] ([StateId], [StateShort], [StateLong], [StateCoords], [flag48px], [flag24px]) VALUES (5, N'CA', N'California', N'-119.417931, 36.778259', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([Name], [Id]) VALUES (N'Open', 1)
INSERT [dbo].[Statuses] ([Name], [Id]) VALUES (N'Deferred', 2)
INSERT [dbo].[Statuses] ([Name], [Id]) VALUES (N'In Progress', 3)
INSERT [dbo].[Statuses] ([Name], [Id]) VALUES (N'Completed', 4)
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (401, 1, N'Send SWAG to customer.', CAST(N'2023-01-09T20:01:43.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (402, 1, N'Obtain feedback on new equipment.', CAST(N'2023-05-25T05:15:44.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (403, 1, N'Ask if upgrade is required.', CAST(N'2023-04-09T16:13:20.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (404, 1, N'Obtain CEO contact information.', CAST(N'2023-10-30T08:23:49.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (405, 1, N'Generate a quote.', CAST(N'2023-11-14T08:30:16.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (406, 1, N'Follow up and address recent feedback.', CAST(N'2023-06-29T07:45:11.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (407, 1, N'Call to clarify customer requirements.', CAST(N'2023-03-28T07:46:52.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (408, 1, N'Send pictures/brochures of new products.', CAST(N'2023-04-30T15:11:06.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (409, 2, N'Send pictures/brochures of new products.', CAST(N'2023-01-09T03:37:28.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (410, 2, N'Apply discounts and generate a binding offer.', CAST(N'2023-01-27T17:27:46.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (411, 2, N'Obtain CEO contact information.', CAST(N'2023-03-01T11:29:52.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (412, 2, N'Ask if upgrade is required.', CAST(N'2023-11-18T00:00:51.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (413, 2, N'Send SWAG to customer.', CAST(N'2023-08-25T19:37:54.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (414, 2, N'Create requested product comparison report.', CAST(N'2023-06-14T10:04:46.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (415, 2, N'Follow up and address recent feedback.', CAST(N'2023-01-09T22:47:51.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (416, 2, N'Generate a quote.', CAST(N'2023-10-01T23:34:24.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (417, 3, N'Call to clarify customer requirements.', CAST(N'2023-11-29T03:33:30.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (418, 3, N'Ask if upgrade is required.', CAST(N'2023-08-30T03:48:32.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (419, 3, N'Create requested product comparison report.', CAST(N'2023-02-15T08:09:16.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (420, 3, N'Send pictures/brochures of new products.', CAST(N'2023-09-21T22:56:11.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (421, 3, N'Obtain feedback on new equipment.', CAST(N'2023-08-02T20:13:37.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (422, 3, N'Generate a quote.', CAST(N'2023-04-05T05:40:11.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (423, 3, N'Send SWAG to customer.', CAST(N'2023-12-22T21:41:05.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (424, 3, N'Apply discounts and generate a binding offer.', CAST(N'2023-03-04T07:17:05.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (425, 4, N'Follow up and discuss the offer.', CAST(N'2023-01-02T17:19:31.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (426, 4, N'Ask if upgrade is required.', CAST(N'2023-02-04T23:00:08.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (427, 4, N'Send SWAG to customer.', CAST(N'2023-12-31T06:09:59.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (428, 4, N'Apply discounts and generate a binding offer.', CAST(N'2023-08-07T07:19:47.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (429, 4, N'Send pictures/brochures of new products.', CAST(N'2023-04-11T14:32:03.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (430, 4, N'Generate a quote.', CAST(N'2023-02-17T22:38:46.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (431, 4, N'Follow up and address recent feedback.', CAST(N'2023-05-23T08:28:38.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (432, 4, N'Create requested product comparison report.', CAST(N'2023-02-25T15:55:59.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (433, 5, N'Obtain CEO contact information.', CAST(N'2023-07-22T04:26:34.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (434, 5, N'Follow up and discuss the offer.', CAST(N'2023-11-18T01:17:38.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (435, 5, N'Obtain feedback on new equipment.', CAST(N'2023-01-27T05:34:42.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (436, 5, N'Send pictures/brochures of new products.', CAST(N'2023-10-02T10:49:58.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (437, 5, N'Follow up and address recent feedback.', CAST(N'2023-06-02T07:14:37.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (438, 5, N'Create requested product comparison report.', CAST(N'2023-07-30T22:52:04.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (439, 5, N'Ask if upgrade is required.', CAST(N'2023-06-29T02:09:20.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (440, 5, N'Generate a quote.', CAST(N'2023-12-17T22:07:33.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (441, 6, N'Create requested product comparison report.', CAST(N'2023-07-02T23:13:32.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (442, 6, N'Obtain CEO contact information.', CAST(N'2023-09-20T21:42:35.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (443, 6, N'Follow up and discuss the offer.', CAST(N'2023-10-12T09:28:34.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (444, 6, N'Ask if upgrade is required.', CAST(N'2023-10-20T00:45:44.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (445, 6, N'Send SWAG to customer.', CAST(N'2023-03-06T16:22:58.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (446, 6, N'Apply discounts and generate a binding offer.', CAST(N'2023-05-15T01:43:47.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (447, 6, N'Call to clarify customer requirements.', CAST(N'2023-10-10T22:39:12.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (448, 6, N'Follow up and address recent feedback.', CAST(N'2023-07-16T03:20:53.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (449, 7, N'Follow up and discuss the offer.', CAST(N'2023-06-11T00:51:46.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (450, 7, N'Create requested product comparison report.', CAST(N'2023-09-19T11:16:30.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (451, 7, N'Send SWAG to customer.', CAST(N'2023-10-17T12:36:22.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (452, 7, N'Generate a quote.', CAST(N'2023-01-12T15:17:05.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (453, 7, N'Obtain feedback on new equipment.', CAST(N'2023-03-03T04:55:16.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (454, 7, N'Send pictures/brochures of new products.', CAST(N'2023-07-26T02:21:33.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (455, 7, N'Ask if upgrade is required.', CAST(N'2023-07-30T14:18:22.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (456, 7, N'Obtain CEO contact information.', CAST(N'2023-03-16T17:43:51.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (457, 8, N'Ask if upgrade is required.', CAST(N'2023-11-24T23:18:03.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (458, 8, N'Send SWAG to customer.', CAST(N'2023-09-30T18:05:06.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (459, 8, N'Create requested product comparison report.', CAST(N'2023-12-11T03:15:19.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (460, 8, N'Send pictures/brochures of new products.', CAST(N'2023-09-30T03:46:09.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (461, 8, N'Call to clarify customer requirements.', CAST(N'2023-06-26T10:32:27.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (462, 8, N'Obtain feedback on new equipment.', CAST(N'2023-10-14T04:43:39.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (463, 8, N'Obtain CEO contact information.', CAST(N'2023-02-17T14:46:31.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (464, 8, N'Follow up and discuss the offer.', CAST(N'2023-02-03T00:43:04.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (465, 9, N'Generate a quote.', CAST(N'2023-05-13T07:24:33.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (466, 9, N'Follow up and address recent feedback.', CAST(N'2023-01-18T02:14:44.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (467, 9, N'Obtain CEO contact information.', CAST(N'2023-10-18T12:43:12.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (468, 9, N'Send SWAG to customer.', CAST(N'2023-12-03T13:18:32.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (469, 9, N'Follow up and discuss the offer.', CAST(N'2023-12-27T12:12:43.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (470, 9, N'Apply discounts and generate a binding offer.', CAST(N'2023-12-07T08:27:00.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (471, 9, N'Obtain feedback on new equipment.', CAST(N'2023-05-08T19:52:35.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (472, 9, N'Call to clarify customer requirements.', CAST(N'2023-12-03T11:33:37.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (473, 10, N'Obtain CEO contact information.', CAST(N'2023-04-21T02:01:34.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (474, 10, N'Follow up and address recent feedback.', CAST(N'2023-07-18T22:38:30.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (475, 10, N'Ask if upgrade is required.', CAST(N'2023-06-27T03:31:01.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (476, 10, N'Apply discounts and generate a binding offer.', CAST(N'2023-12-20T08:41:46.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (477, 10, N'Generate a quote.', CAST(N'2023-03-27T09:58:12.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (478, 10, N'Obtain feedback on new equipment.', CAST(N'2023-06-21T23:14:44.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (479, 10, N'Send SWAG to customer.', CAST(N'2023-07-25T23:44:26.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (480, 10, N'Send pictures/brochures of new products.', CAST(N'2023-04-10T10:11:08.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (481, 11, N'Create requested product comparison report.', CAST(N'2023-05-28T09:08:46.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (482, 11, N'Send SWAG to customer.', CAST(N'2023-05-15T18:10:28.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (483, 11, N'Follow up and discuss the offer.', CAST(N'2023-07-23T06:51:25.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (484, 11, N'Obtain CEO contact information.', CAST(N'2023-03-22T08:54:35.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (485, 11, N'Send pictures/brochures of new products.', CAST(N'2023-06-15T01:04:13.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (486, 11, N'Call to clarify customer requirements.', CAST(N'2023-07-04T00:01:55.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (487, 11, N'Follow up and address recent feedback.', CAST(N'2023-06-04T13:26:48.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (488, 11, N'Generate a quote.', CAST(N'2023-11-15T11:36:32.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (489, 12, N'Obtain CEO contact information.', CAST(N'2023-10-02T08:41:27.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (490, 12, N'Call to clarify customer requirements.', CAST(N'2023-02-20T04:25:04.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (491, 12, N'Follow up and address recent feedback.', CAST(N'2023-10-01T05:01:53.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (492, 12, N'Send SWAG to customer.', CAST(N'2023-12-26T00:47:09.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (493, 12, N'Obtain feedback on new equipment.', CAST(N'2023-11-07T17:15:42.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (494, 12, N'Ask if upgrade is required.', CAST(N'2023-03-16T12:51:58.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (495, 12, N'Follow up and discuss the offer.', CAST(N'2023-07-13T19:55:01.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (496, 12, N'Create requested product comparison report.', CAST(N'2023-12-20T23:14:00.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (497, 13, N'Create requested product comparison report.', CAST(N'2023-08-02T22:57:03.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (498, 13, N'Send SWAG to customer.', CAST(N'2023-03-13T03:33:39.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (499, 13, N'Generate a quote.', CAST(N'2023-07-31T07:17:01.000' AS DateTime), N'Deferred', N'High')
GO
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (500, 13, N'Follow up and address recent feedback.', CAST(N'2023-09-29T08:49:15.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (501, 13, N'Obtain feedback on new equipment.', CAST(N'2023-01-15T12:22:21.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (502, 13, N'Obtain CEO contact information.', CAST(N'2023-08-17T13:47:34.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (503, 13, N'Call to clarify customer requirements.', CAST(N'2023-02-14T18:43:33.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (504, 13, N'Apply discounts and generate a binding offer.', CAST(N'2023-08-28T14:47:40.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (505, 14, N'Apply discounts and generate a binding offer.', CAST(N'2023-12-27T09:40:31.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (506, 14, N'Send SWAG to customer.', CAST(N'2023-02-17T07:07:41.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (507, 14, N'Call to clarify customer requirements.', CAST(N'2023-03-05T23:03:33.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (508, 14, N'Create requested product comparison report.', CAST(N'2023-07-14T08:19:24.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (509, 14, N'Follow up and discuss the offer.', CAST(N'2023-09-02T13:45:40.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (510, 14, N'Follow up and address recent feedback.', CAST(N'2023-01-20T11:47:14.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (511, 14, N'Ask if upgrade is required.', CAST(N'2023-11-25T23:44:26.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (512, 14, N'Obtain feedback on new equipment.', CAST(N'2023-01-08T02:08:32.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (513, 15, N'Call to clarify customer requirements.', CAST(N'2023-06-21T17:50:44.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (514, 15, N'Follow up and address recent feedback.', CAST(N'2023-10-01T18:11:54.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (515, 15, N'Follow up and discuss the offer.', CAST(N'2023-09-28T02:56:01.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (516, 15, N'Send SWAG to customer.', CAST(N'2023-01-23T23:39:28.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (517, 15, N'Send pictures/brochures of new products.', CAST(N'2023-03-31T06:55:36.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (518, 15, N'Ask if upgrade is required.', CAST(N'2023-03-18T18:53:37.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (519, 15, N'Obtain CEO contact information.', CAST(N'2023-10-16T10:29:06.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (520, 15, N'Create requested product comparison report.', CAST(N'2023-05-17T09:31:41.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (521, 16, N'Create requested product comparison report.', CAST(N'2023-05-22T10:53:16.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (522, 16, N'Ask if upgrade is required.', CAST(N'2023-06-28T13:00:29.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (523, 16, N'Follow up and discuss the offer.', CAST(N'2023-01-15T07:20:51.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (524, 16, N'Generate a quote.', CAST(N'2023-03-05T05:32:04.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (525, 16, N'Obtain CEO contact information.', CAST(N'2023-02-21T13:06:21.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (526, 16, N'Obtain feedback on new equipment.', CAST(N'2023-09-22T06:36:19.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (527, 16, N'Follow up and address recent feedback.', CAST(N'2023-02-14T05:53:34.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (528, 16, N'Call to clarify customer requirements.', CAST(N'2023-06-08T03:17:02.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (529, 17, N'Send pictures/brochures of new products.', CAST(N'2023-11-02T08:07:00.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (530, 17, N'Follow up and discuss the offer.', CAST(N'2023-03-06T16:54:39.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (531, 17, N'Create requested product comparison report.', CAST(N'2023-10-10T12:57:24.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (532, 17, N'Obtain CEO contact information.', CAST(N'2023-02-18T19:37:03.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (533, 17, N'Obtain feedback on new equipment.', CAST(N'2023-04-27T14:31:06.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (534, 17, N'Send SWAG to customer.', CAST(N'2023-02-26T01:26:29.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (535, 17, N'Ask if upgrade is required.', CAST(N'2023-12-08T14:32:40.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (536, 17, N'Generate a quote.', CAST(N'2023-10-31T19:54:53.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (537, 18, N'Apply discounts and generate a binding offer.', CAST(N'2023-08-03T03:33:47.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (538, 18, N'Generate a quote.', CAST(N'2023-07-05T19:15:21.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (539, 18, N'Obtain CEO contact information.', CAST(N'2023-09-21T12:33:18.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (540, 18, N'Call to clarify customer requirements.', CAST(N'2023-02-11T19:33:49.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (541, 18, N'Follow up and address recent feedback.', CAST(N'2023-02-11T02:54:13.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (542, 18, N'Ask if upgrade is required.', CAST(N'2023-02-17T14:44:56.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (543, 18, N'Create requested product comparison report.', CAST(N'2023-09-03T22:09:46.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (544, 18, N'Send pictures/brochures of new products.', CAST(N'2023-05-26T15:09:43.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (545, 19, N'Obtain CEO contact information.', CAST(N'2023-07-29T11:04:50.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (546, 19, N'Follow up and address recent feedback.', CAST(N'2023-07-12T22:05:30.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (547, 19, N'Send SWAG to customer.', CAST(N'2023-12-31T11:17:07.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (548, 19, N'Ask if upgrade is required.', CAST(N'2023-10-12T02:28:16.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (549, 19, N'Follow up and discuss the offer.', CAST(N'2023-10-03T05:31:12.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (550, 19, N'Generate a quote.', CAST(N'2023-05-05T14:42:52.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (551, 19, N'Apply discounts and generate a binding offer.', CAST(N'2023-09-09T01:29:10.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (552, 19, N'Call to clarify customer requirements.', CAST(N'2023-11-07T03:04:15.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (553, 20, N'Obtain CEO contact information.', CAST(N'2023-06-09T15:22:27.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (554, 20, N'Create requested product comparison report.', CAST(N'2023-11-21T18:01:40.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (555, 20, N'Obtain feedback on new equipment.', CAST(N'2023-05-22T06:06:15.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (556, 20, N'Call to clarify customer requirements.', CAST(N'2023-10-06T10:36:15.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (557, 20, N'Send pictures/brochures of new products.', CAST(N'2023-05-23T11:57:06.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (558, 20, N'Generate a quote.', CAST(N'2023-04-14T11:07:26.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (559, 20, N'Send SWAG to customer.', CAST(N'2023-01-31T15:47:16.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (560, 20, N'Follow up and discuss the offer.', CAST(N'2023-08-22T18:55:44.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (561, 21, N'Ask if upgrade is required.', CAST(N'2023-02-18T19:42:30.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (562, 21, N'Send pictures/brochures of new products.', CAST(N'2023-11-06T00:32:09.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (563, 21, N'Apply discounts and generate a binding offer.', CAST(N'2023-08-15T21:44:22.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (564, 21, N'Send SWAG to customer.', CAST(N'2023-08-13T07:34:47.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (565, 21, N'Call to clarify customer requirements.', CAST(N'2023-01-27T19:54:44.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (566, 21, N'Obtain feedback on new equipment.', CAST(N'2023-05-27T15:52:34.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (567, 21, N'Obtain CEO contact information.', CAST(N'2023-10-07T00:28:35.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (568, 21, N'Generate a quote.', CAST(N'2023-10-27T08:15:30.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (569, 22, N'Obtain CEO contact information.', CAST(N'2023-06-15T05:10:21.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (570, 22, N'Apply discounts and generate a binding offer.', CAST(N'2023-01-03T10:39:40.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (571, 22, N'Send pictures/brochures of new products.', CAST(N'2023-12-03T06:00:34.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (572, 22, N'Generate a quote.', CAST(N'2023-01-18T20:45:59.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (573, 22, N'Ask if upgrade is required.', CAST(N'2023-02-26T12:36:47.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (574, 22, N'Follow up and address recent feedback.', CAST(N'2023-10-10T20:49:16.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (575, 22, N'Obtain feedback on new equipment.', CAST(N'2023-06-01T20:59:48.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (576, 22, N'Create requested product comparison report.', CAST(N'2023-10-22T14:44:20.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (577, 23, N'Follow up and discuss the offer.', CAST(N'2023-10-14T22:21:26.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (578, 23, N'Apply discounts and generate a binding offer.', CAST(N'2023-06-10T14:58:08.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (579, 23, N'Send pictures/brochures of new products.', CAST(N'2023-12-17T03:45:02.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (580, 23, N'Obtain CEO contact information.', CAST(N'2023-06-17T03:33:54.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (581, 23, N'Follow up and address recent feedback.', CAST(N'2023-11-21T06:20:21.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (582, 23, N'Generate a quote.', CAST(N'2023-12-05T06:50:01.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (583, 23, N'Send SWAG to customer.', CAST(N'2023-06-26T06:26:00.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (584, 23, N'Create requested product comparison report.', CAST(N'2023-03-02T01:09:22.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (585, 24, N'Obtain CEO contact information.', CAST(N'2023-11-27T21:00:37.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (586, 24, N'Call to clarify customer requirements.', CAST(N'2023-12-17T15:46:22.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (587, 24, N'Send pictures/brochures of new products.', CAST(N'2023-07-08T20:34:49.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (588, 24, N'Obtain feedback on new equipment.', CAST(N'2023-07-01T06:14:04.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (589, 24, N'Follow up and address recent feedback.', CAST(N'2023-12-29T18:34:42.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (590, 24, N'Create requested product comparison report.', CAST(N'2023-08-08T11:05:07.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (591, 24, N'Apply discounts and generate a binding offer.', CAST(N'2023-07-21T03:18:48.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (592, 24, N'Generate a quote.', CAST(N'2023-05-07T09:05:04.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (593, 25, N'Create requested product comparison report.', CAST(N'2023-01-05T18:46:04.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (594, 25, N'Send SWAG to customer.', CAST(N'2023-05-21T19:37:42.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (595, 25, N'Call to clarify customer requirements.', CAST(N'2023-02-27T06:02:35.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (596, 25, N'Follow up and discuss the offer.', CAST(N'2023-03-20T02:59:32.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (597, 25, N'Obtain CEO contact information.', CAST(N'2023-11-12T03:52:00.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (598, 25, N'Generate a quote.', CAST(N'2023-02-20T13:09:29.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (599, 25, N'Apply discounts and generate a binding offer.', CAST(N'2023-01-12T08:27:27.000' AS DateTime), N'Completed', N'Normal')
GO
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (600, 25, N'Obtain feedback on new equipment.', CAST(N'2023-04-11T22:43:33.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (601, 26, N'Send SWAG to customer.', CAST(N'2023-05-05T01:07:16.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (602, 26, N'Generate a quote.', CAST(N'2023-08-13T07:45:20.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (603, 26, N'Follow up and address recent feedback.', CAST(N'2023-09-22T04:58:13.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (604, 26, N'Create requested product comparison report.', CAST(N'2023-02-08T20:35:53.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (605, 26, N'Obtain CEO contact information.', CAST(N'2023-05-20T12:26:51.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (606, 26, N'Obtain feedback on new equipment.', CAST(N'2023-08-09T19:28:12.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (607, 26, N'Apply discounts and generate a binding offer.', CAST(N'2023-08-06T10:39:10.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (608, 26, N'Follow up and discuss the offer.', CAST(N'2023-05-30T05:43:00.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (609, 27, N'Call to clarify customer requirements.', CAST(N'2023-03-05T02:50:01.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (610, 27, N'Generate a quote.', CAST(N'2023-12-10T05:29:44.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (611, 27, N'Follow up and address recent feedback.', CAST(N'2023-04-24T06:47:19.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (612, 27, N'Create requested product comparison report.', CAST(N'2023-04-09T01:13:42.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (613, 27, N'Obtain feedback on new equipment.', CAST(N'2023-07-22T00:42:43.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (614, 27, N'Obtain CEO contact information.', CAST(N'2023-10-23T19:44:09.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (615, 27, N'Follow up and discuss the offer.', CAST(N'2023-02-17T00:46:06.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (616, 27, N'Send pictures/brochures of new products.', CAST(N'2023-02-19T02:39:59.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (617, 28, N'Create requested product comparison report.', CAST(N'2023-09-14T08:20:01.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (618, 28, N'Obtain CEO contact information.', CAST(N'2023-05-07T20:37:25.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (619, 28, N'Obtain feedback on new equipment.', CAST(N'2023-10-17T00:21:05.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (620, 28, N'Apply discounts and generate a binding offer.', CAST(N'2023-01-28T10:41:11.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (621, 28, N'Generate a quote.', CAST(N'2023-06-28T23:52:46.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (622, 28, N'Send SWAG to customer.', CAST(N'2023-03-11T19:40:22.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (623, 28, N'Send pictures/brochures of new products.', CAST(N'2023-11-13T13:04:31.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (624, 28, N'Call to clarify customer requirements.', CAST(N'2023-04-02T22:21:58.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (625, 29, N'Call to clarify customer requirements.', CAST(N'2023-02-21T09:17:23.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (626, 29, N'Follow up and address recent feedback.', CAST(N'2023-01-13T03:38:15.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (627, 29, N'Generate a quote.', CAST(N'2023-05-30T20:40:37.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (628, 29, N'Send SWAG to customer.', CAST(N'2023-09-19T18:23:32.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (629, 29, N'Obtain CEO contact information.', CAST(N'2023-02-25T21:12:38.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (630, 29, N'Send pictures/brochures of new products.', CAST(N'2023-06-22T02:57:28.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (631, 29, N'Apply discounts and generate a binding offer.', CAST(N'2023-08-04T23:55:21.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (632, 29, N'Follow up and discuss the offer.', CAST(N'2023-06-15T05:43:30.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (633, 30, N'Send pictures/brochures of new products.', CAST(N'2023-10-31T19:28:48.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (634, 30, N'Ask if upgrade is required.', CAST(N'2023-12-19T11:20:01.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (635, 30, N'Generate a quote.', CAST(N'2023-06-01T06:34:56.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (636, 30, N'Obtain feedback on new equipment.', CAST(N'2023-12-14T16:57:06.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (637, 30, N'Obtain CEO contact information.', CAST(N'2023-03-29T02:42:46.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (638, 30, N'Follow up and address recent feedback.', CAST(N'2023-08-06T19:17:53.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (639, 30, N'Follow up and discuss the offer.', CAST(N'2023-04-23T06:22:28.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (640, 30, N'Send SWAG to customer.', CAST(N'2023-09-08T00:52:33.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (641, 31, N'Create requested product comparison report.', CAST(N'2023-12-29T04:37:49.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (642, 31, N'Obtain feedback on new equipment.', CAST(N'2023-09-15T10:15:30.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (643, 31, N'Send pictures/brochures of new products.', CAST(N'2023-04-24T08:41:10.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (644, 31, N'Follow up and address recent feedback.', CAST(N'2023-11-06T05:20:15.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (645, 31, N'Call to clarify customer requirements.', CAST(N'2023-10-11T03:24:25.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (646, 31, N'Ask if upgrade is required.', CAST(N'2023-03-24T17:04:52.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (647, 31, N'Generate a quote.', CAST(N'2023-07-22T10:25:58.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (648, 31, N'Obtain CEO contact information.', CAST(N'2023-02-07T00:22:27.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (649, 32, N'Generate a quote.', CAST(N'2023-05-27T19:04:04.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (650, 32, N'Call to clarify customer requirements.', CAST(N'2023-01-25T18:58:36.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (651, 32, N'Send SWAG to customer.', CAST(N'2023-09-05T08:27:08.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (652, 32, N'Apply discounts and generate a binding offer.', CAST(N'2023-05-14T16:55:47.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (653, 32, N'Send pictures/brochures of new products.', CAST(N'2023-09-28T07:27:31.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (654, 32, N'Follow up and discuss the offer.', CAST(N'2023-06-19T15:19:41.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (655, 32, N'Obtain CEO contact information.', CAST(N'2023-06-09T11:37:07.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (656, 32, N'Follow up and address recent feedback.', CAST(N'2023-11-12T17:32:21.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (657, 33, N'Send pictures/brochures of new products.', CAST(N'2023-12-05T09:13:11.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (658, 33, N'Obtain CEO contact information.', CAST(N'2023-10-01T00:58:26.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (659, 33, N'Follow up and address recent feedback.', CAST(N'2023-12-05T23:32:58.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (660, 33, N'Create requested product comparison report.', CAST(N'2023-04-20T20:44:46.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (661, 33, N'Call to clarify customer requirements.', CAST(N'2023-02-19T00:20:08.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (662, 33, N'Obtain feedback on new equipment.', CAST(N'2023-07-08T17:06:01.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (663, 33, N'Follow up and discuss the offer.', CAST(N'2023-03-25T23:03:56.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (664, 33, N'Send SWAG to customer.', CAST(N'2023-10-22T15:40:01.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (665, 34, N'Send SWAG to customer.', CAST(N'2023-02-05T19:42:36.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (666, 34, N'Obtain CEO contact information.', CAST(N'2023-08-24T08:51:28.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (667, 34, N'Apply discounts and generate a binding offer.', CAST(N'2023-02-22T18:43:21.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (668, 34, N'Send pictures/brochures of new products.', CAST(N'2023-06-24T22:03:34.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (669, 34, N'Call to clarify customer requirements.', CAST(N'2023-02-10T07:58:27.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (670, 34, N'Follow up and address recent feedback.', CAST(N'2023-05-24T17:34:10.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (671, 34, N'Ask if upgrade is required.', CAST(N'2023-11-20T11:44:35.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (672, 34, N'Create requested product comparison report.', CAST(N'2023-05-13T23:05:51.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (673, 35, N'Obtain CEO contact information.', CAST(N'2023-02-25T03:12:51.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (674, 35, N'Send SWAG to customer.', CAST(N'2023-11-13T06:00:49.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (675, 35, N'Generate a quote.', CAST(N'2023-03-30T03:02:29.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (676, 35, N'Create requested product comparison report.', CAST(N'2023-03-01T14:14:37.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (677, 35, N'Follow up and address recent feedback.', CAST(N'2023-01-10T09:45:43.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (678, 35, N'Obtain feedback on new equipment.', CAST(N'2023-07-13T18:26:30.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (679, 35, N'Call to clarify customer requirements.', CAST(N'2023-05-28T08:22:41.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (680, 35, N'Send pictures/brochures of new products.', CAST(N'2023-06-30T22:17:07.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (681, 36, N'Obtain feedback on new equipment.', CAST(N'2023-05-20T06:03:47.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (682, 36, N'Obtain CEO contact information.', CAST(N'2023-12-11T15:45:55.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (683, 36, N'Follow up and discuss the offer.', CAST(N'2023-11-01T22:57:56.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (684, 36, N'Send pictures/brochures of new products.', CAST(N'2023-01-01T15:03:18.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (685, 36, N'Call to clarify customer requirements.', CAST(N'2023-12-14T05:31:16.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (686, 36, N'Create requested product comparison report.', CAST(N'2023-09-13T08:42:43.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (687, 36, N'Apply discounts and generate a binding offer.', CAST(N'2023-02-07T16:37:01.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (688, 36, N'Generate a quote.', CAST(N'2023-03-20T18:08:12.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (689, 37, N'Generate a quote.', CAST(N'2023-01-27T00:51:41.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (690, 37, N'Send pictures/brochures of new products.', CAST(N'2023-06-15T14:08:16.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (691, 37, N'Obtain CEO contact information.', CAST(N'2023-07-14T08:48:52.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (692, 37, N'Create requested product comparison report.', CAST(N'2023-06-26T19:50:45.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (693, 37, N'Follow up and address recent feedback.', CAST(N'2023-03-15T15:13:14.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (694, 37, N'Send SWAG to customer.', CAST(N'2023-09-04T15:28:39.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (695, 37, N'Ask if upgrade is required.', CAST(N'2023-09-07T12:44:36.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (696, 37, N'Apply discounts and generate a binding offer.', CAST(N'2023-05-08T11:27:13.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (697, 38, N'Ask if upgrade is required.', CAST(N'2023-02-13T03:35:23.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (698, 38, N'Call to clarify customer requirements.', CAST(N'2023-03-18T15:18:22.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (699, 38, N'Follow up and address recent feedback.', CAST(N'2023-12-21T15:06:49.000' AS DateTime), N'Open', N'High')
GO
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (700, 38, N'Obtain feedback on new equipment.', CAST(N'2023-12-09T22:49:53.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (701, 38, N'Obtain CEO contact information.', CAST(N'2023-11-15T05:24:03.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (702, 38, N'Generate a quote.', CAST(N'2023-08-06T02:18:08.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (703, 38, N'Follow up and discuss the offer.', CAST(N'2023-09-15T12:54:52.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (704, 38, N'Send SWAG to customer.', CAST(N'2023-02-08T01:58:01.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (705, 39, N'Generate a quote.', CAST(N'2023-11-12T15:55:22.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (706, 39, N'Obtain feedback on new equipment.', CAST(N'2023-10-22T18:05:24.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (707, 39, N'Follow up and discuss the offer.', CAST(N'2023-04-18T16:12:35.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (708, 39, N'Call to clarify customer requirements.', CAST(N'2023-05-08T21:01:41.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (709, 39, N'Create requested product comparison report.', CAST(N'2023-02-27T02:18:10.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (710, 39, N'Obtain CEO contact information.', CAST(N'2023-01-04T01:26:25.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (711, 39, N'Apply discounts and generate a binding offer.', CAST(N'2023-02-26T10:37:36.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (712, 39, N'Send pictures/brochures of new products.', CAST(N'2023-02-20T01:05:21.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (713, 40, N'Send pictures/brochures of new products.', CAST(N'2023-09-03T04:45:49.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (714, 40, N'Create requested product comparison report.', CAST(N'2023-01-27T05:57:45.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (715, 40, N'Obtain CEO contact information.', CAST(N'2023-08-06T23:04:53.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (716, 40, N'Ask if upgrade is required.', CAST(N'2023-11-11T12:43:15.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (717, 40, N'Send SWAG to customer.', CAST(N'2023-09-18T10:10:12.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (718, 40, N'Apply discounts and generate a binding offer.', CAST(N'2023-04-08T13:46:08.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (719, 40, N'Call to clarify customer requirements.', CAST(N'2023-01-13T01:18:55.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (720, 40, N'Obtain feedback on new equipment.', CAST(N'2023-06-28T02:06:18.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (721, 41, N'Create requested product comparison report.', CAST(N'2023-07-24T03:29:28.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (722, 41, N'Send pictures/brochures of new products.', CAST(N'2023-04-18T21:59:18.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (723, 41, N'Follow up and address recent feedback.', CAST(N'2023-11-13T21:11:51.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (724, 41, N'Follow up and discuss the offer.', CAST(N'2023-07-10T08:43:06.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (725, 41, N'Generate a quote.', CAST(N'2023-11-26T02:05:15.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (726, 41, N'Obtain CEO contact information.', CAST(N'2023-05-13T13:09:45.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (727, 41, N'Apply discounts and generate a binding offer.', CAST(N'2023-10-03T00:31:05.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (728, 41, N'Ask if upgrade is required.', CAST(N'2023-01-11T09:42:31.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (729, 42, N'Send pictures/brochures of new products.', CAST(N'2023-12-28T02:42:13.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (730, 42, N'Obtain CEO contact information.', CAST(N'2023-12-25T01:25:19.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (731, 42, N'Call to clarify customer requirements.', CAST(N'2023-07-08T06:04:49.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (732, 42, N'Apply discounts and generate a binding offer.', CAST(N'2023-04-03T16:41:20.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (733, 42, N'Follow up and discuss the offer.', CAST(N'2023-03-12T05:04:11.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (734, 42, N'Send SWAG to customer.', CAST(N'2023-06-18T03:01:09.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (735, 42, N'Follow up and address recent feedback.', CAST(N'2023-08-21T22:02:12.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (736, 42, N'Ask if upgrade is required.', CAST(N'2023-10-15T05:07:10.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (737, 43, N'Create requested product comparison report.', CAST(N'2023-02-20T12:24:11.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (738, 43, N'Obtain CEO contact information.', CAST(N'2023-12-01T05:56:29.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (739, 43, N'Follow up and discuss the offer.', CAST(N'2023-04-09T09:01:17.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (740, 43, N'Send pictures/brochures of new products.', CAST(N'2023-10-13T16:06:41.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (741, 43, N'Obtain feedback on new equipment.', CAST(N'2023-08-20T17:08:26.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (742, 43, N'Send SWAG to customer.', CAST(N'2023-11-04T18:40:16.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (743, 43, N'Ask if upgrade is required.', CAST(N'2023-08-15T20:08:15.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (744, 43, N'Follow up and address recent feedback.', CAST(N'2023-11-21T22:40:44.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (745, 44, N'Follow up and discuss the offer.', CAST(N'2023-11-26T21:59:02.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (746, 44, N'Send pictures/brochures of new products.', CAST(N'2023-12-05T19:13:22.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (747, 44, N'Obtain CEO contact information.', CAST(N'2023-02-09T09:18:20.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (748, 44, N'Ask if upgrade is required.', CAST(N'2023-02-25T09:16:11.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (749, 44, N'Call to clarify customer requirements.', CAST(N'2023-02-14T11:22:56.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (750, 44, N'Send SWAG to customer.', CAST(N'2023-06-22T20:55:46.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (751, 44, N'Apply discounts and generate a binding offer.', CAST(N'2023-03-01T01:43:12.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (752, 44, N'Generate a quote.', CAST(N'2023-11-10T17:10:40.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (753, 45, N'Send pictures/brochures of new products.', CAST(N'2023-05-07T21:51:06.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (754, 45, N'Apply discounts and generate a binding offer.', CAST(N'2023-02-11T17:11:28.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (755, 45, N'Ask if upgrade is required.', CAST(N'2023-02-10T20:35:27.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (756, 45, N'Send SWAG to customer.', CAST(N'2023-04-25T21:48:47.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (757, 45, N'Follow up and discuss the offer.', CAST(N'2023-05-27T02:17:13.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (758, 45, N'Create requested product comparison report.', CAST(N'2023-04-17T15:02:35.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (759, 45, N'Obtain feedback on new equipment.', CAST(N'2023-11-06T10:27:40.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (760, 45, N'Call to clarify customer requirements.', CAST(N'2023-11-12T22:10:21.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (761, 46, N'Send SWAG to customer.', CAST(N'2023-01-05T00:40:59.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (762, 46, N'Apply discounts and generate a binding offer.', CAST(N'2023-10-09T22:55:38.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (763, 46, N'Ask if upgrade is required.', CAST(N'2023-07-05T11:43:57.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (764, 46, N'Follow up and address recent feedback.', CAST(N'2023-02-06T01:00:19.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (765, 46, N'Call to clarify customer requirements.', CAST(N'2023-12-18T20:29:31.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (766, 46, N'Generate a quote.', CAST(N'2023-12-17T14:49:28.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (767, 46, N'Create requested product comparison report.', CAST(N'2023-08-30T00:49:06.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (768, 46, N'Send pictures/brochures of new products.', CAST(N'2023-05-26T11:56:18.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (769, 47, N'Send pictures/brochures of new products.', CAST(N'2023-03-11T23:03:22.000' AS DateTime), N'Deferred', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (770, 47, N'Call to clarify customer requirements.', CAST(N'2023-02-25T14:51:20.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (771, 47, N'Apply discounts and generate a binding offer.', CAST(N'2023-08-05T13:42:24.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (772, 47, N'Obtain feedback on new equipment.', CAST(N'2023-01-27T23:34:32.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (773, 47, N'Follow up and discuss the offer.', CAST(N'2023-02-11T22:14:12.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (774, 47, N'Generate a quote.', CAST(N'2023-10-09T18:59:16.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (775, 47, N'Ask if upgrade is required.', CAST(N'2023-06-10T07:29:46.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (776, 47, N'Obtain CEO contact information.', CAST(N'2023-11-12T20:55:54.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (777, 48, N'Generate a quote.', CAST(N'2023-09-19T04:50:19.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (778, 48, N'Ask if upgrade is required.', CAST(N'2023-08-08T16:07:08.000' AS DateTime), N'Completed', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (779, 48, N'Obtain CEO contact information.', CAST(N'2023-11-28T11:44:59.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (780, 48, N'Call to clarify customer requirements.', CAST(N'2023-12-04T08:52:53.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (781, 48, N'Send SWAG to customer.', CAST(N'2023-03-03T13:49:59.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (782, 48, N'Apply discounts and generate a binding offer.', CAST(N'2023-02-17T01:37:53.000' AS DateTime), N'Open', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (783, 48, N'Create requested product comparison report.', CAST(N'2023-10-21T21:50:35.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (784, 48, N'Follow up and discuss the offer.', CAST(N'2023-04-08T07:37:58.000' AS DateTime), N'Deferred', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (785, 49, N'Generate a quote.', CAST(N'2023-08-29T14:26:29.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (786, 49, N'Obtain feedback on new equipment.', CAST(N'2023-05-14T20:11:51.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (787, 49, N'Obtain CEO contact information.', CAST(N'2023-10-14T04:21:43.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (788, 49, N'Send SWAG to customer.', CAST(N'2023-07-23T05:36:41.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (789, 49, N'Apply discounts and generate a binding offer.', CAST(N'2023-04-15T19:49:33.000' AS DateTime), N'Open', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (790, 49, N'Follow up and address recent feedback.', CAST(N'2023-01-26T01:50:47.000' AS DateTime), N'In Progress', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (791, 49, N'Ask if upgrade is required.', CAST(N'2023-05-30T20:55:15.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (792, 49, N'Send pictures/brochures of new products.', CAST(N'2023-01-18T13:37:55.000' AS DateTime), N'Completed', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (793, 50, N'Generate a quote.', CAST(N'2023-10-15T06:33:39.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (794, 50, N'Obtain feedback on new equipment.', CAST(N'2023-08-23T19:24:05.000' AS DateTime), N'Completed', N'High')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (795, 50, N'Follow up and address recent feedback.', CAST(N'2023-05-09T21:09:35.000' AS DateTime), N'In Progress', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (796, 50, N'Send pictures/brochures of new products.', CAST(N'2023-11-17T02:02:07.000' AS DateTime), N'Open', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (797, 50, N'Ask if upgrade is required.', CAST(N'2023-09-07T16:47:08.000' AS DateTime), N'In Progress', N'Low')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (798, 50, N'Send SWAG to customer.', CAST(N'2023-04-09T15:42:41.000' AS DateTime), N'Deferred', N'Normal')
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (799, 50, N'Apply discounts and generate a binding offer.', CAST(N'2023-10-13T00:47:14.000' AS DateTime), N'Deferred', N'Low')
GO
INSERT [dbo].[Task] ([Id], [ContactId], [Text], [Date], [Status], [Priority]) VALUES (800, 50, N'Create requested product comparison report.', CAST(N'2023-02-19T22:51:43.000' AS DateTime), N'In Progress', N'Low')
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([Name], [Id]) VALUES (N'Ask if upgrade is required.', 1)
INSERT [dbo].[Tasks] ([Name], [Id]) VALUES (N'Call to clarify customer requirements.', 2)
INSERT [dbo].[Tasks] ([Name], [Id]) VALUES (N'Send pictures/brochures of new products.', 3)
INSERT [dbo].[Tasks] ([Name], [Id]) VALUES (N'Follow up and discuss the offer.', 4)
INSERT [dbo].[Tasks] ([Name], [Id]) VALUES (N'Obtain CEO contact information.', 5)
INSERT [dbo].[Tasks] ([Name], [Id]) VALUES (N'Create requested product comparison report.', 6)
INSERT [dbo].[Tasks] ([Name], [Id]) VALUES (N'Generate a quote.', 7)
INSERT [dbo].[Tasks] ([Name], [Id]) VALUES (N'Follow up and address recent feedback.', 8)
INSERT [dbo].[Tasks] ([Name], [Id]) VALUES (N'Apply discounts and generate a binding offer.', 9)
INSERT [dbo].[Tasks] ([Name], [Id]) VALUES (N'Send SWAG to customer.', 10)
INSERT [dbo].[Tasks] ([Name], [Id]) VALUES (N'Obtain feedback on new equipment.', 11)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ID])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Contact]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_State]
GO
ALTER TABLE [dbo].[Opportunity]  WITH CHECK ADD  CONSTRAINT [FK_Opportunity_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ID])
GO
ALTER TABLE [dbo].[Opportunity] CHECK CONSTRAINT [FK_Opportunity_Contact]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Contact]
GO
USE [master]
GO
ALTER DATABASE [DXFullApp] SET  READ_WRITE 
GO

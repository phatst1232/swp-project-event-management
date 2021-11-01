USE [master]
GO
/****** Object:  Database [EventManagement_2]    Script Date: 01-Nov-21 8:08:46 PM ******/
CREATE DATABASE [EventManagement_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventManagement_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\EventManagement_2.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EventManagement_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\EventManagement_2_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EventManagement_2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventManagement_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventManagement_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventManagement_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventManagement_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventManagement_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventManagement_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventManagement_2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EventManagement_2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EventManagement_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventManagement_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventManagement_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventManagement_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventManagement_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventManagement_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventManagement_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventManagement_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventManagement_2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EventManagement_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventManagement_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventManagement_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventManagement_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventManagement_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventManagement_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventManagement_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventManagement_2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EventManagement_2] SET  MULTI_USER 
GO
ALTER DATABASE [EventManagement_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventManagement_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventManagement_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventManagement_2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EventManagement_2]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCLs]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCLs](
	[clubID] [nvarchar](50) NOT NULL,
	[clubName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCLs] PRIMARY KEY CLUSTERED 
(
	[clubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblComments]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComments](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[commentContent] [nvarchar](400) NOT NULL,
	[repliedTo] [nvarchar](50) NULL,
	[eventID] [nvarchar](50) NULL,
	[like] [int] NULL,
	[commentBy] [nvarchar](50) NULL,
	[commentDate] [datetime] NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDms]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDms](
	[dmID] [nvarchar](50) NOT NULL,
	[dmName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDms_1] PRIMARY KEY CLUSTERED 
(
	[dmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEvent_Categories]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEvent_Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryID] [nvarchar](50) NOT NULL,
	[eventID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblEvent_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEvent_Rooms]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEvent_Rooms](
	[roomID] [nvarchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eventID] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEvent_Slots]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEvent_Slots](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slotID] [nvarchar](50) NOT NULL,
	[eventID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblEvent_Slots] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEvents]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEvents](
	[eventID] [nvarchar](50) NOT NULL,
	[eventName] [nvarchar](50) NOT NULL,
	[eventCreateDate] [date] NOT NULL,
	[eventStartDate] [date] NOT NULL,
	[userID] [nvarchar](50) NULL,
	[statusID] [nvarchar](50) NULL,
	[limitMember] [int] NOT NULL,
	[content] [nvarchar](max) NULL,
	[clubID] [nvarchar](50) NULL,
	[dmID] [nvarchar](50) NULL,
	[like] [int] NULL,
 CONSTRAINT [PK_tblEvents] PRIMARY KEY CLUSTERED 
(
	[eventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFollows]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFollows](
	[followID] [nvarchar](50) NOT NULL,
	[followDate] [date] NOT NULL,
	[eventID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblFollows] PRIMARY KEY CLUSTERED 
(
	[followID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblImages]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblImages](
	[image] [binary](50) NULL,
	[link] [nvarchar](200) NULL,
	[userID] [nvarchar](50) NULL,
	[eventID] [nvarchar](50) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblImages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblJoins]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJoins](
	[joinID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[eventID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblJoins] PRIMARY KEY CLUSTERED 
(
	[joinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMajors]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMajors](
	[majorID] [nvarchar](50) NOT NULL,
	[majorName] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblmajors] PRIMARY KEY CLUSTERED 
(
	[majorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblReports]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReports](
	[reportID] [nvarchar](50) NOT NULL,
	[reportDetail] [nvarchar](50) NULL,
	[userID] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblReports] PRIMARY KEY CLUSTERED 
(
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRooms]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRooms](
	[roomID] [nvarchar](50) NOT NULL,
	[maxCapacity] [nchar](10) NULL,
 CONSTRAINT [PK_tblRooms] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSlots]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSlots](
	[slotID] [nvarchar](50) NOT NULL,
	[startTime] [nvarchar](50) NOT NULL,
	[endTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblSlots] PRIMARY KEY CLUSTERED 
(
	[slotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [nvarchar](50) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatus_1] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser_Categories]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser_Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[interestedID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 01-Nov-21 8:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleID] [nvarchar](50) NULL,
	[address] [nvarchar](50) NOT NULL,
	[phoneNumber] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[statusID] [nvarchar](50) NULL,
	[majorID] [nvarchar](50) NULL,
	[clubID] [nvarchar](50) NULL,
	[dmID] [nvarchar](50) NULL,
	[avtLink] [nvarchar](200) NULL,
 CONSTRAINT [PK_TblAdmin] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'AN', N'Âm nhạc')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'CLUBA', N'Club-Activies')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'F&D', N'Food And Drind')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'IP', N'insprire')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'MS', N'Music')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'SA', N'School''s Activies')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'SP', N'Speech')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'TL', N'Talent')
INSERT [dbo].[tblCLs] ([clubID], [clubName]) VALUES (N'CL001', N'Cóc Sài Gòn')
INSERT [dbo].[tblCLs] ([clubID], [clubName]) VALUES (N'FCD', N'Fpt Coding')
INSERT [dbo].[tblCLs] ([clubID], [clubName]) VALUES (N'GT', N'Guitar')
SET IDENTITY_INSERT [dbo].[tblComments] ON 

INSERT [dbo].[tblComments] ([commentID], [commentContent], [repliedTo], [eventID], [like], [commentBy], [commentDate]) VALUES (6, N'hiiii', NULL, N'AD1', 0, N'Admin', CAST(N'2021-10-27 19:44:24.150' AS DateTime))
INSERT [dbo].[tblComments] ([commentID], [commentContent], [repliedTo], [eventID], [like], [commentBy], [commentDate]) VALUES (7, N'Chào mọi ngườiiiiii', NULL, N'AD1', 0, N'Admin', CAST(N'2021-10-27 19:44:34.333' AS DateTime))
INSERT [dbo].[tblComments] ([commentID], [commentContent], [repliedTo], [eventID], [like], [commentBy], [commentDate]) VALUES (12, N'Chào nhaa
', NULL, N'AD3', 0, N'Admin', CAST(N'2021-10-28 15:30:39.550' AS DateTime))
INSERT [dbo].[tblComments] ([commentID], [commentContent], [repliedTo], [eventID], [like], [commentBy], [commentDate]) VALUES (13, N'Chào mọi người', NULL, N'AD3', 0, N'118199891969206437963', CAST(N'2021-10-28 16:05:27.930' AS DateTime))
INSERT [dbo].[tblComments] ([commentID], [commentContent], [repliedTo], [eventID], [like], [commentBy], [commentDate]) VALUES (8, N'dkasdjklasd', NULL, N'AD1', 0, N'Admin', CAST(N'2021-10-27 20:02:32.883' AS DateTime))
INSERT [dbo].[tblComments] ([commentID], [commentContent], [repliedTo], [eventID], [like], [commentBy], [commentDate]) VALUES (9, N'T không phải admin', NULL, N'AD1', 0, N'118199891969206437963', CAST(N'2021-10-27 20:06:54.470' AS DateTime))
INSERT [dbo].[tblComments] ([commentID], [commentContent], [repliedTo], [eventID], [like], [commentBy], [commentDate]) VALUES (10, N'Ui nhìn thích thế
', NULL, N'AD2', 0, N'Admin', CAST(N'2021-10-28 13:47:23.260' AS DateTime))
INSERT [dbo].[tblComments] ([commentID], [commentContent], [repliedTo], [eventID], [like], [commentBy], [commentDate]) VALUES (11, N'Hi hi hi
', NULL, N'AD11', 0, N'Admin', CAST(N'2021-10-28 14:39:49.357' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblComments] OFF
INSERT [dbo].[tblDms] ([dmID], [dmName]) VALUES (N'Test', NULL)
SET IDENTITY_INSERT [dbo].[tblEvent_Categories] ON 

INSERT [dbo].[tblEvent_Categories] ([id], [categoryID], [eventID]) VALUES (1, N'AN', N'AD1')
INSERT [dbo].[tblEvent_Categories] ([id], [categoryID], [eventID]) VALUES (2, N'TL', N'AD1')
INSERT [dbo].[tblEvent_Categories] ([id], [categoryID], [eventID]) VALUES (3, N'CLUBA', N'AD11')
INSERT [dbo].[tblEvent_Categories] ([id], [categoryID], [eventID]) VALUES (4, N'F&D', N'AD11')
INSERT [dbo].[tblEvent_Categories] ([id], [categoryID], [eventID]) VALUES (5, N'IP', N'AD11')
INSERT [dbo].[tblEvent_Categories] ([id], [categoryID], [eventID]) VALUES (6, N'CLUBA', N'AD10')
INSERT [dbo].[tblEvent_Categories] ([id], [categoryID], [eventID]) VALUES (7, N'F&D', N'AD10')
INSERT [dbo].[tblEvent_Categories] ([id], [categoryID], [eventID]) VALUES (8, N'AN', N'AD10')
SET IDENTITY_INSERT [dbo].[tblEvent_Categories] OFF
SET IDENTITY_INSERT [dbo].[tblEvent_Rooms] ON 

INSERT [dbo].[tblEvent_Rooms] ([roomID], [id], [eventID]) VALUES (N'041', 1, N'AD11')
INSERT [dbo].[tblEvent_Rooms] ([roomID], [id], [eventID]) VALUES (N'041', 2, N'AD10')
SET IDENTITY_INSERT [dbo].[tblEvent_Rooms] OFF
SET IDENTITY_INSERT [dbo].[tblEvent_Slots] ON 

INSERT [dbo].[tblEvent_Slots] ([id], [slotID], [eventID]) VALUES (1, N'1', N'AD1')
INSERT [dbo].[tblEvent_Slots] ([id], [slotID], [eventID]) VALUES (2, N'4', N'AD1')
INSERT [dbo].[tblEvent_Slots] ([id], [slotID], [eventID]) VALUES (3, N'1', N'AD11')
INSERT [dbo].[tblEvent_Slots] ([id], [slotID], [eventID]) VALUES (4, N'2', N'AD11')
INSERT [dbo].[tblEvent_Slots] ([id], [slotID], [eventID]) VALUES (5, N'3', N'AD11')
INSERT [dbo].[tblEvent_Slots] ([id], [slotID], [eventID]) VALUES (6, N'1', N'AD10')
INSERT [dbo].[tblEvent_Slots] ([id], [slotID], [eventID]) VALUES (7, N'3', N'AD10')
INSERT [dbo].[tblEvent_Slots] ([id], [slotID], [eventID]) VALUES (8, N'4', N'AD10')
SET IDENTITY_INSERT [dbo].[tblEvent_Slots] OFF
INSERT [dbo].[tblEvents] ([eventID], [eventName], [eventCreateDate], [eventStartDate], [userID], [statusID], [limitMember], [content], [clubID], [dmID], [like]) VALUES (N'AD1', N'Chênh Vênh', CAST(N'2021-10-25' AS Date), CAST(N'2021-10-11' AS Date), N'Admin', N'AC', 200, N'Tạm thời vậy thôi', NULL, NULL, 12)
INSERT [dbo].[tblEvents] ([eventID], [eventName], [eventCreateDate], [eventStartDate], [userID], [statusID], [limitMember], [content], [clubID], [dmID], [like]) VALUES (N'AD10', N'Ngày hội sác màu', CAST(N'2021-10-28' AS Date), CAST(N'2021-10-31' AS Date), N'118199891969206437963', N'AC', 200, N'   Gần đây mình đã xây dựng một dự án cho khách hàng và khách hang sử dụng GitHub để quản lý source code.  Mình thực hiện forked (clone source code) từ branch master của khách hàng về tài khoản GitHub của mình để tiến hành chỉnh sửa source code trên đó.', NULL, NULL, 0)
INSERT [dbo].[tblEvents] ([eventID], [eventName], [eventCreateDate], [eventStartDate], [userID], [statusID], [limitMember], [content], [clubID], [dmID], [like]) VALUES (N'AD11', N'Hoi du', CAST(N'2021-10-28' AS Date), CAST(N'2021-10-29' AS Date), N'Admin', N'AC', 250, N' sadsadsadsadsadsdasdsadsa', NULL, NULL, 0)
INSERT [dbo].[tblEvents] ([eventID], [eventName], [eventCreateDate], [eventStartDate], [userID], [statusID], [limitMember], [content], [clubID], [dmID], [like]) VALUES (N'AD2', N'Ngôi sao đang lớn', CAST(N'2021-10-25' AS Date), CAST(N'2021-11-01' AS Date), N'Admin', N'AC', 400, N'Tạm z cái đã', NULL, NULL, 44)
INSERT [dbo].[tblEvents] ([eventID], [eventName], [eventCreateDate], [eventStartDate], [userID], [statusID], [limitMember], [content], [clubID], [dmID], [like]) VALUES (N'AD3', N'Event mỗi tuần', CAST(N'2021-10-25' AS Date), CAST(N'2021-11-20' AS Date), N'Admin', N'AC', 400, N'Mỗi tuần lại gặp', NULL, NULL, 21)
INSERT [dbo].[tblEvents] ([eventID], [eventName], [eventCreateDate], [eventStartDate], [userID], [statusID], [limitMember], [content], [clubID], [dmID], [like]) VALUES (N'AD6', N'Bạn lại hát cùng tôi ', CAST(N'2021-10-25' AS Date), CAST(N'2021-10-29' AS Date), N'Admin', N'AC', 300, N'Lại hát cùng nhau', NULL, NULL, 111)
INSERT [dbo].[tblEvents] ([eventID], [eventName], [eventCreateDate], [eventStartDate], [userID], [statusID], [limitMember], [content], [clubID], [dmID], [like]) VALUES (N'AD7', N'Mãi mãi nhớ tên nhau', CAST(N'2021-10-25' AS Date), CAST(N'2021-12-22' AS Date), N'Admin', N'AC', 350, N'Chụp hình cùng anh em chí cốt', NULL, NULL, 301)
INSERT [dbo].[tblEvents] ([eventID], [eventName], [eventCreateDate], [eventStartDate], [userID], [statusID], [limitMember], [content], [clubID], [dmID], [like]) VALUES (N'CL4', N'Ai là người may mắn', CAST(N'2021-10-25' AS Date), CAST(N'2021-12-03' AS Date), N'Cocsaigon', N'AC', 300, N'Xem xem đứa nào may mắn', N'CL001', NULL, 33)
INSERT [dbo].[tblEvents] ([eventID], [eventName], [eventCreateDate], [eventStartDate], [userID], [statusID], [limitMember], [content], [clubID], [dmID], [like]) VALUES (N'CL5', N'Hòa âm ánh sáng', CAST(N'2021-10-25' AS Date), CAST(N'2021-11-12' AS Date), N'Cocsaigon', N'AC', 120, N'Ném hoa mắt đồng đội', N'CL001', NULL, 123)
INSERT [dbo].[tblEvents] ([eventID], [eventName], [eventCreateDate], [eventStartDate], [userID], [statusID], [limitMember], [content], [clubID], [dmID], [like]) VALUES (N'CL8', N'Độc thoại Tài năng', CAST(N'2021-10-25' AS Date), CAST(N'2021-11-15' AS Date), N'Cocsaigon', N'AC', 250, N'1 mình làm mọi người cười haha', N'CL001', NULL, 227)
SET IDENTITY_INSERT [dbo].[tblImages] ON 

INSERT [dbo].[tblImages] ([image], [link], [userID], [eventID], [id]) VALUES (NULL, N'an-phuket-beach-venue-theme1.jpg', NULL, N'AD1', 9)
INSERT [dbo].[tblImages] ([image], [link], [userID], [eventID], [id]) VALUES (NULL, N'an-phuket-beach-venue-theme1.jpg', NULL, N'AD2', 10)
INSERT [dbo].[tblImages] ([image], [link], [userID], [eventID], [id]) VALUES (NULL, N'an-phuket-beach-venue-theme1.jpg', NULL, N'AD3', 11)
INSERT [dbo].[tblImages] ([image], [link], [userID], [eventID], [id]) VALUES (NULL, N'an-phuket-beach-venue-theme1.jpg', NULL, N'AD6', 12)
INSERT [dbo].[tblImages] ([image], [link], [userID], [eventID], [id]) VALUES (NULL, N'an-phuket-beach-venue-theme1.jpg', NULL, N'AD7', 13)
INSERT [dbo].[tblImages] ([image], [link], [userID], [eventID], [id]) VALUES (NULL, N'an-phuket-beach-venue-theme1.jpg', NULL, N'CL4', 14)
INSERT [dbo].[tblImages] ([image], [link], [userID], [eventID], [id]) VALUES (NULL, N'an-phuket-beach-venue-theme1.jpg', NULL, N'CL5', 15)
INSERT [dbo].[tblImages] ([image], [link], [userID], [eventID], [id]) VALUES (NULL, N'an-phuket-beach-venue-theme1.jpg', NULL, N'CL8', 16)
INSERT [dbo].[tblImages] ([image], [link], [userID], [eventID], [id]) VALUES (NULL, N'images.jpg', NULL, N'AD11', 17)
INSERT [dbo].[tblImages] ([image], [link], [userID], [eventID], [id]) VALUES (NULL, N'images.jpg', NULL, N'AD10', 18)
SET IDENTITY_INSERT [dbo].[tblImages] OFF
INSERT [dbo].[tblMajors] ([majorID], [majorName]) VALUES (N'', N'test')
INSERT [dbo].[tblMajors] ([majorID], [majorName]) VALUES (N'CNL', N'China Languague')
INSERT [dbo].[tblMajors] ([majorID], [majorName]) VALUES (N'DS', N'Designer')
INSERT [dbo].[tblMajors] ([majorID], [majorName]) VALUES (N'JPL', N'Japan Languague')
INSERT [dbo].[tblMajors] ([majorID], [majorName]) VALUES (N'SE', N'SoftWare Energiring')
INSERT [dbo].[tblMajors] ([majorID], [majorName]) VALUES (N'SM', N'Social media')
INSERT [dbo].[tblReports] ([reportID], [reportDetail], [userID]) VALUES (N'15', N'test', NULL)
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'CL', N'Club''s Leader')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'DM', N'Department Manager')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'GU', N'Guest')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'LM', N'Lecture/Mentor')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'ST', N'Student')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'001', N'15        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'004', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'005', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'006', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'007', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'008', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'009', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'010', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'011', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'012', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'013', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'014', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'015', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'020', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'021', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'022', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'023', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'024', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'025', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'028', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'029', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'033', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'034', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'035', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'036', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'037', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'039', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'040', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'041', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'042', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'044', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'045', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'104', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'105', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'106', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'108', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'109', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'110', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'111', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'112', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'115', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'116', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'117', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'118', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'119', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'120', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'121', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'122', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'123', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'124', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'125', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'126', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'127', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'130', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'131', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'132', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'133', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'134', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'136', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'137', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'202', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'203', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'204', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'205', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'206', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'207', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'208', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'209', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'211', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'212', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'213', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'219', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'220', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'221', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'222', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'223', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'225', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'226', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'227', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'230', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'231', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'232', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'233', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'234', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'301', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'302', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'303', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'304', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'305', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'306', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'307', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'310', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'311', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'312', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'313', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'314', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'315', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'404', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'406', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'407', N'20        ')
GO
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'408', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'409', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'410', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'412', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'413', N'20        ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'Hall A', N'150       ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'Hall B', N'150       ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'Lotus pond', N'150       ')
INSERT [dbo].[tblRooms] ([roomID], [maxCapacity]) VALUES (N'Yard', N'150       ')
INSERT [dbo].[tblSlots] ([slotID], [startTime], [endTime]) VALUES (N'1', N'7h00', N'8h30')
INSERT [dbo].[tblSlots] ([slotID], [startTime], [endTime]) VALUES (N'2', N'8h45', N'10h15')
INSERT [dbo].[tblSlots] ([slotID], [startTime], [endTime]) VALUES (N'3', N'10h30', N'12h00')
INSERT [dbo].[tblSlots] ([slotID], [startTime], [endTime]) VALUES (N'4', N'12h30', N'14h00')
INSERT [dbo].[tblSlots] ([slotID], [startTime], [endTime]) VALUES (N'5', N'14h15', N'15h45')
INSERT [dbo].[tblSlots] ([slotID], [startTime], [endTime]) VALUES (N'6', N'16h00', N'17h30')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'AC', N'Active')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'NA', N'Non-Active')
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID], [address], [phoneNumber], [email], [statusID], [majorID], [clubID], [dmID], [avtLink]) VALUES (N'118199891969206437963', N'not yet', N'*****', N'ST', N'', N'', N'phathtse151196@fpt.edu.vn', N'AC', NULL, NULL, NULL, N'event-user-photo\245984553_655202215447505_4776303464394714797_n.jpg')
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID], [address], [phoneNumber], [email], [statusID], [majorID], [clubID], [dmID], [avtLink]) VALUES (N'Admin', N'Phat Huynhhhhhhh', N'123', N'AD', N'dasdsadsasadsadsadsad', N'654523465865', N'phat@fpt.edu.vn', N'AC', N'SE', N'GT', NULL, N'phatavatar.jpg')
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID], [address], [phoneNumber], [email], [statusID], [majorID], [clubID], [dmID], [avtLink]) VALUES (N'Cocsaigon', N'Cóc Sài Gòn', N'123', N'CL', N'FPT quận 9', N'0943256234', N'cócaigon@fpt.edu.vn', N'AC', N'SM', N'CL001', NULL, NULL)
ALTER TABLE [dbo].[tblComments]  WITH CHECK ADD  CONSTRAINT [FK_tblComments_tblEvents] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvents] ([eventID])
GO
ALTER TABLE [dbo].[tblComments] CHECK CONSTRAINT [FK_tblComments_tblEvents]
GO
ALTER TABLE [dbo].[tblComments]  WITH CHECK ADD  CONSTRAINT [FK_tblComments_tblUsers1] FOREIGN KEY([repliedTo])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblComments] CHECK CONSTRAINT [FK_tblComments_tblUsers1]
GO
ALTER TABLE [dbo].[tblComments]  WITH CHECK ADD  CONSTRAINT [FK_tblComments_tblUsers2] FOREIGN KEY([commentBy])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblComments] CHECK CONSTRAINT [FK_tblComments_tblUsers2]
GO
ALTER TABLE [dbo].[tblEvent_Categories]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_Categories_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblEvent_Categories] CHECK CONSTRAINT [FK_tblEvent_Categories_tblCategory]
GO
ALTER TABLE [dbo].[tblEvent_Categories]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_Categories_tblEvents] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvents] ([eventID])
GO
ALTER TABLE [dbo].[tblEvent_Categories] CHECK CONSTRAINT [FK_tblEvent_Categories_tblEvents]
GO
ALTER TABLE [dbo].[tblEvent_Rooms]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_Rooms_tblEvents] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvents] ([eventID])
GO
ALTER TABLE [dbo].[tblEvent_Rooms] CHECK CONSTRAINT [FK_tblEvent_Rooms_tblEvents]
GO
ALTER TABLE [dbo].[tblEvent_Rooms]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_Rooms_tblRooms] FOREIGN KEY([roomID])
REFERENCES [dbo].[tblRooms] ([roomID])
GO
ALTER TABLE [dbo].[tblEvent_Rooms] CHECK CONSTRAINT [FK_tblEvent_Rooms_tblRooms]
GO
ALTER TABLE [dbo].[tblEvent_Slots]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_Slots_tblEvents] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvents] ([eventID])
GO
ALTER TABLE [dbo].[tblEvent_Slots] CHECK CONSTRAINT [FK_tblEvent_Slots_tblEvents]
GO
ALTER TABLE [dbo].[tblEvent_Slots]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_Slots_tblSlots] FOREIGN KEY([slotID])
REFERENCES [dbo].[tblSlots] ([slotID])
GO
ALTER TABLE [dbo].[tblEvent_Slots] CHECK CONSTRAINT [FK_tblEvent_Slots_tblSlots]
GO
ALTER TABLE [dbo].[tblEvents]  WITH CHECK ADD  CONSTRAINT [FK_tblEvents_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblEvents] CHECK CONSTRAINT [FK_tblEvents_tblStatus]
GO
ALTER TABLE [dbo].[tblEvents]  WITH CHECK ADD  CONSTRAINT [FK_tblEvents_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblEvents] CHECK CONSTRAINT [FK_tblEvents_tblUsers]
GO
ALTER TABLE [dbo].[tblFollows]  WITH CHECK ADD  CONSTRAINT [FK_tblFollows_tblEvents] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvents] ([eventID])
GO
ALTER TABLE [dbo].[tblFollows] CHECK CONSTRAINT [FK_tblFollows_tblEvents]
GO
ALTER TABLE [dbo].[tblFollows]  WITH CHECK ADD  CONSTRAINT [FK_tblFollows_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblFollows] CHECK CONSTRAINT [FK_tblFollows_tblUsers]
GO
ALTER TABLE [dbo].[tblImages]  WITH CHECK ADD  CONSTRAINT [FK_tblImages_tblEvents] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvents] ([eventID])
GO
ALTER TABLE [dbo].[tblImages] CHECK CONSTRAINT [FK_tblImages_tblEvents]
GO
ALTER TABLE [dbo].[tblImages]  WITH CHECK ADD  CONSTRAINT [FK_tblImages_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblImages] CHECK CONSTRAINT [FK_tblImages_tblUsers]
GO
ALTER TABLE [dbo].[tblJoins]  WITH CHECK ADD  CONSTRAINT [FK_tblJoins_tblEvents] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvents] ([eventID])
GO
ALTER TABLE [dbo].[tblJoins] CHECK CONSTRAINT [FK_tblJoins_tblEvents]
GO
ALTER TABLE [dbo].[tblJoins]  WITH CHECK ADD  CONSTRAINT [FK_tblJoins_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblJoins] CHECK CONSTRAINT [FK_tblJoins_tblUsers]
GO
ALTER TABLE [dbo].[tblReports]  WITH CHECK ADD  CONSTRAINT [FK_tblReports_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblReports] CHECK CONSTRAINT [FK_tblReports_tblUsers]
GO
ALTER TABLE [dbo].[tblUser_Categories]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_Categories_tblCategory] FOREIGN KEY([interestedID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblUser_Categories] CHECK CONSTRAINT [FK_tblUser_Categories_tblCategory]
GO
ALTER TABLE [dbo].[tblUser_Categories]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_Categories_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblUser_Categories] CHECK CONSTRAINT [FK_tblUser_Categories_tblUsers]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblCLs] FOREIGN KEY([clubID])
REFERENCES [dbo].[tblCLs] ([clubID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblCLs]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblDms] FOREIGN KEY([dmID])
REFERENCES [dbo].[tblDms] ([dmID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblDms]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblMajors1] FOREIGN KEY([majorID])
REFERENCES [dbo].[tblMajors] ([majorID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblMajors1]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [EventManagement_2] SET  READ_WRITE 
GO

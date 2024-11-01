USE [master]
GO
/****** Object:  Database [EdunextSystemDB]    Script Date: 10/31/2024 10:51:10 PM ******/
CREATE DATABASE [EdunextSystemDB]
Go
USE [EdunextSystemDB]
GO
ALTER DATABASE [EdunextSystemDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EdunextSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EdunextSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EdunextSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EdunextSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EdunextSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EdunextSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EdunextSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EdunextSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [EdunextSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EdunextSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EdunextSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EdunextSystemDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EdunextSystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EdunextSystemDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EdunextSystemDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [EdunextSystemDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EdunextSystemDB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[userID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[answerID] [int] IDENTITY(1,1) NOT NULL,
	[questionID] [int] NULL,
	[answerContent] [nvarchar](max) NOT NULL,
	[createdDate] [date] NULL,
	[isDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK__Answers__6836B89432F0410B] PRIMARY KEY CLUSTERED 
(
	[answerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classrooms]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classrooms](
	[classID] [int] NOT NULL,
	[className] [nvarchar](100) NOT NULL,
	[createdDate] [date] NULL,
	[updatedDate] [date] NULL,
	[isDeleted] [bit] NOT NULL,
	[semester] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseInClass]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseInClass](
	[classID] [int] NOT NULL,
	[courseID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseID] ASC,
	[classID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[courseID] [int] NOT NULL,
	[courseName] [nvarchar](100) NOT NULL,
	[createdDate] [date] NULL,
	[updatedDate] [date] NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[userID] [int] NOT NULL,
	[classID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[classID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managing]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managing](
	[userID] [int] NOT NULL,
	[classID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[classID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[materialID] [int] NOT NULL,
	[slotID] [int] NULL,
	[materialName] [nvarchar](100) NOT NULL,
	[createdDate] [date] NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[materialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[questionID] [int] NOT NULL,
	[slotID] [int] NULL,
	[questionTitle] [nvarchar](100) NOT NULL,
	[questionContent] [nvarchar](max) NOT NULL,
	[createdDate] [date] NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[reportID] [int] NOT NULL,
	[reportTitle] [nvarchar](100) NOT NULL,
	[reportDetail] [nvarchar](max) NOT NULL,
	[createdDate] [date] NULL,
	[isSolved] [bit] NOT NULL,
	[isRead] [bit] NULL,
	[solvedDate] [date] NULL,
	[createdBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slots]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slots](
	[slotID] [int] NOT NULL,
	[courseID] [int] NULL,
	[slotName] [nvarchar](100) NOT NULL,
	[createdDate] [date] NULL,
	[updatedDate] [date] NULL,
	[message] [nvarchar](max) NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[slotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGroups]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroups](
	[studentGroupID] [int] NOT NULL,
	[slotID] [int] NULL,
	[studentGroupName] [nvarchar](100) NOT NULL,
	[numberOfStudents] [int] NOT NULL,
	[createdDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[studentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teaching]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teaching](
	[userID] [int] NOT NULL,
	[classID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[classID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/31/2024 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[birthdate] [date] NULL,
	[joinedDate] [date] NOT NULL,
	[roleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([username], [password], [userID]) VALUES (N'janesmith', N'password2', 2)
INSERT [dbo].[Accounts] ([username], [password], [userID]) VALUES (N'johndoe', N'password1', 1)
INSERT [dbo].[Accounts] ([username], [password], [userID]) VALUES (N'michaelj', N'password3', 3)
GO
SET IDENTITY_INSERT [dbo].[Answers] ON 

INSERT [dbo].[Answers] ([answerID], [questionID], [answerContent], [createdDate], [isDeleted], [CreatedBy]) VALUES (1, 1, N'Calculus is a branch of mathematics that deals with derivatives and integrals.', CAST(N'2020-01-02' AS Date), 0, 3)
INSERT [dbo].[Answers] ([answerID], [questionID], [answerContent], [createdDate], [isDeleted], [CreatedBy]) VALUES (2, 2, N'Rome was founded by Romulus and Remus according to Roman mythology.', CAST(N'2020-01-02' AS Date), 0, 3)
INSERT [dbo].[Answers] ([answerID], [questionID], [answerContent], [createdDate], [isDeleted], [CreatedBy]) VALUES (3, 3, N'Newton''s first law of motion states that an object will remain at rest or in uniform motion unless acted upon by an external force.', CAST(N'2020-01-02' AS Date), 0, 3)
SET IDENTITY_INSERT [dbo].[Answers] OFF
GO
INSERT [dbo].[Classrooms] ([classID], [className], [createdDate], [updatedDate], [isDeleted], [semester]) VALUES (1, N'Class A', CAST(N'2020-01-01' AS Date), NULL, 0, N'Spring')
INSERT [dbo].[Classrooms] ([classID], [className], [createdDate], [updatedDate], [isDeleted], [semester]) VALUES (2, N'Class B', CAST(N'2020-01-01' AS Date), NULL, 0, N'Fall')
INSERT [dbo].[Classrooms] ([classID], [className], [createdDate], [updatedDate], [isDeleted], [semester]) VALUES (3, N'Class C', CAST(N'2020-01-01' AS Date), NULL, 0, N'Summer')
GO
INSERT [dbo].[CourseInClass] ([classID], [courseID]) VALUES (1, 1)
INSERT [dbo].[CourseInClass] ([classID], [courseID]) VALUES (2, 2)
INSERT [dbo].[CourseInClass] ([classID], [courseID]) VALUES (3, 3)
GO
INSERT [dbo].[Courses] ([courseID], [courseName], [createdDate], [updatedDate], [isDeleted]) VALUES (1, N'Mathematics', CAST(N'2020-01-01' AS Date), NULL, 0)
INSERT [dbo].[Courses] ([courseID], [courseName], [createdDate], [updatedDate], [isDeleted]) VALUES (2, N'History', CAST(N'2020-01-01' AS Date), NULL, 0)
INSERT [dbo].[Courses] ([courseID], [courseName], [createdDate], [updatedDate], [isDeleted]) VALUES (3, N'Physics', CAST(N'2020-01-01' AS Date), NULL, 0)
GO
INSERT [dbo].[Enrollment] ([userID], [classID]) VALUES (1, 1)
INSERT [dbo].[Enrollment] ([userID], [classID]) VALUES (2, 2)
INSERT [dbo].[Enrollment] ([userID], [classID]) VALUES (3, 3)
GO
INSERT [dbo].[Managing] ([userID], [classID]) VALUES (1, 1)
INSERT [dbo].[Managing] ([userID], [classID]) VALUES (3, 3)
GO
INSERT [dbo].[Materials] ([materialID], [slotID], [materialName], [createdDate], [isDeleted]) VALUES (1, 1, N'Calculus Notes', CAST(N'2020-01-01' AS Date), 0)
INSERT [dbo].[Materials] ([materialID], [slotID], [materialName], [createdDate], [isDeleted]) VALUES (2, 2, N'History Textbook', CAST(N'2020-01-01' AS Date), 0)
INSERT [dbo].[Materials] ([materialID], [slotID], [materialName], [createdDate], [isDeleted]) VALUES (3, 3, N'Physics Lab Manual', CAST(N'2020-01-01' AS Date), 0)
GO
INSERT [dbo].[Questions] ([questionID], [slotID], [questionTitle], [questionContent], [createdDate], [isDeleted]) VALUES (1, 1, N'Math Question 1', N'What is calculus?', CAST(N'2024-01-01' AS Date), 0)
INSERT [dbo].[Questions] ([questionID], [slotID], [questionTitle], [questionContent], [createdDate], [isDeleted]) VALUES (2, 2, N'History Question 1', N'Who founded Rome?', CAST(N'2024-01-01' AS Date), 0)
INSERT [dbo].[Questions] ([questionID], [slotID], [questionTitle], [questionContent], [createdDate], [isDeleted]) VALUES (3, 3, N'Physics Question 1', N'What is Newton''s first law of motion?', CAST(N'2024-01-01' AS Date), 0)
INSERT [dbo].[Questions] ([questionID], [slotID], [questionTitle], [questionContent], [createdDate], [isDeleted]) VALUES (4, 1, N'Math Question2', N'What is minus?', CAST(N'2024-10-29' AS Date), 0)
INSERT [dbo].[Questions] ([questionID], [slotID], [questionTitle], [questionContent], [createdDate], [isDeleted]) VALUES (5, 1, N'Math Question3', N'What is Add?', CAST(N'2024-10-29' AS Date), 0)
GO
INSERT [dbo].[Reports] ([reportID], [reportTitle], [reportDetail], [createdDate], [isSolved], [isRead], [solvedDate], [createdBy]) VALUES (1, N'Download Material Problem', N'Unable to download material.', CAST(N'2024-10-28' AS Date), 0, 0, CAST(N'2024-10-29' AS Date), 2)
INSERT [dbo].[Reports] ([reportID], [reportTitle], [reportDetail], [createdDate], [isSolved], [isRead], [solvedDate], [createdBy]) VALUES (2, N'Cant Answer Questions', N'Experience error when trying to answer questions.', CAST(N'2024-10-28' AS Date), 1, 1, CAST(N'2024-10-29' AS Date), 2)
INSERT [dbo].[Reports] ([reportID], [reportTitle], [reportDetail], [createdDate], [isSolved], [isRead], [solvedDate], [createdBy]) VALUES (3, N'Pages doesnt load properly', N'Some pages doesnt load properly when accessing', CAST(N'2024-10-28' AS Date), 0, 1, CAST(N'2024-10-29' AS Date), 3)
GO
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (2, N'Teacher')
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (3, N'Student')
GO
INSERT [dbo].[Slots] ([slotID], [courseID], [slotName], [createdDate], [updatedDate], [message], [isDeleted]) VALUES (1, 1, N'Math Lecture', CAST(N'2020-01-01' AS Date), NULL, N'Lecture on introductory mathematics', 0)
INSERT [dbo].[Slots] ([slotID], [courseID], [slotName], [createdDate], [updatedDate], [message], [isDeleted]) VALUES (2, 2, N'History Seminar', CAST(N'2020-01-01' AS Date), NULL, N'Seminar on Ancient History', 0)
INSERT [dbo].[Slots] ([slotID], [courseID], [slotName], [createdDate], [updatedDate], [message], [isDeleted]) VALUES (3, 3, N'Physics Lab', CAST(N'2020-01-01' AS Date), NULL, N'Laboratory session on physics experiments', 0)
GO
INSERT [dbo].[StudentGroups] ([studentGroupID], [slotID], [studentGroupName], [numberOfStudents], [createdDate]) VALUES (1, 1, N'Math Club', 20, CAST(N'2020-01-01' AS Date))
INSERT [dbo].[StudentGroups] ([studentGroupID], [slotID], [studentGroupName], [numberOfStudents], [createdDate]) VALUES (2, 2, N'History Society', 15, CAST(N'2020-01-01' AS Date))
INSERT [dbo].[StudentGroups] ([studentGroupID], [slotID], [studentGroupName], [numberOfStudents], [createdDate]) VALUES (3, 3, N'Physics Team', 25, CAST(N'2020-01-01' AS Date))
GO
INSERT [dbo].[Teaching] ([userID], [classID]) VALUES (1, 1)
INSERT [dbo].[Teaching] ([userID], [classID]) VALUES (2, 2)
GO
INSERT [dbo].[Users] ([userID], [name], [email], [birthdate], [joinedDate], [roleID]) VALUES (1, N'John Doe', N'john.doe@example.com', CAST(N'1990-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1)
INSERT [dbo].[Users] ([userID], [name], [email], [birthdate], [joinedDate], [roleID]) VALUES (2, N'Jane Smith', N'jane.smith@example.com', CAST(N'1992-05-15' AS Date), CAST(N'2020-01-01' AS Date), 2)
INSERT [dbo].[Users] ([userID], [name], [email], [birthdate], [joinedDate], [roleID]) VALUES (3, N'Michael Johnson', N'michael.johnson@example.com', CAST(N'1985-09-30' AS Date), CAST(N'2020-01-01' AS Date), 3)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E6164065F9876]    Script Date: 10/31/2024 10:51:11 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK__Answers__questio__49C3F6B7] FOREIGN KEY([questionID])
REFERENCES [dbo].[Questions] ([questionID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK__Answers__questio__49C3F6B7]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Users_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Users_CreatedBy]
GO
ALTER TABLE [dbo].[CourseInClass]  WITH CHECK ADD FOREIGN KEY([classID])
REFERENCES [dbo].[Classrooms] ([classID])
GO
ALTER TABLE [dbo].[CourseInClass]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD FOREIGN KEY([classID])
REFERENCES [dbo].[Classrooms] ([classID])
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Managing]  WITH CHECK ADD FOREIGN KEY([classID])
REFERENCES [dbo].[Classrooms] ([classID])
GO
ALTER TABLE [dbo].[Managing]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD FOREIGN KEY([slotID])
REFERENCES [dbo].[Slots] ([slotID])
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD FOREIGN KEY([slotID])
REFERENCES [dbo].[Slots] ([slotID])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([createdBy])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Slots]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
GO
ALTER TABLE [dbo].[StudentGroups]  WITH CHECK ADD FOREIGN KEY([slotID])
REFERENCES [dbo].[Slots] ([slotID])
GO
ALTER TABLE [dbo].[Teaching]  WITH CHECK ADD FOREIGN KEY([classID])
REFERENCES [dbo].[Classrooms] ([classID])
GO
ALTER TABLE [dbo].[Teaching]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [EdunextSystemDB] SET  READ_WRITE 
GO

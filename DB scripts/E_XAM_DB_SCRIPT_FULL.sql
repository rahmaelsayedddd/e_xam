USE [master]
GO
/****** Object:  Database [e_xam_DB]    Script Date: 2/4/2025 11:56:18 PM ******/
CREATE DATABASE [e_xam_DB]
GO
/****** Object:  UserDefinedTableType [dbo].[examTracks]    Script Date: 2/4/2025 11:56:22 PM ******/
CREATE TYPE [dbo].[examTracks] AS TABLE(
	[Id] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[questionAnswer]    Script Date: 2/4/2025 11:56:22 PM ******/
CREATE TYPE [dbo].[questionAnswer] AS TABLE(
	[questionId] [int] NULL,
	[answerNum] [char](1) NULL
)
GO
/****** Object:  Table [dbo].[answer_sheets]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer_sheets](
	[std_id] [int] NOT NULL,
	[ex_id] [int] NOT NULL,
	[q_id] [int] NOT NULL,
	[ans] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[std_id] ASC,
	[ex_id] ASC,
	[q_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[id] [int] IDENTITY(10,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[mgr_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ex_q]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ex_q](
	[q_id] [int] NOT NULL,
	[ex_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[q_id] ASC,
	[ex_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exams]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[duration] [int] NOT NULL,
	[title] [varchar](20) NULL,
	[total_degree] [int] NOT NULL,
	[crs_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructors]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructors](
	[user_id] [int] NOT NULL,
	[salary] [decimal](10, 2) NULL,
	[dept_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[options]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[options](
	[num] [char](1) NOT NULL,
	[q_id] [int] NOT NULL,
	[body] [varchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[num] ASC,
	[q_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questions]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[body] [varchar](1000) NOT NULL,
	[mark] [int] NOT NULL,
	[type] [char](1) NOT NULL,
	[ans] [char](1) NOT NULL,
	[crs_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[std_ex]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[std_ex](
	[ex_id] [int] NOT NULL,
	[std_id] [int] NOT NULL,
	[grade] [int] NULL,
	[state] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ex_id] ASC,
	[std_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[user_id] [int] NOT NULL,
	[gpa] [decimal](4, 2) NULL,
	[track_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topics]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topics](
	[crs_id] [int] NOT NULL,
	[topic] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[crs_id] ASC,
	[topic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[track_crs]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[track_crs](
	[track_id] [int] NOT NULL,
	[crs_id] [int] NOT NULL,
	[inst_id] [int] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[track_id] ASC,
	[crs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[track_exams]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[track_exams](
	[track_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tracks]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tracks](
	[id] [int] IDENTITY(100,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2/4/2025 11:56:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[first_name] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[pw] [varchar](20) NOT NULL,
	[type] [char](1) NOT NULL,
	[gender] [char](1) NOT NULL,
	[ssn] [varchar](14) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 42, 104, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 42, 107, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 42, 110, N'A')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 42, 111, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 42, 112, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 42, 115, N'T')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 42, 563, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 45, 2, N'D')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 45, 3, N'C')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 45, 5, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 45, 14, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 45, 18, N'T')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 45, 21, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 46, 63, N'D')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 46, 64, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 46, 66, N'A')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 46, 68, N'C')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 46, 77, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 46, 79, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 46, 81, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 93, 102, N'A')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 93, 103, N'D')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 93, 105, N'C')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 93, 106, N'A')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 93, 107, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 93, 108, N'C')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 93, 112, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 93, 113, N'T')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 93, 116, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 102, 42, N'A')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 102, 43, N'A')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 102, 46, N'C')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 102, 47, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 102, 48, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 102, 50, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 102, 52, N'T')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 102, 53, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 102, 55, N'T')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 102, 60, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 105, 246, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 105, 248, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 105, 249, N'A')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 105, 250, N'D')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 105, 251, N'C')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 105, 254, N'T')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 105, 256, N'T')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10001, 105, 259, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10020, 46, 63, N'D')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10020, 46, 64, N'B')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10020, 46, 66, N'A')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10020, 46, 68, N'A')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10020, 46, 77, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10020, 46, 79, N'F')
INSERT [dbo].[answer_sheets] ([std_id], [ex_id], [q_id], [ans]) VALUES (10020, 46, 81, N'F')
GO
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([id], [name]) VALUES (1014, N'Android Development')
INSERT [dbo].[courses] ([id], [name]) VALUES (1024, N'Business Objects Webi / Univers')
INSERT [dbo].[courses] ([id], [name]) VALUES (1020, N'Data Analysis')
INSERT [dbo].[courses] ([id], [name]) VALUES (1021, N'Data Science Toolkit')
INSERT [dbo].[courses] ([id], [name]) VALUES (1025, N'Data Warehousing')
INSERT [dbo].[courses] ([id], [name]) VALUES (1019, N'Database Systems')
INSERT [dbo].[courses] ([id], [name]) VALUES (1032, N'Deep Learning')
INSERT [dbo].[courses] ([id], [name]) VALUES (1018, N'Design Thinking')
INSERT [dbo].[courses] ([id], [name]) VALUES (1026, N'Enterprise Systems')
INSERT [dbo].[courses] ([id], [name]) VALUES (1027, N'Financial Accounting')
INSERT [dbo].[courses] ([id], [name]) VALUES (1023, N'Informatica PowerCenter Basics')
INSERT [dbo].[courses] ([id], [name]) VALUES (1022, N'Introduction to Modeling & Operations Research')
INSERT [dbo].[courses] ([id], [name]) VALUES (1008, N'Introduction to Programming')
INSERT [dbo].[courses] ([id], [name]) VALUES (1010, N'Introduction to Software Engineering')
INSERT [dbo].[courses] ([id], [name]) VALUES (1015, N'Java Programming Language')
INSERT [dbo].[courses] ([id], [name]) VALUES (1013, N'Kotlin Programming Language')
INSERT [dbo].[courses] ([id], [name]) VALUES (1012, N'MySQL Database')
INSERT [dbo].[courses] ([id], [name]) VALUES (1009, N'OOP')
INSERT [dbo].[courses] ([id], [name]) VALUES (1007, N'Operating Systems Fundamentals')
INSERT [dbo].[courses] ([id], [name]) VALUES (1011, N'PHP Programming')
INSERT [dbo].[courses] ([id], [name]) VALUES (1034, N'Probability and Statistics')
INSERT [dbo].[courses] ([id], [name]) VALUES (1028, N'Project Management')
INSERT [dbo].[courses] ([id], [name]) VALUES (1030, N'Software Quality Assurance Essentials')
INSERT [dbo].[courses] ([id], [name]) VALUES (1016, N'Spring Framework')
INSERT [dbo].[courses] ([id], [name]) VALUES (1033, N'Supervised Learning')
INSERT [dbo].[courses] ([id], [name]) VALUES (1031, N'Testing Analysis and Automation')
INSERT [dbo].[courses] ([id], [name]) VALUES (1029, N'Testing Concepts')
INSERT [dbo].[courses] ([id], [name]) VALUES (1017, N'UI/UX Design')
SET IDENTITY_INSERT [dbo].[courses] OFF
GO
SET IDENTITY_INSERT [dbo].[departments] ON 

INSERT [dbo].[departments] ([id], [name], [mgr_id]) VALUES (18, N'SD', 10046)
INSERT [dbo].[departments] ([id], [name], [mgr_id]) VALUES (19, N'IS', 10057)
INSERT [dbo].[departments] ([id], [name], [mgr_id]) VALUES (20, N'QA', 10052)
INSERT [dbo].[departments] ([id], [name], [mgr_id]) VALUES (21, N'AI', 10048)
SET IDENTITY_INSERT [dbo].[departments] OFF
GO
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (2, 45)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (2, 87)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (2, 96)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (2, 97)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (2, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (3, 45)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (3, 88)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (3, 97)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (3, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (4, 96)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (4, 97)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (4, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (5, 44)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (5, 45)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (5, 87)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (5, 88)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (5, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (6, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (7, 87)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (7, 88)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (7, 96)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (7, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (8, 87)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (8, 88)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (8, 96)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (8, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (9, 88)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (9, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (10, 44)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (10, 96)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (10, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (11, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (12, 87)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (12, 88)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (12, 96)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (12, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (13, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (14, 44)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (14, 45)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (14, 87)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (14, 88)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (14, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (15, 44)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (15, 88)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (15, 96)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (15, 97)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (15, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (16, 87)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (16, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (17, 87)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (17, 97)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (17, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (18, 45)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (18, 88)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (18, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (19, 96)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (19, 97)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (19, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (20, 87)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (20, 97)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (20, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (21, 44)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (21, 45)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (21, 88)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (21, 98)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (42, 102)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (42, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (43, 102)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (43, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (44, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (45, 103)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (45, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (46, 102)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (46, 103)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (46, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (47, 102)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (47, 103)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (47, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (48, 102)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (48, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (49, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (50, 102)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (50, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (51, 103)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (51, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (52, 102)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (52, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (53, 102)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (53, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (54, 103)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (54, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (55, 102)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (55, 103)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (55, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (56, 103)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (56, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (57, 103)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (57, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (58, 103)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (58, 104)
GO
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (59, 103)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (59, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (60, 102)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (60, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (61, 104)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (63, 46)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (64, 46)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (66, 46)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (68, 46)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (77, 46)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (79, 46)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (81, 46)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (82, 91)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (83, 91)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (83, 92)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (84, 90)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (85, 90)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (85, 92)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (87, 90)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (87, 91)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (88, 92)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (89, 90)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (89, 91)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (90, 90)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (90, 91)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (92, 91)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (93, 92)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (94, 91)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (94, 92)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (96, 90)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (96, 91)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (96, 92)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (97, 90)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (97, 92)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (98, 91)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (99, 90)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (100, 91)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (101, 92)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (102, 42)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (102, 93)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (102, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (102, 95)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (102, 108)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (103, 93)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (103, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (103, 108)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (104, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (104, 95)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (104, 108)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (105, 93)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (105, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (105, 95)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (105, 108)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (106, 42)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (106, 93)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (106, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (106, 108)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (107, 42)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (107, 93)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (107, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (107, 95)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (107, 108)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (108, 93)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (108, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (108, 95)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (108, 108)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (109, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (109, 95)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (109, 108)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (110, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (110, 95)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (110, 108)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (111, 42)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (111, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (111, 108)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (112, 93)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (112, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (112, 95)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (113, 93)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (113, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (114, 42)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (114, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (114, 95)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (115, 42)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (115, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (116, 93)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (116, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (117, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (117, 95)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (118, 42)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (118, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (119, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (120, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (121, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (122, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (163, 51)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (163, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (163, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (164, 51)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (164, 78)
GO
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (164, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (165, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (165, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (166, 50)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (166, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (166, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (167, 50)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (167, 51)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (167, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (167, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (168, 51)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (168, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (168, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (169, 50)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (169, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (170, 50)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (170, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (170, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (171, 51)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (171, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (172, 50)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (172, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (172, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (173, 51)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (173, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (173, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (174, 50)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (174, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (175, 50)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (175, 51)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (175, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (176, 50)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (176, 51)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (176, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (176, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (177, 50)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (177, 51)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (177, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (178, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (178, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (179, 51)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (179, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (180, 50)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (180, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (180, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (181, 78)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (181, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (182, 79)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (204, 47)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (208, 47)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (215, 47)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (216, 47)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (218, 47)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (223, 99)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (223, 100)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (223, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (224, 100)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (224, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (225, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (226, 99)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (226, 100)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (226, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (227, 99)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (227, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (228, 43)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (228, 99)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (228, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (229, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (230, 43)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (230, 100)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (230, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (231, 99)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (231, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (232, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (233, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (234, 99)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (234, 100)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (234, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (235, 99)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (235, 100)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (235, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (236, 100)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (236, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (237, 43)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (237, 99)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (237, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (238, 43)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (238, 99)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (238, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (239, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (240, 100)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (240, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (241, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (242, 43)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (242, 99)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (242, 101)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (243, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (244, 106)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (244, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (245, 107)
GO
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (246, 105)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (246, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (247, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (248, 105)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (248, 106)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (248, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (249, 105)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (249, 106)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (249, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (250, 105)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (250, 106)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (250, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (251, 105)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (251, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (252, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (253, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (254, 105)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (254, 106)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (254, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (255, 106)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (255, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (256, 105)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (256, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (257, 106)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (257, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (258, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (259, 105)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (259, 106)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (259, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (260, 106)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (260, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (261, 106)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (261, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (262, 107)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (263, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (263, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (264, 54)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (264, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (264, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (265, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (266, 54)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (266, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (266, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (267, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (267, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (268, 54)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (268, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (269, 54)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (269, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (269, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (270, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (270, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (271, 54)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (271, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (272, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (272, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (273, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (273, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (274, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (274, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (275, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (275, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (276, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (276, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (277, 54)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (277, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (278, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (278, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (279, 54)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (279, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (279, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (280, 54)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (280, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (281, 54)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (281, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (281, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (282, 54)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (282, 55)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (282, 80)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (283, 57)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (283, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (283, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (284, 57)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (284, 58)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (284, 59)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (284, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (284, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (285, 58)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (285, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (285, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (286, 59)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (286, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (286, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (287, 56)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (287, 59)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (287, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (287, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (288, 59)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (288, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (288, 81)
GO
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (289, 56)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (289, 58)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (289, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (290, 56)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (290, 57)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (290, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (290, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (291, 56)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (291, 57)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (291, 58)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (291, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (292, 56)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (292, 57)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (292, 58)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (292, 59)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (292, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (293, 56)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (293, 57)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (293, 59)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (293, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (293, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (294, 58)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (294, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (294, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (295, 57)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (295, 58)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (295, 59)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (295, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (295, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (296, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (296, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (297, 56)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (297, 57)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (297, 59)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (297, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (298, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (298, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (299, 57)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (299, 58)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (299, 59)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (299, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (299, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (300, 56)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (300, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (300, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (301, 56)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (301, 57)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (301, 58)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (301, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (301, 81)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (302, 56)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (302, 58)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (302, 59)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (302, 60)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (303, 61)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (303, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (303, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (304, 61)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (304, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (304, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (305, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (305, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (306, 61)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (306, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (306, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (307, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (308, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (308, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (309, 61)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (309, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (309, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (310, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (311, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (311, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (312, 61)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (312, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (313, 61)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (313, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (313, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (314, 61)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (314, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (314, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (315, 61)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (315, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (315, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (316, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (316, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (317, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (318, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (318, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (319, 61)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (319, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (319, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (320, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (320, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (321, 61)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (321, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (321, 82)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (322, 62)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (323, 63)
GO
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (323, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (323, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (324, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (324, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (324, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (325, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (325, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (326, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (326, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (326, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (327, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (327, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (328, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (328, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (328, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (329, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (329, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (329, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (330, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (330, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (330, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (331, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (331, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (331, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (332, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (332, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (333, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (334, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (334, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (335, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (335, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (335, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (336, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (337, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (337, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (337, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (338, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (338, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (339, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (339, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (339, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (340, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (340, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (340, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (341, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (341, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (342, 63)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (342, 64)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (342, 83)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (343, 65)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (343, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (344, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (344, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (345, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (345, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (346, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (346, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (347, 65)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (347, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (348, 65)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (348, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (348, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (349, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (349, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (350, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (350, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (351, 65)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (351, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (352, 65)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (352, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (352, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (353, 65)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (353, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (353, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (354, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (354, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (355, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (355, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (356, 65)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (356, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (357, 65)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (357, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (357, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (358, 65)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (358, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (358, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (359, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (359, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (360, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (360, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (361, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (361, 85)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (362, 65)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (362, 66)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (363, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (363, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (364, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (364, 68)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (365, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (365, 68)
GO
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (365, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (366, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (366, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (367, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (367, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (368, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (369, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (369, 68)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (370, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (370, 68)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (370, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (371, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (371, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (372, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (372, 68)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (372, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (373, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (373, 68)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (373, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (374, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (374, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (375, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (376, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (377, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (377, 68)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (377, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (378, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (378, 68)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (378, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (379, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (379, 68)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (379, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (380, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (380, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (381, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (381, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (382, 67)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (382, 68)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (382, 86)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (383, 70)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (383, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (384, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (384, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (385, 69)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (385, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (386, 70)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (386, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (386, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (387, 69)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (387, 70)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (387, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (387, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (388, 69)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (388, 70)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (388, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (389, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (389, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (390, 69)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (390, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (390, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (391, 69)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (391, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (391, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (392, 70)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (392, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (392, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (393, 69)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (393, 70)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (393, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (393, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (394, 69)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (394, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (394, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (395, 69)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (395, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (395, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (396, 69)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (396, 70)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (396, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (396, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (397, 69)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (397, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (397, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (398, 70)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (398, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (398, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (399, 70)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (399, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (399, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (400, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (401, 70)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (401, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (402, 71)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (402, 75)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (403, 73)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (403, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (403, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (404, 72)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (404, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (405, 72)
GO
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (405, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (405, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (406, 73)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (406, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (407, 72)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (407, 73)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (407, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (407, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (408, 73)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (408, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (408, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (409, 72)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (409, 73)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (409, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (409, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (410, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (411, 72)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (411, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (411, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (412, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (412, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (413, 72)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (413, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (413, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (414, 72)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (414, 73)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (414, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (414, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (415, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (415, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (416, 72)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (416, 73)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (416, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (417, 72)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (417, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (417, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (418, 73)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (418, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (418, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (419, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (419, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (420, 72)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (420, 73)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (420, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (420, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (421, 73)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (421, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (421, 76)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (422, 74)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (423, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (423, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (424, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (424, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (425, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (425, 84)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (425, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (426, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (427, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (428, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (428, 84)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (428, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (429, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (429, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (430, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (430, 84)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (430, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (431, 84)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (431, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (432, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (432, 84)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (432, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (433, 84)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (433, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (434, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (435, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (435, 84)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (435, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (436, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (436, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (437, 84)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (437, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (438, 84)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (438, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (439, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (439, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (440, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (441, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (441, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (442, 77)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (442, 84)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (442, 89)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (504, 48)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (506, 48)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (507, 48)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (516, 48)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (517, 48)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (519, 48)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (522, 48)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (523, 49)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (526, 49)
GO
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (527, 49)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (529, 49)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (531, 49)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (536, 49)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (538, 49)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (540, 49)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (541, 49)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (542, 49)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (546, 52)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (547, 52)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (547, 53)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (548, 53)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (551, 53)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (552, 52)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (554, 53)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (556, 53)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (560, 52)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (562, 52)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (563, 94)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (563, 95)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (564, 87)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (564, 97)
INSERT [dbo].[ex_q] ([q_id], [ex_id]) VALUES (564, 98)
GO
SET IDENTITY_INSERT [dbo].[exams] ON 

INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (42, 6, N'test 1', 35, 1009)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (43, 3, N'quiz 1', 11, 1018)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (44, 5, N'quiz 1', 25, 1010)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (45, 6, N'semi-final test', 30, 1010)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (46, 7, N'exam 1', 35, 1007)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (47, 5, N'quiz 1', 9, 1017)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (48, 7, N'mid-term', 7, 1032)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (49, 10, N'final', 10, 1033)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (50, 20, N'Java Exam', 10, 1015)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (51, 20, N'Java Exam 2', 10, 1015)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (52, 5, N'quiz 1', 5, 1034)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (53, 5, N'quiz 2', 5, 1034)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (54, 20, N'Data Analysis Midter', 10, 1020)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (55, 30, N'Data Analysis Final ', 20, 1020)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (56, 10, N'Data Science Toolkit', 10, 1021)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (57, 10, N'Data Science Toolkit', 10, 1021)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (58, 10, N'Data Science Midterm', 10, 1021)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (59, 10, N'Midterm Exam', 10, 1021)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (60, 10, N'Final Exam', 20, 1021)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (61, 10, N'Quiz', 22, 1022)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (62, 25, N'Final Exam', 43, 1022)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (63, 25, N'Midterm Exam', 33, 1023)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (64, 30, N'Final Exam', 43, 1023)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (65, 10, N'Midterm Exam', 21, 1024)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (66, 30, N'Final Exam', 42, 1024)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (67, 30, N'Final Exam', 40, 1025)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (68, 10, N'Midterm Exam', 19, 1025)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (69, 10, N'Quiz 1', 10, 1026)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (70, 10, N'Quiz 2', 10, 1026)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (71, 30, N'Final Exam', 20, 1026)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (72, 10, N'Quiz 1', 10, 1027)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (73, 10, N'Quiz 2', 10, 1027)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (74, 30, N'Final Exam', 20, 1027)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (75, 20, N'Midterm Exam', 15, 1026)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (76, 20, N'Midterm Exam', 15, 1027)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (77, 30, N'quiz 1', 26, 1028)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (78, 20, N'Midterm Exam', 13, 1015)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (79, 30, N'Final Exam', 20, 1015)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (80, 20, N'Quiz', 15, 1020)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (81, 20, N'Quiz', 15, 1021)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (82, 25, N'Midterm', 33, 1022)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (83, 25, N'Midterm', 31, 1023)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (84, 25, N'Quiz 2', 22, 1028)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (85, 25, N'Quiz', 32, 1024)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (86, 25, N'Quiz', 31, 1025)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (87, 5, N'Quiz', 47, 1010)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (88, 5, N'Quiz 2', 50, 1010)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (89, 50, N'Final 1', 43, 1028)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (90, 20, N'Quiz1', 40, 1008)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (91, 10, N'Quiz 2', 50, 1008)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (92, 10, N'Quiz 3', 40, 1008)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (93, 20, N'Quiz 1', 41, 1009)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (94, 60, N'Final 1', 102, 1009)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (95, 20, N'Quiz 2', 47, 1009)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (96, 10, N'Quiz 1', 40, 1010)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (97, 10, N'Quiz 2', 37, 1010)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (98, 60, N'Final 1', 102, 1010)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (99, 10, N'Quiz 1', 19, 1018)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (100, 10, N'Quiz 2', 19, 1018)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (101, 60, N'Final 1', 43, 1018)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (102, 10, N'Quiz 1', 50, 1012)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (103, 10, N'Quiz 2', 50, 1012)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (104, 60, N'Final 1', 100, 1012)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (105, 10, N'Quiz 1', 8, 1019)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (106, 10, N'Quiz 2', 10, 1019)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (107, 60, N'Final 1', 20, 1019)
INSERT [dbo].[exams] ([id], [duration], [title], [total_degree], [crs_id]) VALUES (108, 5, N'optional exam', 50, 1009)
SET IDENTITY_INSERT [dbo].[exams] OFF
GO
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10046, NULL, 18)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10047, NULL, 21)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10048, NULL, 21)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10049, NULL, 21)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10050, NULL, 21)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10051, NULL, 21)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10052, NULL, 20)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10053, NULL, 20)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10054, NULL, 20)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10055, NULL, 20)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10056, NULL, 20)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10057, NULL, 19)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10058, NULL, 19)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10059, NULL, 19)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10060, NULL, 19)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10061, NULL, 19)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10062, NULL, 18)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10063, NULL, 18)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10064, NULL, 18)
INSERT [dbo].[instructors] ([user_id], [salary], [dept_id]) VALUES (10065, NULL, 18)
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 2, N'Waterfall Model')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 3, N'Design')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 4, N'Unified Modeling Language')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 5, N'Java')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 6, N'To ensure the software runs faster')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 7, N'A phase where testing is done')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 8, N'Waterfall')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 9, N'Continuous Integration / Continuous Deployment')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 10, N'Faster execution')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 11, N'Maintainability')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 22, N'Personal Home Page')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 23, N'var $variable;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 24, N'// This is a comment')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 25, N'isset()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 26, N'$array = (1, 2, 3);')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 27, N'fopen(''file.txt'', ''r'');')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 28, N'include(''file.php'');')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 29, N'15')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 30, N'strlen()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 31, N'redirect(''page.html'');')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 42, N'CREATE DATABASE dbname;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 43, N'VARCHAR')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 44, N'DROP DATABASE dbname;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 45, N'MAKE TABLE students (id INT, name VARCHAR(50));')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 46, N'SELECT ALL FROM table_name;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 47, N'MODIFY table_name SET column=value WHERE condition;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 48, N'To specify the columns to be selected')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 49, N'ADD COLUMN column_name datatype TO table_name;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 50, N'8080')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 51, N'To allow duplicate values in a column')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 62, N'Manage hardware and software resources')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 63, N'Windows')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 64, N'Manage CPU scheduling')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 65, N'FCFS')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 66, N'Processes waiting for each other')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 67, N'Windows 10')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 68, N'A type of RAM')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 69, N'Manage user interfaces')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 70, N'Create a new process')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 71, N'Supports one user at a time')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 82, N'Translate code into machine language')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 83, N'Python')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 84, N'The logic of the program')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 85, N'Float')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 86, N'16')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 87, N'for')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 88, N'Store data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 89, N'=')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 90, N'# This is a comment')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 91, N'Hello World')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 102, N'Objects and Classes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 103, N'Encapsulation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 104, N'Creating multiple instances of a class')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 105, N'implement')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 106, N'Ability to take many forms')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 107, N'A subclass overriding a method from its superclass')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 108, N'To destroy an object')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 109, N'public')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 110, N'A class is a blueprint for an object')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 111, N'A car has an engine')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 123, N'var')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 124, N'public')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 125, N'!! operator')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 126, N'5')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 127, N'object')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 128, N'Looping')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 129, N'arrayListOf()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 130, N'[1, 2, 3]')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 131, N'launch')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 132, N'To define a sealed class')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 143, N'Activity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 144, N'Activity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 145, N'AndroidManifest.xml')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 146, N'onCreate()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 147, N'To define the app layout')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 148, N'TextView')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 149, N'To manage app resources')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 150, N'SharedPreferences')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 151, N'To initialize the Activity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 152, N'Activity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 163, N'include')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 164, N'2 bytes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 165, N'myVariable')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 166, N'main method')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 167, N'Platform-independent')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 168, N'15')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 169, N'Encapsulation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 170, N'true')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 171, N'try-catch')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 172, N'It will not compile')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 183, N'Spring Core')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 184, N'@Service')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 185, N'Constructor Injection')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 186, N'ApplicationContext')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 187, N'@Inject')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 188, N'Singleton')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 189, N'Spring ORM')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 190, N'BeanFactory')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 191, N'@Before')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 192, N'Dependency Injection')
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 203, N'User Experience')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 204, N'Complexity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 205, N'To outline the structure and layout of a page')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 206, N'Visibility of system status')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 207, N'To make the interface visually appealing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 208, N'Complementary')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 209, N'To represent a typical user of the product')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 210, N'Photoshop')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 211, N'Designing for a single screen size')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 212, N'Complex navigation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 223, N'Empathize')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 224, N'Understanding user needs and problems')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 225, N'Empathize')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 226, N'Conducting in-depth market research')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 227, N'A human-centered approach to problem-solving')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 228, N'Ideas are generated and discussed')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 229, N'It is only used in product design')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 230, N'To create a clear and actionable problem statement')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 231, N'It guarantees a perfect final product')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 232, N'A logical and linear thought process')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 243, N'MongoDB')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 244, N'DISTINCT')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 245, N'MySQL')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 246, N'Atomicity, Concurrency, Isolation, Durability')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 247, N'Primary Key')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 248, N'DELETE')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 249, N'INNER JOIN')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 250, N'SUM()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 251, N'UPDATE')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 252, N'1NF')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 263, N'SUM()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 264, N'VLOOKUP')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 265, N'COUNT()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 266, N'Performs a vertical calculation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 267, N'Sort & Filter')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 268, N'TEXT()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 269, N'Line Chart')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 270, N'Counts blank cells')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 271, N'SMALL()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 272, N'Alt + F5')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 283, N'NumPy')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 284, N'Jupyter Notebook')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 285, N'DELETE')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 286, N'Hadoop')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 287, N'Pandas')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 288, N'DataFrame')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 289, N'Scikit-learn')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 290, N'Pandas')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 291, N'AWS')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 292, N'R')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 303, N'To increase complexity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 304, N'Simplex method')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 305, N'A solution that maximizes profit')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 306, N'Monte Carlo simulation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 307, N'To find the optimal solution')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 308, N'Objective function')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 309, N'To maximize profit')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 310, N'It has no random variables')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 311, N'To increase complexity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 312, N'Optimizing waiting lines in service systems')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 323, N'Data storage only')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 324, N'High capacity for data processing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 325, N'Mainframe computing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 326, N'Real-time data collection')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 327, N'Scalability and flexibility')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 328, N'A structured database for transactions')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 329, N'It is optional, as data is not critical')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 330, N'Manual data entry')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 331, N'It reduces the need for data storage')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 332, N'To process and analyze large datasets for insights')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 343, N'Data entry')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 344, N'Web Intelligence')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 345, N'Outer join')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 346, N'Uses only static data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 347, N'A report template')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 348, N'Class')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 349, N'Data source')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 350, N'An SQL query execution plan')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 351, N'To represent data relationships')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 352, N'CSV files')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 363, N'To store transactional data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 364, N'Volatile data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 365, N'ETL')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 366, N'Relational database')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 367, N'To store metadata')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 368, N'Network schema')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 369, N'To store descriptive attributes for analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 370, N'MySQL')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 371, N'A data warehouse is smaller than a data mart')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 372, N'Real-time data updates')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 383, N'Microsoft Excel')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 384, N'ERP')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 385, N'Human Resources')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 386, N'Designed for small-scale use only')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 387, N'Sales Channel Management')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 388, N'Oracle')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 389, N'CRM')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 390, N'Increased data silos')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 391, N'CRM')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 392, N'Data consistency')
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 403, N'Balance Sheet')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 404, N'Cash')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 405, N'Assets')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 406, N'Tax Planning')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 407, N'Revenue')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 408, N'Balance Sheet')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 409, N'Assets + Liabilities = Equity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 410, N'Cash')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 411, N'General Accounting and Auditing Principles')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 412, N'Balance Sheet')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 423, N'To control costs')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 424, N'Initiating')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 425, N'Time, Scope, and Cost')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 426, N'To define the project budget')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 427, N'Executing the project')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 428, N'Agile')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 429, N'A list of project risks')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 430, N'Project risk')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 431, N'Financial risk')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 432, N'To directly execute all project tasks')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 443, N'To find as many defects as possible.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 444, N'Input data, expected results, and execution steps.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 445, N'Integration testing.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 446, N'Equivalence partitioning.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 447, N'To find new bugs.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 448, N'Over-testing the software.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 449, N'Internal testing done by developers.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 450, N'Unit testing.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 451, N'Unit testing of individual components.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 452, N'Only after the coding phase.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 463, N'To ensure the software meets the required standards and specifications')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 464, N'Unit Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 465, N'To write the test code')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 466, N'Time-to-market')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 467, N'Code review')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 468, N'Alpha testing is performed by developers, beta testing is performed by users')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 469, N'Stress testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 470, N'Number of features')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 471, N'Test planning')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 472, N'It requires fewer resources for setup')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 483, N'Unit Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 484, N'API Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 485, N'White Box Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 486, N'Selenium')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 487, N'Find security vulnerabilities')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 488, N'JIRA')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 489, N'Verify basic functionalities before detailed testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 490, N'Functional Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 491, N'A test script')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 492, N'JUnit')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 503, N'Shallow networks with few layers')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 504, N'Linear function')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 505, N'Image processing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 506, N'CNN')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 507, N'Increase training time')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 508, N'Allows pre-trained models to be used for similar tasks')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 509, N'Increase training speed')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 510, N'RMSprop')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 511, N'Too many neurons in a network')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 512, N'Use GPUs for computation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 523, N'K-Means Clustering')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 524, N'Only input values')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 525, N'K-Means')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 526, N'Decision Tree')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 527, N'Mean Squared Error (MSE)')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 528, N'It does not require labeled data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 529, N'It cannot perform regression')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 530, N'Linear Regression')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 531, N'Predicting house prices')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 532, N'Discover hidden patterns in data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 543, N'25%')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 544, N'0')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 545, N'Binomial Distribution')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 546, N'2')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 547, N'Mean')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 548, N'It is skewed')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 549, N'Central Tendency')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 550, N'They cannot occur together')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 551, N'Law of Large Numbers')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 552, N'1/4')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 564, N'Avoid customer feedback.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'A', 566, N'set of instructions')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 2, N'Spiral Model')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 3, N'Implementation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 4, N'Universal Markup Language')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 5, N'Git')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 6, N'To identify and fix defects')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 7, N'A time-boxed period for completing specific tasks')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 8, N'V-Model')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 9, N'Code Integration / Code Development')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 10, N'Code reusability and modularity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 11, N'Scalability')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 22, N'Private Home Page')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 23, N'variable $variable;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 24, N'<!-- This is a comment -->')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 25, N'is_null()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 26, N'$array = [1, 2, 3];')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 27, N'open(''file.txt'', ''r'');')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 28, N'import(''file.php'');')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 29, N'510')
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 30, N'str_length()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 31, N'header(''Location: page.html'');')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 42, N'MAKE DATABASE dbname;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 43, N'TEXT')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 44, N'DELETE DATABASE dbname;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 45, N'CREATE TABLE students (id INT, name VARCHAR(50));')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 46, N'GET * FROM table_name;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 47, N'UPDATE table_name SET column=value WHERE condition;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 48, N'To filter the rows based on a condition')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 49, N'UPDATE TABLE table_name ADD COLUMN column_name datatype;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 50, N'1521')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 51, N'To uniquely identify each row in a table')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 62, N'Provide internet connectivity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 63, N'Linux')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 64, N'Organize and store files')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 65, N'Round Robin')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 66, N'High CPU usage')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 67, N'VxWorks')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 68, N'A storage device')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 69, N'Provide internet connectivity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 70, N'Terminate a process')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 71, N'Uses multiple CPUs')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 82, N'Debug code errors')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 83, N'Java')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 84, N'The rules for writing code')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 85, N'String')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 86, N'11')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 87, N'if')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 88, N'Define variables')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 89, N'==')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 90, N'// This is a comment')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 91, N'Hello+World')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 102, N'Functions and Procedures')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 103, N'Inheritance')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 104, N'Binding data and methods together')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 105, N'interface')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 106, N'Hiding implementation details')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 107, N'Multiple methods with the same name but different parameters')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 108, N'To define a class')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 109, N'protected')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 110, N'An object is a blueprint for a class')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 111, N'A dog is an animal')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 123, N'val')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 124, N'private')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 125, N'?: operator')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 126, N'6')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 127, N'class')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 128, N'Conditional branching')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 129, N'mutableListOf()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 130, N'[2, 4, 6]')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 131, N'async')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 132, N'To define an abstract class')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 143, N'Service')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 144, N'Application')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 145, N'strings.xml')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 146, N'onStart()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 147, N'To store app strings')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 148, N'RecyclerView')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 149, N'To define app layouts')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 150, N'SQLiteDatabase')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 151, N'To start the Activity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 152, N'Service')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 163, N'package')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 164, N'4 bytes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 165, N'_myVar')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 166, N'start method')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 167, N'Object-oriented')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 168, N'510')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 169, N'Multithreading')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 170, N'false')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 171, N'exception-handler')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 172, N'It will compile but not run')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 183, N'Spring MVC')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 184, N'@Repository')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 185, N'Setter Injection')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 186, N'SpringContainer')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 187, N'@Autowired')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 188, N'Prototype')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 189, N'Spring JDBC')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 190, N'ConfigurableFactory')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 191, N'@PostConstruct')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 192, N'AOP')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 203, N'User Experience')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 204, N'Inconsistency')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 205, N'To add colors and graphics')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 206, N'User control and freedom')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 207, N'To evaluate how easy the interface is to use')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 208, N'Analogous')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 209, N'To design the visual elements of the interface')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 210, N'Excel')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 211, N'Designing for multiple screen sizes and devices')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 212, N'Hidden features')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 223, N'Define')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 224, N'Generating as many ideas as possible')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 225, N'Define')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 226, N'Creating low-cost, scaled-down versions of the product')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 227, N'A rigid step-by-step technical methodology')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 228, N'Final solutions are implemented at scale')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 229, N'It can be applied to various industries and fields')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 230, N'To immediately generate solutions')
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 231, N'It replaces the need for user testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 232, N'A focus on business profitability above all')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 243, N'Redis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 244, N'UNIQUE')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 245, N'PostgreSQL')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 246, N'Atomicity, Consistency, Isolation, Durability')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 247, N'Super Key')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 248, N'DROP')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 249, N'LEFT JOIN')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 250, N'AVG()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 251, N'MODIFY')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 252, N'2NF')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 263, N'AVERAGE()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 264, N'Data Validation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 265, N'COUNTA()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 266, N'Validates lookup values')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 267, N'Remove Duplicates')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 268, N'JOIN()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 269, N'Pie Chart')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 270, N'Counts all cells')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 271, N'MAX()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 272, N'Ctrl + R')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 283, N'TensorFlow')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 284, N'Matplotlib')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 285, N'INSERT')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 286, N'MySQL')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 287, N'Scikit-learn')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 288, N'Series')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 289, N'TensorFlow')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 290, N'OpenCV')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 291, N'Azure')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 292, N'Python')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 303, N'To reduce efficiency')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 304, N'Monte Carlo simulation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 305, N'A solution that satisfies all constraints')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 306, N'Queuing theory')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 307, N'To eliminate constraints')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 308, N'Random variables')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 309, N'To minimize transportation costs')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 310, N'It is always deterministic')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 311, N'To eliminate the objective function')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 312, N'Solving linear programming problems')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 323, N'Data collection for analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 324, N'Manual data validation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 325, N'Blockchain')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 326, N'Data entry from external sources')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 327, N'Increased manual data management')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 328, N'A storage system for unstructured and structured data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 329, N'It increases operational complexity without benefits')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 330, N'Decentralized processing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 331, N'It requires advanced tools for storage, processing, and analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 332, N'To store unstructured data only')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 343, N'Reporting and analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 344, N'Crystal Reports')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 345, N'Cross join')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 346, N'Requires coding for data extraction')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 347, N'A semantic layer')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 348, N'Dimension')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 349, N'Dimension')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 350, N'A presentation format for reports')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 351, N'To perform calculations or aggregations on data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 352, N'Excel sheets')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 363, N'To perform real-time data processing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 364, N'Non-volatile data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 365, N'ELT')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 366, N'NoSQL database')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 367, N'To store descriptive attributes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 368, N'Snowflake schema')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 369, N'To store quantitative data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 370, N'MongoDB')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 371, N'A data mart is used for real-time processing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 372, N'Consolidated and consistent data for analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 383, N'SAP')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 384, N'SCM')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 385, N'Inventory Management')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 386, N'Integrated business processes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 387, N'Supply Chain Management')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 388, N'Facebook')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 389, N'SCM')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 390, N'Less automation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 391, N'SCM')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 392, N'More data silos')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 403, N'Income Statement')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 404, N'Inventory')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 405, N'Liabilities')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 406, N'Providing financial information to external users')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 407, N'Assets')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 408, N'Income Statement')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 409, N'Assets = Liabilities + Equity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 410, N'Inventory')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 411, N'Generally Accepted Accounting Principles')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 412, N'Cash Flow Statement')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 423, N'To build teams')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 424, N'Planning')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 425, N'Risk, Resources, and Time')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 426, N'To outline the project’s scope statement')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 427, N'Initiating the project')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 428, N'Waterfall')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 429, N'A detailed budget for the project')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 430, N'Budget breakdown')
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 431, N'Technical risk')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 432, N'To oversee and guide the project team to achieve project goals')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 443, N'To ensure the software works as expected.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 444, N'Only the expected results.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 445, N'System testing.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 446, N'Boundary value analysis.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 447, N'To ensure new changes do not affect existing functionality.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 448, N'Underdosing the software.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 449, N'Testing performed by a select group of external users.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 450, N'Integration testing.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 451, N'Test to check the system’s ability to handle a large number of users.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 452, N'Simultaneously with the development phases.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 463, N'To increase the development time')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 464, N'Integration Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 465, N'To outline the testing strategy, objectives, and scope')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 466, N'Development cost')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 467, N'Boundary value analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 468, N'Alpha testing occurs before beta testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 469, N'Sanity testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 470, N'Amount of test coverage')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 471, N'Test design')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 472, N'It replaces manual testers completely')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 483, N'Regression Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 484, N'Performance Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 485, N'Black Box Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 486, N'JMeter')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 487, N'Measure system performance under heavy load')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 488, N'Trello')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 489, N'Check database performance')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 490, N'Performance Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 491, N'A UI element')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 492, N'TestNG')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 503, N'Hand-crafted feature extraction')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 504, N'ReLU (Rectified Linear Unit)')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 505, N'Time series analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 506, N'Feedforward Neural Network')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 507, N'Prevent overfitting')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 508, N'Reduces the need for neural networks')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 509, N'Reduce the number of neurons')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 510, N'Adam')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 511, N'Model training stops early')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 512, N'Use larger batch sizes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 523, N'Principal Component Analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 524, N'Both input values and corresponding labels')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 525, N'Hierarchical Clustering')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 526, N'K-Means Clustering')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 527, N'R-Squared')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 528, N'It maps input features to known target labels')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 529, N'It cannot generalize to new data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 530, N'K-Means Clustering')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 531, N'Spam email detection')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 532, N'Cluster similar data points')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 543, N'50%')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 544, N'0.5')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 545, N'Poisson Distribution')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 546, N'3')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 547, N'Variance')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 548, N'Mean is always greater than the median')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 549, N'Probability')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 550, N'The occurrence of one does not affect the occurrence of the other')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 551, N'Central Limit Theorem')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 552, N'1/3')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 564, N'Deliver working software frequently.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'B', 566, N'set of variables')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 2, N'Agile Model')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 3, N'Requirement Analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 4, N'User Management Language')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 5, N'Python')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 6, N'To add new features to the software')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 7, N'A documentation step')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 8, N'Spiral Model')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 9, N'Computer Intelligence / Continuous Design')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 10, N'Requires less memory')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 11, N'Randomization')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 22, N'Preprocessor Hypertext Page')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 23, N'$variable;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 24, N'/* This is a comment */')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 25, N'is_set()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 26, N'$array = array(1, 2, 3);')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 27, N'fileopen(''file.txt'', ''r'');')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 28, N'require(''file.php'');')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 29, N'Error')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 30, N'string_length()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 31, N'go_to(''page.html'');')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 42, N'NEW DATABASE dbname;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 43, N'STRING')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 44, N'REMOVE DATABASE dbname;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 45, N'NEW TABLE students (id INT, name VARCHAR(50));')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 46, N'SELECT * FROM table_name;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 47, N'CHANGE table_name SET column=value WHERE condition;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 48, N'To sort the results in ascending order')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 49, N'ALTER TABLE table_name ADD column_name datatype;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 50, N'1433')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 51, N'To store large amounts of text')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 62, N'Create user interfaces')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 63, N'macOS')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 64, N'Provide network security')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 65, N'SJF')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 66, N'Memory allocation error')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 67, N'Ubuntu')
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 68, N'Disk space used as RAM')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 69, N'Run application software')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 70, N'Allocate memory')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 71, N'Runs one process at a time')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 82, N'Execute code line by line')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 83, N'C++')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 84, N'The output of the program')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 85, N'Integer')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 86, N'10')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 87, N'switch')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 88, N'Reuse code')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 89, N'===')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 90, N'/* This is a comment */')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 91, N'HelloWorld')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 102, N'Loops and Conditionals')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 103, N'Polymorphism')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 104, N'Reusing code from existing classes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 105, N'extends')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 106, N'Creating multiple objects')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 107, N'A method that calls itself')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 108, N'To initialize an object')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 109, N'default')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 110, N'A class is an instance of an object')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 111, N'A library has books')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 123, N'const')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 124, N'protected')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 125, N'? operator')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 126, N'7')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 127, N'singleton')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 128, N'Exception handling')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 129, N'listOf()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 130, N'[1, 4, 9]')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 131, N'runBlocking')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 132, N'To define a data class')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 143, N'BroadcastReceiver')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 144, N'Service')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 145, N'activity_main.xml')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 146, N'onResume()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 147, N'To manage app dependencies')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 148, N'Button')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 149, N'To facilitate communication between components')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 150, N'ContentProvider')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 151, N'To resume the Activity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 152, N'BroadcastReceiver')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 163, N'main')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 164, N'8 bytes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 165, N'123var')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 166, N'run method')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 167, N'Pointers')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 168, N'5 + 10')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 169, N'Inheritance')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 170, N'0')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 171, N'error-fix')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 172, N'It will run without any output')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 183, N'Spring Boot')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 184, N'@Component')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 185, N'Field Injection')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 186, N'SpringContext')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 187, N'@Resource')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 188, N'Session')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 189, N'Spring Boot')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 190, N'ConfigurableApplicationContext')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 191, N'@After')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 192, N'Spring Boot')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 203, N'User Execution')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 204, N'Consistency')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 205, N'To write code for the application')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 206, N'Consistency and standards')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 207, N'To write code for the application')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 208, N'Monochromatic')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 209, N'To write code for the application')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 210, N'Word')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 211, N'Designing with bright colors')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 212, N'User-centered design')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 223, N'Prototype')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 224, N'Building and testing prototypes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 225, N'Ideate')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 226, N'Launching the final product')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 227, N'A process for only graphic design projects')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 228, N'Designers conduct financial analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 229, N'It focuses only on technical feasibility')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 230, N'To skip user research and focus on implementation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 231, N'It allows designers to explore and refine ideas before full implementation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 232, N'A problem-solving approach with no room for creativity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 243, N'MySQL')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 244, N'FILTER')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 245, N'SQL Server')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 246, N'Availability, Consistency, Isolation, Durability')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 247, N'Foreign Key')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 248, N'REMOVE')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 249, N'RIGHT JOIN')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 250, N'TOTAL()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 251, N'ALTER')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 252, N'3NF')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 263, N'COUNT()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 264, N'Pivot Table')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 265, N'COUNTIF()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 266, N'Sorts data alphabetically')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 267, N'Data Validation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 268, N'CONCATENATE()')
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 269, N'Bar Chart')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 270, N'Counts unique values')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 271, N'LARGE()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 272, N'F9')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 283, N'Matplotlib')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 284, N'TensorFlow')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 285, N'SELECT')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 286, N'PostgreSQL')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 287, N'Matplotlib')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 288, N'Dictionary')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 289, N'Pandas')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 290, N'Matplotlib')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 291, N'Google Cloud')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 292, N'SQL')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 303, N'To optimize decision-making')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 304, N'Regression analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 305, N'A solution that minimizes cost')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 306, N'Linear programming')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 307, N'To increase complexity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 308, N'Probability distributions')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 309, N'To eliminate constraints')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 310, N'It includes uncertainty and randomness')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 311, N'To make the problem unsolvable')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 312, N'Performing sensitivity analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 323, N'Centralized data management and processing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 324, N'Real-time data access')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 325, N'Edge computing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 326, N'Storing large volumes of structured data for analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 327, N'Elimination of all data entry tasks')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 328, N'A tool for manual data entry')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 329, N'It is only required for external data sources')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 330, N'Data analytics tools and dashboards')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 331, N'It makes data irrelevant')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 332, N'To eliminate data processing tasks')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 343, N'Data storage')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 344, N'Universe')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 345, N'Self join')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 346, N'Does not support drill-down functionality')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 347, N'A database server')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 348, N'Measure')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 349, N'Query filter')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 350, N'A filter applied to data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 351, N'To define user roles')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 352, N'Relational databases')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 363, N'To support decision-making through data analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 364, N'Real-time updates')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 365, N'Data mining')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 366, N'Star schema')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 367, N'To store historical data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 368, N'Hierarchical schema')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 369, N'To perform ETL processes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 370, N'Informatica PowerCenter')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 371, N'A data warehouse is used for transactional processing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 372, N'High data redundancy')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 383, N'Google Drive')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 384, N'CRM')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 385, N'Customer Relationship Management')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 386, N'Centralized database')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 387, N'Software Configuration Management')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 388, N'Amazon')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 389, N'ERP')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 390, N'Improved business process integration')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 391, N'ERP')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 392, N'Reduced accessibility')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 403, N'Cash Flow Statement')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 404, N'Accounts Payable')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 405, N'Equity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 406, N'Internal Decision Making')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 407, N'Liabilities')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 408, N'Cash Flow Statement')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 409, N'Liabilities = Assets + Equity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 410, N'Accounts Receivable')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 411, N'Government Approved Accounting Practices')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 412, N'Income Statement')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 423, N'To successfully deliver a project within scope, time, and cost constraints')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 424, N'Executing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 425, N'Scope, Quality, and Cost')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 426, N'To formally authorize the project and assign the project manager')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 427, N'Planning the project')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 428, N'Critical Path Method')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 429, N'A project timeline')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 430, N'The project schedule and timeline')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 431, N'Operational risk')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 432, N'To report only to upper management')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 443, N'To make the software run faster.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 444, N'Only the input data.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 445, N'Unit testing.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 446, N'Decision table testing.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 447, N'To test the system as a whole.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 448, N'Not testing all scenarios.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 449, N'Final testing before release to the public.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 450, N'System testing.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 451, N'Load testing to measure response times under various conditions.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 452, N'After all development is completed.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 463, N'To perform code reviews only')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 464, N'Requirement Analysis Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 465, N'To conduct automated testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 466, N'Employee satisfaction')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 467, N'Testing the software without knowledge of its internal workings')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 468, N'Beta testing is conducted for system testing, alpha for unit testing')
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 469, N'Performance testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 470, N'The number of defects per unit of size or complexity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 471, N'Code optimization')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 472, N'It is more accurate than manual testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 483, N'Integration Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 484, N'Web Application Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 485, N'Functional Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 486, N'Appium')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 487, N'Identify UI issues')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 488, N'Jenkins')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 489, N'Test user interfaces')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 490, N'Exploratory Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 491, N'A database query')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 492, N'Selenium')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 503, N'Rule-based learning')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 504, N'Softmax')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 505, N'Natural language processing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 506, N'Recurrent Neural Network (RNN)')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 507, N'Improve model accuracy')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 508, N'Increases the number of model parameters')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 509, N'Optimize the dataset')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 510, N'Naïve Bayes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 511, N'Gradients become very small in deep networks, slowing learning')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 512, N'Decrease the number of epochs')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 523, N'Linear Regression')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 524, N'Only labels')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 525, N'PCA')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 526, N'DBSCAN')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 527, N'F1-Score')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 528, N'It is primarily used for clustering')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 529, N'It does not use labeled data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 530, N'Apriori Algorithm')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 531, N'Predicting stock prices')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 532, N'Train a model to map inputs to known outputs')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 543, N'75%')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 544, N'1')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 545, N'Normal Distribution')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 546, N'3.5')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 547, N'Standard Deviation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 548, N'It is symmetric about the mean')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 549, N'Mean')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 550, N'They always occur together')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 551, N'Bayes Theorem')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 552, N'1/2')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 564, N'Focus on extensive documentation.
')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'C', 566, N'set of functions')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 2, N'Hardware Model')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 3, N'Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 4, N'Unified Machine Learning')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 5, N'MySQL')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 6, N'To reduce code size')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 7, N'A hardware setup phase')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 8, N'Big Bang Model')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 9, N'Common Infrastructure / Code Debugging')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 10, N'Easier installation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 11, N'Reliability')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 22, N'PHP: Hypertext Preprocessor')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 23, N'int $variable;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 24, N'Both A and C')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 25, N'empty()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 26, N'Both B and C')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 27, N'read(''file.txt'');')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 28, N'Both A and C')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 29, N'5')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 30, N'length()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 31, N'jump(''page.html'');')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 42, N'ADD DATABASE dbname;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 43, N'LONGSTRING')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 44, N'ERASE DATABASE dbname;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 45, N'ADD TABLE students (id INT, name VARCHAR(50));')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 46, N'FETCH ALL FROM table_name;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 47, N'EDIT table_name SET column=value WHERE condition;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 48, N'To create a new table')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 49, N'MODIFY TABLE table_name ADD COLUMN column_name datatype;')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 50, N'3306')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 51, N'To create a relationship between two tables')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 62, N'Run antivirus software')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 63, N'Microsoft Office')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 64, N'Allocate memory to processes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 65, N'Priority Scheduling')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 66, N'Security vulnerability')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 67, N'macOS')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 68, N'A type of cache memory')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 69, N'Manage system resources')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 70, N'Create a new file')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 71, N'No memory management')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 82, N'Optimize code performance')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 83, N'HTML')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 84, N'The speed of execution')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 85, N'Boolean')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 86, N'13')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 87, N'try')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 88, N'Debug errors')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 89, N'!=')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 90, N'<!-- This is a comment -->')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 91, N'Error')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 102, N'Variables and Data Types')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 103, N'Compilation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 104, N'Overriding methods in a subclass')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 105, N'inherits')
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 106, N'Reusing code from a base class')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 107, N'A method that cannot be overridden')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 108, N'To inherit from a superclass')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 109, N'private')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 110, N'An object is a method of a class')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 111, N'A student attends a school')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 123, N'let')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 124, N'internal')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 125, N'?? operator')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 126, N'6')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 127, N'static')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 128, N'Function declaration')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 129, N'ArrayList()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 130, N'[2, 4, 6]')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 131, N'delay')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 132, N'To define an interface')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 143, N'ContentProvider')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 144, N'BroadcastReceiver')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 145, N'build.gradle')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 146, N'onPause()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 147, N'To declare app components and permissions')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 148, N'EditText')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 149, N'To store app data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 150, N'File Storage')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 151, N'To save data before the Activity goes into the background')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 152, N'ContentProvider')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 163, N'string')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 164, N'Depends on the system')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 165, N'$java$')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 166, N'init method')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 167, N'Automatic garbage collection')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 168, N'Compilation error')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 169, N'Polymorphism')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 170, N'null')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 171, N'throws')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 172, N'The JVM will automatically create a main method')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 183, N'Spring Security')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 184, N'@Controller')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 185, N'All of the above')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 186, N'AppLoader')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 187, N'@Qualifier')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 188, N'Request')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 189, N'Spring AOP')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 190, N'SpringManager')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 191, N'@PreDestroy')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 192, N'MVC Framework')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 203, N'User Exploration')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 204, N'Ambiguity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 205, N'To test user interactions')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 206, N'Use of complex animations')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 207, N'To add new features to the application')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 208, N'Triadic')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 209, N'To test the performance of the application')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 210, N'Figma')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 211, N'Designing for print media')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 212, N'Long loading times')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 223, N'Execute')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 224, N'Analyzing financial feasibility')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 225, N'Prototype')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 226, N'Gathering large-scale funding')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 227, N'A theoretical framework with no real-world applications')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 228, N'Prototypes are tested with users to gather feedback')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 229, N'It does not involve user feedback')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 230, N'To finalize a prototype for launch')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 231, N'It is only needed for digital products')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 232, N'An open, iterative, and user-centered mindset')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 243, N'Cassandra')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 244, N'GROUP BY')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 245, N'MongoDB')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 246, N'Atomicity, Consistency, Integrity, Durability')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 247, N'Candidate Key')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 248, N'CLEAR')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 249, N'FULL JOIN')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 250, N'COUNT()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 251, N'APPEND')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 252, N'BCNF')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 263, N'MEDIAN()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 264, N'Text to Columns')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 265, N'COUNTBLANK()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 266, N'Finds values in a vertical column')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 267, N'Conditional Formatting')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 268, N'MERGE()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 269, N'Histogram')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 270, N'Counts cells based on a condition')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 271, N'HIGH()')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 272, N'Ctrl + Shift + F5')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 283, N'All of the above')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 284, N'NumPy')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 285, N'UPDATE')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 286, N'MongoDB')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 287, N'Seaborn')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 288, N'Panel')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 289, N'NumPy')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 290, N'BeautifulSoup')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 291, N'MySQL')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 292, N'Tableau')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 303, N'To eliminate data analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 304, N'Decision trees')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 305, N'A solution that is always optimal')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 306, N'Stochastic processes')
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 307, N'To study the effect of changes in parameters')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 308, N'Simulation techniques')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 309, N'To increase complexity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 310, N'It is used only for linear programming')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 311, N'To define the feasible region')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 312, N'Maximizing profit in manufacturing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 323, N'Manual data entry and processing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 324, N'Scalable infrastructure')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 325, N'Cloud computing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 326, N'Managing manual records')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 327, N'Complete reliance on on-premise hardware')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 328, N'A server for data processing only')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 329, N'It ensures protection against unauthorized access and breaches')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 330, N'Basic data storage devices')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 331, N'It eliminates the need for cloud infrastructure')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 332, N'To manage only transactional data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 343, N'Database management')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 344, N'Dashboard')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 345, N'Full join')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 346, N'Supports dynamic data analysis and interaction')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 347, N'A user access management tool')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 348, N'Context')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 349, N'Report layout')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 350, N'A logical representation of the data source structure')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 351, N'To represent report titles')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 352, N'XML files')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 363, N'To replace operational databases')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 364, N'Normalized data structure')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 365, N'Data modeling')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 366, N'Graph database')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 367, N'To store quantitative data for analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 368, N'Object-oriented schema')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 369, N'To replace fact tables')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 370, N'Apache Kafka')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 371, N'A data mart is a subset of a data warehouse')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 372, N'Normalized data structure')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 383, N'Dropbox')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 384, N'HRM')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 385, N'Accounting')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 386, N'Real-time data access')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 387, N'Service Control Management')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 388, N'Netflix')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 389, N'HRM')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 390, N'Limited scalability')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 391, N'BI')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 392, N'Higher hardware costs')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 403, N'Statement of Retained Earnings')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 404, N'Equipment')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 405, N'Net Income')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 406, N'Budget Forecasting')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 407, N'Equity')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 408, N'Statement of Retained Earnings')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 409, N'Revenue - Expenses = Liabilities')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 410, N'Accounts Payable')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 411, N'Global Accounting and Audit Procedures')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 412, N'Statement of Retained Earnings')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 423, N'To manage human resources')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 424, N'Maintaining')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 425, N'Risk, Scope, and Cost')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 426, N'To create the work breakdown structure (WBS)')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 427, N'Monitoring and controlling the project')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 428, N'Lean Six Sigma')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 429, N'A hierarchical decomposition of the project into smaller, manageable components')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 430, N'Stakeholder analysis')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 431, N'Market failure risk')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 432, N'To only create the project plan')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 443, N'To implement new features.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 444, N'A description of the software requirements.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 445, N'Acceptance testing.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 446, N'Code coverage analysis.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 447, N'To validate the final product.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 448, N'Using too many test cases.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 449, N'Testing by a quality assurance team.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 450, N'Acceptance testing.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 451, N'Functional testing of the entire system.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 452, N'Before the design phase.')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 463, N'To minimize testing efforts')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 464, N'System Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 465, N'To manage project schedules')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 466, N'Defect density')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 467, N'Integration testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 468, N'There is no difference')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 469, N'Load testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 470, N'Total number of test cases')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 471, N'Test execution')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 472, N'It allows for repeated testing at any time without human intervention')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 483, N'System Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 484, N'Database Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 485, N'Exploratory Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 486, N'JIRA')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 487, N'Check database performance')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 488, N'Excel')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 489, N'Perform deep security testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 490, N'Regression Testing')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 491, N'A statement that checks expected and actual results')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 492, N'Cucumber')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 503, N'Multiple hidden layers in neural networks')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 504, N'Sigmoid')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 505, N'Database management')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 506, N'Radial Basis Function Network')
GO
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 507, N'Reduce the size of the dataset')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 508, N'Eliminates the need for large datasets')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 509, N'Measure the difference between predicted and actual values')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 510, N'K-Means')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 511, N'Excessive memory usage during training')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 512, N'Use lower resolution images')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 523, N'Apriori Algorithm')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 524, N'Unlabeled data points')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 525, N'Support Vector Machine (SVM)')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 526, N'Autoencoders')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 527, N'Silhouette Score')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 528, N'It cannot be used for regression tasks')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 529, N'It requires a large amount of labeled data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 530, N'Naïve Bayes')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 531, N'Finding customer segments')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 532, N'Reduce dimensionality of data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 543, N'100%')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 544, N'Depends on the experiment')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 545, N'Exponential Distribution')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 546, N'4')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 547, N'Correlation')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 548, N'It has two peaks')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 549, N'Dispersion of Data')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 550, N'Their probabilities sum to 1')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 551, N'Chebyshev’s Inequality')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 552, N'1/6')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 564, N'Follow a fixed plan strictly.
')
INSERT [dbo].[options] ([num], [q_id], [body]) VALUES (N'D', 566, N'set of objects')
GO
SET IDENTITY_INSERT [dbo].[questions] ON 

INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (2, N'Which of the following is not a software development life cycle (SDLC) model?', 5, N'm', N'D', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (3, N'Which phase of SDLC involves gathering user requirements?', 5, N'm', N'C', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (4, N'What does UML stand for in software engineering?', 5, N'm', N'A', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (5, N'Which of the following is an example of a version control system?', 5, N'm', N'B', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (6, N'What is the primary goal of software testing?', 5, N'm', N'B', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (7, N'In Agile development, what is a sprint?', 5, N'm', N'B', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (8, N'Which software development methodology follows an iterative approach?', 5, N'm', N'C', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (9, N'What does CI/CD stand for?', 5, N'm', N'A', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (10, N'What is the main benefit of using object-oriented programming (OOP)?', 5, N'm', N'B', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (11, N'Which of the following is not a software engineering principle?', 5, N'm', N'C', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (12, N'The Waterfall model allows developers to go back to the previous phase anytime.', 5, N't', N'F', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (13, N'Agile methodology promotes continuous feedback and iterative development.', 5, N't', N'T', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (14, N'Unit testing is performed by end-users before the software is released.', 5, N't', N'F', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (15, N'Open-source software means the source code is available for anyone to modify and distribute.', 5, N't', N'T', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (16, N'Functional requirements define how a system should perform under specific conditions.', 5, N't', N'F', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (17, N'The main purpose of software maintenance is to add new features only.', 5, N't', N'F', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (18, N'Encapsulation is one of the four key principles of Object-Oriented Programming (OOP).', 5, N't', N'T', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (19, N'A deadlock in a software system occurs when two or more processes are stuck waiting for each other t', 5, N't', N'T', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (20, N'Continuous Integration (CI) means merging code changes frequently to a shared repository.', 5, N't', N'T', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (21, N'Software testing can only be done after the development phase is complete.', 5, N't', N'F', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (22, N'What does PHP stand for?', 5, N'm', N'D', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (23, N'Which of the following is the correct way to declare a variable in PHP?', 5, N'm', N'C', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (24, N'How do you add a comment in PHP?', 5, N'm', N'D', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (25, N'Which PHP function is used to check if a variable is set and is not null?', 5, N'm', N'A', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (26, N'Which of the following is the correct syntax for creating a PHP array?', 5, N'm', N'D', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (27, N'How do you open a file for reading in PHP?', 5, N'm', N'A', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (28, N'Which of the following is a valid PHP function to include another PHP file?', 5, N'm', N'D', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (29, N'What will the following PHP code output? $x = "5"; $y = "10"; echo $x + $y;', 5, N'm', N'A', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (30, N'Which function is used to find the length of a string in PHP?', 5, N'm', N'A', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (31, N'Which of the following functions is used to redirect a user to another page in PHP?', 5, N'm', N'B', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (32, N'PHP is a case-sensitive language.', 5, N't', N'F', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (33, N'PHP code must always be enclosed within <?php ... ?> tags.', 5, N't', N'T', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (34, N'In PHP, variables must be declared before they are used.', 5, N't', N'F', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (35, N'PHP supports both procedural and object-oriented programming.', 5, N't', N'T', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (36, N'The echo and print statements in PHP can be used interchangeably without any difference.', 5, N't', N'F', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (37, N'In PHP, single quotes ('' '') and double quotes (" ") work the same way for strings.', 5, N't', N'F', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (38, N'PHP can only be used for web development and cannot be used for CLI scripting.', 5, N't', N'F', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (39, N'The isset() function checks if a variable is declared and is not NULL.', 5, N't', N'T', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (40, N'PHP does not support multi-line comments.', 5, N't', N'F', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (41, N'MySQL is the only database that PHP can connect to.', 5, N't', N'F', 1011)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (42, N'Which of the following is used to create a database in MySQL?', 5, N'm', N'A', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (43, N'What is the correct data type for storing long text in MySQL?', 5, N'm', N'B', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (44, N'Which command is used to delete a database completely?', 5, N'm', N'A', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (45, N'Which of the following is correct for creating a table in MySQL?', 5, N'm', N'B', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (46, N'Which command is used to retrieve all data from a table in MySQL?', 5, N'm', N'C', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (47, N'Which command is used to update data in a specific row of a table?', 5, N'm', N'B', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (48, N'What is the purpose of the WHERE clause in MySQL?', 5, N'm', N'B', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (49, N'Which of the following is the correct way to add a new column to an existing table?', 5, N'm', N'C', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (50, N'What is the default port number for MySQL?', 5, N'm', N'D', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (51, N'What is the purpose of the PRIMARY KEY in MySQL?', 5, N'm', N'B', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (52, N'MySQL is an open-source relational database management system.', 5, N't', N'T', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (53, N'In MySQL, the PRIMARY KEY column can have duplicate values.', 5, N't', N'F', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (54, N'MySQL uses SQL (Structured Query Language) for database operations.', 5, N't', N'T', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (55, N'The DEFAULT port number for MySQL is 1521.', 5, N't', N'F', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (56, N'The WHERE clause in MySQL is used to filter records based on conditions.', 5, N't', N'T', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (57, N'In MySQL, the DROP TABLE command deletes all records but keeps the table structure.', 5, N't', N'F', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (58, N'The JOIN clause in MySQL is used to combine records from two or more tables.', 5, N't', N'T', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (59, N'The AUTO_INCREMENT attribute in MySQL allows a column to generate unique values automatically.', 5, N't', N'T', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (60, N'In MySQL, the UPDATE statement is used to delete a record.', 5, N't', N'F', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (61, N'A FOREIGN KEY in MySQL is used to reference a primary key in another table.', 5, N't', N'T', 1012)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (62, N'What is the primary function of an operating system?', 5, N'm', N'A', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (63, N'Which of the following is NOT a type of operating system?', 5, N'm', N'D', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (64, N'What is the purpose of a file system in an operating system?', 5, N'm', N'B', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (65, N'Which scheduling algorithm allocates the CPU to the process with the shortest burst time first?', 5, N'm', N'C', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (66, N'What is a deadlock in operating systems?', 5, N'm', N'A', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (67, N'Which of the following is an example of a real-time operating system?', 5, N'm', N'B', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (68, N'What is virtual memory in operating systems?', 5, N'm', N'C', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (69, N'Which of the following is a function of the kernel in an operating system?', 5, N'm', N'D', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (70, N'What is the purpose of the "fork()" system call in Unix-based operating systems?', 5, N'm', N'A', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (71, N'Which of the following is a characteristic of a multiprocessing operating system?', 5, N'm', N'B', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (72, N'An operating system manages hardware and software resources.', 5, N't', N'T', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (73, N'Linux is an example of a proprietary operating system.', 5, N't', N'F', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (74, N'Virtual memory allows a system to use disk space as an extension of RAM.', 5, N't', N'T', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (75, N'A deadlock occurs when two processes are waiting for each other to release resources.', 5, N't', N'T', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (76, N'The kernel is responsible for managing system resources in an operating system.', 5, N't', N'T', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (77, N'Round Robin is a non-preemptive scheduling algorithm.', 5, N't', N'F', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (78, N'A file system is used to organize and store files on a disk.', 5, N't', N'T', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (79, N'In Unix-based systems, the "fork()" system call is used to terminate a process.', 5, N't', N'F', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (80, N'Multiprocessing operating systems can run multiple processes simultaneously using multiple CPUs.', 5, N't', N'T', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (81, N'The Windows operating system is based on the Linux kernel.', 5, N't', N'F', 1007)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (82, N'What is the purpose of a compiler in programming?', 5, N'm', N'A', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (83, N'Which of the following is NOT a programming language?', 5, N'm', N'D', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (84, N'What does the term "syntax" refer to in programming?', 5, N'm', N'B', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (85, N'Which data type is used to store whole numbers in Python?', 5, N'm', N'C', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (86, N'What is the output of the expression 5 + 3 * 2 in Python?', 5, N'm', N'B', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (87, N'Which of the following is a loop structure in Python?', 5, N'm', N'A', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (88, N'What is the purpose of a function in programming?', 5, N'm', N'C', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (89, N'Which operator is used to compare two values for equality in Python?', 5, N'm', N'B', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (90, N'What is the correct way to comment a single line in Python?', 5, N'm', N'A', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (91, N'What is the output of the following code snippet: print("Hello" + "World")?', 5, N'm', N'C', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (92, N'Python is an interpreted programming language.', 5, N't', N'T', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (93, N'In Python, the "print" statement is used to display output.', 5, N't', N'T', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (94, N'A variable in programming can store only numeric values.', 5, N't', N'F', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (95, N'The "if" statement is used for decision-making in programming.', 5, N't', N'T', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (96, N'In Python, the "==" operator is used to assign a value to a variable.', 5, N't', N'F', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (97, N'A function in programming must always return a value.', 5, N't', N'F', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (98, N'In Python, lists are mutable, meaning their elements can be changed.', 5, N't', N'T', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (99, N'The "while" loop is used to iterate over a sequence of elements.', 5, N't', N'F', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (100, N'In Python, the "len()" function is used to find the length of a string.', 5, N't', N'T', 1008)
GO
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (101, N'A syntax error occurs when the logic of the program is incorrect.', 5, N't', N'F', 1008)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (102, N'What is the primary concept of Object-Oriented Programming (OOP)?', 5, N'm', N'A', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (103, N'Which of the following is NOT a pillar of OOP?', 5, N'm', N'D', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (104, N'What is encapsulation in OOP?', 5, N'm', N'B', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (105, N'Which keyword is used to implement inheritance in Java?', 5, N'm', N'C', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (106, N'What is polymorphism in OOP?', 5, N'm', N'A', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (107, N'Which of the following is an example of method overloading?', 5, N'm', N'B', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (108, N'What is the purpose of a constructor in OOP?', 5, N'm', N'C', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (109, N'Which access modifier allows a member to be accessed only within its own class?', 5, N'm', N'D', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (110, N'What is the relationship between a class and an object?', 5, N'm', N'A', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (111, N'Which of the following is an example of an "is-a" relationship?', 5, N'm', N'B', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (112, N'In single inheretance a class can inheret from more than one class.', 1, N't', N'F', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (113, N'In OOP, a class is a blueprint for creating objects.', 5, N't', N'T', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (114, N'Encapsulation in OOP refers to the process of hiding implementation details.', 5, N't', N'T', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (115, N'Inheritance allows a class to inherit properties and methods from another class.', 5, N't', N'T', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (116, N'Polymorphism allows a method to have the same name as another method in the same class.', 5, N't', N'F', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (117, N'A constructor is used to destroy an object in OOP.', 5, N't', N'F', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (118, N'In Java, the "super" keyword is used to refer to the superclass of the current object.', 5, N't', N'T', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (119, N'Abstraction in OOP refers to the process of exposing all implementation details.', 5, N't', N'F', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (120, N'In OOP, a private member of a class can be accessed from outside the class.', 5, N't', N'F', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (121, N'Method overriding allows a subclass to provide a specific implementation of a method that is already', 5, N't', N'T', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (122, N'In OOP, an interface can contain method implementations.', 5, N't', N'F', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (123, N'Which of the following is used to declare a variable in Kotlin that cannot be reassigned?', 5, N'm', N'B', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (124, N'What is the default visibility modifier in Kotlin if none is specified?', 5, N'm', N'A', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (125, N'Which of the following is used to handle null safety in Kotlin?', 5, N'm', N'C', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (126, N'What is the output of the following code: println("Kotlin".length)?', 5, N'm', N'D', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (127, N'Which of the following is used to define a singleton in Kotlin?', 5, N'm', N'A', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (128, N'What is the purpose of the when expression in Kotlin?', 5, N'm', N'B', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (129, N'Which of the following is used to create a list in Kotlin?', 5, N'm', N'C', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (130, N'What is the output of the following code: println(listOf(1, 2, 3).map { it * 2 })?', 5, N'm', N'D', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (131, N'Which of the following is used to define a coroutine in Kotlin?', 5, N'm', N'A', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (132, N'What is the purpose of the data keyword in Kotlin?', 5, N'm', N'C', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (133, N'In Kotlin, val is used to declare a mutable variable.', 5, N't', N'f', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (134, N'Kotlin is fully interoperable with Java.', 5, N't', N't', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (135, N'Kotlin does not support null safety.', 5, N't', N'f', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (136, N'The when expression in Kotlin is similar to the switch statement in Java.', 5, N't', N't', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (137, N'Kotlin does not support functional programming.', 5, N't', N'f', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (138, N'In Kotlin, the data keyword is used to define a data class.', 5, N't', N't', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (139, N'Kotlin does not support extension functions.', 5, N't', N'f', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (140, N'Kotlin is a statically typed programming language.', 5, N't', N't', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (141, N'Kotlin does not support coroutines for asynchronous programming.', 5, N't', N'f', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (142, N'In Kotlin, the !! operator is used to safely call a nullable object.', 5, N't', N'f', 1013)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (143, N'Which component is responsible for managing the UI and user interactions in Android?', 2, N'm', N'A', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (144, N'What is the entry point of an Android application?', 2, N'm', N'B', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (145, N'Which file is used to define the layout of an Android Activity?', 1, N'm', N'C', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (146, N'Which method is called when an Activity is first created?', 2, N'm', N'A', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (147, N'What is the purpose of the AndroidManifest.xml file?', 3, N'm', N'D', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (148, N'Which of the following is used to display a list of items in Android?', 2, N'm', N'B', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (149, N'What is the purpose of the Intent class in Android?', 3, N'm', N'C', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (150, N'Which of the following is used to store key-value pairs in Android?', 1, N'm', N'A', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (151, N'What is the purpose of the onPause() method in an Activity?', 2, N'm', N'D', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (152, N'Which of the following is used to perform background tasks in Android?', 3, N'm', N'B', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (153, N'In Android, an Activity is a single screen with a user interface.', 2, N't', N'T', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (154, N'Android applications are primarily developed using the C++ programming language.', 2, N't', N'F', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (155, N'The AndroidManifest.xml file is required for every Android application.', 3, N't', N'T', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (156, N'A Service in Android runs in the foreground and always has a visible UI.', 2, N't', N'F', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (157, N'The onDestroy() method is always called when an Activity is closed by the user.', 3, N't', N'F', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (158, N'Android applications can only be distributed through the Google Play Store.', 1, N't', N'F', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (159, N'The RecyclerView is a more advanced and flexible version of ListView.', 3, N't', N'T', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (160, N'An Intent in Android can be used to start a new Activity or Service.', 2, N't', N'T', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (161, N'SharedPreferences is used to store large amounts of structured data in Android.', 2, N't', N'F', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (162, N'Android applications can run on multiple devices with different screen sizes and resolutions.', 3, N't', N'T', 1014)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (163, N'Which of the following is a valid Java keyword?', 1, N'm', N'B', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (164, N'What is the size of an int in Java?', 1, N'm', N'B', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (165, N'Which of these is not a valid Java identifier?', 1, N'm', N'C', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (166, N'What is the entry point of a Java program?', 1, N'm', N'A', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (167, N'Which of these is NOT a feature of Java?', 1, N'm', N'C', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (168, N'What will System.out.println(5 + "10") output?', 1, N'm', N'B', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (169, N'Which Java feature allows the execution of a program in multiple threads?', 1, N'm', N'B', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (170, N'What is the default value of a boolean variable in Java?', 1, N'm', N'B', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (171, N'What is used to handle exceptions in Java?', 1, N'm', N'A', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (172, N'What will happen if a class does not have a main method?', 1, N'm', N'B', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (173, N'Java supports multiple inheritance through classes.', 1, N't', N'F', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (174, N'The final keyword in Java is used to prevent modification of a variable, method, or class.', 1, N't', N'T', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (175, N'Java automatically manages memory using garbage collection.', 1, N't', N'T', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (176, N'The default constructor of a class is always private.', 1, N't', N'F', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (177, N'The switch statement in Java can work with int, char, String, and enum.', 1, N't', N'T', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (178, N'In Java, == checks for content equality in strings.', 1, N't', N'F', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (179, N'Every Java program must have a main method.', 1, N't', N'T', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (180, N'A Java interface can extend multiple interfaces.', 1, N't', N'T', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (181, N'The static keyword in Java is used to declare instance variables.', 1, N't', N'F', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (182, N'Java programs run faster than C++ programs.', 1, N't', N'F', 1015)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (183, N'Which of the following is the core module of the Spring framework?', 1, N'm', N'A', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (184, N'Which annotation is used to define a Spring component?', 1, N'm', N'C', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (185, N'Which dependency injection type is supported by Spring?', 1, N'm', N'D', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (186, N'Which class is used to load the Spring application context?', 1, N'm', N'A', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (187, N'Which annotation is used for auto-wiring dependencies in Spring?', 1, N'm', N'B', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (188, N'Which scope is the default for a Spring bean?', 1, N'm', N'A', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (189, N'Which Spring module is used for declarative transaction management?', 1, N'm', N'D', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (190, N'Which interface provides methods to configure a Spring application context?', 1, N'm', N'C', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (191, N'Which annotation is used to indicate that a method should run after dependency injection?', 1, N'm', N'B', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (192, N'Which feature allows Spring beans to be created and managed automatically?', 1, N'm', N'A', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (193, N'Spring is an open-source framework.', 1, N't', N'T', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (194, N'The @Service annotation is used to define a controller in Spring.', 1, N't', N'F', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (195, N'Spring supports both XML-based and annotation-based configurations.', 1, N't', N'T', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (196, N'Spring Boot is a core module of the Spring Framework.', 1, N't', N'F', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (197, N'In Spring, the default scope of a bean is Prototype.', 1, N't', N'F', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (198, N'Spring AOP is used for aspect-oriented programming.', 1, N't', N'T', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (199, N'The @Autowired annotation can only be used on setter methods.', 1, N't', N'F', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (200, N'Spring provides built-in support for transaction management.', 1, N't', N'T', 1016)
GO
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (201, N'The BeanFactory interface is a part of the core container in Spring.', 1, N't', N'T', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (202, N'The @PostConstruct annotation is used to destroy a bean in Spring.', 1, N't', N'F', 1016)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (203, N'What does UX stand for in UI/UX Design?', 1, N'm', N'B', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (204, N'Which of the following is a key principle of good UI design?', 2, N'm', N'C', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (205, N'What is the purpose of a wireframe in UI/UX design?', 2, N'm', N'A', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (206, N'Which of the following is NOT a usability heuristic by Jakob Nielsen?', 3, N'm', N'D', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (207, N'What is the primary goal of usability testing?', 2, N'm', N'B', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (208, N'Which color scheme uses shades of a single color?', 1, N'm', N'C', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (209, N'What is the purpose of a persona in UX design?', 2, N'm', N'A', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (210, N'Which of the following is a common tool for creating UI prototypes?', 2, N'm', N'D', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (211, N'What does the term "responsive design" refer to?', 3, N'm', N'B', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (212, N'Which of the following is a key element of good UX design?', 2, N'm', N'C', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (213, N'UI design focuses on the overall feel of the product, while UX design focuses on its look and layout', 2, N't', N'f', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (214, N'A well-designed user interface should prioritize aesthetics over usability.', 3, N't', N'f', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (215, N'Wireframing is a process used in UI/UX design to create a visual blueprint of an application or webs', 2, N't', N't', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (216, N'User personas help designers understand the target audience and their needs.', 2, N't', N't', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (217, N'Good UX design ensures that a product is only visually appealing, without considering usability.', 3, N't', N'f', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (218, N'A/B testing is a method used to compare two different design versions to determine which performs be', 2, N't', N't', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (219, N'The principle of consistency in UI design helps users interact with an interface more efficiently.', 2, N't', N't', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (220, N'Color contrast does not affect the readability of text in UI design.', 1, N't', N'f', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (221, N'Usability testing involves real users interacting with a product to identify areas for improvement.', 3, N't', N't', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (222, N'Microinteractions, such as button animations, are insignificant in UI/UX design.', 1, N't', N'f', 1017)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (223, N'Which of the following is NOT a stage of the Design Thinking process?', 3, N'm', N'D', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (224, N'What is the primary goal of the Empathize phase in Design Thinking?', 2, N'm', N'A', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (225, N'Which phase of Design Thinking involves brainstorming and coming up with creative solutions?', 2, N'm', N'C', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (226, N'What is a key characteristic of the Prototype phase?', 2, N'm', N'B', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (227, N'Which of the following best describes the Design Thinking approach?', 1, N'm', N'A', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (228, N'What happens in the Test phase of Design Thinking?', 3, N'm', N'D', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (229, N'Which of the following is true about Design Thinking?', 2, N'm', N'B', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (230, N'What is the main purpose of defining the problem in Design Thinking?', 3, N'm', N'A', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (231, N'Why is prototyping important in Design Thinking?', 2, N'm', N'C', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (232, N'Which of the following best describes the mindset required for Design Thinking?', 1, N'm', N'D', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (233, N'Design Thinking is a linear process that must be followed in a fixed sequence.', 3, N'T', N'F', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (234, N'Empathy is the first stage of Design Thinking, where designers seek to understand users’ needs.', 2, N'T', N'T', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (235, N'The Ideate phase in Design Thinking focuses on implementing the final solution.', 2, N'T', N'F', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (236, N'Prototyping in Design Thinking helps teams explore multiple solutions before selecting the best one.', 3, N'T', N'T', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (237, N'Design Thinking is only useful in product design and has no application in other fields.', 1, N'T', N'F', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (238, N'The Define phase is where the problem statement is clearly formulated based on user research.', 2, N'T', N'T', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (239, N'In Design Thinking, user feedback is only collected after the final product is launched.', 3, N'T', N'F', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (240, N'The Test phase in Design Thinking involves gathering feedback from users to refine the solution.', 2, N'T', N'T', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (241, N'Design Thinking prioritizes business needs over user needs.', 3, N'T', N'F', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (242, N'Design Thinking is an iterative process that encourages continuous improvement based on feedback.', 1, N'T', N'T', 1018)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (243, N'Which of the following is a relational database management system (RDBMS)?', 1, N'm', N'C', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (244, N'Which SQL keyword is used to retrieve unique values?', 1, N'm', N'A', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (245, N'Which of the following is a NoSQL database?', 1, N'm', N'D', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (246, N'What does ACID stand for in database transactions?', 1, N'm', N'B', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (247, N'Which of the following is used to establish a relationship between two tables?', 1, N'm', N'C', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (248, N'Which SQL command is used to remove a table permanently?', 1, N'm', N'B', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (249, N'Which type of join returns only the matching rows from both tables?', 1, N'm', N'A', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (250, N'Which SQL function is used to count the number of rows in a table?', 1, N'm', N'D', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (251, N'Which command is used to add a new column to an existing table?', 1, N'm', N'C', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (252, N'Which normal form eliminates partial dependency?', 1, N'm', N'B', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (253, N'A primary key can have duplicate values in a table.', 1, N't', N'F', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (254, N'A foreign key must always reference a primary key in another table.', 1, N't', N'T', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (255, N'SQL is a case-sensitive language.', 1, N't', N'F', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (256, N'Indexes improve the performance of queries in a database.', 1, N't', N'T', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (257, N'In a relational database, a table can have multiple primary keys.', 1, N't', N'F', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (258, N'A LEFT JOIN returns all rows from the left table and only matching rows from the right table.', 1, N't', N'T', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (259, N'DDL commands in SQL are used to modify data records.', 1, N'T', N'F', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (260, N'Normalization is used to reduce data redundancy in a database.', 1, N't', N'T', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (261, N'The COUNT() function in SQL is used to find the sum of numeric columns.', 1, N't', N'F', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (262, N'Denormalization can improve query performance by reducing the number of joins.', 1, N't', N'T', 1019)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (263, N'Which Excel function is used to find the average of a range of numbers?', 1, N'm', N'B', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (264, N'Which Excel tool is used to summarize data dynamically?', 1, N'm', N'C', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (265, N'Which function is used to count the number of numeric values in a range?', 1, N'm', N'A', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (266, N'What does the VLOOKUP function do in Excel?', 1, N'm', N'D', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (267, N'Which feature allows you to remove duplicate values from a dataset in Excel?', 1, N'm', N'B', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (268, N'Which function is used to combine text from multiple cells in Excel?', 1, N'm', N'C', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (269, N'Which chart type is best for showing trends over time?', 1, N'm', N'A', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (270, N'What does the COUNTIF function do?', 1, N'm', N'D', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (271, N'Which Excel function returns the highest value in a range?', 1, N'm', N'B', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (272, N'Which shortcut key is used to refresh a Pivot Table in Excel?', 1, N'm', N'A', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (273, N'Excel can be used for data visualization.', 1, N't', N'T', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (274, N'Pivot Tables cannot be used for data summarization.', 1, N't', N'F', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (275, N'The SUM function in Excel can only add two numbers.', 1, N't', N'F', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (276, N'Conditional Formatting in Excel allows you to change the appearance of cells based on conditions.', 1, N't', N'T', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (277, N'The VLOOKUP function can search both horizontally and vertically.', 1, N't', N'F', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (278, N'Excel allows for real-time collaboration on shared documents.', 1, N't', N'T', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (279, N'You cannot filter data in Excel.', 1, N't', N'F', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (280, N'The COUNTIF function counts cells based on a given condition.', 1, N't', N'T', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (281, N'Excel has built-in statistical functions for data analysis.', 1, N't', N'T', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (282, N'Excel does not support data filtering by multiple conditions.', 1, N't', N'F', 1020)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (283, N'Which of the following is a popular Python library for data analysis?', 1, N'm', N'D', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (284, N'Which tool is commonly used for data visualization?', 1, N'm', N'B', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (285, N'Which SQL command is used to retrieve data from a database?', 1, N'm', N'C', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (286, N'Which of the following is an open-source big data processing framework?', 1, N'm', N'A', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (287, N'Which Python library is used for machine learning?', 1, N'm', N'B', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (288, N'Which of the following is NOT a data type in Pandas?', 1, N'm', N'C', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (289, N'Which of the following is used for deep learning?', 1, N'm', N'B', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (290, N'Which library is used for working with large datasets in Python?', 1, N'm', N'A', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (291, N'Which of the following is NOT a cloud computing platform?', 1, N'm', N'D', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (292, N'Which of these tools is primarily used for statistical computing?', 1, N'm', N'A', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (293, N'Pandas is a Python library used for image processing.', 1, N't', N'F', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (294, N'SQL is used to manipulate and query structured data in relational databases.', 1, N't', N'T', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (295, N'Jupyter Notebook is an integrated development environment for C++.', 1, N't', N'F', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (296, N'Data science does not involve programming.', 1, N't', N'F', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (297, N'Seaborn is built on top of Matplotlib and is used for statistical data visualization.', 1, N't', N'T', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (298, N'Machine learning models cannot be deployed on cloud platforms like AWS.', 1, N't', N'F', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (299, N'NumPy provides support for multi-dimensional arrays in Python.', 1, N't', N'T', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (300, N'A DataFrame in Pandas is similar to a table in SQL.', 1, N't', N'T', 1021)
GO
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (301, N'Power BI is a tool used for data visualization.', 1, N't', N'T', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (302, N'Apache Spark is an SQL database management system.', 1, N't', N'F', 1021)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (303, N'What is the primary goal of operations research?', 2, N'm', N'C', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (304, N'Which of the following is a common technique used in linear programming?', 2, N'm', N'A', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (305, N'What is a feasible solution in optimization?', 2, N'm', N'B', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (306, N'Which of the following is an example of a deterministic model?', 3, N'm', N'C', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (307, N'What is the purpose of sensitivity analysis in operations research?', 2, N'm', N'D', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (308, N'Which of the following is a key component of a linear programming model?', 2, N'm', N'A', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (309, N'What is the main purpose of the transportation problem in operations research?', 3, N'm', N'B', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (310, N'Which of the following is a characteristic of a stochastic model?', 2, N'm', N'C', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (311, N'What is the role of constraints in an optimization problem?', 2, N'm', N'D', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (312, N'Which of the following is a common application of queuing theory?', 2, N'm', N'A', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (313, N'Operations research focuses on optimizing decision-making processes.', 2, N't', N't', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (314, N'Linear programming is a technique used for solving nonlinear optimization problems.', 2, N't', N'f', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (315, N'A feasible solution must satisfy all constraints of an optimization problem.', 2, N't', N't', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (316, N'Sensitivity analysis is used to study the effect of changes in the objective function.', 3, N't', N'f', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (317, N'The Simplex method is used to solve linear programming problems.', 2, N't', N't', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (318, N'Stochastic models include uncertainty and randomness.', 2, N't', N't', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (319, N'The transportation problem aims to maximize profit.', 2, N't', N'f', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (320, N'Constraints in an optimization problem define the feasible region.', 2, N't', N't', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (321, N'Queuing theory is used to optimize waiting lines in service systems.', 2, N't', N't', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (322, N'Deterministic models always include random variables.', 2, N't', N'f', 1022)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (323, N'What is the primary function of an Information Power Center?', 2, N'm', N'C', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (324, N'Which of the following is NOT a characteristic of an Information Power Center?', 2, N'm', N'B', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (325, N'Which technology is most commonly associated with Information Power Centers for managing large datas', 3, N'm', N'D', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (326, N'What is the role of a data warehouse in an Information Power Center?', 2, N'm', N'C', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (327, N'What is the key benefit of cloud computing in the context of an Information Power Center?', 3, N'm', N'A', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (328, N'Which of the following best defines a data lake in an Information Power Center?', 2, N'm', N'B', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (329, N'What is the importance of data security in an Information Power Center?', 2, N'm', N'D', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (330, N'Which component is essential for providing business intelligence in an Information Power Center?', 2, N'm', N'C', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (331, N'How does big data impact an Information Power Center?', 3, N'm', N'B', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (332, N'What is the role of an analytics platform in an Information Power Center?', 3, N'm', N'A', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (333, N'An Information Power Center primarily focuses on centralized data management and processing.', 2, N't', N'T', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (334, N'Data lakes are typically used to store only structured data for quick access.', 2, N't', N'F', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (335, N'Cloud computing offers flexibility and scalability for managing large volumes of data in an Informat', 3, N't', N'T', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (336, N'Data security is not a major concern in Information Power Centers as data is typically not sensitive', 1, N't', N'F', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (337, N'A data warehouse in an Information Power Center stores raw and unprocessed data.', 2, N't', N'F', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (338, N'Business intelligence tools are important for analyzing data and deriving insights in Information Po', 3, N't', N'T', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (339, N'Big data processing tools are not required for managing large datasets in Information Power Centers.', 1, N't', N'F', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (340, N'Information Power Centers can operate without the use of cloud infrastructure.', 2, N't', N'F', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (341, N'A key characteristic of an Information Power Center is the use of centralized processing systems for', 2, N't', N'T', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (342, N'Edge computing is the primary technology for managing data in most Information Power Centers.', 1, N't', N'F', 1023)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (343, N'What is the primary purpose of Business Objects Webi?', 2, N'm', N'B', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (344, N'Which of the following is used to create a semantic layer in Business Objects?', 3, N'm', N'C', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (345, N'Which type of join is supported in a Business Objects Universe?', 2, N'm', N'A', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (346, N'What is a characteristic of a Business Objects Webi report?', 1, N'm', N'D', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (347, N'What is a universe in Business Objects?', 2, N'm', N'B', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (348, N'Which object in a Business Objects Universe is used to represent a table?', 2, N'm', N'A', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (349, N'In Business Objects Webi, which of the following is used to filter report data?', 2, N'm', N'C', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (350, N'What is a Business Objects report’s universe schema?', 3, N'm', N'D', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (351, N'What is the use of measures in a Business Objects Universe?', 2, N'm', N'B', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (352, N'What is the default data source for Business Objects Webi reports?', 3, N'm', N'C', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (353, N'Business Objects Webi allows users to perform ad-hoc reporting and analysis.', 2, N't', N'T', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (354, N'A Business Objects Universe provides a semantic layer between end users and the database.', 3, N't', N'T', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (355, N'In Business Objects Webi, reports cannot be refreshed dynamically based on the data source.', 1, N't', N'F', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (356, N'Business Objects Webi supports the use of complex formulas and custom calculations.', 2, N't', N'T', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (357, N'The Universe in Business Objects is a data storage system used to save reports.', 1, N't', N'F', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (358, N'Business Objects Webi allows for drill-down analysis and interactive reporting.', 3, N't', N'T', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (359, N'In a Business Objects Universe, dimensions represent the data entities like products or customers.', 2, N't', N'T', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (360, N'A Business Objects Universe can be built using multiple data sources.', 3, N't', N'T', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (361, N'Web Intelligence (Webi) reports in Business Objects can only be viewed by administrators.', 1, N't', N'F', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (362, N'The Business Objects Webi tool can generate reports based on both relational and OLAP data sources.', 2, N't', N'T', 1024)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (363, N'What is the primary purpose of a data warehouse?', 2, N'm', N'C', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (364, N'Which of the following is a characteristic of a data warehouse?', 2, N'm', N'B', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (365, N'What is the process of extracting, transforming, and loading data into a data warehouse called?', 2, N'm', N'A', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (366, N'Which of the following is a common data warehouse architecture?', 3, N'm', N'C', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (367, N'What is the role of a fact table in a data warehouse?', 2, N'm', N'D', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (368, N'Which of the following is a type of data warehouse schema?', 2, N'm', N'B', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (369, N'What is the purpose of a dimension table in a data warehouse?', 2, N'm', N'A', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (370, N'Which of the following is a common tool used for ETL processes?', 2, N'm', N'C', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (371, N'What is the difference between a data warehouse and a data mart?', 3, N'm', N'D', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (372, N'Which of the following is a key benefit of using a data warehouse?', 2, N'm', N'B', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (373, N'A data warehouse is designed for transactional processing and real-time queries.', 1, N't', N'F', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (374, N'Data in a data warehouse is typically structured for analytical querying rather than transactional o', 3, N't', N'T', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (375, N'ETL stands for Extract, Transform, and Load, which is the process of moving data into a data warehou', 2, N't', N'T', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (376, N'Data warehousing requires the data to be stored in a normalized structure to improve querying perfor', 1, N't', N'F', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (377, N'OLAP (Online Analytical Processing) systems are typically used with data warehouses for complex quer', 3, N't', N'T', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (378, N'Data warehouses typically support historical data, enabling trends and patterns to be analyzed over ', 2, N't', N'T', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (379, N'A star schema is one of the most common data warehouse schema designs and is based on a fact table c', 2, N't', N'T', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (380, N'Data warehouses are designed to handle a small number of complex, real-time transactions at any give', 1, N't', N'F', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (381, N'Data warehousing typically uses denormalization to improve query performance by reducing the need fo', 2, N't', N'T', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (382, N'A data warehouse generally contains data that is updated in real-time from various operational syste', 1, N't', N'F', 1025)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (383, N'Which of the following is an example of an Enterprise Resource Planning (ERP) system?', 1, N'm', N'B', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (384, N'Which enterprise system is used for managing customer interactions?', 1, N'm', N'C', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (385, N'Which module in an ERP system is responsible for managing financial transactions?', 1, N'm', N'D', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (386, N'Which of the following is NOT a characteristic of Enterprise Systems?', 1, N'm', N'A', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (387, N'What does SCM stand for in enterprise systems?', 1, N'm', N'B', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (388, N'Which of the following companies is a well-known provider of ERP software?', 1, N'm', N'A', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (389, N'Which component of an enterprise system handles employee records and payroll?', 1, N'm', N'D', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (390, N'Which of the following is an advantage of enterprise systems?', 1, N'm', N'C', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (391, N'Which of the following enterprise applications focuses on managing supplier relationships?', 1, N'm', N'B', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (392, N'Which of the following is a key benefit of a centralized database in enterprise systems?', 1, N'm', N'A', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (393, N'ERP systems integrate multiple business functions into a single system.', 1, N't', N'T', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (394, N'A CRM system is primarily used for managing employee records.', 1, N't', N'F', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (395, N'Enterprise systems use a decentralized database to store data.', 1, N't', N'F', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (396, N'Supply Chain Management (SCM) systems help businesses manage supplier relationships.', 1, N't', N'T', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (397, N'Enterprise systems reduce data redundancy by storing data in multiple locations.', 1, N't', N'F', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (398, N'Business Intelligence (BI) tools help companies analyze data for decision-making.', 1, N't', N'T', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (399, N'ERP systems do not support real-time data processing.', 1, N't', N'F', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (400, N'An enterprise system helps in improving communication across departments.', 1, N't', N'T', 1026)
GO
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (401, N'Enterprise systems increase operational costs by requiring more manual work.', 1, N't', N'F', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (402, N'Cloud-based enterprise systems allow for remote access and scalability.', 1, N't', N'T', 1026)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (403, N'Which financial statement shows a company’s financial position at a specific point in time?', 1, N'm', N'A', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (404, N'Which of the following is considered a liability?', 1, N'm', N'C', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (405, N'Revenue minus expenses equals:', 1, N'm', N'D', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (406, N'What is the primary purpose of financial accounting?', 1, N'm', N'B', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (407, N'Which of the following accounts is reported on the income statement?', 1, N'm', N'A', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (408, N'Which financial statement provides information about a company’s cash receipts and payments?', 1, N'm', N'C', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (409, N'The accounting equation is:', 1, N'm', N'B', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (410, N'Which of the following is NOT an asset?', 1, N'm', N'D', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (411, N'What does GAAP stand for in financial accounting?', 1, N'm', N'B', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (412, N'Depreciation is recorded on which financial statement?', 1, N'm', N'C', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (413, N'The balance sheet shows a company’s financial position at a single point in time.', 1, N't', N'T', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (414, N'Liabilities represent the owner’s investment in the business.', 1, N't', N'F', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (415, N'The income statement reports a company’s revenues and expenses over a period of time.', 1, N't', N'T', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (416, N'Assets are resources owned by a company that provide future economic benefits.', 1, N't', N'T', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (417, N'Depreciation expense increases the book value of an asset.', 1, N't', N'F', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (418, N'Retained earnings represent the cumulative net income of a company that has not been distributed as ', 1, N't', N'T', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (419, N'Revenue is recorded when cash is received, regardless of when it is earned.', 1, N't', N'F', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (420, N'A company’s cash flow statement includes operating, investing, and financing activities.', 1, N't', N'T', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (421, N'Financial accounting primarily serves the needs of internal management.', 1, N't', N'F', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (422, N'Accrual accounting records revenues and expenses when they are earned or incurred, not when cash is ', 1, N't', N'T', 1027)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (423, N'What is the primary purpose of project management?', 3, N'm', N'C', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (424, N'Which of the following is NOT one of the project management process groups?', 2, N'm', N'D', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (425, N'In project management, the Triple Constraint refers to which of the following?', 3, N'm', N'A', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (426, N'What is the purpose of a project charter?', 2, N'm', N'C', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (427, N'What is the first step in the project management process?', 1, N'm', N'B', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (428, N'Which project management methodology focuses on short iterations and continuous stakeholder feedback', 2, N'm', N'A', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (429, N'Which of the following best describes a work breakdown structure (WBS)?', 2, N'm', N'D', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (430, N'What does a Gantt chart display in project management?', 1, N'm', N'C', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (431, N'Which of the following is NOT a type of project risk?', 2, N'm', N'D', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (432, N'Which of the following is a key responsibility of a project manager?', 3, N'm', N'B', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (433, N'Project management involves planning, organizing, and managing resources to achieve specific project', 3, N't', N'T', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (434, N'In project management, the scope of a project can change without proper review or documentation.', 2, N't', N'F', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (435, N'A project manager is responsible for completing the project within the allocated time, cost, and sco', 3, N't', N'T', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (436, N'The project initiation phase involves defining the project''s objectives and scope.', 2, N't', N'T', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (437, N'A Gantt chart is used to define the scope of a project.', 1, N't', N'F', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (438, N'Risk management is an essential aspect of project management.', 3, N't', N'T', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (439, N'A project manager’s primary focus is on meeting deadlines, not managing project scope.', 2, N't', N'F', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (440, N'Agile methodology allows for flexible project management and encourages iterative progress.', 3, N't', N'T', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (441, N'The critical path method (CPM) focuses on calculating the minimum project duration by analyzing task', 2, N't', N'T', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (442, N'Project managers should avoid stakeholder involvement once the project is underway to ensure progres', 1, N't', N'F', 1028)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (443, N'Which of the following is the primary goal of software testing?', 3, N'm', N'B', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (444, N'What does a "test case" typically include?', 2, N'm', N'A', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (445, N'Which type of testing verifies the individual components of a system?', 3, N'm', N'C', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (446, N'Which of the following is NOT a type of black-box testing?', 2, N'm', N'D', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (447, N'What is the main goal of regression testing?', 2, N'm', N'B', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (448, N'What is a common risk in software testing?', 3, N'm', N'C', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (449, N'What does the term "alpha testing" refer to?', 2, N'm', N'A', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (450, N'Which type of testing ensures the system works correctly in real-world conditions?', 3, N'm', N'D', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (451, N'Which of the following is an example of performance testing?', 2, N'm', N'C', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (452, N'In the V-Model of software development, testing occurs...', 3, N'm', N'B', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (453, N'Unit testing focuses on testing individual components or modules of a software application.', 2, N't', N't', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (454, N'Integration testing is performed to test the interaction between different modules of a software app', 2, N't', N't', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (455, N'Regression testing is used to ensure that new changes do not introduce new bugs in the existing func', 3, N't', N't', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (456, N'Black-box testing focuses on the internal structure or code of the software application.', 2, N't', N'f', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (457, N'White-box testing is also known as structural testing.', 2, N't', N't', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (458, N'Performance testing is used to evaluate the speed, responsiveness, and stability of a software appli', 2, N't', N't', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (459, N'User Acceptance Testing (UAT) is performed by the development team.', 2, N't', N'f', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (460, N'Test cases are designed to verify that the software meets the specified requirements.', 2, N't', N't', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (461, N'Automated testing is always more effective than manual testing.', 2, N't', N'f', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (462, N'A bug report should include steps to reproduce the issue, expected results, and actual results.', 3, N't', N't', 1029)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (463, N'Which of the following is a primary goal of software quality assurance (SQA)?', 3, N'm', N'A', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (464, N'Which of the following is NOT a type of testing in software quality assurance?', 2, N'm', N'C', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (465, N'What is the purpose of a test plan in software quality assurance?', 3, N'm', N'B', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (466, N'Which of the following is a common software quality metric?', 2, N'm', N'D', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (467, N'Which of the following is an example of black-box testing?', 1, N'm', N'C', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (468, N'What is the difference between alpha testing and beta testing?', 3, N'm', N'A', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (469, N'Which of the following is a type of functional testing?', 2, N'm', N'B', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (470, N'What does the term "defect density" refer to?', 1, N'm', N'C', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (471, N'Which of the following is NOT an essential phase of the software testing life cycle?', 2, N'm', N'C', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (472, N'What is the main advantage of automated testing?', 3, N'm', N'D', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (473, N'Software Quality Assurance ensures that software products meet the required standards.', 3, N't', N'T', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (474, N'Quality Assurance focuses primarily on defect prevention rather than defect detection.', 2, N't', N'T', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (475, N'Alpha testing is performed by users outside the organization.', 2, N't', N'F', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (476, N'Functional testing focuses on verifying the software’s specific functions and features.', 3, N't', N'T', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (477, N'A test plan includes details about test cases, resources, and schedules.', 2, N't', N'T', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (478, N'Regression testing is done to ensure that new changes in the software do not affect the existing fun', 3, N't', N'T', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (479, N'Unit testing is performed by the developers to verify individual components of the software.', 2, N't', N'T', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (480, N'Performance testing checks if the software can handle expected user loads under normal conditions.', 2, N't', N'T', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (481, N'The goal of load testing is to determine if the software meets its performance specifications under ', 3, N't', N'T', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (482, N'Defect density measures the number of defects per unit of software code or functionality.', 1, N't', N'T', 1030)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (483, N'Which type of testing ensures that new changes do not break existing functionality?', 1, N'm', N'B', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (484, N'What does Selenium automate?', 1, N'm', N'C', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (485, N'Which testing method focuses on the internal structure of the code?', 1, N'm', N'A', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (486, N'Which of the following is NOT a type of automation testing tool?', 1, N'm', N'D', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (487, N'What is the main purpose of load testing?', 1, N'm', N'B', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (488, N'Which of these is a continuous testing tool?', 1, N'm', N'C', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (489, N'What is the purpose of smoke testing?', 1, N'm', N'A', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (490, N'Which type of testing focuses on how fast a system responds under a given workload?', 1, N'm', N'B', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (491, N'What is an assertion in automated testing?', 1, N'm', N'D', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (492, N'Which testing framework is commonly used with Java for automation?', 1, N'm', N'A', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (493, N'Black box testing focuses on verifying the functionality of the application without knowing its inte', 1, N't', N'T', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (494, N'Unit testing is performed before integration testing.', 1, N't', N'T', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (495, N'Performance testing checks whether the software meets business requirements.', 1, N't', N'F', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (496, N'JMeter is used for automation of mobile applications.', 1, N't', N'F', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (497, N'Smoke testing is a type of non-functional testing.', 1, N't', N'F', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (498, N'Selenium can automate testing for both web and mobile applications.', 1, N't', N'F', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (499, N'Regression testing is performed to check that new changes do not break existing functionality.', 1, N't', N'T', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (500, N'Functional testing is mainly concerned with the user interface and design of an application.', 1, N't', N'F', 1031)
GO
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (501, N'Automated testing eliminates the need for manual testing completely.', 1, N't', N'F', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (502, N'Load testing helps determine the breaking point of a system under heavy usage.', 1, N't', N'T', 1031)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (503, N'Which of the following is a key characteristic of deep learning?', 1, N'm', N'D', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (504, N'Which activation function is commonly used to introduce non-linearity in deep learning models?', 1, N'm', N'B', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (505, N'What does a convolutional neural network (CNN) primarily focus on?', 1, N'm', N'A', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (506, N'Which type of neural network is best suited for sequential data like speech and text?', 1, N'm', N'C', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (507, N'What is the main purpose of dropout in deep learning?', 1, N'm', N'B', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (508, N'Which of the following is a key advantage of transfer learning?', 1, N'm', N'A', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (509, N'What is the primary purpose of a loss function in deep learning?', 1, N'm', N'D', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (510, N'Which optimizer is commonly used to train deep learning models?', 1, N'm', N'B', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (511, N'What is the vanishing gradient problem in deep learning?', 1, N'm', N'C', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (512, N'What is a common method to speed up deep learning training?', 1, N'm', N'A', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (513, N'Deep learning models can learn features automatically without human intervention.', 1, N't', N'T', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (514, N'ReLU is a commonly used activation function in deep learning.', 1, N't', N'T', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (515, N'A deeper neural network always performs better than a shallow network.', 1, N't', N'F', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (516, N'Convolutional Neural Networks (CNNs) are primarily used for natural language processing tasks.', 1, N't', N'F', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (517, N'Overfitting occurs when a deep learning model generalizes well to new data.', 1, N't', N'F', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (518, N'Dropout is a regularization technique used to prevent overfitting.', 1, N't', N'T', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (519, N'Transfer learning helps in training deep learning models from scratch every time.', 1, N't', N'F', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (520, N'Gradient descent is used to optimize deep learning models.', 1, N't', N'T', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (521, N'The vanishing gradient problem affects deep networks by slowing down learning.', 1, N't', N'T', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (522, N'Deep learning models require a large amount of labeled data to perform well.', 1, N't', N'T', 1032)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (523, N'Which of the following is an example of supervised learning?', 1, N'm', N'C', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (524, N'In supervised learning, the training data contains:', 1, N'm', N'B', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (525, N'Which algorithm is commonly used for classification problems in supervised learning?', 1, N'm', N'D', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (526, N'Which of the following is a supervised learning algorithm?', 1, N'm', N'A', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (527, N'Which metric is commonly used to evaluate classification models?', 1, N'm', N'C', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (528, N'Which statement is true about supervised learning?', 1, N'm', N'B', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (529, N'Which of the following is a key disadvantage of supervised learning?', 1, N'm', N'D', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (530, N'What type of supervised learning algorithm is used for predicting continuous values?', 1, N'm', N'A', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (531, N'Which of the following is an example of a classification problem?', 1, N'm', N'B', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (532, N'What is the primary goal of supervised learning?', 1, N'm', N'C', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (533, N'Supervised learning requires labeled data.', 1, N't', N'T', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (534, N'Regression is a type of supervised learning.', 1, N't', N'T', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (535, N'Supervised learning models cannot be used for classification problems.', 1, N't', N'F', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (536, N'Support Vector Machines (SVM) are used for both classification and regression.', 1, N't', N'T', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (537, N'K-Means is a supervised learning algorithm.', 1, N't', N'F', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (538, N'Supervised learning can be used to predict future trends based on past data.', 1, N't', N'T', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (539, N'Supervised learning algorithms do not require a target variable.', 1, N't', N'F', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (540, N'Overfitting occurs when a model learns the noise in the training data instead of the pattern.', 1, N't', N'T', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (541, N'Supervised learning cannot be used in healthcare applications.', 1, N't', N'F', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (542, N'Decision Trees can be used for both classification and regression tasks.', 1, N't', N'T', 1033)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (543, N'What is the probability of getting a heads in a fair coin toss?', 1, N'm', N'B', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (544, N'What is the sum of probabilities of all possible outcomes in a sample space?', 1, N'm', N'C', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (545, N'Which of the following distributions is used to model the number of successes in a fixed number of t', 1, N'm', N'A', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (546, N'What is the expected value of a fair six-sided die roll?', 1, N'm', N'D', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (547, N'Which of the following is a measure of central tendency?', 1, N'm', N'A', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (548, N'Which of the following statements is true for a normal distribution?', 1, N'm', N'C', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (549, N'What is the standard deviation a measure of?', 1, N'm', N'D', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (550, N'In probability, two events are independent if:', 1, N'm', N'B', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (551, N'Which theorem is used to update probabilities based on new evidence?', 1, N'm', N'C', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (552, N'What is the probability of drawing a heart from a standard deck of 52 cards?', 1, N'm', N'A', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (553, N'The probability of an event is always between 0 and 1.', 1, N't', N'T', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (554, N'The mean of a dataset is always greater than the median.', 1, N't', N'F', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (555, N'A normal distribution is symmetric about the mean.', 1, N't', N'T', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (556, N'A probability of 0 means an event is certain to happen.', 1, N't', N'F', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (557, N'The standard deviation measures the spread of data around the mean.', 1, N't', N'T', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (558, N'Independent events always have equal probabilities.', 1, N't', N'F', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (559, N'The sum of probabilities of all outcomes in a sample space is 1.', 1, N't', N'T', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (560, N'If two events are mutually exclusive, they cannot happen at the same time.', 1, N't', N'T', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (561, N'The median is affected by extreme values in a dataset.', 1, N't', N'F', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (562, N'Bayes’ Theorem is used for conditional probability.', 1, N't', N'T', 1034)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (563, N'Multiple inheretence is allowed in c++', 1, N't', N'T', 1009)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (564, N'What is a key Agile principle?
', 2, N'm', N'B', 1010)
INSERT [dbo].[questions] ([id], [body], [mark], [type], [ans], [crs_id]) VALUES (566, N'what is a program', 1, N'm', N'A', 1008)
SET IDENTITY_INSERT [dbo].[questions] OFF
GO
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (42, 10001, 26, N't')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (42, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (42, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (42, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (42, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (43, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (43, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (43, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (43, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (43, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (45, 10001, 30, N't')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (45, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (45, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (45, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (45, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10001, 35, N't')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10007, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10008, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10009, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10010, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10011, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10020, 30, N't')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (46, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (47, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (47, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (47, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (47, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (47, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (48, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (48, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (48, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (48, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (48, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (49, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (49, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (49, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (49, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (49, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (50, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (50, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (50, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (50, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (50, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (51, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (51, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (51, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (51, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (51, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (52, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (52, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (52, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (52, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (52, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (53, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (53, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (53, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (53, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (53, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (54, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (54, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (54, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (54, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (54, 10026, 0, N'm')
GO
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (55, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (55, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (55, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (55, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (55, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (59, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (59, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (59, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (59, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (59, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (60, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (60, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (60, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (60, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (60, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (61, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (61, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (61, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (61, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (61, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (62, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (62, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (62, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (62, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (62, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (63, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (63, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (63, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (63, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (63, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (64, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (64, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (64, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (64, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (64, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (65, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (65, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (65, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (65, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (65, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (66, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (66, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (66, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (66, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (66, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (67, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (67, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (67, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (67, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (67, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (68, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (68, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (68, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (68, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (68, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (69, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (69, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (69, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (69, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (69, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (70, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (70, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (70, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (70, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (70, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (71, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (71, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (71, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (71, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (71, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (72, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (72, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (72, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (72, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (72, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (73, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (73, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (73, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (73, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (73, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (74, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (74, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (74, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (74, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (74, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (75, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (75, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (75, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (75, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (75, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (76, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (76, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (76, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (76, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (76, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (77, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (77, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (77, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (77, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (77, 10016, 0, N'm')
GO
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (78, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (78, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (78, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (78, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (78, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (79, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (79, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (79, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (79, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (79, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (80, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (80, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (80, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (80, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (80, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (81, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (81, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (81, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (81, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (81, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (82, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (82, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (82, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (82, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (82, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (83, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (83, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (83, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (83, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (83, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (84, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (84, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (84, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (84, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (84, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (85, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (85, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (85, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (85, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (85, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (86, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (86, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (86, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (86, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (86, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (87, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (88, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (89, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (89, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (89, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (89, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (89, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10007, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10008, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10009, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10010, 0, N'm')
GO
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10011, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (90, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10007, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10008, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10009, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10010, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10011, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (91, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10007, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10008, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10009, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10010, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10011, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10020, 0, N'm')
GO
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (92, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10001, 41, N't')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10007, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10008, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10009, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10010, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10011, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (93, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10007, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10008, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10009, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10010, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10011, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10030, 0, N'm')
GO
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (94, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10007, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10008, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10009, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10010, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10011, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (95, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (96, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (97, 10045, 0, N'm')
GO
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (98, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (99, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (99, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (99, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (99, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (99, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (100, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (100, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (100, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (100, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (100, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (101, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (101, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (101, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (101, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (101, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (102, 10001, 35, N't')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (102, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (102, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (102, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (102, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (103, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (103, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (103, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (103, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (103, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (104, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (104, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (104, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (104, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (104, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10001, 8, N't')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10007, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10008, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10009, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10010, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10011, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (105, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10005, 0, N'm')
GO
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10007, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10008, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10009, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10010, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10011, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (106, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10007, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10008, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10009, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10010, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10011, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10015, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (107, 10045, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10001, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10002, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10003, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10004, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10005, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10006, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10007, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10008, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10009, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10010, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10011, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10012, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10013, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10014, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10015, 0, N'm')
GO
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10016, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10017, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10018, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10019, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10020, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10021, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10022, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10023, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10024, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10025, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10026, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10027, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10028, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10029, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10030, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10031, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10032, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10033, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10034, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10035, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10036, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10037, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10038, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10039, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10040, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10041, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10042, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10043, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10044, 0, N'm')
INSERT [dbo].[std_ex] ([ex_id], [std_id], [grade], [state]) VALUES (108, 10045, 0, N'm')
GO
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10001, CAST(71.14 AS Decimal(4, 2)), 103)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10002, CAST(0.00 AS Decimal(4, 2)), 111)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10003, CAST(0.00 AS Decimal(4, 2)), 111)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10004, CAST(0.00 AS Decimal(4, 2)), 111)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10005, CAST(0.00 AS Decimal(4, 2)), 111)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10006, CAST(0.00 AS Decimal(4, 2)), 111)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10007, CAST(0.00 AS Decimal(4, 2)), 110)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10008, CAST(0.00 AS Decimal(4, 2)), 110)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10009, CAST(0.00 AS Decimal(4, 2)), 110)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10010, CAST(0.00 AS Decimal(4, 2)), 110)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10011, CAST(0.00 AS Decimal(4, 2)), 110)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10012, CAST(0.00 AS Decimal(4, 2)), 109)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10013, CAST(0.00 AS Decimal(4, 2)), 109)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10014, CAST(0.00 AS Decimal(4, 2)), 109)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10015, CAST(0.00 AS Decimal(4, 2)), 109)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10016, CAST(0.00 AS Decimal(4, 2)), 109)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10017, CAST(0.00 AS Decimal(4, 2)), 108)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10018, CAST(0.00 AS Decimal(4, 2)), 108)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10019, CAST(0.00 AS Decimal(4, 2)), 108)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10020, CAST(85.71 AS Decimal(4, 2)), 108)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10021, CAST(0.00 AS Decimal(4, 2)), 108)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10022, CAST(0.00 AS Decimal(4, 2)), 107)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10023, CAST(0.00 AS Decimal(4, 2)), 107)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10024, CAST(0.00 AS Decimal(4, 2)), 107)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10025, CAST(0.00 AS Decimal(4, 2)), 107)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10026, CAST(0.00 AS Decimal(4, 2)), 107)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10027, CAST(0.00 AS Decimal(4, 2)), 106)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10028, CAST(0.00 AS Decimal(4, 2)), 106)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10029, CAST(0.00 AS Decimal(4, 2)), 106)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10030, CAST(0.00 AS Decimal(4, 2)), 106)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10031, CAST(0.00 AS Decimal(4, 2)), 106)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10032, CAST(0.00 AS Decimal(4, 2)), 105)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10033, CAST(0.00 AS Decimal(4, 2)), 105)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10034, CAST(0.00 AS Decimal(4, 2)), 105)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10035, CAST(0.00 AS Decimal(4, 2)), 105)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10036, CAST(0.00 AS Decimal(4, 2)), 105)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10037, CAST(0.00 AS Decimal(4, 2)), 104)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10038, CAST(0.00 AS Decimal(4, 2)), 104)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10039, CAST(0.00 AS Decimal(4, 2)), 104)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10040, CAST(0.00 AS Decimal(4, 2)), 104)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10041, CAST(0.00 AS Decimal(4, 2)), 104)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10042, CAST(0.00 AS Decimal(4, 2)), 103)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10043, CAST(0.00 AS Decimal(4, 2)), 103)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10044, CAST(0.00 AS Decimal(4, 2)), 103)
INSERT [dbo].[students] ([user_id], [gpa], [track_id]) VALUES (10045, CAST(0.00 AS Decimal(4, 2)), 103)
GO
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1007, N'CPU Scheduling')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1007, N'File System Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1007, N'Introduction to Operating Systems')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1007, N'Memory Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1007, N'Mobile OS (Android & iOS)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1007, N'Process Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1007, N'Security & Protection')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1007, N'Virtualization & Cloud OS')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1008, N'Arrays and Lists')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1008, N'Basic Algorithms and Problem Solving')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1008, N'Control Structures: If-Else, Switch')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1008, N'Data Types and Variables')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1008, N'Error Handling and Debugging')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1008, N'File Input and Output')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1008, N'Functions and Procedures')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1008, N'Introduction to Programming Concepts')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1008, N'Loops: For, While, Do-While')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1008, N'Object-Oriented Programming (OOP)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1009, N'Abstraction in OOP')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1009, N'Classes and Objects')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1009, N'Constructors and Destructors')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1009, N'Encapsulation in OOP')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1009, N'Inheritance in OOP')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1009, N'Interfaces and Abstract Classes')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1009, N'Introduction to Object-Oriented Programming')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1009, N'Method Overloading and Overriding')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1009, N'Object-Oriented Design Principles (SOLID)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1009, N'Polymorphism in OOP')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1010, N'Coding and Implementation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1010, N'Introduction to Software Engineering')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1010, N'Modeling and UML Diagrams')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1010, N'Project Management and Agile Methodology')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1010, N'Requirements Gathering and Analysis')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1010, N'Software Design and Architecture')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1010, N'Software Development Life Cycle (SDLC)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1010, N'Software Maintenance and Documentation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1010, N'Software Testing and Quality Assurance')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1010, N'Version Control and Configuration Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1011, N'Arrays and Superglobals')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1011, N'Control Structures: If-Else, Switch')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1011, N'File Handling in PHP')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1011, N'Functions in PHP')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1011, N'Introduction to PHP Programming')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1011, N'Loops in PHP: For, While')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1011, N'Object-Oriented Programming in PHP')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1011, N'PHP and MySQL Integration')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1011, N'PHP Syntax and Data Types')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1011, N'Setting Up PHP Development Environment')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1012, N'Backup and Recovery in MySQL')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1012, N'Creating and Managing Databases')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1012, N'Indexes and Performance Optimization')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1012, N'Introduction to MySQL Database')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1012, N'Joins in MySQL')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1012, N'MySQL Database Design and Architecture')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1012, N'Normalization and Denormalization')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1012, N'Setting up MySQL Server')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1012, N'SQL Queries: SELECT, INSERT, UPDATE, DELETE')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1012, N'Transactions and ACID Properties')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1013, N'Control Structures: If-Else, When')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1013, N'Coroutines and Asynchronous Programming in Kotlin')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1013, N'Extension Functions in Kotlin')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1013, N'Functions in Kotlin')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1013, N'Introduction to Kotlin Programming')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1013, N'Kotlin Collections and Lambda Expressions')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1013, N'Loops: For, While')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1013, N'Null Safety in Kotlin')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1013, N'Object-Oriented Programming (OOP) in Kotlin')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1013, N'Variables and Data Types in Kotlin')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Android Studio & SDK Setup')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Background Tasks (WorkManager, Services)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Firebase Integration')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Fragments & Navigation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Introduction to Android Development')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Jetpack Components')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Kotlin for Android')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Layouts & UI Design')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Networking & APIs (Retrofit, Volley)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Publishing Apps on Google Play')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'RecyclerView & ListView')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Understanding Activities & Intents')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1014, N'Working with Databases (SQLite & Room)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1015, N'Classes and Objects')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1015, N'Control Structures: If-Else, Switch')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1015, N'Data Types and Variables in Java')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1015, N'Exception Handling in Java')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1015, N'Inheritance and Polymorphism')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1015, N'Introduction to Java Programming')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1015, N'Java Collections Framework')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1015, N'Loops: For, While, Do-While')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1015, N'Multithreading and Concurrency')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1015, N'Object-Oriented Programming (OOP) in Java')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1016, N'Dependency Injection in Spring')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1016, N'Introduction to Spring Framework')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1016, N'Spring AOP (Aspect-Oriented Programming)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1016, N'Spring Boot for Rapid Development')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1016, N'Spring Core and Bean Configuration')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1016, N'Spring Data and JPA (Java Persistence API)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1016, N'Spring JDBC and ORM Integration')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1016, N'Spring MVC (Model-View-Controller)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1016, N'Spring RESTful Web Services')
GO
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1016, N'Spring Security')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1016, N'Spring Testing and Unit Testing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'Design Handoff to Developers')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'Design Systems and Guidelines')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'Information Architecture')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'Interaction Design Principles')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'Introduction to UI/UX Design')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'Mobile App Design Principles')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'UI/UX Tools and Software')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'Usability Testing and Feedback')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'User Research and Personas')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'User-Centered Design Process')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'Visual Design and UI Elements')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1017, N'Wireframing and Prototyping')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1018, N'Collaboration and Teamwork')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1018, N'Design Thinking Mindset')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1018, N'Empathy and User Research')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1018, N'Ideation and Brainstorming')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1018, N'Iterative Design')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1018, N'Problem Framing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1018, N'Prototyping')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1018, N'User Testing and Feedback')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Advanced SQL Queries (Joins, Views, Stored Procedu')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Backup, Recovery & Disaster Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Big Data & Data Warehousing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Case Study & Real-world Applications')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Cloud Databases (AWS RDS, Google Cloud SQL, Azure ')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Database Security & Access Control')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Distributed Databases & Replication')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Entity-Relationship (ER) Modeling')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Indexing & Query Optimization')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Introduction to Databases & DBMS')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Normalization & Database Design')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'NoSQL Databases (MongoDB, Cassandra, Redis)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Relational Database Concepts')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Structured Query Language (SQL)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1019, N'Transactions & Concurrency Control')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Correlation and Regression Analysis')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Data Analysis using Excel')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Data Collection and Cleaning')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Data Visualization Techniques')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Data Wrangling with Pandas and NumPy')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Descriptive and Inferential Statistics')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Exploratory Data Analysis (EDA)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Hypothesis Testing and A/B Testing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Introduction to Business Intelligence (BI)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Introduction to Data Analysis')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Introduction to Machine Learning for Data Analysis')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Reporting and Dashboard Creation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'SQL for Data Analysis')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Time Series Analysis')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1020, N'Types of Data and Data Sources')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Automating Workflows with Python')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Big Data Tools (Hadoop, Spark, Dask)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Cloud Platforms for Data Science (AWS, GCP, Azure)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Data Manipulation with Pandas & NumPy')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Data Science Project Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Data Visualization with Matplotlib & Seaborn')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Deploying Models with Flask & FastAPI')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Introduction to Data Science')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Jupyter Notebook & IDEs')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Machine Learning Libraries (Scikit-learn, TensorFl')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Python for Data Science')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Setting Up the Data Science Environment')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'SQL for Data Science')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Version Control with Git & GitHub')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1021, N'Working with APIs & Web Scraping')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1022, N'Decision Analysis and Game Theory')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1022, N'Duality and Sensitivity Analysis')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1022, N'Integer Programming')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1022, N'Introduction to Operations Research')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1022, N'Linear Programming Models')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1022, N'Network Models')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1022, N'Queuing Theory')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1022, N'Simplex Method')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1022, N'Simulation and Monte Carlo Methods')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1022, N'Transportation and Assignment Problems')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1023, N'Data Transformation Techniques')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1023, N'Error Handling and Debugging')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1023, N'Informatica PowerCenter Designer')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1023, N'Informatica Repository')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1023, N'Introduction to Informatica PowerCenter')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1023, N'Mappings and Transformations')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1023, N'Performance Tuning in Informatica')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1023, N'PowerCenter Architecture')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1023, N'Sessions and Workflows')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1023, N'Source and Target Definitions')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Advanced Query Techniques')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Charts and Visualizations in Webi')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Creating and Managing Universes')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Creating Webi Reports')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Filtering and Sorting Data in Webi')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Introduction to SAP BusinessObjects')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Introduction to Web Intelligence (Webi)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Joins and Contexts in Universe')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Optimizing Universe Performance')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Publishing and Sharing Reports')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Report Scheduling and Distribution')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Security and Access Management in BO')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Understanding BusinessObjects Architecture')
GO
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Universe Design Basics')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1024, N'Using Variables and Formulas in Webi')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Big Data & Cloud Data Warehouses (AWS Redshift, Go')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Business Intelligence & Reporting')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Case Study & Real-world Applications')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Data Governance & Security in Warehousing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Data Integration & Data Cleansing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Data Lakes vs Data Warehouses')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Data Modeling Concepts (Star & Snowflake Schema)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Data Warehouse Architecture')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Data Warehouse Maintenance & Automation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Data Warehouse Tools (Informatica, Talend, SSIS)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Dimensional Modeling & Fact Tables')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'ETL Process (Extract, Transform, Load)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Introduction to Data Warehousing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'OLTP vs OLAP Systems')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1025, N'Performance Optimization & Indexing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1026, N'Big Data and Analytics in Enterprises')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1026, N'Business Process Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1026, N'Cloud Computing in Enterprise Systems')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1026, N'Customer Relationship Management (CRM)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1026, N'Data Integration and Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1026, N'Enterprise Architecture')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1026, N'Enterprise Resource Planning (ERP)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1026, N'Introduction to Enterprise Systems')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1026, N'Security and Risk Management in Enterprise Systems')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1026, N'Supply Chain Management (SCM)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1027, N'Accounting for Assets and Liabilities')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1027, N'Accounting Principles and Standards')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1027, N'Auditing and Internal Controls')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1027, N'Bookkeeping and Journals')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1027, N'Cash Flow Statement')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1027, N'Cost Accounting and Budgeting')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1027, N'Financial Ratios and Analysis')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1027, N'Financial Statements: Balance Sheet')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1027, N'Income Statement and Profit & Loss')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1027, N'Introduction to Financial Accounting')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Agile Project Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Cost Management and Budgeting')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Introduction to Project Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Project Closing and Evaluation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Project Life Cycle and Phases')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Project Monitoring and Control')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Project Planning and Scheduling')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Project Quality Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Project Scope and Requirements Management')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Resource Management and Allocation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Risk Management in Projects')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1028, N'Work Breakdown Structure (WBS)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'Black Box Testing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'Defect Life Cycle and Bug Tracking')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'Introduction to Software Testing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'Regression Testing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'Software Testing Life Cycle (STLC)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'Test Case Design Techniques')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'Test Planning and Test Design')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'Testing Metrics and Reporting')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'Testing Tools Overview')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'Types of Testing: Manual and Automated')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'Unit Testing and Integration Testing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1029, N'White Box Testing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1030, N'Automated Testing Tools and Techniques')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1030, N'Bug Reporting and Tracking')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1030, N'Continuous Integration and Testing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1030, N'Introduction to Software Quality Assurance')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1030, N'Performance Testing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1030, N'Quality Standards and Models (ISO, CMMI)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1030, N'Software Quality Assurance Life Cycle')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1030, N'Test Case Design and Execution')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1030, N'Test Metrics and Reporting')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1030, N'Test Planning and Documentation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1030, N'Types of Testing: Unit, Integration, System, Accep')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Automation Frameworks and Tools')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Challenges in Test Automation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Continuous Integration and Automated Testing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Introduction to Testing and Automation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Manual Testing vs Automated Testing')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Performance Testing Automation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Regression Testing Automation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Reporting and Analytics in Test Automation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Selenium WebDriver for Test Automation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Test Case Design and Automation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Test Planning and Test Strategy')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1031, N'Unit Testing and Test-Driven Development (TDD)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1032, N'Backpropagation and Optimization')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1032, N'Convolutional Neural Networks (CNN)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1032, N'Deep Learning Frameworks (TensorFlow, PyTorch)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1032, N'Generative Adversarial Networks (GANs)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1032, N'Introduction to Neural Networks')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1032, N'Natural Language Processing (NLP) with Deep Learni')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1032, N'Recurrent Neural Networks (RNN)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1032, N'Reinforcement Learning')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1033, N'Classification Techniques')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1033, N'Cross-Validation in Supervised Learning')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1033, N'Decision Trees in Supervised Learning')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1033, N'Introduction to Supervised Learning')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1033, N'K-Nearest Neighbors (KNN)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1033, N'Model Evaluation: Accuracy, Precision, Recall, F1-')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1033, N'Naive Bayes Classifier')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1033, N'Overfitting and Underfitting')
GO
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1033, N'Regression Analysis')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1033, N'Support Vector Machines (SVM)')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1033, N'Types of Supervised Learning Algorithms')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1034, N'Bayes Theorem and Conditional Probability')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1034, N'Central Limit Theorem')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1034, N'Correlation and Regression Analysis')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1034, N'Hypothesis Testing and p-values')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1034, N'Introduction to Probability')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1034, N'Probability Distributions: Discrete and Continuous')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1034, N'Probability Mass Functions and Density Functions')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1034, N'Random Variables and Expected Value')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1034, N'Sampling Distributions and Estimation')
INSERT [dbo].[topics] ([crs_id], [topic]) VALUES (1034, N'Statistical Measures: Mean, Median, Mode')
GO
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (103, 1007, 10046, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (103, 1008, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (103, 1009, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (103, 1010, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (103, 1011, 10064, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (103, 1012, 10063, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (103, 1019, 10063, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (104, 1007, 10046, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (104, 1008, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (104, 1009, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (104, 1010, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (104, 1013, 10064, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (104, 1014, 10064, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (104, 1019, 10063, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (105, 1007, 10046, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (105, 1008, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (105, 1009, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (105, 1010, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (105, 1015, 10056, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (105, 1016, NULL, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (105, 1019, 10063, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (106, 1007, 10046, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (106, 1008, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (106, 1009, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (106, 1010, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (106, 1017, 10046, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (106, 1018, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (106, 1019, 10063, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (107, 1007, 10046, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (107, 1008, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (107, 1009, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (107, 1019, 10063, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (107, 1020, 10057, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (107, 1021, 10057, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (107, 1022, 10058, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (108, 1007, 10046, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (108, 1008, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (108, 1009, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (108, 1019, 10063, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (108, 1023, 10058, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (108, 1024, 10059, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (108, 1025, 10059, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (109, 1007, 10046, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (109, 1008, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (109, 1009, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (109, 1019, 10063, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (109, 1026, 10060, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (109, 1027, 10060, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (109, 1028, 10061, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (110, 1007, 10046, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (110, 1008, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (110, 1009, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (110, 1019, 10063, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (110, 1029, 10052, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (110, 1030, 10053, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (110, 1031, 10054, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (111, 1007, 10046, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (111, 1008, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (111, 1009, 10062, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (111, 1019, 10063, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (111, 1032, 10047, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (111, 1033, 10048, NULL, NULL)
INSERT [dbo].[track_crs] ([track_id], [crs_id], [inst_id], [start_date], [end_date]) VALUES (111, 1034, 10049, NULL, NULL)
GO
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 42, CAST(N'2025-02-02T19:04:51.460' AS DateTime), CAST(N'2025-02-03T19:04:51.467' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 43, CAST(N'2025-02-03T20:12:01.173' AS DateTime), CAST(N'2025-02-04T20:12:01.180' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 45, CAST(N'2025-02-04T00:16:53.853' AS DateTime), CAST(N'2025-02-05T00:16:53.860' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 46, CAST(N'2025-02-04T12:21:09.707' AS DateTime), CAST(N'2025-02-07T12:21:09.713' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 46, CAST(N'2025-02-04T12:21:09.707' AS DateTime), CAST(N'2025-02-07T12:21:09.713' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 46, CAST(N'2025-02-04T12:21:09.707' AS DateTime), CAST(N'2025-02-07T12:21:09.713' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 46, CAST(N'2025-02-04T12:21:09.707' AS DateTime), CAST(N'2025-02-07T12:21:09.713' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 46, CAST(N'2025-02-04T12:21:09.707' AS DateTime), CAST(N'2025-02-07T12:21:09.713' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 46, CAST(N'2025-02-04T12:21:09.707' AS DateTime), CAST(N'2025-02-07T12:21:09.713' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 46, CAST(N'2025-02-04T12:21:09.707' AS DateTime), CAST(N'2025-02-07T12:21:09.713' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (110, 46, CAST(N'2025-02-04T12:21:09.707' AS DateTime), CAST(N'2025-02-07T12:21:09.713' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 46, CAST(N'2025-02-04T12:21:09.707' AS DateTime), CAST(N'2025-02-07T12:21:09.713' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 47, CAST(N'2025-02-04T12:22:15.823' AS DateTime), CAST(N'2025-02-05T12:22:15.847' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 48, CAST(N'2025-02-05T12:24:10.717' AS DateTime), CAST(N'2025-02-08T12:24:10.723' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 49, CAST(N'2025-02-07T12:25:31.030' AS DateTime), CAST(N'2025-02-10T12:25:31.030' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 51, CAST(N'2025-02-04T13:41:12.113' AS DateTime), CAST(N'2025-02-04T13:41:12.117' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 52, CAST(N'2025-02-05T13:42:02.050' AS DateTime), CAST(N'2025-02-06T13:42:02.057' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 53, CAST(N'2025-02-08T13:42:56.087' AS DateTime), CAST(N'2025-02-10T13:42:56.093' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 54, CAST(N'2025-02-04T13:43:11.700' AS DateTime), CAST(N'2025-02-20T13:43:11.703' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 55, CAST(N'2025-02-04T13:50:29.770' AS DateTime), CAST(N'2025-02-06T13:50:29.777' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 59, CAST(N'2025-02-04T14:14:06.393' AS DateTime), CAST(N'2025-02-10T14:14:06.397' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 60, CAST(N'2025-02-04T14:14:43.910' AS DateTime), CAST(N'2025-02-19T14:14:43.913' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 69, CAST(N'2025-02-06T16:08:56.007' AS DateTime), CAST(N'2025-02-12T16:08:56.007' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 70, CAST(N'2025-02-04T16:09:44.900' AS DateTime), CAST(N'2025-02-07T16:09:44.900' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 71, CAST(N'2025-02-27T16:10:29.700' AS DateTime), CAST(N'2025-02-28T16:10:29.700' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 72, CAST(N'2025-02-14T16:11:59.457' AS DateTime), CAST(N'2025-02-15T16:11:59.457' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 73, CAST(N'2025-02-21T16:12:28.837' AS DateTime), CAST(N'2025-02-22T16:12:28.837' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 74, CAST(N'2025-02-13T16:13:19.120' AS DateTime), CAST(N'2025-02-20T16:13:19.120' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 75, CAST(N'2025-02-27T16:14:53.283' AS DateTime), CAST(N'2025-03-01T16:14:53.290' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 76, CAST(N'2025-02-21T16:15:17.493' AS DateTime), CAST(N'2025-02-28T16:15:17.497' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 77, CAST(N'2025-02-04T16:17:20.467' AS DateTime), CAST(N'2025-02-10T16:17:20.470' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 78, CAST(N'2025-02-20T16:18:36.787' AS DateTime), CAST(N'2025-02-21T16:18:36.787' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 79, CAST(N'2025-03-01T16:20:11.313' AS DateTime), CAST(N'2025-03-02T16:20:11.313' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 84, CAST(N'2025-02-07T16:26:27.077' AS DateTime), CAST(N'2025-02-12T16:26:27.077' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 85, CAST(N'2025-02-19T16:28:48.567' AS DateTime), CAST(N'2025-02-20T16:28:48.567' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 86, CAST(N'2025-02-26T16:29:12.653' AS DateTime), CAST(N'2025-02-27T16:29:12.653' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 87, CAST(N'2025-02-04T16:53:54.763' AS DateTime), CAST(N'2025-02-04T16:53:54.770' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 87, CAST(N'2025-02-04T16:53:54.763' AS DateTime), CAST(N'2025-02-04T16:53:54.770' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 87, CAST(N'2025-02-04T16:53:54.763' AS DateTime), CAST(N'2025-02-04T16:53:54.770' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 87, CAST(N'2025-02-04T16:53:54.763' AS DateTime), CAST(N'2025-02-04T16:53:54.770' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 88, CAST(N'2025-02-05T16:54:50.113' AS DateTime), CAST(N'2025-02-07T16:54:50.120' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 88, CAST(N'2025-02-05T16:54:50.113' AS DateTime), CAST(N'2025-02-07T16:54:50.120' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 88, CAST(N'2025-02-05T16:54:50.113' AS DateTime), CAST(N'2025-02-07T16:54:50.120' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 88, CAST(N'2025-02-05T16:54:50.113' AS DateTime), CAST(N'2025-02-07T16:54:50.120' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 90, CAST(N'2025-02-04T18:00:41.550' AS DateTime), CAST(N'2025-02-06T09:00:41.553' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 90, CAST(N'2025-02-04T18:00:41.550' AS DateTime), CAST(N'2025-02-06T09:00:41.553' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 90, CAST(N'2025-02-04T18:00:41.550' AS DateTime), CAST(N'2025-02-06T09:00:41.553' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 90, CAST(N'2025-02-04T18:00:41.550' AS DateTime), CAST(N'2025-02-06T09:00:41.553' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 90, CAST(N'2025-02-04T18:00:41.550' AS DateTime), CAST(N'2025-02-06T09:00:41.553' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 90, CAST(N'2025-02-04T18:00:41.550' AS DateTime), CAST(N'2025-02-06T09:00:41.553' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 90, CAST(N'2025-02-04T18:00:41.550' AS DateTime), CAST(N'2025-02-06T09:00:41.553' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (110, 90, CAST(N'2025-02-04T18:00:41.550' AS DateTime), CAST(N'2025-02-06T09:00:41.553' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 90, CAST(N'2025-02-04T18:00:41.550' AS DateTime), CAST(N'2025-02-06T09:00:41.553' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 50, CAST(N'2025-02-04T13:04:04.283' AS DateTime), CAST(N'2025-02-04T13:04:04.287' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 61, CAST(N'2025-02-04T15:59:01.877' AS DateTime), CAST(N'2025-02-05T15:59:01.877' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 62, CAST(N'2025-02-13T16:00:14.380' AS DateTime), CAST(N'2025-02-14T16:00:14.387' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 63, CAST(N'2025-02-05T16:01:10.477' AS DateTime), CAST(N'2025-02-12T16:01:10.477' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 64, CAST(N'2025-02-20T16:01:58.510' AS DateTime), CAST(N'2025-02-28T16:01:58.517' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 65, CAST(N'2025-02-05T16:04:36.190' AS DateTime), CAST(N'2025-02-06T16:04:36.190' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 66, CAST(N'2025-02-13T16:05:17.400' AS DateTime), CAST(N'2025-02-14T16:05:17.403' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 67, CAST(N'2025-02-05T16:05:46.513' AS DateTime), CAST(N'2025-02-06T16:05:46.517' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 68, CAST(N'2025-02-13T16:06:41.723' AS DateTime), CAST(N'2025-02-20T16:06:41.723' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 80, CAST(N'2025-02-05T16:22:35.067' AS DateTime), CAST(N'2025-02-06T16:22:35.067' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 81, CAST(N'2025-02-20T16:22:59.537' AS DateTime), CAST(N'2025-02-21T16:22:59.537' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 82, CAST(N'2025-02-20T16:25:36.070' AS DateTime), CAST(N'2025-02-21T16:25:36.070' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 83, CAST(N'2025-02-20T16:25:57.857' AS DateTime), CAST(N'2025-02-21T16:25:57.857' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 89, CAST(N'2025-03-01T09:00:36.303' AS DateTime), CAST(N'2025-03-02T09:00:36.307' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 91, CAST(N'2025-02-15T09:00:47.333' AS DateTime), CAST(N'2025-02-18T09:00:47.337' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 91, CAST(N'2025-02-15T09:00:47.333' AS DateTime), CAST(N'2025-02-18T09:00:47.337' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 91, CAST(N'2025-02-15T09:00:47.333' AS DateTime), CAST(N'2025-02-18T09:00:47.337' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 91, CAST(N'2025-02-15T09:00:47.333' AS DateTime), CAST(N'2025-02-18T09:00:47.337' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 91, CAST(N'2025-02-15T09:00:47.333' AS DateTime), CAST(N'2025-02-18T09:00:47.337' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 91, CAST(N'2025-02-15T09:00:47.333' AS DateTime), CAST(N'2025-02-18T09:00:47.337' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 91, CAST(N'2025-02-15T09:00:47.333' AS DateTime), CAST(N'2025-02-18T09:00:47.337' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (110, 91, CAST(N'2025-02-15T09:00:47.333' AS DateTime), CAST(N'2025-02-18T09:00:47.337' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 91, CAST(N'2025-02-15T09:00:47.333' AS DateTime), CAST(N'2025-02-18T09:00:47.337' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 92, CAST(N'2025-02-22T09:00:13.440' AS DateTime), CAST(N'2025-02-23T09:00:13.440' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 92, CAST(N'2025-02-22T09:00:13.440' AS DateTime), CAST(N'2025-02-23T09:00:13.440' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 92, CAST(N'2025-02-22T09:00:13.440' AS DateTime), CAST(N'2025-02-23T09:00:13.440' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 92, CAST(N'2025-02-22T09:00:13.440' AS DateTime), CAST(N'2025-02-23T09:00:13.440' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 92, CAST(N'2025-02-22T09:00:13.440' AS DateTime), CAST(N'2025-02-23T09:00:13.440' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 92, CAST(N'2025-02-22T09:00:13.440' AS DateTime), CAST(N'2025-02-23T09:00:13.440' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 92, CAST(N'2025-02-22T09:00:13.440' AS DateTime), CAST(N'2025-02-23T09:00:13.440' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (110, 92, CAST(N'2025-02-22T09:00:13.440' AS DateTime), CAST(N'2025-02-23T09:00:13.440' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 92, CAST(N'2025-02-22T09:00:13.440' AS DateTime), CAST(N'2025-02-23T09:00:13.440' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 93, CAST(N'2025-02-04T17:36:29.363' AS DateTime), CAST(N'2025-02-06T09:00:29.367' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 93, CAST(N'2025-02-04T17:36:29.363' AS DateTime), CAST(N'2025-02-06T09:00:29.367' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 93, CAST(N'2025-02-04T17:36:29.363' AS DateTime), CAST(N'2025-02-06T09:00:29.367' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 93, CAST(N'2025-02-04T17:36:29.363' AS DateTime), CAST(N'2025-02-06T09:00:29.367' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 93, CAST(N'2025-02-04T17:36:29.363' AS DateTime), CAST(N'2025-02-06T09:00:29.367' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 93, CAST(N'2025-02-04T17:36:29.363' AS DateTime), CAST(N'2025-02-06T09:00:29.367' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 93, CAST(N'2025-02-04T17:36:29.363' AS DateTime), CAST(N'2025-02-06T09:00:29.367' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (110, 93, CAST(N'2025-02-04T17:36:29.363' AS DateTime), CAST(N'2025-02-06T09:00:29.367' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 93, CAST(N'2025-02-04T17:36:29.363' AS DateTime), CAST(N'2025-02-06T09:00:29.367' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 94, CAST(N'2025-02-04T16:27:03.177' AS DateTime), CAST(N'2025-03-02T09:00:44.573' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 94, CAST(N'2025-02-04T16:27:03.177' AS DateTime), CAST(N'2025-03-02T09:00:44.573' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 94, CAST(N'2025-02-04T16:27:03.177' AS DateTime), CAST(N'2025-03-02T09:00:44.573' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 94, CAST(N'2025-02-04T16:27:03.177' AS DateTime), CAST(N'2025-03-02T09:00:44.573' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 94, CAST(N'2025-02-04T16:27:03.177' AS DateTime), CAST(N'2025-03-02T09:00:44.573' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 94, CAST(N'2025-02-04T16:27:03.177' AS DateTime), CAST(N'2025-03-02T09:00:44.573' AS DateTime))
GO
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 94, CAST(N'2025-02-04T16:27:03.177' AS DateTime), CAST(N'2025-03-02T09:00:44.573' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (110, 94, CAST(N'2025-02-04T16:27:03.177' AS DateTime), CAST(N'2025-03-02T09:00:44.573' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 94, CAST(N'2025-02-04T16:27:03.177' AS DateTime), CAST(N'2025-03-02T09:00:44.573' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 95, CAST(N'2025-02-10T17:39:28.107' AS DateTime), CAST(N'2025-02-12T09:00:28.113' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 95, CAST(N'2025-02-10T17:39:28.107' AS DateTime), CAST(N'2025-02-12T09:00:28.113' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 95, CAST(N'2025-02-10T17:39:28.107' AS DateTime), CAST(N'2025-02-12T09:00:28.113' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 95, CAST(N'2025-02-10T17:39:28.107' AS DateTime), CAST(N'2025-02-12T09:00:28.113' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 95, CAST(N'2025-02-10T17:39:28.107' AS DateTime), CAST(N'2025-02-12T09:00:28.113' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 95, CAST(N'2025-02-10T17:39:28.107' AS DateTime), CAST(N'2025-02-12T09:00:28.113' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 95, CAST(N'2025-02-10T17:39:28.107' AS DateTime), CAST(N'2025-02-12T09:00:28.113' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (110, 95, CAST(N'2025-02-10T17:39:28.107' AS DateTime), CAST(N'2025-02-12T09:00:28.113' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 95, CAST(N'2025-02-10T17:39:28.107' AS DateTime), CAST(N'2025-02-12T09:00:28.113' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 96, CAST(N'2025-02-04T21:00:27.173' AS DateTime), CAST(N'2025-02-07T09:00:27.177' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 96, CAST(N'2025-02-04T21:00:27.173' AS DateTime), CAST(N'2025-02-07T09:00:27.177' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 96, CAST(N'2025-02-04T21:00:27.173' AS DateTime), CAST(N'2025-02-07T09:00:27.177' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 96, CAST(N'2025-02-04T21:00:27.173' AS DateTime), CAST(N'2025-02-07T09:00:27.177' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 97, CAST(N'2025-02-10T10:00:33.043' AS DateTime), CAST(N'2025-02-15T09:00:33.047' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 97, CAST(N'2025-02-10T10:00:33.043' AS DateTime), CAST(N'2025-02-15T09:00:33.047' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 97, CAST(N'2025-02-10T10:00:33.043' AS DateTime), CAST(N'2025-02-15T09:00:33.047' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 97, CAST(N'2025-02-10T10:00:33.043' AS DateTime), CAST(N'2025-02-15T09:00:33.047' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 98, CAST(N'2025-03-04T10:00:31.713' AS DateTime), CAST(N'2025-03-10T09:00:31.717' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 98, CAST(N'2025-03-04T10:00:31.713' AS DateTime), CAST(N'2025-03-10T09:00:31.717' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 98, CAST(N'2025-03-04T10:00:31.713' AS DateTime), CAST(N'2025-03-10T09:00:31.717' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 98, CAST(N'2025-03-04T10:00:31.713' AS DateTime), CAST(N'2025-03-10T09:00:31.717' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 99, CAST(N'2025-02-04T22:00:29.943' AS DateTime), CAST(N'2025-02-08T09:00:29.947' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 100, CAST(N'2025-02-15T22:00:22.713' AS DateTime), CAST(N'2025-02-18T09:00:22.713' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 101, CAST(N'2025-03-10T08:00:09.160' AS DateTime), CAST(N'2025-03-11T09:00:09.163' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 102, CAST(N'2025-02-04T18:00:18.520' AS DateTime), CAST(N'2025-02-06T09:00:18.523' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 103, CAST(N'2025-02-15T09:00:31.043' AS DateTime), CAST(N'2025-02-20T09:00:31.047' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 104, CAST(N'2025-03-12T09:00:25.483' AS DateTime), CAST(N'2025-03-13T09:00:25.487' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 105, CAST(N'2025-02-04T17:53:29.857' AS DateTime), CAST(N'2025-02-10T09:00:29.857' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 105, CAST(N'2025-02-04T17:53:29.857' AS DateTime), CAST(N'2025-02-10T09:00:29.857' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 105, CAST(N'2025-02-04T17:53:29.857' AS DateTime), CAST(N'2025-02-10T09:00:29.857' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 105, CAST(N'2025-02-04T17:53:29.857' AS DateTime), CAST(N'2025-02-10T09:00:29.857' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 105, CAST(N'2025-02-04T17:53:29.857' AS DateTime), CAST(N'2025-02-10T09:00:29.857' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 105, CAST(N'2025-02-04T17:53:29.857' AS DateTime), CAST(N'2025-02-10T09:00:29.857' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 105, CAST(N'2025-02-04T17:53:29.857' AS DateTime), CAST(N'2025-02-10T09:00:29.857' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (110, 105, CAST(N'2025-02-04T17:53:29.857' AS DateTime), CAST(N'2025-02-10T09:00:29.857' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 105, CAST(N'2025-02-04T17:53:29.857' AS DateTime), CAST(N'2025-02-10T09:00:29.857' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 106, CAST(N'2025-02-18T09:00:26.237' AS DateTime), CAST(N'2025-02-20T09:00:26.240' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 106, CAST(N'2025-02-18T09:00:26.237' AS DateTime), CAST(N'2025-02-20T09:00:26.240' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 106, CAST(N'2025-02-18T09:00:26.237' AS DateTime), CAST(N'2025-02-20T09:00:26.240' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 106, CAST(N'2025-02-18T09:00:26.237' AS DateTime), CAST(N'2025-02-20T09:00:26.240' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 106, CAST(N'2025-02-18T09:00:26.237' AS DateTime), CAST(N'2025-02-20T09:00:26.240' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 106, CAST(N'2025-02-18T09:00:26.237' AS DateTime), CAST(N'2025-02-20T09:00:26.240' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 106, CAST(N'2025-02-18T09:00:26.237' AS DateTime), CAST(N'2025-02-20T09:00:26.240' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (110, 106, CAST(N'2025-02-18T09:00:26.237' AS DateTime), CAST(N'2025-02-20T09:00:26.240' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 106, CAST(N'2025-02-18T09:00:26.237' AS DateTime), CAST(N'2025-02-20T09:00:26.240' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 107, CAST(N'2025-02-04T16:26:39.300' AS DateTime), CAST(N'2025-03-15T09:00:46.570' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 107, CAST(N'2025-02-04T16:26:39.300' AS DateTime), CAST(N'2025-03-15T09:00:46.570' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 107, CAST(N'2025-02-04T16:26:39.300' AS DateTime), CAST(N'2025-03-15T09:00:46.570' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 107, CAST(N'2025-02-04T16:26:39.300' AS DateTime), CAST(N'2025-03-15T09:00:46.570' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 107, CAST(N'2025-02-04T16:26:39.300' AS DateTime), CAST(N'2025-03-15T09:00:46.570' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 107, CAST(N'2025-02-04T16:26:39.300' AS DateTime), CAST(N'2025-03-15T09:00:46.570' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 107, CAST(N'2025-02-04T16:26:39.300' AS DateTime), CAST(N'2025-03-15T09:00:46.570' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (110, 107, CAST(N'2025-02-04T16:26:39.300' AS DateTime), CAST(N'2025-03-15T09:00:46.570' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 107, CAST(N'2025-02-04T16:26:39.300' AS DateTime), CAST(N'2025-03-15T09:00:46.570' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (103, 108, CAST(N'2025-02-06T23:01:38.633' AS DateTime), CAST(N'2025-02-08T23:01:38.637' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (104, 108, CAST(N'2025-02-06T23:01:38.633' AS DateTime), CAST(N'2025-02-08T23:01:38.637' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (105, 108, CAST(N'2025-02-06T23:01:38.633' AS DateTime), CAST(N'2025-02-08T23:01:38.637' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (106, 108, CAST(N'2025-02-06T23:01:38.633' AS DateTime), CAST(N'2025-02-08T23:01:38.637' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (107, 108, CAST(N'2025-02-06T23:01:38.633' AS DateTime), CAST(N'2025-02-08T23:01:38.637' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (108, 108, CAST(N'2025-02-06T23:01:38.633' AS DateTime), CAST(N'2025-02-08T23:01:38.637' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (109, 108, CAST(N'2025-02-06T23:01:38.633' AS DateTime), CAST(N'2025-02-08T23:01:38.637' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (110, 108, CAST(N'2025-02-06T23:01:38.633' AS DateTime), CAST(N'2025-02-08T23:01:38.637' AS DateTime))
INSERT [dbo].[track_exams] ([track_id], [exam_id], [start_date], [end_date]) VALUES (111, 108, CAST(N'2025-02-06T23:01:38.633' AS DateTime), CAST(N'2025-02-08T23:01:38.637' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tracks] ON 

INSERT [dbo].[tracks] ([id], [name], [dept_id]) VALUES (103, N'Open Source', 18)
INSERT [dbo].[tracks] ([id], [name], [dept_id]) VALUES (104, N'Mobile', 18)
INSERT [dbo].[tracks] ([id], [name], [dept_id]) VALUES (105, N'Java', 18)
INSERT [dbo].[tracks] ([id], [name], [dept_id]) VALUES (106, N'UI', 18)
INSERT [dbo].[tracks] ([id], [name], [dept_id]) VALUES (107, N'Data Science', 19)
INSERT [dbo].[tracks] ([id], [name], [dept_id]) VALUES (108, N'Data Management', 19)
INSERT [dbo].[tracks] ([id], [name], [dept_id]) VALUES (109, N'ERP Consulting', 19)
INSERT [dbo].[tracks] ([id], [name], [dept_id]) VALUES (110, N'Software Testing', 20)
INSERT [dbo].[tracks] ([id], [name], [dept_id]) VALUES (111, N'AI & Machine Learning', 21)
SET IDENTITY_INSERT [dbo].[tracks] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10001, N'John', N'Doe', N'johndoe', N'password123', N's', N'm', N'789123456666')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10002, N'Diana', N'Evans', N'diana.evans1', N'password6', N's', N'f', N'67890163456789')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10003, N'Ethan', N'Harris', N'ethan.harris1', N'password7', N's', N'm', N'78091234567890')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10004, N'Fiona', N'Clark', N'fiona.clark1', N'password8', N's', N'f', N'89012345678902')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10005, N'George', N'Lewis', N'george.lewis1', N'password9', N's', N'm', N'90123456789512')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10006, N'Hannah', N'Walker', N'hannah.walker1', N'password10', N's', N'f', N'01234567590123')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10007, N'Ian', N'Hall', N'ian.hall1', N'password11', N's', N'm', N'12347678901234')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10008, N'Julia', N'Allen', N'julia.allen1', N'password12', N's', N'f', N'23450789012345')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10009, N'Kevin', N'Young', N'kevin.young1', N'password13', N's', N'm', N'34567896123456')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10010, N'Laura', N'King', N'laura.king1', N'password14', N's', N'f', N'45628901234567')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10011, N'Michael', N'Wright', N'michael.wright1', N'password15', N's', N'm', N'16789012345678')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10012, N'Nancy', N'Scott', N'nancy.scott1', N'password16', N's', N'f', N'97890123456789')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10013, N'Oscar', N'Green', N'oscar.green1', N'password17', N's', N'm', N'78001234567890')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10014, N'Paula', N'Adams', N'paula.adams1', N'password18', N's', N'f', N'99012375678901')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10015, N'Quincy', N'Baker', N'quincy.baker1', N'password19', N's', N'm', N'90123456589012')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10016, N'Rachel', N'Gonzalez', N'rachel.gonzalez1', N'password20', N's', N'f', N'01232567890123')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10017, N'Steve', N'Nelson', N'steve.nelson1', N'password21', N's', N'm', N'12345678911234')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10018, N'Tina', N'Carter', N'tina.carter1', N'password22', N's', N'f', N'23456789012745')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10019, N'Ulysses', N'Mitchell', N'ulysses.mitchell1', N'password23', N's', N'm', N'34577890123456')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10020, N'Victoria', N'Perez', N'victoria.perez1', N'password24', N's', N'f', N'45679901234567')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10021, N'Walter', N'Roberts', N'walter.roberts1', N'password25', N's', N'm', N'56789012395678')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10022, N'Xena', N'Turner', N'xena.turner1', N'password26', N's', N'f', N'67290123456789')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10023, N'Yvonne', N'Phillips', N'yvonne.phillips1', N'password27', N's', N'f', N'28901234567890')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10024, N'Zack', N'Campbell', N'zack.campbell1', N'password28', N's', N'm', N'85912345678901')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10025, N'Aaron', N'Parker', N'aaron.parker1', N'password29', N's', N'm', N'90153456789012')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10026, N'Bella', N'Evans', N'bella.evans1', N'password30', N's', N'f', N'01234567895123')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10027, N'Caleb', N'Edwards', N'caleb.edwards1', N'password31', N's', N'm', N'12375678901234')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10028, N'Daisy', N'Collins', N'daisy.collins1', N'password32', N's', N'f', N'23456789002345')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10029, N'Eli', N'Stewart', N'eli.stewart1', N'password33', N's', N'm', N'34567890123056')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10030, N'Fiona', N'Sanchez', N'fiona.sanchez1', N'password34', N's', N'f', N'45678901200567')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10031, N'Gavin', N'Morris', N'gavin.morris1', N'password35', N's', N'm', N'56789812305678')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10032, N'Holly', N'Rogers', N'holly.rogers1', N'password36', N's', N'f', N'67590123456789')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10033, N'Ivan', N'Reed', N'ivan.reed1', N'password37', N's', N'm', N'78905534567890')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10034, N'Jasmine', N'Cook', N'jasmine.cook1', N'password38', N's', N'f', N'89011345678901')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10035, N'Kyle', N'Morgan', N'kyle.morgan1', N'password39', N's', N'm', N'90123455785012')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10036, N'Lily', N'Bell', N'lily.bell1', N'password40', N's', N'f', N'01234567890188')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10037, N'Mason', N'Murphy', N'mason.murphy1', N'password41', N's', N'm', N'12345678990234')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10038, N'Nora', N'Bailey', N'nora.bailey1', N'password42', N's', N'f', N'23456789012995')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10039, N'Owen', N'Rivera', N'owen.rivera1', N'password43', N's', N'm', N'34567898923456')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10040, N'Penny', N'Cooper', N'penny.cooper1', N'password44', N's', N'f', N'45645901234567')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10041, N'Quinn', N'Richardson', N'quinn.richardson1', N'password45', N's', N'm', N'66689012345678')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10042, N'Ruby', N'Cox', N'ruby.cox1', N'password46', N's', N'f', N'67890123456999')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10043, N'Sam', N'Howard', N'sam.howard1', N'password47', N's', N'm', N'78901237767890')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10044, N'Tara', N'Ward', N'tara.ward1', N'password48', N's', N'f', N'89012345608901')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10045, N'Victor', N'Torres', N'victor.torres1', N'password49', N's', N'm', N'92123456789012')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10046, N'Mike', N'Brown', N'mikebrown', N'password123', N'i', N'm', N'123456789111')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10047, N'Jane', N'Smith', N'janesmith', N'securepass', N'i', N'f', N'987654321222')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10048, N'Michael', N'Johnson', N'mjohnson', N'pass456', N'i', N'm', N'456789012333')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10049, N'Emily', N'Davis', N'edavis', N'qwerty123', N'i', N'f', N'321549876444')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10050, N'Chris', N'Brown', N'cbrown', N'testpass', N'i', N'm', N'654321987555')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10051, N'Ahmed', N'Ali', N'ahmed.ali1', N'instructor1', N'i', N'm', N'10000000000001')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10052, N'Sara', N'Mohamed', N'sara.mohamed1', N'instructor2', N'i', N'f', N'10000000000002')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10053, N'Mohamed', N'Khalid', N'mohamed.khalid1', N'instructor3', N'i', N'm', N'10000000000003')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10054, N'Fatima', N'Omar', N'fatima.omar1', N'instructor4', N'i', N'f', N'10000000000004')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10055, N'Khalid', N'Hassan', N'khalid.hassan1', N'instructor5', N'i', N'm', N'10000000000005')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10056, N'Layla', N'Ibrahim', N'layla.ibrahim1', N'instructor6', N'i', N'f', N'10000000000006')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10057, N'Omar', N'Youssef', N'omar.youssef1', N'instructor7', N'i', N'm', N'10000000000007')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10058, N'Aisha', N'Abdullah', N'aisha.abdullah1', N'instructor8', N'i', N'f', N'10000000000008')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10059, N'Youssef', N'Ahmed', N'youssef.ahmed1', N'instructor9', N'i', N'm', N'10000000000009')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10060, N'Mariam', N'Saeed', N'mariam.saeed1', N'instructor10', N'i', N'f', N'10000000000010')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10061, N'Ali', N'Mahmoud', N'ali.mahmoud1', N'instructor11', N'i', N'm', N'10000000000011')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10062, N'Noura', N'Tariq', N'noura.tariq2', N'instructor11', N'i', N'f', N'10000000000012')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10063, N'Tariq', N'Faisal', N'tariq.faisal1', N'instructor13', N'i', N'm', N'10000000000013')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10064, N'Huda', N'Salem', N'huda.salem1', N'instructor14', N'i', N'f', N'10000000000014')
INSERT [dbo].[users] ([id], [first_name], [last_name], [user_name], [pw], [type], [gender], [ssn]) VALUES (10065, N'Faisal', N'Rashid', N'faisal.rashid1', N'instructor15', N'i', N'm', N'10000000000015')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__courses__72E12F1B957DFC44]    Script Date: 2/4/2025 11:56:34 PM ******/
ALTER TABLE [dbo].[courses] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__departme__72E12F1B09EE4292]    Script Date: 2/4/2025 11:56:34 PM ******/
ALTER TABLE [dbo].[departments] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__7C9273C45BFA94C6]    Script Date: 2/4/2025 11:56:34 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__DDDF0AE6C8BA0657]    Script Date: 2/4/2025 11:56:34 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[exams] ADD  DEFAULT ('exam') FOR [title]
GO
ALTER TABLE [dbo].[exams] ADD  CONSTRAINT [DF_Exams_TotalGrade]  DEFAULT ((0)) FOR [total_degree]
GO
ALTER TABLE [dbo].[std_ex] ADD  DEFAULT ((0)) FOR [grade]
GO
ALTER TABLE [dbo].[std_ex] ADD  CONSTRAINT [DF__std_ex__state__7B5B524B]  DEFAULT ('m') FOR [state]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT ((0.00)) FOR [gpa]
GO
ALTER TABLE [dbo].[track_exams] ADD  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[track_exams] ADD  DEFAULT (dateadd(day,(1),getdate())) FOR [end_date]
GO
ALTER TABLE [dbo].[answer_sheets]  WITH CHECK ADD FOREIGN KEY([ex_id])
REFERENCES [dbo].[exams] ([id])
GO
ALTER TABLE [dbo].[answer_sheets]  WITH CHECK ADD FOREIGN KEY([std_id])
REFERENCES [dbo].[students] ([user_id])
GO
ALTER TABLE [dbo].[answer_sheets]  WITH CHECK ADD FOREIGN KEY([q_id])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[departments]  WITH CHECK ADD FOREIGN KEY([mgr_id])
REFERENCES [dbo].[instructors] ([user_id])
GO
ALTER TABLE [dbo].[ex_q]  WITH CHECK ADD FOREIGN KEY([ex_id])
REFERENCES [dbo].[exams] ([id])
GO
ALTER TABLE [dbo].[ex_q]  WITH CHECK ADD FOREIGN KEY([q_id])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[instructors]  WITH CHECK ADD FOREIGN KEY([dept_id])
REFERENCES [dbo].[departments] ([id])
GO
ALTER TABLE [dbo].[instructors]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[options]  WITH CHECK ADD FOREIGN KEY([q_id])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[questions]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[std_ex]  WITH CHECK ADD FOREIGN KEY([ex_id])
REFERENCES [dbo].[exams] ([id])
GO
ALTER TABLE [dbo].[std_ex]  WITH CHECK ADD FOREIGN KEY([std_id])
REFERENCES [dbo].[students] ([user_id])
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[tracks] ([id])
GO
ALTER TABLE [dbo].[topics]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[track_crs]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[track_crs]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[tracks] ([id])
GO
ALTER TABLE [dbo].[track_crs]  WITH CHECK ADD  CONSTRAINT [FK_track_crs_instructors] FOREIGN KEY([inst_id])
REFERENCES [dbo].[instructors] ([user_id])
GO
ALTER TABLE [dbo].[track_crs] CHECK CONSTRAINT [FK_track_crs_instructors]
GO
ALTER TABLE [dbo].[track_exams]  WITH CHECK ADD FOREIGN KEY([exam_id])
REFERENCES [dbo].[exams] ([id])
GO
ALTER TABLE [dbo].[track_exams]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[tracks] ([id])
GO
ALTER TABLE [dbo].[tracks]  WITH CHECK ADD FOREIGN KEY([dept_id])
REFERENCES [dbo].[departments] ([id])
GO
ALTER TABLE [dbo].[answer_sheets]  WITH CHECK ADD CHECK  (([ans]>='a' AND [ans]<='d' OR ([ans]='f' OR [ans]='t')))
GO
ALTER TABLE [dbo].[instructors]  WITH CHECK ADD  CONSTRAINT [con_salary] CHECK  (([salary]>=(0)))
GO
ALTER TABLE [dbo].[instructors] CHECK CONSTRAINT [con_salary]
GO
ALTER TABLE [dbo].[options]  WITH CHECK ADD CHECK  (([num]>='a' AND [num]<='d'))
GO
ALTER TABLE [dbo].[questions]  WITH CHECK ADD CHECK  (([ans]>='a' AND [ans]<='d' OR ([ans]='f' OR [ans]='t')))
GO
ALTER TABLE [dbo].[questions]  WITH CHECK ADD CHECK  (([mark]>(0)))
GO
ALTER TABLE [dbo].[questions]  WITH CHECK ADD CHECK  (([type]='t' OR [type]='m'))
GO
ALTER TABLE [dbo].[std_ex]  WITH CHECK ADD  CONSTRAINT [CK__std_ex__state__7C4F7684] CHECK  (([state]='t' OR [state]='m' OR [state]='a'))
GO
ALTER TABLE [dbo].[std_ex] CHECK CONSTRAINT [CK__std_ex__state__7C4F7684]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [ch_user_type] CHECK  (([type]='s' OR [type]='i'))
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [ch_user_type]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [con_gender] CHECK  (([gender]='f' OR [gender]='m'))
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [con_gender]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [con_ssn] CHECK  ((NOT [ssn] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [con_ssn]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [first_name_const] CHECK  ((NOT [first_name] like '%[^A-Za-z ]%'))
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [first_name_const]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [last_name_const] CHECK  ((NOT [last_name] like '%[^A-Za-z ]%'))
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [last_name_const]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [user_name_const] CHECK  ((NOT [user_name] like '%[^A-Za-z0-9_.]%'))
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [user_name_const]
GO
/****** Object:  StoredProcedure [dbo].[addMCQQuestion]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[addMCQQuestion] 
    @body varchar(100),
    @mark int,
    @type char,
    @ans char,
    @crs_id int,
	@optionA varchar(100),
	@optionB varchar(100),
	@optionC varchar(100),
	@optionD varchar(100)
    --@new_id int OUTPUT -- Output parameter to return the new ID
AS
BEGIN
    BEGIN TRANSACTION;
    -- Insert into the questions table
    INSERT INTO questions (body, mark, type, ans, crs_id)
    VALUES (@body, @mark, @type, @ans, @crs_id);

	DECLARE @question_Id INT = SCOPE_IDENTITY();

	INSERT INTO options (num, q_id, body)
    VALUES ('A', @question_Id, @optionA);

	INSERT INTO options (num, q_id, body)
    VALUES ('B', @question_Id, @optionB);

	INSERT INTO options (num, q_id, body)
    VALUES ('C', @question_Id, @optionC);

	INSERT INTO options (num, q_id, body)
    VALUES ('D', @question_Id, @optionD);
    COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[addTFQuestion]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addTFQuestion] 
    @body varchar(100),
    @mark int,
    @type char,
    @ans char,
    @crs_id int
    
AS
BEGIN
    BEGIN TRANSACTION;
    INSERT INTO questions (body, mark, type, ans, crs_id)
    VALUES (@body, @mark, @type, @ans, @crs_id);
    COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[addtopic]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addtopic]  
    @topicname VARCHAR(50),  
    @courseid INT  
AS  
BEGIN  
    INSERT INTO topics (crs_id, topic)  
    VALUES (@courseid, @topicname);  
END;
GO
/****** Object:  StoredProcedure [dbo].[assignExamToStds]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[assignExamToStds] @examId int , @tracks examTracks readonly
as
begin

	insert into std_ex(ex_id , std_id)
	select @examId, user_id 
	from students
	where track_id in
	(
		select Id
		from @tracks
	)
end
GO
/****** Object:  StoredProcedure [dbo].[assignExamToTracks]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[assignExamToTracks] @examId int ,@startDate datetime,@endDate datetime, @tracks examTracks readonly
as
begin
	begin try
		BEGIN TRANSACTION;
		insert into track_exams
		select id ,@examId, @startDate , @endDate 
		from @tracks
		exec assignExamToStds @examId ,@tracks
		select @examId as id;
		COMMIT TRANSACTION;
	end try
	begin catch
		ROLLBACK TRANSACTION;
		select -1 as id;
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[checkStudent]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[checkStudent] @id int
as
begin
	if not exists(select * from students where user_id = @id)
		select 0
	else
		select 1
end
GO
/****** Object:  StoredProcedure [dbo].[correctAnswers]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[correctAnswers] @studentId int, @examId int, @answers questionAnswer readonly
as
begin
    update std_ex set grade = 
    (
        select SUM(IIF(q.ans = a.answerNum, q.mark, 0))
        from questions q
        join @answers a on q.id = a.questionId
    ), state = 't'
    where std_id = @studentId and ex_id = @examId
    execute updateGPA @studentId
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteExamQ]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteExamQ] @examId int
as
begin
delete
from ex_q
where ex_id = @examId
end
GO
/****** Object:  StoredProcedure [dbo].[generateAnotherExamQ]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[generateAnotherExamQ] @examId int , @courseId int, @tfCount int , @mcqCount int 
as
begin
	begin try
		BEGIN TRANSACTION;
		exec DeleteExamQ @examId
		exec generateRandomQuestions @examId , @courseId , @tfCount  , @mcqCount
		exec updateExamTotalGrade @examId
 		select @examId as id;
		COMMIT TRANSACTION;
	end try
	begin catch
		ROLLBACK TRANSACTION;
		select -1 as id;
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[generateExam]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[generateExam] @courseId int , @tfCount int , @mcqCount int , @duration int , @title varchar(20) 
as 
begin
	BEGIN TRY

		BEGIN TRANSACTION;
		declare @examId int
		insert into exams( duration,title , crs_id)
		values(@duration,@title,@courseId)

		set @examId = scope_identity() 
		exec generateRandomQuestions @examId  ,@courseId ,@tfCount , @mcqCount 
		exec updateExamTotalGrade @examId 
		select @examId as id

		COMMIT TRANSACTION;
	END TRY

	BEGIN CATCH
        ROLLBACK TRANSACTION;
		select -1 as id;
	END CATCH;

end
GO
/****** Object:  StoredProcedure [dbo].[generateRandomQuestions]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[generateRandomQuestions] @examId int, @courseId int, @tfCount int , @mcqCount int 
as 
begin
	insert into ex_q 
	select*
	from
	(
		SELECT TOP (@tfCount)  id, @examId 'ex_id'
		FROM questions
		WHERE crs_id = @courseId  AND type = 't'
		ORDER BY NEWID()

		UNION ALL

		SELECT TOP (@mcqCount)  id, @examId  'ex_id'
		FROM questions
		WHERE crs_id = @courseId  AND type = 'm'
		ORDER BY NEWID()
	) as t
end

GO
/****** Object:  StoredProcedure [dbo].[getCoursesByInstId]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getCoursesByInstId] @instId INT
AS
	BEGIN
	
		SELECT DISTINCT c.id, c.name
		FROM instructors AS i 
		INNER JOIN track_crs AS tcrs
			ON i.user_id = tcrs.inst_id
		inner join courses as c
			ON tcrs.crs_id = c.id
		WHERE i.user_id = @instId
	END;
GO
/****** Object:  StoredProcedure [dbo].[getCourseTopics]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getCourseTopics] @crsId int 
as
begin
	select t.topic
	from courses c inner join topics t
		on c.id =  t.crs_id and c.id = @crsId

end
GO
/****** Object:  StoredProcedure [dbo].[getExam]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getExam] @examId int
as
begin
	select e.duration, e.title, q.id, q.body as q_body, q.type, o.num, o.body as o_body
	from exams e
	join ex_q eq on e.id = eq.ex_id
	join questions q on q.id = eq.q_id
	left join options o on o.q_id = q.id
	where e.id = @examId
end
GO
/****** Object:  StoredProcedure [dbo].[getExamCourseTitle]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getExamCourseTitle] @examId int
as
begin
	select title , e.duration, c.name
	from exams e inner join courses c
	on e.crs_id= c.id and e.id = @examId
end
GO
/****** Object:  StoredProcedure [dbo].[getExamMcqQuestions]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getExamMcqQuestions]  @examId int
as
begin
	select q.body as 'question_body' , q.mark , o.num as'choice_num',o.body as 'choice_body'
	from ex_q eq inner join  questions q 
		on eq.ex_id = @examId and eq.q_id = q.id and q.type = 'm'
	inner join options o
		on q.id = o.q_id
end
GO
/****** Object:  StoredProcedure [dbo].[getExamResult]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getExamResult] @examId int, @studentId int
as
begin
    select Round( ( convert(float, se.grade) / convert(float, e.total_degree) * 100) , 2)
    from std_ex se
    join exams e on e.id = se.ex_id
    where ex_id = @examId and std_id = @studentId
end
GO
/****** Object:  StoredProcedure [dbo].[getExams]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getExams] @studentid int ,@courseid int ,@trakid int
as
begin

select e.id ,e.title , te.start_date as startDate,te.end_date as endDate, se.state as status
from exams e
inner join std_ex se
on e.id=se.ex_id
and se.std_id=@studentid
inner join track_exams te on e.id =te.exam_id
where te.track_id=@trakid and e.crs_id=@courseid 
order by te.end_date desc

end
GO
/****** Object:  StoredProcedure [dbo].[GetExamsIdByCrsId]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetExamsIdByCrsId] @courseId int
as
begin
	select id
	from exams
	where crs_id = @courseId
end
GO
/****** Object:  StoredProcedure [dbo].[getExamTfQuestions]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getExamTfQuestions]  @examId int
as
begin
	select q.body as 'question_body', q.mark
	from ex_q eq inner join  questions q
	on eq.ex_id = @examId and eq.q_id = q.id and q.type = 't'
end
GO
/****** Object:  StoredProcedure [dbo].[getInstructor]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getInstructor] @id int
as
	begin
		select u.id,u.type,u.first_name, u.last_name, i.dept_id ,d.name as dept_name
		from users u 
		inner join instructors i on u.id = i.user_id 
		inner join departments d on d.id = i.dept_id
		where u.id = @id
	end
GO
/****** Object:  StoredProcedure [dbo].[getInstructorClasses]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getInstructorClasses] @id int
as
begin
	select c.id as 'course_id', c.name as 'course_name', t.id as 'track_id', t.name as 'track_name', count(s.user_id) as 'student_numbers'
	from track_crs tc 
	inner join courses c on c.id = tc.crs_id
	inner join tracks t on t.id = tc.track_id
	inner join students s on tc.track_id = s.track_id
	where tc.inst_id = @id
	group by c.id, c.name, t.id, t.name
end
GO
/****** Object:  StoredProcedure [dbo].[getInstructorCourses]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getInstructorCourses] @instId int
as
begin
	select distinct c.name , c.id
	from courses c inner join track_crs tc
	on c.id = tc.crs_id and tc.inst_id = @instId
end
GO
/****** Object:  StoredProcedure [dbo].[getInstructorTracksInCrs]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getInstructorTracksInCrs] @instId int , @crsId int
as
begin
	select t.id , t.name
	from tracks t inner join track_crs tc
	on t.id = tc.track_id and tc.inst_id = @instId and tc.crs_id = @crsId
end
GO
/****** Object:  StoredProcedure [dbo].[getStudent]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getStudent] @id int
as
	begin
		select u.type,u.id,u.first_name, u.last_name, s.gpa, s.track_id, t.name as track_name, t.dept_id ,d.name as dept_name
		from users u 
		inner join students s on u.id = s.user_id 
		inner join tracks t on t.id = s.track_id
		inner join departments d on d.id = t.dept_id
		where u.id = @id
	end
GO
/****** Object:  StoredProcedure [dbo].[getStudentCourseExams]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getStudentCourseExams] @crs_id int, @std_id int
as
begin
	select e.id , e.title
	from std_ex se
	inner join exams e on e.id = se.ex_id
	and se.std_id = @std_id and e.crs_id = @crs_id
	where state = 't'
end
GO
/****** Object:  StoredProcedure [dbo].[getStudentCourses]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getStudentCourses] @id int
as
		begin
        select c.id as id ,c.name as name
        from  students s
		inner join tracks t on t.id = s.track_id
		inner join track_crs tc on tc.track_id = t.id
		inner join  courses c on tc.crs_id = c.id
        where s.user_id = @id
		
end
GO
/****** Object:  StoredProcedure [dbo].[getStudentsByTrack]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getStudentsByTrack]  
   @trackId INT  
AS  
BEGIN  
   SELECT tracks.name as track_name, tracks.id as track_id ,usr.first_name, usr.last_name, stud.gpa
   FROM users AS usr 
   JOIN students AS stud
   on usr.id = stud.user_id
   JOIN tracks
   ON tracks.id = stud.track_id
   WHERE tracks.id = @trackID
END
GO
/****** Object:  StoredProcedure [dbo].[getStudentStats]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getStudentStats] @id int
as
	begin
		if exists(select * from students where user_id = @id)
			begin 
				
				select u.first_name, u.last_name , gpa, c.name as course_name, 
				   ROUND(
						CASE 
							WHEN SUM(ISNULL(se.grade, 0)) = 0 OR SUM(ISNULL(e.total_degree, 0)) = 0 
							THEN 0  -- Handle cases where no exams were taken
							ELSE (CONVERT(FLOAT, SUM(se.grade)) / CONVERT(FLOAT, SUM(e.total_degree)) * 100) 
						END, 2) AS total_grade
				from students s
				inner join users u on u.id = s.user_id
				join track_crs tc on tc.track_id = s.track_id
				inner join courses c on c.id = tc.crs_id
				left join exams e on e.crs_id = c.id
				left join std_ex se on s.user_id = se.std_id and e.id = se.ex_id
				where s.user_id = @id
				group by u.first_name, u.last_name , gpa, c.name
				order by c.name
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[GetTfMcqCount]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTfMcqCount] @courseId int
as
begin
	declare @tfcountTable int ,@mcqCountTable int

	select @tfcountTable = count(*)
	from questions
	where type = 't' and crs_id = @courseId

	select @mcqCountTable = COUNT(*)
	from questions
	where type = 'm'and crs_id = @courseId

	select @tfcountTable 'tf' , @mcqCountTable 'mcq'
end
GO
/****** Object:  StoredProcedure [dbo].[getTrackNamesAndIds]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[getTrackNamesAndIds] @instId INT
    AS
    BEGIN
        SELECT DISTINCT t.id , t.name
		FROM tracks AS t

		INNER JOIN track_crs AS trCrs
		ON t.id = trCrs.track_id

		WHERE trCrs.inst_id = @instId;
    END
GO
/****** Object:  StoredProcedure [dbo].[getTrackStudents]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getTrackStudents]  @id int
as
begin
	select u.id,first_name, last_name
	from tracks t 
	inner join students s on t.id = s.track_id 
	inner join users u on u.id = s.user_id 
	and t.id = @id

end
GO
/****** Object:  StoredProcedure [dbo].[getUser]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getUser] @id int
as
	begin
		select u.type,u.id,u.first_name, u.last_name, u.ssn, u.gender, u.user_name
		from users u 
		where u.id = @id
	end
GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[login] @userName varchar(50), @password varchar(20)
as
	begin
		if exists(select * from users where user_name = @userName and pw = @password)
			begin

				select id, type from users where user_name = @userName
			end 
		else
			begin
					select 0 as id, ' ' as type
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[reviewStudentAnswers]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reviewStudentAnswers] @ex_id int, @std_id int
as
begin
	select newTable.*, o.num 'OptionNum', o.body 'OptionBody'
	from 
	(
		select u.first_name 'FirstName', u.last_name 'LastName', round( (convert(float,se.grade) / e.total_degree) * 100 , 2) as 'Score', q.id , q.body 'QuestionBody', q.type 'QuestionType',sheet.ans 'StudentAnswer', q.ans 'ModelAnswer'
		from answer_sheets sheet
		inner join questions q on q.id = sheet.q_id
		inner join users u on u.id = sheet.std_id
		inner join std_ex se on u.id = se.std_id and sheet.ex_id = se.ex_id
		inner join exams e on e.id = se.ex_id
		AND sheet.ex_id = @ex_id AND sheet.std_id = @std_id  
	) newTable

	left join options o on newTable.id = o.q_id
	order by newTable.id, o.num
end
GO
/****** Object:  StoredProcedure [dbo].[submitAnswers]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[submitAnswers] @studentId int, @examId int, @answers questionAnswer readonly
as
    begin
    if ((select state from std_ex where std_id = @studentId and ex_id = @examId) = 'm')
    begin
       insert into answer_sheets (std_id, ex_id, q_id, ans)
       select @studentId, @examId, questionId, answerNum
       from @answers
       execute correctAnswers @studentId, @examId, @answers
    end
    end
GO
/****** Object:  StoredProcedure [dbo].[updateExamTotalGrade]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateExamTotalGrade] @examId int 
as
begin
	update exams
	set total_degree = (
		select sum(q.mark)
		from exams ex inner join ex_q exq 
			on ex.id = exq.ex_id and ex.id =@examId 
		inner join questions q
			on exq.q_id = q.id
	)
	where id = @examId
end
GO
/****** Object:  StoredProcedure [dbo].[updateFirstName]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateFirstName] @id int, @newFirstName varchar(20)
as
	begin
		update users
		set first_name = @newFirstName
		where id = @id
	end
GO
/****** Object:  StoredProcedure [dbo].[updateGender]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateGender] @id int, @newGender char(1)
as
	begin
		update users
		set gender = @newGender
		where id = @id
	end
GO
/****** Object:  StoredProcedure [dbo].[updateGPA]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateGPA] @studentId int
as
begin
	update students set gpa =
	(
		select round((convert(float, sum(se.grade))/sum(e.total_degree) * 100), 2)
		from std_ex se
		join students s on s.user_id = se.std_id and s.user_id = @studentId and se.std_id = @studentId
		join exams e on se.ex_id = e.id 
		join track_exams te on te.exam_id = e.id and s.track_id = te.track_id
		where se.state = 't' or (se.state = 'm' and DATEADD(HOUR, 7, GETDATE()) > te.end_date)
	)
	where user_id = @studentId
end
GO
/****** Object:  StoredProcedure [dbo].[updateLastName]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateLastName] @id int, @newLastName varchar(20)
as
	begin
		update users
		set last_name = @newLastName
		where id = @id
	end
GO
/****** Object:  StoredProcedure [dbo].[updatePassword]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updatePassword] @id int, @oldPassword varchar(20), @newPassword varchar(20)
as
	begin
		update users
		set pw = @newPassword
		where id = @id and pw = @oldPassword
	end
GO
/****** Object:  StoredProcedure [dbo].[updateSSN]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateSSN] @id int, @newSSN varchar(14)
as
	begin
		update users
		set ssn = @newSSN
		where id = @id
	end
GO
/****** Object:  StoredProcedure [dbo].[updateStudentExamState]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateStudentExamState] @std_id int
as
begin
	update std_ex
	set state = 'm'
	from std_ex se join students s on s.user_id =se.std_id
	join track_exams te on te.track_id = s.track_id 
	where te.end_date < DATEADD(HOUR, 7, GETDATE()) and se.state = 'a' and s.user_id = @std_id
end
GO
/****** Object:  StoredProcedure [dbo].[updateUserName]    Script Date: 2/4/2025 11:56:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateUserName] @id int, @newUserName varchar(50)
as
	begin
		update users
		set user_name = @newUserName
		where id = @id
	end
GO
USE [master]
GO
ALTER DATABASE [e_xam_DB] SET  READ_WRITE 
GO

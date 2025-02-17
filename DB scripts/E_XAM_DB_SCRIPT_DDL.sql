USE [master]
GO
/****** Object:  Database [e_xam_DB]    Script Date: 2/4/2025 11:34:23 PM ******/
CREATE DATABASE [e_xam_DB]
GO
/****** Object:  UserDefinedTableType [dbo].[examTracks]    Script Date: 2/4/2025 11:34:26 PM ******/
CREATE TYPE [dbo].[examTracks] AS TABLE(
	[Id] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[questionAnswer]    Script Date: 2/4/2025 11:34:26 PM ******/
CREATE TYPE [dbo].[questionAnswer] AS TABLE(
	[questionId] [int] NULL,
	[answerNum] [char](1) NULL
)
GO
/****** Object:  Table [dbo].[answer_sheets]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[courses]    Script Date: 2/4/2025 11:34:26 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 2/4/2025 11:34:26 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ex_q]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[exams]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[instructors]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[options]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[questions]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[std_ex]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[students]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[topics]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[track_crs]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[track_exams]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[tracks]    Script Date: 2/4/2025 11:34:26 PM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 2/4/2025 11:34:26 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[addMCQQuestion]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[addTFQuestion]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[addtopic]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[assignExamToStds]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[assignExamToTracks]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[checkStudent]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[correctAnswers]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteExamQ]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[generateAnotherExamQ]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[generateExam]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[generateRandomQuestions]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getCoursesByInstId]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getCourseTopics]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getExam]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getExamCourseTitle]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getExamMcqQuestions]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getExamResult]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getExams]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetExamsIdByCrsId]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getExamTfQuestions]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getInstructor]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getInstructorClasses]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getInstructorCourses]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getInstructorTracksInCrs]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getStudent]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getStudentCourseExams]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getStudentCourses]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getStudentsByTrack]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getStudentStats]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetTfMcqCount]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getTrackNamesAndIds]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getTrackStudents]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getUser]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[reviewStudentAnswers]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[submitAnswers]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[updateExamTotalGrade]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[updateFirstName]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[updateGender]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[updateGPA]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[updateLastName]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[updatePassword]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[updateSSN]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[updateStudentExamState]    Script Date: 2/4/2025 11:34:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[updateUserName]    Script Date: 2/4/2025 11:34:27 PM ******/
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

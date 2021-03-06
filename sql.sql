USE [master]
GO
/****** Object:  Database [LIBTN2D]    Script Date: 11/12/2019 11:09:29 PM ******/
CREATE DATABASE [LIBTN2D]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LIBTN2D', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LIBTN2D.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LIBTN2D_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LIBTN2D_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LIBTN2D] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LIBTN2D].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LIBTN2D] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LIBTN2D] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LIBTN2D] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LIBTN2D] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LIBTN2D] SET ARITHABORT OFF 
GO
ALTER DATABASE [LIBTN2D] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LIBTN2D] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LIBTN2D] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LIBTN2D] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LIBTN2D] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LIBTN2D] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LIBTN2D] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LIBTN2D] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LIBTN2D] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LIBTN2D] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LIBTN2D] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LIBTN2D] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LIBTN2D] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LIBTN2D] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LIBTN2D] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LIBTN2D] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LIBTN2D] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LIBTN2D] SET RECOVERY FULL 
GO
ALTER DATABASE [LIBTN2D] SET  MULTI_USER 
GO
ALTER DATABASE [LIBTN2D] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LIBTN2D] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LIBTN2D] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LIBTN2D] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LIBTN2D] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LIBTN2D', N'ON'
GO
USE [LIBTN2D]
GO
/****** Object:  Table [dbo].[BOOK]    Script Date: 11/12/2019 11:09:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BOOK](
	[idBook] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](50) NULL,
	[idTitle] [int] NOT NULL,
	[borrowed] [bit] NOT NULL,
 CONSTRAINT [PK__BOOK__D80547A17ED23E8A] PRIMARY KEY CLUSTERED 
(
	[idBook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RENTCARD]    Script Date: 11/12/2019 11:09:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RENTCARD](
	[idRentCard] [int] IDENTITY(1,1) NOT NULL,
	[identityCard] [varchar](9) NOT NULL,
	[total] [float] NOT NULL,
	[term] [date] NOT NULL,
	[payDay] [date] NULL,
 CONSTRAINT [PK__RENTCARD__C679773BE5B17084] PRIMARY KEY CLUSTERED 
(
	[idRentCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RENTCARDDETAIL]    Script Date: 11/12/2019 11:09:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RENTCARDDETAIL](
	[idRentCardDetail] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[idBook] [int] NOT NULL,
	[idRentCard] [int] NOT NULL,
	[totalRDT] [float] NOT NULL,
 CONSTRAINT [PK__RENTCARD__242C227607A72560] PRIMARY KEY CLUSTERED 
(
	[idRentCardDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TITLE]    Script Date: 11/12/2019 11:09:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TITLE](
	[idTitle] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NOT NULL,
	[rentCost] [float] NOT NULL,
	[stock] [int] NOT NULL,
	[description] [varchar](max) NULL,
	[nameTitle] [varchar](500) NOT NULL,
	[image] [varchar](100) NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK__TITLE__CC57F59C505AA9EA] PRIMARY KEY CLUSTERED 
(
	[idTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USERLIB]    Script Date: 11/12/2019 11:09:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERLIB](
	[identityCard] [varchar](9) NOT NULL,
	[role] [bit] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[dob] [date] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[fullname] [varchar](250) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
 CONSTRAINT [PK__USERLIB__F67C8D0A1F9A135F] PRIMARY KEY CLUSTERED 
(
	[identityCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BOOK] ON 

INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (1, N'normal', 1, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (2, N'normal', 1, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (3, N'normal', 1, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (4, N'normal', 1, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (5, N'normal', 1, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (6, N'normal', 1, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (7, N'normal', 1, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (8, N'normal', 1, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (9, N'normal', 1, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (10, N'normal', 1, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (11, N'normal', 2, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (12, N'normal', 2, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (13, N'normal', 2, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (14, N'normal', 2, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (15, N'normal', 2, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (16, N'normal', 2, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (17, N'normal', 2, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (18, N'normal', 2, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (19, N'normal', 2, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (20, N'normal', 2, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (21, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (22, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (23, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (24, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (25, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (26, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (27, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (28, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (29, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (30, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (31, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (32, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (33, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (34, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (35, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (36, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (37, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (38, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (39, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (40, N'normal', 3, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (41, N'normal', 4, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (42, N'normal', 4, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (43, N'normal', 4, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (44, N'normal', 4, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (45, N'normal', 4, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (46, N'normal', 4, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (47, N'normal', 4, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (48, N'normal', 4, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (49, N'normal', 4, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (50, N'normal', 4, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (51, N'normal', 5, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (52, N'normal', 5, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (53, N'normal', 5, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (54, N'normal', 5, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (55, N'normal', 5, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (56, N'normal', 5, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (57, N'normal', 5, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (58, N'normal', 5, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (59, N'normal', 5, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (60, N'normal', 5, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (61, N'normal', 6, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (62, N'normal', 6, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (63, N'normal', 6, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (64, N'normal', 6, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (65, N'normal', 6, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (66, N'normal', 6, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (67, N'normal', 6, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (68, N'normal', 6, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (69, N'normal', 6, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (70, N'normal', 6, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (71, N'normal', 7, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (72, N'normal', 7, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (73, N'normal', 7, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (74, N'normal', 7, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (75, N'normal', 7, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (76, N'normal', 7, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (77, N'normal', 7, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (78, N'normal', 7, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (79, N'normal', 7, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (80, N'normal', 7, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (81, N'normal', 8, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (82, N'normal', 8, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (83, N'normal', 8, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (84, N'normal', 8, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (85, N'normal', 8, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (86, N'normal', 8, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (87, N'normal', 8, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (88, N'normal', 8, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (89, N'normal', 8, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (90, N'normal', 8, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (91, N'normal', 9, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (92, N'normal', 9, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (93, N'normal', 9, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (94, N'normal', 9, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (95, N'normal', 9, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (96, N'normal', 9, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (97, N'normal', 9, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (98, N'normal', 9, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (99, N'normal', 9, 0)
GO
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (100, N'normal', 9, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (101, N'normal', 10, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (102, N'normal', 10, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (103, N'normal', 10, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (104, N'normal', 10, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (105, N'normal', 10, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (106, N'normal', 10, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (107, N'normal', 10, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (108, N'normal', 10, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (109, N'normal', 10, 0)
INSERT [dbo].[BOOK] ([idBook], [status], [idTitle], [borrowed]) VALUES (110, N'normal', 10, 0)
SET IDENTITY_INSERT [dbo].[BOOK] OFF
SET IDENTITY_INSERT [dbo].[TITLE] ON 

INSERT [dbo].[TITLE] ([idTitle], [price], [rentCost], [stock], [description], [nameTitle], [image], [type]) VALUES (1, 200000, 20000, 10, N'An old dog might not be able to learn new tricks, but he might teach his owner a thing or two. You will recognize yourself, or your dog, in these 101 new tales from the owners of these lovable canines. ', N'Chicken Soup for the Soul: What I Learned from the Dog: 101 Stories about Life, Love and Lessons', N'Image/tt1.jpg', N'Romance')
INSERT [dbo].[TITLE] ([idTitle], [price], [rentCost], [stock], [description], [nameTitle], [image], [type]) VALUES (2, 150000, 15000, 10, N'Everyone needs some faith and hope! This book is just the ticket, with a collection of 101 of the best stories from Chicken Soup for the Soul''s past on faith, hope, miracles, and devotion.', N'Chicken Soup for the Soul: Stories of Faith: Inspirational Stories of Hope, Devotion, Faith and Miracles', N'Image/tt2.jpg', N'Romance')
INSERT [dbo].[TITLE] ([idTitle], [price], [rentCost], [stock], [description], [nameTitle], [image], [type]) VALUES (3, 100000, 10000, 20, N'In Japan, a young woman named Umechika dreams of becoming a geisha and has left home to follow her dream. ', N'The Life of a Geisha: Footprint Reading Library 1900', N'Image/tt3.jpg', N'Art')
INSERT [dbo].[TITLE] ([idTitle], [price], [rentCost], [stock], [description], [nameTitle], [image], [type]) VALUES (4, 65000, 6500, 10, N'Anthony''s mother stops him from going to the motorbike races. But when his mother finds out he has secretly gone to the races with his grandfather, he gets into a lot of trouble with more than just his family. ', N'No, You Can''t!: Foundations 6', N'Image/tt4.jpg', N'Psychology')
INSERT [dbo].[TITLE] ([idTitle], [price], [rentCost], [stock], [description], [nameTitle], [image], [type]) VALUES (5, 65000, 6500, 10, N'This is a rich selection of engaging non-fiction, grouped into five themes: Incredible Animals, Fascinating Places, Remarkable People, Exciting Activities, and Amazing Science.', N'Monkey Party (Footprint Reading Library)', N'Image/tt5.jpg', N'Art')
INSERT [dbo].[TITLE] ([idTitle], [price], [rentCost], [stock], [description], [nameTitle], [image], [type]) VALUES (6, 300000, 30000, 10, N'Damien Sin is back with another nightmarish glimpse into the maddening vistas of the unspeakable. Each story is brilliantly crafted by Singapore''s foremost story teller.', N'Classic Singapore Horror Stories', N'Image/tt6.jpg', N'Horror')
INSERT [dbo].[TITLE] ([idTitle], [price], [rentCost], [stock], [description], [nameTitle], [image], [type]) VALUES (7, 150000, 15000, 10, N'Flies are a nuisance. They are annoying when they buzz around you, but you can brush them away with your hand. After all, a fly is only about half the size of your fingernail.', N'Oxford Bookworms Library (3 Ed.) 6: The Fly and Other ', N'Image/tt7.jpg', N'Horror')
INSERT [dbo].[TITLE] ([idTitle], [price], [rentCost], [stock], [description], [nameTitle], [image], [type]) VALUES (8, 400000, 40000, 10, N'Master of mirthful mayhem, Matt Groening, meets the monsters of rock (Alice Cooper, Gene Simmons, and Rob Zombie) in a heavy metal, Halloween-inspired rock ''n'' roll odyssey of head-banging, tongue-wagging, dead-raising fright and frivolity.', N'Treehouse Of Horror: The Simpsons', N'Image/tt8.jpg', N'Horror')
INSERT [dbo].[TITLE] ([idTitle], [price], [rentCost], [stock], [description], [nameTitle], [image], [type]) VALUES (9, 400000, 40000, 10, N'Hairstyling is a timeless way for women to create something unique and express themselves. Whether you wash it and run out the door, combine looks like edgy cornrows with disheveled waves or defy gravity with a sky-high ‘60s beehive, your easy-to-follow guide to hair is here. ', N'The Art Of Hair', N'Image/tt9.jpg', N'Art')
INSERT [dbo].[TITLE] ([idTitle], [price], [rentCost], [stock], [description], [nameTitle], [image], [type]) VALUES (10, 150000, 15000, 10, N'In Zen: The Art of Simple Living, you will learn to find happiness not by seeking out extraordinary experiences but by making small changes--to what you do, how you think, how you interact with others, and how you appreciate the present moment. ', N'Zen: The Art Of Simple Living', N'Image/tt10.jpg', N'Poetry')
SET IDENTITY_INSERT [dbo].[TITLE] OFF
INSERT [dbo].[USERLIB] ([identityCard], [role], [username], [password], [dob], [email], [fullname], [phone], [address], [gender]) VALUES (N'201785708', 1, N'minhthanh', N'123456', CAST(N'1999-06-16' AS Date), N'nhannttde130010@fpt.edu.vn', N'Dang Minh Thanh', N'0905923954', N'Da Nang, VietNam', 1)
INSERT [dbo].[USERLIB] ([identityCard], [role], [username], [password], [dob], [email], [fullname], [phone], [address], [gender]) VALUES (N'201789098', 1, N'thuynhan', N'123456', CAST(N'1999-06-16' AS Date), N'thanhdmde130004@pt.edu.vn', N'Dang Minh Thanh', N'0905923585', N'Da Nang, VietNam', 1)
INSERT [dbo].[USERLIB] ([identityCard], [role], [username], [password], [dob], [email], [fullname], [phone], [address], [gender]) VALUES (N'201987654', 1, N'theduy', N'123456', CAST(N'1992-12-12' AS Date), N'nhannttde122300120@gmail.com', N'Ngo Hoang The Duy', N'09051233219', N'Hoa Tho Tay, Cam Le, Da Nang', 1)
ALTER TABLE [dbo].[BOOK]  WITH CHECK ADD  CONSTRAINT [fk_idTitle] FOREIGN KEY([idTitle])
REFERENCES [dbo].[TITLE] ([idTitle])
GO
ALTER TABLE [dbo].[BOOK] CHECK CONSTRAINT [fk_idTitle]
GO
ALTER TABLE [dbo].[RENTCARD]  WITH CHECK ADD  CONSTRAINT [fk_CMND] FOREIGN KEY([identityCard])
REFERENCES [dbo].[USERLIB] ([identityCard])
GO
ALTER TABLE [dbo].[RENTCARD] CHECK CONSTRAINT [fk_CMND]
GO
ALTER TABLE [dbo].[RENTCARDDETAIL]  WITH CHECK ADD  CONSTRAINT [fk_idBook] FOREIGN KEY([idBook])
REFERENCES [dbo].[BOOK] ([idBook])
GO
ALTER TABLE [dbo].[RENTCARDDETAIL] CHECK CONSTRAINT [fk_idBook]
GO
ALTER TABLE [dbo].[RENTCARDDETAIL]  WITH CHECK ADD  CONSTRAINT [fk_idRentCard] FOREIGN KEY([idRentCard])
REFERENCES [dbo].[RENTCARD] ([idRentCard])
GO
ALTER TABLE [dbo].[RENTCARDDETAIL] CHECK CONSTRAINT [fk_idRentCard]
GO
USE [master]
GO
ALTER DATABASE [LIBTN2D] SET  READ_WRITE 
GO

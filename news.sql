USE [master]
GO
/****** Object:  Database [NewsSystem]    Script Date: 2019/4/15 13:32:24 ******/
CREATE DATABASE [NewsSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NewsSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NewsSystem.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NewsSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NewsSystem_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NewsSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NewsSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NewsSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NewsSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NewsSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NewsSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NewsSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [NewsSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NewsSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NewsSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NewsSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NewsSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NewsSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NewsSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NewsSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NewsSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NewsSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NewsSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NewsSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NewsSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NewsSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NewsSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NewsSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NewsSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NewsSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [NewsSystem] SET  MULTI_USER 
GO
ALTER DATABASE [NewsSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NewsSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NewsSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NewsSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [NewsSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NewsSystem', N'ON'
GO
USE [NewsSystem]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 2019/4/15 13:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Goods](
	[userID] [varchar](50) NOT NULL,
	[newsID] [varchar](50) NOT NULL,
	[buyNum] [int] NOT NULL CONSTRAINT [DF_Goods_buyNum]  DEFAULT ((1)),
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[newsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 2019/4/15 13:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[newsID] [varchar](50) NOT NULL,
	[newsName] [varchar](50) NOT NULL,
	[newsPrice] [money] NOT NULL CONSTRAINT [DF_News_newsPrice]  DEFAULT ((0)),
	[curNum] [int] NOT NULL CONSTRAINT [DF_News_curNum]  DEFAULT ((20)),
	[publishID] [varchar](50) NOT NULL CONSTRAINT [DF_News_publishID]  DEFAULT ((1)),
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[newsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Publish]    Script Date: 2019/4/15 13:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Publish](
	[publishID] [varchar](50) NOT NULL,
	[publishName] [varchar](50) NOT NULL CONSTRAINT [DF_Publish_publisName]  DEFAULT ('无'),
	[Address] [varchar](50) NOT NULL CONSTRAINT [DF_Publish_publishAddress]  DEFAULT ('无'),
 CONSTRAINT [PK_Publish] PRIMARY KEY CLUSTERED 
(
	[publishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2019/4/15 13:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[sexy] [varchar](50) NOT NULL CONSTRAINT [DF_Users_sexy]  DEFAULT ('男'),
	[phoneNum] [varchar](50) NULL,
	[userPassword] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'1', N'1', 32)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'1', N'10', 4)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'1', N'2', 24)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'1', N'3', 2)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'1', N'9', 22)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'100', N'5', 21)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'100', N'8', 10)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'11', N'3', 11)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'11', N'5', 16)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'11', N'54', 12)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'11', N'8', 3)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'12', N'2', 12)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'12', N'5', 4)
INSERT [dbo].[Goods] ([userID], [newsID], [buyNum]) VALUES (N'12', N'9', 10)
INSERT [dbo].[News] ([newsID], [newsName], [newsPrice], [curNum], [publishID]) VALUES (N'1', N'《半月报刊》', 10.0000, 20, N'1')
INSERT [dbo].[News] ([newsID], [newsName], [newsPrice], [curNum], [publishID]) VALUES (N'10', N'《艾弗森报刊》', 12.5000, 20, N'5')
INSERT [dbo].[News] ([newsID], [newsName], [newsPrice], [curNum], [publishID]) VALUES (N'2', N'《庐山报刊》', 10.0000, 20, N'1')
INSERT [dbo].[News] ([newsID], [newsName], [newsPrice], [curNum], [publishID]) VALUES (N'23', N'《健康报刊》', 41.0000, 20, N'25')
INSERT [dbo].[News] ([newsID], [newsName], [newsPrice], [curNum], [publishID]) VALUES (N'3', N'《水货报刊》', 5.0000, 20, N'5')
INSERT [dbo].[News] ([newsID], [newsName], [newsPrice], [curNum], [publishID]) VALUES (N'4', N'《顺丰报刊》', 21.0000, 20, N'3')
INSERT [dbo].[News] ([newsID], [newsName], [newsPrice], [curNum], [publishID]) VALUES (N'5', N'《滴滴报刊》', 4.0000, 20, N'4')
INSERT [dbo].[News] ([newsID], [newsName], [newsPrice], [curNum], [publishID]) VALUES (N'54', N'《变色报刊》', 12.2000, 20, N'4')
INSERT [dbo].[News] ([newsID], [newsName], [newsPrice], [curNum], [publishID]) VALUES (N'8', N'《多福多寿》', 21.0000, 20, N'2')
INSERT [dbo].[News] ([newsID], [newsName], [newsPrice], [curNum], [publishID]) VALUES (N'9', N'《水电报刊》', 12.5000, 20, N'5')
INSERT [dbo].[Publish] ([publishID], [publishName], [Address]) VALUES (N'1', N'同城出版社', N'阳光大道')
INSERT [dbo].[Publish] ([publishID], [publishName], [Address]) VALUES (N'2', N'水电费报社', N'花果山')
INSERT [dbo].[Publish] ([publishID], [publishName], [Address]) VALUES (N'25', N'阿萨报社', N'隧道')
INSERT [dbo].[Publish] ([publishID], [publishName], [Address]) VALUES (N'3', N'水报社', N'花果山')
INSERT [dbo].[Publish] ([publishID], [publishName], [Address]) VALUES (N'35', N'办公费报社', N'爱仕达大厦')
INSERT [dbo].[Publish] ([publishID], [publishName], [Address]) VALUES (N'4', N'中国报社', N'天安门')
INSERT [dbo].[Publish] ([publishID], [publishName], [Address]) VALUES (N'5', N'我的报社', N'F1-115')
INSERT [dbo].[Users] ([userID], [userName], [sexy], [phoneNum], [userPassword]) VALUES (N'1', N'李人', N'男', N'17806707171', N'111')
INSERT [dbo].[Users] ([userID], [userName], [sexy], [phoneNum], [userPassword]) VALUES (N'10', N'风清扬', N'女', N'219451959', N'111')
INSERT [dbo].[Users] ([userID], [userName], [sexy], [phoneNum], [userPassword]) VALUES (N'100', N'李白图', N'女', N'245834', N'111')
INSERT [dbo].[Users] ([userID], [userName], [sexy], [phoneNum], [userPassword]) VALUES (N'11', N'史蒂夫', N'女', N'95164', N'111')
INSERT [dbo].[Users] ([userID], [userName], [sexy], [phoneNum], [userPassword]) VALUES (N'12', N'李白', N'男', N'24524687', N'111')
INSERT [dbo].[Users] ([userID], [userName], [sexy], [phoneNum], [userPassword]) VALUES (N'2', N'阿斯顿', N'男', N'4245', N'111')
INSERT [dbo].[Users] ([userID], [userName], [sexy], [phoneNum], [userPassword]) VALUES (N'23432', N'服务费', N'男', N'324234', N'111')
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_News] FOREIGN KEY([newsID])
REFERENCES [dbo].[News] ([newsID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_News]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Users]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Publish] FOREIGN KEY([publishID])
REFERENCES [dbo].[Publish] ([publishID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Publish]
GO
USE [master]
GO
ALTER DATABASE [NewsSystem] SET  READ_WRITE 
GO

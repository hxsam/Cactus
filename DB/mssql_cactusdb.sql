USE [master]
GO
/****** Object:  Database [cactusdb]    Script Date: 12/18/2016 18:34:35 ******/
CREATE DATABASE [cactusdb] ON  PRIMARY 
( NAME = N'cactusdb', FILENAME = N'G:\Microsoft SQL Serve DB\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\cactusdb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cactusdb_log', FILENAME = N'G:\Microsoft SQL Serve DB\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\cactusdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [cactusdb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cactusdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cactusdb] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [cactusdb] SET ANSI_NULLS OFF
GO
ALTER DATABASE [cactusdb] SET ANSI_PADDING OFF
GO
ALTER DATABASE [cactusdb] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [cactusdb] SET ARITHABORT OFF
GO
ALTER DATABASE [cactusdb] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [cactusdb] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [cactusdb] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [cactusdb] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [cactusdb] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [cactusdb] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [cactusdb] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [cactusdb] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [cactusdb] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [cactusdb] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [cactusdb] SET  DISABLE_BROKER
GO
ALTER DATABASE [cactusdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [cactusdb] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [cactusdb] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [cactusdb] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [cactusdb] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [cactusdb] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [cactusdb] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [cactusdb] SET  READ_WRITE
GO
ALTER DATABASE [cactusdb] SET RECOVERY FULL
GO
ALTER DATABASE [cactusdb] SET  MULTI_USER
GO
ALTER DATABASE [cactusdb] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [cactusdb] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'cactusdb', N'ON'
GO
USE [cactusdb]
GO
/****** Object:  Table [dbo].[sys_user]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_user](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[Name] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[NickName] [varchar](255) NULL,
	[Avatar] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Qq] [varchar](255) NULL,
	[AddTime] [datetime] NULL,
	[LastLoginTime] [datetime] NULL,
	[LastLoginIp] [varchar](255) NULL,
	[IsSuperUser] [int] NULL,
 CONSTRAINT [PK_sys_user] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_role]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_role](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](255) NOT NULL,
	[ActionIds] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_sys_role] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_log]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_log](
	[Log_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LogInfo] [varchar](250) NOT NULL,
	[CreateTs] [bigint] NOT NULL,
 CONSTRAINT [PK_sys_log] PRIMARY KEY CLUSTERED 
(
	[Log_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_staff]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_staff](
	[Staff_Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[UserPwd] [varchar](255) NOT NULL,
	[NickName] [varchar](255) NOT NULL,
	[Phone] [varchar](255) NOT NULL,
	[Sex] [int] NOT NULL,
	[AvatarPath] [varchar](255) NOT NULL,
	[IsUsable] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[TargetIp] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_orderDetail]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_orderDetail](
	[Od_Id] [int] NOT NULL,
	[OId] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Num] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Od_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_order]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_order](
	[Order_Id] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[UId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Des] [varchar](255) NOT NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_info]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_info](
	[Store_Id] [int] NOT NULL,
	[StoreName] [varchar](255) NOT NULL,
	[StoreLogoPath] [varchar](255) NOT NULL,
	[StoreDes] [varchar](255) NOT NULL,
	[StoreSwitch] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Store_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_customer]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_customer](
	[U_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[UserPwd] [varchar](255) NOT NULL,
	[NickName] [varchar](255) NOT NULL,
	[Phone] [varchar](255) NOT NULL,
	[Sex] [int] NOT NULL,
	[AvatarPath] [varchar](255) NOT NULL,
	[IsUsable] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
	[TargetIp] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_commodity]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_commodity](
	[C_Id] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[C_Name] [varchar](255) NOT NULL,
	[C_Price] [int] NOT NULL,
	[C_PicPath] [varchar](255) NOT NULL,
	[C_Stock] [int] NOT NULL,
	[C_ProName] [varchar](255) NULL,
	[C_ProDetail] [varchar](255) NULL,
	[C_Des] [varchar](255) NOT NULL,
	[CatId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[C_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_category]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_category](
	[Cat_Id] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[Cat_Name] [varchar](255) NOT NULL,
	[Cat_Des] [varchar](255) NULL,
	[PId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cat_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms_temppage]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_temppage](
	[TempPage_Id] [int] IDENTITY(1,1) NOT NULL,
	[TempName] [varchar](255) NOT NULL,
	[TempByname] [varchar](255) NULL,
	[TempParameter] [varchar](2000) NOT NULL,
	[TempPath] [varchar](255) NULL,
	[TempContent] [varchar](4000) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
 CONSTRAINT [PK_cms_temppage] PRIMARY KEY CLUSTERED 
(
	[TempPage_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms_tagmap]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cms_tagmap](
	[m_TagId] [int] NOT NULL,
	[m_ArticleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cms_tag]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_tag](
	[Tag_Id] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](255) NOT NULL,
	[TagDes] [varchar](255) NULL,
	[LastTime] [datetime] NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_cms_tag] PRIMARY KEY CLUSTERED 
(
	[Tag_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms_staticpage]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_staticpage](
	[Page_Id] [int] IDENTITY(1,1) NOT NULL,
	[PagePath] [varchar](255) NULL,
	[PageName] [varchar](255) NOT NULL,
	[TempPageId] [int] NOT NULL,
	[PageParameter] [varchar](2000) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
 CONSTRAINT [PK_cms_staticpage] PRIMARY KEY CLUSTERED 
(
	[Page_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms_commentmap]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_commentmap](
	[Ip] [varchar](50) NOT NULL,
	[CreateTs] [bigint] NOT NULL,
	[CommentId] [bigint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms_comment]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_comment](
	[Comment_Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[Content] [varchar](255) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Nickname] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[VoteFavour] [int] NULL,
	[VoteOppose] [int] NULL,
 CONSTRAINT [PK_cms_comment] PRIMARY KEY CLUSTERED 
(
	[Comment_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms_column]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_column](
	[Column_Id] [int] IDENTITY(1,1) NOT NULL,
	[Sort] [int] NULL,
	[ColumnName] [varchar](255) NOT NULL,
	[Pid] [int] NOT NULL,
	[Lv] [int] NULL,
 CONSTRAINT [PK_cms_column] PRIMARY KEY CLUSTERED 
(
	[Column_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms_articlemap]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_articlemap](
	[Ip] [varchar](50) NOT NULL,
	[CreateTs] [bigint] NOT NULL,
	[ArticleId] [bigint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms_article]    Script Date: 12/18/2016 18:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_article](
	[Article_Id] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[Tagids] [varchar](255) NULL,
	[Tags] [varchar](255) NULL,
	[ArticleContent] [varchar](4000) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
	[Browse] [int] NOT NULL,
	[ImgUrl] [varchar](255) NULL,
	[Digest] [varchar](255) NULL,
	[SEO_Title] [varchar](255) NULL,
	[SEO_Keywords] [varchar](255) NULL,
	[SEO_DES] [varchar](255) NULL,
	[Author] [varchar](255) NULL,
	[IsTop] [int] NOT NULL,
	[IsShow] [int] NOT NULL,
	[Source] [varchar](255) NULL,
	[SourceLink] [varchar](255) NULL,
	[Praise] [int] NULL,
 CONSTRAINT [PK_cms_article] PRIMARY KEY CLUSTERED 
(
	[Article_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_cms_comment_VoteFavour]    Script Date: 12/18/2016 18:34:37 ******/
ALTER TABLE [dbo].[cms_comment] ADD  CONSTRAINT [DF_cms_comment_VoteFavour]  DEFAULT ((0)) FOR [VoteFavour]
GO
/****** Object:  Default [DF_cms_comment_VoteOppose]    Script Date: 12/18/2016 18:34:37 ******/
ALTER TABLE [dbo].[cms_comment] ADD  CONSTRAINT [DF_cms_comment_VoteOppose]  DEFAULT ((0)) FOR [VoteOppose]
GO

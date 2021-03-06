USE [master]
GO
/****** Object:  Database [ElectronicStore]    Script Date: 07/25/2017 22:41:45 ******/
CREATE DATABASE [ElectronicStore] ON  PRIMARY 
( NAME = N'EletronicStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\EletronicStore.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EletronicStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\EletronicStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ElectronicStore] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElectronicStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElectronicStore] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ElectronicStore] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ElectronicStore] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ElectronicStore] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ElectronicStore] SET ARITHABORT OFF
GO
ALTER DATABASE [ElectronicStore] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ElectronicStore] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ElectronicStore] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ElectronicStore] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ElectronicStore] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ElectronicStore] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ElectronicStore] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ElectronicStore] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ElectronicStore] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ElectronicStore] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ElectronicStore] SET  DISABLE_BROKER
GO
ALTER DATABASE [ElectronicStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ElectronicStore] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ElectronicStore] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ElectronicStore] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ElectronicStore] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ElectronicStore] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ElectronicStore] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ElectronicStore] SET  READ_WRITE
GO
ALTER DATABASE [ElectronicStore] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ElectronicStore] SET  MULTI_USER
GO
ALTER DATABASE [ElectronicStore] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ElectronicStore] SET DB_CHAINING OFF
GO
USE [ElectronicStore]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductType_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Types] ON
INSERT [dbo].[Types] ([Id], [Name], [DateCreated], [DateModified], [Status]) VALUES (1, N'MOBILES', CAST(0x0000A7A7013DE2B1 AS DateTime), CAST(0x0000A7A7013DE2B1 AS DateTime), 1)
INSERT [dbo].[Types] ([Id], [Name], [DateCreated], [DateModified], [Status]) VALUES (2, N'HOME', CAST(0x0000A7A7013DE2B1 AS DateTime), CAST(0x0000A7A7013DE2B1 AS DateTime), 1)
INSERT [dbo].[Types] ([Id], [Name], [DateCreated], [DateModified], [Status]) VALUES (3, N'COMPUTER', CAST(0x0000A7A7013DE2B1 AS DateTime), CAST(0x0000A7A7013DE2B1 AS DateTime), 0)
INSERT [dbo].[Types] ([Id], [Name], [DateCreated], [DateModified], [Status]) VALUES (4, N'HOUSEHOLD', CAST(0x0000A7A7013DE2B1 AS DateTime), CAST(0x0000A7A7013DE2B1 AS DateTime), 0)
INSERT [dbo].[Types] ([Id], [Name], [DateCreated], [DateModified], [Status]) VALUES (5, N'KITCHEN', CAST(0x0000A7A7013DE2B1 AS DateTime), CAST(0x0000A7A7013DE2B1 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Types] OFF
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'43ac247b-fce2-4539-95d4-735bda9225a8', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'89660f70-6fdb-42cf-a98f-ed301c88c56d', N'User')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b7f77697-5e8f-4167-adf4-a05ef508bf0b', N'Manager')
/****** Object:  Table [dbo].[Categories]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([Id], [Name], [DateCreated], [DateModified], [Status]) VALUES (1, N'PHONE', CAST(0x0000A7BB00B51181 AS DateTime), CAST(0x0000A7BB00B51181 AS DateTime), 1)
INSERT [dbo].[Categories] ([Id], [Name], [DateCreated], [DateModified], [Status]) VALUES (2, N'LAPTOP', CAST(0x0000A7BB00B52EBB AS DateTime), CAST(0x0000A7BB00B52EBB AS DateTime), 1)
INSERT [dbo].[Categories] ([Id], [Name], [DateCreated], [DateModified], [Status]) VALUES (3, N'TABLET', CAST(0x0000A7BB00B54354 AS DateTime), CAST(0x0000A7BB0107AAE4 AS DateTime), 1)
INSERT [dbo].[Categories] ([Id], [Name], [DateCreated], [DateModified], [Status]) VALUES (4, N'ACCESSORIES', CAST(0x0000A7BB00B5839B AS DateTime), CAST(0x0000A7BB00B5839B AS DateTime), 1)
INSERT [dbo].[Categories] ([Id], [Name], [DateCreated], [DateModified], [Status]) VALUES (5, N'camera', CAST(0x0000A7BB0107DB54 AS DateTime), CAST(0x0000A7BB011A5090 AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [DateCreated], [DateModified], [Status]) VALUES (6, N'Headphone', CAST(0x0000A7BB010CBF3F AS DateTime), CAST(0x0000A7BB011A47B6 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
/****** Object:  Table [dbo].[Brands]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Logo] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON
INSERT [dbo].[Brands] ([Id], [Name], [Logo], [DateCreated], [DateModified], [Status]) VALUES (1, N'SAMSUNG', N'/Assets/Client/images/tb1.jpg', CAST(0x0000A7A7013D6D8C AS DateTime), CAST(0x0000A7A7013D6D8C AS DateTime), 1)
INSERT [dbo].[Brands] ([Id], [Name], [Logo], [DateCreated], [DateModified], [Status]) VALUES (2, N'CANON', N'/Assets/Client/images/tb2.jpg', CAST(0x0000A7A7013D6D8C AS DateTime), CAST(0x0000A7A7013D6D8C AS DateTime), 1)
INSERT [dbo].[Brands] ([Id], [Name], [Logo], [DateCreated], [DateModified], [Status]) VALUES (3, N'HP', N'/Assets/Client/images/tb3.jpg', CAST(0x0000A7A7013D6D8C AS DateTime), CAST(0x0000A7A7013D6D8C AS DateTime), 1)
INSERT [dbo].[Brands] ([Id], [Name], [Logo], [DateCreated], [DateModified], [Status]) VALUES (4, N'CISCO', N'/Assets/Client/images/tb4.jpg', CAST(0x0000A7A7013D6D8C AS DateTime), CAST(0x0000A7A7013D6D8C AS DateTime), 1)
INSERT [dbo].[Brands] ([Id], [Name], [Logo], [DateCreated], [DateModified], [Status]) VALUES (5, N'PANASONIC', N'/Assets/Client/images/tb5.jpg', CAST(0x0000A7A7013D6D8C AS DateTime), CAST(0x0000A7A7013D6D8C AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Brands] OFF
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Address] [varchar](255) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Address], [FirstName], [LastName], [IsEnabled]) VALUES (N'08ea39f9-d095-4422-a2e5-c4731be20a9e', N'test7@gmail.com', 0, N'AKpuOuy5VrAlpXBWxggXJqLd0rIrmOi+FK5XrUh48OFZmf26Dz0bTM6nlzsYVCl71w==', N'1747493a-5e09-4eb4-a27f-122d2fef0491', N'01693087817', 0, 0, NULL, 1, 0, N'test7@gmail.com', N'Binh Thuan', N'Thang', N'Nguyen', 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Address], [FirstName], [LastName], [IsEnabled]) VALUES (N'24d7260e-9b7c-499e-a941-bb1c08d2ac9f', N'test3@gmail.com', 0, N'ALA/dDWRwSKoO9d1kygOsozpFVX0zTfRHrfoo4/kUv02ukMMw9fiLLwly5dlbggfyQ==', N'ba656de4-72d5-4a57-9fb4-655d27235937', N'01693087817', 0, 0, NULL, 1, 0, N'test3@gmail.com', N'Ninh Thuan', N'Thang', N'Nguyen', 0)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Address], [FirstName], [LastName], [IsEnabled]) VALUES (N'2bf7d16f-132e-427d-8c7d-6bea84056569', N'test2@gmail.com', 0, N'AJ2KbZtuXgMWwlgdmWRxQkRnu/xlqaE4D8Xm382+B/YhTZ8vnxdFXK/JMMC9cGlQRA==', N'd5a26708-6805-4140-9d3f-7ea60f584696', N'01693087817', 0, 0, NULL, 1, 0, N'test2@gmail.com', N'Ninh Thuan', N'Toan', N'Nguyen', 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Address], [FirstName], [LastName], [IsEnabled]) VALUES (N'40428303-4893-447b-b88e-8917836fde7e', N'test5@gmail.com', 0, N'AIumFh9bV/kcWM0uBG0OHqDW9F+jpf5NikcehqQjboEDYtC/GhSwGcwHXgBmZecBnA==', N'aca83447-b318-49f2-8cf2-ada493d28de4', N'01693087817', 0, 0, NULL, 1, 0, N'test5@gmail.com', N'Ninh Thuan', N'Thang', N'Nguyen', 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Address], [FirstName], [LastName], [IsEnabled]) VALUES (N'47986af6-5b5e-4c72-beae-ca733f72e7fa', N'nhthang010195@gmail.com', 0, N'AMes3j3RLuxZH137J5BTu9AShBcvMppP5maPfBlblfbQGNgGKd6cMDqrUF5pPhjIjA==', N'2bc256c5-82c3-45ed-a212-e1110b1b2617', N'01693087817', 0, 0, NULL, 1, 0, N'nhthang010195@gmail.com', N'Ninh Thuan', N'Thang', N'Nguyen', 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Address], [FirstName], [LastName], [IsEnabled]) VALUES (N'ad1cac49-d69b-4894-970c-9fc0b44a64f7', N'test1@gmail.com', 0, N'ALWaCDMBXre2086CuiDJOEchBkAQpVrh/COKkTGt0kSkPJ8qIkHLnCyb4X0H2wU3kw==', N'e10f9ce5-035a-4dbf-9459-e61477097402', N'01693087817', 0, 0, NULL, 0, 0, N'test1@gmail.com', N'Ninh Thuan', N'Thang', N'Nguyen', 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Address], [FirstName], [LastName], [IsEnabled]) VALUES (N'fa9b7826-2b09-45e1-8e21-8fdbb2d5b140', N'admin@gmail.com', 0, N'ABPulbjGL5biTZYnrhBGwif5B2gIB8wGKaTPlr5HhE6lCnMDqtnvwn5URPF04cyj0g==', N'83354930-110b-4169-ab55-5a69a1e593d2', N'01693087817', 0, 0, NULL, 0, 0, N'admin@gmail.com', N'Ninh Thuan', N'Thang', N'Nguyen', 1)
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'08ea39f9-d095-4422-a2e5-c4731be20a9e', N'89660f70-6fdb-42cf-a98f-ed301c88c56d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'47986af6-5b5e-4c72-beae-ca733f72e7fa', N'b7f77697-5e8f-4167-adf4-a05ef508bf0b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fa9b7826-2b09-45e1-8e21-8fdbb2d5b140', N'43ac247b-fce2-4539-95d4-735bda9225a8')
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CateId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Sold] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Warranty] [int] NOT NULL,
	[Viewed] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[ImageUrl] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Product_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (1, N'Mobile Phone', 1, 1, 1, 1234, 5, 5, 12, 26, CAST(0x0000A75400000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/3.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (2, N'Mobile Phone 2', 2, 2, 2, 123, 4, 5, 12, 2, CAST(0x0000A72F00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/4.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (3, N'Mobile Phone 3', 3, 3, 1, 234, 3, 5, 12, 2, CAST(0x0000A70A00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/5.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (4, N'Mobile Phone 4', 4, 4, 2, 345, 2, 5, 12, 4, CAST(0x0000A72200000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/6.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (5, N'Mobile Phone 5', 1, 5, 1, 456, 1, 5, 12, 1, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/7.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (6, N'Mobile Phone 6', 2, 1, 2, 567, 0, 5, 12, 2, CAST(0x0000A72A00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/27.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (7, N'Mobile Phone 7', 3, 2, 1, 132, 0, 5, 12, 3, CAST(0x0000A73F00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/28.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (8, N'Mobile Phone 8', 4, 5, 2, 213, 1, 5, 12, 4, CAST(0x0000A15200000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/29.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (9, N'Mobile Phone 9', 1, 4, 1, 231, 2, 5, 12, 1, CAST(0x0000A75500000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/30.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (10, N'Mobile Phone 10', 2, 5, 2, 312, 3, 5, 12, 2, CAST(0x0000A79A00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/31.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (11, N'Wireless Phone', 3, 1, 1, 321, 4, 5, 12, 3, CAST(0x0000A79A00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/35.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (12, N'Digital Watch', 4, 2, 2, 465, 5, 5, 12, 6, CAST(0x0000A79A00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p7.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (13, N'Digital Watch 2', 1, 3, 1, 576, 6, 5, 12, 2, CAST(0x0000A79A00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p8.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (14, N'Digital Watch 3', 2, 4, 2, 678, 7, 5, 12, 2, CAST(0x0000A79A00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p9.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (15, N'Laptop', 3, 5, 1, 687, 8, 5, 12, 3, CAST(0x0000A79A00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/11.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (16, N'Laptop 2', 4, 1, 2, 768, 9, 5, 12, 4, CAST(0x0000A79A00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/12.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (17, N'Laptop 3', 1, 2, 1, 786, 10, 5, 12, 1, CAST(0x0000A79A00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/22.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (18, N'Laptop 4', 2, 3, 2, 867, 11, 5, 12, 2, CAST(0x0000A79A00000000 AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/23.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (19, N'Laptop 5', 3, 4, 1, 876, 12, 5, 12, 3, CAST(0x0000A7A101808ACB AS DateTime), CAST(0x0000A7A7013C09D2 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/24.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (20, N'Laptop 6', 4, 1, 2, 789, 13, 5, 12, 4, CAST(0x0000A7AA009F3B72 AS DateTime), CAST(0x0000A7AA009F3B72 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/25.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (21, N'Laptop 7', 1, 5, 1, 798, 14, 5, 12, 1, CAST(0x0000A7AA009FB7E9 AS DateTime), CAST(0x0000A7AA009FB7E9 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/26.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (22, N'Tablet', 2, 4, 2, 890, 15, 5, 12, 2, CAST(0x0000A7AA00A01E52 AS DateTime), CAST(0x0000A7AA00A01E52 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p6.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (23, N'Pen Camera', 3, 5, 1, 809, 6, 5, 12, 3, CAST(0x0000A7AA00A12E23 AS DateTime), CAST(0x0000A7B200C12431 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p7.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (24, N'Security Camera', 4, 2, 2, 901, 7, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p11.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (25, N'Microwave Oven', 4, 2, 2, 910, 8, 5, 12, 6, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/38.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (26, N'LED Tv', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p12.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (27, N'Coffee Maker', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/41.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (28, N'Juicer Mixer', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/39.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (29, N'Induction Cooktop', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/37.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (30, N'Dry Iron', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/33.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (31, N'Audio Speakers', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p13.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (32, N'Coffee Maker 2', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/40.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (33, N'Kid''s Toy', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/34.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (34, N'Kid''s Toy 2', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/13.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (35, N'Speaker', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/8.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (36, N'Wireless Speaker', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p5.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (37, N'Headphone', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/9.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (38, N'Headphone 2', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p2.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (39, N'Headphone 3', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p4.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (40, N'Water Purifier', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/18.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (41, N'Grinder', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/17.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (42, N'Washing Machine', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/16.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (43, N'Refrigerator', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/14.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (44, N'Coffe Maker 3', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/19.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (45, N'Mp3 Play 2', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/10.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (46, N'LED Tv 2', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/15.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (47, N'Mp3 Play 3', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p1.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (48, N'Mp3 Play 4', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/p3.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (49, N'Vacuum Cleaner', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/32.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (50, N'Vacuum Cleaner', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/36.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [CateId], [BrandId], [TypeId], [Price], [Sold], [Quantity], [Warranty], [Viewed], [DateCreated], [DateModified], [Description], [ImageUrl], [Status]) VALUES (51, N'Vacuum Cleaner', 4, 2, 2, 145, 9, 5, 12, 4, CAST(0x0000A7B200C58200 AS DateTime), CAST(0x0000A7B200C58200 AS DateTime), N'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'/Assets/Client/images/36.jpg', 1)
/****** Object:  Table [dbo].[Orders]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nchar](11) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Total] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT [dbo].[Orders] ([Id], [UserId], [Name], [Phone], [Address], [Email], [OrderDate], [Total], [Status]) VALUES (1, N'47986af6-5b5e-4c72-beae-ca733f72e7fa', N'Nguyen Huu Thang', N'01693087817', N'Long Binh 1, An Hai, Ninh Phuoc, Ninh Thuan', N'nhthang010195@gmail.com', CAST(0x0000A7BB00000000 AS DateTime), 1357, 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Name], [Phone], [Address], [Email], [OrderDate], [Total], [Status]) VALUES (2, N'47986af6-5b5e-4c72-beae-ca733f72e7fa', N'Nguyen Huu Thang', N'01693087817', N'Long Binh 1, An Hai, Ninh Phuoc, Ninh Thuan', N'nhthang010195@gmail.com', CAST(0x0000A7BB00000000 AS DateTime), 1357, 2)
INSERT [dbo].[Orders] ([Id], [UserId], [Name], [Phone], [Address], [Email], [OrderDate], [Total], [Status]) VALUES (3, N'47986af6-5b5e-4c72-beae-ca733f72e7fa', N'Nguyen Huu Thang', N'01693087817', N'Long Binh 1, An Hai, Ninh Phuoc, Ninh Thuan', N'nhthang010195@gmail.com', CAST(0x0000A7BB00000000 AS DateTime), 1357, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (1, 1, 1, 1, 1234)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (2, 1, 2, 1, 123)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (3, 2, 1, 1, 1234)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (4, 2, 2, 1, 123)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (5, 3, 1, 1, 1234)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (6, 3, 2, 1, 123)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
/****** Object:  Table [dbo].[Images]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImageUrl] [varchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON
INSERT [dbo].[Images] ([Id], [ProductId], [ImageUrl], [Status]) VALUES (1, 40, N'/Assets/Client/images/9.jpg', 1)
INSERT [dbo].[Images] ([Id], [ProductId], [ImageUrl], [Status]) VALUES (2, 40, N'/Assets/Client/images/p2.jpg', 1)
INSERT [dbo].[Images] ([Id], [ProductId], [ImageUrl], [Status]) VALUES (3, 40, N'/Assets/Client/images/p4.jpg', 1)
INSERT [dbo].[Images] ([Id], [ProductId], [ImageUrl], [Status]) VALUES (4, 1, N'/Assets/Client/images/a.jpg', 1)
INSERT [dbo].[Images] ([Id], [ProductId], [ImageUrl], [Status]) VALUES (5, 1, N'/Assets/Client/images/b.jpg', 1)
INSERT [dbo].[Images] ([Id], [ProductId], [ImageUrl], [Status]) VALUES (6, 1, N'/Assets/Client/images/c.jpg', 1)
INSERT [dbo].[Images] ([Id], [ProductId], [ImageUrl], [Status]) VALUES (7, 12, N'/Assets/Client/images/p7.jpg', 1)
INSERT [dbo].[Images] ([Id], [ProductId], [ImageUrl], [Status]) VALUES (8, 12, N'/Assets/Client/images/p8.jpg', 1)
INSERT [dbo].[Images] ([Id], [ProductId], [ImageUrl], [Status]) VALUES (9, 12, N'/Assets/Client/images/p9.jpg', 1)
SET IDENTITY_INSERT [dbo].[Images] OFF
/****** Object:  Table [dbo].[Comments]    Script Date: 07/25/2017 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Telephone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Content] [varchar](255) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON
INSERT [dbo].[Comments] ([Id], [Name], [Telephone], [Email], [ProductId], [Content], [DateCreated], [Status]) VALUES (1, N'Laura', N'01693087817', N'nhthang010195@gmail.com', 1, N'Good', CAST(0x0000A7BB00000000 AS DateTime), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Telephone], [Email], [ProductId], [Content], [DateCreated], [Status]) VALUES (2, N'test7@gmail.com', N'01693087817', N'test7@gmail.com', 1, N'Nice', CAST(0x0000A7BB015A14B2 AS DateTime), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Telephone], [Email], [ProductId], [Content], [DateCreated], [Status]) VALUES (3, N'test7@gmail.com', N'Telephone', N'test7@gmail.com', 1, N'So bad', CAST(0x0000A7BB015A3093 AS DateTime), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Telephone], [Email], [ProductId], [Content], [DateCreated], [Status]) VALUES (4, N'test7@gmail.com', N'01693087817', N'test7@gmail.com', 1, N'good', CAST(0x0000A7BB0165ED5A AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
/****** Object:  View [dbo].[View_MonthStatistics]    Script Date: 07/25/2017 22:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_MonthStatistics]
AS
SELECT     YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(Total) AS Revenue
FROM         dbo.Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MonthStatistics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MonthStatistics'
GO
/****** Object:  View [dbo].[View_DayStatistics]    Script Date: 07/25/2017 22:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_DayStatistics]
AS
SELECT     OrderDate AS Day, SUM(Total) AS Revenue
FROM         dbo.Orders
GROUP BY OrderDate
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DayStatistics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DayStatistics'
GO
/****** Object:  View [dbo].[View_YearStatistics]    Script Date: 07/25/2017 22:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_YearStatistics]
AS
SELECT     YEAR(OrderDate) AS Year, SUM(Total) AS Revenue
FROM         dbo.Orders
GROUP BY YEAR(OrderDate)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_YearStatistics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_YearStatistics'
GO
/****** Object:  View [dbo].[View_WeekStatistics]    Script Date: 07/25/2017 22:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_WeekStatistics]
AS
SELECT     TOP (100) PERCENT DATEDIFF(WEEK, '2017-06-20', OrderDate) + 1 AS WeekNumber, SUM(Total) AS Revenue
FROM         dbo.Orders AS o
GROUP BY DATEDIFF(WEEK, '2017-06-20', OrderDate) + 1
ORDER BY WeekNumber DESC
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_WeekStatistics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_WeekStatistics'
GO
/****** Object:  View [dbo].[View_ThreeMonthsStatistics]    Script Date: 07/25/2017 22:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ThreeMonthsStatistics]
AS
SELECT     TOP (100) PERCENT YEAR(OrderDate) + CASE WHEN MONTH(o.OrderDate) IN (11, 12) THEN 1 ELSE 0 END AS FiscalYear, CASE WHEN MONTH(o.OrderDate) IN (11, 12, 1) 
                      THEN 1 WHEN MONTH(o.OrderDate) IN (2, 3, 4) THEN 2 WHEN MONTH(o.OrderDate) IN (5, 6, 7) THEN 3 ELSE 4 END AS FiscalQuarter, SUM(Total) AS Revenue
FROM         dbo.Orders AS o
GROUP BY YEAR(OrderDate) + CASE WHEN MONTH(o.OrderDate) IN (11, 12) THEN 1 ELSE 0 END, CASE WHEN MONTH(o.OrderDate) IN (11, 12, 1) THEN 1 WHEN MONTH(o.OrderDate) IN (2, 3, 4) 
                      THEN 2 WHEN MONTH(o.OrderDate) IN (5, 6, 7) THEN 3 ELSE 4 END
ORDER BY FiscalYear, FiscalQuarter
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ThreeMonthsStatistics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ThreeMonthsStatistics'
GO
/****** Object:  View [dbo].[View_Profile]    Script Date: 07/25/2017 22:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Profile]
AS
SELECT     dbo.AspNetUsers.Id, dbo.AspNetUsers.FirstName, dbo.AspNetUsers.LastName, dbo.AspNetUsers.PhoneNumber, dbo.AspNetUsers.Address, dbo.AspNetUsers.Email, dbo.AspNetRoles.Name AS Role, 
                      dbo.AspNetUserRoles.RoleId
FROM         dbo.AspNetUsers INNER JOIN
                      dbo.AspNetUserRoles ON dbo.AspNetUsers.Id = dbo.AspNetUserRoles.UserId INNER JOIN
                      dbo.AspNetRoles ON dbo.AspNetUserRoles.RoleId = dbo.AspNetRoles.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AspNetUsers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "AspNetUserRoles"
            Begin Extent = 
               Top = 24
               Left = 364
               Bottom = 114
               Right = 524
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AspNetRoles"
            Begin Extent = 
               Top = 23
               Left = 707
               Bottom = 113
               Right = 867
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Profile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Profile'
GO
/****** Object:  View [dbo].[View_OrderDetails]    Script Date: 07/25/2017 22:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_OrderDetails]
AS
SELECT     dbo.Orders.Id, dbo.Products.Name, dbo.Products.ImageUrl, dbo.OrderDetails.Quantity
FROM         dbo.Orders INNER JOIN
                      dbo.OrderDetails ON dbo.Orders.Id = dbo.OrderDetails.OrderId INNER JOIN
                      dbo.Products ON dbo.OrderDetails.ProductId = dbo.Products.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 126
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 126
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_OrderDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_OrderDetails'
GO
/****** Object:  View [dbo].[View_PurchaseHistory]    Script Date: 07/25/2017 22:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PurchaseHistory]
AS
SELECT     dbo.AspNetUsers.Id, dbo.Products.ImageUrl, dbo.Products.Id AS productId, dbo.Products.Name, dbo.Products.Price
FROM         dbo.AspNetUsers INNER JOIN
                      dbo.Orders ON dbo.AspNetUsers.Id = dbo.Orders.UserId INNER JOIN
                      dbo.OrderDetails ON dbo.Orders.Id = dbo.OrderDetails.OrderId INNER JOIN
                      dbo.Products ON dbo.OrderDetails.ProductId = dbo.Products.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AspNetUsers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 126
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 6
               Left = 479
               Bottom = 126
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 677
               Bottom = 126
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PurchaseHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PurchaseHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PurchaseHistory'
GO
/****** Object:  Default [DF_Types_DateCreated]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Types] ADD  CONSTRAINT [DF_Types_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Types_DateModified]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Types] ADD  CONSTRAINT [DF_Types_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_ProductType_Deleted_1]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Types] ADD  CONSTRAINT [DF_ProductType_Deleted_1]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Categorie_DateCreated]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categorie_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Categorie_DateModified]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categorie_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Brands_DateCreated]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Brands] ADD  CONSTRAINT [DF_Brands_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Brands_DateModified]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Brands] ADD  CONSTRAINT [DF_Brands_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Producer_Deleted]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Brands] ADD  CONSTRAINT [DF_Producer_Deleted]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_AspNetUsers_IsEnabled]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_IsEnabled]  DEFAULT ((1)) FOR [IsEnabled]
GO
/****** Object:  Default [DF_Product_Warranty]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_Warranty]  DEFAULT ((12)) FOR [Warranty]
GO
/****** Object:  Default [DF_Product_Viewed]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_Viewed]  DEFAULT ((0)) FOR [Viewed]
GO
/****** Object:  Default [DF_Product_DateCreated]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Product_DateModified]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Product_Status]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_Orders_OrderDate]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
/****** Object:  Default [DF_Orders_Status]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_Images_Status]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Images] ADD  CONSTRAINT [DF_Images_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Comment_Date]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comment_Date]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Comment_Deleted]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comment_Deleted]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_Products_Brands]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
/****** Object:  ForeignKey [FK_Products_Categories]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CateId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
/****** Object:  ForeignKey [FK_Products_Types]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Types]
GO
/****** Object:  ForeignKey [FK_Orders_AspNetUsers]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_OrderDetails_Orders]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
/****** Object:  ForeignKey [FK_OrderDetails_Products]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
/****** Object:  ForeignKey [FK_Images_Products]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products]
GO
/****** Object:  ForeignKey [FK_Comments_Products]    Script Date: 07/25/2017 22:41:48 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO

USE [master]
GO
/****** Object:  Database [ExtraaEdge]    Script Date: 31-05-2025 17:09:38 ******/
CREATE DATABASE [ExtraaEdge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExtraaEdge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ExtraaEdge.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExtraaEdge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ExtraaEdge_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExtraaEdge] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExtraaEdge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExtraaEdge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExtraaEdge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExtraaEdge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExtraaEdge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExtraaEdge] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExtraaEdge] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ExtraaEdge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExtraaEdge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExtraaEdge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExtraaEdge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExtraaEdge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExtraaEdge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExtraaEdge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExtraaEdge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExtraaEdge] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExtraaEdge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExtraaEdge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExtraaEdge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExtraaEdge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExtraaEdge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExtraaEdge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExtraaEdge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExtraaEdge] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExtraaEdge] SET  MULTI_USER 
GO
ALTER DATABASE [ExtraaEdge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExtraaEdge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExtraaEdge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExtraaEdge] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExtraaEdge] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExtraaEdge] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ExtraaEdge] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExtraaEdge] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExtraaEdge]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 31-05-2025 17:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 31-05-2025 17:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 31-05-2025 17:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[Percentage] [float] NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 31-05-2025 17:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[BrandId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 31-05-2025 17:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[Quantity] [int] NOT NULL,
	[DiscountId] [int] NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31-05-2025 17:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Discount]) VALUES (1, N'Apple', 15)
INSERT [dbo].[Brand] ([Id], [Name], [Discount]) VALUES (2, N'Samsung', 20)
INSERT [dbo].[Brand] ([Id], [Name], [Discount]) VALUES (3, N'Redmi', 15)
INSERT [dbo].[Brand] ([Id], [Name], [Discount]) VALUES (4, N'OnePlus', 10)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (1, N'Samsung')
INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (2, N'Apple')
INSERT [dbo].[Brands] ([BrandId], [Name]) VALUES (3, N'OnePlus')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([DiscountId], [Percentage], [Description]) VALUES (1, 10, N'10% off on Samsung Phones')
INSERT [dbo].[Discounts] ([DiscountId], [Percentage], [Description]) VALUES (2, 5, N'5% off on iPhones')
INSERT [dbo].[Discounts] ([DiscountId], [Percentage], [Description]) VALUES (3, 15, N'15% off on OnePlus Phones')
SET IDENTITY_INSERT [dbo].[Discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [BrandId], [Price], [CreatedAt], [UpdatedAt]) VALUES (1, N'iPhone 14 Pro Max', 1, CAST(1200.99 AS Decimal(18, 2)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [BrandId], [Price], [CreatedAt], [UpdatedAt]) VALUES (2, N'Samsung Galaxy S23 Ultra', 2, CAST(1200.99 AS Decimal(18, 2)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [BrandId], [Price], [CreatedAt], [UpdatedAt]) VALUES (3, N'OnePlus 11', 3, CAST(749.99 AS Decimal(18, 2)), CAST(N'2024-12-24T19:45:01.197' AS DateTime), CAST(N'2024-12-24T19:45:01.197' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [BrandId], [Price], [CreatedAt], [UpdatedAt]) VALUES (5, N'Samsung Galaxy S23', 2, CAST(2300.99 AS Decimal(18, 2)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [BrandId], [Price], [CreatedAt], [UpdatedAt]) VALUES (6, N'Pixel 7', 3, CAST(599.99 AS Decimal(18, 2)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [BrandId], [Price], [CreatedAt], [UpdatedAt]) VALUES (7, N'Samsung Galaxy S23', 2, CAST(799.99 AS Decimal(18, 2)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [BrandId], [Price], [CreatedAt], [UpdatedAt]) VALUES (8, N'Pixel 7', 3, CAST(599.99 AS Decimal(18, 2)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [BrandId], [Price], [CreatedAt], [UpdatedAt]) VALUES (9, N'iPhone 15 pro', 1, CAST(999.99 AS Decimal(18, 2)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [BrandId], [Price], [CreatedAt], [UpdatedAt]) VALUES (10, N'Iphone', 3, CAST(3333.00 AS Decimal(18, 2)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([SaleId], [ProductId], [SaleDate], [Quantity], [DiscountId], [TotalAmount]) VALUES (1, 1, CAST(N'2024-12-24T00:00:00.000' AS DateTime), 2, 1, CAST(1599.98 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [ProductId], [SaleDate], [Quantity], [DiscountId], [TotalAmount]) VALUES (2, 2, CAST(N'2024-12-24T00:00:00.000' AS DateTime), 1, 2, CAST(949.99 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [ProductId], [SaleDate], [Quantity], [DiscountId], [TotalAmount]) VALUES (3, 3, CAST(N'2024-12-24T00:00:00.000' AS DateTime), 3, 3, CAST(1912.47 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Sales] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Role]) VALUES (1, N'admin', N'hashedpassword123', N'Admin')
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Role]) VALUES (2, N'salesperson', N'hashedpassword456', N'Sales')
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Role]) VALUES (3, N'customer1', N'hashedpassword789', N'Customer')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E43E924027]    Script Date: 31-05-2025 17:09:39 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([DiscountId])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
USE [master]
GO
ALTER DATABASE [ExtraaEdge] SET  READ_WRITE 
GO

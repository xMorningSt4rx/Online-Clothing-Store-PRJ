USE [master]
GO
/****** Object:  Database [WATCH_SHOP]    Script Date: 18/07/2022 6:32:57 CH ******/
CREATE DATABASE [WATCH_SHOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WATCH_SHOP', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\WATCH_SHOP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WATCH_SHOP_log', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\WATCH_SHOP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WATCH_SHOP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WATCH_SHOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WATCH_SHOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WATCH_SHOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WATCH_SHOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WATCH_SHOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WATCH_SHOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WATCH_SHOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WATCH_SHOP] SET  MULTI_USER 
GO
ALTER DATABASE [WATCH_SHOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WATCH_SHOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WATCH_SHOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WATCH_SHOP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WATCH_SHOP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WATCH_SHOP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WATCH_SHOP] SET QUERY_STORE = OFF
GO
USE [WATCH_SHOP]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 18/07/2022 6:32:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK__Cart__51BCD797AECE785C] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart Item]    Script Date: 18/07/2022 6:32:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart Item](
	[CartItemID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[CartID] [int] NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[stock] [int] NULL,
	[Action] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 18/07/2022 6:32:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 18/07/2022 6:32:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderDate] [smalldatetime] NULL,
	[total] [float] NOT NULL,
	[Payment] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
 CONSTRAINT [PK__Order__C3905BAF31A9F7BE] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 18/07/2022 6:32:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[OrderID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[status] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18/07/2022 6:32:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Detail] [ntext] NULL,
	[Image] [varchar](200) NOT NULL,
	[Price] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[Discount] [int] NULL,
	[size] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 18/07/2022 6:32:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[ContactTitle] [ntext] NULL,
	[Roll] [int] NULL,
	[YourName] [nchar](30) NULL,
 CONSTRAINT [PK__user__1788CCACF48FBCC8] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'shirt')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'jacket')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'T-shirt')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'dress')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'jean')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [total], [Payment], [note]) VALUES (8, 1, CAST(N'2022-12-01T00:00:00' AS SmallDateTime), 12, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [total], [Payment], [note]) VALUES (10, 2, CAST(N'2022-10-01T00:00:00' AS SmallDateTime), 16, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [total], [Payment], [note]) VALUES (13, 3, CAST(N'2022-12-03T00:00:00' AS SmallDateTime), 1, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [total], [Payment], [note]) VALUES (19, 22, CAST(N'2022-03-14T00:22:00' AS SmallDateTime), 3175, N'paypal', N'huy@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [total], [Payment], [note]) VALUES (24, 22, CAST(N'2022-03-14T16:22:00' AS SmallDateTime), 1458, N'paypal', N'huy')
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [total], [Payment], [note]) VALUES (25, 22, CAST(N'2022-03-14T16:33:00' AS SmallDateTime), 19, N'cash', N'cash')
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [total], [Payment], [note]) VALUES (26, 22, CAST(N'2022-03-15T13:50:00' AS SmallDateTime), 41, N'bank', N'cash')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([DetailID], [ProductID], [OrderID], [Quantity], [status]) VALUES (1, 14, 8, 10, N'shipping  ')
INSERT [dbo].[OrderDetails] ([DetailID], [ProductID], [OrderID], [Quantity], [status]) VALUES (2, 22, 10, 15, N'packing   ')
INSERT [dbo].[OrderDetails] ([DetailID], [ProductID], [OrderID], [Quantity], [status]) VALUES (5, 51, 13, 1, N'shipping  ')
INSERT [dbo].[OrderDetails] ([DetailID], [ProductID], [OrderID], [Quantity], [status]) VALUES (6, 26, 8, 1, N'shipping  ')
INSERT [dbo].[OrderDetails] ([DetailID], [ProductID], [OrderID], [Quantity], [status]) VALUES (7, 28, 10, 1, N'shipping  ')
INSERT [dbo].[OrderDetails] ([DetailID], [ProductID], [OrderID], [Quantity], [status]) VALUES (8, 29, 8, 1, N'packing   ')
INSERT [dbo].[OrderDetails] ([DetailID], [ProductID], [OrderID], [Quantity], [status]) VALUES (20, 28, 19, 12, N'wating    ')
INSERT [dbo].[OrderDetails] ([DetailID], [ProductID], [OrderID], [Quantity], [status]) VALUES (25, 26, 24, 10, N'wating    ')
INSERT [dbo].[OrderDetails] ([DetailID], [ProductID], [OrderID], [Quantity], [status]) VALUES (26, 22, 25, 1, N'wating    ')
INSERT [dbo].[OrderDetails] ([DetailID], [ProductID], [OrderID], [Quantity], [status]) VALUES (27, 14, 26, 1, N'wating    ')
INSERT [dbo].[OrderDetails] ([DetailID], [ProductID], [OrderID], [Quantity], [status]) VALUES (28, 14, 26, 1, N'wating    ')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (14, N'Short Sleeve Linen Blend Shirt', N'Material: Linen and viscose; Features: Spread collar,Short sleeves,Button up front,2 functional chest pockets with flaps,Side splits', N'ShortSleeveLineBlendShirt.jpg', 20, 8, 1, 6, N'S-L-XL                                            ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (22, N'Long Sleeve Casual Shirt', N'Material: CottonSlub fabric;Features:Spread collar,Long sleeves with buttoned cuffs,Button up front,Bust darts,2 chest pockets,Curved, high-low hem,Relaxed fit', N'LongSleeveCasualShirt.jpg', 20, 27, 1, 10, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (23, N'Short Sleeve V-Neck Twill T-shirt', N'Material: ViscoseTwill fabric;Features:Soft gathered detail on shoulder,V-neck Short sleeves with turn back hem', N'Short Sleeve V-Neck Twill T-shirt.jpg', 39, 12, 1, 0, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (24, N'Men''s Long-Sleeved', N'A more durable and comfortable take on the traditional long-sleeved shop shirt, made from a 5.9-oz 48% organic cotton/27% recycled polyester/25% industrial hemp blend', N'Men''s Long-Sleeved.jpg', 50, 100, 1, 0, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (26, N'Men''s Torrentshell 3L Jacket', N'Performance Standard technology for exceptional waterproof/breathable performance, all-day comfort and long-lasting waterproof durability', N'Men''s Torrentshell 3L Jacket.jpg', 150, 0, 2, 10, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (28, N'Puffer Gilet', N'Material: PolyesterPongee fabric;Features:Quilted High standing collar Sleeveless Zip front closure 2 front welt pockets', N'Puffer Gilet.jpg', 250, 12, 2, 2, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (29, N'Midi Dress', N'3/4 sleeve with elastic cuffs and gathers;Features:Crew neck 3/4 sleeve with elastic cuffs and gathers Gathering at the waist 2 side pockets Keyhole back button closure A-line skirt Midi length', N'Midi Dress.jpg', 35, 12, 4, 10, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (49, N'Short Sleeve Drop Shoulder Dress', N'Drop shoulder design,V-neck with self collar', N'Short Sleeve Drop Shoulder Dress.jpg', 40, 12, 4, 5, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (51, N'Cotton Regular Fit License Print T-shirt', N'Material: Cotton,Short sleeves', N'Cotton Regular Fit License Print T-shirt.jpg', 20, 15, 3, 20, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (52, N'Long Sleeve Ecko Printed T-shirt', N'Material: Cotton/viscose or cotton or cotton/polyester', N'Long Sleeve Ecko Printed T-shirt.jpg', 20, 20, 3, 0, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (54, N'Full Length Relaxed Jeans', N'Material: Cotton and elastane,Designed to fade', N'Full Length Relaxed Jeans.jpg', 30, 20, 5, 5, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (56, N'Lightweight Cargo Joggers', N'Material: Cotton and elastane,Lightweight, stretch twill fabric', N'Lightweight Cargo Joggers.jpg', 25, 20, 5, 0, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (58, N'Active Mens Half Zip Long Sleeve Jacket', N'Water resistant,Self fabric visor,Hooded neck with square shape neckline, metal eyelets bungee cord and drawcord', N'Active Mens Half Zip Long Sleeve Jacket.jpg', 25, 10, 2, 10, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (63, N'Button Front Dress', N'Material: Viscose and elastane Single jersey fabric', N'71307916-1-f.jpg', 16, 10, 4, 2, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (66, N'Couple outfit with best friend', N'Made from soft Kate fabric for a very standard shape. The fabric quality is wrinkle-resistant by default, which is quite cool and comfortable by default.', N'dien-do-doi-an-y-sanh-dieu-voi-ban-than-nhung-ngay-chom-dong-7c4211.jpg', 200, 2, 4, 50, N'S-L-M                                             ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (68, N'Long sleeve Chambray Shirt', N'Product Details:Material: Cotton,Chambray fabric;Features:Designed to fade,Spread collar,Long sleeves with buttoned cuffs,Button up front,1 chest patch pocket,Side vent detail', N'Long sleeve Chambray Shirt.jpg', 15, 10, 1, 5, N'S-L-XL-M                                          ')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Detail], [Image], [Price], [Quantity], [CategoryID], [Discount], [size]) VALUES (69, N'Active Mens Interlock Jacket', N'Product Details Material: Cotton and polyester Interlock fabric,Features Funnel neck Long raglan sleeves with ribbed cuffs Bonded chest pocket Zip front closure 2 side welt pockets Ribbed hem', N'Active Mens Interlock Jacket.jpg', 20, 15, 2, 2, N'S-L-XL-M                                          ')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (1, N'abc', N'$2a$10$DXbnxXIDlOhv9yNg0FznO.DmUb3/N.mP5uFXgk8z6w6BvueDqUMf.', N' ha noi ', N'012344444', 1, N'Admin                         ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (2, N'hac', N'$2a$10$DXbnxXIDlOhv9yNg0FznO.DmUb3/N.mP5uFXgk8z6w6BvueDqUMf.', N'thai binh', N'098765432', 1, N'Hoa                           ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (3, N'des', N'$2a$10$DXbnxXIDlOhv9yNg0FznO.DmUb3/N.mP5uFXgk8z6w6BvueDqUMf.', N'ha noi', N'123456777', 2, N'Anh                           ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (4, N'an', N'$2a$10$gazz1.gR0qmBy29wIw1E/uAowoEkc./j3LVDYDKYnRV5TwIR2AtZu', N'nghe an', N'0987898788', 2, N'Nam An                        ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (11, N'vui vui', N'$2a$10$EXKj9PCeFdf0j3kROpIqAOhf8Wxk8gBIaJlYXtjm4tIc9dNbL.LlW', N'ha noi', N'012345773', 2, N'minh                          ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (12, N'hello', N'$2a$10$KtsidRSoYqjfrSzbxmRVBemdsz9by2yOR9AQT7OwR.6R6n3TrXIO2', N'vung tau', N'1234567654', 2, N'hoang                         ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (13, N'meo', N'$2a$10$fkU1BATaghvxtyylq27WbewodV5uYzg42GIlFCgsL6cwASS8honXq', N'ha giang', N'12343211', 2, N'ha                            ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (14, N'quang ', N'$2a$10$8upk4zUBEoLYYZPQko9y7OEqZ8AdcikJDoMJbG2i5QQ.yXjiBdSu2', N'hoa binh', N'09898989989', 2, N'quang teo                     ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (16, N'huy', N'$2a$10$RmdpnI/ZeQK/ZYE2K.SmEevcjd1LKm5rBreQuFMZpqD4hqbZOLAcu', N'thai binh', N'09899898989', 2, N'nguyen huy                    ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (17, N'huyen', N'$2a$10$erj9Ezz9Mfkxk8j6XXCbpeTHK.Byo0lL2H/KUquFR30MG46uamXNW', N'thai binh', N'1234567890`', 2, N'nguyen huyen                  ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (18, N'a', N'$2a$10$ui0OIUwGkVVWhKOE7cPCruVEyV4bJ01EgLTzeUE3znC9UguJxFF5u', N'de', N'de', 2, N'de                            ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (19, N'ab', N'$2a$10$RQwQydXnnxYDaMZynptOxOnZMLqGERCJtD1zEHNQ/OKjzoz21Jqrm', N'd', N'd', 2, N'd                             ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (20, N'as', N'$2a$10$5XFApYFYbD1jgr.eqQoRn.kX/ybPZJUAoK64uH.PYE629LVlFAXKm', N'fr', N'fr', 2, N'fr                            ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (21, N'nh', N'$2a$10$qsmFlXbivLWJemnAqSNEz.fyFSHUJ.Hhe1nxJCms0Dw5alqNKxYaG', N'thai binh', N'12212121', 2, N'nhung                         ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (22, N'huy12', N'$2a$10$e4IK4V6GW1qWWSD3DkHcfu2Ct.Rihbeb2X1.T2fziu/6dL9Q9w8pq', N'ha noi', N'0123339293999 ', 2, N'a                             ')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Address], [ContactTitle], [Roll], [YourName]) VALUES (23, N'jun', N'$2a$10$TkoTtrWnnVUPdJdvEsjav.26TbpFmUXwedKSbdqefl.a5ibY6vuXS', N'ha noi', N'012010201', 2, N'jun jun ji                    ')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[Cart Item] ADD  DEFAULT ((0)) FOR [Action]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK__Cart__UserID__59FA5E80] FOREIGN KEY([UserID])
REFERENCES [dbo].[user] ([UserID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK__Cart__UserID__59FA5E80]
GO
ALTER TABLE [dbo].[Cart Item]  WITH CHECK ADD  CONSTRAINT [FK__Cart Item__CartI__5DCAEF64] FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[Cart Item] CHECK CONSTRAINT [FK__Cart Item__CartI__5DCAEF64]
GO
ALTER TABLE [dbo].[Cart Item]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__UserID__534D60F1] FOREIGN KEY([UserID])
REFERENCES [dbo].[user] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__UserID__534D60F1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__Order Det__Order__571DF1D5] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__Order Det__Order__571DF1D5]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
USE [master]
GO
ALTER DATABASE [WATCH_SHOP] SET  READ_WRITE 
GO

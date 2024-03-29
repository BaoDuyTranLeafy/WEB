USE [master]
GO
/****** Object:  Database [D&BShopDB]    Script Date: 08-Dec-23 6:04:25 PM ******/
CREATE DATABASE [D&BShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'D&BShopDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\D&BShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'D&BShopDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\D&BShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [D&BShopDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [D&BShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [D&BShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [D&BShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [D&BShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [D&BShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [D&BShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [D&BShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [D&BShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [D&BShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [D&BShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [D&BShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [D&BShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [D&BShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [D&BShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [D&BShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [D&BShopDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [D&BShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [D&BShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [D&BShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [D&BShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [D&BShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [D&BShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [D&BShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [D&BShopDB] SET RECOVERY FULL 
GO
ALTER DATABASE [D&BShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [D&BShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [D&BShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [D&BShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [D&BShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [D&BShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [D&BShopDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'D&BShopDB', N'ON'
GO
ALTER DATABASE [D&BShopDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [D&BShopDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [D&BShopDB]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 08-Dec-23 6:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [varchar](30) NOT NULL,
	[password] [varchar](90) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 08-Dec-23 6:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 08-Dec-23 6:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[phone] [varchar](20) NULL,
	[register_date] [date] NULL,
	[status] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 08-Dec-23 6:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [float] NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 08-Dec-23 6:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NOT NULL,
	[order_date] [date] NULL,
	[status] [smallint] NOT NULL,
	[customer_id] [int] NULL,
	[address] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 08-Dec-23 6:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[discount] [float] NOT NULL,
	[entered_date] [date] NULL,
	[image] [varchar](255) NULL,
	[name] [nvarchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [smallint] NOT NULL,
	[unit_price] [float] NOT NULL,
	[category_id] [int] NULL,
	[supplier_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 08-Dec-23 6:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([username], [password]) VALUES (N'admin001', N'$2a$10$PwVxfZHpGNYAncnTY/pSae3Icew2JAzFE4BUoRoi2MJJTtjd0.Nma')
INSERT [dbo].[accounts] ([username], [password]) VALUES (N'adminabc', N'$2a$10$V0nIdBAwoDQvkm7cpjrpe.5rB8sKDIcl99v9ts8Oqt6GL.iLz78oe')
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([category_id], [name]) VALUES (1, N'Diamond Watches')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (2, N'Leather Watches')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (3, N'Steel Watches')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (4, N'Gold Watches')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (5, N'Automatic Watches')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [register_date], [status]) VALUES (1, N'baoduy@gmail.com', N'Bao Duy', N'$2a$10$7m57IFHH9Y7PNgdqCt26C.9W.90z3gsT9hzFwWj7kYBN7jNpgZI0O', N'0943233454', CAST(N'2023-12-08' AS Date), 0)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [register_date], [status]) VALUES (2, N'thuydung@gmail.com', N'thuydung', N'$2a$10$ZKYGaCnBDjkm.uzKko1m9uvYDUV/P4n.UMrm6pJMyuXtfaL8mgOeW', N'0942934256', CAST(N'2023-12-08' AS Date), 0)
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[orderdetails] ON 

INSERT [dbo].[orderdetails] ([order_detail_id], [quantity], [unit_price], [order_id], [product_id]) VALUES (1, 1, 630000, 1, 2)
SET IDENTITY_INSERT [dbo].[orderdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [amount], [order_date], [status], [customer_id], [address]) VALUES (1, 630000, CAST(N'2023-12-08' AS Date), 5, 1, N'')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (1, N'Serpenti Seduttori watch with stainless steel case, 18 kt rose gold bezel set with 38 round brilliant-cut diamonds, black lacquered dial, stainless steel and 18 kt rose gold bracelet with folding buckle. Water-resistant up to 30 meters', 0, NULL, N'p9ef82f5a-2878-4245-854e-b8ef1ccfd94d.avif', N'SERPENTI SEDUTTORI WATCH', 131, 2, 13000, 1, 1)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (2, N'DIVAS'' DREAM watch featuring a 18 kt rose gold case and bracelet set with brilliant-cut diamonds, pink opal dial and 12 diamond indexes. Water-resistant up to 30 meters', 10, NULL, N'p0c65d72b-2c02-4f5e-b108-4432707067fa.avif', N'DIVAS’ DREAM WATCH', 34, 2, 700000, 1, 1)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (3, N'BVLGARI BVLGARI LADY watch in stainless steel case and bracelet, stainless steel bezel engraved with double logo, anthracite satiné soleil lacquered dial and diamond indexes', 0, NULL, N'p3d79fc91-175c-4263-b2e6-d2d8191cc009.avif', N'BVLGARI BVLGARI WATCH', 54, 2, 4000, 1, 1)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (4, N'SERPENTI SEDUTTORI Lady Watch. 33 mm rose gold 18kt case and bracelet. 18 kt rose gold bezel and crown set with 1 cab cut pink rubellite. Malachite dial and bracelet with folding clasp. Quartz movement, hours and minutes functions. Water-resistant up to 30 metres.', 10, NULL, N'p0e210352-41c4-45ca-8054-034cadba294e.avif', N'SERPENTI SEDUTTORI WATCH', 40, 1, 33000, 4, 1)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (6, N'BVLGARI BVLGARI LADY watch with stainless steel case, stainless steel bracelet, stainless steel bezel engraved with double logo and green sun-brushed dial.', 0, NULL, N'pd2f94b9d-e891-45d5-a4e6-196cf5e5e093.avif', N'BVLGARI BVLGARI WATCH LADY ', 26, 2, 3500, 1, 1)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (7, N'Divas’ Dream watch with mechanical manufacture movement, automatic winding, 18 kt white gold case and links set with brilliant-cut diamonds, natural peacock feather dial and green alligator bracelet. Water-resistant up to 30 meters. Limited edition of 25 pieces.', 10, NULL, N'p3a2bf11a-50ab-4f28-b56c-4372515cc4ad.avif', N'DIVAS’ DREAM WATCH LEATHER', 32, 1, 32000, 2, 1)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (8, N'LVCEA Lady Watch , 28 mm stainless steel case and crown with a synthetic cabochon-cut rubellite and 1 round diamond. Blue aventurine dial intarsio marquetery with 12 round brilliant cut diamonds indexes. Quartz movement, B043 caliber customized and decorated with Bulgari logo hours minutes functions. Blue alligator strap with stitches links to the case set with diamonds and steel ardillon buckle. T Water proof 50 m.', 0, NULL, N'p12dd1337-cb00-4a85-bac4-825ae1ec536f.avif', N'LVCEA WATCH', 43, 2, 4000, 2, 1)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (9, N'Tank Française watch, small model, quartz movement. Steel case. Faceted crown in steel decorated with a synthetic cabochon-shaped spinel. Silvered sunray dial, blued-steel sword-shaped hands, sapphire crystal. Steel bracelet. Case dimensions: 25.7 mm x 21.2 mm, thickness: 6.8 mm. Water-resistant up to 3 bar (approx. 30 meters/100 feet', 0, NULL, N'pe0328ed6-c67e-4177-893f-4623ec83fb49.avif', N'TANK FRANÇAISE WATCH', 54, 2, 3700, 3, 2)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (10, N'Tank Française watch, small model, quartz movement. Case in 18K yellow gold (750/1000). Faceted crown in 18K yellow gold 750/1000 decorated with a sapphire cabochon. Golden sunray dial, blued-steel sword-shaped hands, sapphire crystal. Bracelet in 18K yellow gold (750/1000). Dimensions: 25.7 mm x 21.2 mm, thickness: 6.8 mm. Water-resistant to 3 bar (approx. 30 meters/100 feet)', 0, NULL, N'pee24f89c-0e9a-4de6-bde3-86cdecd448a4.avif', N'TANK FRANÇAISE WATCH GOLD', 65, 2, 22300, 4, 2)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (12, N'Ballon Bleu de Cartier watch, 36 mm, mechanical movement with automatic winding. Steel case, fluted crown set with a cabochon synthetic spinel. Silver guilloché dial. Blued-steel sword-shaped hands. Sapphire crystal. Steel interchangeable bracelet. Case thickness: 12.1 mm. Water-resistant up to 3 bar (approx. 30 meters/100 feet).', 0, NULL, N'p89402f78-b406-468e-a413-12933185f7c5.avif', N'BALLON BLEU DE CARTIER WATCH', 33, 3, 6600, 3, 2)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (13, N'Ronde Louis Cartier watch, 40 mm, Manufacture mechanical movement with automatic winding, calibre 1847 MC. Case and beaded crown in 18K rose gold (750/1000) set with a blue sapphire. Sandblasted beige dial. Blued-steel sword-shaped hands. Sapphire crystal. Strap in semi-matte gray alligator leather, deployant buckle in 18K rose gold (750/1000). Thickness: 9.62 mm. Power reserve: 40 hours. Water-resistant up to 3 bar (approx. 30 meters/100 feet).', 0, NULL, N'pe029767e-a11d-47b3-9204-523790e26c26.avif', N'RONDE LOUIS CARTIER WATCH', 73, 2, 17000, 2, 2)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (14, N'Octo Roma Naturalia watch with mechanical manufacture movement, manual winding and flying tourbillon, satin-polished 18 kt rose gold case, tiger''s eye middle case, caliber and bar-indexes, transparent case back and brown alligator bracelet. Water-resistant up to 50 meters.', 0, NULL, N'p795a1697-5c12-4306-a2ad-86cfff6f668d.avif', N'OCTO ROMA WATCH', 32, 0, 13000, 2, 1)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (15, N'Bvlgari Aluminium Match Point Edition watch with mechanical manufacture movement, automatic winding, 40 mm aluminum case, dark green rubber bezel and bracelet, and white dial. Water-resistant up to 100 meters. Special Edition limited to 800 pieces.', 0, NULL, N'p0f9c26d3-4f44-4599-b1ce-d218c5c57c5c.avif', N'BVLGARI ALUMINIUM WATCH', 73, 2, 3400, 5, 1)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (17, N'Octo Finissimo Automatic watch in satin-polished stainless steel with mechanical manufacture ultra-thin movement (2.23 mm thick), automatic winding and sun-brushed metallic salmon dial with rhodium applied stickers. Water resistant up to 100 meters.', 10, NULL, N'p4a6411c8-8e99-4ac6-ae87-4c94294210a1.avif', N'OCTO FINISSIMO WATCH', 120, 1, 13000, 5, 1)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (18, N'Diameter:42 mm
Interchangeable quick release bracelet
Automatic movement - up to 80 hours power reserve', 10, NULL, N'pfc0f4ab4-834e-44a7-b2e2-011424a348ad.avif', N'TISSOT CHEMIN DES TOURELLES POWERMATIC 80 42 MM', 44, 1, 5700, 2, 3)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (19, N'Diameter:42 mm
Interchangeable quick release bracelet
Automatic movement - up to 80 hours power reserve', 5, NULL, N'p4f709b94-a4c0-4820-86a8-76f6a8bd1aee.avif', N'TISSOT EVERYTIME 34MM', 0, 1, 4700, 3, 3)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (20, N'Diameter:40 mm
Automatic movement - up to 80 hours power reserve
316L stainless steel case with 18K yellow gold bezel', 0, NULL, N'p54b4e8b7-961f-43f1-b44c-a02e207cb869.avif', N'TISSOT GENTLEMAN POWERMATIC 80 SILICIUM SOLID 18K GOLD BEZEL', 40, 2, 8800, 4, 3)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (21, N'Diameter:33 mm
Diamonds
316L stainless steel case with 18K rose gold bezel', 0, NULL, N'p33d97012-061a-467b-ae41-ebf83455bc3c.avif', N'TISSOT GLENDORA 18K GOLD', 56, 3, 8000, 4, 3)
INSERT [dbo].[products] ([product_id], [description], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price], [category_id], [supplier_id]) VALUES (22, N'Diameter:19.5 mm
316L stainless steel case with yellow gold PVD coating
Swiss Quartz movement', 0, NULL, N'p20859309-38d3-43cf-8bc4-1cfc65624580.avif', N'TISSOT LOVELY', 34, 3, 9699, 4, 3)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[suppliers] ON 

INSERT [dbo].[suppliers] ([supplier_id], [name]) VALUES (1, N'Bvlgari')
INSERT [dbo].[suppliers] ([supplier_id], [name]) VALUES (2, N'Cartier')
INSERT [dbo].[suppliers] ([supplier_id], [name]) VALUES (3, N'Tissot')
SET IDENTITY_INSERT [dbo].[suppliers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_278a8svwcsgmqrwb3tw4wjbuv]    Script Date: 08-Dec-23 6:04:26 PM ******/
ALTER TABLE [dbo].[customers] ADD  CONSTRAINT [UK_278a8svwcsgmqrwb3tw4wjbuv] UNIQUE NONCLUSTERED 
(
	[password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_m3iom37efaxd5eucmxjqqcbe9]    Script Date: 08-Dec-23 6:04:26 PM ******/
ALTER TABLE [dbo].[customers] ADD  CONSTRAINT [UK_m3iom37efaxd5eucmxjqqcbe9] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK92im1bt9gndrexccag7x5oq92] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK92im1bt9gndrexccag7x5oq92]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKhnsosbuy7bhpqpnt3bjr7sh8x] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKhnsosbuy7bhpqpnt3bjr7sh8x]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKpxtb8awmi0dk6smoh2vp1litg] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKpxtb8awmi0dk6smoh2vp1litg]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK6i174ixi9087gcvvut45em7fd] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[suppliers] ([supplier_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK6i174ixi9087gcvvut45em7fd]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
USE [master]
GO
ALTER DATABASE [D&BShopDB] SET  READ_WRITE 
GO

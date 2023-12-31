USE [master]
GO
/****** Object:  Database [MvcDbStok]    Script Date: 10.06.2023 15:08:57 ******/
CREATE DATABASE [MvcDbStok]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MvcDbStok', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\MvcDbStok.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MvcDbStok_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\MvcDbStok_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MvcDbStok] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MvcDbStok].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MvcDbStok] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MvcDbStok] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MvcDbStok] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MvcDbStok] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MvcDbStok] SET ARITHABORT OFF 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MvcDbStok] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MvcDbStok] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MvcDbStok] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MvcDbStok] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MvcDbStok] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MvcDbStok] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MvcDbStok] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MvcDbStok] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MvcDbStok] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MvcDbStok] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MvcDbStok] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MvcDbStok] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MvcDbStok] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MvcDbStok] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MvcDbStok] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MvcDbStok] SET  MULTI_USER 
GO
ALTER DATABASE [MvcDbStok] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MvcDbStok] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MvcDbStok] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MvcDbStok] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MvcDbStok] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MvcDbStok]
GO
/****** Object:  User [SIMATIC HMI VIEWER User]    Script Date: 10.06.2023 15:08:57 ******/
CREATE USER [SIMATIC HMI VIEWER User] FOR LOGIN [DESKTOP-NIJEM97\SIMATIC HMI VIEWER]
GO
/****** Object:  User [SIMATIC HMI User]    Script Date: 10.06.2023 15:08:57 ******/
CREATE USER [SIMATIC HMI User] FOR LOGIN [DESKTOP-NIJEM97\SIMATIC HMI]
GO
/****** Object:  DatabaseRole [SIMATIC HMI VIEWER role]    Script Date: 10.06.2023 15:08:57 ******/
CREATE ROLE [SIMATIC HMI VIEWER role]
GO
/****** Object:  DatabaseRole [SIMATIC HMI role]    Script Date: 10.06.2023 15:08:57 ******/
CREATE ROLE [SIMATIC HMI role]
GO
ALTER ROLE [SIMATIC HMI VIEWER role] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [SIMATIC HMI role] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER role]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI role]
GO
/****** Object:  Table [dbo].[TblKategoriler]    Script Date: 10.06.2023 15:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblKategoriler](
	[KategoriId] [smallint] IDENTITY(1,1) NOT NULL,
	[KategoriAd] [varchar](100) NULL,
 CONSTRAINT [PK_TblKategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMusteri]    Script Date: 10.06.2023 15:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMusteri](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAd] [varchar](100) NULL,
	[MusteriSoyad] [varchar](100) NULL,
 CONSTRAINT [PK_TblMusteri] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblSatislar]    Script Date: 10.06.2023 15:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSatislar](
	[SatisId] [int] IDENTITY(1,1) NOT NULL,
	[UrunId] [int] NULL,
	[MusteriId] [int] NULL,
	[Adet] [tinyint] NULL,
	[Fiyat] [decimal](18, 2) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_TblSatislar] PRIMARY KEY CLUSTERED 
(
	[SatisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUrunler]    Script Date: 10.06.2023 15:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUrunler](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunAd] [varchar](100) NULL,
	[Marka] [varchar](50) NULL,
	[KategoriId] [smallint] NULL,
	[Fiyat] [decimal](18, 2) NULL,
	[Stok] [tinyint] NULL,
 CONSTRAINT [PK_TblUrunler] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblKategoriler] ON 

INSERT [dbo].[TblKategoriler] ([KategoriId], [KategoriAd]) VALUES (1, N'BEYAZ EŞYA')
INSERT [dbo].[TblKategoriler] ([KategoriId], [KategoriAd]) VALUES (2, N'KÜÇÜK EV ALETLERİ')
INSERT [dbo].[TblKategoriler] ([KategoriId], [KategoriAd]) VALUES (3, N'BİLGİSAYAR')
INSERT [dbo].[TblKategoriler] ([KategoriId], [KategoriAd]) VALUES (4, N'PC ÜRÜNLERİ')
INSERT [dbo].[TblKategoriler] ([KategoriId], [KategoriAd]) VALUES (19, N'TV')
INSERT [dbo].[TblKategoriler] ([KategoriId], [KategoriAd]) VALUES (120, N'Deneme')
SET IDENTITY_INSERT [dbo].[TblKategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[TblMusteri] ON 

INSERT [dbo].[TblMusteri] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (1, N'EMEL', N'ÇINARLI')
INSERT [dbo].[TblMusteri] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (2, N'ALİ', N'YILDIZ')
INSERT [dbo].[TblMusteri] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (3, N'MEHMET', N'ÖZTÜRK')
INSERT [dbo].[TblMusteri] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (4, N'AHMET', N'ÇAM')
INSERT [dbo].[TblMusteri] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (5, N'HASAN', N'AÇIK')
INSERT [dbo].[TblMusteri] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (6, N'AYŞE', N'FİDAN')
INSERT [dbo].[TblMusteri] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (7, N'MEHMET', N'ŞENEL')
INSERT [dbo].[TblMusteri] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (8, N'TUNA', N'YILDIRIM')
INSERT [dbo].[TblMusteri] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (10, N'HASAN', N'ÖZTÜRK')
INSERT [dbo].[TblMusteri] ([MusteriId], [MusteriAd], [MusteriSoyad]) VALUES (11, N'AKİF', N'SEZER')
SET IDENTITY_INSERT [dbo].[TblMusteri] OFF
GO
SET IDENTITY_INSERT [dbo].[TblSatislar] ON 

INSERT [dbo].[TblSatislar] ([SatisId], [UrunId], [MusteriId], [Adet], [Fiyat], [Durum]) VALUES (1, 3, 4, 1, CAST(145.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[TblSatislar] ([SatisId], [UrunId], [MusteriId], [Adet], [Fiyat], [Durum]) VALUES (2, 4, 4, 1, CAST(145.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[TblSatislar] ([SatisId], [UrunId], [MusteriId], [Adet], [Fiyat], [Durum]) VALUES (3, 3, 4, 1, CAST(150.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TblSatislar] ([SatisId], [UrunId], [MusteriId], [Adet], [Fiyat], [Durum]) VALUES (5, 4, 8, 5, CAST(123.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[TblSatislar] OFF
GO
SET IDENTITY_INSERT [dbo].[TblUrunler] ON 

INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (1, N'ÇAMAŞIR MAKİNESİ', N'ARÇELİK', 1, CAST(12000.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (2, N'BULAŞIK MAKİNESİ', N'ARÇELİK', 1, CAST(9500.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (3, N'SU ISITICI', N'VESTEL', 2, CAST(500.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (4, N'ÜTÜ', N'TEFAL', 2, CAST(1000.00 AS Decimal(18, 2)), 25)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (5, N'BUZDOLABI', N'REGAL', 1, CAST(2500.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (6, N'LAPTOP', N'TOSHIBA', 3, CAST(3540.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (7, N'LAPTOP A5', N'MONSTER', 3, CAST(6542.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (8, N'HDD 250 GB', N'TOSHIBA', 4, CAST(250.00 AS Decimal(18, 2)), 25)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (9, N'SDD 250 GB', N'KINGSTON', 4, CAST(500.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (10, N'KLAVYE', N'LOGITECH', 4, CAST(125.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (11, N'LCD', N'SIEMENS', 19, CAST(2000.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (12, N'ÜTÜ', N'LİDER', 2, CAST(2000.00 AS Decimal(18, 2)), 50)
INSERT [dbo].[TblUrunler] ([UrunId], [UrunAd], [Marka], [KategoriId], [Fiyat], [Stok]) VALUES (13, N'KURUTMA MAKİNESİ', N'SAMSUNG', 1, CAST(2500.59 AS Decimal(18, 2)), 51)
SET IDENTITY_INSERT [dbo].[TblUrunler] OFF
GO
ALTER TABLE [dbo].[TblUrunler]  WITH CHECK ADD  CONSTRAINT [FK_TblUrunler_TblKategoriler] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[TblKategoriler] ([KategoriId])
GO
ALTER TABLE [dbo].[TblUrunler] CHECK CONSTRAINT [FK_TblUrunler_TblKategoriler]
GO
/****** Object:  DdlTrigger [OnTriggerDboSchema]    Script Date: 10.06.2023 15:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [OnTriggerDboSchema] ON database FOR create_table, create_view AS BEGIN   DECLARE @xmlEventData xml   SELECT    @xmlEventData = eventdata()   DECLARE @schemaName nvarchar(max)   DECLARE @objectName nvarchar(max)   DECLARE @DynSql nvarchar(max)      SET @schemaName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/SchemaName/text()'))   SET @objectName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/ObjectName/text()'))   IF(@schemaName='')   BEGIN     SET @DynSql = N'alter schema [dbo] transfer [' + @schemaName + N'].[' + @objectName + N']'     EXEC sp_executesql @statement=@DynSql   END END SET QUOTED_IDENTIFIER ON SET ANSI_NULLS ON 
GO
ENABLE TRIGGER [OnTriggerDboSchema] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [MvcDbStok] SET  READ_WRITE 
GO

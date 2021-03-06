USE [master]
GO
/****** Object:  Database [MVCKutuphane]    Script Date: 16.08.2020 20:58:52 ******/
CREATE DATABASE [MVCKutuphane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVCKutuphane', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVCKutuphane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVCKutuphane_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVCKutuphane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MVCKutuphane] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVCKutuphane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVCKutuphane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVCKutuphane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVCKutuphane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVCKutuphane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVCKutuphane] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVCKutuphane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVCKutuphane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVCKutuphane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVCKutuphane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVCKutuphane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVCKutuphane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVCKutuphane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVCKutuphane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVCKutuphane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVCKutuphane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVCKutuphane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVCKutuphane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVCKutuphane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVCKutuphane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVCKutuphane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVCKutuphane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVCKutuphane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVCKutuphane] SET RECOVERY FULL 
GO
ALTER DATABASE [MVCKutuphane] SET  MULTI_USER 
GO
ALTER DATABASE [MVCKutuphane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVCKutuphane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVCKutuphane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVCKutuphane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVCKutuphane] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVCKutuphane', N'ON'
GO
ALTER DATABASE [MVCKutuphane] SET QUERY_STORE = OFF
GO
USE [MVCKutuphane]
GO
/****** Object:  Table [dbo].[Cezalar]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cezalar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uye] [int] NULL,
	[Hareket] [int] NULL,
	[Baslangic] [smalldatetime] NULL,
	[Bitis] [smalldatetime] NULL,
	[Ceza] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Cezalar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Duyurular]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Duyurular](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Kategori] [varchar](50) NULL,
	[Duyuru] [varchar](500) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_Duyurular] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hakkimizda]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hakkimizda](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Aciklama] [varchar](max) NULL,
 CONSTRAINT [PK_Hakkimizda] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hareketler]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hareketler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Kitap] [int] NULL,
	[Uye] [int] NULL,
	[Personel] [tinyint] NULL,
	[AlisTarihi] [smalldatetime] NULL,
	[İadeTarih] [smalldatetime] NULL,
	[GeldigiTarih] [smalldatetime] NULL,
	[IslemDurum] [bit] NULL,
 CONSTRAINT [PK_Hareketler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kasa]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kasa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Toplam] [decimal](18, 2) NULL,
	[Ay] [varchar](20) NULL,
 CONSTRAINT [PK_Kasa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Kategori] [varchar](30) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitaplar]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NULL,
	[Kategori] [tinyint] NULL,
	[Yazar] [int] NULL,
	[BasimYili] [char](4) NULL,
	[YayinEvi] [varchar](50) NULL,
	[Sayfa] [varchar](5) NULL,
	[Resim] [varchar](300) NULL,
	[Durum] [bit] NULL,
	[Durum2] [bit] NULL,
 CONSTRAINT [PK_Kitaplar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciMesajlar]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciMesajlar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gonderen] [varchar](50) NULL,
	[Alici] [varchar](50) NULL,
	[Konu] [varchar](50) NULL,
	[Icerik] [varchar](max) NULL,
	[Tarih] [smalldatetime] NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_KullaniciMesajlar,] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesajlar]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesajlar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NULL,
	[Mail] [varchar](150) NULL,
	[Konu] [varchar](30) NULL,
	[Mesaj] [varchar](max) NULL,
 CONSTRAINT [PK_Mesajlar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personeller]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personeller](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Personel] [varchar](50) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](30) NULL,
	[Soyad] [varchar](30) NULL,
	[Mail] [varchar](150) NULL,
	[KullaniciAdi] [varchar](20) NULL,
	[Sifre] [varchar](20) NULL,
	[Fotograf] [varchar](250) NULL,
	[Telefon] [varchar](20) NULL,
	[Okul] [varchar](150) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_Uyeler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yazarlar]    Script Date: 16.08.2020 20:58:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yazarlar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](30) NULL,
	[Soyad] [varchar](30) NULL,
	[Detay] [varchar](1000) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_Yazarlar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cezalar] ON 

INSERT [dbo].[Cezalar] ([Id], [Uye], [Hareket], [Baslangic], [Bitis], [Ceza]) VALUES (1, 1, 5, NULL, NULL, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[Cezalar] ([Id], [Uye], [Hareket], [Baslangic], [Bitis], [Ceza]) VALUES (2, 3, 7, NULL, NULL, CAST(-7.00 AS Decimal(18, 2)))
INSERT [dbo].[Cezalar] ([Id], [Uye], [Hareket], [Baslangic], [Bitis], [Ceza]) VALUES (3, 1, 8, NULL, NULL, CAST(-7.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Cezalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Duyurular] ON 

INSERT [dbo].[Duyurular] ([Id], [Kategori], [Duyuru], [Durum]) VALUES (1, N'Çalışma Saatleri', N'10.08.2020 Pazartesi kütüphanemiz 09.00-13.00 saatleri arasında hizmet vermeyecektri.', 1)
INSERT [dbo].[Duyurular] ([Id], [Kategori], [Duyuru], [Durum]) VALUES (2, N'Bakım', N'11.08.2020 Öğleden önce kütüphane elektrik tesisatında bakım yapılacaktır. Kütüphanemiz 09.00-13.00 saatlerinde kapalıdır.', 0)
SET IDENTITY_INSERT [dbo].[Duyurular] OFF
GO
SET IDENTITY_INSERT [dbo].[Hakkimizda] ON 

INSERT [dbo].[Hakkimizda] ([Id], [Aciklama]) VALUES (1, N'Bu proje Asp.Net MVC kullanılarak yapılmıştır. Admin , Vitrin ve Kullanıcı modülü olmak üzere üç parçadan oluşmaktadır. Bootstrap, jquery ve font-awesome kullanılarak yapılmıştır.')
SET IDENTITY_INSERT [dbo].[Hakkimizda] OFF
GO
SET IDENTITY_INSERT [dbo].[Hareketler] ON 

INSERT [dbo].[Hareketler] ([Id], [Kitap], [Uye], [Personel], [AlisTarihi], [İadeTarih], [GeldigiTarih], [IslemDurum]) VALUES (1, 1, 1, 1, CAST(N'2020-08-04T00:00:00' AS SmallDateTime), CAST(N'2020-08-11T00:00:00' AS SmallDateTime), CAST(N'2020-08-05T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[Hareketler] ([Id], [Kitap], [Uye], [Personel], [AlisTarihi], [İadeTarih], [GeldigiTarih], [IslemDurum]) VALUES (2, 2, 2, 2, CAST(N'2020-08-04T00:00:00' AS SmallDateTime), CAST(N'2020-08-11T00:00:00' AS SmallDateTime), CAST(N'2020-08-05T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[Hareketler] ([Id], [Kitap], [Uye], [Personel], [AlisTarihi], [İadeTarih], [GeldigiTarih], [IslemDurum]) VALUES (3, 3, 1, 1, CAST(N'2020-08-05T00:00:00' AS SmallDateTime), CAST(N'2020-08-12T00:00:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Hareketler] ([Id], [Kitap], [Uye], [Personel], [AlisTarihi], [İadeTarih], [GeldigiTarih], [IslemDurum]) VALUES (4, 1, 2, 1, CAST(N'2020-08-05T00:00:00' AS SmallDateTime), CAST(N'2020-08-12T00:00:00' AS SmallDateTime), CAST(N'2020-08-05T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[Hareketler] ([Id], [Kitap], [Uye], [Personel], [AlisTarihi], [İadeTarih], [GeldigiTarih], [IslemDurum]) VALUES (5, 1, 1, 1, CAST(N'2020-08-01T00:00:00' AS SmallDateTime), CAST(N'2020-08-03T00:00:00' AS SmallDateTime), CAST(N'2020-08-05T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[Hareketler] ([Id], [Kitap], [Uye], [Personel], [AlisTarihi], [İadeTarih], [GeldigiTarih], [IslemDurum]) VALUES (6, 1, 1, 1, CAST(N'2020-08-06T00:00:00' AS SmallDateTime), CAST(N'2020-08-13T00:00:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Hareketler] ([Id], [Kitap], [Uye], [Personel], [AlisTarihi], [İadeTarih], [GeldigiTarih], [IslemDurum]) VALUES (7, 4, 3, 3, CAST(N'2020-08-07T00:00:00' AS SmallDateTime), CAST(N'2020-08-14T00:00:00' AS SmallDateTime), CAST(N'2020-08-07T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[Hareketler] ([Id], [Kitap], [Uye], [Personel], [AlisTarihi], [İadeTarih], [GeldigiTarih], [IslemDurum]) VALUES (8, 2, 1, 1, CAST(N'2020-08-07T00:00:00' AS SmallDateTime), CAST(N'2020-08-14T00:00:00' AS SmallDateTime), CAST(N'2020-08-07T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[Hareketler] ([Id], [Kitap], [Uye], [Personel], [AlisTarihi], [İadeTarih], [GeldigiTarih], [IslemDurum]) VALUES (9, 4, 8, 4, CAST(N'2020-08-07T00:00:00' AS SmallDateTime), CAST(N'2020-08-14T00:00:00' AS SmallDateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Hareketler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (1, N'Macera', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (2, N'Bilim Kurgu', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (3, N'Fantastik', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (4, N'Romantik', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (5, N'Tarih', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (6, N'Klasik Eserler', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (7, N'Öykü', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (8, N'Komedi', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (9, N'Anı', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (10, N'asdasd', 0)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (11, N'Şiir', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (12, N'Biyografi', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (13, N'Otobiyografi', 1)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (14, NULL, NULL)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (15, N'asdasd', 0)
INSERT [dbo].[Kategoriler] ([Id], [Kategori], [Durum]) VALUES (16, N'asdasd', 1)
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kitaplar] ON 

INSERT [dbo].[Kitaplar] ([Id], [Ad], [Kategori], [Yazar], [BasimYili], [YayinEvi], [Sayfa], [Resim], [Durum], [Durum2]) VALUES (1, N'Huzur', 4, 1, N'1948', N'cycv', N'383', N'https://www.bizde.com/resim/209/tn408/huzur-ahmet-hamdi-tanpinar-mb36066_2099142_r1.jpg', 0, 1)
INSERT [dbo].[Kitaplar] ([Id], [Ad], [Kategori], [Yazar], [BasimYili], [YayinEvi], [Sayfa], [Resim], [Durum], [Durum2]) VALUES (2, N'Kendi Gök Kubbemiz', 14, 5, N'1961', NULL, N'120', N'https://n11scdn.akamaized.net/a1/450/kitap-muzik-film-oyun/cagdas-turk-ve-dunya-edebiyati/kendi-gok-kubbemiz__0773135965830912.jpg', 1, 0)
INSERT [dbo].[Kitaplar] ([Id], [Ad], [Kategori], [Yazar], [BasimYili], [YayinEvi], [Sayfa], [Resim], [Durum], [Durum2]) VALUES (3, N'Beş Şehir', 12, 1, N'1946', N'bhu', N'240', N'https://www.kitapkolik.com/bes-sehir-notlariyla-ahmet-hamdi-tanpinar-dergah-yayinlari-178684-56-B.jpg', 0, 1)
INSERT [dbo].[Kitaplar] ([Id], [Ad], [Kategori], [Yazar], [BasimYili], [YayinEvi], [Sayfa], [Resim], [Durum], [Durum2]) VALUES (4, N'İki Şehrin Hikayesi', 3, 5, N'1859', N'jnj', NULL, N'https://i.idefix.com/cache/600x600-0/originals/0000000688230-1.jpg', 0, 1)
INSERT [dbo].[Kitaplar] ([Id], [Ad], [Kategori], [Yazar], [BasimYili], [YayinEvi], [Sayfa], [Resim], [Durum], [Durum2]) VALUES (5, N'Kaşağı', 8, 1, NULL, NULL, NULL, N'https://cdn1.dokuzsoft.com/u/bilgiyayinevi/img/b/k/a/kasagi-1472736753.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Kitaplar] OFF
GO
SET IDENTITY_INSERT [dbo].[KullaniciMesajlar] ON 

INSERT [dbo].[KullaniciMesajlar] ([Id], [Gonderen], [Alici], [Konu], [Icerik], [Tarih], [Durum]) VALUES (1, N'ayse4455@outlook.com', N'hasaer@gmail.com', N'Selam', N'Geçen kütüphanede kartını unutmuşsun. Kütüphanede görevliye bıraktım.', CAST(N'2020-08-06T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[KullaniciMesajlar] ([Id], [Gonderen], [Alici], [Konu], [Icerik], [Tarih], [Durum]) VALUES (2, N'alisz234@hotmail.com', N'hasaer@gmail.com', N'Teşekkür', N'Geçen önerdiğin kitabı okudum ve çok güzeldi.', CAST(N'2020-08-06T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[KullaniciMesajlar] ([Id], [Gonderen], [Alici], [Konu], [Icerik], [Tarih], [Durum]) VALUES (3, N'keremVaris@gmail.com', N'hasaer@gmail.com', N'Rica', N'Merhaba kütüphaneye yeni kayıt oldum. Size birkaç şey soracaktım.', CAST(N'2020-08-06T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[KullaniciMesajlar] ([Id], [Gonderen], [Alici], [Konu], [Icerik], [Tarih], [Durum]) VALUES (4, N'hasaer@gmail.com', N'ayse4455@outlook.com', N'Selam', N'Kart için teşekkür ederim.', CAST(N'2020-08-06T00:00:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [dbo].[KullaniciMesajlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Mesajlar] ON 

INSERT [dbo].[Mesajlar] ([Id], [Ad], [Mail], [Konu], [Mesaj]) VALUES (1, N'Hasan Erdal', N'hassdsada@gmail.com', N'asdasd', N'asdmasdamkmsdkmnasd')
SET IDENTITY_INSERT [dbo].[Mesajlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Personeller] ON 

INSERT [dbo].[Personeller] ([Id], [Personel], [Durum]) VALUES (1, N'Murat Sarı', 1)
INSERT [dbo].[Personeller] ([Id], [Personel], [Durum]) VALUES (2, N'Hakan Yüce', 1)
INSERT [dbo].[Personeller] ([Id], [Personel], [Durum]) VALUES (3, N'Salih Sucu', 1)
INSERT [dbo].[Personeller] ([Id], [Personel], [Durum]) VALUES (4, N'Merve Sağır', 1)
INSERT [dbo].[Personeller] ([Id], [Personel], [Durum]) VALUES (5, N'asdasdafdsf', 0)
INSERT [dbo].[Personeller] ([Id], [Personel], [Durum]) VALUES (6, N'asdasd', 0)
SET IDENTITY_INSERT [dbo].[Personeller] OFF
GO
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (1, N'Hasan', N'Erdal', N'hasaer@gmail.com', N'filiphasan', N'1234', NULL, N'5365875596', N'Uludağ', 1)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (2, N'Ayşe', N'Solmaz', N'ayse4455@outlook.com', N'ayse4554', N'1234', NULL, N'5446982175', N'asda', 1)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (3, N'Ali', N'Saz', N'alisz234@hotmail.com', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (4, N'Nil', N'Şahin', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (5, N'Mehmet', N'Tek', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (6, N'Salih', N'Top', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (7, N'Selin', N'Pek', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (8, N'Pelin', N'Şeker', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (9, N'Büşra', N'Erdal', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (10, N'Kemal', N'Mutlu', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (11, N'Kamil', N'Vurar', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (12, N'Selim', N'Şirk', NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Uyeler] ([Id], [Ad], [Soyad], [Mail], [KullaniciAdi], [Sifre], [Fotograf], [Telefon], [Okul], [Durum]) VALUES (13, N'Kerem', N'Varis', N'keremVaris@gmail.com', N'keremVaris23', N'12345', NULL, N'5370352856', N'Uludağ Üni', 1)
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
GO
SET IDENTITY_INSERT [dbo].[Yazarlar] ON 

INSERT [dbo].[Yazarlar] ([Id], [Ad], [Soyad], [Detay], [Durum]) VALUES (1, N'Ahmet Hamdi', N'Tanpınar', N'Ahmet Hamdi Tanpınar, Türk şair, romancı, deneme yazarı, edebiyat tarihçisi, siyasetçi ve akademisyendir.Cumhuriyet neslinin ilk öğretmenlerinden olan Ahmet Hamdi Tanpınar; "Bursa''da Zaman" şiiri ile geniş bir okuyucu kitlesi tarafından tanınmış bir şairdir', 1)
INSERT [dbo].[Yazarlar] ([Id], [Ad], [Soyad], [Detay], [Durum]) VALUES (2, N'Yahya Kemal', N'Beyatlı', N'Yahya Kemal Beyatlı, Türk şair, yazar, siyasetçi, diplomat. Doğum adı Ahmed Agâh’tır. Cumhuriyet dönemi Türk şiirinin en büyük temsilcilerinden biridir. Şiirleri Divan edebiyatı ile modern şiir arasında köprülük görevi üstlenmiştir. Türk edebiyat tarihi içinde Dört Aruzcular''dan biri olarak kabul edilir', 1)
INSERT [dbo].[Yazarlar] ([Id], [Ad], [Soyad], [Detay], [Durum]) VALUES (5, N'Charles', N'Dickens', N'Charles John Huffam Dickens, İngiliz yazar ve toplum eleştirmeni. En unutulmaz kurgusal karakterlerden bazılarını yaratmasının yanında Victoria devrinin en iyi romancısı olarak kabul edilir.', 1)
SET IDENTITY_INSERT [dbo].[Yazarlar] OFF
GO
ALTER TABLE [dbo].[Duyurular] ADD  CONSTRAINT [DF_Duyurular_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Hareketler] ADD  CONSTRAINT [DF_Hareketler_IslemDurum]  DEFAULT ((0)) FOR [IslemDurum]
GO
ALTER TABLE [dbo].[Kategoriler] ADD  CONSTRAINT [DF_Kategoriler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[KullaniciMesajlar] ADD  CONSTRAINT [DF_KullaniciMesajlar,_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Personeller] ADD  CONSTRAINT [DF_Personeller_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Uyeler] ADD  CONSTRAINT [DF_Uyeler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Yazarlar] ADD  CONSTRAINT [DF_Yazarlar_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Cezalar]  WITH CHECK ADD  CONSTRAINT [FK_Cezalar_Hareketler] FOREIGN KEY([Hareket])
REFERENCES [dbo].[Hareketler] ([Id])
GO
ALTER TABLE [dbo].[Cezalar] CHECK CONSTRAINT [FK_Cezalar_Hareketler]
GO
ALTER TABLE [dbo].[Cezalar]  WITH CHECK ADD  CONSTRAINT [FK_Cezalar_Uyeler] FOREIGN KEY([Uye])
REFERENCES [dbo].[Uyeler] ([Id])
GO
ALTER TABLE [dbo].[Cezalar] CHECK CONSTRAINT [FK_Cezalar_Uyeler]
GO
ALTER TABLE [dbo].[Hareketler]  WITH CHECK ADD  CONSTRAINT [FK_Hareketler_Kitaplar] FOREIGN KEY([Kitap])
REFERENCES [dbo].[Kitaplar] ([Id])
GO
ALTER TABLE [dbo].[Hareketler] CHECK CONSTRAINT [FK_Hareketler_Kitaplar]
GO
ALTER TABLE [dbo].[Hareketler]  WITH CHECK ADD  CONSTRAINT [FK_Hareketler_Personeller] FOREIGN KEY([Personel])
REFERENCES [dbo].[Personeller] ([Id])
GO
ALTER TABLE [dbo].[Hareketler] CHECK CONSTRAINT [FK_Hareketler_Personeller]
GO
ALTER TABLE [dbo].[Hareketler]  WITH CHECK ADD  CONSTRAINT [FK_Hareketler_Uyeler] FOREIGN KEY([Uye])
REFERENCES [dbo].[Uyeler] ([Id])
GO
ALTER TABLE [dbo].[Hareketler] CHECK CONSTRAINT [FK_Hareketler_Uyeler]
GO
ALTER TABLE [dbo].[Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_Kitaplar_Kategoriler] FOREIGN KEY([Kategori])
REFERENCES [dbo].[Kategoriler] ([Id])
GO
ALTER TABLE [dbo].[Kitaplar] CHECK CONSTRAINT [FK_Kitaplar_Kategoriler]
GO
ALTER TABLE [dbo].[Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_Kitaplar_Yazarlar] FOREIGN KEY([Yazar])
REFERENCES [dbo].[Yazarlar] ([Id])
GO
ALTER TABLE [dbo].[Kitaplar] CHECK CONSTRAINT [FK_Kitaplar_Yazarlar]
GO
USE [master]
GO
ALTER DATABASE [MVCKutuphane] SET  READ_WRITE 
GO

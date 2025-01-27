USE [CekilisOtomasyonuDb]
GO
/****** Object:  Table [dbo].[Cekilis]    Script Date: 11.01.2025 09:41:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cekilis](
	[CekilisID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[CekilisAdi] [nvarchar](max) NOT NULL,
	[OlusturmaTarihi] [datetime2](7) NOT NULL,
	[KazananSayisi] [int] NOT NULL,
	[YedekSayisi] [int] NOT NULL,
 CONSTRAINT [PK_Cekilis] PRIMARY KEY CLUSTERED 
(
	[CekilisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Katilimci]    Script Date: 11.01.2025 09:41:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Katilimci](
	[KatilimciID] [int] IDENTITY(1,1) NOT NULL,
	[CekilisID] [int] NOT NULL,
	[AdSoyad] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Katilimci] PRIMARY KEY CLUSTERED 
(
	[KatilimciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 11.01.2025 09:41:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Sifre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sonuc]    Script Date: 11.01.2025 09:41:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sonuc](
	[SonucID] [int] IDENTITY(1,1) NOT NULL,
	[CekilisID] [int] NOT NULL,
	[KatilimciID] [int] NOT NULL,
	[SonucTipi] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Sonuc] PRIMARY KEY CLUSTERED 
(
	[SonucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cekilis]  WITH CHECK ADD  CONSTRAINT [FK_Cekilis_Kullanici_KullaniciID] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cekilis] CHECK CONSTRAINT [FK_Cekilis_Kullanici_KullaniciID]
GO
ALTER TABLE [dbo].[Katilimci]  WITH CHECK ADD  CONSTRAINT [FK_Katilimci_Cekilis_CekilisID] FOREIGN KEY([CekilisID])
REFERENCES [dbo].[Cekilis] ([CekilisID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Katilimci] CHECK CONSTRAINT [FK_Katilimci_Cekilis_CekilisID]
GO
ALTER TABLE [dbo].[Sonuc]  WITH CHECK ADD  CONSTRAINT [FK_Sonuc_Cekilis_CekilisID] FOREIGN KEY([CekilisID])
REFERENCES [dbo].[Cekilis] ([CekilisID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sonuc] CHECK CONSTRAINT [FK_Sonuc_Cekilis_CekilisID]
GO
ALTER TABLE [dbo].[Sonuc]  WITH CHECK ADD  CONSTRAINT [FK_Sonuc_Katilimci_KatilimciID] FOREIGN KEY([KatilimciID])
REFERENCES [dbo].[Katilimci] ([KatilimciID])
GO
ALTER TABLE [dbo].[Sonuc] CHECK CONSTRAINT [FK_Sonuc_Katilimci_KatilimciID]
GO

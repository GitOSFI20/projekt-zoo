USE [master]
GO
/****** Object:  Database [Zoo]    Script Date: 04.04.2023 10:14:31 ******/
CREATE DATABASE [Zoo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zoo', FILENAME = N'C:\Users\treiniesyo\Zoo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Zoo_log', FILENAME = N'C:\Users\treiniesyo\Zoo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Zoo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zoo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Zoo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Zoo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Zoo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Zoo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Zoo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Zoo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Zoo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Zoo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Zoo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Zoo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Zoo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Zoo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Zoo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Zoo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Zoo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Zoo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Zoo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Zoo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Zoo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Zoo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Zoo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Zoo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Zoo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Zoo] SET  MULTI_USER 
GO
ALTER DATABASE [Zoo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Zoo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Zoo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Zoo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Zoo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Zoo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Zoo] SET QUERY_STORE = OFF
GO
USE [Zoo]
GO
/****** Object:  Table [dbo].[Abteilung]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abteilung](
	[Abt_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
 CONSTRAINT [PK_Abteilung] PRIMARY KEY CLUSTERED 
(
	[Abt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arbeitsgruppe]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arbeitsgruppe](
	[Taetigkeit_ID] [smallint] NOT NULL,
	[AbtNr] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
 CONSTRAINT [PK_Arbeitsgruppe] PRIMARY KEY CLUSTERED 
(
	[Taetigkeit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Art]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Art](
	[Tierart_ID] [smallint] NOT NULL,
	[Tierart] [nvarchar](255) NULL,
	[Klasse] [smallint] NULL,
 CONSTRAINT [PK_Art] PRIMARY KEY CLUSTERED 
(
	[Tierart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Behandlung]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Behandlung](
	[Behandlung_ID] [smallint] NOT NULL,
	[Diagnose] [nvarchar](255) NOT NULL,
	[Tier] [smallint] NULL,
 CONSTRAINT [PK_Behandlung] PRIMARY KEY CLUSTERED 
(
	[Behandlung_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Behandlung_Diagnose]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Behandlung_Diagnose](
	[BehandlungNr] [smallint] NOT NULL,
	[DiagnoseNr] [smallint] NOT NULL,
	[Diagnosedatum] [date] NOT NULL,
 CONSTRAINT [PK_Behandlung_Diagnose] PRIMARY KEY CLUSTERED 
(
	[BehandlungNr] ASC,
	[DiagnoseNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnose]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnose](
	[Diagnose_ID] [smallint] NOT NULL,
	[Beschreibung] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Diagnose] PRIMARY KEY CLUSTERED 
(
	[Diagnose_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Futter]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futter](
	[Futter_ID] [smallint] NOT NULL,
	[KategorieNr] [smallint] NULL,
	[Futter_Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Futter] PRIMARY KEY CLUSTERED 
(
	[Futter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Futterkategorie]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futterkategorie](
	[Kategorie_ID] [smallint] NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Futterkategorie] PRIMARY KEY CLUSTERED 
(
	[Kategorie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Futtermenge]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futtermenge](
	[Futter_Nr] [smallint] NOT NULL,
	[Rations_Nr] [smallint] NOT NULL,
	[Menge] [smallint] NULL,
 CONSTRAINT [PK_Futtermenge] PRIMARY KEY CLUSTERED 
(
	[Futter_Nr] ASC,
	[Rations_Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Futterration]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futterration](
	[Rations_ID] [smallint] NOT NULL,
	[Tiernummer] [smallint] NOT NULL,
	[Häufigkeit] [smallint] NULL,
 CONSTRAINT [PK_Futterration_1] PRIMARY KEY CLUSTERED 
(
	[Rations_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gehege]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gehege](
	[Gehege_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
	[Objekt_Nr] [smallint] NULL,
 CONSTRAINT [PK_Gehege] PRIMARY KEY CLUSTERED 
(
	[Gehege_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gehegebetreuung]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gehegebetreuung](
	[Pfleger_Nr] [smallint] NOT NULL,
	[Gehege_Nr] [smallint] NOT NULL,
 CONSTRAINT [PK_Gehegebetreuung] PRIMARY KEY CLUSTERED 
(
	[Pfleger_Nr] ASC,
	[Gehege_Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klasse]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klasse](
	[Klasse_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Klassenname] [nvarchar](255) NULL,
 CONSTRAINT [PK_Klasse] PRIMARY KEY CLUSTERED 
(
	[Klasse_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lager]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lager](
	[Lager_ID] [smallint] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Standort] [nvarchar](255) NULL,
 CONSTRAINT [PK_Lager] PRIMARY KEY CLUSTERED 
(
	[Lager_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lagerposition]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lagerposition](
	[Futter_Nr] [smallint] NOT NULL,
	[Lager_Nr] [smallint] NOT NULL,
	[Lagermenge] [int] NULL,
 CONSTRAINT [PK_Lagerposition] PRIMARY KEY CLUSTERED 
(
	[Futter_Nr] ASC,
	[Lager_Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mitarbeiter]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter](
	[MitArb_ID] [smallint] NOT NULL,
	[TaetigkeitNr] [smallint] NULL,
	[Name] [nvarchar](10) NULL,
	[Vorname] [nvarchar](10) NULL,
	[Strasse] [nvarchar](30) NULL,
	[PLZ] [nvarchar](255) NULL,
	[Ort] [nvarchar](255) NULL,
 CONSTRAINT [PK_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[MitArb_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObjektArt]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObjektArt](
	[Art_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
 CONSTRAINT [PK_ObjektArt] PRIMARY KEY CLUSTERED 
(
	[Art_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Objekte]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objekte](
	[Objekt_ID] [smallint] NOT NULL,
	[ArtNr] [smallint] NULL,
	[Bezeichnung] [nvarchar](255) NULL,
 CONSTRAINT [PK_Objekte] PRIMARY KEY CLUSTERED 
(
	[Objekt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal_Behandlung]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal_Behandlung](
	[BehandlungNr] [smallint] NOT NULL,
	[PersonalNr] [smallint] NOT NULL,
	[Behandlungstermin] [date] NULL,
 CONSTRAINT [PK_Personal_Behandlung] PRIMARY KEY CLUSTERED 
(
	[BehandlungNr] ASC,
	[PersonalNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal_Fuetterung]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal_Fuetterung](
	[FuetterungNr] [smallint] NOT NULL,
	[PersonalNr] [smallint] NOT NULL,
	[Fuetterungstermin] [date] NULL,
 CONSTRAINT [PK_Personal_Fuetterung] PRIMARY KEY CLUSTERED 
(
	[FuetterungNr] ASC,
	[PersonalNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiere]    Script Date: 04.04.2023 10:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiere](
	[TierNr] [smallint] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Bezeichnung] [nvarchar](255) NULL,
	[Art] [smallint] NULL,
	[Anzahl] [smallint] NULL,
	[Gehege_Nr] [smallint] NULL,
 CONSTRAINT [PK_Tiere] PRIMARY KEY CLUSTERED 
(
	[TierNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Abteilung] ([Abt_ID], [Bezeichnung]) VALUES (1, N'Tierpflege')
INSERT [dbo].[Abteilung] ([Abt_ID], [Bezeichnung]) VALUES (2, N'Verwaltung')
INSERT [dbo].[Abteilung] ([Abt_ID], [Bezeichnung]) VALUES (3, N'Handwerk')
GO
SET IDENTITY_INSERT [dbo].[Klasse] ON 
GO
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (1, N'Säugetiere')
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (2, N'Reptilien')
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (3, N'Vögel')
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (4, N'Fische')
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (5, N'Amphibien')
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (6, N'Wirbellose')
GO
SET IDENTITY_INSERT [dbo].[Klasse] OFF
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (1, N'Elefant', 1)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (2, N'Giraffe', 1)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (3, N'Affe', 1)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (4, N'Löwe', 1)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (5, N'Leopard', 1)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (6, N'Antilope', 1)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (7, N'Tapir', 1)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (8, N'Känguru', 1)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (9, N'Erdmännchen', 1)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (10, N'Tiger', 1)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (11, N'Krokodil', 2)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (12, N'Schildkröte', 2)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (13, N'Schlange', 2)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (14, N'Leguan', 2)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (15, N'Chamäleon', 2)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (16, N'Waran', 2)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (17, N'Ibis', 3)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (18, N'Kranich', 3)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (19, N'Papagei', 3)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (20, N'Flamingo', 3)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (21, N'Geier', 3)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (22, N'Wels', 4)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (23, N'Hai', 4)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (24, N'Barsch', 4)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (25, N'Frosch', 5)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (26, N'Kröte', 5)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (27, N'Ameise', 6)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (28, N'Krebs', 6)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (29, N'Seeigel', 6)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (30, N'Flusspferd', 1)
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (31, N'Nashorn', 1)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (1, N'Elefantentempel', 9)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (2, N'Savanne', 10)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (3, N'Affen-Käfig 1', 6)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (4, N'Affen-Käfig 2', 6)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (5, N'Affen-Käfig 3', 6)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (6, N'Affen-Käfig 4', 6)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (7, N'Löwen-Käfig', 7)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (8, N'Leoparden-Käfig', 7)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (9, N'Tiger-Käfig', 7)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (10, N'Erdmännchenbau', 10)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (11, N'Schildkröten-Wiese', 10)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (12, N'Terrarium 1', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (13, N'Terrarium 2', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (14, N'Terrarium 3', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (15, N'Terrarium 4', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (16, N'Terrarium 5', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (17, N'Terrarium 6', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (18, N'Terrarium 7', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (19, N'Terrarium 8', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (20, N'Terrarium 9', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (21, N'Terrarium 10', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (22, N'Terrarium 11', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (23, N'Terrarium 12', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (24, N'Volliere 1', 11)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (25, N'Volliere 2', 11)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (26, N'Volliere 3', 11)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (27, N'Volliere 4', 11)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (28, N'Flamingoteich', 11)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (29, N'Aquarium 1', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (30, N'Aquarium 2', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (31, N'Aquarium 3', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (32, N'Aquarium 4', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (33, N'Aquarium 5', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (34, N'Vitrine 1', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (35, N'Vitrine 2', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (36, N'Vitrine 3', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (37, N'Ameisenbau', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (38, N'Aquarium 6', 8)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (39, N'Flusspferd-Park', 9)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (40, N'Nashorn-Anlage', 9)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (1, N'Jumbo', N'Asiatischer Elefant', 1, 1, 1)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (2, N'Theo', N'Asiatischer Elefant', 1, 1, 1)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (3, N'Elli', N'Asiatischer Elefant', 1, 1, 1)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (4, N'Anna', N'Rothschildgiraffe', 2, 1, 2)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (5, N'Bella', N'Rothschildgiraffe', 2, 1, 2)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (6, N'Micha', N'Rothschildgiraffe', 2, 1, 2)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (7, N'Hans', N'Westafrikanischer Schimpanse', 3, 1, 3)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (8, N'Bea', N'Westafrikanischer Schimpanse', 3, 1, 3)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (9, N'Adana', N'Sumatra-Orang-Utan', 3, 1, 4)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (10, N'Baba', N'Sumatra-Orang-Utan', 3, 1, 4)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (11, N'Gila', N'Bonobo', 3, 1, 4)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (12, N'Rago', N'Westlicher Flachlandgorilla', 3, 1, 5)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (13, N'Ramona', N'Westlicher Flachlandgorilla', 3, 1, 5)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (14, N'Lea', N'Afrikanischer Löwe', 4, 1, 7)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (15, N'Max', N'Afrikanischer Löwe', 4, 1, 7)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (16, N'Jörg', N'Afrikanischer Löwe', 4, 1, 7)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (17, N'Rambo', N'Amurleopard', 5, 1, 8)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (18, N'Edona', N'Schneeleopard', 5, 1, 8)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (19, NULL, N'Säbelantilope', 6, 12, 2)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (20, NULL, N'Schabrackentapir', 7, 5, 2)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (21, NULL, N'Rotes Riesenkänguru', 8, 7, 2)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (22, NULL, N'Erdmännchen', 9, 23, 10)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (23, N'Tacko', N'Amurtiger', 10, 1, 9)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (24, N'Ofra', N'Amurtiger', 10, 1, 9)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (25, N'Venus', N'Amurtiger', 10, 1, 9)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (26, NULL, N'Stumpfkrokodil', 11, 2, 14)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (27, NULL, N'Brauen-Glattstirnkaiman', 11, 3, 15)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (28, NULL, N'Sunda-Gavial', 11, 2, 16)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (29, NULL, N'Strahlenschildkröte', 12, 3, 12)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (30, NULL, N'Braune Landschildkröte', 12, 2, 11)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (31, NULL, N'Roti Schlangenhals-Schildkröte', 12, 4, 13)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (32, NULL, N'Spaltenschildkröte', 12, 5, 11)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (33, NULL, N'Tempelschildkröte', 12, 4, 12)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (34, NULL, N'Ringhalskobra', 13, 2, 17)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (35, NULL, N'Kupferkopf', 13, 2, 18)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (36, NULL, N'Mangroven-Nachtbaumnatter', 13, 4, 18)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (37, N'Vampy', N'Gelbe Anakonda', 13, 1, 19)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (38, NULL, N'Grüner Leguan', 14, 5, 20)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (39, NULL, N'Großer Madagaskarleguan', 14, 2, 21)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (40, N'Farbenfroh', N'Jemenchamäleon', 15, 1, 22)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (41, N'Faruk', N'Blauer Felsenleguan', 14, 1, 20)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (42, NULL, N'Komodowaran', 16, 2, 23)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (43, NULL, N'Sepikwaran', 16, 3, 23)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (44, NULL, N'Schwarzkopfibis', 17, 8, 24)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (45, NULL, N'Schwarzzügelibis', 17, 6, 24)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (46, NULL, N'Mandschurenkranich', 18, 15, 25)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (47, NULL, N'Kea', 19, 4, 26)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (48, NULL, N'Kleiner Soldatenara', 19, 3, 26)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (49, NULL, N'Roter Flamingo', 20, 30, 28)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (50, NULL, N'Gänsegeier', 21, 6, 27)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (51, NULL, N'Weißnackenkranich', 18, 10, 25)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (52, NULL, N'Zwergflamingo', 20, 15, 28)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (53, NULL, N'Allfarbgebirgslori', 19, 2, 26)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (54, NULL, N'Chileflamingo', 20, 10, 28)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (55, NULL, N'Grauer Kronenkranich', 18, 5, 25)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (56, N'Jack', N'Hyazinthara', 19, 1, 26)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (57, NULL, N'Königsgeier', 21, 4, 27)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (58, NULL, N'Glotzaugenbarsch', 24, 5, 29)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (59, NULL, N'Braungebänderter Bambushai', 23, 2, 30)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (60, NULL, N'Tigerspatelwels', 22, 6, 31)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (61, NULL, N'Rotflossen-Antennenwels', 22, 5, 31)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (62, NULL, N'Riesenhaiwels', 22, 1, 32)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (63, NULL, N'Schwarzspitzen-Riffhai', 23, 3, 30)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (64, NULL, N'Gelbflossen-Zackenbarsch', 24, 5, 29)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (65, NULL, N'Azurblauer Pfeilgiftfrosch', 25, 3, 34)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (66, NULL, N'Moosfrosch', 25, 4, 35)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (67, NULL, N'Präriekröte', 26, 5, 36)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (68, NULL, N'Blattschneideameise', 27, NULL, 37)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (69, NULL, N'Diademseeigel', 29, 10, 33)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (70, NULL, N'Mangroven-Pfeilschwanzkrebs', 28, 8, 38)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (71, NULL, N'Silberäffchen', 3, 6, 6)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (72, NULL, N'Gewöhnlicher Totenkopfaffe', 3, 13, 6)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (73, NULL, N'Mantelpavian', 3, 5, 3)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (74, NULL, N'Weißbauch-Zwergseidenäffchen', 3, 4, 6)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (75, NULL, N'Bartaffe', 3, 5, 6)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (76, NULL, N'Zwergflusspferd', 30, 5, 39)
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (77, NULL, N'Ostafrikanisches Spitzmaulnashorn', 31, 4, 40)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (1, 27)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (3, 2)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (4, 1)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (5, 1)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (7, 5)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (7, 6)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (8, 12)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (8, 13)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (10, 5)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (10, 6)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (12, 2)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (13, 2)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (14, 12)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (14, 13)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (15, 10)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (15, 11)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (16, 3)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (16, 4)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (18, 7)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (18, 8)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (18, 9)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (20, 10)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (20, 11)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (21, 3)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (21, 4)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (23, 7)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (23, 8)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (23, 9)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (24, 33)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (24, 38)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (25, 24)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (25, 25)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (26, 30)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (26, 32)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (28, 29)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (28, 31)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (29, 29)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (29, 31)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (30, 28)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (32, 28)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (33, 27)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (35, 26)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (36, 34)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (36, 35)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (36, 36)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (36, 37)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (38, 14)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (39, 24)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (39, 25)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (41, 30)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (41, 32)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (45, 23)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (51, 20)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (51, 21)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (51, 22)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (54, 20)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (54, 21)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (54, 22)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (56, 17)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (56, 18)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (56, 19)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (58, 17)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (58, 18)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (58, 19)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (60, 39)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (60, 40)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (63, 16)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (67, 15)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (69, 39)
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (69, 40)
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (1, 1, N'Tierpfleger')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (2, 1, N'Tierarzt')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (3, 2, N'Ökonom')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (4, 2, N'Wachmann')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (5, 2, N'kaufm. Angestellte')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (6, 2, N'Sekretärin')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (7, 2, N'Animator')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (8, 3, N'Gärtner')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (9, 3, N'Trockenbauer')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (10, 3, N'Lagerist')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (11, 3, N'Elektriker')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (12, 3, N'Reinigungskraft')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (13, 3, N'Klemptner')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (14, 3, N'Maurer')
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (15, 1, N'Futterkoch')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (1, 1, N'Schwarz', N'Heinz', N'Anaberger Str. 22', N'01139', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (2, 8, N'Schädlich', N'Herbert', N'Plempengasse 25', N'01445', N'Radebeul')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (3, 1, N'Langer', N'Fritz', N'Gablenzer Str. 12', N'01796', N'Pirna')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (4, 1, N'Pollack', N'Wilfried', N'Mühlenstr. 25 b', N'01809', N'Heidenau')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (5, 1, N'Hebel', N'Fritz', N'Waldweg 1', N'01454', N'Radeberg')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (6, 3, N'Kaiser', N'August', N'Südring 98', N'01189', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (7, 1, N'Schneider', N'Gerda', N'Bergstr. 54', N'01796', N'Pirna')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (8, 1, N'Glöckner', N'Manfred', N'Schneeberger Str. 98', N'01705', N'Freital')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (9, 4, N'Mielke', N'Erich', N'Trabantweg 3', N'01139', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (10, 1, N'Meister', N'Udo', N'Berghotelweg 1', N'01825', N'Liebstadt')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (11, 2, N'Schüttele', N'Detlef', N'Südhang 16', N'01217', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (12, 1, N'Diener', N'Minna', N'Hauptstr. 2', N'01796', N'Graupa')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (13, 1, N'Schmidt', N'Tommi', N'Schustergasse 16', N'01640', N'Coswig')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (14, 1, N'Seiten', N'Olivia', N'Bürgerplatz 12', N'09599', N'Freiberg')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (15, 1, N'Weiß', N'Rudolph', N'Stollberger Str. 168', N'01465', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (16, 1, N'Meier', N'Paul', N'Grüner Hang 3', N'01465', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (17, 4, N'Schimanski', N'Horst', N'Spitzelweg 3', N'01307', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (18, 1, N'Pfennig', N'Emil', N'Rosentalstr. 18', N'01139', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (19, 3, N'Spar', N'Gustav', N'Damaschkestr. 34', N'01307', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (20, 1, N'Gebemir', N'Gerd', N'Waldweg 123', N'01307', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (21, 1, N'Suppe', N'Paula', N'Wasserweg 41', N'01809', N'Heidenau')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (22, 5, N'Reich', N'Silvia', N'Dorfstr. 34', N'01809', N'Dohna')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (23, 1, N'Wächter', N'Torsten', N'Hauptstr. 4', N'01796', N'Pirna')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (24, 1, N'Schliesser', N'Gabi', N'Rathausplatz 4', N'01728', N'Bannewitz')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (25, 1, N'Helm', N'Michael', N'Brückenweg 23', N'01328', N'Weißig')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (26, 1, N'Bocuse', N'Paul', N'Annenstr. 45', N'01217', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (27, 2, N'Krug', N'Manfred', N'Hauptstr. 5', N'01662', N'Meißen')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (28, 1, N'Schnecke', N'Rita', N'Hauptstr.67', N'01445', N'Radebeul')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (29, 1, N'Müller', N'Peter', N'Bernsdorfer Str. 16', N'01640', N'Coswig')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (30, 1, N'Hänker', N'Fritz', N'Am Stadion 1', N'09599', N'Freiberg')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (31, 6, N'Müller', N'Anita', N'Pirnaer Str. 3', N'01809', N'Heidenau')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (32, 1, N'König', N'Friedrich', N'Kohlegasse 5', N'01328', N'Weißig')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (33, 1, N'Kabel', N'Michael', N'Wiesenweg 8 f', N'01468', N'Moritzburg')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (34, 9, N'Franke', N'Ulli', N'Malergasse 17', N'01445', N'Radebeul')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (35, 1, N'Müller', N'Jens', N'Ammernstr. 1', N'01662', N'Meißen')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (36, 1, N'Meier', N'Olaf', N'Fischweg 12', N'01468', N'Moritzburg')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (37, 8, N'Waalkes', N'Otto', N'Friesengasse 11', N'01189', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (38, 1, N'Zange', N'Wolfgang', N'Stadtring 88', N'01809', N'Heidenau')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (39, 1, N'Grube', N'Klaire', N'Großenhainer Str. 5', N'01097', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (40, 10, N'Tisch', N'Lothar', N'Am Brühl 13 a', N'01217', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (41, 1, N'Bringe', N'Konrad', N'Brauerweg 25 c', N'01796', N'Pirna')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (42, 11, N'Schmidt', N'Thomas', N'Großenhainer Str. 37', N'01097', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (43, 15, N'Koch', N'Jens', N'Bergstr. 6', N'01796', N'Graupa')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (44, 12, N'Dittrich', N'Andrea', N'Hauptstraße 25', N'01723', N'Mohorn')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (45, 1, N'Brinkmann', N'Diana', N'Am Flugplatz 9', N'01465', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (46, 5, N'Schnelle', N'Linda', N'Am Marktplatz 4', N'01705', N'Freital')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (47, 8, N'Hauptmann', N'Rolf', N'Bachstraße 25 a', N'01796', N'Pirna')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (48, 7, N'Wünsche', N'Silvia', N'Am Gartenheim 5', N'01561', N'Großenhain')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (49, 10, N'Haueisen', N'Egon', N' Bärenweg 4', N'01689', N'Weinböhla')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (50, 7, N'Gottschalk', N'Thomas', N'Am Markt 1', N'01169', N'Cossebaude')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (51, 1, N'Angermann', N'Gerd', N'Kirchgasse 2', N'01454', N'Großerkmannsdorf')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (52, 6, N'Klingel', N'Frieda', N'Postweg 16 c', N'01307', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (53, 5, N'Baldauf', N'Anja', N'Querweg 123', N'01796', N'Pirna')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (54, 1, N'Diettrich', N'Ulf', N'Wartburgstraße 78', N'01454', N'Radeberg')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (55, 12, N'Meier', N'Ramona', N'Schießgasse 4', N'01445', N'Radebeul')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (56, 1, N'Jäckel', N'Bernd', N'Hauptstrasse 3', N'01561', N'Großenhain')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (57, 13, N'Riegel', N'Leopold', N'Textilweg 24', N'01169', N'Cossebaude')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (58, 1, N'Glaube', N'Rudolph', N'Wiesenweg 16', N'01809', N'Heidenau')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (59, 8, N'Hausmann', N'Marga', N'Am Schloßberg 3', N'01825', N'Liebstadt')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (60, 1, N'Sauger', N'Steffen', N'Gärtnereiweg 8', N'01471', N'Radeburg')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (61, 12, N'Weiss', N'Katja', N'Forstweg 16 a', N'01689', N'Weinböhla')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (62, 14, N'Streßmann', N'Emil', N'Schwarzastraße 16', N'01640', N'Coswig')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (63, 1, N'Wünschmann', N'Holger', N'Andreasstr. 15', N'01465', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (64, 12, N'Koechel', N'Siegfried', N'Dorfstr. 85', N'01728', N'Bannewitz')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (65, 3, N'Prüfer', N'Ullrich', N'Dorfweg 76', N'01454', N'Großerkmannsdorf')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (66, 15, N'Drummer', N'Kurt', N'Rosenhof 234', N'01217', N'Dresden')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (67, 1, N'Pils', N'Michael', N'Am Anger 10', N'01796', N'Graupa')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (68, 8, N'Sauber', N'Manfred', N'Zolastr. 46', N'01796', N'Pirna')
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (69, 1, N'Bertold', N'Jürgen', N'Hauptstr. 26 d', N'01454', N'Radeberg')
GO
INSERT [dbo].[ObjektArt] ([Art_ID], [Bezeichnung]) VALUES (1, N'Gebäude')
INSERT [dbo].[ObjektArt] ([Art_ID], [Bezeichnung]) VALUES (2, N'Freigelände')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (1, 1, N'Verwaltungsgebäude')
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (2, 1, N'Eingangsgebäude')
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (3, 1, N'Lager')
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (4, 1, N'Futterküche')
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (5, 1, N'Werkstatt')
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (6, 1, N'Affenhaus')
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (7, 1, N'Raubtierhaus')
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (8, 1, N' Aquaterrium')
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (9, 2, N'Areal 1')
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (10, 2, N'Areal 2')
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (11, 2, N'Areal 3')
GO
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (1, N'Frischfleisch')
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (2, N'Pflanzen')
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (3, N'Früchte')
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (4, N'Fisch')
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (5, N'Insekten')
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (6, N'Trockenfutter')
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (7, N'Lebende Nahrung')
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (8, N'Aufbaufutter')
GO
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (1, N'Schwein', 1)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (2, N'Rind', 1)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (3, N'Blätter', 2)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (4, N'Kräuter', 2)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (5, N'Gräßer', 2)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (6, N'Pilze', 2)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (7, N'Melonen', 3)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (8, N'Bananen', 3)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (9, N'Äpfel', 3)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (10, N'Orangen', 3)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (11, N'Hering', 4)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (12, N'kleine Wassertiere', 4)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (13, N'Krebse', 4)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (14, N'Spinnen', 5)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (15, N'Würmer', 5)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (16, N'Ameisen', 5)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (17, N'Raupen', 5)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (18, N'Heuschrecken', 5)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (19, N'Körner', 6)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (20, N'Samen', 6)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (21, N'Nüsse', 6)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (22, N'Kaninchen', 7)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (23, N'Mäuse', 7)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (24, N'Vögel', 7)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (25, N'Vitamine', 8)
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [KategorieNr]) VALUES (26, N'Mineralien', 8)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 17, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 18, 2500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 19, 1800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 20, 1500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 21, 1500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 27, 3000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 28, 2500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 29, 3200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 48, 4000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 57, 600)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 58, 800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 1, 3000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 3, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 5, 2500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 7, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 8, 1500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 9, 2500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 22, 4000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 23, 3000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 25, 6000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 33, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 34, 250)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 36, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 43, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 44, 250)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 45, 150)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 46, 100)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 52, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 59, 800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 63, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 78, 9)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 81, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 83, 200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 86, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 87, 3000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 2, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 4, 1500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 6, 1700)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 10, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 11, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 12, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 13, 600)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 14, 800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 15, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 16, 550)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 24, 3500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 33, 200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 34, 190)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 37, 340)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 61, 30)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 64, 100)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 80, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 81, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 83, 600)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 84, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 85, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 86, 2200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 30, 1500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 31, 800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 32, 750)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 35, 280)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 41, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 62, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 68, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 69, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 70, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 71, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 72, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 73, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 74, 200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 79, 6)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 26, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 45, 150)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 49, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 50, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 51, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 52, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 53, 50)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 56, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 59, 1600)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 60, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 63, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 75, 15)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 76, 16)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 77, 17)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 82, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 23, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 36, 50)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 43, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 44, 200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 46, 60)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 53, 100)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 54, 100)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 61, 20)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 65, 30)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 67, 20)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 83, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 85, 250)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 31, 1460)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 38, 750)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 39, 530)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 40, 480)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 42, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 48, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 66, 800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 11, 50)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 14, 30)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 16, 40)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 47, 30)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 55, 20)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 65, 20)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 72, 50)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (1, 1, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (2, 1, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (3, 2, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (4, 2, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (5, 3, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (6, 3, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (7, 4, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (8, 5, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (9, 6, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (10, 7, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (11, 8, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (12, 9, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (13, 10, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (14, 11, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (15, 12, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (16, 13, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (17, 14, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (18, 15, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (19, 16, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (20, 17, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (21, 18, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (22, 19, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (23, 20, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (24, 20, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (25, 21, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (26, 22, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (27, 23, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (28, 24, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (29, 25, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (30, 26, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (31, 27, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (32, 28, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (33, 29, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (34, 30, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (35, 31, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (36, 32, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (37, 33, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (38, 34, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (39, 35, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (40, 36, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (41, 37, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (42, 37, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (43, 38, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (44, 39, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (45, 40, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (46, 41, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (47, 41, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (48, 42, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (49, 43, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (50, 44, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (51, 45, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (52, 46, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (53, 47, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (54, 48, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (55, 48, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (56, 49, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (57, 50, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (58, 50, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (59, 51, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (60, 52, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (61, 53, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (62, 54, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (63, 55, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (64, 56, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (65, 56, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (66, 57, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (67, 58, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (68, 59, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (69, 60, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (70, 61, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (71, 62, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (72, 62, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (73, 63, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (74, 64, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (75, 65, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (76, 66, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (77, 67, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (78, 68, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (79, 70, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (80, 71, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (81, 72, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (82, 72, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (83, 73, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (84, 74, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (85, 75, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (86, 76, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (87, 77, 2)
GO
ALTER TABLE [dbo].[Arbeitsgruppe]  WITH CHECK ADD  CONSTRAINT [FK_Arbeitsgruppe_Abteilung] FOREIGN KEY([AbtNr])
REFERENCES [dbo].[Abteilung] ([Abt_ID])
GO
ALTER TABLE [dbo].[Arbeitsgruppe] CHECK CONSTRAINT [FK_Arbeitsgruppe_Abteilung]
GO
ALTER TABLE [dbo].[Art]  WITH CHECK ADD  CONSTRAINT [FK_Art_Klasse] FOREIGN KEY([Klasse])
REFERENCES [dbo].[Klasse] ([Klasse_ID])
GO
ALTER TABLE [dbo].[Art] CHECK CONSTRAINT [FK_Art_Klasse]
GO
ALTER TABLE [dbo].[Behandlung]  WITH CHECK ADD  CONSTRAINT [FK_Behandlung_Tiere] FOREIGN KEY([Tier])
REFERENCES [dbo].[Tiere] ([TierNr])
GO
ALTER TABLE [dbo].[Behandlung] CHECK CONSTRAINT [FK_Behandlung_Tiere]
GO
ALTER TABLE [dbo].[Behandlung_Diagnose]  WITH CHECK ADD  CONSTRAINT [FK_Behandlung_Diagnose_Behandlung] FOREIGN KEY([BehandlungNr])
REFERENCES [dbo].[Behandlung] ([Behandlung_ID])
GO
ALTER TABLE [dbo].[Behandlung_Diagnose] CHECK CONSTRAINT [FK_Behandlung_Diagnose_Behandlung]
GO
ALTER TABLE [dbo].[Behandlung_Diagnose]  WITH CHECK ADD  CONSTRAINT [FK_Behandlung_Diagnose_Diagnose] FOREIGN KEY([DiagnoseNr])
REFERENCES [dbo].[Diagnose] ([Diagnose_ID])
GO
ALTER TABLE [dbo].[Behandlung_Diagnose] CHECK CONSTRAINT [FK_Behandlung_Diagnose_Diagnose]
GO
ALTER TABLE [dbo].[Futter]  WITH CHECK ADD  CONSTRAINT [FK_Futter_Futterkategorie] FOREIGN KEY([KategorieNr])
REFERENCES [dbo].[Futterkategorie] ([Kategorie_ID])
GO
ALTER TABLE [dbo].[Futter] CHECK CONSTRAINT [FK_Futter_Futterkategorie]
GO
ALTER TABLE [dbo].[Futtermenge]  WITH CHECK ADD  CONSTRAINT [FK_Futtermenge_Futter] FOREIGN KEY([Futter_Nr])
REFERENCES [dbo].[Futter] ([Futter_ID])
GO
ALTER TABLE [dbo].[Futtermenge] CHECK CONSTRAINT [FK_Futtermenge_Futter]
GO
ALTER TABLE [dbo].[Futtermenge]  WITH CHECK ADD  CONSTRAINT [FK_Futtermenge_Futterration] FOREIGN KEY([Rations_Nr])
REFERENCES [dbo].[Futterration] ([Rations_ID])
GO
ALTER TABLE [dbo].[Futtermenge] CHECK CONSTRAINT [FK_Futtermenge_Futterration]
GO
ALTER TABLE [dbo].[Futterration]  WITH CHECK ADD  CONSTRAINT [FK_Futterration_Tiere] FOREIGN KEY([Tiernummer])
REFERENCES [dbo].[Tiere] ([TierNr])
GO
ALTER TABLE [dbo].[Futterration] CHECK CONSTRAINT [FK_Futterration_Tiere]
GO
ALTER TABLE [dbo].[Gehege]  WITH CHECK ADD  CONSTRAINT [FK_Gehege_Objekte] FOREIGN KEY([Objekt_Nr])
REFERENCES [dbo].[Objekte] ([Objekt_ID])
GO
ALTER TABLE [dbo].[Gehege] CHECK CONSTRAINT [FK_Gehege_Objekte]
GO
ALTER TABLE [dbo].[Gehegebetreuung]  WITH CHECK ADD  CONSTRAINT [FK_Gehegebetreuung_Gehege] FOREIGN KEY([Gehege_Nr])
REFERENCES [dbo].[Gehege] ([Gehege_ID])
GO
ALTER TABLE [dbo].[Gehegebetreuung] CHECK CONSTRAINT [FK_Gehegebetreuung_Gehege]
GO
ALTER TABLE [dbo].[Gehegebetreuung]  WITH CHECK ADD  CONSTRAINT [FK_Gehegebetreuung_Mitarbeiter] FOREIGN KEY([Pfleger_Nr])
REFERENCES [dbo].[Mitarbeiter] ([MitArb_ID])
GO
ALTER TABLE [dbo].[Gehegebetreuung] CHECK CONSTRAINT [FK_Gehegebetreuung_Mitarbeiter]
GO
ALTER TABLE [dbo].[Lagerposition]  WITH CHECK ADD  CONSTRAINT [FK_Lagerposition_Futter] FOREIGN KEY([Futter_Nr])
REFERENCES [dbo].[Futter] ([Futter_ID])
GO
ALTER TABLE [dbo].[Lagerposition] CHECK CONSTRAINT [FK_Lagerposition_Futter]
GO
ALTER TABLE [dbo].[Lagerposition]  WITH CHECK ADD  CONSTRAINT [FK_Lagerposition_Lager] FOREIGN KEY([Lager_Nr])
REFERENCES [dbo].[Lager] ([Lager_ID])
GO
ALTER TABLE [dbo].[Lagerposition] CHECK CONSTRAINT [FK_Lagerposition_Lager]
GO
ALTER TABLE [dbo].[Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [FK_Mitarbeiter_Arbeitsgruppe] FOREIGN KEY([TaetigkeitNr])
REFERENCES [dbo].[Arbeitsgruppe] ([Taetigkeit_ID])
GO
ALTER TABLE [dbo].[Mitarbeiter] CHECK CONSTRAINT [FK_Mitarbeiter_Arbeitsgruppe]
GO
ALTER TABLE [dbo].[Objekte]  WITH CHECK ADD  CONSTRAINT [FK_Objekte_ObjektArt] FOREIGN KEY([ArtNr])
REFERENCES [dbo].[ObjektArt] ([Art_ID])
GO
ALTER TABLE [dbo].[Objekte] CHECK CONSTRAINT [FK_Objekte_ObjektArt]
GO
ALTER TABLE [dbo].[Personal_Behandlung]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Behandlung_Behandlung] FOREIGN KEY([BehandlungNr])
REFERENCES [dbo].[Behandlung] ([Behandlung_ID])
GO
ALTER TABLE [dbo].[Personal_Behandlung] CHECK CONSTRAINT [FK_Personal_Behandlung_Behandlung]
GO
ALTER TABLE [dbo].[Personal_Behandlung]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Behandlung_Mitarbeiter] FOREIGN KEY([PersonalNr])
REFERENCES [dbo].[Mitarbeiter] ([MitArb_ID])
GO
ALTER TABLE [dbo].[Personal_Behandlung] CHECK CONSTRAINT [FK_Personal_Behandlung_Mitarbeiter]
GO
ALTER TABLE [dbo].[Personal_Fuetterung]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Fuetterung_Futterration] FOREIGN KEY([FuetterungNr])
REFERENCES [dbo].[Futterration] ([Rations_ID])
GO
ALTER TABLE [dbo].[Personal_Fuetterung] CHECK CONSTRAINT [FK_Personal_Fuetterung_Futterration]
GO
ALTER TABLE [dbo].[Personal_Fuetterung]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Fuetterung_Mitarbeiter] FOREIGN KEY([PersonalNr])
REFERENCES [dbo].[Mitarbeiter] ([MitArb_ID])
GO
ALTER TABLE [dbo].[Personal_Fuetterung] CHECK CONSTRAINT [FK_Personal_Fuetterung_Mitarbeiter]
GO
ALTER TABLE [dbo].[Tiere]  WITH CHECK ADD  CONSTRAINT [FK_Tiere_Art] FOREIGN KEY([Art])
REFERENCES [dbo].[Art] ([Tierart_ID])
GO
ALTER TABLE [dbo].[Tiere] CHECK CONSTRAINT [FK_Tiere_Art]
GO
ALTER TABLE [dbo].[Tiere]  WITH CHECK ADD  CONSTRAINT [FK_Tiere_Gehege] FOREIGN KEY([Gehege_Nr])
REFERENCES [dbo].[Gehege] ([Gehege_ID])
GO
ALTER TABLE [dbo].[Tiere] CHECK CONSTRAINT [FK_Tiere_Gehege]
GO
USE [master]
GO
ALTER DATABASE [Zoo] SET  READ_WRITE 
GO

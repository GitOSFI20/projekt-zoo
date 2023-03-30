USE [master]
GO
/****** Object:  Database [Zoo]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Abteilung]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Art]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Behandlung]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Behandlung_Diagnose]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Diagnose]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Futter]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Futterkategorie]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Futtermenge]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Futterration]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Gehege]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Gehegebetreuung]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Klasse]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Lager]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Lagerposition]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Mitarbeiter]    Script Date: 30.03.2023 08:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter](
	[MitArb_ID] [smallint] NOT NULL,
	[Abt_NR] [smallint] NULL,
	[Name] [nvarchar](10) NULL,
	[Vorname] [nvarchar](10) NULL,
	[Strasse] [nvarchar](30) NULL,
	[PLZ] [nvarchar](255) NULL,
	[Ort] [nvarchar](255) NULL,
	[Taetigkeit] [nvarchar](255) NULL,
 CONSTRAINT [PK_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[MitArb_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Objekte]    Script Date: 30.03.2023 08:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objekte](
	[Objekt_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
	[Objekt_Art] [nvarchar](255) NULL,
 CONSTRAINT [PK_Objekte] PRIMARY KEY CLUSTERED 
(
	[Objekt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal_Behandlung]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Personal_Fuetterung]    Script Date: 30.03.2023 08:40:26 ******/
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
/****** Object:  Table [dbo].[Tiere]    Script Date: 30.03.2023 08:40:26 ******/
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
ALTER TABLE [dbo].[Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [FK_Mitarbeiter_Abteilung] FOREIGN KEY([Abt_NR])
REFERENCES [dbo].[Abteilung] ([Abt_ID])
GO
ALTER TABLE [dbo].[Mitarbeiter] CHECK CONSTRAINT [FK_Mitarbeiter_Abteilung]
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

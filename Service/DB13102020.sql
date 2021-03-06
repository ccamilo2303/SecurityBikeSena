USE [master]
GO
/****** Object:  Database [bikerfinder]    Script Date: 13/10/2020 09:49:12 p. m. ******/
CREATE DATABASE [bikerfinder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bikerfinder_Data', FILENAME = N'c:\dzsqls\bikerfinder.mdf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 LOG ON 
( NAME = N'bikerfinder_Logs', FILENAME = N'c:\dzsqls\bikerfinder.ldf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bikerfinder] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bikerfinder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bikerfinder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bikerfinder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bikerfinder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bikerfinder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bikerfinder] SET ARITHABORT OFF 
GO
ALTER DATABASE [bikerfinder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bikerfinder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bikerfinder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bikerfinder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bikerfinder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bikerfinder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bikerfinder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bikerfinder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bikerfinder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bikerfinder] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bikerfinder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bikerfinder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bikerfinder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bikerfinder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bikerfinder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bikerfinder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bikerfinder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bikerfinder] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bikerfinder] SET  MULTI_USER 
GO
ALTER DATABASE [bikerfinder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bikerfinder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bikerfinder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bikerfinder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bikerfinder] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bikerfinder] SET QUERY_STORE = OFF
GO
USE [bikerfinder]
GO
/****** Object:  User [ccamilo2303_SQLLogin_1]    Script Date: 13/10/2020 09:49:15 p. m. ******/
CREATE USER [ccamilo2303_SQLLogin_1] FOR LOGIN [ccamilo2303_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ccamilo2303_SQLLogin_1]
GO
/****** Object:  Schema [ccamilo2303_SQLLogin_1]    Script Date: 13/10/2020 09:49:16 p. m. ******/
CREATE SCHEMA [ccamilo2303_SQLLogin_1]
GO
/****** Object:  Table [dbo].[Bicicleta]    Script Date: 13/10/2020 09:49:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bicicleta](
	[ID_Bicicleta] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [varchar](20) NOT NULL,
	[Referencia] [varchar](20) NOT NULL,
	[Color] [varchar](20) NOT NULL,
	[Foto] [varchar](max) NULL,
 CONSTRAINT [PK_Bicicleta] PRIMARY KEY CLUSTERED 
(
	[ID_Bicicleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPS]    Script Date: 13/10/2020 09:49:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPS](
	[ID_gps] [int] IDENTITY(1,1) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_GPS] PRIMARY KEY CLUSTERED 
(
	[ID_gps] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_GPS_Bicicleta]    Script Date: 13/10/2020 09:49:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_GPS_Bicicleta](
	[ID_Usuario] [int] NOT NULL,
	[ID_gps] [int] NOT NULL,
	[ID_Bicicleta] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_GPS_Bicicleta] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC,
	[ID_gps] ASC,
	[ID_Bicicleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/10/2020 09:49:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Celular] [numeric](10, 0) NOT NULL,
	[Clave] [varchar](20) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bicicleta] ON 

INSERT [dbo].[Bicicleta] ([ID_Bicicleta], [Marca], [Referencia], [Color], [Foto]) VALUES (1, N'GW', N'Jackal', N'Negro - Rojo', N'')
INSERT [dbo].[Bicicleta] ([ID_Bicicleta], [Marca], [Referencia], [Color], [Foto]) VALUES (2, N'GW', N'Jackal', N'Negro - Rojo', N'')
INSERT [dbo].[Bicicleta] ([ID_Bicicleta], [Marca], [Referencia], [Color], [Foto]) VALUES (3, N'GW', N'Jackal', N'Negro - Rojo', N'')
INSERT [dbo].[Bicicleta] ([ID_Bicicleta], [Marca], [Referencia], [Color], [Foto]) VALUES (4, N'GW', N'Jackal', N'Negro - Rojo', N'')
INSERT [dbo].[Bicicleta] ([ID_Bicicleta], [Marca], [Referencia], [Color], [Foto]) VALUES (5, N'GW', N'Jackal', N'Negro - Rojo', N'')
INSERT [dbo].[Bicicleta] ([ID_Bicicleta], [Marca], [Referencia], [Color], [Foto]) VALUES (6, N'GW', N'Jackal', N'Negro - Rojo', N'')
INSERT [dbo].[Bicicleta] ([ID_Bicicleta], [Marca], [Referencia], [Color], [Foto]) VALUES (7, N'Gw', N'Jackal', N'Negro rojo', N'')
INSERT [dbo].[Bicicleta] ([ID_Bicicleta], [Marca], [Referencia], [Color], [Foto]) VALUES (8, N'Gw', N'Jackal', N'Negro rojo', N'')
INSERT [dbo].[Bicicleta] ([ID_Bicicleta], [Marca], [Referencia], [Color], [Foto]) VALUES (9, N'Hdjs', N'Jdjdj', N'Zhjsjs', N'')
SET IDENTITY_INSERT [dbo].[Bicicleta] OFF
SET IDENTITY_INSERT [dbo].[GPS] ON 

INSERT [dbo].[GPS] ([ID_gps], [FechaRegistro]) VALUES (1, CAST(N'2020-10-09T19:40:47.497' AS DateTime))
INSERT [dbo].[GPS] ([ID_gps], [FechaRegistro]) VALUES (2, CAST(N'2020-10-09T20:05:56.737' AS DateTime))
INSERT [dbo].[GPS] ([ID_gps], [FechaRegistro]) VALUES (3, CAST(N'2020-10-09T20:06:00.407' AS DateTime))
INSERT [dbo].[GPS] ([ID_gps], [FechaRegistro]) VALUES (4, CAST(N'2020-10-09T20:06:28.277' AS DateTime))
INSERT [dbo].[GPS] ([ID_gps], [FechaRegistro]) VALUES (5, CAST(N'2020-10-09T20:06:31.663' AS DateTime))
INSERT [dbo].[GPS] ([ID_gps], [FechaRegistro]) VALUES (6, CAST(N'2020-10-09T20:07:11.910' AS DateTime))
INSERT [dbo].[GPS] ([ID_gps], [FechaRegistro]) VALUES (7, CAST(N'2020-10-13T21:33:19.230' AS DateTime))
INSERT [dbo].[GPS] ([ID_gps], [FechaRegistro]) VALUES (8, CAST(N'2020-10-13T21:36:32.520' AS DateTime))
INSERT [dbo].[GPS] ([ID_gps], [FechaRegistro]) VALUES (9, CAST(N'2020-10-13T21:44:00.827' AS DateTime))
SET IDENTITY_INSERT [dbo].[GPS] OFF
INSERT [dbo].[Usuario_GPS_Bicicleta] ([ID_Usuario], [ID_gps], [ID_Bicicleta]) VALUES (3, 1, 1)
INSERT [dbo].[Usuario_GPS_Bicicleta] ([ID_Usuario], [ID_gps], [ID_Bicicleta]) VALUES (4, 2, 2)
INSERT [dbo].[Usuario_GPS_Bicicleta] ([ID_Usuario], [ID_gps], [ID_Bicicleta]) VALUES (5, 3, 3)
INSERT [dbo].[Usuario_GPS_Bicicleta] ([ID_Usuario], [ID_gps], [ID_Bicicleta]) VALUES (6, 4, 4)
INSERT [dbo].[Usuario_GPS_Bicicleta] ([ID_Usuario], [ID_gps], [ID_Bicicleta]) VALUES (7, 5, 5)
INSERT [dbo].[Usuario_GPS_Bicicleta] ([ID_Usuario], [ID_gps], [ID_Bicicleta]) VALUES (8, 6, 6)
INSERT [dbo].[Usuario_GPS_Bicicleta] ([ID_Usuario], [ID_gps], [ID_Bicicleta]) VALUES (9, 7, 7)
INSERT [dbo].[Usuario_GPS_Bicicleta] ([ID_Usuario], [ID_gps], [ID_Bicicleta]) VALUES (10, 8, 8)
INSERT [dbo].[Usuario_GPS_Bicicleta] ([ID_Usuario], [ID_gps], [ID_Bicicleta]) VALUES (11, 9, 9)
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Apellido], [Email], [Celular], [Clave], [FechaRegistro]) VALUES (2, N'Cristian Camilo', N'Beltrán Sarta', N'ccamilo2303@abc.com', CAST(30024546 AS Numeric(10, 0)), N'159357', CAST(N'2020-10-08T21:49:40.163' AS DateTime))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Apellido], [Email], [Celular], [Clave], [FechaRegistro]) VALUES (3, N'Cristian Camilo', N'Beltrán Sarta', N'ccamilo2303@abc.com', CAST(30024546 AS Numeric(10, 0)), N'159357', CAST(N'2020-10-09T19:40:47.200' AS DateTime))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Apellido], [Email], [Celular], [Clave], [FechaRegistro]) VALUES (4, N'Cristian Camilo', N'Beltrán Sarta', N'ccamilo2303@abc.com', CAST(30024546 AS Numeric(10, 0)), N'159357', CAST(N'2020-10-09T20:05:56.440' AS DateTime))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Apellido], [Email], [Celular], [Clave], [FechaRegistro]) VALUES (5, N'Cristian Camilo', N'Beltrán Sarta', N'ccamilo2303@abc.com', CAST(30024546 AS Numeric(10, 0)), N'159357', CAST(N'2020-10-09T20:06:00.117' AS DateTime))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Apellido], [Email], [Celular], [Clave], [FechaRegistro]) VALUES (6, N'Cristian Camilo', N'Beltrán Sarta', N'ccamilo2303@abc.com', CAST(30024546 AS Numeric(10, 0)), N'159357', CAST(N'2020-10-09T20:06:27.983' AS DateTime))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Apellido], [Email], [Celular], [Clave], [FechaRegistro]) VALUES (7, N'Cristian Camilo', N'Beltrán Sarta', N'ccamilo2303@abc.com', CAST(30024546 AS Numeric(10, 0)), N'159357', CAST(N'2020-10-09T20:06:31.373' AS DateTime))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Apellido], [Email], [Celular], [Clave], [FechaRegistro]) VALUES (8, N'Cristian Camilo', N'Beltrán Sarta', N'ccamilo21303@abc.com', CAST(30024546 AS Numeric(10, 0)), N'159357', CAST(N'2020-10-09T20:07:11.630' AS DateTime))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Apellido], [Email], [Celular], [Clave], [FechaRegistro]) VALUES (9, N'Cristian Camilo', N'Beltrán ', N'cbeltran@excelcredit.co', CAST(3016354417 AS Numeric(10, 0)), N'1234567', CAST(N'2020-10-13T21:33:18.780' AS DateTime))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Apellido], [Email], [Celular], [Clave], [FechaRegistro]) VALUES (10, N'Cristian Camilo', N'Beltrán ', N'cbeltran@excelcredit.com', CAST(3016354417 AS Numeric(10, 0)), N'1234567', CAST(N'2020-10-13T21:36:32.083' AS DateTime))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Apellido], [Email], [Celular], [Clave], [FechaRegistro]) VALUES (11, N'Abc', N'Jdjdkd', N'prueba@prueba.com', CAST(3016354416 AS Numeric(10, 0)), N'123456', CAST(N'2020-10-13T21:44:00.390' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Usuario_GPS_Bicicleta]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_GPS_Bicicleta_Bicicleta] FOREIGN KEY([ID_Bicicleta])
REFERENCES [dbo].[Bicicleta] ([ID_Bicicleta])
GO
ALTER TABLE [dbo].[Usuario_GPS_Bicicleta] CHECK CONSTRAINT [FK_Usuario_GPS_Bicicleta_Bicicleta]
GO
ALTER TABLE [dbo].[Usuario_GPS_Bicicleta]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_GPS_Bicicleta_GPS] FOREIGN KEY([ID_gps])
REFERENCES [dbo].[GPS] ([ID_gps])
GO
ALTER TABLE [dbo].[Usuario_GPS_Bicicleta] CHECK CONSTRAINT [FK_Usuario_GPS_Bicicleta_GPS]
GO
ALTER TABLE [dbo].[Usuario_GPS_Bicicleta]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_GPS_Bicicleta_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Usuario_GPS_Bicicleta] CHECK CONSTRAINT [FK_Usuario_GPS_Bicicleta_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [bikerfinder] SET  READ_WRITE 
GO

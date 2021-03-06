USE [master]
GO
/****** Object:  Database [bikerfinder]    Script Date: 08/10/2020 08:14:28 p. m. ******/
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
/****** Object:  User [ccamilo2303_SQLLogin_1]    Script Date: 08/10/2020 08:14:31 p. m. ******/
CREATE USER [ccamilo2303_SQLLogin_1] FOR LOGIN [ccamilo2303_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ccamilo2303_SQLLogin_1]
GO
/****** Object:  Schema [ccamilo2303_SQLLogin_1]    Script Date: 08/10/2020 08:14:31 p. m. ******/
CREATE SCHEMA [ccamilo2303_SQLLogin_1]
GO
/****** Object:  Table [dbo].[Bicicleta]    Script Date: 08/10/2020 08:14:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bicicleta](
	[ID_Bicicleta] [int] NOT NULL,
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
/****** Object:  Table [dbo].[GPS]    Script Date: 08/10/2020 08:14:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPS](
	[ID_gps] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_GPS] PRIMARY KEY CLUSTERED 
(
	[ID_gps] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_GPS_Bicicleta]    Script Date: 08/10/2020 08:14:32 p. m. ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 08/10/2020 08:14:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Usuario] [int] NOT NULL,
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

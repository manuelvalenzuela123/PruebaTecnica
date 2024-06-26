USE [master]
GO
/****** Object:  Database [AerolineaMexico]    Script Date: 07/06/2024 10:41:30 p. m. ******/
CREATE DATABASE [AerolineaMexico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AerolineaMexico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MANUEL\MSSQL\DATA\AerolineaMexico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AerolineaMexico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MANUEL\MSSQL\DATA\AerolineaMexico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AerolineaMexico] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AerolineaMexico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AerolineaMexico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AerolineaMexico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AerolineaMexico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AerolineaMexico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AerolineaMexico] SET ARITHABORT OFF 
GO
ALTER DATABASE [AerolineaMexico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AerolineaMexico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AerolineaMexico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AerolineaMexico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AerolineaMexico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AerolineaMexico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AerolineaMexico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AerolineaMexico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AerolineaMexico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AerolineaMexico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AerolineaMexico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AerolineaMexico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AerolineaMexico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AerolineaMexico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AerolineaMexico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AerolineaMexico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AerolineaMexico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AerolineaMexico] SET RECOVERY FULL 
GO
ALTER DATABASE [AerolineaMexico] SET  MULTI_USER 
GO
ALTER DATABASE [AerolineaMexico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AerolineaMexico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AerolineaMexico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AerolineaMexico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AerolineaMexico] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AerolineaMexico', N'ON'
GO
ALTER DATABASE [AerolineaMexico] SET QUERY_STORE = OFF
GO
USE [AerolineaMexico]
GO
/****** Object:  Table [dbo].[Aerolineas]    Script Date: 07/06/2024 10:41:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aerolineas](
	[Id_Aerolinea] [int] NOT NULL,
	[NombreAerolinea] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aeropuertos]    Script Date: 07/06/2024 10:41:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aeropuertos](
	[Id_Aeropuerto] [int] NOT NULL,
	[NombreAeropuerto] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 07/06/2024 10:41:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[Id_Movimiento] [int] NOT NULL,
	[Descripcion] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelos]    Script Date: 07/06/2024 10:41:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelos](
	[Id_Aerolinea] [int] NOT NULL,
	[Id_Aeropuerto] [int] NOT NULL,
	[Id_Movimiento] [int] NOT NULL,
	[dia] [date] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Aerolineas] ([Id_Aerolinea], [NombreAerolinea]) VALUES (1, N'Volaris')
INSERT [dbo].[Aerolineas] ([Id_Aerolinea], [NombreAerolinea]) VALUES (2, N'Aeromar')
INSERT [dbo].[Aerolineas] ([Id_Aerolinea], [NombreAerolinea]) VALUES (3, N'Interjet')
INSERT [dbo].[Aerolineas] ([Id_Aerolinea], [NombreAerolinea]) VALUES (4, N'Aeromexico')
GO
INSERT [dbo].[Aeropuertos] ([Id_Aeropuerto], [NombreAeropuerto]) VALUES (1, N'Benito Juarez')
INSERT [dbo].[Aeropuertos] ([Id_Aeropuerto], [NombreAeropuerto]) VALUES (2, N'Guanajuato')
INSERT [dbo].[Aeropuertos] ([Id_Aeropuerto], [NombreAeropuerto]) VALUES (3, N'La Paz')
INSERT [dbo].[Aeropuertos] ([Id_Aeropuerto], [NombreAeropuerto]) VALUES (4, N'Oaxaca')
GO
INSERT [dbo].[Movimientos] ([Id_Movimiento], [Descripcion]) VALUES (1, N'Salida')
INSERT [dbo].[Movimientos] ([Id_Movimiento], [Descripcion]) VALUES (2, N'Llegada')
GO
INSERT [dbo].[Vuelos] ([Id_Aerolinea], [Id_Aeropuerto], [Id_Movimiento], [dia]) VALUES (1, 1, 1, CAST(N'2021-05-02' AS Date))
INSERT [dbo].[Vuelos] ([Id_Aerolinea], [Id_Aeropuerto], [Id_Movimiento], [dia]) VALUES (2, 1, 1, CAST(N'2021-05-02' AS Date))
INSERT [dbo].[Vuelos] ([Id_Aerolinea], [Id_Aeropuerto], [Id_Movimiento], [dia]) VALUES (3, 2, 2, CAST(N'2021-05-02' AS Date))
INSERT [dbo].[Vuelos] ([Id_Aerolinea], [Id_Aeropuerto], [Id_Movimiento], [dia]) VALUES (4, 3, 2, CAST(N'2021-05-02' AS Date))
INSERT [dbo].[Vuelos] ([Id_Aerolinea], [Id_Aeropuerto], [Id_Movimiento], [dia]) VALUES (1, 3, 2, CAST(N'2021-05-02' AS Date))
INSERT [dbo].[Vuelos] ([Id_Aerolinea], [Id_Aeropuerto], [Id_Movimiento], [dia]) VALUES (2, 3, 1, CAST(N'2021-05-04' AS Date))
INSERT [dbo].[Vuelos] ([Id_Aerolinea], [Id_Aeropuerto], [Id_Movimiento], [dia]) VALUES (3, 4, 1, CAST(N'2021-05-04' AS Date))
GO
/****** Object:  StoredProcedure [dbo].[SP_AerolineaMayorDosVuelos_Dia]    Script Date: 07/06/2024 10:41:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AerolineaMayorDosVuelos_Dia]
AS
BEGIN
	
	SELECT Al.NombreAerolinea, CAST(V.dia AS DATE) AS Dia, COUNT(*) AS TotalVuelos
	FROM Vuelos V, Aerolineas Al

	WHERE V.Id_Aerolinea = Al.Id_Aerolinea

	GROUP BY Al.NombreAerolinea, CAST(V.dia AS DATE)
	HAVING COUNT(*) > 2 --No arroja resultados hasta ahora porque solo hay Aerolineas con conteo de 2 dias, no mayor a 2
	ORDER BY Al.NombreAerolinea, Dia;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_AerolineaMayorVuelos_Anio]    Script Date: 07/06/2024 10:41:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AerolineaMayorVuelos_Anio]
	@Anio as Int
AS
BEGIN
	
	SELECT TOP 1 Al.NombreAerolinea AS NombreAerolinea, COUNT(V.Id_Movimiento) AS TotalVuelos
	FROM Vuelos V, Aerolineas Al

	WHERE V.Id_Aerolinea = Al.Id_Aerolinea And
		  YEAR(V.dia) = @Anio And
		  V.Id_Movimiento IN (1,2) -- Considerar tanto salidas como llegadas

	GROUP BY Al.NombreAerolinea
	ORDER BY TotalVuelos DESC, Al.NombreAerolinea ASC;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_AeropuertoMayorMovimiento_Anio]    Script Date: 07/06/2024 10:41:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AeropuertoMayorMovimiento_Anio]
	@Anio as Int
AS
BEGIN
	
	SELECT TOP 1 Ap.NombreAeropuerto AS NombreAeropuerto, COUNT(V.Id_Movimiento) AS TotalMovimientos
	FROM Vuelos V, Aeropuertos Ap

	WHERE V.Id_Aeropuerto = Ap.Id_Aeropuerto And
		  YEAR(V.dia) = @Anio

	GROUP BY Ap.NombreAeropuerto
	ORDER BY TotalMovimientos DESC, Ap.NombreAeropuerto ASC;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DiaMayorVuelos]    Script Date: 07/06/2024 10:41:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DiaMayorVuelos]
AS
BEGIN
	
	SELECT TOP 1 V.dia AS Dia, 
				COUNT(V.Id_Movimiento) AS TotalVuelos

	FROM Vuelos V

	WHERE V.Id_Movimiento IN (1, 2) -- Considerar tanto salidas como llegadas
	GROUP BY V.dia
	ORDER BY TotalVuelos DESC

END
GO
USE [master]
GO
ALTER DATABASE [AerolineaMexico] SET  READ_WRITE 
GO

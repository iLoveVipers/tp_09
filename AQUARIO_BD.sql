USE [master]
GO
/****** Object:  Database [AQUARIO]    Script Date: 22/11/2022 12:06:20 ******/

ALTER DATABASE [AQUARIO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AQUARIO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AQUARIO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AQUARIO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AQUARIO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AQUARIO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AQUARIO] SET ARITHABORT OFF 
GO
ALTER DATABASE [AQUARIO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AQUARIO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AQUARIO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AQUARIO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AQUARIO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AQUARIO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AQUARIO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AQUARIO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AQUARIO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AQUARIO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AQUARIO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AQUARIO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AQUARIO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AQUARIO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AQUARIO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AQUARIO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AQUARIO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AQUARIO] SET RECOVERY FULL 
GO
ALTER DATABASE [AQUARIO] SET  MULTI_USER 
GO
ALTER DATABASE [AQUARIO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AQUARIO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AQUARIO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AQUARIO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AQUARIO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AQUARIO', N'ON'
GO
ALTER DATABASE [AQUARIO] SET QUERY_STORE = OFF
GO
USE [AQUARIO]
GO
/****** Object:  User [alumno]    Script Date: 22/11/2022 12:06:20 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Exhibiciones]    Script Date: 22/11/2022 12:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exhibiciones](
	[idExhibicion] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFinalizacion] [date] NULL,
	[ValorPersona] [int] NOT NULL,
	[Descripcion] [varchar](700) NOT NULL,
	[idTematica] [int] NOT NULL,
	[img] [varchar](200) NULL,
 CONSTRAINT [PK_Exhibiciones] PRIMARY KEY CLUSTERED 
(
	[idExhibicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 22/11/2022 12:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[idReserva] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[DNI] [varchar](max) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[idExhibicion] [int] NOT NULL,
	[PrecioFInal] [int] NOT NULL,
	[Email] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[idReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tematicas]    Script Date: 22/11/2022 12:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tematicas](
	[idTematica] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
	[Zona] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Fauna] PRIMARY KEY CLUSTERED 
(
	[idTematica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Exhibiciones] ON 

INSERT [dbo].[Exhibiciones] ([idExhibicion], [Titulo], [FechaInicio], [FechaFinalizacion], [ValorPersona], [Descripcion], [idTematica], [img]) VALUES (2, N'Maravillas Tropicales', CAST(N'2022-11-24' AS Date), CAST(N'2022-12-10' AS Date), 150, N'Adentrese en el mundo de los arrecifes de coral.', 1, N'1.png')
INSERT [dbo].[Exhibiciones] ([idExhibicion], [Titulo], [FechaInicio], [FechaFinalizacion], [ValorPersona], [Descripcion], [idTematica], [img]) VALUES (4, N'Paseo por el Pacifico', CAST(N'2022-09-12' AS Date), CAST(N'2022-12-20' AS Date), 150, N'Un viaje magico por nuestros oceanos.', 2, N'2.png')
INSERT [dbo].[Exhibiciones] ([idExhibicion], [Titulo], [FechaInicio], [FechaFinalizacion], [ValorPersona], [Descripcion], [idTematica], [img]) VALUES (8, N'Visitando el Artico', CAST(N'2022-11-11' AS Date), CAST(N'2022-12-20' AS Date), 200, N'Descubra lo que se esconde bajo el iceberg.', 4, N'3.png')
SET IDENTITY_INSERT [dbo].[Exhibiciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservas] ON 

INSERT [dbo].[Reservas] ([idReserva], [Nombre], [Apellido], [DNI], [Cantidad], [idExhibicion], [PrecioFInal], [Email]) VALUES (1, N'Martina', N'Guy', N'FONDO.png', 2, 2, 400, N'mantirosag@gmail.com')
INSERT [dbo].[Reservas] ([idReserva], [Nombre], [Apellido], [DNI], [Cantidad], [idExhibicion], [PrecioFInal], [Email]) VALUES (2, N'Martina', N'Guy', N'FONDO.png', 3, 2, 600, N'mantirosag@gmail.com')
SET IDENTITY_INSERT [dbo].[Reservas] OFF
GO
SET IDENTITY_INSERT [dbo].[Tematicas] ON 

INSERT [dbo].[Tematicas] ([idTematica], [Categoria], [Zona]) VALUES (1, N'Peces Tropicales', N'50m de Profundidad')
INSERT [dbo].[Tematicas] ([idTematica], [Categoria], [Zona]) VALUES (2, N'Pacifico Occidental', N'50-100m de Profundidad')
INSERT [dbo].[Tematicas] ([idTematica], [Categoria], [Zona]) VALUES (4, N'Mamiferos Articos', N'0-200m de Profundidad')
SET IDENTITY_INSERT [dbo].[Tematicas] OFF
GO
ALTER TABLE [dbo].[Exhibiciones]  WITH CHECK ADD  CONSTRAINT [FK_Exhibiciones_Tematicas] FOREIGN KEY([idTematica])
REFERENCES [dbo].[Tematicas] ([idTematica])
GO
ALTER TABLE [dbo].[Exhibiciones] CHECK CONSTRAINT [FK_Exhibiciones_Tematicas]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Exhibiciones] FOREIGN KEY([idExhibicion])
REFERENCES [dbo].[Exhibiciones] ([idExhibicion])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Exhibiciones]
GO
USE [master]
GO
ALTER DATABASE [AQUARIO] SET  READ_WRITE 
GO

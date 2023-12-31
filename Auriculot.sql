USE [master]
GO
/****** Object:  Database [Fichero]    Script Date: 04/10/2023 13:29:30 ******/
CREATE DATABASE [Fichero]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fichero', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Fichero.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fichero_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Fichero_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Fichero] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fichero].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fichero] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fichero] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fichero] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fichero] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fichero] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fichero] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Fichero] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fichero] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fichero] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fichero] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fichero] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fichero] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fichero] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fichero] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fichero] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Fichero] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fichero] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fichero] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fichero] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fichero] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fichero] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fichero] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fichero] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fichero] SET  MULTI_USER 
GO
ALTER DATABASE [Fichero] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fichero] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fichero] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fichero] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fichero] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fichero] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Fichero] SET QUERY_STORE = ON
GO
ALTER DATABASE [Fichero] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Fichero]
GO
/****** Object:  Table [dbo].[Ficha]    Script Date: 04/10/2023 13:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ficha](
	[Id] [char](8) NOT NULL,
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[IdPesos_Turnos] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 04/10/2023 13:29:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](40) NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[Domicilio] [text] NULL,
	[Telefono] [varchar](50) NULL,
	[Dni] [varchar](50) NULL,
	[InfoAdicional] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pesos_Turnos]    Script Date: 04/10/2023 13:29:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pesos_Turnos](
	[Id] [char](8) NOT NULL,
	[Peso] [char](8) NULL,
	[Fecha_Turno] [char](11) NULL,
	[Fecha_Proximo_Turno] [char](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (1, N'Boda', N'Juan Pedro', N'448 e/24 y 26 - n2975', N'221-546-5578', N'28669581', N'Tiroides --- Negativo
Presión --- Negativo
Diabetes ---Negativo
Deporte --- de 2 a 3 veces por semana
')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (3, N'Rivero', N'Patricia', N'448 n°2975', N'221-5646171', N'10931677', N'Acá va la Info Adicional')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (4, N'Boda', N'Maria Lujan', N'Carlos Gardel N°2975', N'11-4522-6998', N'30000000', N'Acá va la Info Adicional')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (18, N'Boda', N'Patricio', NULL, NULL, N'32000000', N'Acá va la Info Adicional')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (19, N'Viana', N'Elias', NULL, NULL, N'35000000', N'Acá va la Info Adicional')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (20, N'Fulano', N'Detal', NULL, NULL, N'38000000', N'Acá va la Info Adicional')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (42, N'Gomez', N'Alejandra Mariel', N'82 n° 3785', N'221-546-6788', N'34000000', N'Acá va la Info Adicional')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (43, N'Boda', N'Juan Pedro', N'448 N° 2975', N'2215465578', N'28669581', N'Tiroides --- Negativo
Presión --- Negativo
Diabetes ---Negativo
Deporte --- de 2 a 3 veces por semana
')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (44, N'sfgdfgsd', N'fdsdsf', N'sdfvdsf', N'sdfvdf', N'28669581', N'Tiroides --- Negativo
Presión --- Negativo
Diabetes ---Negativo
Deporte --- de 2 a 3 veces por semana
')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (45, N'cvdasd', N'sdvcds', N'sdcsd', N'sdcsd', N'dcdsc', N'cdc')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (46, N'dv cd', N'dvfd', N'dfvfdadfvfd', N'dfvfd', N'vfdfdv', N'dvdfv')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (47, N'xaS', N'AsA', N'xAS', N'Xasx', N'Xas', N'xASX')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (48, N'SDCVS', N'SDCDS', N'SDCDS', N'SDCSD', N'SDCSDSDC', N'DSCS')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (49, N'dcvfac', N'adsfas', N'sdfvasd', N'fdsvadsf', N'sdfvas', N'fdsvdasv')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (50, N'wef', N'wef', N'wef', N'wef', N'wef', N'wef')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (51, N'vfdssd', N'sdv', N'cv', N'dvc', N'sdfv', N'v')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (52, N'dsv', N'dfb', N'xdf', N'xdfvb', N'bxx', N'zdfv')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (53, N'dxfbxdf', N'xdfbx', N'cxvbcx', N'xcvbx', N'xfbxf', N'xcdfbxfd')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (54, N'sfger', N'fegd', N'dsafvafd', N'dfvasdf', N'afda', N'svfads')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (55, N'sfger', N'fegd', N'dsafvafd', N'dfvasdf', N'afda', N'svfadsfdv fd')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (56, N'sfger', N'fegd', N'dsafvafd', N'dfvasdf', N'afda', N'svfadsfdv fdvfd vfdsa')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (57, N'fdfdsa', N'dfvadsf', N'zdfvdfas', N'dfvdfa', N'zdfvdfv', N'zdfvdaf')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (58, N'fdfdsa', N'dfvadsf', N'zdfvdfas', N'dfvdfa', N'zdfvdfv', N'zdfvdaf')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (59, N'fgsgs', N'gfrg', N'sdfv', N'sdfvs', N'sgvs', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (60, N'gh44', N'bncnc', N'vbnvb', N'fvbf', N'fbfg', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (61, N'dfdfz', N'fb', N'dfg', N'fg', N'01235689', N'vb')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (62, N'fgsed', N'erg', N'hj,', N'hgkj', N'26262365', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (63, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (64, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (65, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (66, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (67, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (68, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (69, N'df', N'dfv', N'v', N'v', N'12345678', N'dfvb')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (70, N'xbvxcbvcv', N'cvxbcvx', N'cvb cv', N'cv cv', N'88888888', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (71, N'eafvbr', N'fbv', N'dfvb', N'dfvb', N'12345678', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (72, N'sdf', N'asdv', N'kjh', N'klj', N'12345678', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (73, N'dfv', N'dfv', N'cv', N'cv', N'11111111', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (74, N'dgh', N'fgh', N'fg', N'g', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (75, N'frgh', N'fghb', N'fgb', N'fgb', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (76, N'rthg', N'dfrgh', N'dfg', N'nb', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (77, N'rtvbhgrtvb', N'gtrftg', N'cghn', N'fdghbv', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (78, N'rthvb', N'frtghbghv', N'fgd dfsvg', N'dfv', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (79, N'arferf', N'erfg', N'dfvb', N'dfcv', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (80, N'dfv', N'dfvb', N'fg', N'r', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (81, N'dfv', N'dfv', N'fsdv', N'fdv', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (82, N'fdvdfv', N'fd', N'vcb', N'cv', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (83, N'fgb', N'g', N't', N't', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (84, N'dfvb', N'dfv', N'fdgb', N'dfgb', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (85, N'ghn', N'hn', N'cbn gfhnb', N'gb', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (86, N'rfgb', N'grfh', N'sfdg', N'fg', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (87, N'rfgb', N'grfh', N'sfdg', N'fg', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (88, N'rfgb', N'grfh', N'sfdg', N'fg', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (89, N'rgbv', N'g', N'fg', N'vgb', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (90, N'rgbv', N'g', N'fg', N'vgb', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (91, N'rgbv', N'g', N'fg', N'vgb', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (92, N'rgbv', N'g', N'fg', N'vgb', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (93, N'rth', N'rth', N'fgh', N'g', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (94, N'h', N'h', N'h', N'h', N'66666666', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (95, N'h', N'h', N'h', N'h', N'66666666', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (96, N'h', N'h', N'h', N'h', N'66666666', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (97, N'h', N'h', N'h', N'h', N'66666666', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (98, N'f', N'f', N'g', N'g', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (99, N'f', N'f', N'g', N'g', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (100, N'f', N'f', N'g', N'g', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (101, N'h', N'h', N'g', N'g', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (102, N'h', N'h', N'g', N'gg', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (103, N'h', N'h', N'g', N'gg5', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (104, N's', N's', N'd', N'2215465578', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (105, N's', N's', N'd', N'01145465578', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (106, N's', N's', N'd', N'011454655783', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (107, N'w', N'w', N'w', N'221-546-5578', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (108, N's', N'JuanPedro', N'd', N'2', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (109, N'rgrg', N'vrbt', N'f', N'4', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (110, N'rgrg', N'vrbt', N'f', N'4', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (111, N'rgrg', N'vrbt', N'f', N'4', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (112, N'd', N'd', N'g', N'3', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (113, N'd', N'd', N'g', N'3', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (114, N'd', N'd', N'g', N'3', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (115, N'd', N'd', N'g', N'3', N'33333338', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (116, N'i', N'i', N't', N'2', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (117, N'i', N'i', N't', N'2', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (118, N'i', N'i', N't', N'2', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (119, N'e', N'e', N'e', N'3', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (120, N'e', N'e', N'e', N'3', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (121, N'e', N'e', N'e', N'3', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (122, N'r', N'r', N't', N'5', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (123, N'r', N'r', N't', N'5', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (124, N'r r', N'r', N'r', N'4', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (125, N'd e', N'd e', N's', N'2', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (126, N'e', N'e', N'e', N'3', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (127, N'e', N'e w', N'e', N'3', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (128, N'e', N'e w', N'e', N'3', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (129, N'e e', N'e w', N'e', N'3', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (130, N'Boda', N'Juan Pedro', N'448 n° 2975', N'3221-546-5578', N'28669581', N'Tiroides --- Negativo
Presión --- Negativo
Diabetes ---Negativo
Deporte --- de 2 a 3 veces por semana
')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (131, N'Boda', N'Juan Pedro', N'448 n° 2975', N'3221-546-5578', N'28669581', N'Tiroides --- Negativo
Presión --- Negativo
Diabetes ---Negativo
Deporte --- de 2 a 3 veces por semana
')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (132, N'Boda', N'Juan Pedro', N'448 n° 2975', N'3221-546-5578', N'28669581', N'Tiroides --- Negativo
Presión --- Negativo
Diabetes ---Negativo
Deporte --- de 2 a 3 veces por semana
')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (133, N'lo agu', N'Juan P', N'789h', N'6363', N'00000000', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (134, N'lo agu', N'Juan P', N'789h', N'6363', N'00000000', N'')
GO
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (135, N'lo agu', N'Juan P', N'789h', N'6363', N'00000000', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (136, N'dfv', N'sdv', N'c', N'2', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (137, N'sd dwed', N'qsd', N'2x', N'2', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (138, N'f', N'f', N's', N'2', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (139, N'f', N'f', N's', N'2', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (140, N'e', N'e', N'e', N'3', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (141, N'w', N'w', N's', N'2', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (142, N'e', N'e', N'w', N'2', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (143, N'f', N'f', N'd', N'3', N'33333333', N'3')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (144, N'e', N'e', N'w', N'2', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (145, N'e', N'e', N'w', N'2', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (146, N'r', N'r', N'r', N'4', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (147, N'r', N'r', N'r', N'4', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (148, N'r', N'r', N'r', N'4', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (149, N'r', N'r', N'r', N'4', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (150, N'w', N'w', N's', N'2', N'22222222', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (151, N'e', N'e', N'd', N'4', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (152, N's', N's', N'd', N'2', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (153, N'w', N'w', N'd', N'2', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (154, N'g', N'g', N'e', N'3', N'33333333', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (155, N'g', N'g', N'r', N'4', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (156, N'h', N'h', N'h', N'5', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (157, N'r', N'r', N'g', N'5', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (158, N't', N't', N'r', N'4', N'44444444', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (159, N'er', N'r', N'f', N'4', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (160, N'y', N'y', N'g', N'5', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (161, N'y', N'y', N'g', N'5', N'55555555', N'')
INSERT [dbo].[Paciente] ([Id], [Apellido], [Nombre], [Domicilio], [Telefono], [Dni], [InfoAdicional]) VALUES (162, N'y', N'y', N'g', N'5', N'55555555', N'')
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
ALTER TABLE [dbo].[Ficha]  WITH CHECK ADD  CONSTRAINT [fk_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([Id])
GO
ALTER TABLE [dbo].[Ficha] CHECK CONSTRAINT [fk_Paciente]
GO
ALTER TABLE [dbo].[Ficha]  WITH CHECK ADD  CONSTRAINT [fk_Pesos_Turnos] FOREIGN KEY([IdPesos_Turnos])
REFERENCES [dbo].[Pesos_Turnos] ([Id])
GO
ALTER TABLE [dbo].[Ficha] CHECK CONSTRAINT [fk_Pesos_Turnos]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Apellido]    Script Date: 04/10/2023 13:29:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Proc_Apellido]
	@Apellido varchar(40)
	as
	Begin
	Select Apellido, Nombre, Domicilio, Telefono, DNI
	From Paciente
	where Apellido= @Apellido;
	End
GO
USE [master]
GO
ALTER DATABASE [Fichero] SET  READ_WRITE 
GO

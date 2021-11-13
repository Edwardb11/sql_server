USE [master]
GO
/****** Object:  Database [asilo]    Script Date: 29/10/2021 9:34:28 p. m. ******/
CREATE DATABASE [asilo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'asilo', FILENAME = N'D:\Program Files\MSSQL15.MSSQLSERVER\MSSQL\DATA\asilo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'asilo_log', FILENAME = N'D:\Program Files\MSSQL15.MSSQLSERVER\MSSQL\DATA\asilo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [asilo] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [asilo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [asilo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [asilo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [asilo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [asilo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [asilo] SET ARITHABORT OFF 
GO
ALTER DATABASE [asilo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [asilo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [asilo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [asilo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [asilo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [asilo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [asilo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [asilo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [asilo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [asilo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [asilo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [asilo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [asilo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [asilo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [asilo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [asilo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [asilo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [asilo] SET RECOVERY FULL 
GO
ALTER DATABASE [asilo] SET  MULTI_USER 
GO
ALTER DATABASE [asilo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [asilo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [asilo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [asilo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [asilo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [asilo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'asilo', N'ON'
GO
ALTER DATABASE [asilo] SET QUERY_STORE = OFF
GO
USE [asilo]
GO
/****** Object:  Table [dbo].[enfermedad]    Script Date: 29/10/2021 9:34:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enfermedad](
	[id_enfermedad] [int] IDENTITY(1,1) NOT NULL,
	[enfermedad] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_enfermedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medicamento]    Script Date: 29/10/2021 9:34:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medicamento](
	[id_medicamento] [int] IDENTITY(1,1) NOT NULL,
	[medicamento] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_medicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[municipio]    Script Date: 29/10/2021 9:34:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[municipio](
	[id_municipio] [int] IDENTITY(1,1) NOT NULL,
	[id_provincia] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_municipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 29/10/2021 9:34:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente](
	[id_paciente] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[cedula] [varchar](15) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[genero] [varchar](1) NOT NULL,
	[contacto] [varchar](15) NULL,
 CONSTRAINT [PK__paciente__2C2C72BBC2554179] PRIMARY KEY CLUSTERED 
(
	[id_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paciente_enfermedad]    Script Date: 29/10/2021 9:34:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente_enfermedad](
	[id_paciente_enfermedad] [int] IDENTITY(1,1) NOT NULL,
	[id_paciente] [int] NOT NULL,
	[id_enfermedad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_paciente_enfermedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paciente_medicamento]    Script Date: 29/10/2021 9:34:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente_medicamento](
	[id_paciente_medicamento] [int] IDENTITY(1,1) NOT NULL,
	[id_paciente] [int] NOT NULL,
	[id_medicamento] [int] NOT NULL,
	[hora_fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_paciente_medicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paciente_visitante]    Script Date: 29/10/2021 9:34:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente_visitante](
	[id_paciente_visitante] [int] IDENTITY(1,1) NOT NULL,
	[id_paciente] [int] NOT NULL,
	[id_visitante] [int] NOT NULL,
	[hora_fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_paciente_visitante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 29/10/2021 9:34:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincia](
	[id_provincia] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visitante]    Script Date: 29/10/2021 9:34:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitante](
	[id_visitante] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[cedula] [varchar](15) NOT NULL,
	[fecha_nacimiento] [datetime] NOT NULL,
	[genero] [varchar](1) NOT NULL,
	[contacto] [varchar](15) NULL,
	[id_municipio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_visitante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[enfermedad] ON 
GO
INSERT [dbo].[enfermedad] ([id_enfermedad], [enfermedad]) VALUES (1, N'Diabetes')
GO
INSERT [dbo].[enfermedad] ([id_enfermedad], [enfermedad]) VALUES (2, N'Insuficiencia Renal')
GO
INSERT [dbo].[enfermedad] ([id_enfermedad], [enfermedad]) VALUES (3, N'Colesterol')
GO
INSERT [dbo].[enfermedad] ([id_enfermedad], [enfermedad]) VALUES (4, N'Anzheimer')
GO
INSERT [dbo].[enfermedad] ([id_enfermedad], [enfermedad]) VALUES (5, N'Deficiencia Senil')
GO
INSERT [dbo].[enfermedad] ([id_enfermedad], [enfermedad]) VALUES (6, N'Presion')
GO
INSERT [dbo].[enfermedad] ([id_enfermedad], [enfermedad]) VALUES (7, N'Deficiencia Sensorial')
GO
INSERT [dbo].[enfermedad] ([id_enfermedad], [enfermedad]) VALUES (8, N'Otros')
GO
SET IDENTITY_INSERT [dbo].[enfermedad] OFF
GO
SET IDENTITY_INSERT [dbo].[medicamento] ON 
GO
INSERT [dbo].[medicamento] ([id_medicamento], [medicamento]) VALUES (1, N'Celecon')
GO
INSERT [dbo].[medicamento] ([id_medicamento], [medicamento]) VALUES (2, N'Remison')
GO
INSERT [dbo].[medicamento] ([id_medicamento], [medicamento]) VALUES (3, N'Ibuprofeno')
GO
INSERT [dbo].[medicamento] ([id_medicamento], [medicamento]) VALUES (4, N'Amantadina')
GO
INSERT [dbo].[medicamento] ([id_medicamento], [medicamento]) VALUES (5, N'Insulina')
GO
INSERT [dbo].[medicamento] ([id_medicamento], [medicamento]) VALUES (6, N'Checolax')
GO
INSERT [dbo].[medicamento] ([id_medicamento], [medicamento]) VALUES (7, N'Cefasolina')
GO
SET IDENTITY_INSERT [dbo].[medicamento] OFF
GO
SET IDENTITY_INSERT [dbo].[municipio] ON 
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (1, 1, N'Guerra')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (2, 1, N'Los Alcarizos')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (3, 1, N'Los Minas')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (4, 2, N'Gurabo')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (5, 2, N'Guanujo')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (6, 3, N'La Paz')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (7, 3, N'Rivera')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (8, 4, N'El Puente')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (9, 4, N'Rincon')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (10, 5, N'Ranchito')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (11, 6, N'Cutupu')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (12, 7, N'Villa Tapia')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (13, 7, N'Salcedo')
GO
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (14, 8, N'Villa Progreso')
GO
SET IDENTITY_INSERT [dbo].[municipio] OFF
GO
SET IDENTITY_INSERT [dbo].[paciente] ON 
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (1, N'Jose Juan', N'Lopez G.', N'051-00045789-0', CAST(N'1960-01-12' AS Date), N'M', N'809-594-5246')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (2, N'Maria Encarnacion', N'Lopez G.', N'051-00058789-0', CAST(N'1932-01-15' AS Date), N'F', N'809-504-5246')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (3, N'Juana', N'De la Cruz', N'051-00055649-0', CAST(N'1939-08-15' AS Date), N'F', N'809-574-0246')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (4, N'Virginia', N'Diaz', N'0-000000000-0', CAST(N'1922-07-15' AS Date), N'F', N'000-000-0000')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (5, N'Gracielo', N'Mejia', N'051-0845789-0', CAST(N'1952-07-15' AS Date), N'M', N'809-685-5246')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (6, N'Dolores', N'Lopez G.', N'051-87458789-0', CAST(N'1912-07-15' AS Date), N'F', N'809-652-1155')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (7, N'Bartolo', N'Gonzalez', N'057-00058789-0', CAST(N'1932-02-15' AS Date), N'M', N'809-663-0246')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (8, N'Victor', N'Reinoso', N'059-00058789-0', CAST(N'1932-07-15' AS Date), N'M', N'809-114-5246')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (9, N'Pancracia', N'De la Cruz', N'001-00055649-0', CAST(N'1949-10-15' AS Date), N'F', N'829-574-0146')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (10, N'Elva', N'Jimenez', N'050-0000999-1', CAST(N'1924-03-05' AS Date), N'F', N'849-850-0099')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (11, N'Eladio', N'Ceballos', N'008-1045709-0', CAST(N'1958-04-30' AS Date), N'M', N'829-885-5246')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (12, N'Heidy', N'Fernandez', N'041-00058789-0', CAST(N'1952-04-25' AS Date), N'F', N'849-602-0105')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (13, N'Stebel', N'Malena', N'040-04158789-0', CAST(N'1942-02-28' AS Date), N'M', N'849-503-1216')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (14, N'Nuria', N'Pimentel', N'009-00008089-0', CAST(N'1938-01-05' AS Date), N'F', N'809-701-5246')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (15, N'Encarnacion', N'Galicia', N'074-0007778-0', CAST(N'1932-01-15' AS Date), N'M', N'849-514-5246')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (16, N'Juan', N'De la Cruz', N'001-00022649-0', CAST(N'1949-01-15' AS Date), N'M', N'829-574-0156')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (17, N'Rosa', N'Ramirez', N'0-000000000-0', CAST(N'1902-01-05' AS Date), N'F', N'000-000-0000')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (18, N'Engracio', N'Mejia', N'001-0845751-0', CAST(N'1942-09-09' AS Date), N'M', N'849-625-0246')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (19, N'Luz Mariel', N'Rosario', N'402-87458789-0', CAST(N'1901-08-15' AS Date), N'F', N'849-782-1155')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (20, N'Dominga', N'Gonzalez', N'057-11128789-0', CAST(N'1932-06-15' AS Date), N'F', N'809-663-0246')
GO
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto]) VALUES (21, N'Victoria', N'Reyes', N'009-00045789-0', CAST(N'1938-07-15' AS Date), N'F', N'809-214-9946')
GO
SET IDENTITY_INSERT [dbo].[paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[paciente_enfermedad] ON 
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (1, 1, 1)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (2, 1, 7)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (3, 2, 3)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (4, 4, 5)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (5, 4, 3)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (6, 5, 1)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (7, 6, 1)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (8, 7, 1)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (9, 8, 8)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (10, 9, 8)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (11, 10, 2)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (12, 11, 6)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (13, 12, 6)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (14, 13, 8)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (15, 16, 8)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (16, 17, 1)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (17, 17, 4)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (18, 17, 5)
GO
INSERT [dbo].[paciente_enfermedad] ([id_paciente_enfermedad], [id_paciente], [id_enfermedad]) VALUES (19, 20, 6)
GO
SET IDENTITY_INSERT [dbo].[paciente_enfermedad] OFF
GO
SET IDENTITY_INSERT [dbo].[paciente_medicamento] ON 
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (12, 1, 1, CAST(N'2021-10-15T11:02:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (13, 5, 1, CAST(N'2021-10-15T15:02:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (14, 17, 1, CAST(N'2021-10-25T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (15, 7, 1, CAST(N'2021-08-05T10:25:00.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (16, 2, 5, CAST(N'2021-10-25T12:00:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (17, 3, 6, CAST(N'2021-09-30T18:00:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (18, 8, 4, CAST(N'2021-10-15T11:02:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (19, 15, 6, CAST(N'2021-10-15T15:02:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (20, 18, 4, CAST(N'2021-10-25T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (21, 10, 4, CAST(N'2021-08-05T10:25:00.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (22, 21, 5, CAST(N'2021-10-25T12:00:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (23, 13, 6, CAST(N'2021-09-30T18:00:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_medicamento] ([id_paciente_medicamento], [id_paciente], [id_medicamento], [hora_fecha]) VALUES (25, 1, 2, CAST(N'2021-02-10T18:50:30.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[paciente_medicamento] OFF
GO
SET IDENTITY_INSERT [dbo].[paciente_visitante] ON 
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (1, 1, 1, CAST(N'2021-07-15T11:02:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (18, 1, 1, CAST(N'2021-07-15T11:02:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (19, 1, 8, CAST(N'2021-08-05T14:05:30.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (20, 2, 4, CAST(N'2021-01-25T16:20:01.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (21, 3, 2, CAST(N'2021-10-01T18:21:33.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (22, 4, 5, CAST(N'2020-12-15T10:08:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (23, 5, 1, CAST(N'2021-08-05T12:30:00.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (24, 10, 6, CAST(N'2021-09-15T11:02:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (25, 15, 5, CAST(N'2021-07-15T12:02:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (26, 1, 8, CAST(N'2021-06-05T15:05:30.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (27, 2, 4, CAST(N'2021-10-25T14:20:01.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (28, 13, 3, CAST(N'2021-10-01T08:21:33.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (29, 4, 6, CAST(N'2020-12-15T17:08:10.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (30, 15, 5, CAST(N'2021-08-05T14:40:00.000' AS DateTime))
GO
INSERT [dbo].[paciente_visitante] ([id_paciente_visitante], [id_paciente], [id_visitante], [hora_fecha]) VALUES (31, 6, 1, CAST(N'2021-10-15T11:02:10.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[paciente_visitante] OFF
GO
SET IDENTITY_INSERT [dbo].[provincia] ON 
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (1, N'Santo Domingo')
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (2, N'Santiago')
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (3, N'La Vega')
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (4, N'La Romana')
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (5, N'Puerto Plata')
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (6, N'La Altagracia')
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (7, N'Hermanas Mirabal')
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (8, N'Duarte')
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (9, N'San Juan')
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (10, N'Barahona')
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (11, N'Pedernales')
GO
SET IDENTITY_INSERT [dbo].[provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[visitante] ON 
GO
INSERT [dbo].[visitante] ([id_visitante], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto], [id_municipio]) VALUES (1, N'Edward', N'Brito', N'402-0009908-0', CAST(N'1992-02-05T00:00:00.000' AS DateTime), N'M', N'849-514-5246', 1)
GO
INSERT [dbo].[visitante] ([id_visitante], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto], [id_municipio]) VALUES (2, N'Yessica', N'Villar', N'402-0001108-0', CAST(N'1998-01-15T00:00:00.000' AS DateTime), N'F', N'809-555-5246', 2)
GO
INSERT [dbo].[visitante] ([id_visitante], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto], [id_municipio]) VALUES (3, N'Argenis', N'Gonzalez', N'402-0001148-0', CAST(N'1994-08-01T00:00:00.000' AS DateTime), N'M', N'809-751-8698', 3)
GO
INSERT [dbo].[visitante] ([id_visitante], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto], [id_municipio]) VALUES (4, N'Ericsson', N'Reyes', N'402-0004878-0', CAST(N'2001-05-24T00:00:00.000' AS DateTime), N'M', N'849-454-5246', 1)
GO
INSERT [dbo].[visitante] ([id_visitante], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto], [id_municipio]) VALUES (5, N'Luis', N'Brito', N'402-0001108-0', CAST(N'1999-02-05T00:00:00.000' AS DateTime), N'M', N'809-214-5246', 5)
GO
INSERT [dbo].[visitante] ([id_visitante], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto], [id_municipio]) VALUES (6, N'Juana', N'Villar', N'402-0005508-0', CAST(N'2000-01-15T00:00:00.000' AS DateTime), N'F', N'809-505-5246', 7)
GO
INSERT [dbo].[visitante] ([id_visitante], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto], [id_municipio]) VALUES (7, N'Mario', N'Gonzalez', N'402-0001148-0', CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'M', N'809-701-8698', 8)
GO
INSERT [dbo].[visitante] ([id_visitante], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [contacto], [id_municipio]) VALUES (8, N'Robert', N'Reyes', N'052-0004878-0', CAST(N'2003-02-04T00:00:00.000' AS DateTime), N'M', N'809-454-5246', 1)
GO
SET IDENTITY_INSERT [dbo].[visitante] OFF
GO
ALTER TABLE [dbo].[municipio]  WITH CHECK ADD  CONSTRAINT [fk_municipio_provincia] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[provincia] ([id_provincia])
GO
ALTER TABLE [dbo].[municipio] CHECK CONSTRAINT [fk_municipio_provincia]
GO
ALTER TABLE [dbo].[paciente_enfermedad]  WITH CHECK ADD  CONSTRAINT [fk_paciente_enfermedad_enfermedad] FOREIGN KEY([id_enfermedad])
REFERENCES [dbo].[enfermedad] ([id_enfermedad])
GO
ALTER TABLE [dbo].[paciente_enfermedad] CHECK CONSTRAINT [fk_paciente_enfermedad_enfermedad]
GO
ALTER TABLE [dbo].[paciente_enfermedad]  WITH CHECK ADD  CONSTRAINT [fk_paciente_enfermedad_paciente] FOREIGN KEY([id_paciente])
REFERENCES [dbo].[paciente] ([id_paciente])
GO
ALTER TABLE [dbo].[paciente_enfermedad] CHECK CONSTRAINT [fk_paciente_enfermedad_paciente]
GO
ALTER TABLE [dbo].[paciente_medicamento]  WITH CHECK ADD  CONSTRAINT [fk_paciente_medicamento_medicamento] FOREIGN KEY([id_medicamento])
REFERENCES [dbo].[medicamento] ([id_medicamento])
GO
ALTER TABLE [dbo].[paciente_medicamento] CHECK CONSTRAINT [fk_paciente_medicamento_medicamento]
GO
ALTER TABLE [dbo].[paciente_medicamento]  WITH CHECK ADD  CONSTRAINT [fk_paciente_medicamento_paciente] FOREIGN KEY([id_paciente])
REFERENCES [dbo].[paciente] ([id_paciente])
GO
ALTER TABLE [dbo].[paciente_medicamento] CHECK CONSTRAINT [fk_paciente_medicamento_paciente]
GO
ALTER TABLE [dbo].[paciente_visitante]  WITH CHECK ADD  CONSTRAINT [fk_paciente_visitante_paciente] FOREIGN KEY([id_paciente])
REFERENCES [dbo].[paciente] ([id_paciente])
GO
ALTER TABLE [dbo].[paciente_visitante] CHECK CONSTRAINT [fk_paciente_visitante_paciente]
GO
ALTER TABLE [dbo].[paciente_visitante]  WITH CHECK ADD  CONSTRAINT [fk_paciente_visitante_visitante] FOREIGN KEY([id_visitante])
REFERENCES [dbo].[visitante] ([id_visitante])
GO
ALTER TABLE [dbo].[paciente_visitante] CHECK CONSTRAINT [fk_paciente_visitante_visitante]
GO
ALTER TABLE [dbo].[visitante]  WITH CHECK ADD  CONSTRAINT [fk_visitante_municipio] FOREIGN KEY([id_municipio])
REFERENCES [dbo].[municipio] ([id_municipio])
GO
ALTER TABLE [dbo].[visitante] CHECK CONSTRAINT [fk_visitante_municipio]
GO
/****** Object:  StoredProcedure [dbo].[usp_actualizarMedicamento]    Script Date: 29/10/2021 9:34:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--UPDATE
CREATE PROCEDURE [dbo].[usp_actualizarMedicamento]
	@id as INT,
	@medicamento as varchar(80)
AS
BEGIN
	
	SET NOCOUNT ON;

   
	UPDATE
		medicamento
	SET
		medicamento = @medicamento
	
	WHERE medicamento.id_medicamento = @id			
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_buscarMedicamento]    Script Date: 29/10/2021 9:34:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--READ

CREATE PROCEDURE [dbo].[usp_buscarMedicamento]
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT 
		*
	FROM
		medicamento m

	WHERE m.id_medicamento = @id

END
GO
/****** Object:  StoredProcedure [dbo].[usp_consulta1]    Script Date: 29/10/2021 9:34:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_consulta1]
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	e.enfermedad
	,SUM(CASE WHEN  datediff(year,p.fecha_nacimiento,getdate())<=65 then 1 else 0 end) as menosDe65
	,SUM(CASE WHEN  datediff(year,p.fecha_nacimiento,getdate()) BETWEEN 66 AND 80 then 1 else 0 end) as Entre66a80
	,SUM(CASE WHEN  datediff(year,p.fecha_nacimiento,getdate()) > 80 then 1 else 0 end) as mayorDe80

FROM 
	enfermedad e

	JOIN paciente_enfermedad pe ON pe.id_enfermedad = e.id_enfermedad
	JOIN paciente p ON p.id_paciente = pe.id_paciente

GROUP BY
	e.enfermedad



END
GO
/****** Object:  StoredProcedure [dbo].[usp_consulta2]    Script Date: 29/10/2021 9:34:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_consulta2]
	--se debe pasar el id que se quiera consultar
	@id as INT

AS
BEGIN

	SET NOCOUNT ON;

/*Consulta que permita conocer que medicamento consume un paciente del asilo y su edad*/

	SELECT DISTINCT
		CONCAT_WS(' ', p.nombres, p.apellidos) as Paciente
		,(cast(datediff(dd, p.fecha_nacimiento ,GETDATE()) / 365.25 as int)) as edad
		,ISNULL(m.medicamento, 'No consume medicamento') as medicamento
	
	
		
	
	FROM
	
		paciente p
	
		left JOIN paciente_enfermedad pe ON pe.id_paciente = p.id_paciente
		left JOIN paciente_medicamento pm ON p.id_paciente = pm.id_paciente
		left JOIN medicamento m ON m.id_medicamento = pm.id_medicamento
	
		WHERE p.id_paciente = @id;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_consulta3]    Script Date: 29/10/2021 9:34:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_consulta3] 

AS
BEGIN

	SET NOCOUNT ON;

 
	SELECT
	m.medicamento AS Medicamento,
	COUNT(1) as Cant_Consumidores
	

	FROM
		paciente p

	JOIN paciente_medicamento pm ON pm.id_paciente = p.id_paciente
	JOIN medicamento m ON m.id_medicamento = pm.id_medicamento

GROUP BY
	m.medicamento
END
GO
/****** Object:  StoredProcedure [dbo].[usp_eliminarMedicamento]    Script Date: 29/10/2021 9:34:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DELETE
CREATE PROCEDURE [dbo].[usp_eliminarMedicamento]
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		medicamento
	WHERE medicamento.id_medicamento = @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_guardarMedicamento]    Script Date: 29/10/2021 9:34:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE

CREATE PROCEDURE [dbo].[usp_guardarMedicamento]
	
	@medicamento as VARCHAR(80)
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO 
		medicamento(medicamento)
	VALUES
		(@medicamento)
	;


	SELECT SCOPE_IDENTITY() AS Id;

END
GO
USE [master]
GO
ALTER DATABASE [asilo] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [vacunate]    Script Date: 5/11/2021 3:06:37 p. m. ******/
CREATE DATABASE [vacunate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vacunate', FILENAME = N'D:\Program Files\MSSQL15.MSSQLSERVER\MSSQL\DATA\vacunate.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vacunate_log', FILENAME = N'D:\Program Files\MSSQL15.MSSQLSERVER\MSSQL\DATA\vacunate_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [vacunate] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vacunate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vacunate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vacunate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vacunate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vacunate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vacunate] SET ARITHABORT OFF 
GO
ALTER DATABASE [vacunate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [vacunate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vacunate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vacunate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vacunate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vacunate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vacunate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vacunate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vacunate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vacunate] SET  ENABLE_BROKER 
GO
ALTER DATABASE [vacunate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vacunate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vacunate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vacunate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vacunate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vacunate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vacunate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vacunate] SET RECOVERY FULL 
GO
ALTER DATABASE [vacunate] SET  MULTI_USER 
GO
ALTER DATABASE [vacunate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vacunate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vacunate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vacunate] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vacunate] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vacunate] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'vacunate', N'ON'
GO
ALTER DATABASE [vacunate] SET QUERY_STORE = OFF
GO
USE [vacunate]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_obtenerCantDosisPorProvincia]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--FUNCION 2
--FUNCION PARA CONOCER LA CANTIDAD DE UNA DETERMINADA DOSIS APLICADA EN UN DETERMINADA PROVINCIA


CREATE FUNCTION [dbo].[ufn_obtenerCantDosisPorProvincia]
(
	@provincia as Varchar(100),
	@dosis as INT
)
RETURNS INT
AS
BEGIN
	RETURN (Select count(1) as [Cantidad Aplicada]

From 
	paciente_vacuna as pv

	JOIN Centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	JOIN Municipio as m on m.id_municipio= cv.id_municipio
	JOIN provincia p on p.id_provincia = m.id_provincia

Where 
	pv.dosis = @dosis and p.provincia = @provincia


	);

END
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_obtenerEdadPromedioPorMunicipio]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--FUNCIONES ESCALARES



--FUNCION 1
--FUNCION PARA CONOCER LA EDAD PROMEDIO SEGUN EL MUNICIPIO

CREATE FUNCTION [dbo].[ufn_obtenerEdadPromedioPorMunicipio] 
(
	@municipio as varchar(100)
)
RETURNS INT
AS
BEGIN
	RETURN (SELECT AVG(cast(datediff(dd,pa.fecha_nacimiento,GETDATE()) /  365.25 as int)) AS edad

	From 
	paciente_vacuna as pv

	JOIN Centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	JOIN Municipio as m on m.id_municipio= cv.id_municipio
	JOIN paciente as pa on pa.id_paciente = pv.id_paciente
	JOIN grupo_edad as gp on gp.id_grupo_edad = pa.id_grupo_edad

where
	m.nombre = @municipio and gp.id_grupo_edad = 3);

END
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_obtenerPorcentajeProvVac]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufn_obtenerPorcentajeProvVac]
(
	@provincia as VARCHAR(100),
	@vacuna as varchar(100)
)
RETURNS INT
AS
BEGIN
	RETURN (SELECT
	CAST(
			((CONVERT(float,COUNT(1)) / (SELECT COUNT(1) FROM paciente_vacuna))*100
		 ) AS NUMERIC(10,2)
		) AS [Porcentaje de vacunados %]
				
FROM vacuna as v

	INNER JOIN
		paciente_vacuna as pv on pv.id_vacuna = v.id_vacuna
	INNER JOIN
		centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	INNER JOIN
		municipio as m on m.id_municipio = cv.id_municipio
	INNER JOIN
		provincia as p on p.id_provincia = m.id_provincia


		
	WHERE p.provincia = @provincia and v.nombre = @vacuna

	group by p.provincia, V.id_vacuna
	

	);
END
GO
/****** Object:  Table [dbo].[centro_vacunacion]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[centro_vacunacion](
	[id_centro_vacunacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[id_municipio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_centro_vacunacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grupo_edad]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupo_edad](
	[id_grupo_edad] [int] IDENTITY(1,1) NOT NULL,
	[grupo] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_grupo_edad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[municipio]    Script Date: 5/11/2021 3:06:37 p. m. ******/
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
/****** Object:  Table [dbo].[paciente]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente](
	[id_paciente] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[cedula] [varchar](15) NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[genero] [varchar](1) NOT NULL,
	[id_grupo_edad] [int] NOT NULL,
	[contacto] [varchar](15) NULL,
 CONSTRAINT [PK__paciente__2C2C72BBDBA25375] PRIMARY KEY CLUSTERED 
(
	[id_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paciente_vacuna]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente_vacuna](
	[id_paciente_vacuna] [int] IDENTITY(1,1) NOT NULL,
	[id_paciente] [int] NOT NULL,
	[id_vacuna] [varchar](3) NOT NULL,
	[lote] [varchar](10) NOT NULL,
	[id_centro_vacunacion] [int] NOT NULL,
	[dosis] [int] NOT NULL,
	[fecha_vacunacion] [date] NOT NULL,
 CONSTRAINT [PK__paciente__DA8BB0DC28DA0AB6] PRIMARY KEY CLUSTERED 
(
	[id_paciente_vacuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 5/11/2021 3:06:37 p. m. ******/
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
/****** Object:  Table [dbo].[vacuna]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacuna](
	[id_vacuna] [varchar](3) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_vacuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[centro_vacunacion] ON 

INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (1, N'Bajo Techo', 1)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (2, N'Metro La Paz', 1)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (3, N'Metro Hermanas Mirabal', 1)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (4, N'Jardin Memorial', 2)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (5, N'Estadio Luis Lopez', 2)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (6, N'Escuela La Cruz', 2)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (7, N'Liceo el Liceo', 2)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (8, N'Colegio de las Monjas', 3)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (9, N'Bajo Techo', 4)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (10, N'Escuela La Paz', 4)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (11, N'Liceo Hermanas Mirabal', 4)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (12, N'Jardin Maria', 5)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (13, N'Estacion Cigarro', 5)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (14, N'Escuela La Cruz', 6)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (15, N'Liceo el Liceo', 6)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (16, N'Colegio de las Monjas', 7)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (17, N'Bajo Techo', 8)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (18, N'Metro La Paz', 8)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (19, N'Metro Hermanas Mirabal', 9)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (20, N'Jardin Memorial', 10)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (21, N'Estadio Luis Lopez', 11)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (22, N'Escuela La Cruz', 12)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (23, N'Liceo el Liceo', 12)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (24, N'Colegio de las Monjas', 13)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (25, N'Bajo Techo', 14)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (26, N'Escuela La Paz', 14)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (27, N'Liceo Hermanas Mirabal', 14)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (28, N'Jardin Maria', 15)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (29, N'Estacion Cigarro', 15)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (30, N'Escuela La Cruz', 16)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (31, N'Liceo el Liceo', 17)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (32, N'Colegio de las Monjas', 18)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (33, N'Bajo Techo', 19)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (34, N'Balnearios', 20)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (35, N'Jardin Hermanas Mirabal', 19)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (36, N'Jardin Leon', 21)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (37, N'Parque Independencia', 21)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (38, N'Escuela Primaria', 22)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (39, N'Liceo Juan Jose', 23)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (40, N'Colegio de las Monjas', 24)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (41, N'Play de Futbol', 25)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (42, N'Escuela Jesus', 24)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (43, N'Liceo Teresa Mirabal', 26)
INSERT [dbo].[centro_vacunacion] ([id_centro_vacunacion], [nombre], [id_municipio]) VALUES (44, N'Jardin Duarte', 27)
SET IDENTITY_INSERT [dbo].[centro_vacunacion] OFF
GO
SET IDENTITY_INSERT [dbo].[grupo_edad] ON 

INSERT [dbo].[grupo_edad] ([id_grupo_edad], [grupo]) VALUES (1, N'Niño')
INSERT [dbo].[grupo_edad] ([id_grupo_edad], [grupo]) VALUES (2, N'Jovenes')
INSERT [dbo].[grupo_edad] ([id_grupo_edad], [grupo]) VALUES (3, N'Adulto')
SET IDENTITY_INSERT [dbo].[grupo_edad] OFF
GO
SET IDENTITY_INSERT [dbo].[municipio] ON 

INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (1, 1, N'Guerra')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (2, 1, N'Los Alcarizos')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (3, 1, N'Los Minas')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (4, 2, N'Gurabo')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (5, 2, N'Guanujo')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (6, 3, N'La Paz')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (7, 3, N'Rivera')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (8, 4, N'El Puente')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (9, 4, N'Rincon')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (10, 5, N'Ranchito')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (11, 6, N'Cutupu')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (12, 7, N'Villa Tapia')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (13, 7, N'Salcedo')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (14, 8, N'Villa Progreso')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (15, 10, N'El millon')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (16, 10, N'Siloe')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (17, 11, N'El Malecon')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (18, 2, N'CienFuegos')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (19, 2, N'El cerrito')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (20, 9, N'La Bonanzas')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (21, 8, N'Gamundi')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (22, 9, N'La Laguna')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (23, 1, N'Rio Seco')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (24, 2, N'Rancho al Medio')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (25, 6, N'Santo Palo')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (26, 7, N'Villa Mella')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (27, 7, N'San Francisco')
INSERT [dbo].[municipio] ([id_municipio], [id_provincia], [nombre]) VALUES (28, 8, N'Pueblo Viejo')
SET IDENTITY_INSERT [dbo].[municipio] OFF
GO
SET IDENTITY_INSERT [dbo].[paciente] ON 

INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (6, N'Encarnacion', N'Galicia', N'Menor de edad', CAST(N'2003-01-15' AS Date), N'M', 2, N'849-514-5246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (7, N'Juan', N'De la Cruz', N'001-00022649-0', CAST(N'1979-01-15' AS Date), N'M', 3, N'829-574-0156')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (8, N'Rosa', N'Ramirez', N'0-000000000-0', CAST(N'1982-01-05' AS Date), N'F', 3, N'849-500-9900')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (9, N'Engracio', N'Mejia', N'Menor de edad', CAST(N'2006-09-09' AS Date), N'M', 2, N'849-625-0246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (10, N'Luz Mariel', N'Rosario', N'402-87458789-0', CAST(N'1901-08-15' AS Date), N'F', 3, N'849-782-1155')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (11, N'Dominga', N'Gonzalez', N'057-11128789-0', CAST(N'1932-06-15' AS Date), N'F', 3, N'809-663-0246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (12, N'Victoria', N'Reyes', N'009-00045789-0', CAST(N'1938-07-15' AS Date), N'F', 3, N'809-214-9946')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (13, N'Juan', N'Galvez', N'Menor de edad', CAST(N'2006-01-15' AS Date), N'M', 2, N'809-504-5246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (14, N'Victor', N'De la Cruz', N'001-9846732-0', CAST(N'1997-01-15' AS Date), N'M', 3, N'829-577-0156')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (15, N'Rosita', N'Ramirez', N'Menor de edad', CAST(N'2010-01-05' AS Date), N'F', 2, N'849-210-9900')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (16, N'Ronald', N'Melo', N'Menor de edad', CAST(N'2008-09-09' AS Date), N'M', 2, N'849-325-3246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (17, N'Lupita', N'Rosario', N'402-87458789-0', CAST(N'1921-08-15' AS Date), N'F', 3, N'849-882-0055')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (18, N'Valerio', N'Gonzalez', N'007-00028789-0', CAST(N'1932-10-25' AS Date), N'M', 3, N'809-333-0246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (19, N'Julia', N'Alvarez', N'005-00045679-0', CAST(N'1948-07-15' AS Date), N'F', 3, N'809-123-9946')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (20, N'Marian', N'Galicia', N'Menor de edad', CAST(N'2008-01-15' AS Date), N'F', 2, N'849-514-5246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (21, N'Francisco', N'De la Cruz', N'001-00022649-0', CAST(N'1989-01-15' AS Date), N'M', 2, N'829-574-0156')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (22, N'Rosa', N'Ramirez', N'Menor de edad', CAST(N'2004-01-05' AS Date), N'F', 2, N'849-500-9900')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (23, N'Valerio', N'Mejia', N'Menor de edad', CAST(N'2006-03-09' AS Date), N'M', 2, N'849-625-0246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (24, N'Doris', N'Nin', N'402-87458789-0', CAST(N'1999-08-15' AS Date), N'F', 2, N'849-782-1155')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (25, N'Gonzalo', N'Gonzalez', N'057-11128789-0', CAST(N'1942-06-15' AS Date), N'M', 3, N'809-513-0246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (26, N'Rosario', N'Reyes', N'009-00045789-0', CAST(N'1928-07-15' AS Date), N'F', 3, N'809-044-9946')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (27, N'Angel', N'Galvez', N'Menor de edad', CAST(N'2007-12-15' AS Date), N'M', 2, N'809-504-5246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (28, N'Manuel', N'De la Cruz', N'001-9846732-0', CAST(N'1986-01-15' AS Date), N'M', 3, N'829-577-0156')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (29, N'Rosanna', N'Ramirez', N'Menor de edad', CAST(N'2006-01-05' AS Date), N'F', 2, N'849-210-9900')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (30, N'Virgen', N'Melo', N'034-4432312-3', CAST(N'1932-09-09' AS Date), N'F', 3, N'849-325-3246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (31, N'Marianela', N'Rosario', N'402-0008789-0', CAST(N'1924-08-15' AS Date), N'F', 3, N'849-882-0055')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (32, N'Luis', N'Gonzalez', N'001-00032789-0', CAST(N'1942-10-25' AS Date), N'M', 3, N'809-333-0246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (33, N'Francisca', N'Alvarez', N'002-34240979-0', CAST(N'1938-07-15' AS Date), N'F', 3, N'809-123-9946')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (34, N'Miguel', N'Galicia', N'Menor de edad', CAST(N'2008-01-15' AS Date), N'M', 2, N'849-514-5246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (35, N'Francisca', N'De la Cruz', N'001-00011649-0', CAST(N'1989-01-15' AS Date), N'F', 2, N'829-574-0156')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (36, N'Valeria', N'Ramirez', N'Menor de edad', CAST(N'2005-01-05' AS Date), N'F', 2, N'849-500-9900')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (37, N'Iker', N'Mejia', N'Menor de edad', CAST(N'2006-03-09' AS Date), N'M', 2, N'849-625-0246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (38, N'Damiana', N'Ninza', N'402-0003789-0', CAST(N'1999-08-15' AS Date), N'F', 2, N'849-782-1155')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (39, N'Gabriel', N'Gonzalez', N'057-1110343-0', CAST(N'1942-06-15' AS Date), N'M', 3, N'809-513-0246')
INSERT [dbo].[paciente] ([id_paciente], [nombres], [apellidos], [cedula], [fecha_nacimiento], [genero], [id_grupo_edad], [contacto]) VALUES (40, N'Mariana', N'Reyes', N'234-00045789-0', CAST(N'1928-07-15' AS Date), N'F', 3, N'809-044-9946')
SET IDENTITY_INSERT [dbo].[paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[paciente_vacuna] ON 

INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (4, 40, N'PFZ', N'8347-sd', 1, 1, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (5, 40, N'PFZ', N'8347-sd', 1, 2, CAST(N'2021-05-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (6, 39, N'SIN', N'8347-sd', 2, 1, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (7, 39, N'SIN', N'4547-xc', 3, 2, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (8, 38, N'ATZ', N'8347-sd', 1, 1, CAST(N'2021-05-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (9, 38, N'ATZ', N'7348-sd', 1, 2, CAST(N'2021-07-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (10, 37, N'MOD', N'WEW54-sd', 2, 1, CAST(N'2021-06-06' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (11, 37, N'MOD', N'4547-xc', 3, 2, CAST(N'2021-08-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (12, 36, N'PFZ', N'8347-sd', 4, 1, CAST(N'2021-10-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (13, 36, N'PFZ', N'8347-sd', 4, 2, CAST(N'2021-11-02' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (14, 6, N'SIN', N'8347-sd', 5, 1, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (15, 6, N'SIN', N'4547-xc', 5, 2, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (16, 7, N'ATZ', N'8347-sd', 6, 1, CAST(N'2021-06-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (17, 7, N'ATZ', N'7348-sd', 7, 2, CAST(N'2021-10-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (18, 8, N'MOD', N'WEW54-sd', 6, 1, CAST(N'2021-07-06' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (19, 8, N'MOD', N'4547-xc', 8, 2, CAST(N'2021-09-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (20, 9, N'J&J', N'8347-sd', 10, 1, CAST(N'2021-10-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (21, 10, N'J&J', N'8347-sd', 11, 1, CAST(N'2021-11-02' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (22, 11, N'J&J', N'8347-sd', 10, 1, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (23, 12, N'J&J', N'4547-xc', 13, 1, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (24, 13, N'ATZ', N'8347-sd', 15, 1, CAST(N'2021-08-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (25, 13, N'ATZ', N'7348-sd', 11, 2, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (26, 14, N'MOD', N'WEW54-sd', 2, 1, CAST(N'2021-03-06' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (27, 14, N'MOD', N'4547-xc', 10, 2, CAST(N'2021-06-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (28, 15, N'J&J', N'8347-sd', 1, 1, CAST(N'2021-10-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (29, 16, N'J&J', N'8347-sd', 2, 1, CAST(N'2021-11-02' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (30, 17, N'J&J', N'8347-sd', 4, 1, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (31, 17, N'J&J', N'4547-xc', 14, 1, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (32, 18, N'ATZ', N'8347-sd', 15, 1, CAST(N'2021-08-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (33, 18, N'ATZ', N'7348-sd', 11, 2, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (34, 19, N'SIN', N'WEW54-sd', 2, 1, CAST(N'2021-03-06' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (35, 19, N'SIN', N'4547-xc', 10, 2, CAST(N'2021-06-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (36, 20, N'J&J', N'8347-sd', 1, 1, CAST(N'2021-10-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (37, 21, N'J&J', N'8347-sd', 2, 1, CAST(N'2021-11-02' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (38, 22, N'J&J', N'8347-sd', 4, 1, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (39, 22, N'J&J', N'4547-xc', 14, 1, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (40, 23, N'SIN', N'8347-sd', 17, 1, CAST(N'2021-08-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (41, 23, N'SIN', N'7348-sd', 1, 2, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (42, 24, N'SIN', N'WEW54-sd', 3, 1, CAST(N'2021-03-06' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (43, 24, N'SIN', N'4547-xc', 4, 2, CAST(N'2021-06-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (44, 20, N'J&J', N'8347-sd', 1, 1, CAST(N'2021-10-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (45, 21, N'J&J', N'8347-sd', 2, 1, CAST(N'2021-11-02' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (46, 22, N'J&J', N'8347-sd', 4, 1, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (47, 22, N'J&J', N'4547-xc', 14, 1, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (48, 23, N'SIN', N'8347-sd', 17, 1, CAST(N'2021-08-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (49, 23, N'SIN', N'7348-sd', 1, 2, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (50, 24, N'SIN', N'WEW54-sd', 3, 1, CAST(N'2021-03-06' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (51, 24, N'SIN', N'4547-xc', 4, 2, CAST(N'2021-06-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (52, 25, N'SIN', N'8347-sd', 1, 1, CAST(N'2021-10-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (53, 25, N'SIN', N'8347-sd', 2, 1, CAST(N'2021-11-02' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (54, 27, N'SIN', N'8347-sd', 4, 1, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (55, 27, N'SIN', N'4547-xc', 14, 1, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (56, 26, N'SIN', N'8347-sd', 17, 1, CAST(N'2021-08-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (57, 26, N'SIN', N'7348-sd', 1, 2, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (58, 28, N'SIN', N'WEW54-sd', 3, 1, CAST(N'2021-03-06' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (59, 28, N'SIN', N'4547-xc', 4, 2, CAST(N'2021-06-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (60, 29, N'PFZ', N'8347-sd', 1, 1, CAST(N'2021-10-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (61, 29, N'PFZ', N'8347-sd', 12, 1, CAST(N'2021-11-02' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (62, 30, N'PFZ', N'8347-sd', 14, 1, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (63, 30, N'PFZ', N'4547-xc', 14, 1, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (64, 31, N'PFZ', N'8347-sd', 17, 1, CAST(N'2021-08-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (65, 31, N'PFZ', N'7348-sd', 20, 2, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (66, 32, N'PFZ', N'WEW54-sd', 33, 1, CAST(N'2021-03-06' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (67, 32, N'PFZ', N'4547-xc', 34, 2, CAST(N'2021-06-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (68, 33, N'PFZ', N'8347-sd', 1, 1, CAST(N'2021-10-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (69, 33, N'PFZ', N'8347-sd', 12, 1, CAST(N'2021-11-02' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (70, 34, N'SIN', N'8347-sd', 14, 1, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (71, 34, N'SIN', N'4547-xc', 14, 1, CAST(N'2021-05-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (72, 35, N'PFZ', N'8347-sd', 17, 1, CAST(N'2021-08-05' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (73, 35, N'PFZ', N'7348-sd', 20, 2, CAST(N'2021-09-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (74, 36, N'SIN', N'WEW54-sd', 33, 3, CAST(N'2021-03-06' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (75, 6, N'PFZ', N'8347-sd', 1, 3, CAST(N'2021-11-01' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (76, 23, N'PFZ', N'8347-sd', 12, 3, CAST(N'2021-11-02' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (77, 12, N'PFZ', N'8347-sd', 14, 3, CAST(N'2021-10-15' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (78, 11, N'PFZ', N'4547-xc', 14, 3, CAST(N'2021-10-25' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (79, 14, N'PFZ', N'8347-sd', 17, 3, CAST(N'2021-11-02' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (80, 31, N'PFZ', N'7348-sd', 20, 3, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (81, 22, N'PFZ', N'WEW54-sd', 33, 3, CAST(N'2021-11-01' AS Date))
INSERT [dbo].[paciente_vacuna] ([id_paciente_vacuna], [id_paciente], [id_vacuna], [lote], [id_centro_vacunacion], [dosis], [fecha_vacunacion]) VALUES (82, 15, N'PFZ', N'4547-xc', 34, 3, CAST(N'2021-10-31' AS Date))
SET IDENTITY_INSERT [dbo].[paciente_vacuna] OFF
GO
SET IDENTITY_INSERT [dbo].[provincia] ON 

INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (1, N'Santo Domingo')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (2, N'Santiago')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (3, N'La Vega')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (4, N'La Romana')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (5, N'Puerto Plata')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (6, N'La Altagracia')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (7, N'Hermanas Mirabal')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (8, N'Duarte')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (9, N'San Juan')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (10, N'Barahona')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (11, N'Pedernales')
SET IDENTITY_INSERT [dbo].[provincia] OFF
GO
INSERT [dbo].[vacuna] ([id_vacuna], [nombre]) VALUES (N'ATZ', N'ASTRA-ZENECA')
INSERT [dbo].[vacuna] ([id_vacuna], [nombre]) VALUES (N'J&J', N'Jhonsson and Jhonsson')
INSERT [dbo].[vacuna] ([id_vacuna], [nombre]) VALUES (N'MOD', N'MODERNA')
INSERT [dbo].[vacuna] ([id_vacuna], [nombre]) VALUES (N'PFZ', N'PFIZER')
INSERT [dbo].[vacuna] ([id_vacuna], [nombre]) VALUES (N'SIN', N'SINOVAC')
GO
ALTER TABLE [dbo].[paciente] ADD  CONSTRAINT [DF__paciente__cedula__24927208]  DEFAULT ('Menor de edad') FOR [cedula]
GO
ALTER TABLE [dbo].[centro_vacunacion]  WITH CHECK ADD  CONSTRAINT [fk_municipio_centro] FOREIGN KEY([id_municipio])
REFERENCES [dbo].[municipio] ([id_municipio])
GO
ALTER TABLE [dbo].[centro_vacunacion] CHECK CONSTRAINT [fk_municipio_centro]
GO
ALTER TABLE [dbo].[municipio]  WITH CHECK ADD  CONSTRAINT [fk_municipio_provincia] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[provincia] ([id_provincia])
GO
ALTER TABLE [dbo].[municipio] CHECK CONSTRAINT [fk_municipio_provincia]
GO
ALTER TABLE [dbo].[paciente]  WITH CHECK ADD  CONSTRAINT [fk_paciente_edad] FOREIGN KEY([id_grupo_edad])
REFERENCES [dbo].[grupo_edad] ([id_grupo_edad])
GO
ALTER TABLE [dbo].[paciente] CHECK CONSTRAINT [fk_paciente_edad]
GO
ALTER TABLE [dbo].[paciente_vacuna]  WITH CHECK ADD  CONSTRAINT [fk_paciente_vacuna_centro] FOREIGN KEY([id_centro_vacunacion])
REFERENCES [dbo].[centro_vacunacion] ([id_centro_vacunacion])
GO
ALTER TABLE [dbo].[paciente_vacuna] CHECK CONSTRAINT [fk_paciente_vacuna_centro]
GO
ALTER TABLE [dbo].[paciente_vacuna]  WITH CHECK ADD  CONSTRAINT [fk_paciente_vacuna_paciente] FOREIGN KEY([id_paciente])
REFERENCES [dbo].[paciente] ([id_paciente])
GO
ALTER TABLE [dbo].[paciente_vacuna] CHECK CONSTRAINT [fk_paciente_vacuna_paciente]
GO
ALTER TABLE [dbo].[paciente_vacuna]  WITH CHECK ADD  CONSTRAINT [fk_paciente_vacuna_Tipovacuna] FOREIGN KEY([id_vacuna])
REFERENCES [dbo].[vacuna] ([id_vacuna])
GO
ALTER TABLE [dbo].[paciente_vacuna] CHECK CONSTRAINT [fk_paciente_vacuna_Tipovacuna]
GO
ALTER TABLE [dbo].[paciente_vacuna]  WITH CHECK ADD  CONSTRAINT [fk_paciente_vacuna_vacuna] FOREIGN KEY([id_vacuna])
REFERENCES [dbo].[vacuna] ([id_vacuna])
GO
ALTER TABLE [dbo].[paciente_vacuna] CHECK CONSTRAINT [fk_paciente_vacuna_vacuna]
GO
/****** Object:  StoredProcedure [dbo].[usp_actualizarCentroVacunacion]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--UPDATE
CREATE PROCEDURE [dbo].[usp_actualizarCentroVacunacion]
	@id as int,
	@nombre as varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		centro_vacunacion
	SET
		nombre = @nombre
	
	WHERE centro_vacunacion.id_centro_vacunacion = @id			
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_actualizarGrupoEdad]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--UPDATE
CREATE PROCEDURE [dbo].[usp_actualizarGrupoEdad]
	@id as INT,
	@grupo as varchar
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		grupo_edad
	SET
		grupo = @grupo
	
	WHERE grupo_edad.id_grupo_edad = @id			
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_actualizarMunicipio]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--UPDATE
CREATE PROCEDURE [dbo].[usp_actualizarMunicipio]
	@id as INT,
	@municipio as varchar
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		municipio
	SET
		nombre = @municipio
	
	WHERE municipio.id_municipio = @id			
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_actualizarPaciente]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--UPDATE
CREATE PROCEDURE [dbo].[usp_actualizarPaciente]
	@id as INT,
	@contacto varchar
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		paciente
	SET
		contacto = @contacto
	
	WHERE paciente.id_paciente = @id			
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_actualizarProvincia]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_actualizarProvincia]
	@id as INT,
	@provincia as varchar(80)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		provincia
	SET
		provincia = @provincia
	
	WHERE provincia.id_provincia = @id			
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_buscarCentroVacunacion]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--READ
CREATE PROCEDURE [dbo].[usp_buscarCentroVacunacion]
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		centro_vacunacion cv

	WHERE cv.id_centro_vacunacion = @id

END
GO
/****** Object:  StoredProcedure [dbo].[usp_buscarGrupoEdad]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ENTIDAD GRUPO_EDAD
--READ
CREATE PROCEDURE [dbo].[usp_buscarGrupoEdad]
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		grupo_edad ge

	WHERE ge.id_grupo_edad = @id

END
GO
/****** Object:  StoredProcedure [dbo].[usp_buscarMunicipio]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--READ

CREATE PROCEDURE [dbo].[usp_buscarMunicipio]
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		municipio m

	WHERE m.id_municipio = @id

END
GO
/****** Object:  StoredProcedure [dbo].[usp_buscarPaciente]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--READ

CREATE PROCEDURE [dbo].[usp_buscarPaciente]
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		paciente p

	WHERE p.id_paciente = @id

END
GO
/****** Object:  StoredProcedure [dbo].[usp_buscarPaciente_vacuna]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--READ
CREATE PROCEDURE [dbo].[usp_buscarPaciente_vacuna]
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		paciente_vacuna pv

	WHERE pv.id_paciente_vacuna = @id

END
GO
/****** Object:  StoredProcedure [dbo].[usp_buscarProvincia]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_buscarProvincia]
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		provincia p

	WHERE p.id_provincia = @id

END
GO
/****** Object:  StoredProcedure [dbo].[usp_buscarVacuna]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--READ
CREATE PROCEDURE [dbo].[usp_buscarVacuna]
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		vacuna v

	WHERE v.id_vacuna = @id

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Consulta1]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Consulta1]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
	 p.provincia
	,v.nombre as vacuna
	,[dbo].[ufn_obtenerPorcentajeProvVac](P.provincia, v.nombre) AS [Porcentaje de vacunados %]
				
FROM vacuna as v

	INNER JOIN
		paciente_vacuna as pv on pv.id_vacuna = v.id_vacuna
	INNER JOIN
		centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	INNER JOIN
		municipio as m on m.id_municipio = cv.id_municipio
	INNER JOIN
		provincia as p on p.id_provincia = m.id_provincia

GROUP BY
	p.provincia,v.nombre 

 ORDER BY provincia DESC, 
		 [Porcentaje de vacunados %] desc
				

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Consulta2]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Consulta 2

CREATE PROCEDURE [dbo].[usp_Consulta2]
	
AS
BEGIN
	
	SET NOCOUNT ON;

Select TOP 5
	m.nombre as Municipio
	,count(1) as [Cantidad de Dosis Aplicada]
	,[dbo].[ufn_obtenerEdadPromedioPorMunicipio](m.nombre) as [EDAD PROMEDIO]
From 
	paciente_vacuna as pv

	JOIN Centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	JOIN Municipio as m on m.id_municipio= cv.id_municipio
	JOIN paciente as pa on pa.id_paciente = pv.id_paciente
	JOIN grupo_edad as gp on gp.id_grupo_edad = pa.id_grupo_edad

where
	gp.id_grupo_edad = 3

Group by
	m.nombre, gp.id_grupo_edad

Order by 
	[Cantidad de Dosis Aplicada] DESC

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Consulta3]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Consulta 3
CREATE PROCEDURE [dbo].[usp_Consulta3]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	Select distinct
	 P.provincia
	,[dbo].[ufn_obtenerCantDosisPorProvincia](p.provincia,pv.dosis) as [3ra Dosis Cantidad Aplicada]

From 
	paciente_vacuna as pv

	JOIN Centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	JOIN Municipio as m on m.id_municipio= cv.id_municipio
	JOIN provincia p on p.id_provincia = m.id_provincia

Where 
	pv.dosis = 3

Group by
	P.provincia, m.nombre, pv. Dosis

Order by 
	[3ra Dosis Cantidad Aplicada] desc



END
GO
/****** Object:  StoredProcedure [dbo].[usp_eliminarCentroVacunacion]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DELETE
CREATE PROCEDURE [dbo].[usp_eliminarCentroVacunacion]
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		centro_vacunacion
	WHERE centro_vacunacion.id_centro_vacunacion= @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_eliminarMunicipio]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DELETE
CREATE PROCEDURE [dbo].[usp_eliminarMunicipio]
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		municipio
	WHERE municipio.id_municipio= @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_eliminarPaciente]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DELETE
CREATE PROCEDURE [dbo].[usp_eliminarPaciente]
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		paciente
	WHERE paciente.id_paciente= @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_eliminarPaciente_vacuna]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--DELETE
CREATE PROCEDURE [dbo].[usp_eliminarPaciente_vacuna]
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		paciente_vacuna
	WHERE paciente_vacuna.id_paciente_vacuna = @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_eliminarProvincia]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_eliminarProvincia]
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		provincia
	WHERE provincia.id_provincia = @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_eliminarVacuna]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--DELETE
CREATE PROCEDURE [dbo].[usp_eliminarVacuna]
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		vacuna
	WHERE vacuna.id_vacuna= @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_guardarCentroVacunacion]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_guardarCentroVacunacion]
	 @nombre as VARCHAR(150)
	 ,@id_municipio as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		centro_vacunacion(nombre, id_municipio)
	VALUES
		(@nombre, @id_municipio)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[usp_guardarMunicipio]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_guardarMunicipio]
	 @id_provincia as INT
	,@municipio as VARCHAR(255)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		municipio(id_provincia,nombre)
	VALUES
		(@id_provincia, @municipio)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[usp_guardarPaciente]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_guardarPaciente]
	 @nombres as VARCHAR(150)
	 ,@apellidos as VARCHAR(150)
	 ,@cedula as VARCHAR(15)
	 ,@fecha_nacimiento as DATE,
	 @genero as varchar(1)
	 ,@id_grupo_edad as INT
	 ,@contacto as VARCHAR(15)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		paciente(nombres,apellidos,cedula,fecha_nacimiento,genero,id_grupo_edad,contacto)
	VALUES
		(@nombres,@apellidos,@cedula,@fecha_nacimiento,@genero,@id_grupo_edad,@contacto)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[usp_guardarPaciente_vacuna]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_guardarPaciente_vacuna]
	@id_paciente as INT,
	@id_vacuna as VARCHAR(3),
	@lote as VARCHAR(15),
	@id_centro_vacunacion as INT,
	@dosis as INT,
	@fecha_vacunacion as DATE
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		paciente_vacuna(id_paciente,id_vacuna,lote,id_centro_vacunacion,dosis,fecha_vacunacion)
	VALUES
		(@id_paciente,@id_vacuna,@lote,@id_centro_vacunacion,@dosis,@fecha_vacunacion)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[usp_guardarProvincia]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_guardarProvincia]
	
	@provincia as VARCHAR(255)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		provincia(provincia)
	VALUES
		(@provincia)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[usp_guardarVacuna]    Script Date: 5/11/2021 3:06:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_guardarVacuna]
	 @nombre as VARCHAR(150)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		vacuna(nombre)
	VALUES
		(@nombre)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO
USE [master]
GO
ALTER DATABASE [vacunate] SET  READ_WRITE 
GO

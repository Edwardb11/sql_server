/* Base de Datos - Cursos Técnicos */
CREATE DATABASE ACADEMIA
GO

USE ACADEMIA
GO

CREATE TABLE [dbo].[curso_participante](
	[id_curso_participante] [int] IDENTITY(1,1) NOT NULL,
	[id_curso] [int] NOT NULL,
	[id_participante] [int] NOT NULL,
	[estado] [char](1) NULL DEFAULT ('P'),
	[fecha_registro] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[id_curso_participante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cursos](
	[id_curso] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[costo] [numeric](9, 2) NOT NULL CONSTRAINT [DF_cursos_costo]  DEFAULT ((0.00)),
	[estatus] [bit] NULL CONSTRAINT [DF__cursos__estatus__35BCFE0A]  DEFAULT ((1)),
 CONSTRAINT [PK__cursos__5D3F7502E08B4F36] PRIMARY KEY CLUSTERED 
(
	[id_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[participantes](
	[id_participante] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](75) NOT NULL,
	[apellido] [varchar](75) NOT NULL,
	[genero] [char](1) NOT NULL,
	[fecha_registro] [date] NULL DEFAULT (getdate()),
	[estatus] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id_participante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[curso_participante] ON 

GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (1, 9, 1, N'T', CAST(N'2021-10-22 15:20:14.347' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (2, 2, 2, N'T', CAST(N'2021-10-22 15:20:14.353' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (3, 8, 3, N'P', CAST(N'2021-10-22 15:20:14.357' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (4, 8, 4, N'T', CAST(N'2021-10-22 15:20:14.357' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (5, 1, 5, N'T', CAST(N'2021-10-22 15:20:14.360' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (6, 8, 6, N'C', CAST(N'2021-10-22 15:20:14.360' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (7, 8, 7, N'P', CAST(N'2021-10-22 15:20:14.360' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (8, 5, 8, N'P', CAST(N'2021-10-22 15:20:14.360' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (9, 5, 9, N'P', CAST(N'2021-10-22 15:20:14.363' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (10, 9, 10, N'T', CAST(N'2021-10-22 15:20:14.363' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (11, 8, 11, N'T', CAST(N'2021-10-22 15:20:14.367' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (12, 2, 12, N'T', CAST(N'2021-10-22 15:20:14.367' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (13, 8, 13, N'T', CAST(N'2021-10-22 15:20:14.367' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (14, 2, 14, N'C', CAST(N'2021-10-22 15:20:14.370' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (15, 9, 15, N'T', CAST(N'2021-10-22 15:20:14.370' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (16, 1, 16, N'P', CAST(N'2021-10-22 15:20:14.370' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (17, 4, 17, N'P', CAST(N'2021-10-22 15:20:14.370' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (18, 1, 18, N'T', CAST(N'2021-10-22 15:20:14.370' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (19, 1, 19, N'P', CAST(N'2021-10-22 15:20:14.373' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (20, 9, 20, N'P', CAST(N'2021-10-22 15:20:14.373' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (21, 7, 21, N'T', CAST(N'2021-10-22 15:20:14.373' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (22, 5, 22, N'P', CAST(N'2021-10-22 15:20:14.377' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (23, 1, 23, N'P', CAST(N'2021-10-22 15:20:14.377' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (24, 4, 24, N'P', CAST(N'2021-10-22 15:20:14.377' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (25, 5, 25, N'P', CAST(N'2021-10-22 15:20:14.380' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (26, 9, 26, N'P', CAST(N'2021-10-22 15:20:14.380' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (27, 2, 27, N'T', CAST(N'2021-10-22 15:20:14.380' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (28, 1, 28, N'T', CAST(N'2021-10-22 15:20:14.380' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (29, 6, 1, N'P', CAST(N'2021-10-22 15:20:25.573' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (30, 8, 2, N'T', CAST(N'2021-10-22 15:20:25.577' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (31, 5, 3, N'P', CAST(N'2021-10-22 15:20:25.577' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (32, 4, 4, N'T', CAST(N'2021-10-22 15:20:25.577' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (33, 2, 5, N'P', CAST(N'2021-10-22 15:20:25.580' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (34, 6, 6, N'T', CAST(N'2021-10-22 15:20:25.580' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (35, 2, 8, N'P', CAST(N'2021-10-22 15:20:25.580' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (36, 8, 9, N'T', CAST(N'2021-10-22 15:20:25.583' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (37, 3, 10, N'P', CAST(N'2021-10-22 15:20:25.583' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (38, 4, 11, N'P', CAST(N'2021-10-22 15:20:25.583' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (39, 9, 12, N'P', CAST(N'2021-10-22 15:20:25.587' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (40, 4, 13, N'T', CAST(N'2021-10-22 15:20:25.587' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (41, 6, 14, N'P', CAST(N'2021-10-22 15:20:25.587' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (42, 9, 16, N'P', CAST(N'2021-10-22 15:20:25.590' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (43, 6, 17, N'C', CAST(N'2021-10-22 15:20:25.590' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (44, 9, 18, N'C', CAST(N'2021-10-22 15:20:25.590' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (45, 7, 19, N'T', CAST(N'2021-10-22 15:20:25.593' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (46, 3, 20, N'P', CAST(N'2021-10-22 15:20:25.593' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (47, 4, 21, N'P', CAST(N'2021-10-22 15:20:25.593' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (48, 7, 22, N'T', CAST(N'2021-10-22 15:20:25.597' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (49, 8, 23, N'P', CAST(N'2021-10-22 15:20:25.597' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (50, 5, 24, N'P', CAST(N'2021-10-22 15:20:25.597' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (51, 3, 25, N'C', CAST(N'2021-10-22 15:20:25.600' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (52, 3, 26, N'C', CAST(N'2021-10-22 15:20:25.600' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (53, 6, 27, N'P', CAST(N'2021-10-22 15:20:25.600' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (54, 6, 28, N'T', CAST(N'2021-10-22 15:20:25.603' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (55, 8, 1, N'P', CAST(N'2021-10-22 15:20:26.050' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (56, 1, 2, N'P', CAST(N'2021-10-22 15:20:26.050' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (57, 9, 3, N'P', CAST(N'2021-10-22 15:20:26.050' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (58, 6, 5, N'P', CAST(N'2021-10-22 15:20:26.050' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (59, 4, 6, N'P', CAST(N'2021-10-22 15:20:26.053' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (60, 1, 7, N'P', CAST(N'2021-10-22 15:20:26.053' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (61, 3, 9, N'T', CAST(N'2021-10-22 15:20:26.053' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (62, 4, 10, N'P', CAST(N'2021-10-22 15:20:26.057' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (63, 2, 11, N'P', CAST(N'2021-10-22 15:20:26.057' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (64, 6, 12, N'P', CAST(N'2021-10-22 15:20:26.060' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (65, 7, 13, N'P', CAST(N'2021-10-22 15:20:26.060' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (66, 4, 14, N'T', CAST(N'2021-10-22 15:20:26.060' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (67, 2, 15, N'P', CAST(N'2021-10-22 15:20:26.060' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (68, 6, 16, N'T', CAST(N'2021-10-22 15:20:26.063' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (69, 9, 17, N'P', CAST(N'2021-10-22 15:20:26.063' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (70, 5, 18, N'P', CAST(N'2021-10-22 15:20:26.063' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (71, 2, 20, N'C', CAST(N'2021-10-22 15:20:26.067' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (72, 5, 21, N'P', CAST(N'2021-10-22 15:20:26.067' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (73, 8, 24, N'P', CAST(N'2021-10-22 15:20:26.070' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (74, 7, 25, N'T', CAST(N'2021-10-22 15:20:26.070' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (75, 3, 27, N'P', CAST(N'2021-10-22 15:20:26.070' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (76, 5, 28, N'P', CAST(N'2021-10-22 15:20:26.070' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (77, 4, 1, N'C', CAST(N'2021-10-22 15:20:26.507' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (78, 7, 2, N'C', CAST(N'2021-10-22 15:20:26.507' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (79, 6, 3, N'T', CAST(N'2021-10-22 15:20:26.510' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (80, 1, 4, N'P', CAST(N'2021-10-22 15:20:26.510' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (81, 9, 5, N'P', CAST(N'2021-10-22 15:20:26.510' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (82, 9, 8, N'T', CAST(N'2021-10-22 15:20:26.513' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (83, 7, 9, N'C', CAST(N'2021-10-22 15:20:26.513' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (84, 7, 11, N'P', CAST(N'2021-10-22 15:20:26.513' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (85, 1, 12, N'P', CAST(N'2021-10-22 15:20:26.517' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (86, 6, 13, N'P', CAST(N'2021-10-22 15:20:26.517' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (87, 9, 14, N'P', CAST(N'2021-10-22 15:20:26.517' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (88, 5, 15, N'P', CAST(N'2021-10-22 15:20:26.520' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (89, 7, 16, N'P', CAST(N'2021-10-22 15:20:26.520' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (90, 8, 17, N'P', CAST(N'2021-10-22 15:20:26.520' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (91, 2, 19, N'T', CAST(N'2021-10-22 15:20:26.520' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (92, 1, 20, N'T', CAST(N'2021-10-22 15:20:26.520' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (93, 8, 21, N'T', CAST(N'2021-10-22 15:20:26.523' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (94, 8, 22, N'P', CAST(N'2021-10-22 15:20:26.523' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (95, 6, 23, N'P', CAST(N'2021-10-22 15:20:26.523' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (96, 4, 25, N'T', CAST(N'2021-10-22 15:20:26.527' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (97, 2, 26, N'P', CAST(N'2021-10-22 15:20:26.527' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (98, 2, 1, N'P', CAST(N'2021-10-22 15:20:26.827' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (99, 9, 2, N'P', CAST(N'2021-10-22 15:20:26.830' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (100, 3, 5, N'P', CAST(N'2021-10-22 15:20:26.830' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (101, 5, 6, N'P', CAST(N'2021-10-22 15:20:26.830' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (102, 8, 8, N'T', CAST(N'2021-10-22 15:20:26.833' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (103, 6, 10, N'T', CAST(N'2021-10-22 15:20:26.833' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (104, 3, 11, N'C', CAST(N'2021-10-22 15:20:26.837' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (105, 8, 12, N'P', CAST(N'2021-10-22 15:20:26.837' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (106, 2, 13, N'P', CAST(N'2021-10-22 15:20:26.840' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (107, 5, 16, N'T', CAST(N'2021-10-22 15:20:26.840' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (108, 4, 19, N'T', CAST(N'2021-10-22 15:20:26.840' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (109, 7, 20, N'P', CAST(N'2021-10-22 15:20:26.840' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (110, 9, 21, N'P', CAST(N'2021-10-22 15:20:26.843' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (111, 3, 22, N'P', CAST(N'2021-10-22 15:20:26.843' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (112, 3, 24, N'C', CAST(N'2021-10-22 15:20:26.843' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (113, 7, 26, N'P', CAST(N'2021-10-22 15:20:26.847' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (114, 5, 27, N'P', CAST(N'2021-10-22 15:20:26.847' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (115, 3, 28, N'P', CAST(N'2021-10-22 15:20:26.847' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (116, 7, 1, N'T', CAST(N'2021-10-22 15:20:27.027' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (117, 4, 3, N'P', CAST(N'2021-10-22 15:20:27.030' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (118, 2, 4, N'P', CAST(N'2021-10-22 15:20:27.030' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (119, 5, 7, N'T', CAST(N'2021-10-22 15:20:27.030' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (120, 4, 8, N'T', CAST(N'2021-10-22 15:20:27.030' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (121, 1, 9, N'P', CAST(N'2021-10-22 15:20:27.033' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (122, 7, 12, N'P', CAST(N'2021-10-22 15:20:27.033' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (123, 1, 13, N'P', CAST(N'2021-10-22 15:20:27.037' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (124, 1, 14, N'T', CAST(N'2021-10-22 15:20:27.037' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (125, 3, 15, N'P', CAST(N'2021-10-22 15:20:27.037' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (126, 8, 16, N'P', CAST(N'2021-10-22 15:20:27.037' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (127, 1, 17, N'T', CAST(N'2021-10-22 15:20:27.040' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (128, 3, 19, N'P', CAST(N'2021-10-22 15:20:27.040' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (129, 4, 20, N'P', CAST(N'2021-10-22 15:20:27.040' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (130, 3, 21, N'P', CAST(N'2021-10-22 15:20:27.043' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (131, 1, 22, N'T', CAST(N'2021-10-22 15:20:27.043' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (132, 3, 23, N'T', CAST(N'2021-10-22 15:20:27.043' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (133, 4, 26, N'T', CAST(N'2021-10-22 15:20:27.047' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (134, 8, 28, N'P', CAST(N'2021-10-22 15:20:27.047' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (135, 3, 4, N'T', CAST(N'2021-10-22 15:20:27.210' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (136, 4, 5, N'T', CAST(N'2021-10-22 15:20:27.213' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (137, 1, 6, N'T', CAST(N'2021-10-22 15:20:27.213' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (138, 3, 7, N'P', CAST(N'2021-10-22 15:20:27.213' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (139, 3, 8, N'P', CAST(N'2021-10-22 15:20:27.217' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (140, 9, 11, N'P', CAST(N'2021-10-22 15:20:27.217' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (141, 3, 14, N'T', CAST(N'2021-10-22 15:20:27.217' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (142, 7, 17, N'P', CAST(N'2021-10-22 15:20:27.220' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (143, 2, 18, N'P', CAST(N'2021-10-22 15:20:27.220' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (144, 6, 20, N'T', CAST(N'2021-10-22 15:20:27.220' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (145, 2, 21, N'P', CAST(N'2021-10-22 15:20:27.220' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (146, 9, 22, N'P', CAST(N'2021-10-22 15:20:27.223' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (147, 4, 23, N'C', CAST(N'2021-10-22 15:20:27.223' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (148, 6, 24, N'T', CAST(N'2021-10-22 15:20:27.223' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (149, 2, 25, N'P', CAST(N'2021-10-22 15:20:27.227' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (150, 8, 26, N'P', CAST(N'2021-10-22 15:20:27.227' AS DateTime))
GO
INSERT [dbo].[curso_participante] ([id_curso_participante], [id_curso], [id_participante], [estado], [fecha_registro]) VALUES (151, 1, 27, N'P', CAST(N'2021-10-22 15:20:27.227' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[curso_participante] OFF
GO
SET IDENTITY_INSERT [dbo].[cursos] ON 

GO
INSERT [dbo].[cursos] ([id_curso], [nombre], [costo], [estatus]) VALUES (1, N'Desarrollo Web Front End Básico', CAST(5000.00 AS Numeric(9, 2)), 1)
GO
INSERT [dbo].[cursos] ([id_curso], [nombre], [costo], [estatus]) VALUES (2, N'Desarrollo Web Back End Básico', CAST(7800.00 AS Numeric(9, 2)), 1)
GO
INSERT [dbo].[cursos] ([id_curso], [nombre], [costo], [estatus]) VALUES (3, N'Base de Datos Intermedio', CAST(10000.00 AS Numeric(9, 2)), 1)
GO
INSERT [dbo].[cursos] ([id_curso], [nombre], [costo], [estatus]) VALUES (4, N'Fundamentos de Redes', CAST(14000.00 AS Numeric(9, 2)), 1)
GO
INSERT [dbo].[cursos] ([id_curso], [nombre], [costo], [estatus]) VALUES (5, N'Desarrollo de APIs REST con Laravel', CAST(11000.00 AS Numeric(9, 2)), 1)
GO
INSERT [dbo].[cursos] ([id_curso], [nombre], [costo], [estatus]) VALUES (6, N'Administración de Servidores Linux', CAST(18000.00 AS Numeric(9, 2)), 1)
GO
INSERT [dbo].[cursos] ([id_curso], [nombre], [costo], [estatus]) VALUES (7, N'Fundamentos Esenciales de SCRUM', CAST(16000.00 AS Numeric(9, 2)), 1)
GO
INSERT [dbo].[cursos] ([id_curso], [nombre], [costo], [estatus]) VALUES (8, N'Desarrollo de Aplicaciones con MVC5', CAST(11000.00 AS Numeric(9, 2)), 1)
GO
INSERT [dbo].[cursos] ([id_curso], [nombre], [costo], [estatus]) VALUES (9, N'Motores de Plantillas y Frameworks de Front End', CAST(65000.00 AS Numeric(9, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[cursos] OFF
GO
SET IDENTITY_INSERT [dbo].[participantes] ON 

GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (1, N'Marielys', N'Geraldino Marte', N'F', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (2, N'Raudy Ramon', N'Garcia Rodriguez', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (3, N'Helmer Enrique', N'Sosa Mendoza', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (4, N'Eidher', N'Cruz Ramirez', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (5, N'Genesis', N'Diaz Holguin', N'F', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (6, N'Roberlina', N'Caminero Holguin', N'F', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (7, N'Yudermi Mabell', N'Hernandez Cruz', N'F', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (8, N'Carlos Miguel', N'Castaños Amparo', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (9, N'Juan  Miguel', N'Hernandez Lopez', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (10, N'Luisa Vereni', N'Contreras Candelario', N'F', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (11, N'Leudys Enmanuel', N'Batista Rosario', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (12, N'Alisson', N'Almonte Paulino', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (13, N'John Anthony', N'Garcia Perez', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (14, N'Randy Antonio', N'Mora Florentino', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (15, N'Miguel Etarlin', N'De La Cruz Caceres', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (16, N'Hector Jose', N'Aramboles Castillo', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (17, N'Edward', N'Brito Diaz', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (18, N'Julio Enrique', N'Ureña Nuñez', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (19, N'Marcos Jose', N'Matias Collado', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (20, N'Enmanuel', N'Ruiz Valdez', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (21, N'Luz Mariel', N'Rosario Garcia', N'F', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (22, N'Jose Daniel', N'Orrego Suarez', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (23, N'Robert', N'Jimenez Polonia', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (24, N'Yessica Maria', N'Villavizar Hernandez', N'F', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (25, N'Ericsson', N'Reyes Santos', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (26, N'Jhonny', N'De Leon De La Cruz', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (27, N'Argenis Jose', N'Gonzalez Garcia', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
INSERT [dbo].[participantes] ([id_participante], [nombre], [apellido], [genero], [fecha_registro], [estatus]) VALUES (28, N'Jorge Omar', N'Malena Jose', N'M', CAST(N'2021-10-22' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[participantes] OFF
GO
ALTER TABLE [dbo].[curso_participante]  WITH CHECK ADD  CONSTRAINT [curso_participante_fk_id_curso] FOREIGN KEY([id_curso])
REFERENCES [dbo].[cursos] ([id_curso])
GO
ALTER TABLE [dbo].[curso_participante] CHECK CONSTRAINT [curso_participante_fk_id_curso]
GO
ALTER TABLE [dbo].[curso_participante]  WITH CHECK ADD  CONSTRAINT [curso_participante_fk_id_participante] FOREIGN KEY([id_participante])
REFERENCES [dbo].[participantes] ([id_participante])
GO
ALTER TABLE [dbo].[curso_participante] CHECK CONSTRAINT [curso_participante_fk_id_participante]
GO

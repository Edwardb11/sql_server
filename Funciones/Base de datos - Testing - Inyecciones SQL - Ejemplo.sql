CREATE DATABASE [testing]
GO

USE [testing]
GO

CREATE TABLE [dbo].[usuarios](
	[user_name] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[usuarios] ([user_name], [email]) VALUES (N'basededatos123', N'basededatos@hotmail.com')
GO
INSERT [dbo].[usuarios] ([user_name], [email]) VALUES (N'prueba123', N'prueba@hotmail.com')
GO
INSERT [dbo].[usuarios] ([user_name], [email]) VALUES (N'hola', N'hola@hotmail.com')
GO

-- =============================================
-- Author:		Base de Datos II
-- Create date: 22/10/2021
-- Description:	Busca un usuario determinado.
-- =============================================
CREATE PROCEDURE [dbo].[uspSearchUser]
	@user_name AS VARCHAR(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		*
	FROM
		usuarios
	WHERE
		[user_name] = @user_name
	;
END
GO

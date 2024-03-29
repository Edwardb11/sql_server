USE [ACADEMIA]
GO
-- =============================================
-- Author:		Base de Datos II
-- Create date: 22/10/2021
-- Description:	Actualiza un curso determinado
--              utilizando parámetros nulos.
-- =============================================
CREATE PROCEDURE [dbo].[usp_actualizarCurso2]
	@id AS INT,
	@nombre AS VARCHAR(255) = null,
	@costo AS NUMERIC(9,2) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE
		cursos
	SET
		nombre = ISNULL(@nombre, nombre),
		costo = ISNULL(@costo, costo)
	WHERE
		id_curso = @id
	;
END

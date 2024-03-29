USE [ACADEMIA]
GO
-- =============================================
-- Author:		Base de Datos II
-- Create date: 22/10/2021
-- Description:	Actualiza un curso determinado.
-- =============================================
CREATE PROCEDURE [dbo].[usp_actualizarCurso]
	@id AS INT,
	@nombre AS VARCHAR(255),
	@costo AS NUMERIC(9,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE
		cursos
	SET
		nombre = @nombre,
		costo = @costo
	WHERE
		id_curso = @id
	;
END

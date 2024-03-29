USE [ACADEMIA]
GO
-- ======================================================
-- Author:		Base de Datos II
-- Create date: 22/10/2021
-- Description:	Busca info. de un curso determinado
--              (extrae todo si el parámetro id es nulo)
-- ======================================================
CREATE PROCEDURE [dbo].[usp_buscarCurso]
	@id AS INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		nombre AS curso,
		costo,
		CASE estatus
			WHEN 1 THEN 'Activo'
			ELSE 'Inactivo'
		END AS estado
	FROM
		cursos
	WHERE
		id_curso = COALESCE(@id, id_curso, @id)
		           --ISNULL(@id, id_curso)
	;
END
-- =========================================================================
-- Author:		Base de Datos II
-- Create date: 22/10/2021
-- Description:	Coloca su estado a inactivo un curso determinado dado su id.
-- =========================================================================
CREATE PROCEDURE [dbo].[usp_eliminarCurso]
	@id AS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE
		cursos
	SET
		estatus = 0
	WHERE
		id_curso = @id
	;

	SELECT
		'Se ha eliminado correctamente el curso ' + (SELECT nombre FROM cursos WHERE id_curso = @id) AS resultado
	;
END

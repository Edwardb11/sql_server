-- =====================================
-- Author:		Base de Datos II
-- Create date: 22/10/2021
-- Description:	Registra un nuevo curso.
-- =====================================
CREATE PROCEDURE [dbo].[usp_guardarCurso]
	@nombre AS VARCHAR(255),
	@costo AS NUMERIC(9,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO
		cursos(nombre, costo)
	VALUES
		(@nombre, @costo)
	;

	-- SCOPE_IDENTITY(): retorna el id de la última tupla insertada bajo este contexto y conexión
	SELECT
		SCOPE_IDENTITY() AS id
	;
END

USE [ACADEMIA]
GO
-- =========================================================
-- Author:		Base de Datos II
-- Create date: 22/10/2021
-- Description:	Extrae la cantidad de estudiantes por curso.
-- =========================================================
CREATE PROCEDURE [dbo].[usp_cantidadEstudiantesCurso]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		c.nombre AS curso,
		SUM(CASE WHEN cp.estado = 'P' THEN 1 ELSE 0 END) AS estudiantes_activos,
		SUM(CASE WHEN cp.estado = 'T' THEN 1 ELSE 0 END) AS estudiantes_terminaron,
		SUM(CASE WHEN cp.estado = 'C' THEN 1 ELSE 0 END) AS estudiantes_cancelaron
	FROM
		cursos AS c
			INNER JOIN
		curso_participante AS cp ON cp.id_curso = cp.id_curso
			INNER JOIN
		participantes AS p ON cp.id_participante = p.id_participante
	WHERE
		c.estatus = 1
	GROUP BY
		c.nombre
END

SELECT
	*
FROM
	cursos
;

SELECT
	*
FROM
	participantes
;

SELECT
	*
FROM
	curso_participante
;

-- CRUD --
-- C
EXEC dbo.usp_guardarCurso
	@nombre = 'Curso de Prueba xD 123',
	@costo = 500
;

-- R
EXEC dbo.usp_buscarCurso
	@id = 11
;

-- U
select * from cursos where id_curso = 10;

DECLARE
	@nombre AS VARCHAR(255),
	@monto AS NUMERIC(9,2)
;

SELECT
	@nombre = 'Curso de Excel Avanzado',
	@monto = 0
FROM
	cursos
WHERE
	id_curso = 10
;

print @nombre;
print @monto;

EXEC dbo.usp_actualizarCurso2
	@id = 10,
	@nombre = @nombre,
	@costo = @monto
;

select * from cursos where id_curso = 10;



-- D
EXEC dbo.usp_eliminarCurso
	@id = 10
;


EXEC dbo.usp_cantidadEstudiantesCurso;
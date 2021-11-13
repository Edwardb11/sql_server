-- Ejemplo utilizado con Enmanuel --
DECLARE
	@cantidad_masculino AS INT = 0
;

-- SET @cantidad_masculino  = (SELECT COUNT(1) FROM employees WHERE gender = 'M');

SELECT
	@cantidad_masculino = COUNT(1)
FROM
	employees
WHERE
	gender = 'M'
;

PRINT @cantidad_masculino;

SELECT
	*,
	-- @cantidad_masculino AS cantidad_masculino,
	(SELECT COUNT(1) FROM employees WHERE gender = 'M')
FROM
	employees
;
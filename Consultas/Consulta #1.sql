-- 1ra Consulta -- BD HR del sistema
WITH empleados AS
(
	SELECT
		r.region_name AS region,
		c.country_name AS pais,
		d.department_name AS departamento,
		SUM(e.salary) AS total_salario,
		COUNT(DISTINCT e.employee_id) AS cant_empleados,
		COUNT(dp.employee_id) AS cant_dependientes
	FROM
		employees AS e
			INNER JOIN
		departments AS d ON e.department_id = d.department_id
			INNER JOIN
		locations AS l ON d.location_id = l.location_id
			INNER JOIN
		countries AS c ON l.country_id = c.country_id
			INNER JOIN
		regions AS r ON c.region_id = r.region_id
			LEFT JOIN
		dependents AS dp ON e.employee_id = dp.employee_id
	GROUP BY
		d.department_name,
		c.country_name,
		r.region_name
),
mayores_casos AS
(
	SELECT
		*,
		ROW_NUMBER() OVER(ORDER BY total_salario DESC, cant_dependientes DESC) AS row_id
	FROM
		empleados
),
menores_casos AS
(
	SELECT
		*,
		ROW_NUMBER() OVER(ORDER BY total_salario ASC, cant_dependientes ASC) AS row_id
	FROM
		empleados
)
SELECT
	*,
	'Mayores casos' AS etiqueta
FROM
	mayores_casos
WHERE
	row_id <= 3

UNION

SELECT
	*,
	'Menores casos' AS etiqueta
FROM
	menores_casos
WHERE
	row_id <= 3
;
-- 3ra consulta --
WITH puestos AS
(
	SELECT
		j.job_id AS id_puesto,
		j.job_title AS puesto,
		COUNT(1) AS cant_empleados
	FROM
		employees AS e
			INNER JOIN
		jobs AS j ON e.job_id = j.job_id
	GROUP BY
		j.job_title,
		j.job_id
),
empleados AS
(
	SELECT
		CONCAT(e1.first_name, ' ', e1.last_name) AS empleado,
		e1.salary,
		d.department_name AS departamento,
		CASE
			WHEN e1.manager_id IS NOT NULL THEN
			(
				SELECT
					CONCAT(m.first_name, ' ', m.last_name)
				FROM
					employees AS m
				WHERE
					m.employee_id = e1.manager_id
			)
			ELSE 'N/A'
		END AS manager,
		c.country_name AS pais,
		CONCAT(l.state_province, ', ', l.street_address) AS locacion,
		CASE
			WHEN EXISTS
			(
				SELECT
					1
				FROM
					dependents AS dp
				WHERE
					e1.employee_id = dp.employee_id
			) THEN 'Sí'
			ELSE 'No'
		END AS tiene_dependientes,
		e1.job_id,
		ROW_NUMBER() OVER(PARTITION BY e1.job_id ORDER BY e1.salary DESC) AS row_id_max,
		ROW_NUMBER() OVER(PARTITION BY e1.job_id ORDER BY e1.salary ASC) AS row_id_min
	FROM
		employees AS e1
			INNER JOIN
		departments AS d ON e1.department_id = d.department_id
			INNER JOIN
		locations AS l ON d.location_id = l.location_id
			INNER JOIN
		countries AS c ON l.country_id = c.country_id
)
SELECT
	*
FROM
	puestos AS p
		INNER JOIN
	empleados AS e ON p.id_puesto = e.job_id
WHERE
	e.row_id_max <= 2

UNION

SELECT
	*
FROM
	puestos AS p
		INNER JOIN
	empleados AS e ON p.id_puesto = e.job_id
WHERE
	e.row_id_min <= 2
;
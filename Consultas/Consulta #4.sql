-- 4ta consulta --
WITH managers AS
(
	SELECT
		e.manager_id,
		d.department_id,
		d.department_name,
		COUNT(1) AS cant_empleados,
		SUM(e.salary) AS total_salario,
		MAX(e.salary) AS max_salario,
		MIN(e.salary) AS min_salario
	FROM
		employees AS e
			INNER JOIN
		departments AS d ON e.department_id = d.department_id
	WHERE
		e.manager_id IS NOT NULL
	GROUP BY
		e.manager_id,
		d.department_name,
		d.department_id
),
empleados AS
(
	SELECT
		e1.department_id,
		CONCAT(e1.first_name, ' ', e1.last_name) AS empleado,
		j.job_title AS puesto,
		e1.salary,
		ROW_NUMBER() OVER(PARTITION BY e1.department_id ORDER BY e1.salary DESC) AS row_id
	FROM
		employees AS e1
			INNER JOIN
		jobs AS j ON e1.job_id = j.job_id
),
reporte_manager AS
(
	SELECT
		m.manager_id,
		CONCAT(e2.first_name, ' ', e2.last_name) AS manager,
		m.department_id,
		m.department_name,
		m.cant_empleados AS cant_empleado_depto,
		SUM(m.cant_empleados) OVER(PARTITION BY m.manager_id) AS total_empleados,
		SUM(m.total_salario) OVER(PARTITION BY m.manager_id) AS total_salario,
		CAST(
			SUM(m.total_salario) OVER(PARTITION BY m.manager_id) /
			SUM(m.cant_empleados) OVER(PARTITION BY m.manager_id) AS NUMERIC(9, 2)
		) AS promedio_total,
		m.min_salario,
		m.max_salario
	FROM
		managers AS m
			INNER JOIN
		employees AS e2 ON e2.employee_id = m.manager_id
)
SELECT
	*
FROM
	reporte_manager AS rm
		INNER JOIN
	empleados AS e ON rm.department_id = e.department_id
WHERE
	e.row_id <= 2
;
-- Uso de CTE múltiples --
WITH empleadosSalario AS
(
	SELECT
		e.employee_id,
		e.department_id,
		e.first_name,
		e.last_name,
		e.salary,
		ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS [row_number]
	FROM
		employees AS e
),
empleadoSalarioDepto AS
(
	SELECT
		es.*,
		d.department_name
	FROM
		empleadosSalario AS es
			INNER JOIN
		departments AS d ON es.department_id = d.department_id
)
SELECT
	*
FROM
	empleadoSalarioDepto
WHERE
	[row_number] IN (1, 2)
;
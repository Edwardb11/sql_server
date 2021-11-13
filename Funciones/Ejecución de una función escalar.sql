SELECT
	department_name,
	dbo.ufn_obtenerMaximoSalarioDepto(department_id) AS max_salario
FROM
	departments
WHERE
	dbo.ufn_obtenerMaximoSalarioDepto(department_id) > 9000
;

-- Comprobación
-- SELECT * FROM employees WHERE department_id = 6 ORDER BY salary DESC;
CREATE FUNCTION ufn_obtenerMaximoSalarioDepto
(
    @id_depto AS INT
)
RETURNS INT
AS
BEGIN
    RETURN (SELECT MAX(salary) FROM employees WHERE department_id = @id_depto);
END
GO
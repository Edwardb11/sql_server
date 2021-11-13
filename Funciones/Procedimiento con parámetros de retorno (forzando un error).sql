CREATE PROCEDURE usp_empleadoPorId
    @id AS INT
AS
BEGIN
    RETURN
    (
        SELECT
            first_name
        FROM
            employees
        WHERE
            employee_id = @id
    );
END
GO
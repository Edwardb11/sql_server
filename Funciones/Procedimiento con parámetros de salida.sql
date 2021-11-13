CREATE PROCEDURE usp_cantidadEmpleadosPorGenero
    @genero AS CHAR(1),
    @cantidad AS INT OUTPUT -- OUT / OUTPUT: Parámetro de salida
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    SELECT
        @cantidad = COUNT(1)
    FROM
       employees AS e
    WHERE
      e.gender = @genero
    ;
END
GO
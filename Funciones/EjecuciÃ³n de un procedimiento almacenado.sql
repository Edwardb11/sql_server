DECLARE
    @total AS INT
;

-- Sin especificar el nombre del parámetro debe respetar el orden en que fueron declarados --
/*EXECUTE
    dbo.usp_cantidadEmpleadosPorGenero 'M', @total OUT
;*/


-- Especificando el nombre de los parámetros, pues no importa que el orden no sea congruente a como fueron declarados --
EXECUTE
    dbo.usp_cantidadEmpleadosPorGenero
        @cantidad = @total OUT,
        @genero = 'M'
;

PRINT @total;
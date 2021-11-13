--LISTA DE CRUD PARA CADA ENTIDAD

--ENTIDAD PROVINCIA

--CREATE

CREATE PROCEDURE usp_guardarProvincia
	
	@provincia as VARCHAR(255)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		provincia(provincia)
	VALUES
		(@provincia)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO

--READ

CREATE PROCEDURE usp_buscarProvincia
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		provincia p

	WHERE p.id_provincia = @id

END
GO


--UPDATE
CREATE PROCEDURE usp_actualizarProvincia
	@id as INT,
	@provincia as varchar
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		provincia
	SET
		provincia = @provincia
	
	WHERE provincia.id_provincia = @id			
	;

END
GO

--DELETE
CREATE PROCEDURE usp_eliminarProvincia
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		provincia
	WHERE provincia.id_provincia = @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO

--ENTIDAD MUNICIPIO

--CREATE

CREATE PROCEDURE usp_guardarMunicipio
	 @id_provincia as INT
	,@municipio as VARCHAR(255)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		municipio(id_provincia,nombre)
	VALUES
		(@id_provincia, @municipio)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO


--READ

CREATE PROCEDURE usp_buscarMunicipio
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		municipio m

	WHERE m.id_municipio = @id

END
GO


--UPDATE
CREATE PROCEDURE usp_actualizarMunicipio
	@id as INT,
	@municipio as varchar
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		municipio
	SET
		nombre = @municipio
	
	WHERE municipio.id_municipio = @id			
	;

END
GO

--DELETE
CREATE PROCEDURE usp_eliminarMunicipio
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		municipio
	WHERE municipio.id_municipio= @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO


--ENTIDAD GRUPO_EDAD
--READ
CREATE PROCEDURE usp_buscarGrupoEdad
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		grupo_edad ge

	WHERE ge.id_grupo_edad = @id

END
GO
--UPDATE
CREATE PROCEDURE usp_actualizarGrupoEdad
	@id as INT,
	@grupo as varchar
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		grupo_edad
	SET
		grupo = @grupo
	
	WHERE grupo_edad.id_grupo_edad = @id			
	;

END
GO


--ENTIDAD PACIENTE

--CREATE
select * from paciente

CREATE PROCEDURE usp_guardarPaciente
	 @nombres as VARCHAR(150)
	 ,@apellidos as VARCHAR(150)
	 ,@cedula as VARCHAR(15)
	 ,@fecha_nacimiento as DATE,
	 @genero as varchar(1)
	 ,@id_grupo_edad as INT
	 ,@contacto as VARCHAR(15)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		paciente(nombres,apellidos,cedula,fecha_nacimiento,genero,id_grupo_edad,contacto)
	VALUES
		(@nombres,@apellidos,@cedula,@fecha_nacimiento,@genero,@id_grupo_edad,@contacto)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO

--READ
CREATE PROCEDURE usp_buscarPaciente
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		paciente p

	WHERE p.id_paciente = @id

END
GO


--UPDATE
CREATE PROCEDURE usp_actualizarPaciente
	@id as INT,
	@contacto varchar
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		paciente
	SET
		contacto = @contacto
	
	WHERE paciente.id_paciente = @id			
	;

END
GO

--DELETE
CREATE PROCEDURE usp_eliminarPaciente
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		paciente
	WHERE paciente.id_paciente= @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO


--ENTIDAD Vacuna

--CREATE
CREATE PROCEDURE usp_guardarVacuna
	 @nombre as VARCHAR(150)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		vacuna(nombre)
	VALUES
		(@nombre)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO
--READ
CREATE PROCEDURE usp_buscarVacuna
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		vacuna v

	WHERE v.id_vacuna = @id

END
GO
--DELETE
CREATE PROCEDURE usp_eliminarVacuna
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		vacuna
	WHERE vacuna.id_vacuna= @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO


--ENTIDAD CENTRO VACUNACION

--CREATE

CREATE PROCEDURE usp_guardarCentroVacunacion
	 @nombre as VARCHAR(150)
	 ,@id_municipio as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		centro_vacunacion(nombre, id_municipio)
	VALUES
		(@nombre, @id_municipio)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO

--READ
CREATE PROCEDURE usp_buscarCentroVacunacion
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		centro_vacunacion cv

	WHERE cv.id_centro_vacunacion = @id

END
GO


--UPDATE
CREATE PROCEDURE usp_actualizarCentroVacunacion
	@id as int,
	@nombre as varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		centro_vacunacion
	SET
		nombre = @nombre
	
	WHERE centro_vacunacion.id_centro_vacunacion = @id			
	;

END
GO

--DELETE
CREATE PROCEDURE usp_eliminarCentroVacunacion
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		centro_vacunacion
	WHERE centro_vacunacion.id_centro_vacunacion= @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO


--ENTIDAD PACIENTE_VACUNA

--CREATE


CREATE PROCEDURE usp_guardarPaciente_vacuna
	@id_paciente as INT,
	@id_vacuna as VARCHAR(3),
	@lote as VARCHAR(15),
	@id_centro_vacunacion as INT,
	@dosis as INT,
	@fecha_vacunacion as DATE
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO 
		paciente_vacuna(id_paciente,id_vacuna,lote,id_centro_vacunacion,dosis,fecha_vacunacion)
	VALUES
		(@id_paciente,@id_vacuna,@lote,@id_centro_vacunacion,@dosis,@fecha_vacunacion)
	;

	--SELECT MAX(p.id_provincia) from provincia p;
	SELECT SCOPE_IDENTITY() AS Id;
	--@@IDENTITY
END
GO

--READ
CREATE PROCEDURE usp_buscarPaciente_vacuna
	
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		*
	FROM
		paciente_vacuna pv

	WHERE pv.id_paciente_vacuna = @id

END
GO


--DELETE
CREATE PROCEDURE usp_eliminarPaciente_vacuna
	@id as INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM
		paciente_vacuna
	WHERE paciente_vacuna.id_paciente_vacuna = @id			
	;

	SELECT
	'Se ha eliminado' as Resultado
	;

END
GO


/*CREACION DE SP PARA CONSULTAS*/

--Consulta 1

ALTER PROCEDURE usp_Consulta1
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
	 p.provincia
	,v.nombre as vacuna
	,[dbo].[ufn_obtenerPorcentajeProvVac](P.provincia, v.nombre) AS [Porcentaje de vacunados %]
				
FROM vacuna as v

	INNER JOIN
		paciente_vacuna as pv on pv.id_vacuna = v.id_vacuna
	INNER JOIN
		centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	INNER JOIN
		municipio as m on m.id_municipio = cv.id_municipio
	INNER JOIN
		provincia as p on p.id_provincia = m.id_provincia

GROUP BY
	p.provincia,v.nombre 

 ORDER BY provincia DESC, 
		 [Porcentaje de vacunados %] desc
				

END
GO

--Consulta 2

ALTER PROCEDURE usp_Consulta2
	
AS
BEGIN
	
	SET NOCOUNT ON;

Select TOP 5
	m.nombre as Municipio
	,count(1) as [Cantidad de Dosis Aplicada]
	,[dbo].[ufn_obtenerEdadPromedioPorMunicipio](m.nombre) as [EDAD PROMEDIO]
From 
	paciente_vacuna as pv

	JOIN Centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	JOIN Municipio as m on m.id_municipio= cv.id_municipio
	JOIN paciente as pa on pa.id_paciente = pv.id_paciente
	JOIN grupo_edad as gp on gp.id_grupo_edad = pa.id_grupo_edad

where
	gp.id_grupo_edad = 3

Group by
	m.nombre, gp.id_grupo_edad

Order by 
	[Cantidad de Dosis Aplicada] DESC

END
GO



--Consulta 3
alter PROCEDURE usp_Consulta3
	
AS
BEGIN
	
	SET NOCOUNT ON;

	Select distinct
	 P.provincia
	,[dbo].[ufn_obtenerCantDosisPorProvincia](p.provincia,pv.dosis) as [3ra Dosis Cantidad Aplicada]

From 
	paciente_vacuna as pv

	JOIN Centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	JOIN Municipio as m on m.id_municipio= cv.id_municipio
	JOIN provincia p on p.id_provincia = m.id_provincia

Where 
	pv.dosis = 3

Group by
	P.provincia, m.nombre, pv. Dosis

Order by 
	[3ra Dosis Cantidad Aplicada] desc



END
GO



--FUNCIONES ESCALARES



--FUNCION 1
--FUNCION PARA CONOCER LA EDAD PROMEDIO SEGUN EL MUNICIPIO

ALTER FUNCTION ufn_obtenerEdadPromedioPorMunicipio 
(
	@municipio as varchar(100)
)
RETURNS INT
AS
BEGIN
	RETURN (SELECT AVG(cast(datediff(dd,pa.fecha_nacimiento,GETDATE()) /  365.25 as int)) AS edad

	From 
	paciente_vacuna as pv

	JOIN Centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	JOIN Municipio as m on m.id_municipio= cv.id_municipio
	JOIN paciente as pa on pa.id_paciente = pv.id_paciente
	JOIN grupo_edad as gp on gp.id_grupo_edad = pa.id_grupo_edad

where
	m.nombre = @municipio and gp.id_grupo_edad = 3);

END
GO

SELECT [dbo].[ufn_obtenerEdadPromedioPorMunicipio](5);
GO


--FUNCION 2
--FUNCION PARA CONOCER LA CANTIDAD DE UNA DETERMINADA DOSIS APLICADA EN UN DETERMINADA PROVINCIA


alter FUNCTION ufn_obtenerCantDosisPorProvincia
(
	@provincia as Varchar(100),
	@dosis as INT
)
RETURNS INT
AS
BEGIN
	RETURN (Select count(1) as [Cantidad Aplicada]

From 
	paciente_vacuna as pv

	JOIN Centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	JOIN Municipio as m on m.id_municipio= cv.id_municipio
	JOIN provincia p on p.id_provincia = m.id_provincia

Where 
	pv.dosis = @dosis and p.provincia = @provincia


	);

END
GO


--FUNCION 3
--FUNCION el porcentaje de vacunados


alter FUNCTION ufn_obtenerPorcentajeProvVac
(
	@provincia as VARCHAR(100),
	@vacuna as varchar(100)
)
RETURNS INT
AS
BEGIN
	RETURN (SELECT
	CAST(
			((CONVERT(float,COUNT(1)) / (SELECT COUNT(1) FROM paciente_vacuna))*100
		 ) AS NUMERIC(10,2)
		) AS [Porcentaje de vacunados %]
				
FROM vacuna as v

	INNER JOIN
		paciente_vacuna as pv on pv.id_vacuna = v.id_vacuna
	INNER JOIN
		centro_vacunacion as cv on cv.id_centro_vacunacion = pv.id_centro_vacunacion
	INNER JOIN
		municipio as m on m.id_municipio = cv.id_municipio
	INNER JOIN
		provincia as p on p.id_provincia = m.id_provincia


		
	WHERE p.provincia = @provincia and v.nombre = @vacuna

	group by p.provincia, V.id_vacuna
	

	);
END
GO

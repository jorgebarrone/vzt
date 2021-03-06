USE [ORGANIZACION_VZT]
GO
/****** Object:  Schema [DATAWHRH]    Script Date: 14/03/2017 10:02:14 p. m. ******/
CREATE SCHEMA [DATAWHRH]
GO
/****** Object:  Schema [pintransf]    Script Date: 14/03/2017 10:02:14 p. m. ******/
CREATE SCHEMA [pintransf]
GO
/****** Object:  Schema [pinuser]    Script Date: 14/03/2017 10:02:14 p. m. ******/
CREATE SCHEMA [pinuser]
GO
/****** Object:  Schema [usrapqp]    Script Date: 14/03/2017 10:02:14 p. m. ******/
CREATE SCHEMA [usrapqp]
GO
/****** Object:  Schema [usrAutentifica]    Script Date: 14/03/2017 10:02:15 p. m. ******/
CREATE SCHEMA [usrAutentifica]
GO
/****** Object:  Schema [usrBelts]    Script Date: 14/03/2017 10:02:15 p. m. ******/
CREATE SCHEMA [usrBelts]
GO
/****** Object:  Schema [usrDesempeno]    Script Date: 14/03/2017 10:02:15 p. m. ******/
CREATE SCHEMA [usrDesempeno]
GO
/****** Object:  Schema [usrEstVzt]    Script Date: 14/03/2017 10:02:15 p. m. ******/
CREATE SCHEMA [usrEstVzt]
GO
/****** Object:  Schema [usrOrgVzt]    Script Date: 14/03/2017 10:02:15 p. m. ******/
CREATE SCHEMA [usrOrgVzt]
GO
/****** Object:  Schema [usrOrgVzt_BB]    Script Date: 14/03/2017 10:02:15 p. m. ******/
CREATE SCHEMA [usrOrgVzt_BB]
GO
/****** Object:  Schema [usrRHExamenes]    Script Date: 14/03/2017 10:02:16 p. m. ******/
CREATE SCHEMA [usrRHExamenes]
GO
/****** Object:  Schema [usrsigma]    Script Date: 14/03/2017 10:02:16 p. m. ******/
CREATE SCHEMA [usrsigma]
GO
/****** Object:  Schema [usrSistemasRH]    Script Date: 14/03/2017 10:02:16 p. m. ******/
CREATE SCHEMA [usrSistemasRH]
GO
/****** Object:  StoredProcedure [dbo].[ConsultaPuestosVZT]    Script Date: 14/03/2017 10:02:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ConsultaPuestosVZT]  
	@IdNivelPuesto as varchar(10) = '0',  
	@Puesto as varchar(10) = '0'  
as  
  
select	Empresa			as emp_nid,  
		id_nivel_puesto as pue_id,  
		Desc_esp		as pue_cdescripcion,   
		Puesto			as pue_cid_empresa,   
		id_Nivel		as niv_nid,  
		clave = 1   
from	VT_Puesto  
where	id_nivel_puesto = @IdNivelPuesto and
		puesto			= @Puesto

GO
/****** Object:  StoredProcedure [dbo].[ConsultaPuestosVZT_RespCACM11Nov09]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext ConsultaPuestosVZT 
--ConsultaPuestosVZT 42,702
  
--select *
--from VT_Puesto  
--where id_nivel_puesto=42
--and puesto=702

  
--nivel_puesto: 181 Clave_puesto:1147  
  
--ConsultaPuestosVZT 181,1147  
  
CREATE procedure [dbo].[ConsultaPuestosVZT_RespCACM11Nov09]  
@IdNivelPuesto as varchar(10)='0',  
@Puesto as varchar(10)='0'
  
as  
  
select Empresa as emp_nid,  
       id_nivel_puesto as pue_id,  
       Desc_esp as pue_cdescripcion,   
       Puesto as pue_cid_empresa,   
       id_Nivel as niv_nid,  
       clave=1   
from VT_Puesto  
where id_nivel_puesto=@IdNivelPuesto   
and puesto=@Puesto  
  
--select * from VT_Puesto

GO
/****** Object:  StoredProcedure [dbo].[ConsultaPuestosxNivelVZT]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ConsultaPuestosxNivelVZT]
    @nemp_nid int=0,    
    @npue_nid int,  
    @niv_nid int  

as

BEGIN    
SET NOCOUNT ON    
  
DECLARE @strSQL varchar(5000),@intAnd numeric     
set @intAnd=0     

--	   Empresa as emp_nid,
--       id_nivel_puesto as pue_id,
--       Desc_esp as pue_cdescripcion, 
--       Puesto as pue_cid_empresa, 
--       id_Nivel as niv_nid,
  
SET @strSQL = '  select Empresa as emp_nid,  id_nivel_puesto as pue_nid, Desc_esp as pue_cdescripcion,'
SET @strSQL = @strSQL + '  Puesto as pue_cid_empresa, id_Nivel as niv_nid ' 
SET @strSQL = @strSQL + ' from VT_Puesto '  
  
  
IF (@nemp_nid>0)    
BEGIN     
 set @strSQL= @strSQL + ' WHERE '     
 set @strSQL= @strSQL + ' Empresa = ' + convert(varchar,@nemp_nid)     
 set @intAnd=1    
End    
IF (@npue_nid>0)    
begin     
 if (@intAnd=1)     
 set @strSQL= @strSQL + ' and '     
 Else     
 begin     
  set @strSQL= @strSQL + ' WHERE '     
  set @intAnd=1     
 End     
 set @strSQL= @strSQL + ' id_nivel_puesto =' + convert(varchar,@npue_nid)   
End     
IF (@niv_nid>0)    
begin     
 if (@intAnd=1)     
 set @strSQL= @strSQL + ' and '     
 Else     
 begin     
  set @strSQL= @strSQL + ' WHERE '     
  set @intAnd=1     
 End     
 set @strSQL= @strSQL + ' id_Nivel =' + convert(varchar,@niv_nid)   
End     
  
set @strSQL= @strSQL + ' order by 3'  
EXEC (@strSQL)  
    
SET NOCOUNT OFF    
END

GO
/****** Object:  StoredProcedure [dbo].[DP_SpFindIdVzt]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---DP_SpFindIdVzt 5000,46014  
CREATE procedure [dbo].[DP_SpFindIdVzt]  
@Empresa as int=0,  
@Empleado as int=0  
  
as  
select * into #Empleados from dbo.v_empleadosverzatec  

select * from #Empleados  
where empresa=@Empresa  
and Empleado=@Empleado 
--select * from dbo.v_empleadosverzatec  
--where empresa=@Empresa  
--and Empleado=@Empleado

GO
/****** Object:  StoredProcedure [dbo].[ob]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[ob] 
	@name varchar(30),
	@pre varchar(300)='',
	@type varchar(1)='',
	@sintype bit=0
as
select  case @sintype
		when 0 then type
		when 1 then ''
		end,
--	type, 
	substring(@pre+substring(name, 1, 50), 1,70)
	,' --('+convert(varchar(20), uid)+')'+convert(varchar(12), crdate)
from 	sysobjects
where 	name like '%'+@name+'%'
and	case @type 
		when '' then @type
		else type
	end = @type
order	by type, name

GO
/****** Object:  StoredProcedure [dbo].[PADEAdmin_AreaOrganizacional]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--PADEAdmin_AreaOrganizacional 1--Verzatec MEX
--PADEAdmin_AreaOrganizacional 2--Verzatec USA
--PADEAdmin_AreaOrganizacional 3--Verzatec EUROPA
--PADEAdmin_AreaOrganizacional 0--TODO Verzatec
CREATE procedure [dbo].[PADEAdmin_AreaOrganizacional] 
 @Direccion varchar(500)='-1'
as
begin

select Distinct ee.Entidad as ID_Area,
				Desc_esp=e.DescEntidad,
				Desc_ing=e.DescEntidad 
from dbo.VT_EmpresaEntidad ee inner join dbo.VT_Entidad e on ee.Entidad=e.Entidad
where ee.ID_Direccion is not null
and ee.ID_Direccion=case @Direccion when -1 then ID_Direccion else @Direccion end


end

--select * from VT_EmpresaEntidad
--select * from VT_Entidad



GO
/****** Object:  StoredProcedure [dbo].[PADEAdmin_DireccionOrganizacional]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PADEAdmin_DireccionOrganizacional]

as
begin

select * from organizacion_vzt.dbo.VT_DireccionOrganizacional

end
GO
/****** Object:  StoredProcedure [dbo].[pr_inserta_vales_recibo_web]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- pr_inserta_vales_recibo_web 2010, 8, 2
CREATE procedure [dbo].[pr_inserta_vales_recibo_web] 	(@anio int, @mes int, @periodomes int) as

declare @recibos_tmp table (id_recibo int, empleado int)
declare @dip_bono varchar(4) set @dip_bono = '518'

if exists(select 1 from vt_reciboencabezado_temp 
			where anio = @anio and mes = @mes and periodomes = @periodomes)
begin
	insert into @recibos_tmp
	select vre.id_recibo, vrdt.empleado
	from VT_ReciboDetalle_temp vrdt left join VT_ReciboEncabezado vre on vre.empleado = vrdt.empleado and vre.empresa = vrdt.empresa and vre.anio = vrdt.anio and vre.mes = vrdt.mes and vre.periodomes = vrdt.periodomes
	where vrdt.anio = @anio and vrdt.mes = @mes and vrdt.periodomes = @periodomes and vrdt.dip = @dip_bono 
	order by vrdt.empleado

	--select * from @recibos_tmp
	
	--insert into VT_ReciboDetalle
	select rt.id_recibo, vrdt.secuencia, vrdt.dip, vrdt.concepto, vrdt.id_tipomovimiento, vrdt.horas_dias, vrdt.importe, vrdt.saldo_anterior, vrdt.saldo_actual, 
		vrdt.saldo_anterior_fondo_ahorro, vrdt.saldo_actual_fondo_ahorro, vrdt.saldo_anterior_ahorro_voluntario, vrdt.saldo_actual_ahorro_voluntario, 
		vrdt.saldo_anterior_plan_pensiones, vrdt.saldo_actual_plan_pensiones, vrdt.saldo_anterior_infonavit, vrdt.saldo_actual_infonavit
	from VT_ReciboDetalle_temp vrdt join @recibos_tmp rt on rt.empleado = vrdt.empleado
	where vrdt.anio = @anio and vrdt.mes = @mes and vrdt.periodomes = @periodomes and vrdt.dip = @dip_bono 
		and  exists (select 1 from VT_ReciboDetalle where id_recibo = rt.id_recibo and dip = @dip_bono)	
	
end

GO
/****** Object:  StoredProcedure [dbo].[sp_col]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_col]
    @colname   varchar(40)
AS
    Select	case when o.name like '%resp%' 
		    or o.name like '%CACM%' 
		    or o.name like '%CPVC%' 
		    or o.name like '%bkp%' 
		    or o.name like '%JASM%' then  '--' else '' end + o.name, c.name
    from	sysobjects o inner join syscolumns c on c.id = o.id
    And c.name like '%'+REPLACE(@colname , ' ', '%')+'%'
    And o.type = 'u'
    order	by o.name, c.name

GO
/****** Object:  StoredProcedure [dbo].[sp_depend]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	Proc [dbo].[sp_depend]
	@Object varchar(30),
	@Prefijo varchar(30)='',
	@Text smallint=0
AS
select	Distinct name=Case @Prefijo
		When '' Then ''
		Else @Prefijo+' '
	End+substring(o.name, 1, 50),
	Case @Text When 0 Then '' Else '-- ('+Convert(varchar(2), o.type)+') ' +Replace(substring(text, patindex('%'+@Object+'%', text )-10, 50), char(13)+char(10), ' ') End
from	syscomments c,
	sysobjects o
where	c.id = o.id
and	c.text like '%'+@Object+'%'
order	by o.name

GO
/****** Object:  StoredProcedure [dbo].[SP_EjecutaJob]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Objetivo: 	Ejecutar un job por medio de la página web
		(lo utiliza en SADO para actualizar la información)
  Creado por:   Jaime Sánchez
  Fecha:	26-Oct-2006
*/
Create Proc [dbo].[SP_EjecutaJob]
	@Nombre_Job varchar(1000)
AS

	EXEC msdb.dbo.sp_start_job @job_name = @Nombre_Job

GO
/****** Object:  StoredProcedure [dbo].[sp_instbl]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	proc [dbo].[sp_instbl]
	@object varchar(100),
	@criterio varchar(1000)=''
as

-- Declare	@object varchar(100)
-- set	@object = 'SS_OpcionesMenu'

Declare	@Cmd varchar(6000)
Set	@Cmd = ''
Set	@Cmd = 'Select ''Insert '+@object+'('

Select	@Cmd	= @Cmd+c.name+', '
From	sysobjects o,
	syscolumns c
where	o.id 		= c.id
and	o.type		= 'u'
and	o.name 		like Substring(@object, CHARINDEX('.', @Object)+1, 1000)
order	by c.colid

Set	@Cmd = Left(@Cmd, Len(@Cmd)-1) +') values(''+'

Select	@Cmd	= @Cmd+'''''''''+ltrim(rtrim(Convert(varchar(1000), IsNull('+c.name+',''''))))+'''''','' +'
From	sysobjects o,
	syscolumns c
where	o.id 		= c.id
and	o.type		= 'u'
and	o.name 		like Substring(@object, CHARINDEX('.', @Object)+1, 1000)
order	by c.colid

Set	@Cmd = Left(@Cmd, Len(@Cmd)-4) + '''+'')''' + ' From '+@object+Case When @criterio <> '' Then ' where '+@criterio else '' end

Set nocount on
Print 'Print Char(13)+''SET IDENTITY_INSERT '+@object+' ON''+char(13)'
Select @Cmd	
--Execute	@Cmd

Print 'Print Char(13)+''SET IDENTITY_INSERT '+@object+' OFF''+char(13)'




GO
/****** Object:  StoredProcedure [dbo].[SP_MigraciónFormet_Oct08]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MigraciónFormet_Oct08]  
as  
  
declare @IdNew as int  
declare @CompNew as int  
declare @IdAnt as int  
declare @CompAnt as int  
declare @IdVzt as int  
declare @ValorSumar as int  
declare @EmpleadoNew as int  
declare @EmpleadoAnt as int  
declare @PlazaAnt as int  
declare @PlazaNew as int  
declare @PuestoAnt as int  
declare @PuestoNew as int  
declare @CveNew as varchar(20)  
declare @CveAnt as varchar(20)  
  
set @ValorSumar=1000000  
  
Select id as IdAnt,  
         empresa as CompAnt,  
         empleado as EmpleadoAnt,  
         id_recurso_vt as IdVzt,  
         plaza as PlazaAnt,  
         idPuesto as PuestoAnt   
into #EmpleadoAnt  
from organizacion_vzt.dbo.v_EmpleadosVerzatec   
where Empresa = 4100  
---and id_recurso_vt=4630 --OJO quitar: Prueba con Elsa Maciel  
  
Select id as IdNew,  
         empresa as CompNew,  
         empleado as EmpleadoNew,  
         id_recurso_vt as IdVzt,  
         plaza as PlazaNew,  
         idPuesto as PuestoNew   
into #EmpleadoNew   
from organizacion_vzt.dbo.v_EmpleadosVerzatec   
where Empresa = 5000 and Entidad = 4020  
---and id_recurso_vt=4630 --OJO quitar: Prueba con Elsa Maciel  
  
   
DECLARE Emp_Cursor CURSOR FOR  
SELECT ea.IdAnt+@ValorSumar,en.IdNew,ea.CompAnt,en.CompNew,ea.EmpleadoAnt,en.EmpleadoNew,ea.PlazaAnt, en.PlazaNew,ea.PuestoAnt,en.PuestoNew,ea.IdVzt FROM #EmpleadoAnt as ea, #EmpleadoNew as en where ea.IdVzt = en.IdVzt  
OPEN Emp_Cursor;  
FETCH NEXT FROM Emp_Cursor  
into @IdAnt,@IdNew,@CompAnt,@CompNew,@EmpleadoAnt,@EmpleadoNew,@PlazaAnt,@PlazaNew,@PuestoAnt,@PuestoNew,@IdVzt;  
  
WHILE @@FETCH_STATUS = 0  
   BEGIN  
  
-------------------------Cecy Cárdenas---------------------  
  
--Acceso Portal--  
select @CveAnt=Contrasena  
from Kiosco.dbo.in_usuarios_otrasempresas   
where compania=@CompAnt and Empleado=@EmpleadoAnt  
  
update Kiosco.dbo.in_usuarios   
set Contrasena=@CveAnt  
where Empleado=@EmpleadoNew  
  
update Kiosco.dbo.in_usuarios_otrasempresas   
set Estado=0  
where compania=@CompAnt and Empleado=@EmpleadoAnt  
  
--Mis Datos--  
update kiosco.dbo.inv_rh_DatosGenerales  
set Compania=@CompNew,id=@IdNew  
where id_recurso_vt in (@IdVzt) and compania=@CompAnt  
  
update kiosco.dbo.INV_RH_Emergencia   
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Funciones   
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Familiares  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Escolaridad  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Idiomas  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Cursos  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Empleos  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Conocimientos  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_AreaInteres  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
--Datamarth  
--select * from DATAWHRH.DATAWHRH.EMPLEADO  where EMPLE_NID=11015
Update DATAWHRH.DATAWHRH.EMPLEADO   
set EMPL_CSTATUS=2  
where EMP_NID=4100 and EMPL_CSTATUS=1  
and  EMPLE_NID=@EmpleadoAnt  
  
--Reclutamiento  
/*
select * from Reclutamiento.dbo.tblRequisicion 
where intEmpresaId=4100
and intSolicitanteId=11015 

50930
5000

update Reclutamiento.dbo.tblRequisicion   
set intEmpresaId=5000, intSolicitanteId=50930 
where intEmpresaId=4100  
and intSolicitanteId=11015  

*/
update Reclutamiento.dbo.tblRequisicion   
set intEmpresaId=@CompNew, intSolicitanteId=@EmpleadoNew  
where intEmpresaId=@CompAnt  
and intSolicitanteId=@EmpleadoAnt  
  
--OJO Poner hasta el masivo  
--update Reclutamiento.dbo.tblDescripcionPuesto   
--set  intEmpresaId=@CompNew  
--where intPuestoId in (select intPuestoId from Reclutamiento.dbo.tblRequisicion where intEmpresaId=@CompAnt)  
--and intEmpresaId=@CompAnt  
  
update Reclutamiento.dbo.tblAdministrador  
set intEmpleadoId=@EmpleadoNew, intEmpresaId=@CompNew  
where intEmpresaId=@CompAnt  
and intEmpleadoId=@EmpleadoAnt  
  
--Evaluaciones RH  
update RHExamenesHSEQI.usrRHExamenes.tblAdminPropiedad   
set intEmpresaId=@CompNew,intEmpleadoId=@EmpleadoNew  
where intEmpleadoId=@EmpleadoAnt and IntEmpresaId=@CompAnt  
  
update RHExamenesHSEQI.usrRHExamenes.tblExamenPersona  
set intEmpresaPersonaId=@CompNew,intPersonaId=@EmpleadoNew  
where intEmpresaPersonaId=@CompAnt and intPersonaId=@EmpleadoAnt  
  
update RHExamenesHSEQI.usrRHExamenes.tblPerfilPuestoHS   
set intCompaniaId=@CompNew,intPuestoId=cast(2 as varchar(2))+cast(@PuestoNew as varchar(5))  
where intCompaniaId=@CompAnt and intPuestoId=@PuestoAnt  
  
  
-------------------------Cecy Villarreal-------------------  
Update DesempenoRHImsalum.dbo.TBLEVALUACIONPERSONA  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt  
  
Update DesempenoRHImsalum.dbo.tblEvaluacionPyD  
SET Empresa = @CompNew, Empleado = @EmpleadoNew  
where Empleado = @EmpleadoAnt and Empresa = @CompAnt  
  
Update DesempenoRHImsalum.dbo.tblEvaluacionPyD  
SET EmpresaEvaluador = @CompNew, EmpleadoEvaluador = @EmpleadoNew  
where EmpleadoEvaluador = @EmpleadoAnt and EmpresaEvaluador = @CompAnt  
  
Update DesempenoRHImsalum.dbo.tblAdministrador  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew--, strEmpresa=''  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt   
  
Update DesempenoRHImsalum.dbo.tblInstanciaAdmin  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt   
  
Update DesempenoRHImsalum.dbo.tblIntegrantesGrupo  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt   
  
----Cambiar a 4100 en caso dado  
--Update DesempenoRHImsalum.dbo.tblGrupoEjecutivo  
--set intEmpresaId = @CompNew  
--WHERE intEmpresaId  Like'%'+Cast(@CompAnt as varchar (255))+'%'  
  
Update Encuestador.dbo.tblAdministrador  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt  
  
Update Encuestador.dbo.tblInstanciaAdmin  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt  
   
Update Encuestador.dbo.tblMatrizEncuesta  
set intEncuestadoId = @EmpleadoNew, intCompaniaEncuestadoId = @CompNew  
WHERE intEncuestadoId = @EmpleadoAnt and intCompaniaEncuestadoId = @CompAnt  
  
Update Encuestador.dbo.tblMatrizEncuesta  
set intEvaluadorId = @EmpleadoNew, intCompaniaEvaluadorId = @CompNew  
WHERE intEvaluadorId = @EmpleadoAnt and intCompaniaEvaluadorId = @CompAnt  
  
Update Encuestador.dbo.tblResultadoParams  
set intEncuestadoId = @EmpleadoNew, intCompaniaEncuestadoId = @CompNew  
WHERE intEncuestadoId = @EmpleadoAnt and intCompaniaEncuestadoId = @CompAnt  
  
Update Encuestador.dbo.tblResultadoParams  
set intEvaluadorId = @EmpleadoNew, intCompaniaEvaluadorId = @CompNew  
WHERE intEvaluadorId = @EmpleadoAnt and intCompaniaEvaluadorId = @CompAnt  
  
Update Encuesta360.dbo.tblAdministrador  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt  
  
Update Encuesta360.dbo.tblInstanciaAdmin  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt  
   
Update Encuesta360.dbo.tblMatrizEncuesta  
set intEncuestadoId = @EmpleadoNew, intCompaniaEncuestadoId = @CompNew  
WHERE intEncuestadoId = @EmpleadoAnt and intCompaniaEncuestadoId = @CompAnt  
  
Update Encuesta360.dbo.tblMatrizEncuesta  
set intEvaluadorId = @EmpleadoNew, intCompaniaEvaluadorId = @CompNew  
WHERE intEvaluadorId = @EmpleadoAnt and intCompaniaEvaluadorId = @CompAnt  
  
Update Encuesta360.dbo.tblResultadoParams  
set intEncuestadoId = @EmpleadoNew, intCompaniaEncuestadoId = @CompNew  
WHERE intEncuestadoId = @EmpleadoAnt and intCompaniaEncuestadoId = @CompAnt  
  
Update Encuesta360.dbo.tblResultadoParams  
set intEvaluadorId = @EmpleadoNew, intCompaniaEvaluadorId = @CompNew  
WHERE intEvaluadorId = @EmpleadoAnt and intCompaniaEvaluadorId = @CompAnt  
  
Update Encuesta360.dbo.ch_calificacion360  
set intEncuestadoId = @EmpleadoNew, intCompaniaEncuestadoId = @CompNew  
WHERE intEncuestadoId = @EmpleadoAnt and intCompaniaEncuestadoId = @CompAnt  
  
Update Encuesta360.dbo.tblSolicitudMatrizAutorizar  
set Empleado = @EmpleadoNew, Empresa = @CompNew  
WHERE Empleado = @EmpleadoAnt and Empresa = @CompAnt  
  
Update Encuesta360.dbo.tblUsuariosCreanMatriz360_PADE  
set Empleado = @EmpleadoNew, Empresa = @CompNew  
WHERE Empleado = @EmpleadoAnt and Empresa = @CompAnt  
  
Update kiosco.dbo.CH_ProcesoFB_Empleados  
set ID = @IdNew, Firma_Colaborador = @IdNew  
where ID = @IdAnt   
  
Update kiosco.dbo.CH_ProcesoFB_Empleados  
set Firma_Jefe = @IdNew  
where Firma_Jefe = @IdAnt  
  
Update kiosco.dbo.CH_ProcesoFB_Tutor  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_ProcesoFB_Tutor  
set ID_Jefe = @IdNew  
where ID_Jefe = @IdAnt  
  
Update kiosco.dbo.Ch_Acciones_vzt  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.Ch_Acciones  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.Ch_Alinea_Accion_AreaOp  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_AreasOp  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_AreasOp_vzt  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_Fortalezas_Empleado_vzt  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_Fortalezas_Empleado  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_PlanCapacitacion_vzt  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_PlanCapacitacion  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_AccionesSucesion_vzt  
set Empresa = @CompNew, Plaza =@PlazaNew, EmpresaFuente = 2  
where Empresa = @CompAnt and Plaza =@PlazaAnt  
  
Update kiosco.dbo.CH_Nivel_Plaza_vzt  
set Empresa = @CompNew, Plaza =@PlazaNew, EmpresaFuente = 2  
where Empresa = @CompAnt and Plaza =@PlazaAnt  
  
Update kiosco.dbo.CH_Permisos  
set Empresa = @CompNew, Plaza =@PlazaNew, EmpresaFuente = 2  
where Empresa = @CompAnt and Plaza =@PlazaAnt  
  
Declare @UserIdAnt as int  
Declare @UserIdNew as int  
  
Select @UserIdAnt = UserId from ArribaLearningPortalV30.dbo.Usuarios where CveEmp = @CompAnt and UserName = Cast(@CompAnt as varchar(4))+Cast(@EmpleadoAnt as varchar(5))  
  
Select @UserIdNew = UserId from ArribaLearningPortalV30.dbo.Usuarios where CveEmp = @CompNew and UserName = Cast(@CompNew as varchar(4))+Cast(@EmpleadoNew as varchar(5))  
  
Update ArribaLearningPortalV30.dbo.User_Course   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.ScormResume   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.ScormResumeInterac   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.User_Module   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.Evento_MiembrosAlumno   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.Examenes   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.Evento_MiembrosGrupo  
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.User_Control  
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
  
----OJO Hasta mañana  
--update vt_RecursoEmpresa   
--set Estatus=2  
--where empresa=@CompAnt and id_recurso_vt=@IdVzt   
  
  
FETCH NEXT FROM Emp_Cursor  
        into @IdAnt,@IdNew,@CompAnt,@CompNew,@EmpleadoAnt,@EmpleadoNew,@PlazaAnt,@PlazaNew,@PuestoAnt,@PuestoNew,@IdVzt;  
  
   END;  
CLOSE Emp_Cursor;  
DEALLOCATE Emp_Cursor;  
  
  
drop table #EmpleadoAnt  
drop table #EmpleadoNew

GO
/****** Object:  StoredProcedure [dbo].[SP_MigraciónStabilit_Ene09]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MigraciónStabilit_Ene09]  
as  
  
declare @IdNew as int  
declare @CompNew as int 
declare @CompFuenteNew as int  
declare @IdAnt as int  
declare @CompAnt as int  
declare @IdVzt as int  
declare @ValorSumar as int  
declare @EmpleadoNew as int  
declare @EmpleadoAnt as int  
declare @PlazaAnt as int  
declare @PlazaNew as int  
declare @PuestoAnt as int  
declare @PuestoNew as int  
declare @CveNew as varchar(20)  
declare @CveAnt as varchar(20)  
  
set @ValorSumar=2000000  
  
Select id as IdAnt,  
         empresa as CompAnt,  
         empleado as EmpleadoAnt,  
         id_recurso_vt as IdVzt,  
         plaza as PlazaAnt,  
         idPuesto as PuestoAnt, 
		 entidad 
into #EmpleadoAnt  
from organizacion_vzt.dbo.v_EmpleadosVerzatec   
where Empresa Like '%9%' --and Entidad in(3030,3050,3051,3052,3053,3054,3055,4000,3070,0)
--and id_recurso_vt in (5226,5217,5251,5175,5186,5176,5174,5103,5078,5184,5192,5091,5177,5194,5201
--,5221,5093,5109,5178,5102,5420,5421,5416,5417,5087,5428,5028,5369,5011,5398,5022,5017,9390,5374,5379
--,9751,5012,5007,5016,5160)
--and id_recurso_vt=1942 --OJO quitar: Prueba con Alex de Lara
--and id_recurso_vt in(1942,6797,5121) --OJO quitar: Prueba con Alex, christian y Cornelio) 
  
Select id as IdNew,  
         empresa as CompNew,
	 empresaFuente as CompFuenteNew,  
         empleado as EmpleadoNew,  
         id_recurso_vt as IdVzt,  
         plaza as PlazaNew,  
         idPuesto as PuestoNew,
		 entidad
into #EmpleadoNew   
from organizacion_vzt.dbo.v_EmpleadosVerzatec   
where  Empresa = 5000 and Entidad in(3030,3050,3051,3052,3053,3054,3055,4000,3070)--,
--and id_recurso_vt  in (5226,5217,5251,5175,5186,5176,5174,5103,5078,5184,5192,5091,5177,5194,5201
--,5221,5093,5109,5178,5102,5420,5421,5416,5417,5087,5428,5028,5369,5011,5398,5022,5017,9390,5374,5379
--,9751,5012,5007,5016,5160)
--and id_recurso_vt=1942 --OJO quitar: Prueba con Alex de Lara  
--and id_recurso_vt in(1942,6797,5121) --OJO quitar: Prueba con Alex, christian y Cornelio) 
--set @EmpleadoAnt = 23257
--set @CompAnt = 5000  
--Checar 48330,48329,41969,50174,51448,41971,48736,51415,41960,41994,43173,41954,42012,42010,43186,50330,49838,42018,41962,42000,48670,45519,42002   
DECLARE Emp_Cursor CURSOR FOR  
SELECT ea.IdAnt+@ValorSumar,en.IdNew,ea.CompAnt,en.CompNew,en.CompFuenteNew,ea.EmpleadoAnt,en.EmpleadoNew,ea.PlazaAnt, en.PlazaNew,ea.PuestoAnt,en.PuestoNew,ea.IdVzt FROM #EmpleadoAnt as ea, #EmpleadoNew as en where ea.IdVzt = en.IdVzt  
OPEN Emp_Cursor;  
FETCH NEXT FROM Emp_Cursor  
into @IdAnt,@IdNew,@CompAnt,@CompNew,@CompFuenteNew,@EmpleadoAnt,@EmpleadoNew,@PlazaAnt,@PlazaNew,@PuestoAnt,@PuestoNew,@IdVzt;  
  
WHILE @@FETCH_STATUS = 0  
   BEGIN  
  
-------------------------Cecy Cárdenas---------------------  
  
--Acceso Portal--  
select @CveAnt = Contrasena  
from Kiosco.dbo.in_usuarios_otrasempresas   
where compania=@CompAnt and Empleado=@EmpleadoAnt  
  
update Kiosco.dbo.in_usuarios   
set Contrasena=@CveAnt  
where Empleado=@EmpleadoNew  

-- Ojo hasta Mañana  
update Kiosco.dbo.in_usuarios_otrasempresas   
set Estado=0  
where compania=@CompAnt and Empleado=@EmpleadoAnt  
  
--Mis Datos--  
update kiosco.dbo.inv_rh_DatosGenerales  
set Compania=@CompFuenteNew,id=@IdNew --OJO Cecy  
where id_recurso_vt in (@IdVzt) and compania=@CompAnt  
  
update kiosco.dbo.INV_RH_Emergencia   
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Funciones   
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Familiares  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Escolaridad  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Idiomas  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Cursos  
set Compania=@CompFuenteNew--OJO Cecy
,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Empleos  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_Conocimientos  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
update kiosco.dbo.INV_RH_AreaInteres  
set Compania=@CompNew,id=@IdNew  
where id=@IdAnt  
  
--Datamarth  
--select * from DATAWHRH.DATAWHRH.EMPLEADO  where EMPLE_NID=11015
--Update DATAWHRH.DATAWHRH.EMPLEADO   
--set EMPL_CSTATUS=2  
--where EMP_NID like '%9%' and EMPL_CSTATUS=1  
--and  EMPLE_NID=@EmpleadoAnt  
  
--Reclutamiento  
/*
select * from Reclutamiento.dbo.tblRequisicion 
where intEmpresaId=4100
and intSolicitanteId=11015 

50930
5000

update Reclutamiento.dbo.tblRequisicion   
set intEmpresaId=5000, intSolicitanteId=50930 
where intEmpresaId=4100  
and intSolicitanteId=11015  

*/
update Reclutamiento.dbo.tblRequisicion   
set intEmpresaId=@CompNew, intSolicitanteId=@EmpleadoNew  
where intEmpresaId=@CompAnt  
and intSolicitanteId=@EmpleadoAnt  
  
--OJO Poner hasta el masivo  
--update Reclutamiento.dbo.tblDescripcionPuesto   
--set  intEmpresaId=@CompNew  
--where intPuestoId in (select intPuestoId from Reclutamiento.dbo.tblRequisicion where intEmpresaId=@CompAnt)  
--and intEmpresaId=@CompAnt  
  
update Reclutamiento.dbo.tblAdministrador  
set intEmpleadoId=@EmpleadoNew, intEmpresaId=@CompNew  
where intEmpresaId=@CompAnt  
and intEmpleadoId=@EmpleadoAnt  
  
--Evaluaciones RH  
update RHExamenesHSEQI.usrRHExamenes.tblAdminPropiedad   
set intEmpresaId=@CompNew,intEmpleadoId=@EmpleadoNew  
where intEmpleadoId=@EmpleadoAnt and IntEmpresaId=@CompAnt  
  
update RHExamenesHSEQI.usrRHExamenes.tblExamenPersona  
set intEmpresaPersonaId=@CompNew,intPersonaId=@EmpleadoNew  
where intEmpresaPersonaId=@CompAnt and intPersonaId=@EmpleadoAnt  
  
update RHExamenesHSEQI.usrRHExamenes.tblPerfilPuestoHS   
set intCompaniaId=@CompNew,intPuestoId=cast(2 as varchar(2))+cast(@PuestoNew as varchar(5))  
where intCompaniaId=@CompAnt and intPuestoId=@PuestoAnt  
  
  
-------------------------Cecy Villarreal-------------------  
Update DesempenoRHImsalum.dbo.TBLEVALUACIONPERSONA  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt  
  
Update DesempenoRHImsalum.dbo.tblEvaluacionPyD  
SET Empresa = @CompNew, Empleado = @EmpleadoNew  
where Empleado = @EmpleadoAnt and Empresa = @CompAnt  
  
Update DesempenoRHImsalum.dbo.tblEvaluacionPyD  
SET EmpresaEvaluador = @CompNew, EmpleadoEvaluador = @EmpleadoNew  
where EmpleadoEvaluador = @EmpleadoAnt and EmpresaEvaluador = @CompAnt  
  
Update DesempenoRHImsalum.dbo.tblAdministrador  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew--, strEmpresa=''  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt   
  
Update DesempenoRHImsalum.dbo.tblInstanciaAdmin  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt   
  
Update DesempenoRHImsalum.dbo.tblIntegrantesGrupo  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt   
  
----Cambiar a 4100 en caso dado  
--Update DesempenoRHImsalum.dbo.tblGrupoEjecutivo  
--set intEmpresaId = @CompNew  
--WHERE intEmpresaId  Like'%'+Cast(@CompAnt as varchar (255))+'%'  
  
Update Encuestador.dbo.tblAdministrador  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt  
  
Update Encuestador.dbo.tblInstanciaAdmin  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt  
   
Update Encuestador.dbo.tblMatrizEncuesta  
set intEncuestadoId = @EmpleadoNew, intCompaniaEncuestadoId = @CompNew  
WHERE intEncuestadoId = @EmpleadoAnt and intCompaniaEncuestadoId = @CompAnt  
  
Update Encuestador.dbo.tblMatrizEncuesta  
set intEvaluadorId = @EmpleadoNew, intCompaniaEvaluadorId = @CompNew  
WHERE intEvaluadorId = @EmpleadoAnt and intCompaniaEvaluadorId = @CompAnt  
  
Update Encuestador.dbo.tblResultadoParams  
set intEncuestadoId = @EmpleadoNew, intCompaniaEncuestadoId = @CompNew  
WHERE intEncuestadoId = @EmpleadoAnt and intCompaniaEncuestadoId = @CompAnt  
  
Update Encuestador.dbo.tblResultadoParams  
set intEvaluadorId = @EmpleadoNew, intCompaniaEvaluadorId = @CompNew  
WHERE intEvaluadorId = @EmpleadoAnt and intCompaniaEvaluadorId = @CompAnt  
  
Update Encuesta360.dbo.tblAdministrador  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt  
  
Update Encuesta360.dbo.tblInstanciaAdmin  
set intEmpresaId = @CompNew, intEmpleadoId = @EmpleadoNew  
WHERE intEmpleadoId = @EmpleadoAnt and intEmpresaId = @CompAnt  
   
Update Encuesta360.dbo.tblMatrizEncuesta  
set intEncuestadoId = @EmpleadoNew, intCompaniaEncuestadoId = @CompNew  
WHERE intEncuestadoId = @EmpleadoAnt and intCompaniaEncuestadoId = @CompAnt  
  
Update Encuesta360.dbo.tblMatrizEncuesta  
set intEvaluadorId = @EmpleadoNew, intCompaniaEvaluadorId = @CompNew  
WHERE intEvaluadorId = @EmpleadoAnt and intCompaniaEvaluadorId = @CompAnt  
  
Update Encuesta360.dbo.tblResultadoParams  
set intEncuestadoId = @EmpleadoNew, intCompaniaEncuestadoId = @CompNew  
WHERE intEncuestadoId = @EmpleadoAnt and intCompaniaEncuestadoId = @CompAnt  
  
Update Encuesta360.dbo.tblResultadoParams  
set intEvaluadorId = @EmpleadoNew, intCompaniaEvaluadorId = @CompNew  
WHERE intEvaluadorId = @EmpleadoAnt and intCompaniaEvaluadorId = @CompAnt  
  
Update Encuesta360.dbo.ch_calificacion360  
set intEncuestadoId = @EmpleadoNew, intCompaniaEncuestadoId = @CompNew  
WHERE intEncuestadoId = @EmpleadoAnt and intCompaniaEncuestadoId = @CompAnt  
  
Update Encuesta360.dbo.tblSolicitudMatrizAutorizar  
set Empleado = @EmpleadoNew, Empresa = @CompNew  
WHERE Empleado = @EmpleadoAnt and Empresa = @CompAnt  
  
Update Encuesta360.dbo.tblUsuariosCreanMatriz360_PADE  
set Empleado = @EmpleadoNew, Empresa = @CompNew  
WHERE Empleado = @EmpleadoAnt and Empresa = @CompAnt  
  
Update kiosco.dbo.CH_ProcesoFB_Empleados  
set ID = @IdNew, Firma_Colaborador = @IdNew  
where ID = @IdAnt   
  
Update kiosco.dbo.CH_ProcesoFB_Empleados  
set Firma_Jefe = @IdNew  
where Firma_Jefe = @IdAnt  
  
Update kiosco.dbo.CH_ProcesoFB_Tutor  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_ProcesoFB_Tutor  
set ID_Jefe = @IdNew  
where ID_Jefe = @IdAnt  
  
Update kiosco.dbo.Ch_Acciones_vzt  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.Ch_Acciones  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.Ch_Alinea_Accion_AreaOp  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_AreasOp  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_AreasOp_vzt  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_Fortalezas_Empleado_vzt  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_Fortalezas_Empleado  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_PlanCapacitacion_vzt  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_PlanCapacitacion  
set ID = @IdNew  
where ID = @IdAnt  
  
Update kiosco.dbo.CH_AccionesSucesion_vzt  
set Empresa = @CompNew, Plaza =@PlazaNew, EmpresaFuente = @CompFuenteNew  
where Empresa = @CompAnt and Plaza =@PlazaAnt  
  
Update kiosco.dbo.CH_Nivel_Plaza_vzt  
set Empresa = @CompNew, Plaza =@PlazaNew, EmpresaFuente = @CompFuenteNew  
where Empresa = @CompAnt and Plaza =@PlazaAnt  
  
Update kiosco.dbo.CH_Permisos  
set Empresa = @CompNew, Plaza =@PlazaNew, EmpresaFuente = @CompFuenteNew  
where Empresa = @CompAnt and Plaza =@PlazaAnt  
  
Declare @UserIdAnt as int  
Declare @UserIdNew as int  
  
Select @UserIdAnt = UserId from ArribaLearningPortalV30.dbo.Usuarios where CveEmp = @CompAnt and UserName = Cast(@CompAnt as varchar(4))+Cast(@EmpleadoAnt as varchar(5))  
  
Select @UserIdNew = UserId from ArribaLearningPortalV30.dbo.Usuarios where CveEmp = @CompNew and UserName = Cast(@CompNew as varchar(4))+Cast(@EmpleadoNew as varchar(5))  
  
Update ArribaLearningPortalV30.dbo.User_Course   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.ScormResume   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.ScormResumeInterac   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.User_Module   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.Evento_MiembrosAlumno   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.Examenes   
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.Evento_MiembrosGrupo  
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
Update ArribaLearningPortalV30.dbo.User_Control  
set UserId = @UserIdNew  
where  UserId = @UserIdAnt  
  
  
----OJO Hasta mañana  
update Organizacion_VZT.DBO.vt_RecursoEmpresa   
set Estatus=2  
where empresa=@CompAnt and id_recurso_vt=@IdVzt   
  
  
FETCH NEXT FROM Emp_Cursor  
        into @IdAnt,@IdNew,@CompAnt,@CompNew,@EmpleadoAnt,@EmpleadoNew,@PlazaAnt,@PlazaNew,@PuestoAnt,@PuestoNew,@IdVzt;  
  
   END;  
CLOSE Emp_Cursor;  
DEALLOCATE Emp_Cursor;  
  
  
drop table #EmpleadoAnt  
drop table #EmpleadoNew  

------ PARA LOS RELOJES -----

-----STABILIT MTY

--select id_recurso_vt,Empresa,EmpresaFuente,Empleado,e_mail,estatus from VT_RecursoEmpresa 
update VT_RecursoEmpresa set estatus=1
where empleado in (9017,6712,6081,9098,9023,9013,6679,9260,9252,9092,6671,9127,9169,9026,9148,9240,9308,11,6701,6776,6,5,12,9038,6731,5016)
and EmpresaFuente in (9100,9500)

--select * from kiosco.dbo.in_usuarios_otrasempresas 
update kiosco.dbo.in_usuarios_otrasempresas set Estado=1
where empleado in (9017,6712,6081,9098,9023,9013,6679,9260,9252,9092,6671,9127,9169,9026,9148,9240,9308,11,6701,6776,6,5,12,9038,6731,5016)
and Compania in (9100,9500)

-----STABILIT MEXICO

--select id_recurso_vt,Empresa,EmpresaFuente,Empleado,e_mail,estatus from VT_RecursoEmpresa 
update VT_RecursoEmpresa set estatus=1
where empleado in (1219,8743,8745,1212,728,2003,4261,6366,1014,1009,222,621,719,1510,8065,3515,1228,717,622,1922,4805)
and EmpresaFuente in (9100,9500)

--select * from kiosco.dbo.in_usuarios_otrasempresas 
update kiosco.dbo.in_usuarios_otrasempresas set Estado=1
where empleado in (1219,8743,8745,1212,728,2003,4261,6366,1014,1009,222,621,719,1510,8065,3515,1228,717,622,1922,4805)
and Compania in (9100,9500)

GO
/****** Object:  StoredProcedure [dbo].[sp_usu]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_usu]
	@nombre varchar(500)
AS
	
	select 	* 
	from 	v_empleadosverzatec
	Where	case when IsNumeric(@nombre) = 1 Then rtrim(cast(empleado as char)) else @nombre end Like @nombre
	and		case when IsNumeric(@nombre) = 0 Then NombreCompleto else @nombre end  like '%'+Replace(@nombre, ' ', '%')+'%'
 

-- 	select 	id_recurso_vt = isnull(r.id_recurso_vt, 0),
-- 		o.Empresa,
-- 		re.Empleado,
-- 		re.id,
-- 		o.plaza,
-- 		o.Publica,
-- 		o.EmpresaFuente,
-- 		Nombre = r.Nombre+' '+r.Paterno+' '+r.Materno,
-- 		o.Plaza_Superior,
-- 		o.Empresa_Superior,
-- 		o.EmpresaFuente_Superior,
-- 		r.RFC,
-- 		re.Nomina,
-- 		re.id_NivelEmpleado,
-- 		o.id_nivel_puesto,
-- 		re.Estatus
-- 	from 	vt_Recursos r,
-- 		vt_RecursoEmpresa re,
-- 		vt_organigrama o
-- 	where 	r.id_recurso_vt = re.id_recurso_vt
-- 	and	o.id_recurso_vt = re.id_recurso_vt
-- 	and	o.Empresa = re.Empresa
-- 	and	o.EmpresaFuente = re.EmpresaFuente
-- 	and	case when IsNumeric(@nombre) = 1 Then rtrim(cast(re.empleado as char)) else @nombre end Like @nombre
-- 	and	case when IsNumeric(@nombre) = 0 Then nombre+' '+paterno+' '+materno else @nombre end  like '%'+Replace(@nombre, ' ', '%')+'%'

GO
/****** Object:  StoredProcedure [dbo].[SPI_ActualizaEstOrg]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPI_ActualizaEstOrg]
AS


	-- E M P R E S A S --
	-- CARGAR DIVISIONES GLOBALES --
	-- Se deja solo como referencia -- 
	/*
	IF NOT EXISTS(SELECT 1 FROM VT_Empresa where empresa = 1)
		Insert into vt_empresa Values (1, 'Verzatec', '', 0, '', '', 0, '', 0, '', '', '', '', 0, 1)

	IF NOT EXISTS(SELECT 1 FROM VT_Empresa where empresa = 2)
		Insert into vt_empresa Values (2, 'Cuprum', '', 1, '', '', 0, '', 0, '', '', '', '', 0, 1)
	
	IF NOT EXISTS(SELECT 1 FROM VT_Empresa where empresa = 3)
		Insert into vt_empresa Values (3, 'Formet', '', 1, '', '', 0, '', 0, '', '', '', '', 0, 1)
	
	IF NOT EXISTS(SELECT 1 FROM VT_Empresa where empresa = 4)
		Insert into vt_empresa Values (4, 'Stabilit', '', 1, '', '', 0, '', 0, '', '', '', '', 0, 1)
	*/
	
	
	
	-- ACTUALIZAR LAS EMPRESAS EXISTENTES --
	update	vt_empresa 
	set		Descripcion		= t.Descripcion,
			razon_social	= t.razon_social,
			Empresa_Padre	= t.Empresa_Padre,
			RFC				= t.RFC,
			Calle			= t.Calle,
			Numero			= t.Numero,
			Colonia			= t.Colonia,
			Codigo_Postal	= t.Codigo_Postal,
			Pais			= t.Pais,
			Estado			= t.Estado,
			Ciudad			= t.Ciudad,
			Municipio		= t.Municipio,
			Telefono		= t.Telefono,
			Estatus			= t.Estatus
	from	vt_empresa e join
			vt_empresa_TEMP t on e.Empresa = t.Empresa


	-- INSERTAR LAS NUEVAS EMPRESAS --
	Insert into vt_empresa 
	select 	Empresa,
			Descripcion,
			razon_social,
			Empresa_Padre,
			RFC,
			Calle,
			Numero,
			Colonia,
			Codigo_Postal,
			Pais,
			Estado,
			Ciudad,
			Municipio,
			Telefono,
			Estatus
	from 	vt_empresa_TEMP et
	where	not exists(select 1 from vt_empresa e where et.Empresa = e.Empresa)



	-- Inhabilitar Empresas --
	update  vt_empresa 
	set		Estatus = 0
	where 	empresa in (4200, 9200)


	-- N O M I N A S --
	-- ACTUALIZAR LAS NOMINAS EXISTENTES --
	update	VT_Nomina
	set		Desc_esp		= t.Desc_esp,
			Desc_ing		= t.Desc_ing,
			id_AgrupaNomina = t.id_AgrupaNomina,
			Estatus			= t.Estatus
	from	VT_Nomina n,
			VT_Nomina_TEMP t
	where	n.Empresa			= t.Empresa
			and	n.EmpresaFuente = t.EmpresaFuente
			and	n.Nomina		= t.Nomina

	-- INSERTAR LAS NUEVAS NOMINAS --
	Insert into VT_Nomina 
	select 	t.* 
	from 	VT_Nomina_TEMP t
	where	not exists (select 	1 
						from 	vt_Nomina n
						where	n.Empresa			= t.Empresa
								and	n.EmpresaFuente = t.EmpresaFuente
								and	n.Nomina		= t.Nomina)
			
	-- P U E S T O S --
	-- ACTUALIZAR LOS PUESTOS EXISTENTES --
	update	VT_Puesto
	set		Puesto		= t.Puesto,
			Desc_esp	= t.Desc_esp,
			Desc_ing	= t.Desc_ing,
			id_Nivel	= t.id_Nivel
	from	VT_Puesto p,
			VT_Puesto_temp t
	where	p.Empresa				= t.Empresa
			and	p.EmpresaFuente		= t.EmpresaFuente
			and	p.id_nivel_puesto	= t.id_nivel_puesto

	-- INSERTAR LOS NUEVOS PUESTOS --
	Insert into VT_Puesto 
	select 	t.* 
	from 	VT_Puesto_TEMP t
	where	not exists (select 	1
						from 	VT_Puesto p
						where	p.Empresa				= t.Empresa
								and	p.EmpresaFuente		= t.EmpresaFuente
								and	p.id_nivel_puesto	= t.id_nivel_puesto)



	-- N I V E L E S   D E   E M P L E A D O --
	--ACTUALIZAR LOS NIVELES EXISTENTES
	update	VT_NivelEmpleado
	set	Desc_esp = t.Desc_esp,
		Desc_ing = t.Desc_ing,
		id_NivelEmpleado_Empresa = t.id_NivelEmpleado_Empresa,
		Estatus	= t.Estatus
	from	VT_NivelEmpleado ne,
		VT_NivelEmpleado_TEMP t
	where	ne.Empresa = t.Empresa
	and	ne.EmpresaFuente = t.EmpresaFuente
	and	ne.id_NivelEmpleado = t.id_NivelEmpleado

	--INSERTAR LOS NUEVOS NIVELES
	Insert into VT_NivelEmpleado 
	select 	t.* 
	from 	VT_NivelEmpleado_TEMP t
	where	not exists (	select 	1 
				from 	VT_NivelEmpleado ne
				where	ne.Empresa = t.Empresa
				and	ne.EmpresaFuente = t.EmpresaFuente
				and	ne.id_NivelEmpleado = t.id_NivelEmpleado
				)




	--  S U C U R S A L   I M S S  --
	--ACTUALIZAR LAS SUCURSALES EXISTENTES
	update	VT_SucursalIMSS
	set	Razon_Social = t.Razon_Social,
		Reg_Patronal = t.Reg_Patronal,
		Calle = t.Calle,
		Numero = t.Numero,
		Colonia = t.Colonia,
		DelegacionMunicipio = t.DelegacionMunicipio,
		Ciudad = t.Ciudad,
		Estado = t.Estado,
		Zona = t.Zona,
		Localidad = t.Localidad,
		Estatus = t.Estatus
	from	VT_SucursalIMSS si,
		VT_SucursalIMSS_TEMP t
	where	si.Empresa = t.Empresa
	and	si.EmpresaFuente = t.EmpresaFuente
	and	si.Sucursal_IMSS = t.Sucursal_IMSS


	--INSERTAR LAS NUEVAS SUCURSALES
	Insert into VT_SucursalIMSS 
	select 	t.* 
	from 	VT_SucursalIMSS_TEMP t
	where	not exists (	select 	1 
				from 	VT_SucursalIMSS si
				where	si.Empresa = t.Empresa
				and	si.EmpresaFuente = t.EmpresaFuente
				and	si.Sucursal_IMSS = t.Sucursal_IMSS
				)

	

				-- P E R S O N A S --
/*****	QUERYS DE VALIDACION EMPLEADOS Y RFC DUPLICADOS	*****/

	--obtener duplicados por numero de empleado
	--drop table #Emp 
	select 	empleado, Empresa, cont=count(*) 
	into #Emp
	from 	VT_Empleados_TEMP
	where	Estatus <> 2
	group by empleado, Empresa
	having count(*) > 1


	--drop table #Empleados
	--Tomar el empleado con la fecha_alta mas actual
	select 	e.* 
	into #Empleados 
	from 	VT_Empleados_TEMP e,
		#Emp t
	where	e.empleado = t.empleado 
	and	e.Fecha_Alta = (select 	max(Fecha_Alta) 
				from	VT_Empleados_TEMP 
				where 	empleado = t.empleado
				)
				
	CREATE NONCLUSTERED INDEX IX_Epleados_Paso ON #Empleados
	(
		[RFC] ASC
	)

	--obtener duplicados por rfc
	--DROP TABLE #RFC
	select 	RFC, empleado, cont=count(*) 
	into	#RFC
	from 	VT_Empleados_TEMP
	where	Estatus not in (2, 4)
	group by RFC, empleado
	having count(*) > 1
	

	--Tomar el empleado con la fecha_alta mas actual
	insert into #empleados
	select 	e.* 
	from 	VT_Empleados_TEMP e,
			#RFC t
	where	e.RFC = t.RFC
			and	e.empleado = t.empleado
			and	e.Fecha_Alta = (select 	max(Fecha_Alta) 
								from	VT_Empleados_TEMP 
								where 	empleado = t.empleado
								)
			and not exists(select 1 from #empleados e2 where t.empleado = e2.empleado)


	--inserta empleados depurados
	insert into #empleados
	select 	e.*
	from 	VT_Empleados_TEMP e
	where 	not exists(select 1 from #empleados e2 where e.empleado = e2.empleado)



/*****	QUERYS PARA CREAR EL ID_VERZATEC UNICO POR EMPLEADO (Antes RFC)	*****/
	--ACTUALIZA PERSONAS EXISTENTES
	update 	VT_Recursos
	set	CURP = t.CURP,
		Nombre = t.Nombre,
		Paterno = t.Paterno,
		Materno	= t.Materno
	from	#empleados t,
		VT_Recursos r
	where	t.RFC = r.RFC 
	and	t.estatus <> 2	

	--INSERTA NUEVAS PERSONAS
	insert into VT_Recursos
	Select 	e.RFC,
			e.CURP,
			e.Nombre,
			e.Paterno,
			e.Materno	
	from	#empleados e
	where	not exists(select 1 from VT_RecursoEmpresa re where e.empleado = re.Empleado)
			and	estatus <> 2



/*****	QUERYS PARA INSERTAR LOS DATOS DE EMPLEADOS	*****/
	--SI NO VIENE EN LA VISTA DAR DE BAJA A LA PERSONA
	UPDATE 	vt_RecursoEmpresa 
	Set		Estatus = 2,
			Fecha_Baja = case when Fecha_Baja is Null then getdate() end
	from	vt_RecursoEmpresa re
	where	not exists(	select	1 
						from	VT_Empleados_TEMP e
						where	re.Empresa = e.Empresa and
								re.Empleado = e.Empleado and
								re.EmpresaFuente = e.EmpresaFuente)
			and exists(	select	1
						from	VT_Empleados_TEMP e2
						where	re.Empresa = e2.Empresa)
	

	--MODIFICAR A LOS RECURSOS DE LAS EMPRESAS YA EXISTENTES
	Update 	VT_RecursoEmpresa
	set	Empresa = t.Empresa,
		Empleado = t.Empleado,
		EmpresaFuente = t.EmpresaFuente,
		id = t.id,
		Nomina = t.Nomina,
		id_NivelEmpleado = t.id_NivelEmpleado,
		Fecha_Alta = t.Fecha_Alta,
		Fecha_Antiguedad = t.Fecha_Antiguedad,
		Fecha_Baja = t.Fecha_Baja,
		Fecha_Reingreso = t.Fecha_Reingreso,
		Fecha_Nacimiento = t.Fecha_Nacimiento,
		cedula_IMSS = t.cedula_IMSS,
		Sucursal_IMSS = t.Sucursal_IMSS,
		e_mail = t.e_mail,
		Banco = t.Banco,
		CuentaBanco = t.CuentaBanco,		
		Estatus = t.Estatus
	from 	#empleados t,
			VT_RecursoEmpresa re
	where	t.empleado = re.empleado
			and	t.Empresa = re.Empresa
			and	t.EmpresaFuente = re.EmpresaFuente


	--INSERTAR A LOS RECURSOS NUEVOS 
	Insert into VT_RecursoEmpresa
	Select 	rv.id_recurso_vt,
			t.Empresa,
			t.Empleado,
			t.EmpresaFuente,
			t.id,
			t.Nomina,
			t.id_NivelEmpleado,
			t.Fecha_Alta,
			t.Fecha_Antiguedad,
			t.Fecha_Baja,
			t.Fecha_Reingreso,
			t.Fecha_Nacimiento,
			t.cedula_IMSS,
			t.Sucursal_IMSS,
			t.e_mail,
			t.Banco,
			t.CuentaBanco,
			t.Estatus
	from	#empleados t,
			VT_Recursos rv
	where	t.RFC = rv.RFC and
			not exists(	select	1
						from	VT_RecursoEmpresa re
						where	t.empleado = re.empleado and
								t.empresa = re.empresa and
								t.EmpresaFuente = re.EmpresaFuente)
	

	--  E M P L E A D O S   P L A Z A S  --	

--CERRAR PUESTOS COMO HISTORIA
-- 	update	vt_EmpleadosPlazas
-- 	set		fecha_vigencia_hasta = t.fecha_vigencia_hasta
-- 	from	vt_EmpleadosPlazas ep,
-- 			vt_EmpleadosPlazas_TEMP t
-- 	where	ep.Empresa = t.Empresa
-- 	and		ep.EmpresaFuente = t.EmpresaFuente
-- 	and		ep.Plaza = t.plaza
-- 	and		ep.Fecha_vigencia_desde = t.Fecha_vigencia_desde
-- 	and		ep.Fecha_vigencia_hasta is null
-- 	and		not t.Fecha_vigencia_hasta is null

	--DEPURAR PLAZAS DE LA COMPAÑÍA
	Delete 	vt_EmpleadosPlazas 
	where 	empresa in (select 	distinct Empresa 
						from 	vt_EmpleadosPlazas_TEMP
						)

	--INSERTAR NUEVA HISTORIA DE PUESTOS
	Insert into vt_EmpleadosPlazas 
	select 	t.Empresa,
			t.EmpresaFuente,
			t.Plaza,
			re.id_Recurso_vt,
			t.fecha_vigencia_desde,
			t.fecha_vigencia_hasta                                   
	from 	vt_EmpleadosPlazas_TEMP t,
			vt_RecursoEmpresa re
	where	re.Empresa = t.Empresa
	and		re.EmpresaFuente = t.EmpresaFuente
	and		re.Empleado = t.Empleado	



				--  E S T R U C T U R A  --	
	IF NOT EXISTS(SELECT 1 FROM VT_Estructura where estructura = 1)
			Insert into VT_Estructura Values (1, 'Estructura de Centros de Costos', '', 10, 1, 1)
	IF NOT EXISTS(SELECT 1 FROM VT_Estructura where estructura = 2)
			Insert into VT_Estructura Values (2, 'Estructura Matricial', '', 2, 0, 1)
	IF NOT EXISTS(SELECT 1 FROM VT_Estructura where estructura = 3)
			Insert into VT_Estructura Values (3, 'Entidad', '',1, 0, 1)
	IF NOT EXISTS(SELECT 1 FROM VT_Estructura where estructura = 4)
			Insert into VT_Estructura Values (4, 'Ubicacion', '',1, 0, 1)


				--  O R G A N I G R A M A  --

	--ACTUALIZAR CAMBIOS EN EL ORGANIGRAMA 

	--PLAZAS INACTIVAS
	update 	VT_Organigrama
	set 	FechaBaja = getdate(),
		Estatus = 0	
	from 	VT_Organigrama o
	where 	not exists
		(select 1
		 from 	VT_Organigrama_TEMP
		Where	Plaza = o.plaza
		and	Empresa = o.Empresa
		and	EmpresaFuente = o.EmpresaFuente 
		and	id_nivel_puesto = o.id_nivel_puesto
		)
	and	o.Empresa in (select distinct Empresa from VT_Organigrama_TEMP)


--	OBTENER EL ID_RECURSO_VT
	select 	distinct ot.*, re.id_recurso_vt
	into 	#VT_Organigrama_temp_PASO
	from 	VT_Organigrama_temp ot,
			VT_RecursoEmpresa re
	where 	re.Empresa =* ot.Empresa
	and		re.EmpresaFuente =* ot.EmpresaFuente
	and		re.Empleado =* ot.Empleado
	and		re.Estatus not in (2, 4)
	--and		ot.Empleado not in (43160)--CACM


--Actualizar ATRIBUTOS de la plaza
	update 	VT_Organigrama
	set		CentroCosto = ot.CentroCosto,
			Area = ot.Area,
			id_Recurso_vt = isnull(ot.id_Recurso_vt, 0),
			TipoPlaza = ot.TipoPlaza,
			Staff = ot.Staff,
		    Publica	= ot.Publica,
			Entidad = ot.Entidad,
			EstructuraUbicacion = ot.EstructuraUbicacion,
			Ubicacion = ot.Ubicacion,
			Estatus = ot.Estatus,
			APLICA_HABILIDADES = ot.APLICA_HABILIDADES
	from 	#VT_Organigrama_temp_PASO ot,
			VT_Organigrama o			
	where	ot.plaza = o.plaza
	and		ot.empresa = o.empresa
	and		ot.EmpresaFuente = o.EmpresaFuente
 	and		ot.id_nivel_puesto = o.id_nivel_puesto
--        and    ot.EmpresaFuente <> 12

	--Actualiza DEPENDENCIAS entre mismas compañías
	update 	VT_Organigrama
	set	Plaza_Superior = ot.Plaza_Superior,
		Empresa_Superior = ot.Empresa_Superior,
		EmpresaFuente_Superior = ot.EmpresaFuente_Superior
	from 	VT_Organigrama o,
		VT_Organigrama_TEMP ot
	where	o.plaza = ot.plaza
	and	o.empresa = ot.empresa
	and	o.EmpresaFuente = ot.EmpresaFuente
	and	o.id_nivel_puesto = ot.id_nivel_puesto
	--Donde la dependencia es de la misma Empresa
	and	o.Empresa = o.Empresa_Superior
	and	o.EmpresaFuente = o.EmpresaFuente_Superior
	and	o.Estatus = 1



	--INSERTAR NUEVAS PLAZAS y plazas Vacantes
	insert into VT_Organigrama
	Select	distinct ot.Plaza,
			ot.Empresa,
			ot.EmpresaFuente,
			ot.id_nivel_puesto,
			ot.CentroCosto,
			ot.Area,
			ot.Entidad,
			ot.EstructuraUbicacion,
			ot.Ubicacion,
			isnull(re.id_Recurso_vt, 0),
			ot.TipoPlaza,
			ot.Staff,
			ot.Publica,
			ot.Plaza_Superior,
			ot.Empresa_Superior,
			ot.EmpresaFuente_Superior,
			Null,
			Null,
			Null,
			ot.Estatus,
			Null
	from 	VT_Organigrama_TEMP ot,
			vt_recursoempresa re
	where	re.empresa =* ot.empresa
			and	re.empleado =* ot.empleado
			and	re.estatus <> 2			
			and not exists(	select	1
						from	VT_Organigrama o
						where	o.Plaza				= ot.Plaza and
								o.Empresa			= ot.Empresa and
								o.EmpresaFuente		= ot.EmpresaFuente and
								o.id_nivel_puesto	= ot.id_nivel_puesto)
	
	-- Validar con datos el query modificado con left join		
	--from	VT_Organigrama_TEMP ot
	--		left join VT_RecursoEmpresa re on	ot.Empresa = re.Empresa and
	--											ot.Empleado = re.Empleado and
	--											re.Estatus <> 2
	--where not exists(	select	1
	--					from	VT_Organigrama o
	--					where	o.Plaza				= ot.Plaza and
	--							o.Empresa			= ot.Empresa and
	--							o.EmpresaFuente		= ot.EmpresaFuente and
	--							o.id_nivel_puesto	= ot.id_nivel_puesto)
	

/*CACM: 30-Oct-2010. Quito Parche Plaza
update 	VT_Organigrama
set 	Plaza_Superior = 16231,
	Empresa_Superior = 5000,
	EmpresaFuente_Superior = 2
where
	plaza = 16893 --Plaza de Director Stabilit Europa
	or 
	plaza = 16761 --Plaza de Director Stabilit America	
and	Estatus = 1
*/

/*-----------------------------------------------------------*/

	--ACTUALIZAR LO EXISTENTE
	update	VT_NivelesEstructura
  	set	Nivel	= t.Nivel,
		id_NivelSuperior = t.id_NivelSuperior,
		Desc_esp = t.Desc_esp,
		Desc_ing = t.Desc_ing,
		Fecha_Vigencia_Desde = t.Fecha_Vigencia_Desde,
		Fecha_Vigencia_Hasta = t.Fecha_Vigencia_Hasta,
		Estatus = t.Estatus
	from	VT_NivelesEstructura n,
		VT_NivelesEstructura_TEMP t
	where	n.id_NivelEstructura = t.id_NivelEstructura
	and	n.Empresa = t.Empresa
	and	n.EmpresaFuente = t.EmpresaFuente
	and	n.EmpresaFuente <> 12
	and	n.Estructura = t.Estructura

	--INSERTAR LO NUEVO
	Insert into VT_NivelesEstructura 
	select 	t.* 
	from 	VT_NivelesEstructura_TEMP t
	where	not exists (	select 	1 
				from 	VT_NivelesEstructura n
				where	n.id_NivelEstructura = t.id_NivelEstructura
				and	n.Empresa = t.Empresa
				and	n.EmpresaFuente = t.EmpresaFuente
				and	n.Estructura = t.Estructura
				)


		--	TABULADOR	--
	--ACTUALIZAR LO EXISTENTE
	update	VT_Tabulador
  	set	Desc_esp = t.Desc_esp,
		Desc_ing = t.Desc_ing,
		Estatus = t.Estatus
	from	VT_Tabulador n,
		VT_Tabulador_TEMP t
	where	n.Empresa = t.Empresa
	and	n.EmpresaFuente = t.EmpresaFuente
	and	n.Tabulador = t.Tabulador

	--INSERTAR LO NUEVO
	Insert into VT_Tabulador 
	select 	t.* 
	from 	VT_Tabulador_TEMP t
	where	not exists (	select 	1 
				from 	VT_Tabulador n
				where	n.Empresa = t.Empresa
				and	n.EmpresaFuente = t.EmpresaFuente
				and	n.Tabulador = t.Tabulador
				)


		--	TABULADOR PUESTO	--
	--ACTUALIZAR LO EXISTENTE
	update	VT_TabuladorPuesto
  	set	Nivel_Tabular = t.Nivel_Tabular,
		Minimo = t.Minimo,
		Medio = t.Medio,
		Maximo = t.Maximo,
		Estatus = t.Estatus
	from	VT_TabuladorPuesto n,
		VT_TabuladorPuesto_TEMP t
	where	n.Empresa = t.Empresa
	and	n.EmpresaFuente = t.EmpresaFuente
	and	n.Tabulador = t.Tabulador
	and	n.Puesto = t.Puesto

	--INSERTAR LO NUEVO
	Insert into VT_TabuladorPuesto 
	select 	t.* 
	from 	VT_TabuladorPuesto_TEMP t
	where	not exists (	select 	1 
				from 	VT_TabuladorPuesto n
				where	n.Empresa = t.Empresa
				and	n.EmpresaFuente = t.EmpresaFuente
				and	n.Tabulador = t.Tabulador
				and	n.Puesto = t.Puesto
				)




	--  RECIBOS  --
	--CATALOGO DE TIPOS DE MOVIMIENTO 
	IF NOT EXISTS(SELECT 1 FROM VT_CatTipoMovimiento where id_TipoMovimiento = 1)
			Insert into VT_CatTipoMovimiento Values (1, 'Percepción', '', 1)
	IF NOT EXISTS(SELECT 1 FROM VT_CatTipoMovimiento where id_TipoMovimiento = 2)
			Insert into VT_CatTipoMovimiento Values (2, 'Deducción', '', 1)

	--CATALOGO DE TIPOS DE RECIBO
	IF NOT EXISTS(SELECT 1 FROM VT_CatTipoRecibo where id_TipoRecibo = 1)
			Insert into VT_CatTipoRecibo Values (1, 'Nomia Normal', '',  '- RECIBI DE CONFORMIDAD LA CANTIDAD ESPECIFICADA EN NETO A PAGAR, CON LA QUE QUEDAN LIQUIDADAS TODAS MIS PERCEPCIONES HASTA LA FECHA QUE SE INDICA.', '', 1)
	IF NOT EXISTS(SELECT 1 FROM VT_CatTipoRecibo where id_TipoRecibo = 2)
			Insert into VT_CatTipoRecibo Values (2, 'Aguinaldo', '',  '- TE COSTO MUCHO TRABAJO GANARLO...ADMINISTRALO BIEN Y QUE DISFRUTES TU AGUINALDO CON TU FAMILIA.', '', 1)
	IF NOT EXISTS(SELECT 1 FROM VT_CatTipoRecibo where id_TipoRecibo = 3)
			Insert into VT_CatTipoRecibo Values (3, 'Retiros de Caja de Ahorro', '',  '- RECIBI EN MI CUENTA DE NOMINA EL IMPORTE TOTAL QUE SOLICITE COMO RETIRO DE MI SALDO DE LA CUENTA INDIVIDUAL DE LA CAJA DE AHORRO.', '', 1)
	IF NOT EXISTS(SELECT 1 FROM VT_CatTipoRecibo where id_TipoRecibo = 4)
			Insert into VT_CatTipoRecibo Values (4, 'Traspaso Fondo de Ahorro - Caja de Ahorro', '',  '- RECIBI EN MI CUENTA DE CAJA DE AHORRO EL IMPORTE TOTAL CORRESPONDIENTE DE LAS APORTACIONES DE EMPLEADO Y EMPRESA DE FONDO DE AHORRO MAS INTERESES CORRESPONDIEN
TES AL EJERCICIO ANUAL AGOSTO 2002 JULIO 2003 CON LO QUE QUEDA LIQUIDADA LA PRESTACION DEL EJERCICIO.', '', 1)



-- select * from VT_EmpleadoSueldo_TEMP
--  E M P L E A D O S   S U E L D O S  --
--ACTUALIZAR SUELDOS EXISTENTES SOLO SI CAMBIAN
-- select * from VT_EmpleadoSueldo 

------CACM: 05-Mar-2012----
/*
	select id_recurso_vt, COUNT(*)
	from VT_EmpleadoSueldo
	where fecha_vigencia_hasta is null	
	AND id_recurso_vt IN (SELECT id_recurso_vt FROM ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec)
	group by id_recurso_vt
	having COUNT(*)>1
	--26 personas con doble null
*/	
--select * into VT_EmpleadoSueldo_Resp05Mar12 from VT_EmpleadoSueldo--(13591 row(s) affected)
    
--select * from VT_EmpleadoSueldo where id_recurso_vt in (5009,7104,5003) and fecha_vigencia_hasta is null
--delete from VT_EmpleadoSueldo where id_recurso_vt in (5009,7104,5003) and fecha_vigencia_hasta is null

--select * from VT_EmpleadoSueldo where fecha_vigencia_hasta is null--2151 rows

--select 2154-26-- =2128

delete from VT_EmpleadoSueldo where fecha_vigencia_hasta is null--CACM: 05-Mar-2012
--select * from VT_EmpleadoSueldo where fecha_vigencia_hasta is null--2154 rows
-------*****************************************-------------------------


	update	VT_EmpleadoSueldo
	set		id_Moneda = t.id_Moneda,
			fecha_vigencia_hasta = t.fecha_vigencia_hasta,
			sueldo_mensual = t.sueldo_mensual,
			sueldo_diario = t.sueldo_diario,
			sueldo_hora = t.sueldo_hora,
			sueldo_admvo = t.sueldo_admvo,
			tabulador = t.tabulador,
			nivel_tabular = t.nivel_tabular
	from	VT_EmpleadoSueldo es,
			vt_recursoempresa re,
			VT_EmpleadoSueldo_TEMP t
	where	re.Empresa = t.Empresa
	and		re.EmpresaFuente = t.EmpresaFuente
	and		re.Empleado = t.Empleado
	and		re.estatus not in (2, 4)
	and		es.id_recurso_vt = re.id_recurso_vt
	and		es.fecha_vigencia_desde = t.fecha_vigencia_desde	
	and		re.empresa = t.Empresa



	--INSERTAR SUELDOS NUEVOS
	Insert into VT_EmpleadoSueldo 
	select 	re.id_recurso_vt,
			t.Empresa,
			t.EmpresaFuente,
			t.id_Moneda,
			t.fecha_vigencia_desde,
			t.fecha_vigencia_hasta,
			t.sueldo_mensual,
			t.sueldo_diario,
			t.sueldo_hora,
			t.sueldo_admvo,
			t.tabulador,
			t.nivel_tabular
			--CACM: 04-Mar-2013--
			,1--Nuevo campo estatus para SIRA: 1.Activo / 2.Inactivo
			---------------------
	from 	VT_EmpleadoSueldo_TEMP t,
			vt_recursoempresa re
	where	re.Empresa = t.Empresa
	and		re.EmpresaFuente = t.EmpresaFuente
	and		re.Empleado = t.Empleado
	and		re.estatus not in (2, 4)
	and		not exists (	select 	1 
							from 	VT_EmpleadoSueldo es
							where	es.id_recurso_vt = re.id_recurso_vt
							and		es.Empresa = t.Empresa
							and		es.EmpresaFuente = t.EmpresaFuente
							and		es.fecha_vigencia_desde = t.fecha_vigencia_desde	
						)
---and re.id_recurso_vt in (5009,7104,5003)

---PARCHE CACM 23-Oct-2012. Poner a Ana Alvarez en dos plazas distintas-----------------------------------------
--update VT_Organigrama set id_recurso_vt=5335 
--where Empresa=5000 and EmpresaFuente=11 and id_nivel_puesto = 1332

---PARCHE CACM 24-Oct-2012. Poner a Ana Alvarez en dos plazas distintas 
--y además bajar un nivel esa plaza,en vez de estar bajo el Sr. Senicero, ponerla abajo de Ana Alvarez
--y con esto Ana Alvarez depende de Ana Alvarez
--update VT_Organigrama set id_recurso_vt=5335, plaza_superior=16893,EmpresaFuente_Superior=11 
--where Empresa=5000 and EmpresaFuente=11 and id_nivel_puesto = 1332


UPDATE VT_Organigrama set Plaza_Superior = 16231, EmpresaFuente_Superior=2 WHERE plaza = 16761 and EmpresaFuente = 10
UPDATE VT_Organigrama set Plaza_Superior = 16231, EmpresaFuente_Superior=2 WHERE plaza = 16893 and empresafuente = 11
UPDATE VT_Organigrama set Plaza_Superior = 16231, EmpresaFuente_Superior=2 WHERE plaza = 1 and EmpresaFuente = 12

--Pruebas
/*
select * from ORGANIZACION_VZT.dbo.VT_Organigrama where id_recurso_vt= 14314
--update ORGANIZACION_VZT.dbo.VT_Organigrama set Plaza_Superior=16893 where id_recurso_vt= 14314
select * from ORGANIZACION_VZT.dbo.VT_Organigrama where id_recurso_vt=7052 and Estatus=1
select * from ORGANIZACION_VZT.dbo.VT_Organigrama where Plaza in (16893,16845)and EmpresaFuente=11 and Estatus=1
*/
----------------------------------------------------------------------------------------------------------------

--CACM: 05-Mar-2013. Parches para efectos del SIRA 2013--
--Caso 52380-JOSE LUIS OCHOA
update Organizacion_VZT.dbo.VT_EmpleadoSueldo		
set sueldo_admvo = 83739.9
where id_recurso_vt in (select id_recurso_vt 
                        from ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec
                        where Empleado in (52380))
and fecha_vigencia_desde='2011-04-01 00:00:00.000'   


update Organizacion_VZT.dbo.VT_EmpleadoSueldo	
set estatus=2	
where id_recurso_vt in (select id_recurso_vt 
                        from ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec
                        where Empleado in (52380))
and fecha_vigencia_desde='2012-03-16 00:00:00.000'

--Caso 51900-JORGE LACAYO
update Organizacion_VZT.dbo.VT_EmpleadoSueldo	
set sueldo_admvo=62880	
where id_recurso_vt in (select id_recurso_vt
                        from ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec
                        where Empleado in (51900))          
and fecha_vigencia_desde='2011-04-01 00:00:00.000'   

--DANIEL MELENDEZ
UPDATE Organizacion_VZT.dbo.VT_EmpleadoSueldo	
SET sueldo_admvo=39588.9	
where id_recurso_vt in (select id_recurso_vt 
                        from ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec
                        where Empleado in (43754))          
and fecha_vigencia_desde='2011-04-01 00:00:00.000'      


--BENIGNO
update Organizacion_VZT.dbo.VT_EmpleadoSueldo
SET sueldo_admvo=40131.9		
where id_recurso_vt in (select id_recurso_vt 
                        from ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec
                        where Empleado in (45238))         
and fecha_vigencia_desde='2011-04-01 00:00:00.000' 


--CARLOS NOE
update Organizacion_VZT.dbo.VT_EmpleadoSueldo	
set sueldo_admvo=33778.5 	
where id_recurso_vt in (select id_recurso_vt 
                        from ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec
                        where Empleado in (46005))         
and fecha_vigencia_desde='2011-04-01 00:00:00.000' 

--Correo de Gerardo Cuervo
update VT_RecursoEmpresa 
set e_mail = 'gerardo.cuervo@imsaplastics.com'
where empleado = 51621




GO
/****** Object:  StoredProcedure [dbo].[SPI_AsignaDependencia]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Objetivo: Asignación de Jefe inmediato en Estructura Nueva desde aplicacion SADO VERZATEC
	Creado Por: Jaime Sánchez
	Fecha:	25-Oct-2006
*/
CREATE Proc [dbo].[SPI_AsignaDependencia]
	@PlazasSub varchar(8000),
	@IDJefe int=0,
	@PlazaVacJefe varchar(100)='',
	@IDUsuario int
AS
/*
declare @PlazasSub varchar(8000),
	@IDJefe int,
	@PlazaVacJefe varchar(100),
	@IDUsuario int
Select	@PlazasSub = ',5000-7-188,5000-7-178,',
	@IDJefe = 0,
	@PlazaVacJefe = '5000-7-1',
	@IDUsuario = 3654
*/
	Declare @plaza_superior int,
		@Empresa_Superior int,
		@EmpresaFuente_Superior int

	Select	@plaza_superior = plaza,
		@Empresa_Superior = Empresa,
		@EmpresaFuente_Superior = EmpresaFuente
	from 	vt_Organigrama
	where 	(id_Recurso_vt = @IDJefe OR @IDJefe = 0)
	and	(rtrim(cast(Empresa as char))+'-'+rtrim(cast(EmpresaFuente as char))+'-'+rtrim(cast(plaza as char)) = @PlazaVacJefe OR @PlazaVacJefe = '')
	and	Estatus = 1
	

	update 	vt_Organigrama
	set	plaza_superior = @plaza_superior,
		Empresa_superior = @Empresa_superior,
		EmpresaFuente_superior = @EmpresaFuente_superior,
		ModificadoPor = @IDUsuario,
		FechaModificacion = getdate()
	where	charindex(','+rtrim(cast(Empresa as char))+'-'+rtrim(cast(EmpresaFuente as char))+'-'+rtrim(cast(plaza as char))+',', @PlazasSub) > 0


/*
select * from vt_Organigrama
where	charindex(','+rtrim(cast(Empresa as char))+'-'+rtrim(cast(EmpresaFuente as char))+'-'+rtrim(cast(plaza as char))+',', @PlazasSub) > 0	
		
Plaza       Empresa     EmpresaFuente id_nivel_puesto CentroCosto          Area                 id_Recurso_vt TipoPlaza   Staff       Publica     Plaza_Superior Empresa_Superior EmpresaFuente_Superior Fecha_Vigencia                                         ModificadoPor FechaModificacion                                      Estatus     
----------- ----------- ------------- --------------- -------------------- -------------------- ------------- ----------- ----------- ----------- -------------- ---------------- ---------------------- ------------------------------------------------------ ------------- ------------------------------------------------------ ----------- 
178         5000        7             49              1287                 0                    1131          0           1           2           1              5000             7                      NULL                                                   NULL          NULL                                                   1
188         5000        7             70              1287                 0                    3654          0           0           2           1              5000             7                      NULL                                                   NULL          NULL                                                   1

(2 row(s) affected)

*/

GO
/****** Object:  StoredProcedure [dbo].[SPI_CargaRecibosEstOrg]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SPI_CargaRecibosEstOrg]
as

truncate table VT_ReciboEncabezado_TEMP
truncate table VT_ReciboDetalle_TEMP


exec SNOMB.IMESPRO_Vzt.dbo.SP_RECIBOENCABEZADO_CUP_EMPRESAS
exec SNOMB.IMESPRO_Vzt.dbo.SP_RECIBODETALLE_CUP_EMPRESAS


insert	VT_ReciboEncabezado_TEMP
select	Empleado,
		Empresa,
		EmpresaFuente,
		Anio,
		Mes,
		PeriodoMes,
		PeriodoNomina,
		ID_TIPORECIBO,
		Fecha_Desde,
		Fecha_Hasta,
		CentroCosto,
		Sueldo_Diario,
		Fecha_Antiguedad
from	SNOMB.IMESPRO_Vzt.dbo.VT_ReciboEncabezado_TEMP


insert	VT_ReciboDetalle_TEMP
select	Empleado,
		Empresa,
		EmpresaFuente,
		Anio,
		Mes,
		PeriodoMes,
		PeriodoNomina,
		id_TipoRecibo,
		Secuencia,
		Dip,
		Concepto,
		id_TipoMovimiento,
		Horas_Dias,
		Importe,
		Saldo_Anterior,
		Saldo_Actual,
		Saldo_Anterior_Fondo_Ahorro,
		Saldo_Actual_Fondo_Ahorro,
		Saldo_Anterior_Ahorro_Voluntario,
		Saldo_Actual_Ahorro_Voluntario,
		Saldo_Anterior_Plan_Pensiones,
		Saldo_Actual_Plan_Pensiones,
		Saldo_Anterior_Infonavit,
		Saldo_Actual_Infonavit
from	SNOMB.IMESPRO_Vzt.dbo.VT_ReciboDetalle_TEMP



--INSERTAR LOS RECIBOS DEL PERIODO ACTUAL
Insert into VT_ReciboEncabezado 
select 	re.id_recurso_vt,
	t.* 
from 	VT_ReciboEncabezado_TEMP t,
	VT_RecursoEmpresa re
where	re.Empresa = t.Empresa
and	re.Empleado = t.Empleado
and	re.EmpresaFuente = t.EmpresaFuente
and	not exists (	select 	1 
			from 	VT_ReciboEncabezado
			where	empleado = t.empleado
			and 	Empresa = t.Empresa
			and	EmpresaFuente = t.EmpresaFuente
			and	Anio = t.Anio
			and	Mes = t.Mes
			and	PeriodoMes = t.PeriodoMes
			and	PeriodoNomina = t.PeriodoNomina
			and	id_TipoRecibo = t.id_TipoRecibo
			)
and	re.Estatus not in (2, 4)


--INSERTAR LOS MOVIMIENTOS DEL PERIODO ACTUAL
Insert into VT_ReciboDetalle
select 	re.id_Recibo,
	t.Secuencia,
	t.dip,
	t.Concepto,
	t.id_TipoMovimiento,
	t.Horas_Dias,
	t.Importe,
	t.Saldo_Anterior,
	t.Saldo_Actual,
	t.Saldo_Anterior_Fondo_Ahorro,
	t.Saldo_Actual_Fondo_Ahorro,
	t.Saldo_Anterior_Ahorro_Voluntario,
	t.Saldo_Actual_Ahorro_Voluntario,
	t.Saldo_Anterior_Plan_Pensiones,
	t.Saldo_Actual_Plan_Pensiones,
	t.Saldo_Anterior_Infonavit,
	t.Saldo_Actual_Infonavit
from 	VT_ReciboDetalle_TEMP t,
	VT_ReciboEncabezado re
where	re.Empresa = t.Empresa
and	re.EmpresaFuente = t.EmpresaFuente
and	re.Empleado = t.Empleado
and	re.Anio = t.Anio
and	re.Mes = t.Mes
and	re.PeriodoMes = t.PeriodoMes
and	re.PeriodoNomina = t.PeriodoNomina
and	re.id_TipoRecibo = t.id_TipoRecibo
and	 not exists (select 	1 
				from 	VT_ReciboDetalle d
				where	re.id_Recibo = d.id_Recibo
				)

GO
/****** Object:  StoredProcedure [dbo].[SPI_CargaRecibosEstOrg_SIND]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select * from VT_ReciboEncabezado_TEMP_SIND
select * from VT_ReciboDetalle_TEMP_SIND

select * from VT_ReciboEncabezado_SIND
select * from VT_ReciboDetalle_SIND

*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE proc [dbo].[SPI_CargaRecibosEstOrg_SIND]
as

truncate table VT_ReciboEncabezado_TEMP_SIND
truncate table VT_ReciboDetalle_TEMP_SIND


exec SNOMB.IMESPRO_Vzt.dbo.SP_RECIBOENCABEZADO_CUP_EMPRESAS_SIND
exec SNOMB.IMESPRO_Vzt.dbo.SP_RECIBODETALLE_CUP_EMPRESAS_SIND


insert	VT_ReciboEncabezado_TEMP_SIND
select	Empleado,
		Empresa,
		EmpresaFuente,
		Anio,
		Mes,
		PeriodoMes,
		PeriodoNomina,
		ID_TIPORECIBO,
		Fecha_Desde,
		Fecha_Hasta,
		CentroCosto,
		Sueldo_Diario,
		Fecha_Antiguedad
--CACM: Feb-2014--
,compania
,Nomina		
from	SNOMB.IMESPRO_Vzt.dbo.VT_ReciboEncabezado_TEMP_SIND


insert	VT_ReciboDetalle_TEMP_SIND
select	Empleado,
		Empresa,
		EmpresaFuente,
		Anio,
		Mes,
		PeriodoMes,
		PeriodoNomina,
		id_TipoRecibo,
		Secuencia,
		Dip,
		Concepto,
		id_TipoMovimiento,
		Horas_Dias,
		Importe,
		Saldo_Anterior,
		Saldo_Actual,
		Saldo_Anterior_Fondo_Ahorro,
		Saldo_Actual_Fondo_Ahorro,
		Saldo_Anterior_Ahorro_Voluntario,
		Saldo_Actual_Ahorro_Voluntario,
		Saldo_Anterior_Plan_Pensiones,
		Saldo_Actual_Plan_Pensiones,
		Saldo_Anterior_Infonavit,
		Saldo_Actual_Infonavit
--CACM: Feb-2014--
,compania
,Nomina			
from	SNOMB.IMESPRO_Vzt.dbo.VT_ReciboDetalle_TEMP_SIND



--INSERTAR LOS RECIBOS DEL PERIODO ACTUAL
Insert into VT_ReciboEncabezado_SIND 
select 	re.id_recurso_vt,
	t.* 
from 	VT_ReciboEncabezado_TEMP_SIND t,
	VT_RecursoEmpresa re
where	re.Empresa = t.Empresa
and	re.Empleado = t.Empleado
and	re.EmpresaFuente = t.EmpresaFuente
and	not exists (	select 	1 
			from 	VT_ReciboEncabezado_SIND
			where	empleado = t.empleado
			and 	Empresa = t.Empresa
			and	EmpresaFuente = t.EmpresaFuente
			and	Anio = t.Anio
			and	Mes = t.Mes
			and	PeriodoMes = t.PeriodoMes
			and	PeriodoNomina = t.PeriodoNomina
			and	id_TipoRecibo = t.id_TipoRecibo
			)
and	re.Estatus not in (2, 4)


--INSERTAR LOS MOVIMIENTOS DEL PERIODO ACTUAL
Insert into VT_ReciboDetalle_SIND
select 	re.id_Recibo,
	t.Secuencia,
	t.dip,
	t.Concepto,
	t.id_TipoMovimiento,
	t.Horas_Dias,
	t.Importe,
	t.Saldo_Anterior,
	t.Saldo_Actual,
	t.Saldo_Anterior_Fondo_Ahorro,
	t.Saldo_Actual_Fondo_Ahorro,
	t.Saldo_Anterior_Ahorro_Voluntario,
	t.Saldo_Actual_Ahorro_Voluntario,
	t.Saldo_Anterior_Plan_Pensiones,
	t.Saldo_Actual_Plan_Pensiones,
	t.Saldo_Anterior_Infonavit,
	t.Saldo_Actual_Infonavit
--CACM: Feb-2014--
,t.compania
,t.Nomina		
from 	VT_ReciboDetalle_TEMP_SIND t,
	VT_ReciboEncabezado_SIND re
where	re.Empresa = t.Empresa
and	re.EmpresaFuente = t.EmpresaFuente
and	re.Empleado = t.Empleado
and	re.Anio = t.Anio
and	re.Mes = t.Mes
and	re.PeriodoMes = t.PeriodoMes
and	re.PeriodoNomina = t.PeriodoNomina
and	re.id_TipoRecibo = t.id_TipoRecibo
and	 not exists (select 	1 
				from 	VT_ReciboDetalle_SIND d
				where	re.id_Recibo = d.id_Recibo
				)


GO
/****** Object:  StoredProcedure [dbo].[SPI_CargaTempEstOrg]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SPI_CargaTempEstOrg]

as
------------------------------------------------------
-- Depurar tablas temporales de Estructura Verzatec --
------------------------------------------------------

truncate table VT_Empresa_TEMP
truncate table VT_Nomina_TEMP
truncate table VT_NivelEmpleado_TEMP
truncate table VT_Puesto_TEMP
truncate table VT_SucursalIMSS_TEMP
truncate table VT_Empleados_TEMP
truncate table VT_Organigrama_TEMP
truncate table VT_NivelesEstructura_TEMP
truncate table VT_Tabulador_TEMP
truncate table VT_TabuladorPuesto_TEMP
truncate table VT_EmpleadosPlazas_TEMP
truncate table VT_EmpleadoSueldo_TEMP

update VT_RecursoEmpresa 
set e_mail = 'gerardo.cuervo@imsaplastics.com'
where empleado = 51621

---------------------------------------------------------------
-- Carga de tablas temporales, de IMESPRO a ORGANIZACION_VZT --
---------------------------------------------------------------

-- exec 	SP_EMPRESAS_EMP_CUP
insert	VT_Empresa_TEMP
select	compania_datamart,
		razon_social_vzt,				-- Descripción
		razon_social_vzt,				-- Razon_Social
		2,								-- Empresa_Padre
		rfc,
		calle,
		numero,
		colonia,
		codigo_postal,
		pais,
		estado,
		deleg_o_municipio,				-- Ciudad
		deleg_o_municipio,				-- Municipio
		telefono,
		1								-- Estatus
from	SNOMB.IMESPRO_Vzt.dbo.companias
where	compania = 2

-- exec 	SP_NOMINAS_CUP_EMPRESAS
insert	VT_Nomina_TEMP
select	c.compania_datamart,									-- Empresa
		c.compania,												-- Empresa_Fuente
		n.nomina,
		n.descripcion,											-- Desc_Esp
		n.descripcion,											-- Desc_Ing
		case
			when n.descripcion like '%EMPLEADO%'		then 1
			when n.descripcion like '%SIND%'			then 2
			when n.descripcion like '%SUB-CONTRATADO%'	then 3
			when n.descripcion like '%HONORARIOS%'		then 4
			when n.descripcion like '%PRACTICANTE%'		then 5
			else 0
		end,													-- Id_AgrupaNomina			
		1														-- Estatus
from	SNOMB.IMESPRO_Vzt.dbo.companias c join
		SNOMB.IMESPRO_Vzt.dbo.nominas n on c.compania = n.compania
where	c.compania in(1, 2, 3, 4, 5, 7, 8, 10, 11, 12)

-- exec 	SP_NIVELES_EMP_CUP_EMPRESAS
insert	VT_NivelEmpleado_TEMP
select	ni.id_nivel,
		c.compania_datamart,
		c.compania,
		ni.descripcion,
		ni.descripcion_otro_idioma,
		0,
		1
from	SNOMB.IMESPRO_Vzt.dbo.companias c join
		SNOMB.IMESPRO_Vzt.dbo.niveles ni on c.compania = ni.compania
where	c.compania in(1, 2, 3, 4, 5, 7, 8, 10, 11, 12)

-- exec	SP_PUESTOS_CUP_EMPRESAS
insert	VT_Puesto_TEMP
select	c.compania_datamart,										-- Empresa
		c.compania,													-- EmpresaFuente
		p.id_nivel_puesto,
		p.puesto,
		p.descripcion,
		p.descripcion_otro_idioma,
		p.id_nivel
from	SNOMB.IMESPRO_Vzt.dbo.companias c join
		SNOMB.IMESPRO_Vzt.dbo.puestos p on c.compania = p.compania
where	c.compania in(1, 2, 3, 4, 5, 7, 8, 10, 11, 12) and
		p.puesto not in('INAC','IN-1','IN-2','TEMP')


-- exec	SP_SUC_IMSS_CUP_EMPRESAS
insert	VT_SucursalIMSS_TEMP
select	co.compania_datamart,												-- Empresa
		co.compania,														-- Empresa_Fuente
		si.sucursal,
		si.razon_social,
		si.registro_patronal,
		si.calle,
		si.numero,
		si.colonia,
		co.deleg_o_municipio,
		si.ciudad,
		si.estado,
		si.zona,
		si.localidad,
		1																	-- Estatus
from	SNOMB.IMESPRO_Vzt.dbo.companias co join
		SNOMB.IMESPRO_Vzt.dbo.sucursales_imss si on co.compania = si.compania
where	co.compania in(1, 2, 3, 4, 5, 7, 8, 10, 11, 12)


-- exec 	SP_EMPLEADOS_CUP_EMPRESAS
insert VT_Empleados_TEMP
select	e.empleado,
		c.compania_datamart,									-- Empresa
		c.compania,												-- Empresa_Fuente
		e.id,
		e.nomina,
		pu.id_nivel,											-- Id_NivelEmpleado
		r.curp,													-- rfc
		e.cuenta_individual,									-- Curp
		r.nombre,
		r.paterno,
		r.materno,
		e.fecha_alta,
		e.fecha_antiguedad,
		e.fecha_baja,
		e.fecha_reingreso,
		r.fecha_nacimiento,
		e.cedula_imss,
		e.sucursal_imss,
		isnull(cd.email, ' '),		
		isnull(ba.descripcion, ' '),							-- Banco
		isnull(ec.cuenta , ' '),								-- Cuenta_Banco		 
		e.estatus		
		
from 	SNOMB.IMESPRO_Vzt.dbo.companias c
		join SNOMB.IMESPRO_Vzt.dbo.empleados e				on	c.compania				= e.compania and
																e.estatus				in(1, 3, 4) 
		join SNOMB.IMESPRO_Vzt.dbo.recursos r					on	e.id					= r.id
		join SNOMB.IMESPRO_Vzt.dbo.campos_dinamicos cd		on	e.compania				= cd.compania and
															e.id					= cd.id 
		join SNOMB.IMESPRO_Vzt.dbo.empleados_plazas ep		on	e.compania				= ep.compania  and
															e.id					= ep.id and
															ep.fecha_vigencia_hasta	is	null 
		join SNOMB.IMESPRO_Vzt.dbo.plazas pl					on	ep.compania				= pl.compania and
															ep.plaza				= pl.plaza
		join SNOMB.IMESPRO_Vzt.dbo.puestos pu					on	pl.compania				= pu.compania and
															pl.id_nivel_puesto		= pu.id_nivel_puesto

		left join SNOMB.IMESPRO_Vzt.dbo.empleados_cuentas ec	on	e.compania				= ec.compania and
																e.id					= ec.id and
																ec.porcentaje			= 100.00
		left join SNOMB.IMESPRO_Vzt.dbo.bancos ba				on	ec.compania				= ba.compania and
																ec.banco				= ba.banco
union all  ----DEMR Cambio por Caso Francisco Senicero Ene-2017

select	e.empleado,
		c.compania_datamart,									-- Empresa
		c.compania,												-- Empresa_Fuente
		e.id,
		e.nomina,
		pu.id_nivel,											-- Id_NivelEmpleado
		r.curp,													-- rfc
		e.cuenta_individual,									-- Curp
		r.nombre,
		r.paterno,
		r.materno,
		e.fecha_alta,
		e.fecha_antiguedad,
		e.fecha_baja,
		e.fecha_reingreso,
		r.fecha_nacimiento,
		e.cedula_imss,
		e.sucursal_imss,
		isnull(cd.email, ' '),		
		isnull(ba.descripcion, ' '),							-- Banco
		isnull(ec.cuenta , ' '),								-- Cuenta_Banco		 
		e.estatus		
		
from 	SNOMB.IMESPRO_BKP.dbo.companias c
		inner join SNOMB.IMESPRO_BKP.dbo.empleados e				on	c.compania				= e.compania and 
																		e.empleado              = 51466
		join SNOMB.IMESPRO_BKP.dbo.recursos r					on	e.id					= r.id
		join SNOMB.IMESPRO_BKP.dbo.campos_dinamicos cd		on	e.compania				= cd.compania and
															e.id					= cd.id 
		join SNOMB.IMESPRO_BKP.dbo.empleados_plazas ep		on	e.compania				= ep.compania  and
															e.id					= ep.id and
															ep.fecha_vigencia_hasta	is	null 
		join SNOMB.IMESPRO_BKP.dbo.plazas pl					on	ep.compania				= pl.compania and
															ep.plaza				= pl.plaza
		join SNOMB.IMESPRO_BKP.dbo.puestos pu					on	pl.compania				= pu.compania and
															pl.id_nivel_puesto		= pu.id_nivel_puesto

		left join SNOMB.IMESPRO_BKP.dbo.empleados_cuentas ec	on	e.compania				= ec.compania and
																e.id					= ec.id and
																ec.porcentaje			= 100.00
		left join SNOMB.IMESPRO_BKP.dbo.bancos ba				on	ec.compania				= ba.compania and
																ec.banco				= ba.banco




-- exec	SP_ORGANIGRAMA_EMP_CUP
exec SNOMB.IMESPRO_Vzt.dbo.SP_ORGANIGRAMA_EMP_CUP

insert	VT_Organigrama_TEMP
select	*
from	SNOMB.IMESPRO_Vzt.dbo.VT_Organigrama_TEMP 


-- exec	SP_NIVELES_ESTRUCTURA_CUP_EMPRESAS
insert VT_NivelesEstructura_TEMP
select	ni.id_nivel_estructura,
		co.compania_datamart,
		co.compania,
		case
			when es.principal						= 1					then 1	-- Estructura Principal
			when substring(es.descripcion, 1, 2)	= '10'				then 2	-- Estructura de Lugar Físco
			when es.descripcion						like '%ENTIDAD%'	then 3	-- Estructura de Entidad
			when substring(es.descripcion, 1, 2)	= '40'				then 4	-- Estructura Matricial
			else 0
		end,																	-- Estructura
		ni.nivel,
		ni.nivel_superior,
		ni.descripcion,
		' ',																	-- Desc_Ing
		ni.fecha_vigencia_desde,
		ni.fecha_vigencia_hasta,
		1																		-- Estatus
from	SNOMB.IMESPRO_Vzt.dbo.companias co
		join SNOMB.IMESPRO_Vzt.dbo.estructuras es			on	co.compania		= es.compania
		join SNOMB.IMESPRO_Vzt.dbo.niveles_estructura ni	on	es.compania		= ni.compania and
															es.estructura	= ni.estructura and
															ni.fecha_vigencia_hasta is null
where	es.principal					= 1 or
		es.descripcion					like '%ENTIDAD%' or
		substring(es.descripcion,1,2)	= '10' OR 
		substring(es.descripcion,1,2)	= '40'
		

-- exec	SP_TABULADOR_CUP_EMPRESAS
insert	VT_Tabulador_TEMP
select	co.compania_datamart,
		co.compania,
		t.tabulador,
		t.descripcion,
		' ',					-- Descripcion_Ing
		1						-- Estatus
from	SNOMB.IMESPRO_Vzt.dbo.companias co
		join SNOMB.IMESPRO_Vzt.dbo.tabuladores t on co.compania = t.compania


-- exec	SP_VT_TabuladorPuesto_CUP_EMP
insert	VT_TabuladorPuesto_TEMP
select	co.compania_datamart,
		co.compania,
		ta.tabulador,
		tp.id_nivel_puesto,
		nt.nivel_tabular,
		nt.rango1,				-- Minimo
		nt.rango2,				-- Promedio
		nt.rango3,				-- Maximo
		1						-- Estatus
from	SNOMB.IMESPRO_Vzt.dbo.companias co
		join SNOMB.IMESPRO_Vzt.dbo.tabuladores ta				on	co.compania				= ta.compania and
																ta.compania			in(2, 10, 11)
		join SNOMB.IMESPRO_Vzt.dbo.tabuladores_puestos tp		on	ta.compania				= tp.compania and
																ta.tabulador			= tp.tabulador
		join SNOMB.IMESPRO_Vzt.dbo.niveles_tabulares nt		on	tp.compania				= nt.compania and
																tp.tabulador			= nt.tabulador and
																tp.nivel_minimo			= nt.nivel_tabular and
																nt.fecha_vigencia_hasta is null



-- exec	SP_EMPLEADOS_PLAZAS_CUP
insert VT_EmpleadosPlazas_TEMP
select	co.compania_datamart,
		co.compania,
		ep.plaza,
		e.empleado,
		ep.fecha_vigencia_desde,
		ep.fecha_vigencia_hasta
from	SNOMB.IMESPRO_Vzt.dbo.companias co
		join SNOMB.IMESPRO_Vzt.dbo.empleados e			on co.compania	= e.compania
		join SNOMB.IMESPRO_Vzt.dbo.empleados_plazas ep	on e.compania	= ep.compania and
														   e.id			= ep.id
where	co.compania in(1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12)
and     ep.plaza <> 16231
union all --DEMR Cambio por Caso Francisco Senicero Ene-2017
select	co.compania_datamart,
		co.compania,
		ep.plaza,
		e.empleado,
		ep.fecha_vigencia_desde,
		ep.fecha_vigencia_hasta
from	SNOMB.IMESPRO_bkp.dbo.companias co
		join SNOMB.IMESPRO_bkp.dbo.empleados e			on co.compania	= e.compania
		join SNOMB.IMESPRO_bkp.dbo.empleados_plazas ep	on e.compania	= ep.compania and
														   e.id			= ep.id
where	co.compania in(2)
and     ep.plaza = 16231

-- exec	SP_EMPLEADOS_SUELDOS_CUP
insert into vt_empleadosueldo_temp  
select	distinct e.empleado    as empleado,  
		c.compania_datamart  as empresa,   
		c.compania    as empresafuente,  
		es.moneda    as id_moneda,  
		es.fecha_vigencia_desde  as fecha_vigencia_desde,  
		es.fecha_vigencia_hasta  as fecha_vigencia_hasta,  
		es.sueldo_mensual   as sueldo_mensual,  
		es.sueldo_diario   as sueldo_diario,  
		es.sueldo_hora   as sueldo_hora,   
		es.sueldo_admvo   as sueldo_admvo,   
		es.tabulador    as tabulador,   
		es.nivel_tabular   as nivel_tabular  
from	SNOMB.IMESPRO_Vzt.dbo.companias c
		join SNOMB.IMESPRO_Vzt.dbo.empleados e			on	c.compania			= e.compania
		join SNOMB.IMESPRO_Vzt.dbo.empleados_plazas ep	on	e.compania			= ep.compania and
															e.id				= ep.id and
															ep.fecha_vigencia_hasta is null
		join SNOMB.IMESPRO_Vzt.dbo.plazas pl				on	ep.compania			= pl.compania and
															ep.plaza			= pl.plaza
		join SNOMB.IMESPRO_Vzt.dbo.puestos pu				on	pl.compania			= pu.compania and
															pl.id_nivel_puesto	= pu.id_nivel_puesto
		join SNOMB.IMESPRO_Vzt.dbo.empleados_sueldos es	on	ep.compania			= es.compania and
															ep.id				= es.id
where	(
			( e.compania = 2 and e.nomina in(3, 10, 12) ) or
			( e.compania in(10, 11, 12) and e.nomina = 1	)
		)
union all  --DEMR Cambio por Caso Francisco Senicero Ene-2017
select	distinct e.empleado    as empleado,  
		c.compania_datamart  as empresa,   
		c.compania    as empresafuente,  
		es.moneda    as id_moneda,  
		es.fecha_vigencia_desde  as fecha_vigencia_desde,  
		es.fecha_vigencia_hasta  as fecha_vigencia_hasta,  
		es.sueldo_mensual   as sueldo_mensual,  
		es.sueldo_diario   as sueldo_diario,  
		es.sueldo_hora   as sueldo_hora,   
		es.sueldo_admvo   as sueldo_admvo,   
		es.tabulador    as tabulador,   
		es.nivel_tabular   as nivel_tabular  
from	SNOMB.IMESPRO_BKP.dbo.companias c
		join SNOMB.IMESPRO_BKP.dbo.empleados e			on	c.compania			= e.compania
		join SNOMB.IMESPRO_BKP.dbo.empleados_plazas ep	on	e.compania			= ep.compania and
															e.id				= ep.id and
															ep.fecha_vigencia_hasta is null
		join SNOMB.IMESPRO_BKP.dbo.plazas pl				on	ep.compania			= pl.compania and
															ep.plaza			= pl.plaza
		join SNOMB.IMESPRO_BKP.dbo.puestos pu				on	pl.compania			= pu.compania and
															pl.id_nivel_puesto	= pu.id_nivel_puesto
		join SNOMB.IMESPRO_BKP.dbo.empleados_sueldos es	on	ep.compania			= es.compania and
															ep.id				= es.id
where	(
			( e.compania = 2 and e.empleado = 51466)
		)
		
		


GO
/****** Object:  StoredProcedure [dbo].[SPI_CH_Metas]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	Se usa en CH en el Catalogo de Metas
-- =============================================
--SPI_CH_Metas 2009,'20090302',1,1,10
CREATE PROCEDURE [dbo].[SPI_CH_Metas]
	-- Add the parameters for the stored procedure here
		   @Anio as int,
           @FechaCaptura as datetime,
           @Indicador as int,
           @Tipo as int,
           @Meta as int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

IF NOT EXISTS (SELECT [Anio]
      ,[FechaCaptura]
      ,[Indicador]
      ,[Tipo]
      ,[Meta]
  FROM [kiosco].[dbo].[CH_Metas]
	WHERE Anio = @Anio
      and Convert(varchar(10),FechaCaptura, 101) = Convert(varchar(10),@FechaCaptura,101)
      and Indicador = @Indicador
      and Tipo = @Tipo)
begin
	INSERT INTO [kiosco].[dbo].[CH_Metas]
           ([Anio]
           ,[FechaCaptura]
           ,[Indicador]
           ,[Tipo]
           ,[Meta])
     VALUES
           (@Anio,
           @FechaCaptura,
           @Indicador,
           @Tipo,
           @Meta)
end
else
begin
	UPDATE [kiosco].[dbo].[CH_Metas]
   SET [Anio] = @Anio
      ,[FechaCaptura] = @FechaCaptura
      ,[Indicador] = @Indicador
      ,[Tipo] = @Tipo
      ,[Meta] = @Meta
	WHERE Anio = @Anio
      and Convert(varchar(10),FechaCaptura, 101) = Convert(varchar(10),@FechaCaptura,101)
      and Indicador = @Indicador
      and Tipo = @Tipo
end
END

GO
/****** Object:  StoredProcedure [dbo].[SPI_CH_Minutas_vzt]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- grant exec on SPI_CH_Minutas_vzt to pinuser
create proc [dbo].[SPI_CH_Minutas_vzt]	
	@Division  	int = -1,
	@Entidad	int = -1,       
	@Direccion 	int = -1,        
	@Area     	int = -1,
	@Periodo 	int = -1,
	@Fecha		datetime
as

if not exists(select 1 from kiosco.dbo.CH_Minutas_vzt 
			where	Division						= @Division and
					Entidad							= @Entidad and
					Direccion 						= @Direccion and
					Area     						= @Area and
					Periodo 						= @Periodo and
					convert(varchar, Fecha, 112)	= convert(varchar, @Fecha, 112))
begin

	insert kiosco.dbo.CH_Minutas_vzt values(@Division, @Entidad, @Direccion, @Area, @Periodo, convert(varchar, @Fecha, 112))
	
end

GO
/****** Object:  StoredProcedure [dbo].[SPI_Comisiones]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Objetivo: Grabar comisiones de empleados de tiendas
Creado por: Cecilia A. Cárdenas
Fecha: 10-Julio-2007
*/

--drop procedure SPI_Comisiones  
--SPI_Comisiones 3,2,6194,0,'ccardenas','20070710','20070710',1000,'20070710',27,399,'CAMBIE COMISION',"Pendiente",'19000101',0,"Monterrey"
 CREATE Proc [dbo].[SPI_Comisiones] 
  @IdComision int,
  @Compania int,  
  @id int,  
  --@dip varchar(4),  porque siempre será el 120
  @secuencia int, --recibir de la que sigue en eslabón
  @usuario varchar(20),  
  @FechaReg datetime, 
  @FechaMod datetime, 
  @Importe decimal(9,2),  
  @FechaMvto datetime,  
  @idNivelEst int,  
  @idNivelPuesto int,
  @Referencia varchar(5000),
  @Estatus varchar(20),
  @FechaAut datetime,
  @AutPor int,
  @Localidad varchar(40)
 
 AS  
  
 declare @Mensaje varchar(500)  
 Set @Mensaje=''  
  
/*declare @secuencia as int
set @secuencia=0
select @secuencia=isnull(max(secuencia),0) 
from RH_ComisionesCaptura 
where compania=@compania and id=@id and dip=120
set @secuencia=@secuencia+1*/

 if Exists (Select  *  from  RH_ComisionesCaptura where  Id = @Id and @usuario like usuario and month(fecha_registro) = month(@FechaReg) and year(fecha_registro) = year(@FechaReg)) 
  begin  

	  UPDATE RH_ComisionesCaptura SET
	        fecha_modificacion=@FechaMod,
	        importe_capturado=@importe,
	        fecha_mvto=@FechaMvto,
	        referencia=@referencia
	  WHERE IdComision=@IdComision
	   --Set @Mensaje='Ya existe una comisión con esas características para el empleado ' + rtrim(cast(@id as char)) + ', verifique por favor'  
  end  
 else    
  Begin
  Insert into RH_ComisionesCaptura 
       (IdComision,compania,id,dip,secuencia,
        usuario,fecha_registro,fecha_modificacion,
        importe_capturado,fecha_mvto,
        id_nivel_estructura,id_nivel_puesto,
        referencia,estatus,fecha_autorizacion,autorizado_por,localidad)  
  Values (@IdComision,@compania,@id,'120',@secuencia,@usuario,@FechaReg,@FechaMod,@Importe,@FechaMvto,
        @idNivelEst,@idNivelPuesto,@referencia,@Estatus,@FechaAut,@AutPor,@Localidad)  
  END  
  
 --Select Mensaje = @Mensaje

GO
/****** Object:  StoredProcedure [dbo].[SPI_Comisiones_2010]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPI_Comisiones_2010] 
  @IdComision int,
  @Compania int,  
  @id int,  
  @dip varchar(4),  --31-Ago-2010. Se retoma parámetro porque se incluirá nuevo dip
  @secuencia int,   --recibir de la que sigue en eslabón
  @usuario varchar(20),  
  @FechaReg datetime, 
  @FechaMod datetime, 
  @Importe decimal(9,2),  
  @FechaMvto datetime,  
  @idNivelEst int,  
  @idNivelPuesto int,
  @Referencia varchar(5000),
  @Estatus varchar(20),
  @FechaAut datetime,
  @AutPor int,
  @Localidad varchar(40)
 
 AS  
  
 declare @Mensaje varchar(500)  
 Set @Mensaje=''  
  
/*declare @secuencia as int
set @secuencia=0
select @secuencia=isnull(max(secuencia),0) 
from RH_ComisionesCaptura 
where compania=@compania and id=@id and dip=120
set @secuencia=@secuencia+1*/

 if Exists (Select  *  from  RH_ComisionesCaptura 
            where  Id = @Id and @usuario like usuario 
              and month(fecha_registro) = month(@FechaReg) 
              and year(fecha_registro) = year(@FechaReg)
              and dip=@dip) 
  begin  

	  UPDATE RH_ComisionesCaptura SET
	        fecha_modificacion=@FechaMod,
	        importe_capturado=@importe,
	        fecha_mvto=@FechaMvto,
	        referencia=@referencia
	  WHERE IdComision=@IdComision
	   --Set @Mensaje='Ya existe una comisión con esas características para el empleado ' + rtrim(cast(@id as char)) + ', verifique por favor'  
  end  
 else    
  Begin
  Insert into RH_ComisionesCaptura 
       (IdComision,compania,id,dip,
        secuencia,usuario,fecha_registro,fecha_modificacion,
        importe_capturado,fecha_mvto,
        id_nivel_estructura,id_nivel_puesto,
        referencia,estatus,fecha_autorizacion,autorizado_por,localidad)  
  Values (@IdComision,@compania,@id,@dip,
        @secuencia,@usuario,@FechaReg,@FechaMod,@Importe,@FechaMvto,
        @idNivelEst,@idNivelPuesto,@referencia,@Estatus,@FechaAut,@AutPor,@Localidad)  
  END  
  
 --Select Mensaje = @Mensaje

GO
/****** Object:  StoredProcedure [dbo].[SPI_Comisiones_RESP_100709]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
Objetivo: Grabar comisiones de empleados de tiendas  
Creado por: Cecilia A. Cárdenas  
Fecha: 10-Julio-2007  
*/  
  
--drop procedure SPI_Comisiones    
--SPI_Comisiones 3,2,6194,0,'ccardenas','20070710','20070710',1000,'20070710',27,399,'CAMBIE COMISION',"Pendiente",'19000101',0,"Monterrey"  
 CREATE Proc [dbo].[SPI_Comisiones_RESP_100709]   
  @IdComision int,  
  @Compania int,    
  @id int,    
  --@dip varchar(4),  porque siempre será el 120  
  @secuencia int, --recibir de la que sigue en eslabón  
  @usuario varchar(20),    
  @FechaReg datetime,   
  @FechaMod datetime,   
  @Importe decimal(9,2),    
  @FechaMvto datetime,    
  @idNivelEst int,    
  @idNivelPuesto int,  
  @Referencia varchar(5000),  
  @Estatus varchar(20),  
  @FechaAut datetime,  
  @AutPor int,  
  @Localidad varchar(40)  
   
 AS    
    
 declare @Mensaje varchar(500)    
 Set @Mensaje=''    
    
/*declare @secuencia as int  
set @secuencia=0  
select @secuencia=isnull(max(secuencia),0)   
from RH_ComisionesCaptura   
where compania=@compania and id=@id and dip=120  
set @secuencia=@secuencia+1*/  
  
 if Exists (Select  *  from  RH_ComisionesCaptura where  IdComision = @IdComision)    
  begin    
  
   UPDATE RH_ComisionesCaptura SET  
         fecha_modificacion=@FechaMod,  
         importe_capturado=@importe,  
         fecha_mvto=@FechaMvto,  
         referencia=@referencia  
   WHERE IdComision=@IdComision  
    --Set @Mensaje='Ya existe una comisión con esas características para el empleado ' + rtrim(cast(@id as char)) + ', verifique por favor'    
  end    
 else      
  Begin  
  Insert into RH_ComisionesCaptura   
       (IdComision,compania,id,dip,secuencia,  
        usuario,fecha_registro,fecha_modificacion,  
        importe_capturado,fecha_mvto,  
        id_nivel_estructura,id_nivel_puesto,  
        referencia,estatus,fecha_autorizacion,autorizado_por,localidad)    
  Values (@IdComision,@compania,@id,'120',@secuencia,@usuario,@FechaReg,@FechaMod,@Importe,@FechaMvto,  
        @idNivelEst,@idNivelPuesto,@referencia,@Estatus,@FechaAut,@AutPor,@Localidad)    
  END    
    
 --Select Mensaje = @Mensaje

GO
/****** Object:  StoredProcedure [dbo].[SPI_ComisionesGarantizadas]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
Objetivo: Grabar comisiones garantizadas de empleados de tiendas  
Creado por: Cecilia A. Cárdenas  
Fecha: 27-Dic-2007  
*/  
  
--SPI_ComisionesGarantizadas 3,2,6194,0,'ccardenas','20070710','20070710',1000,'20070710',27,399,'CAMBIE COMISION',"Pendiente",'19000101',0,"Monterrey"  
 CREATE Proc [dbo].[SPI_ComisionesGarantizadas]   
  @IdComision int,  
  @Compania int,    
  @id int,    
  --@dip varchar(4),  porque siempre será el 120  
  @secuencia int, --recibir de la que sigue en eslabón  
  @usuario varchar(20),    
  @FechaReg datetime,   
  @FechaMod datetime,   
  @Importe decimal(9,2),    
  @FechaMvto datetime,    
  @idNivelEst int,    
  @idNivelPuesto int,  
  @Referencia varchar(5000),  
  @Estatus varchar(20),  
  @FechaAut datetime,  
  @AutPor int,  
  @Localidad varchar(40)  
   
 AS    
    
 declare @Mensaje varchar(500)    
 Set @Mensaje=''    
      
 if Exists (Select  *  from  RH_ComisionesGarantizadas where  IdComision = @IdComision)    
  begin    
  
   UPDATE RH_ComisionesGarantizadas SET  
         fecha_modificacion=@FechaMod,  
         importe_capturado=@importe,  
         fecha_mvto=@FechaMvto,  
         referencia=@referencia  
   WHERE IdComision=@IdComision  
    --Set @Mensaje='Ya existe una comisión con esas características para el empleado ' + rtrim(cast(@id as char)) + ', verifique por favor'    
  end    
 else      
  Begin  
  Insert into RH_ComisionesGarantizadas   
       (IdComision,compania,id,dip,secuencia,  
        usuario,fecha_registro,fecha_modificacion,  
        importe_capturado,fecha_mvto,  
        id_nivel_estructura,id_nivel_puesto,  
        referencia,estatus,fecha_autorizacion,autorizado_por,localidad)    
  Values (@IdComision,@compania,@id,'120',@secuencia,@usuario,@FechaReg,@FechaMod,@Importe,@FechaMvto,  
        @idNivelEst,@idNivelPuesto,@referencia,@Estatus,@FechaAut,@AutPor,@Localidad)    
  END    
    
 --Select Mensaje = @Mensaje

GO
/****** Object:  StoredProcedure [dbo].[SPI_RH_VistaDocumentos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPI_RH_VistaDocumentos]
	-- Add the parameters for the stored procedure here
	@id_recurso_vt AS int,
           @id_Doc AS int,
           @Visto AS int,
           @Fecha AS datetime,
           @Periodo AS int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
 if Exists (Select * from [ORGANIZACION_VZT].[dbo].[RH_VistaDocumentos] where [id_recurso_vt] = @id_recurso_vt and [id_Doc] = @id_Doc and [Periodo] = @Periodo )
 begin
 UPDATE [ORGANIZACION_VZT].[dbo].[RH_VistaDocumentos]
   SET [Visto] = @Visto
      ,[Fecha] = @Fecha
 WHERE [id_recurso_vt] = @id_recurso_vt
      and [id_Doc] = @id_Doc
      and [Periodo] = @Periodo  
 end
 else
 begin
	INSERT INTO [ORGANIZACION_VZT].[dbo].[RH_VistaDocumentos]
           ([id_recurso_vt]
           ,[id_Doc]
           ,[Visto]
           ,[Fecha]
           ,[Periodo])
     VALUES
           (@id_recurso_vt,
           @id_Doc,
           @Visto,
           @Fecha,
           @Periodo)
end
END

GO
/****** Object:  StoredProcedure [dbo].[SPP_DistribucionPuestoRecurso]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPP_DistribucionPuestoRecurso] 

AS
BEGIN

	SET NOCOUNT ON;


Declare @Periodo as int
set @Periodo = YEAR(GETDATE())


Delete from kiosco.dbo.CH_DistribucionOrganigrama where Periodo = @Periodo
--	CONSULTAR PLAZAS OCUPADAS
	select 	id_Recurso_Vt = isnull(r.id_Recurso_Vt, 0),
			-------------------------------
			o.Empresa,
			o.EmpresaFuente,
			 case when o.Entidad in (1000) then 1
			     when o.Entidad in (1301,1200,2050,2041,2042,1110,1100,1400,1500,5000,0) then 2
			     when o.Entidad in (4020) then 3
			     when o.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,3060,3070,4000) then 4 end as Division,
			o.Entidad,
			Direccion =(/*--Direccion*/SELECT Nivel
                            FROM       Organizacion_vzt.dbo.VT_NivelesEstructura
                            WHERE      id_NivelEstructura = ne.id_NivelSuperior 
					AND Empresa = ne.Empresa 
					AND EmpresaFuente = ne.EmpresaFuente 
					AND (Fecha_Vigencia_Hasta IS NULL)
                                        AND Estructura = 2), 
			o.Area,
			o.plaza, 
			o.plaza_superior,
			Puesto = o.id_nivel_puesto,
			p.id_Nivel,
			-------------------------------
			Nivel_Plaza 	= IsNull(np.nivel, 0),
			Nivel_Recurso 	= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End
	into #Empleados	
	from 	VT_Organigrama o,
			VT_Recursos r,
			VT_RecursoEmpresa re,
			VT_Puesto p,
	 		v_EmpleadosVerzatec ev,
			VT_NivelesEstructura ne,
			Kiosco.dbo.CH_Nivel_Plaza_vzt	np,
			Kiosco.dbo.CH_Nivel_Recurso_vzt	nr
	where	r.id_Recurso_vt = o.id_Recurso_vt
	and		re.empresa = o.empresa
	and		re.EmpresaFuente = o.EmpresaFuente
	and		re.id_Recurso_vt = o.id_Recurso_vt
	and		re.estatus not in (2, 4)
	and		p.Empresa =* o.Empresa
	and		p.EmpresaFuente =* o.EmpresaFuente
	and		p.id_nivel_puesto =* o.id_nivel_puesto
	and		o.estatus = 1
	and		o.Publica = 1
	and		ev.id_Recurso_vt =* o.id_Recurso_vt
	and		ev.empresa =* o.empresa
	and		ev.EmpresaFuente =* o.EmpresaFuente
	and		np.Empresa =* o.Empresa
	and		np.EmpresaFuente =* o.EmpresaFuente
	and		np.Plaza =* o.Plaza
	and		np.Periodo = @Periodo
	and		nr.id_recurso_vt =* o.id_recurso_vt
	and		nr.Periodo = @Periodo
	and		ne.Nivel = o.Area 
	AND		ne.Empresa = o.Empresa 
	AND		ne.EmpresaFuente = o.EmpresaFuente 
	AND		(ne.Fecha_Vigencia_Hasta IS NULL )
	AND		ne.Estructura = 2
	and		o.Empresa = 5000
	Order by np.Fecha_Mod asc, nr.Fecha_Mod asc, p.Desc_esp


--	CONSULTAR PLAZAS VACANTES
	insert into #Empleados
	select 	0,
			o.Empresa,
			o.EmpresaFuente,
	 		case when o.Entidad in (1000) then 1
			     when o.Entidad in (1301,1200,2050,2041,2042,1110,1100,1400,1500,5000,0) then 2
			     when o.Entidad in (4020) then 3
			     when o.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,3060,4000,3070) then 4 end as Division,
			o.Entidad,
			Direccion =(/*--Direccion*/SELECT Nivel
                            FROM       Organizacion_vzt.dbo.VT_NivelesEstructura
                            WHERE      id_NivelEstructura = ne.id_NivelSuperior 
					AND Empresa = ne.Empresa 
					AND EmpresaFuente = ne.EmpresaFuente 
					AND (Fecha_Vigencia_Hasta IS NULL)
                                        AND Estructura = 2), 
			o.Area,
			o.plaza, 
			o.plaza_superior,
			Puesto = o.id_nivel_puesto,
			p.id_Nivel,
			Nivel_Plaza 	= IsNull(np.nivel, 0),
			Nivel_Recurso 	= 10
	from 	VT_Organigrama o,
			VT_Puesto p,
		VT_NivelesEstructura ne,
			Kiosco.dbo.CH_Nivel_Plaza_vzt np
	where	p.Empresa =* o.Empresa
	and		p.EmpresaFuente =* o.EmpresaFuente
	and		p.id_nivel_puesto =* o.id_nivel_puesto
	and		o.estatus = 1
	and		o.Publica = 1
	and		o.id_recurso_vt = 0
	and		np.Empresa =* o.Empresa
	and		np.EmpresaFuente =* o.EmpresaFuente
	and		np.Plaza =* o.Plaza
	and		np.Periodo = @Periodo
	and		ne.Nivel = o.Area 
	AND		ne.Empresa = o.Empresa 
	AND		ne.EmpresaFuente = o.EmpresaFuente 
	AND		(ne.Fecha_Vigencia_Hasta IS NULL )
	AND		ne.Estructura = 2
	and		o.Empresa = 5000
	Order by np.Fecha_Mod asc, p.Desc_esp 
	
	-- Felipe y sus colaboradores directos
	Insert into kiosco.dbo.CH_DistribucionOrganigrama
	Select  e.id_recurso_vt,
		e.Empresa,
		e.EmpresaFuente,
		case when e.Entidad = 1000 and e.Direccion in (7000,10000,9000,8000) then 2
		when e.Entidad in (1000) and not (e.Direccion in (7000,10000,9000,8000)) then 1
		when e.Entidad in (1200) AND e.Direccion in (2000) then 1
		when e.Entidad in (1200) AND not (e.Direccion in (2000)) then 2
		when e.Entidad in (1301,2050,2041,2042,1110,1100,1400,1500,5000,0) then 2
		when e.Entidad in (4020) then 3
		when e.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3060,3070) then 4 end as Division,
		case when e.Entidad = 1000 and e.Direccion in (7000,10000,9000,8000) then 1200
		when e.Entidad in (1200) AND e.Direccion in (2000) then 1000
		else e.Entidad end as Entidad,
		e.Direccion,
		e.Area,
		e.plaza,
		e.plaza_superior,
		e.puesto,
		e.id_Nivel,
		e.Nivel_Plaza,
		e.Nivel_Recurso,
		@Periodo
	from #Empleados e
	where e.plaza_superior in (0,7167)

	-- De mas empleados
	Insert into kiosco.dbo.CH_DistribucionOrganigrama
	Select  e.id_recurso_vt,
		e.Empresa,
		e.EmpresaFuente,
		case when j.Entidad = 1000 and j.Direccion in (7000,10000,9000,8000) then 2
		when j.Entidad in (1000) and not (j.Direccion in (7000,10000,9000,8000)) then 1
		when j.Entidad in (1200) AND j.Direccion in (2000) then 1
		when j.Entidad in (1200) AND not (j.Direccion in (2000)) then 2
		when j.Entidad in (1301,2050,2041,2042,1110,1100,1400,1500,5000,0) then 2
		when j.Entidad in (4020) then 3
		when j.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,3060,4000,3070) then 4 end as Division,
		case when j.Entidad = 1000 and j.Direccion in (7000,10000,9000,8000) then 1200
		when j.Entidad in (1200) AND j.Direccion in (2000) then 1000
		else j.Entidad end as Entidad,
		j.Direccion,
		j.Area,
		e.plaza,
		e.plaza_superior,
		e.puesto,
		e.id_Nivel,
		e.Nivel_Plaza,
		e.Nivel_Recurso,
		@Periodo
	from #Empleados e, #Empleados j
	where e.plaza_superior = j.plaza
	and e.plaza_superior not in (0,7167)

Drop table #Empleados


END

GO
/****** Object:  StoredProcedure [dbo].[SPP_EnviarMailRecordatorioObjetivos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPP_EnviarMailRecordatorioObjetivos] 
	-- Add the parameters for the stored procedure here
	@Empresa AS INT,
	@Empleado AS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Declare @Mail varchar(255),
		@Contrasena varchar(255),
		@mensaje varchar(3000),
		@Nombre varchar(3000)	

set @Nombre =''
set @mensaje = ''

	select  @Mail= e_mail 
	from organizacion_vzt.dbo.v_EmpleadosVerzatec             
	where Empresa=@Empresa            
	and Empleado=@Empleado 

	select  @Nombre = NombreCompleto         
	from organizacion_vzt.dbo.v_EmpleadosVerzatec             
	where Empresa=@Empresa            
	and Empleado=@Empleado            

	If @Empresa <> 5000
		begin
			select @Contrasena=Contrasena            
			from kiosco.dbo.in_usuarios_otrasempresas            
			where Empleado = @Empleado 
		end 
	else
		begin
			select @Contrasena=Contrasena             
			from kiosco.dbo.in_usuarios      
			where Empleado = @Empleado
		end       
	            
	if @Mail is null or @Mail=''            
	 begin            
	   set @Mail='cecilia.villarreal@verzatec.com'  
	   set @mensaje='mail vacio' + char(13)+ char(13)    
	 end            
	if @Nombre is null or @Nombre= ''
	begin
		set @Nombre = 'A quien corresponda'
	end            
	 set @mensaje='Buen Día ' + @Nombre  + ',' + char(13)+ char(13)            
	    
 set @mensaje= @mensaje + 'Bienvenido al Proceso de Administración del Desempeño, por medio del presente te informamos que es necesario que cada uno de los empleados de nuevo ingreso de la organización capture la información solicitada en el  Proceso de Administración del Desempeño (PADE) del ciclo actual.  Es muy importante concluir el Paso 1 y el Paso 4, ya que la información que el sistema maneja servirá para evaluar el desempeño del personal del año en curso.'+ char(13)+ char(13)               
	 set @mensaje= @mensaje + 'El concretar este proceso antes de que el año termine, les permitirá tener sus objetivos establecidos con los que tu desempeño se evaluará y por lo tanto, al principio del año 2009 solo se tendrán que establecer los nuevos objetivos del año que comienza sin tareas pendientes de concluir del año 2008.'+ char(13)+ char(13)  
	 set @mensaje= @mensaje + 'Las fechas de los pasos ya están vencidas, sin embargo tendrás que dar click en la opción solicitar acceso para el Paso 4 Apertura de Objetivos y una vez que se concluya el estatus del semáforo cambiará de rojo a verde.' +char(13) +char(13)
	 set @mensaje= @mensaje + 'Esta es una labor institucional para la cual se pide que se apoyen con sus jefes para concretar su proceso.  Así mismo, Recursos Humanos de cada sitio estará a su disposición para apoyarlos para el soporte y capacitación que requieran durante el cierre de este ciclo. ' +char(13) +char(13)      
	 set @mensaje= @mensaje + 'A continuación se explica como ingresar:' + char(13) + char(13)     
	 set @mensaje= @mensaje + ' ¿Cómo acceso al sistema?' + char(13)+ char(13)      
	 set @mensaje= @mensaje + 'Para ingresar al sistema tienen que entrar a www.verzatec.net e ingresar a "Mi e-RH" con tu número de nómina, si no recuerdas tu contraseña da click en "Recuperación de cuenta" para que a través de tu correo electrónico de la empresa recibas tu usuario y contraseña.  Una vez que hayas ingresado, ir a la pestaña de "Sistemas de RH".  Dentro de "Sistemas de RH", en el menú de la izquierda seleccionas la opción de "Proceso de Administración del Desempeño".'+ char(13) + char(13)      
	 set @mensaje= @mensaje + 'Cualquier duda estamos a sus órdenes para concluir con este proceso con éxito.' + char(13) + char(13)      
	 set @mensaje= @mensaje + 'iris.cerda@verzatec.com  Ext. 8433' + char(13)     
	 set @mensaje= @mensaje + 'brenda.leal@Verzatec.com  Ext.8436' + char(13) + char(13)                  
	             
	-------------Quitar esta línea--------------------      
	 --set @Mail='cecilia.villarreal@verzatec.com'                 
	--------------------------------------------------      
	      
	 Execute Master.Dbo.xp_smtp_sendmail               
				 @From          = N'RHVerzatec@verzatec.com',               
				 @From_Name     = N'Recursos Humanos VERZATEC ',               
				 @To            = @Mail,          
				 @ReplyTo       = N'',               
				 @BCC           = N'cecilia.villarreal@verzatec.com;iris.cerda@verzatec.com;brenda.leal@cuprum.com.mx',          
				 @Priority      = N'NORMAL',               
				 @Subject       = N'[Recursos Humanos VERZATEC]-Recordatorio de Objetivos',               
				 @Message       = @mensaje,               
				 @MessageFile   = N'',               
				 @Type          = N'text/plain',                   
				 @Attachment    = N'',               
				 @Attachments   = N'',               
				 @CodePage      = 0,               
				 @Server        = '172.18.9.3'    

END

GO
/****** Object:  StoredProcedure [dbo].[SPP_RecordatorioObjetivos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPP_RecordatorioObjetivos]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
declare @Evaluacion int
declare @AnioEncuesta int
declare @AplicaEncHabilidades int
declare @AplicaObjetivos int
declare @Encuesta int
declare @ID_Compania int
declare @ID_Empleado int
declare @Objetivos int
declare @NotieneObjetivos int
declare @Folio int
set @NotieneObjetivos = 1
set @AnioEncuesta = year(getdate())

Select Empresa, Empleado into #Empleados 
from Organizacion_vzt.dbo.V_EstructuraVerzatec ev 
where ev.DescNomina not like '%Sindicalizado%' and ev.DescNomina not like '%Semanal%' and ev.DescNomina not like '%Honorarios%'
AND ev.Fecha_Antiguedad >'20080930'

DECLARE CO_Cursor CURSOR FOR
SELECT * FROM #Empleados as co
OPEN CO_Cursor;
FETCH NEXT FROM CO_Cursor
into @ID_Compania, @ID_Empleado;

WHILE @@FETCH_STATUS = 0
   BEGIN

print @ID_Compania
print @ID_Empleado

SELECT  @Evaluacion = COALESCE (ee.intEvaluacionId, 0)
	FROM DesempenoRHImsalum.dbo.tblIntegrantesGrupo ig,
		DesempenoRHImsalum.dbo.tblGrupoEjecutivo ge,
		DesempenoRHImsalum.dbo.tblEvaluacionE ee
	WHERE  	ge.intGrupoId = ig.intGrupoId 
	and	ee.intEvaluacionId = ge.intEvaluacionId
	and	ee.intLiberada = 2 --Que este liberada
	and	year(ee.dtmFechaFinCierre) = @AnioEncuesta --Año de Apertura
	and	ig.intEmpresaId= @ID_Compania
	AND	ig.intEmpleadoId= @ID_Empleado	

Select 	@Evaluacion = COALESCE (@Evaluacion, 0)

print @Evaluacion

--Si es ejecutivo regresar la Evaluacion  de Ejecutivos
if (@Evaluacion <= 0)
begin
	--Obtener la encuesta de empleados del año
	SELECT  @Folio = intEvaluacionId
	FROM 	DesempenoRHImsalum.dbo.tblEvaluacion
	WHERE  	year(dtmFechaInicioCierre) = @AnioEncuesta --Año de Cierre
	--and	intLiberada = 2 --Que este liberada
	print @Folio
--
	select 	@AplicaObjetivos = COALESCE (count(*) , 0)
	from 	DesempenoRHImsalum.dbo.tblEvaluacionPersona 
	where 	intEvaluacionId = @Folio
	AND	intEmpleadoId= @ID_Empleado	
	and 	intEmpresaId = @ID_Compania
	print @AplicaObjetivos
--
--if (@AplicaObjetivos > 0)
--begin
--	select 	@Objetivos = intFolioId
--	from 	DesempenoRHImsalum.dbo.tblEvaluacionPersona 
--	where 	intEvaluacionId = @Folio
--	AND	intEmpleadoId= @ID_Empleado	 
--	and 	intEmpresaId = @ID_Compania
--	
--	select 	@NotieneObjetivos = COALESCE (count(*) , 0)
--	from 	DesempenoRHImsalum.dbo.tblEvaluacionObjetivoE
--	where 	intFolioId = @Objetivos
--	
--end
--
end
--
--	
--
if @ID_Compania = 8 or @ID_Compania = 9502
begin
	select @Encuesta = intEncuestaId
	from Encuestador.dbo.tblEncuesta
	where strNombre Like '%Performance Appraisal Evaluation%'
	and year(dtmFechaVigenciaInicio) = @AnioEncuesta
end
else
begin
	select @Encuesta = intEncuestaId
	from Encuestador.dbo.tblEncuesta
	where strNombre Like '%Evaluación del Desempeño%'
	and year(dtmFechaVigenciaInicio) = @AnioEncuesta
end
--
select 	@AplicaEncHabilidades = COALESCE (count(*),0)
	from 	Encuestador.dbo.tblMatrizEncuesta
	where 	intCompaniaEncuestadoId = @ID_Compania
	and	intEncuestadoId = @ID_Empleado
	and	intEncuestaId = @Encuesta
print @AplicaEncHabilidades
--
--Select 	@AplicaObjetivos = COALESCE (@AplicaObjetivos, 0)
--Select 	@AplicaEncHabilidades = COALESCE (@AplicaEncHabilidades, 0)
--
--
if (@AplicaObjetivos = 0) and (@AplicaEncHabilidades = 0)
begin
	Exec SPP_EnviarMailRecordatorioObjetivos @ID_Compania, @ID_Empleado
end
--
--set @Evaluacion  = 0
--set @AnioEncuesta  = 0
--set @AplicaEncHabilidades  = 0
--set @AplicaObjetivos  = 0
--set @Encuesta  = 0
--set @Objetivos  = 0
--set @NotieneObjetivos = 1
--set @Folio = 0

      FETCH NEXT FROM CO_Cursor
	  into @ID_Compania, @ID_Empleado;
END;
CLOSE CO_Cursor;
DEALLOCATE CO_Cursor;
END

GO
/****** Object:  StoredProcedure [dbo].[SPQ_AreaOrganizacional]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Objetivo: Consutlar Area Matricial
	Creado Por: Jaime Sánchez
	Fecha:	23-Oct-06
SPQ_AreaOrganizacional '1000'
*/
CREATE Proc [dbo].[SPQ_AreaOrganizacional]
	@Direccion varchar(500)
AS

	Select	Distinct 
		ID_Area	= Convert(int, NE.Nivel),
		ne.desc_esp,
		ne.desc_ing
	From	VT_NivelesEstructura 	NED,
		VT_NivelesEstructura 	NE
	Where	NED.id_NivelEstructura	= NE.id_NivelSuperior
	And	NED.Empresa = NE.Empresa
	and	NE.Estructura = 2
	And	NED.Nivel = @Direccion
	Order	by ID_Area

GO
/****** Object:  StoredProcedure [dbo].[SPQ_AreaOrganizacional_Nov08]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SPQ_AreaOrganizacional_Nov08  11000,3050  
CREATE Proc [dbo].[SPQ_AreaOrganizacional_Nov08]      
 @Direccion varchar(500)  ,    
 @Empresa int=0    
AS      
  
declare @vEmpresa int  
  
       
if @Empresa=4020 or @Empresa=2 or @Empresa=-1  
begin set @vEmpresa=2 end  
    
--OJO con la homologación usar las entidades
if @Empresa=9100 or @Empresa=9500  or @Empresa=9502 or @Empresa=9503  
begin set @vEmpresa=@Empresa end  


 Select Distinct       
  ID_Area = Convert(int, NE.Nivel),      
  ne.desc_esp,      
  ne.desc_ing      
 From VT_NivelesEstructura  NED,      
  VT_NivelesEstructura  NE      
 Where NED.id_NivelEstructura = NE.id_NivelSuperior      
 And NED.Empresa = NE.Empresa      
 and NE.Estructura = 2      
 And NED.Nivel =@Direccion      
 and NED.EmpresaFuente= @vEmpresa --27-Nov-08    
 and NED.Empresa<>4100           --27-Nov-08    
 Order by ID_Area      
      
/*  
--  select Distinct       
--  ID_Area = Convert(int, NE.Nivel),      
--  ne.desc_esp,      
--  ne.desc_ing     
select *  
 From VT_NivelesEstructura  NED,      
  VT_NivelesEstructura  NE      
 Where NED.id_NivelEstructura = NE.id_NivelSuperior      
 And NED.Empresa = NE.Empresa      
 and NE.Estructura = 2      
 And NED.Nivel ='11000' --@Direccion      
and NED.EmpresaFuente=2    
*/

/*

---------------------EMPRESAS----------------------
1	    Verzatec
2	    Cuprum
4020	Formet            (Entidad)
9100	Stabilit Mty-Mx   (Empresa) 
9500	Bayer             (Empresa) 
9502	Stabilit América  (Empresa) 
9503	Stabilit Europa   (Empresa) 

-------------------DIRECCIONES---------------------
1000	1000 - DIRECCION
10000	10000 - OPERACIONES
11000	11000 - LEGAL
12000	12000 - AUDITORIA
13000	13000-AUDITORIA
2000	2000 - FINANZAS
3000	3000 - MEJORA CONTINUA
4000	4000 - RECURSOS HUMANOS
5000	5000 - SISTEMAS
6000	6000 - TIENDAS
7000	7000 - COMERCIAL
8000	8000 - EXPORTACIONES NORTEAMERICA Y EUROPA
9000	9000 - LOGISTICA

*/

GO
/****** Object:  StoredProcedure [dbo].[SPQ_AreaOrganizacionalDP]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPQ_AreaOrganizacionalDP]        
	@Direccion int,      
	@Empresa int=0      
AS        
    
Select * into #Areas from Organizacion_vzt.dbo.V_EmpleadosVerzatec


if @Empresa = 2
begin

	Select distinct idArea as ID_Area, 
			Area as Desc_esp, 
			Area as Desc_ing
	From	#Areas
	where	entidad in (1301, 2050, 2041, 2042, 1110, 1100, 1000, 1200, 1400, 1500, 5000, 0)
			and not idArea is null
			and @Direccion in (0,idDireccion)
	Order by idArea

end
else if @Empresa = 3
begin

	Select distinct idArea as ID_Area, 
			Area as Desc_esp, 
			Area as Desc_ing
	From	#Areas
	where	entidad in(4020)
			and not idArea  is null
			and @Direccion in (0,idDireccion)
	Order by idArea
	
end
else if @Empresa = 4
begin

	Select distinct idArea as ID_Area, 
			Area as Desc_esp, 
			Area as Desc_ing
	From	#Areas
	where	entidad in (3030, 3050, 3051, 3052, 3053, 3054, 3055, 3056, 4000, 3070)
			and not idArea  is null
			and @Direccion in (0, idDireccion)
	Order by idArea

end
else
begin

	Select distinct idArea as ID_Area, 
			Area as Desc_esp, 
			Area as Desc_ing
	From	#Areas
	where	not idArea  is null
			and @Direccion in (0, idDireccion)
	Order by idArea

end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_AreaOrganizacionalvzt]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPQ_AreaOrganizacionalvzt]        
	@Direccion int,
	@Empresa int = 0
AS        
    
Select * into #Areas from Organizacion_vzt.dbo.V_EmpleadosVerzatec


if @Empresa = 2
begin

	Select distinct idArea as ID_Area, 
			Area as Desc_esp, 
			Area as Desc_ing
	From	#Areas
	where	entidad in(1301, 2050, 2041, 2042, 1110, 1100, 1000, 1200, 1400, 1500, 5000, 0)
			and not idArea  is null
			and @Direccion in (0,idDireccion)
	Order by idArea
	
end
else if @Empresa = 3
begin

	Select distinct idArea as ID_Area, 
			Area as Desc_esp, 
			Area as Desc_ing
	From	#Areas
	where	entidad in (4020)
			and not idArea  is null
			and @Direccion in (0,idDireccion)
	Order by idArea

end
else if @Empresa = 4
begin

	Select distinct idArea as ID_Area, 
			Area as Desc_esp, 
			Area as Desc_ing
	From	#Areas
	where	entidad in(3030, 3050, 3051, 3052, 3053, 3054, 3055, 3056, 4000, 3070)
			and not idArea  is null
			and @Direccion in (0,idDireccion)
	Order by idArea
	
end
else
begin

	Select distinct idArea as ID_Area, 
			Area as Desc_esp, 
			Area as Desc_ing
	From	#Areas
	where	not idArea  is null
			and @Direccion in (0, idDireccion)
	Order by idArea

end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_BuscaEmpleado]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	Autor:	Jaime Sánchez
	Fecha:	13/Octubre/2006
	Objetivo: 
		Busca el empleado dentro de la nueva estructura organizacional VERZATEC

SPQ_BuscaEmpleado 0, 'jaime sanchez'
*/
CREATE	Procedure [dbo].[SPQ_BuscaEmpleado]
	@Empleado 	int=0,
	@Nombre   	varchar(100)='',
	@ShowEmp    	smallint=1,
	@IncBaja	smallint=0,
	@id_recurso_vt	int=0 	
AS

	Select 	e.id_recurso_vt,
		Nombre 	= Case When @IncBaja = 1 And e.estatus = 2 Then '(B) ' Else '' End
			+ Case When @ShowEmp = 1 Then rtrim(cast(Empleado as char))+' -- ' Else '' End
			+ r.Nombre+' '+r.Paterno+' '+r.Materno,
		e.Empresa,
		e.EmpresaFuente,
		e.Empleado,
		e.id
	from	VT_RECURSOS 		r,
		VT_RECURSOEMPRESA 	e
	where	r.id_recurso_vt = e.id_recurso_vt
	and	(e.estatus 	<> 2 			)--Or @IncBaja = 1
		--Filtro por Numero de Empleado
	and	(e.empleado 	 = @Empleado 		Or @Empleado = 0)
	and	(r.id_recurso_vt = @id_recurso_vt 	Or @id_recurso_vt  = 0)
	        --Filtro por Nombre
	and     R.nombre+' '+R.paterno+' '+R.materno like  CASE @Nombre When '' then R.nombre+' '+R.paterno+' '+R.materno
        	                                                  Else '%'+Replace(@Nombre, ' ', '%')+'%'    
                	                             END
/*
		--Filtrar x Empresa
	and	(e.Empresa = @Empresa or @Empresa = -1)
		--Filtrar x Empresa
	and	(e.id_NivelEmpleado = @id_NivelEmpleado or @id_NivelEmpleado = -1)
*/
	Order	by Nombre

GO
/****** Object:  StoredProcedure [dbo].[SPQ_BuscaEmpleadoXNo]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPQ_BuscaEmpleadoXNo]
@Empleado		int
AS

SELECT id_recurso_vt, Empleado, NombreCompleto, razon_social,
Direccion, Puesto, e_mail, UrlFoto, Nomina, EmpresaFuente, id as IDEslabon
FROM v_EmpleadosVerzatec
WHERE Empleado = @Empleado




GO
/****** Object:  StoredProcedure [dbo].[SPQ_BuscarIdVZT]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPQ_BuscarIdVZT]
	-- Add the parameters for the stored procedure here
	@Emp as integer,
	@Comp as integer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    -- Select * into #Empleados from v_EmpleadosVerzatec
    
	select id_recurso_vt 
	--from #Empleados 
	from v_EmpleadosVerzatec 
	where Empleado= @Emp AND Empresa=@Comp
END

GO
/****** Object:  StoredProcedure [dbo].[SPQ_BuscarNoEncontradosComisiones]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPQ_BuscarNoEncontradosComisiones] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT distinct e.id_recurso_vt,
e.Empleado, 
r.Nombre + ' ' + r.Paterno + ' ' + r.Materno AS NombreCompleto, 
isnull(n.Desc_esp,'') AS DescNomina, 
isnull(p.Desc_esp,'') AS Puesto,
e.Estatus
into #Empleados
FROM  dbo.VT_Recursos AS r INNER JOIN
      dbo.VT_RecursoEmpresa AS e ON r.id_recurso_vt = e.id_recurso_vt left JOIN
      dbo.VT_Organigrama AS o ON o.id_Recurso_vt = e.id_recurso_vt AND o.Empresa = e.Empresa AND o.EmpresaFuente = e.EmpresaFuente LEFT OUTER JOIN
      dbo.VT_Puesto AS p ON p.Empresa = o.Empresa AND p.EmpresaFuente = o.EmpresaFuente AND p.id_nivel_puesto = o.id_nivel_puesto LEFT OUTER JOIN
      dbo.VT_Nomina AS n ON n.Empresa = e.Empresa AND n.EmpresaFuente = e.EmpresaFuente AND n.Nomina = e.nomina 
WHERE n.empresa = 5000
Order by e.Empleado

select e.Empleado, 
e.NombreCompleto AS Nombre, 
e.Puesto as Puesto, 
e.DescNomina as Nomina,
cc.fecha_registro As Fecha, 
cc.importe_Capturado As Importe,
case e.Estatus when 4 then 'Suspendido'
	       when 2 then 'Baja'
	       when 1 then 'Activo'
	       when 3 then 'Activo' end as Estatus
from  RH_ComisionesCaptura cc,
#Empleados e
where month(cc.fecha_registro) = month(getdate())
and year(cc.fecha_registro) = year(getdate()) 
and cc.usuario like '%No encontrado%' 
and cast(e.Empleado as varchar(6)) like substring(cc.usuario,0,charindex(':',cc.usuario))
order by e.Empleado 

END

GO
/****** Object:  StoredProcedure [dbo].[SPQ_BuscarRFC]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- ============================================= 
 --spq_buscarrfc 6939--Cecy Cárdenas Activa
 --spq_buscarrfc 4630--Elsa Macial Inactiva
 --SPQ_BuscarRFC 7103--Carmen Esparza
CREATE PROCEDURE [dbo].[SPQ_BuscarRFC]   
 -- Add the parameters for the stored procedure here  
 @Empleado as int  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
 Select * into #Empleados 
  from Organizacion_vzt.dbo.Vt_recursoEmpresa
   where empresa = 5000 
   --CACM: 25-Abr-2013. Quito Filtro--
   --and (estatus in (1,3) or empleado = 51465)
   order by  empleado desc

--CACM: Intento 1
 --Select distinct 'VZTC' + right('00000000' + cast(Empleado as varchar),8)  
 --from #Empleados  
 --where id_recurso_vt =@Empleado  
 
 --CACM: Intento 2 / 29-Abr-2013
 Select Top 1 'VZTC' + right('00000000' + cast(Empleado as varchar),8)  
 from #Empleados  
 where id_recurso_vt =@Empleado 
 order by Fecha_Alta desc
 
  
END

--select * from VT_RecursoEmpresa where empleado=51465
--select * from VT_Recursos where id_recurso_vt=5424


GO
/****** Object:  StoredProcedure [dbo].[SPQ_BuscarRFC2]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --  spq_buscarrfc2 13171
CREATE PROCEDURE [dbo].[SPQ_BuscarRFC2]   
 @Empleado as int  
AS  

BEGIN  

SET NOCOUNT ON;  

 /*
 Select * into #Empleados 
  from Organizacion_vzt.dbo.Vt_recursoEmpresa
   where empresa = 5000 and (estatus in (1,3) or empleado = 51465)
   order by  empleado desc

 Select 'VZTC' + right('00000000' + cast(Empleado as varchar),8)  
 from #Empleados  
 where id_recurso_vt =@Empleado  
 */

 Select 'SCUP' + right('00000000' + cast(Empleado as varchar),8)  
 from Organizacion_vzt.dbo.Vt_recursoEmpresa  
 where empresa = 5000 and estatus in (1,3) and id_recurso_vt =@Empleado  

 
END  





GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Acciones_Bajas_vzt]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- grant exec on SPQ_CH_Acciones_Bajas_vzt to pinuser 
CREATE proc [dbo].[SPQ_CH_Acciones_Bajas_vzt]
	@id_recurso_vt	int,
	@plaza			int
as

-- Id_Formato = 1 --> Desempeño		--> CH_Acciones_vzt
-- Id_Formato = 2 --> Desarrollo	--> CH_Acciones_vzt
-- Id_Formato = 4 --> Retención		--> CH_Acciones_vzt
-- Id_Formato = 6 --> Sucesión		--> CH_AccionesSucesion_vzt


SET NOCOUNT ON  

select	acc.Id_Formato, case acc.Id_Formato
							when 1 then 'Desempeño'
							when 2 then 'Desarrollo'
							when 4 then 'Retención'
							when 6 then 'Sucesión'
						end as Desc_Formato,
		acc.ID_Accion, acc.Periodo, acc.orden, acc.Accion, acc.Fecha_Ini, acc.Fecha_Fin,
		isnull(act.ID_Actividad, 0) as ID_Actividad, isnull(act.Actividad, 'Sin actividades') as Actividad, act.Fecha_Fin as Fecha_Fin_Act, act.Avance
into	#Acciones
from	Kiosco.dbo.CH_Acciones_vzt acc,
		Kiosco.dbo.CH_Actividades_Vzt act
where	acc.id_recurso_vt = @id_recurso_vt and 
		acc.Id_Formato in(1, 2, 4) and
		acc.ID_Accion *= act.ID_Accion

insert	#Acciones
select	acc.Id_Formato, case acc.ID_Accion
							when 1 then 'Desempeño'
							when 1 then 'Desempeño'
							when 1 then 'Desempeño'
							when 1 then 'Desempeño'
						end as Desc_Formato,
		acc.ID_Accion, acc.Periodo, acc.orden, acc.Accion, acc.Fecha_Ini, acc.Fecha_Fin,
		isnull(act.ID_Actividad, 0) as ID_Actividad, isnull(act.Actividad, 'Sin actividades') as Actividad, act.Fecha_Fin as Fecha_Fin_Act, act.Avance
from	Kiosco.dbo.CH_AccionesSucesion_vzt acc,
		Kiosco.dbo.CH_ActividadesSucesion_vzt act
where	acc.plaza = @plaza and
		acc.ID_Accion *= act.ID_Accion


select	* 
from	#Acciones
Order by Id_Formato, Periodo, Orden, Fecha_Fin_Act

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Acciones_EmpBajas]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPQ_CH_Acciones_EmpBajas]     
	@Division  		int = -1,
	@Entidad		int = -1,      
	@Nombre  		varchar(60) = '',
	@Codigo			int = -1,
	@Anio			int = -1
AS     


SET NOCOUNT ON        

If @Codigo < 1   
	Set @Codigo = -1


if @Division < 2
	select @Division = -1

Create Table #FiltroEntidades( Entidad int)


if @Division = 2
begin
	insert #FiltroEntidades values(1301)
	insert #FiltroEntidades values(2050)
	insert #FiltroEntidades values(2041)
	insert #FiltroEntidades values(2042)
	insert #FiltroEntidades values(1110)
	insert #FiltroEntidades values(1100)
	insert #FiltroEntidades values(1000)
	insert #FiltroEntidades values(1200)
	insert #FiltroEntidades values(1400)
	insert #FiltroEntidades values(1500)
	insert #FiltroEntidades values(5000)
	insert #FiltroEntidades values(0)
end
else if @Division = 3
begin
	insert #FiltroEntidades values(4020)
end
else if @Division = 4      
begin 
	insert #FiltroEntidades values(3030)
	insert #FiltroEntidades values(3050)
	insert #FiltroEntidades values(3051)
	insert #FiltroEntidades values(3052)
	insert #FiltroEntidades values(3053)
	insert #FiltroEntidades values(3054)
	insert #FiltroEntidades values(3055)
	insert #FiltroEntidades values(4000)
	insert #FiltroEntidades values(3070)
end


select	e.id_recurso_vt,
		e.id,        
		e.Empleado,      
		e.NombreCompleto,        
		e.DESC_PUESTO,
		e.DESC_CCOSTO,
		e.Entidad,
		e.DescEntidad,        
		e.Empresa,        
		e.EmpresaFuente,
		e.plaza,
		e.FECHA_BAJA,
		codigo = (	select	top 1 nivel
					from	kiosco.dbo.CH_Nivel_Recurso_vzt 
					where	id_recurso_vt = e.id_recurso_vt
					order by Periodo desc)
,
		0 as Desarrollo
		,0 as Desempenio
		,0 as Sucesion
		,0 as Retencion
into	#Empleados_Acciones
from	Organizacion_vzt.dbo.v_EmpleadosVztBajas e
where	(
			e.Entidad = @Entidad or @Entidad = -1
		)
		and (
				e.Entidad in(select Entidad from #FiltroEntidades)
				or
				@Division = -1
			)
		and e.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'



update	#Empleados_Acciones
set		Desarrollo = 1 
from	#Empleados_Acciones e, Kiosco.dbo.CH_Acciones_vzt a
where	e.id_recurso_vt = a.id_recurso_vt and
		a.Id_Formato = 2

update	#Empleados_Acciones
set		Desempenio = 1 
from	#Empleados_Acciones e, Kiosco.dbo.CH_Acciones_vzt a
where	e.id_recurso_vt = a.id_recurso_vt and
		a.Id_Formato = 1

update	#Empleados_Acciones
set		Sucesion = 1
from	#Empleados_Acciones e, Kiosco.dbo.ch_AccionesSucesion_vzt a
where	e.Empresa = a.Empresa and
		e.EmpresaFuente = a.EmpresaFuente and
		e.Plaza = a.Plaza
		
update	#Empleados_Acciones
set		Retencion = 1 
from	#Empleados_Acciones e, Kiosco.dbo.CH_Acciones_vzt a
where	e.id_recurso_vt = a.id_recurso_vt and
		a.Id_Formato = 4


select * from #Empleados_Acciones
where	(Desarrollo	> 0 or
		Desempenio	> 0	or
		Sucesion	> 0 or
		Retencion	> 0) and
		( (power(2, codigo - 1) & @Codigo > 0 ) or @Codigo = -1) and
		(datepart(yyyy, FECHA_BAJA) = @Anio or @Anio = -1)
order by DescEntidad, DESC_CCOSTO, NombreCompleto, FECHA_BAJA

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_ConsultaOrganigrama_Permisos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Objetivo:	Consultar estructura validando los permisos
			por default consultar su propia estructura
Creado por: Jaime Sánchez
Fecha:		29-Ago-2007

*/
Create Proc [dbo].[SPQ_CH_ConsultaOrganigrama_Permisos]
		@id_Recurso_vt int,
		@Empresa     	int,
        @EmpresaFuente	int,
        @Plaza        	int
AS

-- --Parametro a recibir del Usuario
-- declare @id_Recurso_vt int,
-- 		@Empresa     	int,
--         @EmpresaFuente	int,
--         @Plaza        	int
-- 

-- -- Usuario Firmado
-- select 	@id_Recurso_vt = 2000,
-- -- Arbol a consultar
-- 		@Empresa     	= 5000,
--         @EmpresaFuente	= 2,
--         @Plaza        	= 5616  --Consultar Arbol de Oscar Alvarado

SET NOCOUNT ON

	
	----| OBTENER Dependientes Directos e Indirectos|---------------------------------------------------------------------------------
	Drop Table #Dependientes
	Create  Table #Dependientes
	            (Empresa int not null,
			     EmpresaFuente int not null,
			     Plaza  int not null,
	             Nivel int not null,
	             Cadena varchar(1000) not null)
	
	
	declare @Nivel int,
			@Cadena varchar(1000)
	
	Set		@Nivel = 0
	set		@Cadena = ','+Convert(varchar(10),@Empresa) + Convert(varchar(10),@EmpresaFuente) + Convert(varchar(10),@Plaza)+','
	Insert #Dependientes Values(@Empresa, @EmpresaFuente, @Plaza, @Nivel, @Cadena)
	
	While Exists(	Select 	* 
					From 	VT_Organigrama o
					Where 	exists (Select	* 
									from	#Dependientes 
									Where 	o.Empresa_Superior = Empresa
									and		o.EmpresaFuente_Superior = EmpresaFuente
									and		o.Plaza_Superior = Plaza
									and		Nivel = @Nivel
									and		o.Estatus = 1)	)
	Begin
	            Insert  #Dependientes
	            Select  O.Empresa,
						O.EmpresaFuente,
						O.Plaza,
						@Nivel + 1,
						D.Cadena+Convert(varchar(10),O.Empresa) + Convert(varchar(10),O.EmpresaFuente) + Convert(varchar(10),O.Plaza)+','                 
	            From    VT_Organigrama O,
						#Dependientes D
	            Where  	o.Empresa_Superior = D.Empresa
				and		o.EmpresaFuente_Superior = D.EmpresaFuente
				and		o.Plaza_Superior = D.Plaza
				and 	o.Estatus = 1 --Activas
	            And     D.Nivel = @Nivel
	
	            Set     @Nivel = @Nivel + 1
	End
	-------------------------------------------------------------------------------

-- select * from #Dependientes
	
	----| Filtra solo aquellos sobre los que se tiene permiso |--------------------
	Select 	* 
	From 	#Dependientes e,
			v_EmpleadosVerzatec ev
	Where  	ev.Empresa =* e.Empresa
	and		ev.EmpresaFuente =* e.EmpresaFuente
	and		ev.plaza =* e.plaza
	
	and		exists(	select * From Kiosco.dbo.ch_permisos p 
					where	charindex(',' + Convert(varchar(10), p.Empresa ) + Convert(varchar(10), p.EmpresaFuente ) + Convert(varchar(10), p.Plaza) + ',' , e.Cadena ) > 0
					and     p.incexc = 1
					and     p.id_recurso_vt = @id_recurso_vt
					)
	And      not Exists(select   * From Kiosco.dbo.ch_permisos p 
	                    where   charindex(',' + Convert(varchar(10), p.Empresa ) + Convert(varchar(10), p.EmpresaFuente ) + Convert(varchar(10), p.Plaza) + ',', e.Cadena ) > 0
	                    and      p.incexc = 0
	                    and      p.id_recurso_vt = @id_recurso_vt
	                    and      not exists(Select * From Kiosco.dbo.ch_permisos p2 
	                                        Where charindex(',' + Convert(varchar(10), p2.Empresa ) + Convert(varchar(10), p2.EmpresaFuente ) + Convert(varchar(10), p2.Plaza) + ',', substring(e.Cadena, charindex(',' + Convert(varchar(10), p.Empresa ) + Convert(varchar(10), p.EmpresaFuente ) + Convert(varchar(10), p.Plaza) + ',', e.Cadena ), 100) ) > 0 
	                                        and      p2.incexc = 1
	                                        and      p2.id_recurso_vt = @id_recurso_vt
	                                        )
	                    )
	Order   by e.Cadena
	
	-------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Empleados]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Cecilia Villarreal
-- Create date: 19/03/09
-- Description:	Traer todos los empleados de la Estructura VZT
-- =============================================
--Exec SPQ_CH_Empleados 'cec'
CREATE PROCEDURE [dbo].[SPQ_CH_Empleados] 
	-- Add the parameters for the stored procedure here
	@Nombre as varchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Min(id_recurso_vt) as id_recurso_vt,
		   Nombre + ' '+ Paterno + ' '+ Materno as NombreCompleto
	from VT_Recursos
	where Nombre + ' '+ Paterno + ' '+ Materno Like '%'+Replace(@Nombre,' ','%')+'%'
	Group by Nombre, Paterno, Materno
	ORDER BY NombreCompleto

--Select Nombre + ' '+ Paterno + ' '+ Materno as NombreCompleto, count(*)
--from VT_Recursos
--group by Nombre + ' '+ Paterno + ' '+ Materno
--having count(*)>1
--order by NombreCompleto

--Select * into #Empleados from v_EmpleadosVerzatec
----    -- Insert statements for procedure here
--	SELECT id_recurso_vt,
--		  NombreCompleto
--	from #Empleados
--	where NombreCompleto Like '%'+Replace(@Nombre,' ','%')+'%'
--	ORDER BY NombreCompleto

END

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_GeneraDependenciasPermisos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Objetivo:	Obtener de los permisos las estructuras a las que tiene acceso
Fecha:		25-Sept-2007
*/
CREATE Proc [dbo].[SPQ_CH_GeneraDependenciasPermisos]
	@id_recurso_vt int
AS

set nocount on

declare @Empresa int,
		@EmpresaFuente int,
		@Plaza int


	--Obtener las estructuras a las que tiene permisos
	--Drop Table #Dependientes
	Create  Table #Dependientes
	            (Empresa int not null,
			     EmpresaFuente int not null,
			     Plaza  int not null,
	             Nivel int not null,
	             Cadena varchar(1000) not null)
	
	declare @Nivel int,
			@Cadena varchar(1000)
	
	select *
	into	#VT_Organigrama_tmp
	from	VT_Organigrama
	where	estatus		= 1 and
			publica		= 1
	

	DECLARE PlazasCursor CURSOR FOR
	select 	Empresa, EmpresaFuente, Plaza
	from 	kiosco.dbo.ch_permisos 
	where 	id_recurso_vt = @id_recurso_vt
			and		incexc = 1

	Open PlazasCursor
	FETCH NEXT FROM PlazasCursor
	INTO 	@Empresa, @EmpresaFuente, @Plaza



	WHILE @@FETCH_STATUS = 0
	BEGIN
	

		----| OBTENER Dependientes Directos e Indirectos|---------------------------------------------------------------------------------
		Set		@Nivel = 0
		set		@Cadena = ','+Convert(varchar(10),@Empresa) + Convert(varchar(10),@EmpresaFuente) + Convert(varchar(10),@Plaza)+','
		Insert #Dependientes Values(@Empresa, @EmpresaFuente, @Plaza, @Nivel, @Cadena)
		
		
		------------------------------------------------------------
		
		delete	#VT_Organigrama_tmp
		from	#VT_Organigrama_tmp o, #Dependientes d
		where	o.Empresa = d.Empresa and
				o.EmpresaFuente = d.EmpresaFuente and
				o.Plaza = d.Plaza
		
		delete	#VT_Organigrama_tmp
		from	#VT_Organigrama_tmp o, kiosco.dbo.ch_permisos p
		where	o.Empresa = p.Empresa and
				o.EmpresaFuente = p.EmpresaFuente and
				o.Plaza = p.Plaza and
				p.id_recurso_vt = @id_recurso_vt and
				p.incexc = 0	
				
		------------------------------------------------------------

		While Exists(	Select 	1 
						From 	VT_Organigrama o, #Dependientes d
						where	o.EmpresaFuente_Superior	= d.EmpresaFuente
								and		o.Plaza_Superior			= d.Plaza
								and		o.Empresa_Superior			= d.Empresa
								and		o.Estatus					= 1
								and		d.Nivel						= @Nivel)
		Begin
		
		
		            Insert  #Dependientes
		            Select  O.Empresa,
							O.EmpresaFuente,
							O.Plaza,
							@Nivel + 1,
							D.Cadena + Convert(varchar(10), O.Empresa) + Convert(varchar(10), O.EmpresaFuente) + Convert(varchar(10), O.Plaza)+','                 
		            From    #VT_Organigrama_tmp O,
							#Dependientes D
		            Where  	o.Empresa_Superior = D.Empresa
					and		o.EmpresaFuente_Superior = D.EmpresaFuente
					and		o.Plaza_Superior = D.Plaza
					and 	o.Estatus = 1 --Activas
					and		o.Publica = 1 --Publicas
		            and     D.Nivel = @Nivel
					
		
		
					delete	#VT_Organigrama_tmp
					from	#VT_Organigrama_tmp o, #Dependientes d
					where	o.Empresa = d.Empresa and
							o.EmpresaFuente = d.EmpresaFuente and
							o.Plaza = d.Plaza
					
					delete	#VT_Organigrama_tmp
					from	#VT_Organigrama_tmp o, kiosco.dbo.ch_permisos p
					where	o.Empresa = p.Empresa and
							o.EmpresaFuente = p.EmpresaFuente and
							o.Plaza = p.Plaza and
							p.id_recurso_vt = @id_recurso_vt and
							p.incexc = 0	
		
		
		            Set     @Nivel = @Nivel + 1

		
		End
		-------------------------------------------------------------------------------
		--Siguiente Plaza
		FETCH NEXT FROM PlazasCursor
		INTO @Empresa, @EmpresaFuente, @Plaza
	END
	CLOSE PlazasCursor
	DEALLOCATE PlazasCursor



select * from #Dependientes


set nocount off

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_ListaEmpleadosDepDirectos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
Objetivo: Consultar Dependientes Directos, segun la plaza a consulta y los permisos del usuario    
   Se utiliza en el menu Resumen de Resultados de Capital Humano    
Creado por: Jaime Sánchez    
Fecha:  12-Sept-2007    
-- -- grant exec on SPQ_CH_ListaEmpleadosDepDirectos to pinuser     
*/ CREATE Proc [dbo].[SPQ_CH_ListaEmpleadosDepDirectos]    
 @PlazaSuperior  int,    
 @EmpresaSuperior int,    
 @EmpresaFuenteSuperior int,    
 @id_recurso_vt int,    
 @Periodo int    
AS    
--     
--     
-- --TEST    
-- declare @PlazaSuperior  int,    
--   @EmpresaSuperior int,    
--   @EmpresaFuenteSuperior int,    
--   @id_recurso_vt int,    
--   @Periodo int,    
--   @Opcion int    
-- Select  @PlazaSuperior  = 2,    
--   @EmpresaSuperior = 5000,    
--   @EmpresaFuenteSuperior = 8,    
--   @id_recurso_vt = 1942,    
--   @Periodo = 2007,    
--   @Opcion = 1    
-- --TEST    
    
    
-- FALTA VALIDAR PERMISOS    
    
 --Obtener arbol del usuario por default    
 if (@PlazaSuperior = 0 and @EmpresaSuperior = 0 and @EmpresaFuenteSuperior = 0)    
  Select  @PlazaSuperior = Plaza,    
    @EmpresaSuperior = Empresa,    
    @EmpresaFuenteSuperior = EmpresaFuente    
  from vt_Organigrama    
  Where id_recurso_vt = @id_recurso_vt    
  and  Estatus = 1    
     
 set nocount on    
 select * into #Empleados from v_EmpleadosVerzatec
   
 select  id_Recurso_Vt = isnull(r.id_Recurso_Vt, 0),    
   id = isnull(re.id, 0),    
   o.plaza,    
   o.Empresa,    
   o.EmpresaFuente,    
   o.plaza_superior,    
   NombreCompleto = isnull(r.Nombre+' '+r.Paterno+' '+r.Materno, 'VACANTE'),    
   o.id_nivel_puesto,    
   o.staff,    
   Puesto = p.Desc_esp,    
   Hijos = ( select  case when count(*)>0 then 1 else 0 end     
     from  VT_Organigrama     
     where  plaza_superior = o.Plaza    
     and Empresa_Superior = o.Empresa    
     and EmpresaFuente_Superior = o.EmpresaFuente    
     and Estatus = 1    
     and Publica = 1),    
   empleado = isnull(re.empleado, 0),    
   nomina = isnull(re.nomina, 0),    
    ev.urlFoto,    
   Id_Area = o.Area,    
   ev.Area    
--    ,    
--    Nivel_Plaza  = IsNull(np.nivel, 0),    
--    Nivel_Recurso  = case when re.id is null then 10 Else IsNull(nr.nivel, 0) End,    
--    SM1    = IsNull(np.SM1, ''),    
--    SM2    = IsNull(np.SM2, ''),    
--    SM3    = IsNull(np.SM3, ''),    
--    SM4    = IsNull(np.SM4, ''),    
--    NivelSM1   = IsNull(np.NivelSM1, 0),    
--    NivelSM2   = IsNull(np.NivelSM2, 0),    
--    NivelSM3   = IsNull(np.NivelSM3, 0),    
--    NivelSM4   = IsNull(np.NivelSM4, 0)     
 from  VT_Organigrama o,    
   VT_Recursos r,    
   VT_RecursoEmpresa re,    
   VT_Puesto p,    
    #Empleados ev    
--    ,    
--    Kiosco.dbo.CH_Nivel_Plaza_vzt np,    
--    Kiosco.dbo.CH_Nivel_Recurso_vzt nr    
 where r.id_Recurso_vt =* o.id_Recurso_vt    
 and  re.empresa =* o.empresa    
 and  re.EmpresaFuente =* o.EmpresaFuente    
 and  re.id_Recurso_vt =* o.id_Recurso_vt    
 and  re.estatus not in (2, 4)    
 and  p.Empresa =* o.Empresa    
 and  p.EmpresaFuente =* o.EmpresaFuente    
 and  p.id_nivel_puesto =* o.id_nivel_puesto    
 and  o.estatus = 1    
 and  o.Publica = 1    
 and  ev.id_Recurso_vt =* o.id_Recurso_vt    
 and  ev.empresa =* o.empresa    
 and  ev.EmpresaFuente =* o.EmpresaFuente    
--  and  np.Empresa =* o.Empresa    
--  and  np.EmpresaFuente =* o.EmpresaFuente    
--  and  np.Plaza =* o.Plaza    
--  and  np.Periodo = @Periodo    
--  and  nr.id_recurso_vt =* o.id_recurso_vt    
--  and  nr.Periodo = @Periodo    
 and  (o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior    
   OR    
   o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )    
-- Order by p.Desc_esp    
Order by  o.plaza_superior, puesto

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Minutas]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- grant exec on SPQ_CH_Minutas to pinuser
CREATE proc [dbo].[SPQ_CH_Minutas]
	@Division  		int = -1,
	@Entidad		int = -1,       
	@Direccion 		int = -1,        
	@Area     		int = -1,
	@Periodo 		int = -1,
	@id_recurso_vt	int
as


SET NOCOUNT ON



create table #Catalogo_Divisiones(
	idDivision int,  
	Division varchar(50)  ) 


insert into #Catalogo_Divisiones exec Kiosco.dbo.SPQ_CH_DivisionPermiso @id_recurso_vt

insert #Catalogo_Divisiones values(-1, '--')



create table #Catalog_Entidades(
		Entidad		int,
		DescEntidad varchar(100))

insert into #Catalog_Entidades exec Kiosco.dbo.SPQ_CH_EntidadPermiso 2000, 0

insert #Catalog_Entidades values(-1, '--')




select  Distinct       
		ID_Direccion	= e.idDireccion,      
		Desc_Direccion	= e.Direccion 
into	#Catalogo_Direcciones
from	Organizacion_VZT.dbo.v_EmpleadosVerzatec e,      
		Kiosco.dbo.CH_Permisos p      
where	p.id_recurso_vt			= @id_recurso_vt
		and	 p.Empresa			= e.Empresa      
		and  p.EmpresaFuente	= e.EmpresaFuente      
		and  p.Plaza			= e.Plaza      
		and  p.IncExc			= 1      
		and  not e.idDireccion is null

insert #Catalogo_Direcciones values(-1, '--')


select  Distinct       
		ID_Area = e.idArea,      
		Desc_Area = e.Area
into	#Catalogo_Areas
from	Organizacion_VZT.dbo.v_EmpleadosVerzatec e,      
		Kiosco.dbo.CH_Permisos p      
where	p.id_recurso_vt = @id_recurso_vt
		and	 p.Empresa = e.Empresa      
		and  p.EmpresaFuente = e.EmpresaFuente      
		and  p.Plaza = e.Plaza      
		and  p.IncExc = 1            
		and  e.idDireccion in(select ID_Direccion from #Catalogo_Direcciones)


insert #Catalogo_Areas values(-1, '--')
		
		

select	m.Id_Minuta,
		div.Division,
		e.DescEntidad as Entidad,
		dir.Desc_Direccion,
		a.Desc_Area,
		m.Periodo,
		m.Fecha
from	kiosco.dbo.CH_Minutas_vzt	m,
		#Catalogo_Divisiones		div,
		#Catalog_Entidades			e,
		#Catalogo_Direcciones		dir,
		#Catalogo_Areas				a
where	(m.Division		= @Division		or @Division = -1) and
		(m.Entidad		= @Entidad		or @Entidad = -1) and
		(m.Direccion	= @Direccion	or @Direccion = -1) and
		(m.Area			= @Area			or @Area = -1 )and
		m.Periodo		= @Periodo and
		
		m.Division		= div.idDivision and
		m.Entidad		= e.Entidad	and
		m.direccion		= dir.ID_Direccion and
		m.Area			= a.ID_Area
		
order by m.Fecha

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Organigrama_Hijos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Objetivo:	Consultar los hijos de la plaza superior, trayendo los niveles de Capital Humano
			Se utiliza en el menu Estructura de Capital Humano
Creado por:	Jaime Sánchez
Fecha:		05-Sept-2007
-- -- grant exec on SPQ_CH_Organigrama_Hijos to pinuser 
*/
CREATE	Proc [dbo].[SPQ_CH_Organigrama_Hijos]
	@PlazaSuperior 	int,
	@EmpresaSuperior int,
	@EmpresaFuenteSuperior int,
	@id_recurso_vt	int,
	@Periodo int
AS
	
	-- declare	@PlazaSuperior 	int,
	-- 		@EmpresaSuperior int,
	-- 		@EmpresaFuenteSuperior int,
	-- 		@id_recurso_vt	int,
	-- 		@Periodo int
	-- 
	-- select	@PlazaSuperior 	= 3254,
	-- 		@EmpresaSuperior = 5000,
	-- 		@EmpresaFuenteSuperior = 2,
	-- 		@id_recurso_vt	= 1942,
	-- 		@Periodo = 2007

	set nocount on
-- drop table #hijos

--	CONSULTAR PLAZAS OCUPADAS
	select 	id_Recurso_Vt = isnull(r.id_Recurso_Vt, 0),
			id = isnull(re.id, 0),
			o.plaza,
			o.Empresa,
			o.EmpresaFuente,
			o.plaza_superior,
			Nombre_Completo = r.Nombre+' '+r.Paterno+' '+r.Materno,
			o.id_nivel_puesto,
			staff=0,--CACM --o.staff,
			Puesto = p.Desc_esp,
			Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
					from 	VT_Organigrama 
					where 	plaza_superior = o.Plaza
					and	Empresa_Superior = o.Empresa
					and	EmpresaFuente_Superior = o.EmpresaFuente
					and	Estatus = 1
					and	Publica = 1),
			empleado = isnull(re.empleado, 0),
			nomina = isnull(re.nomina, 0),
	 		ev.urlFoto,
			Nivel_Plaza 	= IsNull(np.nivel, 0),
			Nivel_Recurso 	= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End,
			IDSM1 			= IsNull(np.IDSM1, 0),
			IDSM2 			= IsNull(np.IDSM2, 0),
			IDSM3 			= IsNull(np.IDSM3, 0),
			IDSM4 			= IsNull(np.IDSM4, 0),
			SM1 			= IsNull(np.SM1, ''),
			SM2 			= IsNull(np.SM2, ''),
			SM3 			= IsNull(np.SM3, ''),
			SM4 			= IsNull(np.SM4, ''),
			NivelSM1 		= IsNull(np.NivelSM1, 0),
			NivelSM2 		= IsNull(np.NivelSM2, 0),
			NivelSM3 		= IsNull(np.NivelSM3, 0),
			NivelSM4 		= IsNull(np.NivelSM4, 0),
			NivelPade		= IsNull(dbo.fnCodigoPotencial(r.id_Recurso_Vt, @Periodo-1), 0)
	into #Hijos	
	from 	VT_Organigrama o,
			VT_Recursos r,
			VT_RecursoEmpresa re,
			VT_Puesto p,
	 		v_EmpleadosVerzatec ev,
			Kiosco.dbo.CH_Nivel_Plaza_vzt	np,
			Kiosco.dbo.CH_Nivel_Recurso_vzt	nr
	where	r.id_Recurso_vt = o.id_Recurso_vt
	and		re.empresa = o.empresa
	and		re.EmpresaFuente = o.EmpresaFuente
	and		re.id_Recurso_vt = o.id_Recurso_vt
	and		re.estatus not in (2, 4)
	and		p.Empresa =* o.Empresa
	and		p.EmpresaFuente =* o.EmpresaFuente
	and		p.id_nivel_puesto =* o.id_nivel_puesto
	and		o.estatus = 1
	and		o.Publica = 1
	and		ev.id_Recurso_vt =* o.id_Recurso_vt
	and		ev.empresa =* o.empresa
	and		ev.EmpresaFuente =* o.EmpresaFuente
	and		np.Empresa =* o.Empresa
	and		np.EmpresaFuente =* o.EmpresaFuente
	and		np.Plaza =* o.Plaza
	and		np.Periodo = @Periodo
	and		nr.id_recurso_vt =* o.id_recurso_vt
	--Validar Permisos (excluir las plazas que tenga marcadas como Excluidas)
	and		not exists(	select 	* 
						from 	kiosco.dbo.CH_Permisos
						where	id_recurso_vt = @id_recurso_vt --Usuario Firmado
						and		Empresa = o.Empresa
						and		EmpresaFuente = o.EmpresaFuente
						and		Plaza = o.Plaza
						and		IncExc = 0
						)
	and		nr.Periodo = @Periodo
	and		o.Plaza_Superior= @PlazaSuperior
	and		o.Empresa_Superior = @EmpresaSuperior
	and		o.EmpresaFuente_Superior = @EmpresaFuenteSuperior
	Order by np.Fecha_Mod asc, nr.Fecha_Mod asc, p.Desc_esp


--	CONSULTAR PLAZAS VACANTES
	insert into #Hijos
	select 	0,
			0,
			o.plaza,
			o.Empresa,
			o.EmpresaFuente,
			o.plaza_superior,
			'VACANTE',
			o.id_nivel_puesto,
			staff=0,--CACM o.staff,
			Puesto = p.Desc_esp,
			Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
						from 	VT_Organigrama 
						where 	plaza_superior = o.Plaza
						and		Empresa_Superior = o.Empresa
						and		EmpresaFuente_Superior = o.EmpresaFuente
						and		Estatus = 1
						and		Publica = 1),
			0,
			0,
	 		'',
			Nivel_Plaza 	= IsNull(np.nivel, 0),
			Nivel_Recurso 	= 10,
			IDSM1 			= IsNull(np.IDSM1, 0),
			IDSM2 			= IsNull(np.IDSM2, 0),
			IDSM3 			= IsNull(np.IDSM3, 0),
			IDSM4 			= IsNull(np.IDSM4, 0),
			SM1 			= IsNull(np.SM1, ''),
			SM2 			= IsNull(np.SM2, ''),
			SM3 			= IsNull(np.SM3, ''),
			SM4 			= IsNull(np.SM4, ''),
			NivelSM1 		= IsNull(np.NivelSM1, 0),
			NivelSM2 		= IsNull(np.NivelSM2, 0),
			NivelSM3 		= IsNull(np.NivelSM3, 0),
			NivelSM4 		= IsNull(np.NivelSM4, 0),	
			NivelPade		= 0
	from 	VT_Organigrama o,
			VT_Puesto p,
			Kiosco.dbo.CH_Nivel_Plaza_vzt np
	where	p.Empresa =* o.Empresa
	and		p.EmpresaFuente =* o.EmpresaFuente
	and		p.id_nivel_puesto =* o.id_nivel_puesto
	and		o.estatus = 1
	and		o.Publica = 1
	and		o.id_recurso_vt = 0
	and		np.Empresa =* o.Empresa
	and		np.EmpresaFuente =* o.EmpresaFuente
	and		np.Plaza =* o.Plaza
	and		np.Periodo = @Periodo
	--Validar Permisos (excluir las plazas que tenga marcadas como Excluidas)
	and		not exists(	select 	* 
						from 	kiosco.dbo.CH_Permisos
						where	id_recurso_vt = @id_recurso_vt --Usuario Firmado
						and		Empresa = o.Empresa
						and		EmpresaFuente = o.EmpresaFuente
						and		Plaza = o.Plaza
						and		IncExc = 0
						)
	and		o.Plaza_Superior= @PlazaSuperior
	and		o.Empresa_Superior = @EmpresaSuperior
	and		o.EmpresaFuente_Superior = @EmpresaFuenteSuperior
	Order by np.Fecha_Mod asc, p.Desc_esp

	set nocount off 
	select distinct	* 
	from 	#Hijos
	Order by Puesto


GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Organigrama_Hijos_DistribucionPlaza]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- grant exec on SPQ_CH_Organigrama_Hijos to pinuser 
CREATE	Proc [dbo].[SPQ_CH_Organigrama_Hijos_DistribucionPlaza]
	@PlazaSuperior 	int,
	@EmpresaSuperior int,
	@EmpresaFuenteSuperior int,
	@Periodo int
AS
	

declare @Plaza 	int,
		@Empresa int,
		@EmpresaFuente int,
		@Division int ,
		@Entidad int,
		@Direccion int,
		@Area int,
		@Nivel_Plaza 	int,
		@Nivel_Recurso 	int

-- drop table #hijos

--	CONSULTAR PLAZAS OCUPADAS
	select 	id_Recurso_Vt = isnull(r.id_Recurso_Vt, 0),
			-------------------------------
			o.Empresa,
			o.EmpresaFuente,
			 case when o.Entidad in (1000) then 1
			     when o.Entidad in (1301,1200,2050,2041,2042,1110,1100,1400,1500,5000,0) then 2
			     when o.Entidad in (4020) then 3
			     when o.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070) then 4 end as Division,
			o.Entidad,
			Direccion =(/*--Direccion*/SELECT Nivel
                            FROM       Organizacion_vzt.dbo.VT_NivelesEstructura
                            WHERE      id_NivelEstructura = ne.id_NivelSuperior 
					AND Empresa = ne.Empresa 
					AND EmpresaFuente = ne.EmpresaFuente 
					AND (Fecha_Vigencia_Hasta IS NULL)
                                        AND Estructura = 2), 
			o.Area,
			o.plaza, 
			o.plaza_superior,
			Puesto = o.id_nivel_puesto,
			p.id_Nivel,
			-------------------------------
			Nivel_Plaza 	= IsNull(np.nivel, 0),
			Nivel_Recurso 	= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End
	into #Hijos	
	from 	VT_Organigrama o,
			VT_Recursos r,
			VT_RecursoEmpresa re,
			VT_Puesto p,
	 		v_EmpleadosVerzatec ev,
			VT_NivelesEstructura ne,
			Kiosco.dbo.CH_Nivel_Plaza_vzt	np,
			Kiosco.dbo.CH_Nivel_Recurso_vzt	nr
	where	r.id_Recurso_vt = o.id_Recurso_vt
	and		re.empresa = o.empresa
	and		re.EmpresaFuente = o.EmpresaFuente
	and		re.id_Recurso_vt = o.id_Recurso_vt
	and		re.estatus not in (2, 4)
	and		p.Empresa =* o.Empresa
	and		p.EmpresaFuente =* o.EmpresaFuente
	and		p.id_nivel_puesto =* o.id_nivel_puesto
	and		o.estatus = 1
	and		o.Publica = 1
	and		ev.id_Recurso_vt =* o.id_Recurso_vt
	and		ev.empresa =* o.empresa
	and		ev.EmpresaFuente =* o.EmpresaFuente
	and		np.Empresa =* o.Empresa
	and		np.EmpresaFuente =* o.EmpresaFuente
	and		np.Plaza =* o.Plaza
	and		np.Periodo = @Periodo
	and		nr.id_recurso_vt =* o.id_recurso_vt
	and		nr.Periodo = @Periodo
	and		ne.Nivel = o.Area 
	AND		ne.Empresa = o.Empresa 
	AND		ne.EmpresaFuente = o.EmpresaFuente 
	AND		(ne.Fecha_Vigencia_Hasta IS NULL )
	AND		ne.Estructura = 2
	and		o.Plaza_Superior= @PlazaSuperior
	and		o.Empresa_Superior = @EmpresaSuperior
	and		o.EmpresaFuente_Superior = @EmpresaFuenteSuperior
	Order by np.Fecha_Mod asc, nr.Fecha_Mod asc, p.Desc_esp


--	CONSULTAR PLAZAS VACANTES
	insert into #Hijos
	select 	0,
			o.Empresa,
			o.EmpresaFuente,
	 		case when o.Entidad in (1000) then 1
			     when o.Entidad in (1301,1200,2050,2041,2042,1110,1100,1400,1500,5000,0) then 2
			     when o.Entidad in (4020) then 3
			     when o.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070) then 4 end as Division,
			o.Entidad,
			Direccion =(/*--Direccion*/SELECT Nivel
                            FROM       Organizacion_vzt.dbo.VT_NivelesEstructura
                            WHERE      id_NivelEstructura = ne.id_NivelSuperior 
					AND Empresa = ne.Empresa 
					AND EmpresaFuente = ne.EmpresaFuente 
					AND (Fecha_Vigencia_Hasta IS NULL)
                                        AND Estructura = 2), 
			o.Area,
			o.plaza, 
			o.plaza_superior,
			Puesto = o.id_nivel_puesto,
			p.id_Nivel,
			Nivel_Plaza 	= IsNull(np.nivel, 0),
			Nivel_Recurso 	= 10
	from 	VT_Organigrama o,
			VT_Puesto p,
		VT_NivelesEstructura ne,
			Kiosco.dbo.CH_Nivel_Plaza_vzt np
	where	p.Empresa =* o.Empresa
	and		p.EmpresaFuente =* o.EmpresaFuente
	and		p.id_nivel_puesto =* o.id_nivel_puesto
	and		o.estatus = 1
	and		o.Publica = 1
	and		o.id_recurso_vt = 0
	and		np.Empresa =* o.Empresa
	and		np.EmpresaFuente =* o.EmpresaFuente
	and		np.Plaza =* o.Plaza
	and		np.Periodo = @Periodo
	and		ne.Nivel = o.Area 
	AND		ne.Empresa = o.Empresa 
	AND		ne.EmpresaFuente = o.EmpresaFuente 
	AND		(ne.Fecha_Vigencia_Hasta IS NULL )
	AND		ne.Estructura = 2
	and		o.Plaza_Superior= @PlazaSuperior
	and		o.Empresa_Superior = @EmpresaSuperior
	and		o.EmpresaFuente_Superior = @EmpresaFuenteSuperior
	Order by np.Fecha_Mod asc, p.Desc_esp 

DECLARE Emp_Cursor CURSOR FOR  
-- Obtener la informacion del Elmento
	Select 	Empresa,
		EmpresaFuente,
		Plaza,
		case when Entidad = 1000 and Direccion in (7000,10000,9000,8000) then 2
		when Entidad in (1000) and not (Direccion in (7000,10000,9000,8000)) then 1
		when Entidad in (1200) AND Direccion in (2000) then 1
		when Entidad in (1200) AND not (Direccion in (2000)) then 2
		when Entidad in (1301,2050,2041,2042,1110,1100,1400,1500,5000,0) then 2
		when Entidad in (4020) then 3
		when Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070) then 4 end as Division,
	Entidad,
	Direccion,
	Area,
	 Nivel_Plaza,
	 Nivel_Recurso
	from #Hijos
OPEN Emp_Cursor;  
FETCH NEXT FROM Emp_Cursor  
into @Empresa,@EmpresaFuente,@Plaza,@Division,@Entidad,@Direccion,@Area,@Nivel_Plaza,@Nivel_Recurso;  
  
  WHILE (@@FETCH_STATUS<>-1) 
    BEGIN 
        IF(@@FETCH_STATUS<>-2) 
        BEGIN 
	-- Preguntar si tiene Hijos
	IF EXISTS(select * 
			from 	VT_Organigrama 
			where 	plaza_superior = @Plaza
			and	Empresa_Superior = @Empresa
			and	EmpresaFuente_Superior = @EmpresaFuente
			and	Estatus = 1
			and	Publica = 1)
	BEGIN

	-- Volverlo Padre
	Exec SPQ_Organigrama_Padre_DistribucionPlaza @Plaza, @Empresa, @EmpresaFuente
	end
	else
	begin
	--Select 'Paso Update'
	-- Actualizar tabla de Recurso
	Update [kiosco].[dbo].[CH_DistribucionRecursosOrganigrama]
	set Cantidad = Cantidad +1
	where @Division = Empresa and
	@Entidad = Entidad and
	@Direccion = Direccion and
	@Area = Area and
	@Nivel_Recurso 	= Nivel

	-- ACTUALIZAR TABLA PUESTO
	Update [kiosco].[dbo].[CH_DistribucionPuestosOrganigrama]
	set Cantidad = Cantidad +1
	where @Division = Empresa and
	@Entidad = Entidad and
	@Direccion = Direccion and
	@Area = Area and
	@Nivel_Plaza 	= Nivel
	end
END
FETCH NEXT FROM Emp_Cursor  
	into @Empresa,@EmpresaFuente,@Plaza,@Division,@Entidad,@Direccion,@Area,@Nivel_Plaza,@Nivel_Recurso;  
   END;  
CLOSE Emp_Cursor;  
DEALLOCATE Emp_Cursor;
	
--	
--SELECT *
--FROM #Hijos

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Organigrama_Padre]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
Objetivo: Consultar la cabeza del árbol, trayendo los niveles de Capital Humano  
   Se utiliza en el menu de "Estructura" de Capital Humano  
Creado por: Jaime Sánchez  
Fecha:  05-Sept-2007  
-- --grant exec on SPQ_CH_Organigrama_Padre to pinuser   
*/  
CREATE	Proc [dbo].[SPQ_CH_Organigrama_Padre]  
	@Plaza  int,  
	@Empresa int,  
	@EmpresaFuente int,  
	@id_recurso_vt int,  
	@Periodo int  
AS  
  
	if (@Plaza = 0 and @Empresa = 0 and @EmpresaFuente = 0)  
		Select  @Plaza 		= Plaza,  
			@Empresa 	= Empresa,  
			@EmpresaFuente 	= EmpresaFuente  
		from 	vt_Organigrama  
		Where 	id_recurso_vt 	= @id_recurso_vt  
		and  	Estatus 	= 1  
  
--Validar si la plaza que va a consultar esta en el arbol de las plazas que tiene permiso  
--Exec SPQ_RH_Depende @PlazaSol, @PlazaSup, @Depende OUTPUT  
  
	select  id_recurso_vt = isnull(o.id_recurso_vt, 0),  
		id 			= isnull(re.id, 0),  
		o.plaza,  
		o.Empresa,  
		o.EmpresaFuente,  
		o.plaza_superior,  
		Nombre_Completo 	= isnull(r.Nombre+' '+r.Paterno+' '+r.Materno, 'VACANTE'),  
		o.id_nivel_puesto,  
		o.staff,  
		Puesto = p.Desc_esp,  
		Hijos 			= ( 	select	case when count(*)>0 then 1 else 0 end   
						from  	VT_Organigrama   
						where  	plaza_superior 		= o.Plaza  
						and  	Empresa_Superior 	= o.Empresa  
						and  	EmpresaFuente_Superior 	= o.EmpresaFuente  
						and  	Estatus 		= 1  
						and  	Publica 		= 1),  
		re.empleado,  
		re.nomina,  
		ev.urlFoto,  
		Nivel_Plaza  		= IsNull(np.nivel, 0),  
		Nivel_Recurso  		= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End,  
		IDSM1			= IsNull(np.IDSM1, 0),  
		IDSM2			= IsNull(np.IDSM2, 0),  
		IDSM3			= IsNull(np.IDSM3, 0),  
		IDSM4			= IsNull(np.IDSM4, 0),  
		SM1			= IsNull(np.SM1, ''),  
		SM2			= IsNull(np.SM2, ''),  
		SM3			= IsNull(np.SM3, ''),  
		SM4			= IsNull(np.SM4, ''),  
		NivelSM1		= IsNull(np.NivelSM1, 0),  
		NivelSM2		= IsNull(np.NivelSM2, 0),  
		NivelSM3		= IsNull(np.NivelSM3, 0),  
		NivelSM4		= IsNull(np.NivelSM4, 0),
		NivelPade		= IsNull(dbo.fnCodigoPotencial(o.id_recurso_vt, @Periodo-1), 0)
	from	VT_Organigrama 			o,  
		VT_Recursos 			r,  
		VT_RecursoEmpresa 		re,  
		VT_Puesto 			p,  
		v_EmpleadosVerzatec 		ev,  
		Kiosco.dbo.CH_Nivel_Plaza_vzt 	np,  
		Kiosco.dbo.CH_Nivel_Recurso_vzt nr  
	where 	r.id_Recurso_vt 	=* o.id_Recurso_vt  
	and	re.empresa 		=* o.empresa  
	and	re.EmpresaFuente 	=* o.EmpresaFuente  
	and	re.id_Recurso_vt 	=* o.id_Recurso_vt  
	and	re.estatus 		not in (2, 4)  
	and	p.Empresa		=* o.Empresa  
	and	p.EmpresaFuente 	=* o.EmpresaFuente  
	and	p.id_nivel_puesto	=* o.id_nivel_puesto  
	and	o.estatus 		= 1  
	and	o.Publica 		= 1  
	and	ev.id_Recurso_vt 	=* o.id_Recurso_vt  
	and	ev.empresa 		=* o.empresa  
	and	ev.EmpresaFuente 	=* o.EmpresaFuente  
	and	np.Empresa 		=* o.Empresa  
	and	np.EmpresaFuente 	=* o.EmpresaFuente  
	and	np.Plaza 		=* o.Plaza  
	and	np.Periodo 		= @Periodo  
	and	nr.id_recurso_vt 	=* o.id_recurso_vt  
	and	nr.Periodo 		= @Periodo  
	and	o.Plaza 		= @Plaza  
	and	o.Empresa 		= @Empresa  
	and	o.EmpresaFuente 	= @EmpresaFuente  
 	-- Order by p.Desc_esp asc

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Organigrama_Padre_cpvc_170309]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
Objetivo: Consultar la cabeza del árbol, trayendo los niveles de Capital Humano  
   Se utiliza en el menu de "Estructura" de Capital Humano  
Creado por: Jaime Sánchez  
Fecha:  05-Sept-2007  
-- --grant exec on SPQ_CH_Organigrama_Padre to pinuser 
exec SPQ_CH_Organigrama_Padre_cpvc_170309 7167,5000,2,8964,2008  
*/  
CREATE Proc [dbo].[SPQ_CH_Organigrama_Padre_cpvc_170309]  
 @Plaza  int,  
 @Empresa int,  
 @EmpresaFuente int,  
 @id_recurso_vt int,  
 @Periodo int  
AS  
  
Select * into #Empleados from V_EmpleadosVerzatec

  if (@Plaza = 0 and @Empresa = 0 and @EmpresaFuente = 0)  
 Select  @Plaza = Plaza,  
   @Empresa = Empresa,  
   @EmpresaFuente = EmpresaFuente  
 from vt_Organigrama  
 Where id_recurso_vt = @id_recurso_vt  
 and  Estatus = 1  
  
--Validar si la plaza que va a consultar esta en el arbol de las plazas que tiene permiso  
--Exec SPQ_RH_Depende @PlazaSol, @PlazaSup, @Depende OUTPUT  
  
 select  id_recurso_vt = isnull(o.id_recurso_vt, 0),  
   id = isnull(re.id, 0),  
   o.plaza,  
   o.Empresa,  
   o.EmpresaFuente,  
   o.plaza_superior,  
   Nombre_Completo = isnull(r.Nombre+' '+r.Paterno+' '+r.Materno, 'VACANTE'),  
   o.id_nivel_puesto,  
   o.staff,  
   Puesto = p.Desc_esp,  
   Hijos = ( select  case when count(*)>0 then 1 else 0 end   
      from  VT_Organigrama   
      where  plaza_superior = o.Plaza  
      and  Empresa_Superior = o.Empresa  
      and  EmpresaFuente_Superior = o.EmpresaFuente  
      and  Estatus = 1  
      and  Publica = 1),  
   re.empleado,  
   re.nomina,  
   ev.urlFoto,  
   Nivel_Plaza  = IsNull(np.nivel, 0),  
   Nivel_Recurso  = case when re.id is null then 10 Else IsNull(nr.nivel, 0) End,  
   SM1    = IsNull(np.SM1, ''),  
   SM2    = IsNull(np.SM2, ''),  
   SM3    = IsNull(np.SM3, ''),  
   SM4    = IsNull(np.SM4, ''),  
   NivelSM1   = IsNull(np.NivelSM1, 0),  
   NivelSM2   = IsNull(np.NivelSM2, 0),  
   NivelSM3   = IsNull(np.NivelSM3, 0),  
   NivelSM4   = IsNull(np.NivelSM4, 0)  
 from  VT_Organigrama o,  
   VT_Recursos r,  
   VT_RecursoEmpresa re,  
   VT_Puesto p,  
   #Empleados ev,  
   Kiosco.dbo.CH_Nivel_Plaza_vzt np,  
   Kiosco.dbo.CH_Nivel_Recurso_vzt nr  
 where r.id_Recurso_vt =* o.id_Recurso_vt  
 and  re.empresa =* o.empresa  
 and  re.EmpresaFuente =* o.EmpresaFuente  
 and  re.id_Recurso_vt =* o.id_Recurso_vt  
 and  re.estatus not in (2, 4)  
 and  p.Empresa =* o.Empresa  
 and  p.EmpresaFuente =* o.EmpresaFuente  
 and  p.id_nivel_puesto =* o.id_nivel_puesto  
 and  o.estatus = 1  
 and  o.Publica = 1  
 and  ev.id_Recurso_vt =* o.id_Recurso_vt  
 and  ev.empresa =* o.empresa  
 and  ev.EmpresaFuente =* o.EmpresaFuente  
 and  np.Empresa =* o.Empresa  
 and  np.EmpresaFuente =* o.EmpresaFuente  
 and  np.Plaza =* o.Plaza  
 and  np.Periodo = @Periodo  
 and  nr.id_recurso_vt =* o.id_recurso_vt  
 and  nr.Periodo = @Periodo  
 and  o.Plaza = @Plaza  
 and  o.Empresa = @Empresa  
 and  o.EmpresaFuente = @EmpresaFuente  
  
-- Order by p.Desc_esp asc

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Organigrama_Padre_FiltroEntidad]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
Objetivo: Consultar la cabeza del árbol, trayendo los niveles de Capital Humano  
   Se utiliza en el menu de "Estructura" de Capital Humano  
Creado por: Jaime Sánchez  
Fecha:  05-Sept-2007  
-- --grant exec on SPQ_CH_Organigrama_Padre to pinuser   
*/  
CREATE	Proc [dbo].[SPQ_CH_Organigrama_Padre_FiltroEntidad]  
	@Plaza  int,  
	@Empresa int,  
	@EmpresaFuente int,  
	@id_recurso_vt int,  
	@Periodo int ,
	@Entidad int=0 
AS  
  
	if (@Plaza = 0 and @Empresa = 0 and @EmpresaFuente = 0)  
		Select  @Plaza 		= Plaza,  
			@Empresa 	= Empresa,  
			@EmpresaFuente 	= EmpresaFuente  
		from 	vt_Organigrama  
		Where 	id_recurso_vt 	= @id_recurso_vt  
		and  	Estatus 	= 1  
  
--Validar si la plaza que va a consultar esta en el arbol de las plazas que tiene permiso  
--Exec SPQ_RH_Depende @PlazaSol, @PlazaSup, @Depende OUTPUT  
  
	select  id_recurso_vt = isnull(o.id_recurso_vt, 0),  
		id 			= isnull(re.id, 0),  
		o.plaza,  
		o.Empresa,  
		o.EmpresaFuente,  
		o.plaza_superior,  
		Nombre_Completo 	= isnull(r.Nombre+' '+r.Paterno+' '+r.Materno, 'VACANTE'),  
		o.id_nivel_puesto,  
		o.staff,  
		Puesto = p.Desc_esp,  
		Hijos 			= ( 	select	case when count(*)>0 then 1 else 0 end   
						from  	VT_Organigrama   
						where  	plaza_superior 		= o.Plaza  
						and  	Empresa_Superior 	= o.Empresa  
						and  	EmpresaFuente_Superior 	= o.EmpresaFuente  
						and  	Estatus 		= 1  
						and  	Publica 		= 1),  
		re.empleado,  
		re.nomina,  
		ev.urlFoto,  
		Nivel_Plaza  		= IsNull(np.nivel, 0),  
		Nivel_Recurso  		= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End,  
		IDSM1			= IsNull(np.IDSM1, 0),  
		IDSM2			= IsNull(np.IDSM2, 0),  
		IDSM3			= IsNull(np.IDSM3, 0),  
		IDSM4			= IsNull(np.IDSM4, 0),  
		SM1			= IsNull(np.SM1, ''),  
		SM2			= IsNull(np.SM2, ''),  
		SM3			= IsNull(np.SM3, ''),  
		SM4			= IsNull(np.SM4, ''),  
		NivelSM1		= IsNull(np.NivelSM1, 0),  
		NivelSM2		= IsNull(np.NivelSM2, 0),  
		NivelSM3		= IsNull(np.NivelSM3, 0),  
		NivelSM4		= IsNull(np.NivelSM4, 0),
		NivelPade		= IsNull(dbo.fnCodigoPotencial(o.id_recurso_vt, @Periodo-1), 0)
	from	VT_Organigrama 			o,  
		VT_Recursos 			r,  
		VT_RecursoEmpresa 		re,  
		VT_Puesto 			p,  
		v_EmpleadosVerzatec 		ev,  
		Kiosco.dbo.CH_Nivel_Plaza_vzt 	np,  
		Kiosco.dbo.CH_Nivel_Recurso_vzt nr  
	where 	r.id_Recurso_vt 	=* o.id_Recurso_vt  
	and	re.empresa 		=* o.empresa  
	and	re.EmpresaFuente 	=* o.EmpresaFuente  
	and	re.id_Recurso_vt 	=* o.id_Recurso_vt  
	and	re.estatus 		not in (2, 4)  
	and	p.Empresa		=* o.Empresa  
	and	p.EmpresaFuente 	=* o.EmpresaFuente  
	and	p.id_nivel_puesto	=* o.id_nivel_puesto  
	and	o.estatus 		= 1  
	and	o.Publica 		= 1  
	and	ev.id_Recurso_vt 	=* o.id_Recurso_vt  
	and	ev.empresa 		=* o.empresa  
	and	ev.EmpresaFuente 	=* o.EmpresaFuente  
	and	np.Empresa 		=* o.Empresa  
	and	np.EmpresaFuente 	=* o.EmpresaFuente  
	and	np.Plaza 		=* o.Plaza  
	and	np.Periodo 		= @Periodo  
	and	nr.id_recurso_vt 	=* o.id_recurso_vt  
	and	nr.Periodo 		= @Periodo  
	and	o.Plaza 		= @Plaza  
	and	o.Empresa 		= @Empresa  
	and	o.EmpresaFuente 	= @EmpresaFuente  
	--CACM Filtro Entidad--
	and ev.Entidad=case @Entidad when 0 then ev.Entidad else @Entidad end
 	-- Order by p.Desc_esp asc


GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Organigrama_Plano]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- grant exec on SPQ_CH_Organigrama_Plano to pinuser  
CREATE proc [dbo].[SPQ_CH_Organigrama_Plano]
	@Plaza			int,  
	@Empresa		int,  
	@EmpresaFuente	int,  
	@id_recurso_vt	int,  
	@Periodo		int,
	@Nivel_Plaza	int = -1,
	@SoloBlackBelt	bit,
	@Codigo			int,
	@Area			int = -1
as


set nocount on


If @Codigo < 1   
	Set @Codigo = -1

if @Nivel_Plaza = 0
	select @Nivel_Plaza = -1

declare @PlazaHijos			int,  
		@EmpresaHijos		int,  
		@EmpresaFuenteHijos	int,
		@Llave				varchar(50)


create table #Organigrama_Plano(
		id_recurso_vt		int,
		id					int,
		plaza				int,
		Empresa				int,
		EmpresaFuente		int,
		plaza_superior		int,
		Nombre_Completo		varchar(300),
		id_nivel_puesto		int,
		staff				int,
		Puesto				varchar(300),
		Hijos				bit,
		empleado			int,
		nomina				int,
		urlFoto				varchar(132),
		Nivel_Plaza			int,
		Nivel_Recurso		int,
		IDSM1				int,
		IDSM2				int,
		IDSM3				int,
		IDSM4				int,
		SM1					varchar(100),
		SM2					varchar(100),
		SM3					varchar(100),
		SM4					varchar(100),
		NivelSM1			int,
		NivelSM2			int,
		NivelSM3			int,
		NivelSM4			int,
		NivelPade			int,
		Llave				varchar(50) not null)

if (@Plaza = 0 and @Empresa = 0 and @EmpresaFuente = 0)  
	Select  @Plaza 			= Plaza,  
			@Empresa 		= Empresa,  
			@EmpresaFuente 	= EmpresaFuente  
	from 	vt_Organigrama  
	Where 	id_recurso_vt 	= @id_recurso_vt  
	and  	Estatus 		= 1  


select  id_recurso_vt		= isnull(o.id_recurso_vt, 0),  
		id 					= isnull(re.id, 0),  
		o.plaza,  
		o.Empresa,  
		o.EmpresaFuente,  
		o.plaza_superior,  
		Nombre_Completo		= isnull(r.Nombre + ' ' + r.Paterno + ' ' + r.Materno, 'VACANTE'),  
		o.id_nivel_puesto,  
		o.staff,  
		Puesto				= p.Desc_esp,  
		Hijos 				= ( select	case when count(*) > 0 then 1 else 0 end   
								from  	VT_Organigrama   
								where  	plaza_superior 		= o.Plaza  
										and  	Empresa_Superior 	= o.Empresa  
										and  	EmpresaFuente_Superior 	= o.EmpresaFuente  
										and  	Estatus 		= 1  
										and  	Publica 		= 1),  
		re.empleado,  
		re.nomina,  
		ev.urlFoto,  
		Nivel_Plaza  		= IsNull(np.nivel, 0),  
		Nivel_Recurso  		= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End,  
		IDSM1				= IsNull(np.IDSM1, 0),  
		IDSM2				= IsNull(np.IDSM2, 0),  
		IDSM3				= IsNull(np.IDSM3, 0),  
		IDSM4				= IsNull(np.IDSM4, 0),  
		SM1					= IsNull(np.SM1, ''),  
		SM2					= IsNull(np.SM2, ''),  
		SM3					= IsNull(np.SM3, ''),  
		SM4					= IsNull(np.SM4, ''),  
		NivelSM1			= IsNull(np.NivelSM1, 0),  
		NivelSM2			= IsNull(np.NivelSM2, 0),  
		NivelSM3			= IsNull(np.NivelSM3, 0),  
		NivelSM4			= IsNull(np.NivelSM4, 0),
		NivelPade			= IsNull(dbo.fnCodigoPotencial(o.id_recurso_vt, @Periodo-1), 0)

		,strLlave			= Convert(varchar(50), ''), 
		Llave				= Identity(int, 1,1)

into	#Paso

from	VT_Organigrama 						o,  
		VT_Recursos 						r,  
		VT_RecursoEmpresa 					re,  
		VT_Puesto 							p,  
		v_EmpleadosVerzatec 				ev,  
		Kiosco.dbo.CH_Nivel_Plaza_vzt 		np,  
		Kiosco.dbo.CH_Nivel_Recurso_vzt		nr  
where 	r.id_Recurso_vt 		=* o.id_Recurso_vt  
		and	re.empresa 			=* o.empresa  
		and	re.EmpresaFuente 	=* o.EmpresaFuente  
		and	re.id_Recurso_vt 	=* o.id_Recurso_vt  
		and	re.estatus 			not in (2, 4)  
		and	p.Empresa			=* o.Empresa  
		and	p.EmpresaFuente 	=* o.EmpresaFuente  
		and	p.id_nivel_puesto	=* o.id_nivel_puesto  
		and	o.estatus 			= 1  
		and	o.Publica 			= 1  
		and	ev.id_Recurso_vt 	=* o.id_Recurso_vt  
		and	ev.empresa 			=* o.empresa  
		and	ev.EmpresaFuente 	=* o.EmpresaFuente  
		and	np.Empresa 			=* o.Empresa  
		and	np.EmpresaFuente 	=* o.EmpresaFuente  
		and	np.Plaza 			=* o.Plaza  
		and	np.Periodo 			= @Periodo  
		and	nr.id_recurso_vt 	=* o.id_recurso_vt  
		and	nr.Periodo 			= @Periodo  
		and	o.Plaza 			= @Plaza  
		and	o.Empresa 			= @Empresa  
		and	o.EmpresaFuente 	= @EmpresaFuente  


insert	#Organigrama_Plano
select	id_recurso_vt, id, plaza, Empresa, EmpresaFuente, plaza_superior, Nombre_Completo, id_nivel_puesto,
		staff, Puesto, Hijos, empleado, nomina, urlFoto, Nivel_Plaza, Nivel_Recurso, IDSM1, IDSM2, IDSM3,
		IDSM4, SM1, SM2, SM3, SM4, NivelSM1, NivelSM2, NivelSM3, NivelSM4, NivelPade,
		strLlave+'.'+Right('0000'+Convert(varchar(50), Llave), 4)
from	#Paso

drop table #Paso



while exists(select 1 from #Organigrama_Plano where Hijos = 1)
begin


	declare cur_empleados cursor for
		select	Plaza, Empresa, EmpresaFuente, Llave
		from	#Organigrama_Plano
		where	Hijos = 1
		
	Open cur_empleados  	
	while 1 = 1
	begin  

		fetch	cur_empleados 
		into	@PlazaHijos,
				@EmpresaHijos,  
				@EmpresaFuenteHijos,
				@Llave
		
		if @@fetch_status = -1  
		  break
		
		
		-- insert into #Organigrama_Plano exec SPQ_CH_Organigrama_Hijos @PlazaHijos, @EmpresaHijos, @EmpresaFuenteHijos, @id_recurso_vt, @Periodo
		
		select 	id_Recurso_Vt = isnull(r.id_Recurso_Vt, 0),
				id = isnull(re.id, 0),
				o.plaza,
				o.Empresa,
				o.EmpresaFuente,
				o.plaza_superior,
				Nombre_Completo = r.Nombre+' '+r.Paterno+' '+r.Materno,
				o.id_nivel_puesto,
				o.staff,
				Puesto = p.Desc_esp,
				Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
						from 	VT_Organigrama 
						where 	plaza_superior = o.Plaza
						and	Empresa_Superior = o.Empresa
						and	EmpresaFuente_Superior = o.EmpresaFuente
						and	Estatus = 1
						and	Publica = 1),
				empleado = isnull(re.empleado, 0),
				nomina = isnull(re.nomina, 0),
	 			ev.urlFoto,
				Nivel_Plaza 	= IsNull(np.nivel, 0),
				Nivel_Recurso 	= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End,
				IDSM1 			= IsNull(np.IDSM1, 0),
				IDSM2 			= IsNull(np.IDSM2, 0),
				IDSM3 			= IsNull(np.IDSM3, 0),
				IDSM4 			= IsNull(np.IDSM4, 0),
				SM1 			= IsNull(np.SM1, ''),
				SM2 			= IsNull(np.SM2, ''),
				SM3 			= IsNull(np.SM3, ''),
				SM4 			= IsNull(np.SM4, ''),
				NivelSM1 		= IsNull(np.NivelSM1, 0),
				NivelSM2 		= IsNull(np.NivelSM2, 0),
				NivelSM3 		= IsNull(np.NivelSM3, 0),
				NivelSM4 		= IsNull(np.NivelSM4, 0),
				NivelPade		= IsNull(dbo.fnCodigoPotencial(r.id_Recurso_Vt, @Periodo-1), 0)
		into	#Hijos	
		from 	VT_Organigrama o,
				VT_Recursos r,
				VT_RecursoEmpresa re,
				VT_Puesto p,
	 			v_EmpleadosVerzatec ev,
				Kiosco.dbo.CH_Nivel_Plaza_vzt	np,
				Kiosco.dbo.CH_Nivel_Recurso_vzt	nr
		where	r.id_Recurso_vt		= o.id_Recurso_vt
		and		re.empresa			= o.empresa
		and		re.EmpresaFuente	= o.EmpresaFuente
		and		re.id_Recurso_vt	= o.id_Recurso_vt
		and		re.estatus			not in (2, 4)
		and		p.Empresa			=* o.Empresa
		and		p.EmpresaFuente		=* o.EmpresaFuente
		and		p.id_nivel_puesto	=* o.id_nivel_puesto
		and		o.estatus			= 1
		and		o.Publica			= 1
		and		ev.id_Recurso_vt	=* o.id_Recurso_vt
		and		ev.empresa			=* o.empresa
		and		ev.EmpresaFuente	=* o.EmpresaFuente
		and		np.Empresa			=* o.Empresa
		and		np.EmpresaFuente	=* o.EmpresaFuente
		and		np.Plaza			=* o.Plaza
		and		np.Periodo			= @Periodo
		and		nr.id_recurso_vt	=* o.id_recurso_vt
		and		not exists(	select 	1
							from 	kiosco.dbo.CH_Permisos
							where	id_recurso_vt	= @id_recurso_vt --Usuario Firmado
							and		Empresa			= o.Empresa
							and		EmpresaFuente	= o.EmpresaFuente
							and		Plaza			= o.Plaza
							and		IncExc			= 0
							)
		and		nr.Periodo			= @Periodo
		and		o.Plaza_Superior	= @PlazaHijos
		and		o.Empresa_Superior	= @EmpresaHijos
		and		o.EmpresaFuente_Superior = @EmpresaFuenteHijos
		Order by np.Fecha_Mod asc, nr.Fecha_Mod asc, p.Desc_esp


		--	CONSULTAR PLAZAS VACANTES
		insert into #Hijos
		select 	0,
				0,
				o.plaza,
				o.Empresa,
				o.EmpresaFuente,
				o.plaza_superior,
				'VACANTE',
				o.id_nivel_puesto,
				o.staff,
				Puesto = p.Desc_esp,
				Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
							from 	VT_Organigrama 
							where 	plaza_superior = o.Plaza
							and		Empresa_Superior = o.Empresa
							and		EmpresaFuente_Superior = o.EmpresaFuente
							and		Estatus = 1
							and		Publica = 1),
				0,
				0,
	 			'',
				Nivel_Plaza 	= IsNull(np.nivel, 0),
				Nivel_Recurso 	= 10,
				IDSM1 			= IsNull(np.IDSM1, 0),
				IDSM2 			= IsNull(np.IDSM2, 0),
				IDSM3 			= IsNull(np.IDSM3, 0),
				IDSM4 			= IsNull(np.IDSM4, 0),
				SM1 			= IsNull(np.SM1, ''),
				SM2 			= IsNull(np.SM2, ''),
				SM3 			= IsNull(np.SM3, ''),
				SM4 			= IsNull(np.SM4, ''),
				NivelSM1 		= IsNull(np.NivelSM1, 0),
				NivelSM2 		= IsNull(np.NivelSM2, 0),
				NivelSM3 		= IsNull(np.NivelSM3, 0),
				NivelSM4 		= IsNull(np.NivelSM4, 0),	
				NivelPade		= 0
		from 	VT_Organigrama o,
				VT_Puesto p,
				Kiosco.dbo.CH_Nivel_Plaza_vzt np
		where	p.Empresa			=* o.Empresa
		and		p.EmpresaFuente		=* o.EmpresaFuente
		and		p.id_nivel_puesto	=* o.id_nivel_puesto
		and		o.estatus			= 1
		and		o.Publica			= 1
		and		o.id_recurso_vt		= 0
		and		np.Empresa			=* o.Empresa
		and		np.EmpresaFuente	=* o.EmpresaFuente
		and		np.Plaza			=* o.Plaza
		and		np.Periodo			= @Periodo
		and		not exists(	select 	1
							from 	kiosco.dbo.CH_Permisos
							where	id_recurso_vt = @id_recurso_vt --Usuario Firmado
							and		Empresa = o.Empresa
							and		EmpresaFuente = o.EmpresaFuente
							and		Plaza = o.Plaza
							and		IncExc = 0
							)
		and		o.Plaza_Superior	= @PlazaHijos
		and		o.Empresa_Superior	= @EmpresaHijos
		and		o.EmpresaFuente_Superior = @EmpresaFuenteHijos
		Order by np.Fecha_Mod asc, p.Desc_esp



		--insert	#Organigrama_Plano
		select	distinct *, strLlave = @Llave, Llave=Identity(int,1,1)
		into	#paso2
		from 	#Hijos
		Order by Puesto 
	   
	   
		insert	#Organigrama_Plano
		select	id_recurso_vt, id, plaza, Empresa, EmpresaFuente, plaza_superior, Nombre_Completo, id_nivel_puesto,
				staff, Puesto, Hijos, empleado, nomina, urlFoto, Nivel_Plaza, Nivel_Recurso, IDSM1, IDSM2, IDSM3,
				IDSM4, SM1, SM2, SM3, SM4, NivelSM1, NivelSM2, NivelSM3, NivelSM4, NivelPade,
				strLlave+'.'+Right('0000'+Convert(varchar(50), Llave), 4)
		from	#Paso2
	   
		update #Organigrama_Plano set Hijos = 0 where Plaza = @PlazaHijos
	   
		drop table #Hijos
		drop table #Paso2

	end
	close cur_empleados
	deallocate cur_empleados
	
	
end

if @SoloBlackBelt = 1
	delete	#Organigrama_Plano 
	where	id_recurso_vt not in(select id_recurso_vt from #Organigrama_Plano where Puesto like '%black belt%')
			or id_recurso_vt = 0

			
			
set nocount off 

if @Area > 0
begin

	select	op.id_recurso_vt,
			op.id,
			op.plaza,
			op.Empresa,
			op.EmpresaFuente,
			op.plaza_superior,
			'(' + n.descripcion + ') ' + op.Nombre_Completo as Nombre_Completo,
			op.id_nivel_puesto,
			op.staff,
			op.Puesto,
			op.Hijos,
			op.empleado,
			op.nomina,
			op.urlFoto,
			op.Nivel_Plaza,
			op.Nivel_Recurso,
			op.IDSM1,
			op.IDSM2,
			op.IDSM3,
			op.IDSM4,
			op.SM1,
			op.SM2,
			op.SM3,
			op.SM4,
			op.NivelSM1,
			op.NivelSM2,
			op.NivelSM3,
			op.NivelSM4,
			op.NivelPade,
			op.Llave
	from	#Organigrama_Plano op,
			Kiosco.dbo.CH_NivelesCapHum n
	where	op.nivel_recurso = n.Nivel
			and n.Tipo = 2
			and (@Nivel_Plaza = -1 or Nivel_Plaza = @Nivel_Plaza)
			and	( (power(2, Nivel_Recurso - 1) & @Codigo > 0 ) or @Codigo = -1)
			and op.id_recurso_vt in(select id_recurso_vt from v_EmpleadosVerzatec where idArea = @Area)
	order by Llave

end
else
begin

	select	op.id_recurso_vt,
			op.id,
			op.plaza,
			op.Empresa,
			op.EmpresaFuente,
			op.plaza_superior,
			'(' + n.descripcion + ') ' + op.Nombre_Completo as Nombre_Completo,
			op.id_nivel_puesto,
			op.staff,
			op.Puesto,
			op.Hijos,
			op.empleado,
			op.nomina,
			op.urlFoto,
			op.Nivel_Plaza,
			op.Nivel_Recurso,
			op.IDSM1,
			op.IDSM2,
			op.IDSM3,
			op.IDSM4,
			op.SM1,
			op.SM2,
			op.SM3,
			op.SM4,
			op.NivelSM1,
			op.NivelSM2,
			op.NivelSM3,
			op.NivelSM4,
			op.NivelPade,
			op.Llave
	from	#Organigrama_Plano op,
			Kiosco.dbo.CH_NivelesCapHum n
	where	op.nivel_recurso = n.Nivel
			and n.Tipo = 2
			and (@Nivel_Plaza = -1 or Nivel_Plaza = @Nivel_Plaza)
			and	( (power(2, Nivel_Recurso - 1) & @Codigo > 0 ) or @Codigo = -1)
	order by Llave
	
end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Organigrama_Plano_FiltroEntidad]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--exec SPQ_CH_Organigrama_Plano_FiltroEntidad 16231,5000,2,6939,2011, 0, 0, -1, 0,3030 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- grant exec on SPQ_CH_Organigrama_Plano to pinuser  
CREATE proc [dbo].[SPQ_CH_Organigrama_Plano_FiltroEntidad]
	@Plaza			int,  
	@Empresa		int,  
	@EmpresaFuente	int,  
	@id_recurso_vt	int,  
	@Periodo		int,
	@Nivel_Plaza	int = -1,
	@SoloBlackBelt	bit,
	@Codigo			int,
	@Area			int = -1,
	@Entidad			int = 0
as


set nocount on


If @Codigo < 1   
	Set @Codigo = -1

if @Nivel_Plaza = 0
	select @Nivel_Plaza = -1

declare @PlazaHijos			int,  
		@EmpresaHijos		int,  
		@EmpresaFuenteHijos	int,
		@Llave				varchar(50)


create table #Organigrama_Plano(
		id_recurso_vt		int,
		id					int,
		plaza				int,
		Empresa				int,
		EmpresaFuente		int,
		plaza_superior		int,
		Nombre_Completo		varchar(300),
		id_nivel_puesto		int,
		staff				int,
		Puesto				varchar(300),
		Hijos				bit,
		empleado			int,
		nomina				int,
		urlFoto				varchar(132),
		Nivel_Plaza			int,
		Nivel_Recurso		int,
		IDSM1				int,
		IDSM2				int,
		IDSM3				int,
		IDSM4				int,
		SM1					varchar(100),
		SM2					varchar(100),
		SM3					varchar(100),
		SM4					varchar(100),
		NivelSM1			int,
		NivelSM2			int,
		NivelSM3			int,
		NivelSM4			int,
		NivelPade			int,
		Llave				varchar(50) not null)

if (@Plaza = 0 and @Empresa = 0 and @EmpresaFuente = 0)  
	Select  @Plaza 			= Plaza,  
			@Empresa 		= Empresa,  
			@EmpresaFuente 	= EmpresaFuente  
	from 	vt_Organigrama  
	Where 	id_recurso_vt 	= @id_recurso_vt  
	and  	Estatus 		= 1  


select  id_recurso_vt		= isnull(o.id_recurso_vt, 0),  
		id 					= isnull(re.id, 0),  
		o.plaza,  
		o.Empresa,  
		o.EmpresaFuente,  
		o.plaza_superior,  
		Nombre_Completo		= isnull(r.Nombre + ' ' + r.Paterno + ' ' + r.Materno, 'VACANTE'),  
		o.id_nivel_puesto,  
		o.staff,  
		Puesto				= p.Desc_esp,  
		Hijos 				= ( select	case when count(*) > 0 then 1 else 0 end   
								from  	VT_Organigrama   
								where  	plaza_superior 		= o.Plaza  
										and  	Empresa_Superior 	= o.Empresa  
										and  	EmpresaFuente_Superior 	= o.EmpresaFuente  
										and  	Estatus 		= 1  
										and  	Publica 		= 1),  
		re.empleado,  
		re.nomina,  
		ev.urlFoto,  
		Nivel_Plaza  		= IsNull(np.nivel, 0),  
		Nivel_Recurso  		= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End,  
		IDSM1				= IsNull(np.IDSM1, 0),  
		IDSM2				= IsNull(np.IDSM2, 0),  
		IDSM3				= IsNull(np.IDSM3, 0),  
		IDSM4				= IsNull(np.IDSM4, 0),  
		SM1					= IsNull(np.SM1, ''),  
		SM2					= IsNull(np.SM2, ''),  
		SM3					= IsNull(np.SM3, ''),  
		SM4					= IsNull(np.SM4, ''),  
		NivelSM1			= IsNull(np.NivelSM1, 0),  
		NivelSM2			= IsNull(np.NivelSM2, 0),  
		NivelSM3			= IsNull(np.NivelSM3, 0),  
		NivelSM4			= IsNull(np.NivelSM4, 0),
		NivelPade			= IsNull(dbo.fnCodigoPotencial(o.id_recurso_vt, @Periodo-1), 0)

		,strLlave			= Convert(varchar(50), ''), 
		Llave				= Identity(int, 1,1)

into	#Paso

from	VT_Organigrama 						o,  
		VT_Recursos 						r,  
		VT_RecursoEmpresa 					re,  
		VT_Puesto 							p,  
		v_EmpleadosVerzatec 				ev,  
		Kiosco.dbo.CH_Nivel_Plaza_vzt 		np,  
		Kiosco.dbo.CH_Nivel_Recurso_vzt		nr  
where 	r.id_Recurso_vt 		=* o.id_Recurso_vt  
		and	re.empresa 			=* o.empresa  
		and	re.EmpresaFuente 	=* o.EmpresaFuente  
		and	re.id_Recurso_vt 	=* o.id_Recurso_vt  
		and	re.estatus 			not in (2, 4)  
		and	p.Empresa			=* o.Empresa  
		and	p.EmpresaFuente 	=* o.EmpresaFuente  
		and	p.id_nivel_puesto	=* o.id_nivel_puesto  
		and	o.estatus 			= 1  
		and	o.Publica 			= 1  
		and	ev.id_Recurso_vt 	=* o.id_Recurso_vt  
		and	ev.empresa 			=* o.empresa  
		and	ev.EmpresaFuente 	=* o.EmpresaFuente  
		and	np.Empresa 			=* o.Empresa  
		and	np.EmpresaFuente 	=* o.EmpresaFuente  
		and	np.Plaza 			=* o.Plaza  
		and	np.Periodo 			= @Periodo  
		and	nr.id_recurso_vt 	=* o.id_recurso_vt  
		and	nr.Periodo 			= @Periodo  
		and	o.Plaza 			= @Plaza  
		and	o.Empresa 			= @Empresa  
		and	o.EmpresaFuente 	= @EmpresaFuente  
		----CACM: Filtro Entidad-----
		and ev.Entidad = case @Entidad when 0 then ev.Entidad else @Entidad end


insert	#Organigrama_Plano
select	id_recurso_vt, id, plaza, Empresa, EmpresaFuente, plaza_superior, Nombre_Completo, id_nivel_puesto,
		staff, Puesto, Hijos, empleado, nomina, urlFoto, Nivel_Plaza, Nivel_Recurso, IDSM1, IDSM2, IDSM3,
		IDSM4, SM1, SM2, SM3, SM4, NivelSM1, NivelSM2, NivelSM3, NivelSM4, NivelPade,
		strLlave+'.'+Right('0000'+Convert(varchar(50), Llave), 4)
from	#Paso

drop table #Paso



while exists(select 1 from #Organigrama_Plano where Hijos = 1)
begin


	declare cur_empleados cursor for
		select	Plaza, Empresa, EmpresaFuente, Llave
		from	#Organigrama_Plano
		where	Hijos = 1
		
	Open cur_empleados  	
	while 1 = 1
	begin  

		fetch	cur_empleados 
		into	@PlazaHijos,
				@EmpresaHijos,  
				@EmpresaFuenteHijos,
				@Llave
		
		if @@fetch_status = -1  
		  break
		
		
		-- insert into #Organigrama_Plano exec SPQ_CH_Organigrama_Hijos @PlazaHijos, @EmpresaHijos, @EmpresaFuenteHijos, @id_recurso_vt, @Periodo
		
		select 	id_Recurso_Vt = isnull(r.id_Recurso_Vt, 0),
				id = isnull(re.id, 0),
				o.plaza,
				o.Empresa,
				o.EmpresaFuente,
				o.plaza_superior,
				Nombre_Completo = r.Nombre+' '+r.Paterno+' '+r.Materno,
				o.id_nivel_puesto,
				o.staff,
				Puesto = p.Desc_esp,
				Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
						from 	VT_Organigrama 
						where 	plaza_superior = o.Plaza
						and	Empresa_Superior = o.Empresa
						and	EmpresaFuente_Superior = o.EmpresaFuente
						and	Estatus = 1
						and	Publica = 1),
				empleado = isnull(re.empleado, 0),
				nomina = isnull(re.nomina, 0),
	 			ev.urlFoto,
				Nivel_Plaza 	= IsNull(np.nivel, 0),
				Nivel_Recurso 	= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End,
				IDSM1 			= IsNull(np.IDSM1, 0),
				IDSM2 			= IsNull(np.IDSM2, 0),
				IDSM3 			= IsNull(np.IDSM3, 0),
				IDSM4 			= IsNull(np.IDSM4, 0),
				SM1 			= IsNull(np.SM1, ''),
				SM2 			= IsNull(np.SM2, ''),
				SM3 			= IsNull(np.SM3, ''),
				SM4 			= IsNull(np.SM4, ''),
				NivelSM1 		= IsNull(np.NivelSM1, 0),
				NivelSM2 		= IsNull(np.NivelSM2, 0),
				NivelSM3 		= IsNull(np.NivelSM3, 0),
				NivelSM4 		= IsNull(np.NivelSM4, 0),
				NivelPade		= IsNull(dbo.fnCodigoPotencial(r.id_Recurso_Vt, @Periodo-1), 0)
		into	#Hijos	
		from 	VT_Organigrama o,
				VT_Recursos r,
				VT_RecursoEmpresa re,
				VT_Puesto p,
	 			v_EmpleadosVerzatec ev,
				Kiosco.dbo.CH_Nivel_Plaza_vzt	np,
				Kiosco.dbo.CH_Nivel_Recurso_vzt	nr
		where	r.id_Recurso_vt		= o.id_Recurso_vt
		and		re.empresa			= o.empresa
		and		re.EmpresaFuente	= o.EmpresaFuente
		and		re.id_Recurso_vt	= o.id_Recurso_vt
		and		re.estatus			not in (2, 4)
		and		p.Empresa			=* o.Empresa
		and		p.EmpresaFuente		=* o.EmpresaFuente
		and		p.id_nivel_puesto	=* o.id_nivel_puesto
		and		o.estatus			= 1
		and		o.Publica			= 1
		and		ev.id_Recurso_vt	=* o.id_Recurso_vt
		and		ev.empresa			=* o.empresa
		and		ev.EmpresaFuente	=* o.EmpresaFuente
		and		np.Empresa			=* o.Empresa
		and		np.EmpresaFuente	=* o.EmpresaFuente
		and		np.Plaza			=* o.Plaza
		and		np.Periodo			= @Periodo
		and		nr.id_recurso_vt	=* o.id_recurso_vt
		and		not exists(	select 	1
							from 	kiosco.dbo.CH_Permisos
							where	id_recurso_vt	= @id_recurso_vt --Usuario Firmado
							and		Empresa			= o.Empresa
							and		EmpresaFuente	= o.EmpresaFuente
							and		Plaza			= o.Plaza
							and		IncExc			= 0
							)
		and		nr.Periodo			= @Periodo
		and		o.Plaza_Superior	= @PlazaHijos
		and		o.Empresa_Superior	= @EmpresaHijos
		and		o.EmpresaFuente_Superior = @EmpresaFuenteHijos
		Order by np.Fecha_Mod asc, nr.Fecha_Mod asc, p.Desc_esp


		--	CONSULTAR PLAZAS VACANTES
		insert into #Hijos
		select 	0,
				0,
				o.plaza,
				o.Empresa,
				o.EmpresaFuente,
				o.plaza_superior,
				'VACANTE',
				o.id_nivel_puesto,
				o.staff,
				Puesto = p.Desc_esp,
				Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
							from 	VT_Organigrama 
							where 	plaza_superior = o.Plaza
							and		Empresa_Superior = o.Empresa
							and		EmpresaFuente_Superior = o.EmpresaFuente
							and		Estatus = 1
							and		Publica = 1),
				0,
				0,
	 			'',
				Nivel_Plaza 	= IsNull(np.nivel, 0),
				Nivel_Recurso 	= 10,
				IDSM1 			= IsNull(np.IDSM1, 0),
				IDSM2 			= IsNull(np.IDSM2, 0),
				IDSM3 			= IsNull(np.IDSM3, 0),
				IDSM4 			= IsNull(np.IDSM4, 0),
				SM1 			= IsNull(np.SM1, ''),
				SM2 			= IsNull(np.SM2, ''),
				SM3 			= IsNull(np.SM3, ''),
				SM4 			= IsNull(np.SM4, ''),
				NivelSM1 		= IsNull(np.NivelSM1, 0),
				NivelSM2 		= IsNull(np.NivelSM2, 0),
				NivelSM3 		= IsNull(np.NivelSM3, 0),
				NivelSM4 		= IsNull(np.NivelSM4, 0),	
				NivelPade		= 0
		from 	VT_Organigrama o,
				VT_Puesto p,
				Kiosco.dbo.CH_Nivel_Plaza_vzt np
		where	p.Empresa			=* o.Empresa
		and		p.EmpresaFuente		=* o.EmpresaFuente
		and		p.id_nivel_puesto	=* o.id_nivel_puesto
		and		o.estatus			= 1
		and		o.Publica			= 1
		and		o.id_recurso_vt		= 0
		and		np.Empresa			=* o.Empresa
		and		np.EmpresaFuente	=* o.EmpresaFuente
		and		np.Plaza			=* o.Plaza
		and		np.Periodo			= @Periodo
		and		not exists(	select 	1
							from 	kiosco.dbo.CH_Permisos
							where	id_recurso_vt = @id_recurso_vt --Usuario Firmado
							and		Empresa = o.Empresa
							and		EmpresaFuente = o.EmpresaFuente
							and		Plaza = o.Plaza
							and		IncExc = 0
							)
		and		o.Plaza_Superior	= @PlazaHijos
		and		o.Empresa_Superior	= @EmpresaHijos
		and		o.EmpresaFuente_Superior = @EmpresaFuenteHijos
		Order by np.Fecha_Mod asc, p.Desc_esp



		--insert	#Organigrama_Plano
		select	distinct *, strLlave = @Llave, Llave=Identity(int,1,1)
		into	#paso2
		from 	#Hijos
		Order by Puesto 
	   
	   
		insert	#Organigrama_Plano
		select	id_recurso_vt, id, plaza, Empresa, EmpresaFuente, plaza_superior, Nombre_Completo, id_nivel_puesto,
				staff, Puesto, Hijos, empleado, nomina, urlFoto, Nivel_Plaza, Nivel_Recurso, IDSM1, IDSM2, IDSM3,
				IDSM4, SM1, SM2, SM3, SM4, NivelSM1, NivelSM2, NivelSM3, NivelSM4, NivelPade,
				strLlave+'.'+Right('0000'+Convert(varchar(50), Llave), 4)
		from	#Paso2
	   
		update #Organigrama_Plano set Hijos = 0 where Plaza = @PlazaHijos
	   
		drop table #Hijos
		drop table #Paso2

	end
	close cur_empleados
	deallocate cur_empleados
	
	
end

if @SoloBlackBelt = 1
	delete	#Organigrama_Plano 
	where	id_recurso_vt not in(select id_recurso_vt from #Organigrama_Plano where Puesto like '%black belt%')
			or id_recurso_vt = 0

			
			
set nocount off 

if @Area > 0
begin

	select	op.id_recurso_vt,
			op.id,
			op.plaza,
			op.Empresa,
			op.EmpresaFuente,
			op.plaza_superior,
			'(' + n.descripcion + ') ' + op.Nombre_Completo as Nombre_Completo,
			op.id_nivel_puesto,
			op.staff,
			op.Puesto,
			op.Hijos,
			op.empleado,
			op.nomina,
			op.urlFoto,
			op.Nivel_Plaza,
			op.Nivel_Recurso,
			op.IDSM1,
			op.IDSM2,
			op.IDSM3,
			op.IDSM4,
			op.SM1,
			op.SM2,
			op.SM3,
			op.SM4,
			op.NivelSM1,
			op.NivelSM2,
			op.NivelSM3,
			op.NivelSM4,
			op.NivelPade,
			op.Llave
	from	#Organigrama_Plano op,
			Kiosco.dbo.CH_NivelesCapHum n
	where	op.nivel_recurso = n.Nivel
			and n.Tipo = 2
			and (@Nivel_Plaza = -1 or Nivel_Plaza = @Nivel_Plaza)
			and	( (power(2, Nivel_Recurso - 1) & @Codigo > 0 ) or @Codigo = -1)
			and op.id_recurso_vt in(select id_recurso_vt from v_EmpleadosVerzatec where idArea = @Area)
			--CACM--
			and op.id_recurso_vt in(select id_recurso_vt from v_EmpleadosVerzatec 
			where Entidad = case @Entidad when 0 then Entidad else @Entidad end)
			---------
	order by Llave

end
else
begin

	select	op.id_recurso_vt,
			op.id,
			op.plaza,
			op.Empresa,
			op.EmpresaFuente,
			op.plaza_superior,
			'(' + n.descripcion + ') ' + op.Nombre_Completo as Nombre_Completo,
			op.id_nivel_puesto,
			op.staff,
			op.Puesto,
			op.Hijos,
			op.empleado,
			op.nomina,
			op.urlFoto,
			op.Nivel_Plaza,
			op.Nivel_Recurso,
			op.IDSM1,
			op.IDSM2,
			op.IDSM3,
			op.IDSM4,
			op.SM1,
			op.SM2,
			op.SM3,
			op.SM4,
			op.NivelSM1,
			op.NivelSM2,
			op.NivelSM3,
			op.NivelSM4,
			op.NivelPade,
			op.Llave
	from	#Organigrama_Plano op,
			Kiosco.dbo.CH_NivelesCapHum n
	where	op.nivel_recurso = n.Nivel
			and n.Tipo = 2
			and (@Nivel_Plaza = -1 or Nivel_Plaza = @Nivel_Plaza)
			and	( (power(2, Nivel_Recurso - 1) & @Codigo > 0 ) or @Codigo = -1)
				--CACM--
			and op.id_recurso_vt in(select id_recurso_vt from v_EmpleadosVerzatec 
			where Entidad = case @Entidad when 0 then Entidad else @Entidad end)
			---------
	order by Llave
	
end



GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Organigrama_Plano_FiltroEntidad_Query]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SPQ_CH_Organigrama_Plano_FiltroEntidad_Query 16231,5000,2,6939,2012, 0, 0, -1, 0,0 
CREATE proc [dbo].[SPQ_CH_Organigrama_Plano_FiltroEntidad_Query]
	@Plaza			int,  
	@Empresa		int,  
	@EmpresaFuente	int,  
	@id_recurso_vt	int,  
	@Periodo		int,
	@Nivel_Plaza	int = -1,
	@SoloBlackBelt	bit,
	@Codigo			int,
	@Area			int = -1,
	@Entidad			int = 0
as


set nocount on


If @Codigo < 1   
	Set @Codigo = -1

if @Nivel_Plaza = 0
	select @Nivel_Plaza = -1

declare @PlazaHijos			int,  
		@EmpresaHijos		int,  
		@EmpresaFuenteHijos	int,
		@Llave				varchar(50)


create table #Organigrama_Plano(
		id_recurso_vt		int,
		id					int,
		plaza				int,
		Empresa				int,
		EmpresaFuente		int,
		plaza_superior		int,
		Nombre_Completo		varchar(300),
		id_nivel_puesto		int,
		staff				int,
		Puesto				varchar(300),
		Hijos				bit,
		empleado			int,
		nomina				int,
		urlFoto				varchar(132),
		Nivel_Plaza			int,
		Nivel_Recurso		int,
		IDSM1				int,
		IDSM2				int,
		IDSM3				int,
		IDSM4				int,
		SM1					varchar(100),
		SM2					varchar(100),
		SM3					varchar(100),
		SM4					varchar(100),
		NivelSM1			int,
		NivelSM2			int,
		NivelSM3			int,
		NivelSM4			int,
		NivelPade			int,
		Llave				varchar(50) not null)

if (@Plaza = 0 and @Empresa = 0 and @EmpresaFuente = 0)  
	Select  @Plaza 			= Plaza,  
			@Empresa 		= Empresa,  
			@EmpresaFuente 	= EmpresaFuente  
	from 	vt_Organigrama  
	Where 	id_recurso_vt 	= @id_recurso_vt  
	and  	Estatus 		= 1  


select  id_recurso_vt		= isnull(o.id_recurso_vt, 0),  
		id 					= isnull(re.id, 0),  
		o.plaza,  
		o.Empresa,  
		o.EmpresaFuente,  
		o.plaza_superior,  
		Nombre_Completo		= isnull(r.Nombre + ' ' + r.Paterno + ' ' + r.Materno, 'VACANTE'),  
		o.id_nivel_puesto,  
		o.staff,  
		Puesto				= p.Desc_esp,  
		Hijos 				= ( select	case when count(*) > 0 then 1 else 0 end   
								from  	VT_Organigrama   
								where  	plaza_superior 		= o.Plaza  
										and  	Empresa_Superior 	= o.Empresa  
										and  	EmpresaFuente_Superior 	= o.EmpresaFuente  
										and  	Estatus 		= 1  
										and  	Publica 		= 1),  
		re.empleado,  
		re.nomina,  
		ev.urlFoto,  
		Nivel_Plaza  		= IsNull(np.nivel, 0),  
		Nivel_Recurso  		= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End,  
		IDSM1				= IsNull(np.IDSM1, 0),  
		IDSM2				= IsNull(np.IDSM2, 0),  
		IDSM3				= IsNull(np.IDSM3, 0),  
		IDSM4				= IsNull(np.IDSM4, 0),  
		SM1					= IsNull(np.SM1, ''),  
		SM2					= IsNull(np.SM2, ''),  
		SM3					= IsNull(np.SM3, ''),  
		SM4					= IsNull(np.SM4, ''),  
		NivelSM1			= IsNull(np.NivelSM1, 0),  
		NivelSM2			= IsNull(np.NivelSM2, 0),  
		NivelSM3			= IsNull(np.NivelSM3, 0),  
		NivelSM4			= IsNull(np.NivelSM4, 0),
		NivelPade			= IsNull(dbo.fnCodigoPotencial(o.id_recurso_vt, @Periodo-1), 0)

		,strLlave			= Convert(varchar(50), ''), 
		Llave				= Identity(int, 1,1)

into	#Paso

from	VT_Organigrama 						o,  
		VT_Recursos 						r,  
		VT_RecursoEmpresa 					re,  
		VT_Puesto 							p,  
		v_EmpleadosVerzatec 				ev,  
		Kiosco.dbo.CH_Nivel_Plaza_vzt 		np,  
		Kiosco.dbo.CH_Nivel_Recurso_vzt		nr  
where 	r.id_Recurso_vt 		=* o.id_Recurso_vt  
		and	re.empresa 			=* o.empresa  
		and	re.EmpresaFuente 	=* o.EmpresaFuente  
		and	re.id_Recurso_vt 	=* o.id_Recurso_vt  
		and	re.estatus 			not in (2, 4)  
		and	p.Empresa			=* o.Empresa  
		and	p.EmpresaFuente 	=* o.EmpresaFuente  
		and	p.id_nivel_puesto	=* o.id_nivel_puesto  
		and	o.estatus 			= 1  
		and	o.Publica 			= 1  
		and	ev.id_Recurso_vt 	=* o.id_Recurso_vt  
		and	ev.empresa 			=* o.empresa  
		and	ev.EmpresaFuente 	=* o.EmpresaFuente  
		and	np.Empresa 			=* o.Empresa  
		and	np.EmpresaFuente 	=* o.EmpresaFuente  
		and	np.Plaza 			=* o.Plaza  
		and	np.Periodo 			= @Periodo  
		and	nr.id_recurso_vt 	=* o.id_recurso_vt  
		and	nr.Periodo 			= @Periodo  
		and	o.Plaza 			= @Plaza  
		and	o.Empresa 			= @Empresa  
		and	o.EmpresaFuente 	= @EmpresaFuente  
		----CACM: Filtro Entidad-----
		and ev.Entidad = case @Entidad when 0 then ev.Entidad else @Entidad end


insert	#Organigrama_Plano
select	id_recurso_vt, id, plaza, Empresa, EmpresaFuente, plaza_superior, Nombre_Completo, id_nivel_puesto,
		staff, Puesto, Hijos, empleado, nomina, urlFoto, Nivel_Plaza, Nivel_Recurso, IDSM1, IDSM2, IDSM3,
		IDSM4, SM1, SM2, SM3, SM4, NivelSM1, NivelSM2, NivelSM3, NivelSM4, NivelPade,
		strLlave+'.'+Right('0000'+Convert(varchar(50), Llave), 4)
from	#Paso

drop table #Paso



while exists(select 1 from #Organigrama_Plano where Hijos = 1)
begin


	declare cur_empleados cursor for
		select	Plaza, Empresa, EmpresaFuente, Llave
		from	#Organigrama_Plano
		where	Hijos = 1
		
	Open cur_empleados  	
	while 1 = 1
	begin  

		fetch	cur_empleados 
		into	@PlazaHijos,
				@EmpresaHijos,  
				@EmpresaFuenteHijos,
				@Llave
		
		if @@fetch_status = -1  
		  break
		
		
		-- insert into #Organigrama_Plano exec SPQ_CH_Organigrama_Hijos @PlazaHijos, @EmpresaHijos, @EmpresaFuenteHijos, @id_recurso_vt, @Periodo
		
		select 	id_Recurso_Vt = isnull(r.id_Recurso_Vt, 0),
				id = isnull(re.id, 0),
				o.plaza,
				o.Empresa,
				o.EmpresaFuente,
				o.plaza_superior,
				Nombre_Completo = r.Nombre+' '+r.Paterno+' '+r.Materno,
				o.id_nivel_puesto,
				o.staff,
				Puesto = p.Desc_esp,
				Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
						from 	VT_Organigrama 
						where 	plaza_superior = o.Plaza
						and	Empresa_Superior = o.Empresa
						and	EmpresaFuente_Superior = o.EmpresaFuente
						and	Estatus = 1
						and	Publica = 1),
				empleado = isnull(re.empleado, 0),
				nomina = isnull(re.nomina, 0),
	 			ev.urlFoto,
				Nivel_Plaza 	= IsNull(np.nivel, 0),
				Nivel_Recurso 	= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End,
				IDSM1 			= IsNull(np.IDSM1, 0),
				IDSM2 			= IsNull(np.IDSM2, 0),
				IDSM3 			= IsNull(np.IDSM3, 0),
				IDSM4 			= IsNull(np.IDSM4, 0),
				SM1 			= IsNull(np.SM1, ''),
				SM2 			= IsNull(np.SM2, ''),
				SM3 			= IsNull(np.SM3, ''),
				SM4 			= IsNull(np.SM4, ''),
				NivelSM1 		= IsNull(np.NivelSM1, 0),
				NivelSM2 		= IsNull(np.NivelSM2, 0),
				NivelSM3 		= IsNull(np.NivelSM3, 0),
				NivelSM4 		= IsNull(np.NivelSM4, 0),
				NivelPade		= IsNull(dbo.fnCodigoPotencial(r.id_Recurso_Vt, @Periodo-1), 0)
		into	#Hijos	
		from 	VT_Organigrama o,
				VT_Recursos r,
				VT_RecursoEmpresa re,
				VT_Puesto p,
	 			v_EmpleadosVerzatec ev,
				Kiosco.dbo.CH_Nivel_Plaza_vzt	np,
				Kiosco.dbo.CH_Nivel_Recurso_vzt	nr
		where	r.id_Recurso_vt		= o.id_Recurso_vt
		and		re.empresa			= o.empresa
		and		re.EmpresaFuente	= o.EmpresaFuente
		and		re.id_Recurso_vt	= o.id_Recurso_vt
		and		re.estatus			not in (2, 4)
		and		p.Empresa			=* o.Empresa
		and		p.EmpresaFuente		=* o.EmpresaFuente
		and		p.id_nivel_puesto	=* o.id_nivel_puesto
		and		o.estatus			= 1
		and		o.Publica			= 1
		and		ev.id_Recurso_vt	=* o.id_Recurso_vt
		and		ev.empresa			=* o.empresa
		and		ev.EmpresaFuente	=* o.EmpresaFuente
		and		np.Empresa			=* o.Empresa
		and		np.EmpresaFuente	=* o.EmpresaFuente
		and		np.Plaza			=* o.Plaza
		and		np.Periodo			= @Periodo
		and		nr.id_recurso_vt	=* o.id_recurso_vt
		and		not exists(	select 	1
							from 	kiosco.dbo.CH_Permisos
							where	id_recurso_vt	= @id_recurso_vt --Usuario Firmado
							and		Empresa			= o.Empresa
							and		EmpresaFuente	= o.EmpresaFuente
							and		Plaza			= o.Plaza
							and		IncExc			= 0
							)
		and		nr.Periodo			= @Periodo
		and		o.Plaza_Superior	= @PlazaHijos
		and		o.Empresa_Superior	= @EmpresaHijos
		and		o.EmpresaFuente_Superior = @EmpresaFuenteHijos
		Order by np.Fecha_Mod asc, nr.Fecha_Mod asc, p.Desc_esp


		--	CONSULTAR PLAZAS VACANTES
		insert into #Hijos
		select 	0,
				0,
				o.plaza,
				o.Empresa,
				o.EmpresaFuente,
				o.plaza_superior,
				'VACANTE',
				o.id_nivel_puesto,
				o.staff,
				Puesto = p.Desc_esp,
				Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
							from 	VT_Organigrama 
							where 	plaza_superior = o.Plaza
							and		Empresa_Superior = o.Empresa
							and		EmpresaFuente_Superior = o.EmpresaFuente
							and		Estatus = 1
							and		Publica = 1),
				0,
				0,
	 			'',
				Nivel_Plaza 	= IsNull(np.nivel, 0),
				Nivel_Recurso 	= 10,
				IDSM1 			= IsNull(np.IDSM1, 0),
				IDSM2 			= IsNull(np.IDSM2, 0),
				IDSM3 			= IsNull(np.IDSM3, 0),
				IDSM4 			= IsNull(np.IDSM4, 0),
				SM1 			= IsNull(np.SM1, ''),
				SM2 			= IsNull(np.SM2, ''),
				SM3 			= IsNull(np.SM3, ''),
				SM4 			= IsNull(np.SM4, ''),
				NivelSM1 		= IsNull(np.NivelSM1, 0),
				NivelSM2 		= IsNull(np.NivelSM2, 0),
				NivelSM3 		= IsNull(np.NivelSM3, 0),
				NivelSM4 		= IsNull(np.NivelSM4, 0),	
				NivelPade		= 0
		from 	VT_Organigrama o,
				VT_Puesto p,
				Kiosco.dbo.CH_Nivel_Plaza_vzt np
		where	p.Empresa			=* o.Empresa
		and		p.EmpresaFuente		=* o.EmpresaFuente
		and		p.id_nivel_puesto	=* o.id_nivel_puesto
		and		o.estatus			= 1
		and		o.Publica			= 1
		and		o.id_recurso_vt		= 0
		and		np.Empresa			=* o.Empresa
		and		np.EmpresaFuente	=* o.EmpresaFuente
		and		np.Plaza			=* o.Plaza
		and		np.Periodo			= @Periodo
		and		not exists(	select 	1
							from 	kiosco.dbo.CH_Permisos
							where	id_recurso_vt = @id_recurso_vt --Usuario Firmado
							and		Empresa = o.Empresa
							and		EmpresaFuente = o.EmpresaFuente
							and		Plaza = o.Plaza
							and		IncExc = 0
							)
		and		o.Plaza_Superior	= @PlazaHijos
		and		o.Empresa_Superior	= @EmpresaHijos
		and		o.EmpresaFuente_Superior = @EmpresaFuenteHijos
		Order by np.Fecha_Mod asc, p.Desc_esp



		--insert	#Organigrama_Plano
		select	distinct *, strLlave = @Llave, Llave=Identity(int,1,1)
		into	#paso2
		from 	#Hijos
		Order by Puesto 
	   
	   
		insert	#Organigrama_Plano
		select	id_recurso_vt, id, plaza, Empresa, EmpresaFuente, plaza_superior, Nombre_Completo, id_nivel_puesto,
				staff, Puesto, Hijos, empleado, nomina, urlFoto, Nivel_Plaza, Nivel_Recurso, IDSM1, IDSM2, IDSM3,
				IDSM4, SM1, SM2, SM3, SM4, NivelSM1, NivelSM2, NivelSM3, NivelSM4, NivelPade,
				strLlave+'.'+Right('0000'+Convert(varchar(50), Llave), 4)
		from	#Paso2
	   
		update #Organigrama_Plano set Hijos = 0 where Plaza = @PlazaHijos
	   
		drop table #Hijos
		drop table #Paso2

	end
	close cur_empleados
	deallocate cur_empleados
	
	
end

if @SoloBlackBelt = 1
	delete	#Organigrama_Plano 
	where	id_recurso_vt not in(select id_recurso_vt from #Organigrama_Plano where Puesto like '%black belt%')
			or id_recurso_vt = 0

			
			
set nocount off 

select @Area

if @Area = 0
begin

	select	Entidad=(select CASE Entidad 
		WHEN 1000 THEN '1000 – Staff Aluminio' 
		WHEN 1100 THEN '1100 - Perfiles Mty' 
		WHEN 1110 THEN '1110 - Perfiles Mex' 
		WHEN 1200 THEN '1200 - Escaleras'
		WHEN 1301 THEN '1301 – Ventanas' 
		WHEN 1400 THEN '1400 – Perfiles Guadalajara ' 
		WHEN 1500 THEN '1500 – Perfiles Comercial ' 
		WHEN 2041 THEN '2041 - Tiendas Cuprum'
		WHEN 2050 THEN '2050 - Metales Díaz' 
		WHEN 3030 THEN '3030 - Bayer' 
		WHEN 3050 THEN '3050 – Stabilit Villa de García' 
		WHEN 3051 THEN '3051 - Tlanepantla' 
		WHEN 3052 THEN '3052 - Guadalajara' 
		WHEN 3053 THEN '3053 - Villahermosa' 
		WHEN 3054 THEN '3054 - Tultitlan' 
		WHEN 3055 THEN '3055 - Mexicali' 
		WHEN 3056 THEN '3056 - Stabilit America'
		WHEN 3070 THEN '3070 – Stabilit Europa'
		WHEN 4000 THEN '4000 – Stabilit America' 
		WHEN 4020 THEN '4020 – Formet' 
		WHEN 5000 THEN '5000 – Staff Verzatec' 
		WHEN 2042 THEN '2042 – Staff Tiendas Cuprum & MD' 
		ELSE 'Sin Asignar' 
	END 
	                 from vt_organigrama where Empresa=op.Empresa and EmpresaFuente=op.EmpresaFuente and plaza=op.plaza),
	  --     op.id_recurso_vt,
			--op.id,
			--op.plaza,
			--op.Empresa,
			--op.EmpresaFuente,
			--op.plaza_superior,
			op.empleado,
			'(' + n.descripcion + ') ' + op.Nombre_Completo as Nombre_Completo,
			--op.id_nivel_puesto,
			--op.staff,
			op.Puesto,
			--op.Hijos,
			--op.empleado,
			--op.nomina,
			--op.urlFoto,
			--op.Nivel_Plaza,
			--op.Nivel_Recurso,
			--op.IDSM1,
			--op.IDSM2,
			--op.IDSM3,
			--op.IDSM4,
			op.SM1,
			op.SM2,
			op.SM3,
			op.SM4--,
			--op.NivelSM1,
			--op.NivelSM2,
			--op.NivelSM3,
			--op.NivelSM4,
			--op.NivelPade,
			--op.Llave
	from	#Organigrama_Plano op,
			Kiosco.dbo.CH_NivelesCapHum n
	where	op.nivel_recurso = n.Nivel
			and n.Tipo = 2
			and (@Nivel_Plaza = -1 or Nivel_Plaza = @Nivel_Plaza)
			and	( (power(2, Nivel_Recurso - 1) & @Codigo > 0 ) or @Codigo = -1)
				--CACM--
			and op.id_recurso_vt in(select id_recurso_vt from v_EmpleadosVerzatec 
			where Entidad = case @Entidad when 0 then Entidad else @Entidad end)
			---------
	order by Llave
	
end




GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Permisos_Organigrama_Hijos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Objetivo:	Consultar Organigrama trayendo el permiso para cargar en 
			Administracion de Permisos de Usuarios de Capital Humano
Creado por:	Jaime Sánchez
Fecha:		28-Ago-2007
*/

-- grant execute on  SPQ_CH_Permisos_Organigrama_Hijos to pinuser

CREATE Proc [dbo].[SPQ_CH_Permisos_Organigrama_Hijos]
	@PlazaSuperior 	int,
	@EmpresaSuperior int,
	@EmpresaFuenteSuperior int,
	@id_recurso_vt int
AS

	set nocount on

	select 	re.id,
			o.plaza,
			compania = o.Empresa,
			o.EmpresaFuente,
			o.plaza_superior,
			Nombre_Completo = r.Nombre+' '+r.Paterno+' '+r.Materno,
			o.id_nivel_puesto,
			o.staff,
			Puesto = p.Desc_esp,
			Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
					from 	VT_Organigrama 
					where 	plaza_superior = o.Plaza
					and	Empresa_Superior = o.Empresa
					and	EmpresaFuente_Superior = o.EmpresaFuente
					and	Estatus = 1
					and	Publica = 1),
			re.empleado,
			re.nomina,
			--cc='',
			r.id_Recurso_Vt,
	 		ev.urlFoto	
	into	#Hijos
	from 	VT_Organigrama o,
			VT_Recursos r,
			VT_RecursoEmpresa re,
			VT_Puesto p,
	 		v_EmpleadosVerzatec ev
	where	r.id_Recurso_vt = o.id_Recurso_vt
	and		re.empresa = o.empresa
	and		re.EmpresaFuente = o.EmpresaFuente
	and		re.id_Recurso_vt = o.id_Recurso_vt
	and		re.estatus not in (2, 4)
	and		p.Empresa =* o.Empresa
	and		p.EmpresaFuente =* o.EmpresaFuente
	and		p.id_nivel_puesto =* o.id_nivel_puesto
	and		o.estatus = 1
	and		o.Publica = 1

	and	ev.id_Recurso_vt =* o.id_Recurso_vt
	and	ev.empresa =* o.empresa
	and	ev.EmpresaFuente =* o.EmpresaFuente
	
	and	o.Plaza_Superior= @PlazaSuperior
	and	o.Empresa_Superior = @EmpresaSuperior
	and	o.EmpresaFuente_Superior = @EmpresaFuenteSuperior


	insert into #Hijos
	select 	0,
		o.plaza,
		compania = o.Empresa,
		o.EmpresaFuente,
		o.plaza_superior,
		Nombre_Completo = 'VACANTE',
		o.id_nivel_puesto,
		o.staff,
		Puesto = p.Desc_esp,
		Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
				from 	VT_Organigrama 
				where 	plaza_superior = o.Plaza
				and	Empresa_Superior = o.Empresa
				and	EmpresaFuente_Superior = o.EmpresaFuente
				and	Estatus = 1
				and	Publica = 1),
		0,
		0,
		--cc='',
		0,
		urlFoto = ''
	from 	VT_Organigrama o,
		VT_Puesto p
	where	p.Empresa =* o.Empresa
	and	p.EmpresaFuente =* o.EmpresaFuente
	and	p.id_nivel_puesto =* o.id_nivel_puesto
	and	o.estatus = 1
	and	o.Publica = 1
	and	o.id_Recurso_vt = 0
	and	o.Plaza_Superior= @PlazaSuperior
	and	o.Empresa_Superior = @EmpresaSuperior
	and	o.EmpresaFuente_Superior = @EmpresaFuenteSuperior

	set nocount off 
	
	--Regresar con campo IncExc el cual indica si esta Incluido=1 o Excluido=0 o no esta Seleccionado=-1
	select 	h.*,
			IncExc = isnull(
						(	select 	IncExc
							from 	kiosco.dbo.ch_permisos  
							where 	id_recurso_vt = @id_recurso_vt
							and		h.Compania = Empresa 
							and		h.EmpresaFuente = EmpresaFuente
							and		h.plaza = plaza
						), -1)
	from 	#Hijos h
	Order by Puesto

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_Permisos_Organigrama_Padre]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Objetivo:	Consultar Organigrama Verzatec trayendo el permiso para cargar en 
			Administracion de Permisos de Usuarios de Capital Humano
Creado por:	Jaime Sánchez
Fecha:		28-Ago-2007
*/
CREATE Proc [dbo].[SPQ_CH_Permisos_Organigrama_Padre]
	@Plaza 	int,
	@Empresa int,
	@EmpresaFuente int,
	@id_recurso_vt int --id del Usuario
AS
	
-- 
-- declare @Plaza 	int,
-- 	@Empresa int,
-- 	@EmpresaFuente int
-- select 	@Plaza 	= 12,
-- 	@Empresa = 5000,
-- 	@EmpresaFuente = 8

	select 	distinct o.id_recurso_vt,
			re.id,
			o.plaza,
			compania = o.Empresa,
			o.EmpresaFuente,
			o.plaza_superior,
			Nombre_Completo = isnull(r.Nombre+' '+r.Paterno+' '+r.Materno, 'VACANTE'),
			o.id_nivel_puesto,
			o.staff,
			Puesto = p.Desc_esp,
			Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
					from 	VT_Organigrama 
					where 	plaza_superior = o.Plaza
					and	Empresa_Superior = o.Empresa
					and	EmpresaFuente_Superior = o.EmpresaFuente
					and	Estatus = 1
					and	Publica = 1),
			re.empleado,
			re.nomina,
			cc='',
			ev.urlFoto,

			--Regresar con campo IncExc el cual indica si esta Incluido=1 o Excluido=0 o no esta Seleccionado=-1
			IncExc = isnull(
						(	select 	IncExc
							from 	kiosco.dbo.ch_permisos  
							where 	id_recurso_vt = @id_recurso_vt
							and		o.Empresa = Empresa 
							and		o.EmpresaFuente = EmpresaFuente
							and		o.plaza = plaza
						), -1)
	from 	VT_Organigrama o,
			VT_Recursos r,
			VT_RecursoEmpresa re,
			VT_Puesto p,
			v_EmpleadosVerzatec ev
	where	r.id_Recurso_vt =* o.id_Recurso_vt
	and		re.empresa =* o.empresa
	and		re.EmpresaFuente =* o.EmpresaFuente
	and		re.id_Recurso_vt =* o.id_Recurso_vt
	and		re.estatus not in (2, 4)
	and		p.Empresa =* o.Empresa
	and		p.EmpresaFuente =* o.EmpresaFuente
	and		p.id_nivel_puesto =* o.id_nivel_puesto
	and		o.estatus = 1
	and		o.Publica = 1
	and		ev.id_Recurso_vt =* o.id_Recurso_vt
	and		ev.empresa =* o.empresa
	and		ev.EmpresaFuente =* o.EmpresaFuente
	and		o.Plaza = @Plaza
	and		o.Empresa = @Empresa
	and		o.EmpresaFuente = @EmpresaFuente
	
--	Order by p.Desc_esp asc

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_PNS]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	Proc [dbo].[SPQ_CH_PNS]
	@id_recurso_vt 	int,
	@Periodo	int
AS


if @id_recurso_vt = 0
	select @id_recurso_vt = -1

Select	Puesto		= p.Desc_Esp + ' (' + CASE o.Entidad 
											WHEN 1000 THEN 'Staff Aluminio' 
											WHEN 1100 THEN 'Perfiles Mty' 
											WHEN 1110 THEN 'Perfiles Mex' 
											WHEN 1200 THEN 'Escaleras'
											WHEN 1301 THEN 'Ventanas' 
											WHEN 1400 THEN 'Perfiles Guadalajara ' 
											WHEN 1500 THEN 'Perfiles Comercial ' 
											WHEN 2041 THEN 'Tiendas Cuprum'
											WHEN 2050 THEN 'Metales Díaz' 
											WHEN 3030 THEN 'Bayer' 
											WHEN 3050 THEN 'Stabilit Villa de García' 
											WHEN 3051 THEN 'Tlanepantla' 
											WHEN 3052 THEN 'Guadalajara' 
											WHEN 3053 THEN 'Villahermosa' 
											WHEN 3054 THEN 'Tultitlan' 
											WHEN 3055 THEN 'Mexicali'
											WHEN 3056 THEN 'Stabilit America' 
											WHEN 3070 THEN 'Stabilit Europa'
											WHEN 4000 THEN 'Stabilit America' 
											WHEN 4020 THEN 'Formet' 
											WHEN 5000 THEN 'Staff Verzatec' 
											WHEN 2042 THEN 'Staff Tiendas Cuprum & MD' 
											ELSE 'Louisville'
										END 
									+ ')',
		Posicion	= case @id_recurso_vt 
						when IDSM1 Then 1
						when IDSM2 Then 2
						when IDSM3 Then 3
						when IDSM4 Then 4
					  End,
		Nivel 		= case @id_recurso_vt 
						when IDSM1 Then NivelSM1
						when IDSM2 Then NivelSM2
						when IDSM3 Then NivelSM3
						when IDSM4 Then NivelSM4
					  End
From	Kiosco.dbo.CH_Nivel_Plaza_vzt		np,
	ORGANIZACION_VZT.dbo.VT_Organigrama 	o,
	ORGANIZACION_VZT.dbo.VT_Puesto 		p
Where	np.Empresa 		= o.Empresa
And	np.EmpresaFuente 	= o.EmpresaFuente
And	np.Plaza 		= o.Plaza
And	np.Periodo 		= @Periodo
And	p.Empresa 		= o.Empresa
And	p.EmpresaFuente 	= o.EmpresaFuente
And	p.id_nivel_puesto 	= o.id_nivel_puesto
And	o.estatus 		= 1
And	o.Publica 		= 1
And    (np.IDSM1 = @id_recurso_vt OR
	np.IDSM2 = @id_recurso_vt OR
	np.IDSM3 = @id_recurso_vt OR
	np.IDSM4 = @id_recurso_vt 
	)

order by Nivel

-- dbo.CH_NivelesCapHum

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_RepDesarrolloEmp]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- grant exec on SPQ_CH_RepDesarrolloEmp to pinuser               
CREATE Proc [dbo].[SPQ_CH_RepDesarrolloEmp]      
	@Division  	int=-1,        
	@Direccion 	int=-1,        
	@Area     	int=-1,        
	@Codigo  	int=-1,        
	@Nombre  	varchar(60)='',        
	@id_recurso_vt 	int,        
	@Periodo 	int,        
	@Opcion  	int=1,        
	@Entidad	int=-1,
	@NivelPlaza	int=-1,
	@FechaAct	int=-1,
	@ID_Formato	int=-1
AS        

        
SET NOCOUNT ON        

Select * into #Empleados from Organizacion_vzt.dbo.v_EmpleadosVerzatec   
        

If @Codigo < 1   
	Set @Codigo = -1       
	 

--Obtener arbol del usuario por default        
declare @PlazaSuperior int,        
		@EmpresaSuperior int,        
		@EmpresaFuenteSuperior int        

set  @PlazaSuperior =-1        
set  @EmpresaSuperior =-1        
set  @EmpresaFuenteSuperior =-1        
     
if @Opcion = 1        
begin        

	Select  @PlazaSuperior = Plaza,        
			@EmpresaSuperior = Empresa,        
			@EmpresaFuenteSuperior = EmpresaFuente        
	from	vt_Organigrama        
	Where	id_recurso_vt = @id_recurso_vt        
			and  Estatus = 1        
			
end        
    
    
Create Table #Dependientes        
	(Empresa int not null,        
	EmpresaFuente int not null,        
	Plaza  int not null,        
	Nivel int not null,        
	Cadena varchar(1000) not null)        
    
if @Opcion <> 1        
begin        
	-- Validar que las plazas a consultar esten dentro del arbol que tiene permisos         
	-- y que no esten excluidos        
	--  Generar una temporal con todos los arboles a los que tiene permisos        
	--  y excluir las plazas a las que no tenga permisos        
	--  Para despues excluirlas del query de consulta.        
	 insert into #dependientes exec SPQ_CH_GeneraDependenciasPermisos  @id_recurso_vt             
end        


  
if @Division = 1 or @Division = -1       
begin        

	select  distinct ev.id_Recurso_vt,        
		ev.id,        
		ev.Empleado,        
		nomina = isnull(ev.nomina, 0),        
		ev.NombreCompleto,        
		ev.Puesto,        
		ev.Direccion,        
		id_Area = ev.idArea,        
		ev.Area,        
		ev.plaza,        
		ev.Empresa,        
		ev.EmpresaFuente,        
		o.plaza_superior,        
		o.id_nivel_puesto,        
		o.staff,        
		CodigoPlazas = isnull(np.Nivel, 0),        
		SM1    = IsNull(np.SM1, ''),        
		SM2    = IsNull(np.SM2, ''),        
		SM3    = IsNull(np.SM3, ''),        
		Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
		Semaforo  = s.Semaforo,        
		Calificacion = s.Calificacion        
		--ev.empresa        
	Into	#Previo1
	from  	VT_Organigrama 		o,    
			#Empleados 			ev,        
			Kiosco.dbo.CH_Nivel_Plaza_vzt 	np,        
			Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
			Kiosco.dbo.CH_Semaforos_vzt 	s        
	where	o.estatus 		= 1        
			and	o.Publica 		= 1        
			and	ev.id_Recurso_vt 	= o.id_Recurso_vt        
			and	ev.empresa 		= o.empresa 
			and	ev.EmpresaFuente 	= o.EmpresaFuente        
			--Nivel Plaza        
			and	np.Empresa 		=* ev.Empresa        
			and	np.EmpresaFuente 	=* ev.EmpresaFuente        
			and	np.Plaza 		=* ev.Plaza        
			and	np.Periodo 		>= @Periodo        
			--Nivel Recurso        
			-- and	nr.id_recurso_vt 	=* ev.id_recurso_vt        
			and	nr.id_recurso_vt 	= ev.id_recurso_vt        
			and	nr.Periodo 		= @Periodo        
			-- Semaforo        
			and	s.id_recurso_vt 	=* ev.id_recurso_vt        
			and	s.Periodo  		= Datepart(wk, getdate()-4)         
			and	s.Anio   		= Datepart(yy, getdate()-4)        
			and	s.Tipo 			= 0        
			--Filtros        
			--and	(ev.idDivision 		= @Division 	OR @Division 	= -1 or @Division = 1)        
			and	(ev.idDireccion 	= @Direccion 	OR @Direccion 	= -1)        
			and	(ev.idArea 		= @Area 	OR @Area 	= -1)        
			and	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
			and	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        


			and	((	o.Plaza_Superior	= @PlazaSuperior 
			and 	o.Empresa_Superior 	= @EmpresaSuperior 
			and 	o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
			OR        
			(	o.Plaza 		= @PlazaSuperior 
			and 	o.Empresa 		= @EmpresaSuperior 
			and 	o.EmpresaFuente 	= @EmpresaFuenteSuperior )        
			OR         
			(	@PlazaSuperior		= -1 
			AND 	@EmpresaSuperior	= -1 
			AND 	@EmpresaFuenteSuperior	= -1)        
			)        
			and	(exists (	select  1         
			from  	#dependientes        
			Where 	o.Empresa 	= Empresa        
			and	o.EmpresaFuente = EmpresaFuente        
			and	o.Plaza 	= Plaza        
			)        
			OR 	@Opcion = 1        

			)
			-- Actividades
			And	(@FechaAct = -1
			OR
			Exists(	Select	1 
			From	Kiosco.dbo.CH_Acciones_vzt ACC 
			Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
			And	((	@FechaAct					= 1
			And	ACC.Fecha_Fin					< Getdate()-1
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			)
			OR
			(	@FechaAct					= 2
			And	ACC.Fecha_Fin					< Getdate()+30
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			))
			)
			)
	--Order by  nr.Codigo, ev.NombreCompleto        
	Order by  ev.idArea, ev.NombreCompleto        


	Select	*
	From	#Previo1
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	
end      
else if @Division = 2      
begin     
 
	select  distinct ev.id_Recurso_vt,        
			ev.id,        
			ev.Empleado,        
			nomina = isnull(ev.nomina, 0),        
			ev.NombreCompleto,        
			ev.Puesto,        
			ev.Direccion,        
			id_Area = ev.idArea,        
			ev.Area,        
			ev.plaza,        
			ev.Empresa,        
			ev.EmpresaFuente,        
			o.plaza_superior,        
			o.id_nivel_puesto,        
			o.staff,        
			CodigoPlazas = isnull(np.Nivel, 0),        
			SM1    = IsNull(np.SM1, ''),        
			SM2    = IsNull(np.SM2, ''),        
			SM3    = IsNull(np.SM3, ''),        
			Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
			Semaforo  = s.Semaforo,        
			Calificacion = s.Calificacion        
			--ev.empresa        
	Into	#Previo2
	from  	VT_Organigrama			o,        
			#Empleados 			ev,        
			Kiosco.dbo.CH_Nivel_Plaza_vzt 	np,        
			Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
			Kiosco.dbo.CH_Semaforos_vzt 	s        
	where 	o.estatus 		= 1        
			and  	o.Publica 		= 1        
			and  	ev.id_Recurso_vt 	= o.id_Recurso_vt        
			and  	ev.empresa 		= o.empresa        
			and  	ev.EmpresaFuente 	= o.EmpresaFuente        
			--Nivel Plaza        
			and  	np.Empresa 		=* ev.Empresa        
			and  	np.EmpresaFuente 	=* ev.EmpresaFuente        
			and  	np.Plaza 		=* ev.Plaza        
			and 	np.Periodo 		>= @Periodo        
			--Nivel Recurso        
			-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
			and  	nr.id_recurso_vt 	= ev.id_recurso_vt        
			and  	nr.Periodo 		= @Periodo        
			-- Semaforo        
			and  	s.id_recurso_vt 	=* ev.id_recurso_vt        
			and  	s.Periodo  		= Datepart(wk, getdate()-4)         
			and  	s.Anio   		= Datepart(yy, getdate()-4)        
			and  	s.Tipo 			= 0        
			--Filtros    
			and	@Entidad 		in (-1,ev.Entidad)         
			and 	(ev.Entidad 		in (1301,2050,2041,2042,1110,1100,1000,1200,1400,1500,5000,0))      
			--and  	(ev.idDivision 		= @Division 	OR @Division 	= -1 or @Division = 1)        
			and  	(ev.idDireccion 	= @Direccion 	OR @Direccion 	= -1)        
			and  	(ev.idArea 		= @Area 	OR @Area 	= -1)        
			and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
			and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        

			and  	((	o.Plaza_Superior		= @PlazaSuperior 
			and 	o.Empresa_Superior 		= @EmpresaSuperior 
			and 	o.EmpresaFuente_Superior 	= @EmpresaFuenteSuperior)        
			OR        
			(	o.Plaza 			= @PlazaSuperior 
			and 	o.Empresa 			= @EmpresaSuperior 
			and 	o.EmpresaFuente 		= @EmpresaFuenteSuperior )        
			OR         
			(	@PlazaSuperior			= -1 
			AND 	@EmpresaSuperior		= -1 
			AND 	@EmpresaFuenteSuperior		= -1)
			)        
			and  	(exists(	select  1         
			from  	#dependientes        
			Where 	o.Empresa 	= Empresa        
			and  	o.EmpresaFuente = EmpresaFuente        
			and  	o.Plaza 	= Plaza        
			)        
			OR @Opcion = 1        
			)        
			-- Actividades
			And	(@FechaAct = -1
			OR
			Exists(	Select	1 
			From	Kiosco.dbo.CH_Acciones_vzt ACC 
			Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
			And	((	@FechaAct					= 1
			And	ACC.Fecha_Fin					< Getdate()-1
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			)
			OR
			(	@FechaAct					= 2
			And	ACC.Fecha_Fin					< Getdate()+30
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			))
			)
			)
	-- --Order by  nr.Codigo, ev.NombreCompleto        
	Order by  ev.idArea, ev.NombreCompleto        

	Select	*
	From	#Previo2
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	

end      
else if @Division = 3      
begin      
	select  distinct ev.id_Recurso_vt,        
	ev.id,        
	ev.Empleado,        
	nomina = isnull(ev.nomina, 0),        
	ev.NombreCompleto,        
	ev.Puesto,        
	ev.Direccion,        
	id_Area = ev.idArea,        
	ev.Area,        
	ev.plaza,        
	ev.Empresa,        
	ev.EmpresaFuente,        
	o.plaza_superior,        
	o.id_nivel_puesto,        
	o.staff,        
	CodigoPlazas = isnull(np.Nivel, 0),        
	SM1    = IsNull(np.SM1, ''),        
	SM2    = IsNull(np.SM2, ''),        
	SM3    = IsNull(np.SM3, ''),        
	Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
	Semaforo  = s.Semaforo,        
	Calificacion = s.Calificacion
	--ev.empresa        
	Into	#Previo3
	from	VT_Organigrama o,        
	#Empleados ev,        
	Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
	Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
	Kiosco.dbo.CH_Semaforos_vzt s        
	where o.estatus = 1        
	and  	o.Publica = 1        
	and  	ev.id_Recurso_vt = o.id_Recurso_vt        
	and  	ev.empresa = o.empresa        
	and  	ev.EmpresaFuente = o.EmpresaFuente        
	--Nivel Plaza        
	and  	np.Empresa =* ev.Empresa        
	and  	np.EmpresaFuente =* ev.EmpresaFuente        
	and  	np.Plaza =* ev.Plaza        
	and  	np.Periodo >= @Periodo        
	--Nivel Recurso        
	-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
	and  	nr.id_recurso_vt = ev.id_recurso_vt        
	and  	nr.Periodo = @Periodo        
	-- Semaforo        
	and  	s.id_recurso_vt =* ev.id_recurso_vt        
	and  	s.Periodo  = Datepart(wk, getdate()-4)         
	and  	s.Anio   = Datepart(yy, getdate()-4)        
	and  	s.Tipo = 0        
	--Filtros        
	and @Entidad in (-1,ev.Entidad)     
	and (ev.Entidad in (4020))      
	--and  	(ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
	and  	(ev.idDireccion = @Direccion OR @Direccion = -1)        
	and  	(ev.idArea = @Area OR @Area = -1)        
	and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
	and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        


	and  	((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
	OR        
	(o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
	OR         
	(@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
	)        
	and  	(        
	exists (        
	select  1         
	from  #dependientes        
	Where o.Empresa = Empresa      
	and  	o.EmpresaFuente = EmpresaFuente        
	and  	o.Plaza = Plaza        
	)        
	OR @Opcion = 1        

	)        
	-- Actividades
	And	(@FechaAct = -1
	OR
	Exists(	Select	1 
	From	Kiosco.dbo.CH_Acciones_vzt ACC 
	Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
	And	((	@FechaAct					= 1
	And	ACC.Fecha_Fin					< Getdate()-1
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	)
	OR
	(	@FechaAct					= 2
	And	ACC.Fecha_Fin					< Getdate()+30
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	))
	)
	)
	-- --Order by  nr.Codigo, ev.NombreCompleto        
	Order by  ev.idArea, ev.NombreCompleto        

	Select	*
	From	#Previo3
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	

end      
else if @Division = 4      
begin      
	select  distinct ev.id_Recurso_vt,        
	ev.id,        
	ev.Empleado,        
	nomina = isnull(ev.nomina, 0),        
	ev.NombreCompleto,        
	ev.Puesto,        
	ev.Direccion,        
	id_Area = ev.idArea,        
	ev.Area,        
	ev.plaza,        
	ev.Empresa,        
	ev.EmpresaFuente,        
	o.plaza_superior,        
	o.id_nivel_puesto,        
	o.staff,        
	CodigoPlazas = isnull(np.Nivel, 0),        
	SM1    = IsNull(np.SM1, ''),        
	SM2    = IsNull(np.SM2, ''),        
	SM3    = IsNull(np.SM3, ''),        
	Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
	Semaforo  = s.Semaforo,        
	Calificacion = s.Calificacion
	--ev.empresa        
	Into	#Previo4
	from	VT_Organigrama o,        
	#Empleados ev,        
	Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
	Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
	Kiosco.dbo.CH_Semaforos_vzt s        
	where o.estatus = 1        
	and  	o.Publica = 1        
	and  	ev.id_Recurso_vt = o.id_Recurso_vt        
	and  	ev.empresa = o.empresa        
	and  	ev.EmpresaFuente = o.EmpresaFuente        
	--Nivel Plaza        
	and  	np.Empresa =* ev.Empresa        
	and  	np.EmpresaFuente =* ev.EmpresaFuente        
	and  	np.Plaza =* ev.Plaza        
	and  	np.Periodo >= @Periodo        
	--Nivel Recurso        
	-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
	and  	nr.id_recurso_vt = ev.id_recurso_vt        
	and  	nr.Periodo = @Periodo        
	-- Semaforo        
	and  	s.id_recurso_vt =* ev.id_recurso_vt        
	and  	s.Periodo  = Datepart(wk, getdate()-4)         
	and  	s.Anio   = Datepart(yy, getdate()-4)        
	and  	s.Tipo = 0        
	--Filtros    
	and @Entidad in (-1,ev.Entidad)         
	and (ev.Entidad in (3056,3030,3050,3051,3052,3053,3054,3055,3056,4000,3070))      
	and (ev.Empresa not like '%9%')      
	--and  	(ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
	and  	(ev.idDireccion = @Direccion OR @Direccion = -1)        
	and  	(ev.idArea = @Area OR @Area = -1)        
	and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
	and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        


	and  	((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
	OR        
	(o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
	OR         
	(@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
	)        
	and  	(        
	exists (        
	select  1         
	from  #dependientes        
	Where o.Empresa = Empresa        
	and  	o.EmpresaFuente = EmpresaFuente        
	and  	o.Plaza = Plaza        
	)        
	OR @Opcion = 1        

	)        
	-- Actividades
	And	(@FechaAct = -1
	OR
	Exists(	Select	1 
	From	Kiosco.dbo.CH_Acciones_vzt ACC 
	Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
	And	((	@FechaAct					= 1
	And	ACC.Fecha_Fin					< Getdate()-1
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	)
	OR
	(	@FechaAct					= 2
	And	ACC.Fecha_Fin					< Getdate()+30
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	))
	)
	)
	-- --Order by  nr.Codigo, ev.NombreCompleto        
	Order by  ev.idArea, ev.NombreCompleto        

	Select	*
	From	#Previo4
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	

end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_RepDesarrolloEmp_090611]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SPQ_CH_RepDesarrolloEmp -1, -1, -1, 0.5, 'alberto barrientos', 8964, 2008,0 ,-1 
  
/*        
Objetivo: Consultar Reporte de Desarrollo del personal        
   Capital Humano        
Creado por: Jaime Sánchez        
Fecha:  18-Sept-2007        
-- -- grant exec on SPQ_CH_RepDesarrolloEmp to pinuser         
*/        
--exec SPQ_CH_RepDesarrolloEmp -1, -1, -1, -1, 'JESUS ALBERTO DIAZ DOMINGUEZ', 1942, 2008,1      
CREATE Proc [dbo].[SPQ_CH_RepDesarrolloEmp_090611]        
 @Division  int=-1,        
 @Direccion int=-1,        
 @Area     int=-1,        
 @Codigo  int=-1,        
 @Nombre  varchar(60)='',        
 @id_recurso_vt int,        
 @Periodo int,        
 @Opcion  int=1,        
 @Entidad int = -1    
AS        
        
-- ---------------TEST        
-- --exec SPQ_CH_RepDesarrolloEmp -1, -1, -1, 0.5, 'Monsivais', 1942, 2007,0         
--         
-- Declare @Division  int,        
--   @Direccion int,        
--   @Area  int,        
--   @Codigo   int,        
--   @Nombre   varchar(80),        
--   @id_recurso_vt int,        
--   @Periodo  int,        
--   @Opcion   int        
--         
-- Set @Division  = -1        
-- Set @Direccion = 1000 ---1        
-- Set @Area = -1        
-- Set @Codigo  = -1        
-- Set @Nombre  =''        
--  set @id_recurso_vt = 1942 -- 2543 --Marco Medellin        
-- set @Periodo = 2007        
-- set @Opcion = 0        
--         
--  drop table #Dependientes        
--         
-- -- -- ---------TEST---------------        
        
        
SET NOCOUNT ON        
Select * into #Empleados from Organizacion_vzt.dbo.v_EmpleadosVerzatec   
        
 If @Codigo < 1        
  Set @Codigo = -1        
         
 --Obtener arbol del usuario por default        
 declare  @PlazaSuperior int,        
    @EmpresaSuperior int,        
    @EmpresaFuenteSuperior int        
         
 set  @PlazaSuperior =-1        
 set  @EmpresaSuperior =-1        
 set  @EmpresaFuenteSuperior =-1        
         
 if @Opcion = 1        
 begin        
   Select  @PlazaSuperior = Plaza,        
     @EmpresaSuperior = Empresa,        
     @EmpresaFuenteSuperior = EmpresaFuente        
   from vt_Organigrama        
   Where id_recurso_vt = @id_recurso_vt        
   and  Estatus = 1        
 end        
        
        
 set nocount on        
 Create  Table #Dependientes        
            (Empresa int not null,        
       EmpresaFuente int not null,        
       Plaza  int not null,        
             Nivel int not null,        
             Cadena varchar(1000) not null)        
        
if @Opcion <> 1        
begin        
-- Validar que las plazas a consultar esten dentro del arbol que tiene permisos         
-- y que no esten excluidos        
--  Generar una temporal con todos los arboles a los que tiene permisos        
--  y excluir las plazas a las que no tenga permisos        
--  Para despues excluirlas del query de consulta.        
 insert into #dependientes exec SPQ_CH_GeneraDependenciasPermisos  @id_recurso_vt        
-----        
end        
      
if @Division = 1 or @Division = -1       
begin        
 select  distinct ev.id_Recurso_vt,        
   ev.id,        
   ev.Empleado,        
   nomina = isnull(ev.nomina, 0),        
   ev.NombreCompleto,        
   ev.Puesto,        
   ev.Direccion,        
   id_Area = ev.idArea,        
   ev.Area,        
   ev.plaza,        
   ev.Empresa,        
   ev.EmpresaFuente,        
   o.plaza_superior,        
   o.id_nivel_puesto,        
   o.staff,        
   CodigoPlazas = isnull(np.Nivel, 0),        
   SM1    = IsNull(np.SM1, ''),        
   SM2    = IsNull(np.SM2, ''),        
   SM3    = IsNull(np.SM3, ''),        
   Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
   Semaforo  = s.Semaforo,        
   Calificacion = s.Calificacion,        
   ev.empresa        
 from  VT_Organigrama o,        
    #Empleados ev,        
   Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
   Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
   Kiosco.dbo.CH_Semaforos_vzt s        
 where o.estatus = 1        
 and  o.Publica = 1        
 and  ev.id_Recurso_vt = o.id_Recurso_vt        
 and  ev.empresa = o.empresa        
 and  ev.EmpresaFuente = o.EmpresaFuente        
 --Nivel Plaza        
 and  np.Empresa =* ev.Empresa        
 and  np.EmpresaFuente =* ev.EmpresaFuente        
 and  np.Plaza =* ev.Plaza        
 and  np.Periodo >= @Periodo        
 --Nivel Recurso        
-- and  nr.id_recurso_vt =* ev.id_recurso_vt        
 and  nr.id_recurso_vt = ev.id_recurso_vt        
 and  nr.Periodo = @Periodo        
 -- Semaforo        
 and  s.id_recurso_vt =* ev.id_recurso_vt        
 and  s.Periodo  = Datepart(wk, getdate()-4)         
 And  s.Anio   = Datepart(yy, getdate()-4)        
 and  s.Tipo = 0        
 --Filtros        
 --and  (ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
 and  (ev.idDireccion = @Direccion OR @Direccion = -1)        
 and  (ev.idArea = @Area OR @Area = -1)        
 and  ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
 and  (power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        
        
 and  ((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
   OR        
   (o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
   OR         
   (@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
   )        
 and  (        
   exists (        
     select  *         
     from  #dependientes        
     Where o.Empresa = Empresa        
     and  o.EmpresaFuente = EmpresaFuente        
     and  o.Plaza = Plaza        
     )        
   OR @Opcion = 1        
        
   )        
-- --Order by  nr.Codigo, ev.NombreCompleto        
Order by  ev.idArea, ev.NombreCompleto        
end      
else if @Division = 2      
begin      
 select  distinct ev.id_Recurso_vt,        
   ev.id,        
   ev.Empleado,        
   nomina = isnull(ev.nomina, 0),        
   ev.NombreCompleto,        
   ev.Puesto,        
   ev.Direccion,        
   id_Area = ev.idArea,        
   ev.Area,        
   ev.plaza,        
   ev.Empresa,        
   ev.EmpresaFuente,        
   o.plaza_superior,        
   o.id_nivel_puesto,        
   o.staff,        
   CodigoPlazas = isnull(np.Nivel, 0),        
   SM1    = IsNull(np.SM1, ''),        
   SM2    = IsNull(np.SM2, ''),        
   SM3    = IsNull(np.SM3, ''),        
   Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
   Semaforo  = s.Semaforo,        
   Calificacion = s.Calificacion,        
   ev.empresa        
 from  VT_Organigrama o,        
    #Empleados ev,        
   Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
   Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
   Kiosco.dbo.CH_Semaforos_vzt s        
 where o.estatus = 1        
 and  o.Publica = 1        
 and  ev.id_Recurso_vt = o.id_Recurso_vt        
 and  ev.empresa = o.empresa        
 and  ev.EmpresaFuente = o.EmpresaFuente        
 --Nivel Plaza        
 and  np.Empresa =* ev.Empresa        
 and  np.EmpresaFuente =* ev.EmpresaFuente        
 and  np.Plaza =* ev.Plaza        
 and  np.Periodo >= @Periodo        
 --Nivel Recurso        
-- and  nr.id_recurso_vt =* ev.id_recurso_vt        
 and  nr.id_recurso_vt = ev.id_recurso_vt        
 and  nr.Periodo = @Periodo        
 -- Semaforo        
 and  s.id_recurso_vt =* ev.id_recurso_vt        
 and  s.Periodo  = Datepart(wk, getdate()-4)         
 And  s.Anio   = Datepart(yy, getdate()-4)        
 and  s.Tipo = 0        
 --Filtros    
and @Entidad in (-1,ev.Entidad)         
and (ev.Entidad in (1301,2050,2041,1110,1100,1000,1200,1400,1500,0))      
 --and  (ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
 and  (ev.idDireccion = @Direccion OR @Direccion = -1)        
 and  (ev.idArea = @Area OR @Area = -1)        
 and  ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
 and  (power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        
        
 and  ((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
   OR        
   (o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
   OR         
   (@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
   )        
 and  (        
   exists (        
     select  *         
     from  #dependientes        
     Where o.Empresa = Empresa        
     and  o.EmpresaFuente = EmpresaFuente        
     and  o.Plaza = Plaza        
     )        
   OR @Opcion = 1        
         )        
-- --Order by  nr.Codigo, ev.NombreCompleto        
Order by  ev.idArea, ev.NombreCompleto        
end      
else if @Division = 3      
begin      
 select  distinct ev.id_Recurso_vt,        
   ev.id,        
   ev.Empleado,        
   nomina = isnull(ev.nomina, 0),        
   ev.NombreCompleto,        
   ev.Puesto,        
   ev.Direccion,        
   id_Area = ev.idArea,        
   ev.Area,        
   ev.plaza,        
   ev.Empresa,        
   ev.EmpresaFuente,        
   o.plaza_superior,        
   o.id_nivel_puesto,        
   o.staff,        
   CodigoPlazas = isnull(np.Nivel, 0),        
   SM1    = IsNull(np.SM1, ''),        
   SM2    = IsNull(np.SM2, ''),        
   SM3    = IsNull(np.SM3, ''),        
   Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
   Semaforo  = s.Semaforo,        
   Calificacion = s.Calificacion,        
   ev.empresa        
 from  VT_Organigrama o,        
    #Empleados ev,        
   Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
   Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
   Kiosco.dbo.CH_Semaforos_vzt s        
 where o.estatus = 1        
 and  o.Publica = 1        
 and  ev.id_Recurso_vt = o.id_Recurso_vt        
 and  ev.empresa = o.empresa        
 and  ev.EmpresaFuente = o.EmpresaFuente        
 --Nivel Plaza        
 and  np.Empresa =* ev.Empresa        
 and  np.EmpresaFuente =* ev.EmpresaFuente        
 and  np.Plaza =* ev.Plaza        
 and  np.Periodo >= @Periodo        
 --Nivel Recurso        
-- and  nr.id_recurso_vt =* ev.id_recurso_vt        
 and  nr.id_recurso_vt = ev.id_recurso_vt        
 and  nr.Periodo = @Periodo        
 -- Semaforo        
 and  s.id_recurso_vt =* ev.id_recurso_vt        
 and  s.Periodo  = Datepart(wk, getdate()-4)         
 And  s.Anio   = Datepart(yy, getdate()-4)        
 and  s.Tipo = 0        
 --Filtros        
and @Entidad in (-1,ev.Entidad)     
and (ev.Entidad in (4020))      
 --and  (ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
 and  (ev.idDireccion = @Direccion OR @Direccion = -1)        
 and  (ev.idArea = @Area OR @Area = -1)        
 and  ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
 and  (power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        
        
 and  ((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
   OR        
   (o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
   OR         
   (@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
   )        
 and  (        
   exists (        
     select  *         
     from  #dependientes        
     Where o.Empresa = Empresa      
     and  o.EmpresaFuente = EmpresaFuente        
     and  o.Plaza = Plaza        
     )        
   OR @Opcion = 1        
        
   )        
-- --Order by  nr.Codigo, ev.NombreCompleto        
Order by  ev.idArea, ev.NombreCompleto        
end      
else if @Division = 4      
begin      
 select  distinct ev.id_Recurso_vt,        
   ev.id,        
   ev.Empleado,        
   nomina = isnull(ev.nomina, 0),        
   ev.NombreCompleto,        
   ev.Puesto,        
   ev.Direccion,        
   id_Area = ev.idArea,        
   ev.Area,        
   ev.plaza,        
   ev.Empresa,        
   ev.EmpresaFuente,        
   o.plaza_superior,        
   o.id_nivel_puesto,        
   o.staff,        
   CodigoPlazas = isnull(np.Nivel, 0),        
   SM1    = IsNull(np.SM1, ''),        
   SM2    = IsNull(np.SM2, ''),        
   SM3    = IsNull(np.SM3, ''),        
   Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
   Semaforo  = s.Semaforo,        
   Calificacion = s.Calificacion,        
   ev.empresa        
 from  VT_Organigrama o,        
    #Empleados ev,        
   Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
   Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
   Kiosco.dbo.CH_Semaforos_vzt s        
 where o.estatus = 1        
 and  o.Publica = 1        
 and  ev.id_Recurso_vt = o.id_Recurso_vt        
 and  ev.empresa = o.empresa        
 and  ev.EmpresaFuente = o.EmpresaFuente        
 --Nivel Plaza        
 and  np.Empresa =* ev.Empresa        
 and  np.EmpresaFuente =* ev.EmpresaFuente        
 and  np.Plaza =* ev.Plaza        
 and  np.Periodo >= @Periodo        
 --Nivel Recurso        
-- and  nr.id_recurso_vt =* ev.id_recurso_vt        
 and  nr.id_recurso_vt = ev.id_recurso_vt        
 and  nr.Periodo = @Periodo        
 -- Semaforo        
 and  s.id_recurso_vt =* ev.id_recurso_vt        
 and  s.Periodo  = Datepart(wk, getdate()-4)         
 And  s.Anio   = Datepart(yy, getdate()-4)        
 and  s.Tipo = 0        
 --Filtros    
and @Entidad in (-1,ev.Entidad)         
and (ev.Entidad in (3030,3050,3051,3052,3053,3054,3055,4000,3070))      
and (ev.Empresa not like '%9%')      
 --and  (ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
 and  (ev.idDireccion = @Direccion OR @Direccion = -1)        
 and  (ev.idArea = @Area OR @Area = -1)        
 and  ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
 and  (power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        
        
 and  ((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
   OR        
   (o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
   OR         
   (@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
   )        
 and  (        
   exists (        
     select  *         
     from  #dependientes        
     Where o.Empresa = Empresa        
     and  o.EmpresaFuente = EmpresaFuente        
     and  o.Plaza = Plaza        
     )        
   OR @Opcion = 1        
        
   )        
-- --Order by  nr.Codigo, ev.NombreCompleto        
Order by  ev.idArea, ev.NombreCompleto        
end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_RepDesarrolloEmp_2010]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- grant exec on SPQ_CH_RepDesarrolloEmp_2010 to pinuser               
CREATE Proc [dbo].[SPQ_CH_RepDesarrolloEmp_2010]        
	@Division  	int=-1,        
	@Direccion 	int=-1,        
	@Area     	int=-1,        
	@Codigo  	int=-1,        
	@Nombre  	varchar(60)='',        
	@id_recurso_vt 	int,        
	@Periodo 	int,        
	@Opcion  	int=1,        
	@Entidad	int=-1,
	@NivelPlaza	int=-1,
	@FechaAct	int=-1,
	@ID_Formato	int=-1
AS        
        
-- ---------------TEST        
-- --exec SPQ_CH_RepDesarrolloEmp -1, -1, -1, 0.5, 'Monsivais', 1942, 2007,0         
--         
-- Declare @Division  int,        
--   @Direccion int,        
--   @Area  int,        
--   @Codigo   int,        
--   @Nombre   varchar(80),        
--   @id_recurso_vt int,        
--   @Periodo  int,        
--   @Opcion   int        
--         
-- Set @Division  = -1        
-- Set @Direccion = 1000 ---1        
-- Set @Area = -1        
-- Set @Codigo  = -1        
-- Set @Nombre  =''        
--  set @id_recurso_vt = 1942 -- 2543 --Marco Medellin        
-- set @Periodo = 2007        
-- set @Opcion = 0        
--         
--  drop table #Dependientes        
--         
-- -- -- ---------TEST---------------        
        
        
SET NOCOUNT ON        

Select * into #Empleados from Organizacion_vzt.dbo.v_EmpleadosVerzatec   
        

If @Codigo < 1   
	Set @Codigo = -1       
	 

--Obtener arbol del usuario por default        
declare @PlazaSuperior int,        
		@EmpresaSuperior int,        
		@EmpresaFuenteSuperior int        

set  @PlazaSuperior =-1        
set  @EmpresaSuperior =-1        
set  @EmpresaFuenteSuperior =-1        
     
if @Opcion = 1        
begin        

	Select  @PlazaSuperior = Plaza,        
			@EmpresaSuperior = Empresa,        
			@EmpresaFuenteSuperior = EmpresaFuente        
	from	vt_Organigrama        
	Where	id_recurso_vt = @id_recurso_vt        
			and  Estatus = 1        
			
end        
    
    
Create Table #Dependientes        
	(Empresa int not null,        
	EmpresaFuente int not null,        
	Plaza  int not null,        
	Nivel int not null,        
	Cadena varchar(1000) not null)        
    
if @Opcion <> 1        
begin        
	-- Validar que las plazas a consultar esten dentro del arbol que tiene permisos         
	-- y que no esten excluidos        
	--  Generar una temporal con todos los arboles a los que tiene permisos        
	--  y excluir las plazas a las que no tenga permisos        
	--  Para despues excluirlas del query de consulta.        
	 insert into #dependientes exec SPQ_CH_GeneraDependenciasPermisos  @id_recurso_vt             
end        


  
if @Division = 1 or @Division = -1       
begin        

	select  distinct ev.id_Recurso_vt,        
		ev.id,        
		ev.Empleado,        
		nomina = isnull(ev.nomina, 0),        
		ev.NombreCompleto,        
		ev.Puesto,        
		ev.Direccion,        
		id_Area = ev.idArea,        
		ev.Area,        
		ev.plaza,        
		ev.Empresa,        
		ev.EmpresaFuente,        
		o.plaza_superior,        
		o.id_nivel_puesto,        
		o.staff,        
		CodigoPlazas = isnull(np.Nivel, 0),        
		SM1    = IsNull(np.SM1, ''),        
		SM2    = IsNull(np.SM2, ''),        
		SM3    = IsNull(np.SM3, ''),        
		Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
		Semaforo  = s.Semaforo,        
		Calificacion = s.Calificacion        
		--ev.empresa        
	Into	#Previo1
	from  	VT_Organigrama 		o,    
			#Empleados 			ev,        
			Kiosco.dbo.CH_Nivel_Plaza_vzt 	np,        
			Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
			Kiosco.dbo.CH_Semaforos_vzt 	s        
	where	o.estatus 		= 1        
			and	o.Publica 		= 1        
			and	ev.id_Recurso_vt 	= o.id_Recurso_vt        
			and	ev.empresa 		= o.empresa        
			and	ev.EmpresaFuente 	= o.EmpresaFuente        
			--Nivel Plaza        
			and	np.Empresa 		=* ev.Empresa        
			and	np.EmpresaFuente 	=* ev.EmpresaFuente        
			and	np.Plaza 		=* ev.Plaza        
			and	np.Periodo 		>= @Periodo        
			--Nivel Recurso        
			-- and	nr.id_recurso_vt 	=* ev.id_recurso_vt        
			and	nr.id_recurso_vt 	= ev.id_recurso_vt        
			and	nr.Periodo 		= @Periodo        
			-- Semaforo        
			and	s.id_recurso_vt 	=* ev.id_recurso_vt        
			and	s.Periodo  		= Datepart(wk, getdate()-4)         
			and	s.Anio   		= Datepart(yy, getdate()-4)        
			and	s.Tipo 			= 0        
			--Filtros        
			--and	(ev.idDivision 		= @Division 	OR @Division 	= -1 or @Division = 1)        
			and	(ev.idDireccion 	= @Direccion 	OR @Direccion 	= -1)        
			and	(ev.idArea 		= @Area 	OR @Area 	= -1)        
			and	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
			and	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        


			and	((	o.Plaza_Superior	= @PlazaSuperior 
			and 	o.Empresa_Superior 	= @EmpresaSuperior 
			and 	o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
			OR        
			(	o.Plaza 		= @PlazaSuperior 
			and 	o.Empresa 		= @EmpresaSuperior 
			and 	o.EmpresaFuente 	= @EmpresaFuenteSuperior )        
			OR         
			(	@PlazaSuperior		= -1 
			AND 	@EmpresaSuperior	= -1 
			AND 	@EmpresaFuenteSuperior	= -1)        
			)        
			and	(exists (	select  1         
			from  	#dependientes        
			Where 	o.Empresa 	= Empresa        
			and	o.EmpresaFuente = EmpresaFuente        
			and	o.Plaza 	= Plaza        
			)        
			OR 	@Opcion = 1        

			)
			-- Actividades
			And	(@FechaAct = -1
			OR
			Exists(	Select	1 
			From	Kiosco.dbo.CH_Acciones_vzt ACC 
			Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
			And	((	@FechaAct					= 1
			And	ACC.Fecha_Fin					< Getdate()-1
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			)
			OR
			(	@FechaAct					= 2
			And	ACC.Fecha_Fin					< Getdate()+30
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			))
			)
			)
	--Order by  nr.Codigo, ev.NombreCompleto        
	Order by  ev.idArea, ev.NombreCompleto        


	Select	*
	From	#Previo1
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	
end      
else if @Division = 2      
begin     
 
	select  distinct ev.id_Recurso_vt,        
			ev.id,        
			ev.Empleado,        
			nomina = isnull(ev.nomina, 0),        
			ev.NombreCompleto,        
			ev.Puesto,        
			ev.Direccion,        
			id_Area = ev.idArea,        
			ev.Area,        
			ev.plaza,        
			ev.Empresa,        
			ev.EmpresaFuente,        
			o.plaza_superior,        
			o.id_nivel_puesto,        
			o.staff,        
			CodigoPlazas = isnull(np.Nivel, 0),        
			SM1    = IsNull(np.SM1, ''),        
			SM2    = IsNull(np.SM2, ''),        
			SM3    = IsNull(np.SM3, ''),        
			Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
			Semaforo  = s.Semaforo,        
			Calificacion = s.Calificacion        
			--ev.empresa        
	Into	#Previo2
	from  	VT_Organigrama			o,        
			#Empleados 			ev,        
			Kiosco.dbo.CH_Nivel_Plaza_vzt 	np,        
			Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
			Kiosco.dbo.CH_Semaforos_vzt 	s        
	where 	o.estatus 		= 1        
			and  	o.Publica 		= 1        
			and  	ev.id_Recurso_vt 	= o.id_Recurso_vt        
			and  	ev.empresa 		= o.empresa        
			and  	ev.EmpresaFuente 	= o.EmpresaFuente        
			--Nivel Plaza        
			and  	np.Empresa 		=* ev.Empresa        
			and  	np.EmpresaFuente 	=* ev.EmpresaFuente        
			and  	np.Plaza 		=* ev.Plaza        
			and  	np.Periodo 		>= @Periodo        
			--Nivel Recurso        
			-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
			and  	nr.id_recurso_vt 	= ev.id_recurso_vt        
			and  	nr.Periodo 		= @Periodo        
			-- Semaforo        
			and  	s.id_recurso_vt 	=* ev.id_recurso_vt        
			and  	s.Periodo  		= Datepart(wk, getdate()-4)         
			and  	s.Anio   		= Datepart(yy, getdate()-4)        
			and  	s.Tipo 			= 0        
			--Filtros    
			and	@Entidad 		in (-1,ev.Entidad)         
			and 	(ev.Entidad 		in (1301,2050,2041,2042,1110,1100,1000,1200,1400,1500,5000,0))      
			--and  	(ev.idDivision 		= @Division 	OR @Division 	= -1 or @Division = 1)        
			and  	(ev.idDireccion 	= @Direccion 	OR @Direccion 	= -1)        
			and  	(ev.idArea 		= @Area 	OR @Area 	= -1)        
			and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
			and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        

			and  	((	o.Plaza_Superior		= @PlazaSuperior 
			and 	o.Empresa_Superior 		= @EmpresaSuperior 
			and 	o.EmpresaFuente_Superior 	= @EmpresaFuenteSuperior)        
			OR        
			(	o.Plaza 			= @PlazaSuperior 
			and 	o.Empresa 			= @EmpresaSuperior 
			and 	o.EmpresaFuente 		= @EmpresaFuenteSuperior )        
			OR         
			(	@PlazaSuperior			= -1 
			AND 	@EmpresaSuperior		= -1 
			AND 	@EmpresaFuenteSuperior		= -1)
			)        
			and  	(exists(	select  1         
			from  	#dependientes        
			Where 	o.Empresa 	= Empresa        
			and  	o.EmpresaFuente = EmpresaFuente        
			and  	o.Plaza 	= Plaza        
			)        
			OR @Opcion = 1        
			)        
			-- Actividades
			And	(@FechaAct = -1
			OR
			Exists(	Select	1 
			From	Kiosco.dbo.CH_Acciones_vzt ACC 
			Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
			And	((	@FechaAct					= 1
			And	ACC.Fecha_Fin					< Getdate()-1
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			)
			OR
			(	@FechaAct					= 2
			And	ACC.Fecha_Fin					< Getdate()+30
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			))
			)
			)
	-- --Order by  nr.Codigo, ev.NombreCompleto        
	Order by  ev.idArea, ev.NombreCompleto        

	Select	*
	From	#Previo2
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	

end      
else if @Division = 3      
begin      
	select  distinct ev.id_Recurso_vt,        
	ev.id,        
	ev.Empleado,        
	nomina = isnull(ev.nomina, 0),        
	ev.NombreCompleto,        
	ev.Puesto,        
	ev.Direccion,        
	id_Area = ev.idArea,        
	ev.Area,        
	ev.plaza,        
	ev.Empresa,        
	ev.EmpresaFuente,        
	o.plaza_superior,        
	o.id_nivel_puesto,        
	o.staff,        
	CodigoPlazas = isnull(np.Nivel, 0),        
	SM1    = IsNull(np.SM1, ''),        
	SM2    = IsNull(np.SM2, ''),        
	SM3    = IsNull(np.SM3, ''),        
	Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
	Semaforo  = s.Semaforo,        
	Calificacion = s.Calificacion
	--ev.empresa        
	Into	#Previo3
	from	VT_Organigrama o,        
	#Empleados ev,        
	Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
	Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
	Kiosco.dbo.CH_Semaforos_vzt s        
	where o.estatus = 1        
	and  	o.Publica = 1        
	and  	ev.id_Recurso_vt = o.id_Recurso_vt        
	and  	ev.empresa = o.empresa        
	and  	ev.EmpresaFuente = o.EmpresaFuente        
	--Nivel Plaza        
	and  	np.Empresa =* ev.Empresa        
	and  	np.EmpresaFuente =* ev.EmpresaFuente        
	and  	np.Plaza =* ev.Plaza        
	and  	np.Periodo >= @Periodo        
	--Nivel Recurso        
	-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
	and  	nr.id_recurso_vt = ev.id_recurso_vt        
	and  	nr.Periodo = @Periodo        
	-- Semaforo        
	and  	s.id_recurso_vt =* ev.id_recurso_vt        
	and  	s.Periodo  = Datepart(wk, getdate()-4)         
	and  	s.Anio   = Datepart(yy, getdate()-4)        
	and  	s.Tipo = 0        
	--Filtros        
	and @Entidad in (-1,ev.Entidad)     
	and (ev.Entidad in (4020))      
	--and  	(ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
	and  	(ev.idDireccion = @Direccion OR @Direccion = -1)        
	and  	(ev.idArea = @Area OR @Area = -1)        
	and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
	and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        


	and  	((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
	OR        
	(o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
	OR         
	(@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
	)        
	and  	(        
	exists (        
	select  1         
	from  #dependientes        
	Where o.Empresa = Empresa      
	and  	o.EmpresaFuente = EmpresaFuente        
	and  	o.Plaza = Plaza        
	)        
	OR @Opcion = 1        

	)        
	-- Actividades
	And	(@FechaAct = -1
	OR
	Exists(	Select	1 
	From	Kiosco.dbo.CH_Acciones_vzt ACC 
	Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
	And	((	@FechaAct					= 1
	And	ACC.Fecha_Fin					< Getdate()-1
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	)
	OR
	(	@FechaAct					= 2
	And	ACC.Fecha_Fin					< Getdate()+30
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	))
	)
	)
	-- --Order by  nr.Codigo, ev.NombreCompleto        
	Order by  ev.idArea, ev.NombreCompleto        

	Select	*
	From	#Previo3
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	

end      
else if @Division = 4      
begin      
	select  distinct ev.id_Recurso_vt,        
	ev.id,        
	ev.Empleado,        
	nomina = isnull(ev.nomina, 0),        
	ev.NombreCompleto,        
	ev.Puesto,        
	ev.Direccion,        
	id_Area = ev.idArea,        
	ev.Area,        
	ev.plaza,        
	ev.Empresa,        
	ev.EmpresaFuente,        
	o.plaza_superior,        
	o.id_nivel_puesto,        
	o.staff,        
	CodigoPlazas = isnull(np.Nivel, 0),        
	SM1    = IsNull(np.SM1, ''),        
	SM2    = IsNull(np.SM2, ''),        
	SM3    = IsNull(np.SM3, ''),        
	Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
	Semaforo  = s.Semaforo,        
	Calificacion = s.Calificacion
	--ev.empresa        
	Into	#Previo4
	from	VT_Organigrama o,        
	#Empleados ev,        
	Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
	Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
	Kiosco.dbo.CH_Semaforos_vzt s        
	where o.estatus = 1        
	and  	o.Publica = 1        
	and  	ev.id_Recurso_vt = o.id_Recurso_vt        
	and  	ev.empresa = o.empresa        
	and  	ev.EmpresaFuente = o.EmpresaFuente        
	--Nivel Plaza        
	and  	np.Empresa =* ev.Empresa        
	and  	np.EmpresaFuente =* ev.EmpresaFuente        
	and  	np.Plaza =* ev.Plaza        
	and  	np.Periodo >= @Periodo        
	--Nivel Recurso        
	-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
	and  	nr.id_recurso_vt = ev.id_recurso_vt        
	and  	nr.Periodo = @Periodo        
	-- Semaforo        
	and  	s.id_recurso_vt =* ev.id_recurso_vt        
	and  	s.Periodo  = Datepart(wk, getdate()-4)         
	and  	s.Anio   = Datepart(yy, getdate()-4)        
	and  	s.Tipo = 0        
	--Filtros    
	and @Entidad in (-1,ev.Entidad)         
	and (ev.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070))      
	and (ev.Empresa not like '%9%')      
	--and  	(ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
	and  	(ev.idDireccion = @Direccion OR @Direccion = -1)        
	and  	(ev.idArea = @Area OR @Area = -1)        
	and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
	and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        


	and  	((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
	OR        
	(o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
	OR         
	(@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
	)        
	and  	(        
	exists (        
	select  1         
	from  #dependientes        
	Where o.Empresa = Empresa        
	and  	o.EmpresaFuente = EmpresaFuente        
	and  	o.Plaza = Plaza        
	)        
	OR @Opcion = 1        

	)        
	-- Actividades
	And	(@FechaAct = -1
	OR
	Exists(	Select	1 
	From	Kiosco.dbo.CH_Acciones_vzt ACC 
	Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
	And	((	@FechaAct					= 1
	And	ACC.Fecha_Fin					< Getdate()-1
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	)
	OR
	(	@FechaAct					= 2
	And	ACC.Fecha_Fin					< Getdate()+30
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	))
	)
	)
	-- --Order by  nr.Codigo, ev.NombreCompleto        
	Order by  ev.idArea, ev.NombreCompleto        

	Select	*
	From	#Previo4
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	

end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_RepDesarrolloEmp_Acciones]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- grant exec on SPQ_CH_RepDesarrolloEmp_Acciones to pinuser 
CREATE Proc [dbo].[SPQ_CH_RepDesarrolloEmp_Acciones]     
	@Division  	int=-1,        
	@Direccion 	int=-1,        
	@Area     	int=-1,        
	@Codigo  	int=-1,        
	@Nombre  	varchar(60)='',        
	@id_recurso_vt 	int,        
	@Periodo 	int,        
	@Opcion  	int=1,        
	@Entidad	int=-1,
	@NivelPlaza	int=-1,
	@FechaAct	int=-1,
	@ID_Formato	int=-1
AS        
    
        
        
SET NOCOUNT ON        

Select * into #Empleados from Organizacion_vzt.dbo.v_EmpleadosVerzatec   
        

If @Codigo < 1   
	Set @Codigo = -1       
	 

--Obtener arbol del usuario por default        
declare @PlazaSuperior int,        
		@EmpresaSuperior int,        
		@EmpresaFuenteSuperior int        

set  @PlazaSuperior =-1        
set  @EmpresaSuperior =-1        
set  @EmpresaFuenteSuperior =-1        
     
if @Opcion = 1        
begin        

	Select  @PlazaSuperior = Plaza,        
			@EmpresaSuperior = Empresa,        
			@EmpresaFuenteSuperior = EmpresaFuente        
	from	vt_Organigrama        
	Where	id_recurso_vt = @id_recurso_vt        
			and  Estatus = 1        
			
end        
    
    
Create Table #Dependientes        
	(Empresa int not null,        
	EmpresaFuente int not null,        
	Plaza  int not null,        
	Nivel int not null,        
	Cadena varchar(1000) not null)        
    
if @Opcion <> 1        
begin        
	-- Validar que las plazas a consultar esten dentro del arbol que tiene permisos         
	-- y que no esten excluidos        
	--  Generar una temporal con todos los arboles a los que tiene permisos        
	--  y excluir las plazas a las que no tenga permisos        
	--  Para despues excluirlas del query de consulta.        
	 insert into #dependientes exec SPQ_CH_GeneraDependenciasPermisos  @id_recurso_vt             
end        


  
if @Division = 1 or @Division = -1       
begin        

	select  distinct ev.id_Recurso_vt,        
		ev.id,        
		ev.Empleado,        
		nomina = isnull(ev.nomina, 0),        
		ev.NombreCompleto,        
		ev.Puesto,        
		ev.Direccion,        
		id_Area = ev.idArea,        
		ev.Area,        
		ev.plaza,        
		ev.Empresa,        
		ev.EmpresaFuente,        
		o.plaza_superior,        
		o.id_nivel_puesto,        
		o.staff,        
		CodigoPlazas = isnull(np.Nivel, 0),        
		SM1    = IsNull(np.SM1, ''),        
		SM2    = IsNull(np.SM2, ''),        
		SM3    = IsNull(np.SM3, ''),        
		Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
		Semaforo  = s.Semaforo,        
		Calificacion = s.Calificacion        
		
		,0 as Desarrollo
		,0 as Desempenio
		,0 as Sucesion
		,0 as Retencion
		
	Into	#Previo1
	from  	VT_Organigrama 		o,    
			#Empleados 			ev,        
			Kiosco.dbo.CH_Nivel_Plaza_vzt 	np,        
			Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
			Kiosco.dbo.CH_Semaforos_vzt 	s        
	where	o.estatus 		= 1        
			and	o.Publica 		= 1        
			and	ev.id_Recurso_vt 	= o.id_Recurso_vt        
			and	ev.empresa 		= o.empresa     
			and	ev.EmpresaFuente 	= o.EmpresaFuente        
			--Nivel Plaza        
			and	np.Empresa 		=* ev.Empresa        
			and	np.EmpresaFuente 	=* ev.EmpresaFuente        
			and	np.Plaza 		=* ev.Plaza        
			and	np.Periodo 		>= @Periodo        
			--Nivel Recurso        
			-- and	nr.id_recurso_vt 	=* ev.id_recurso_vt        
			and	nr.id_recurso_vt 	= ev.id_recurso_vt        
			and	nr.Periodo 		= @Periodo        
			-- Semaforo        
			and	s.id_recurso_vt 	=* ev.id_recurso_vt        
			and	s.Periodo  		= Datepart(wk, getdate()-4)         
			and	s.Anio   		= Datepart(yy, getdate()-4)        
			and	s.Tipo 			= 0        
			--Filtros        
			--and	(ev.idDivision 		= @Division 	OR @Division 	= -1 or @Division = 1)        
			and	(ev.idDireccion 	= @Direccion 	OR @Direccion 	= -1)        
			and	(ev.idArea 		= @Area 	OR @Area 	= -1)        
			and	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
			and	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        


			and	((	o.Plaza_Superior	= @PlazaSuperior 
			and 	o.Empresa_Superior 	= @EmpresaSuperior 
			and 	o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
			OR        
			(	o.Plaza 		= @PlazaSuperior 
			and 	o.Empresa 		= @EmpresaSuperior 
			and 	o.EmpresaFuente 	= @EmpresaFuenteSuperior )        
			OR         
			(	@PlazaSuperior		= -1 
			AND 	@EmpresaSuperior	= -1 
			AND 	@EmpresaFuenteSuperior	= -1)        
			)        
			and	(exists (	select  1         
			from  	#dependientes        
			Where 	o.Empresa 	= Empresa        
			and	o.EmpresaFuente = EmpresaFuente        
			and	o.Plaza 	= Plaza        
			)        
			OR 	@Opcion = 1        

			)
			-- Actividades
			And	(@FechaAct = -1
			OR
			Exists(	Select	1 
			From	Kiosco.dbo.CH_Acciones_vzt ACC 
			Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
			And	((	@FechaAct					= 1
			And	ACC.Fecha_Fin					< Getdate()-1
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			)
			OR
			(	@FechaAct					= 2
			And	ACC.Fecha_Fin					< Getdate()+30
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			))
			)
			)
	   

	------------------ Ini Acciones ------------------
	update	#Previo1
	set		Desarrollo = 1 
	from	#Previo1 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 2
	
	update	#Previo1
	set		Desempenio = 1 
	from	#Previo1 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 1
	
	update	#Previo1
	set		Sucesion = 1
	from	#Previo1 p, Kiosco.dbo.ch_AccionesSucesion_vzt a
	where	p.Empresa = a.Empresa and
			p.EmpresaFuente = a.EmpresaFuente and
			p.Plaza = a.Plaza and
			a.Periodo = @Periodo
			
	update	#Previo1
	set		Retencion = 1 
	from	#Previo1 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 4
	------------------ Fin Acciones ------------------
	
	

	Select	*
	From	#Previo1
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	
	order by id_Area, NombreCompleto
	
end      
else if @Division = 2      
begin     
 
	select  distinct ev.id_Recurso_vt,        
			ev.id,        
			ev.Empleado,        
			nomina = isnull(ev.nomina, 0),        
			ev.NombreCompleto,        
			ev.Puesto,        
			ev.Direccion,        
			id_Area = ev.idArea,        
			ev.Area,        
			ev.plaza,        
			ev.Empresa,        
			ev.EmpresaFuente,        
			o.plaza_superior,        
			o.id_nivel_puesto,        
			o.staff,        
			CodigoPlazas = isnull(np.Nivel, 0),        
			SM1    = IsNull(np.SM1, ''),        
			SM2    = IsNull(np.SM2, ''),        
			SM3    = IsNull(np.SM3, ''),        
			Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
			Semaforo  = s.Semaforo,        
			Calificacion = s.Calificacion 
			
			,0 as Desarrollo
			,0 as Desempenio
			,0 as Sucesion
			,0 as Retencion      
			--ev.empresa        
	Into	#Previo2
	from  	VT_Organigrama			o,        
			#Empleados 			ev,        
			Kiosco.dbo.CH_Nivel_Plaza_vzt 	np,        
			Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
			Kiosco.dbo.CH_Semaforos_vzt 	s        
	where 	o.estatus 		= 1        
			and  	o.Publica 		= 1        
			and  	ev.id_Recurso_vt 	= o.id_Recurso_vt        
			and  	ev.empresa 		= o.empresa        
			and  	ev.EmpresaFuente 	= o.EmpresaFuente        
			--Nivel Plaza        
			and  	np.Empresa 		=* ev.Empresa        
			and  	np.EmpresaFuente 	=* ev.EmpresaFuente        
			and  	np.Plaza 		=* ev.Plaza        
			and  	np.Periodo 		>= @Periodo        
			--Nivel Recurso        
			-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
			and  	nr.id_recurso_vt 	= ev.id_recurso_vt        
			and  	nr.Periodo 		= @Periodo        
			-- Semaforo        
			and  	s.id_recurso_vt 	=* ev.id_recurso_vt        
			and  	s.Periodo  		= Datepart(wk, getdate()-4)         
			and  	s.Anio   		= Datepart(yy, getdate()-4)        
			and  	s.Tipo 			= 0        
			--Filtros    
			and	@Entidad 		in (-1,ev.Entidad)         
			and 	(ev.Entidad 		in (1301,2050,2041,2042,1110,1100,1000,1200,1400,1500,5000,0))      
			--and  	(ev.idDivision 		= @Division 	OR @Division 	= -1 or @Division = 1)        
			and  	(ev.idDireccion 	= @Direccion 	OR @Direccion 	= -1)        
			and  	(ev.idArea 		= @Area 	OR @Area 	= -1)        
			and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
			and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        

			and  	((	o.Plaza_Superior		= @PlazaSuperior 
			and 	o.Empresa_Superior 		= @EmpresaSuperior 
			and 	o.EmpresaFuente_Superior 	= @EmpresaFuenteSuperior)        
			OR        
			(	o.Plaza 			= @PlazaSuperior 
			and 	o.Empresa 			= @EmpresaSuperior 
			and 	o.EmpresaFuente 		= @EmpresaFuenteSuperior )        
			OR         
			(	@PlazaSuperior			= -1 
			AND 	@EmpresaSuperior		= -1 
			AND 	@EmpresaFuenteSuperior		= -1)
			)        
			and  	(exists(	select  1         
			from  	#dependientes        
			Where 	o.Empresa 	= Empresa        
			and  	o.EmpresaFuente = EmpresaFuente        
			and  	o.Plaza 	= Plaza        
			)        
			OR @Opcion = 1        
			)        
			-- Actividades
			And	(@FechaAct = -1
			OR
			Exists(	Select	1 
			From	Kiosco.dbo.CH_Acciones_vzt ACC 
			Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
			And	((	@FechaAct					= 1
			And	ACC.Fecha_Fin					< Getdate()-1
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			)
			OR
			(	@FechaAct					= 2
			And	ACC.Fecha_Fin					< Getdate()+30
			And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
			And	@ID_Formato					IN (-1, ACC.ID_Formato)
			And	ACC.Periodo					= @Periodo			
			))
			)
			)
	
	
	
	------------------ Ini Acciones ------------------
	update	#Previo2
	set		Desarrollo = 1 
	from	#Previo2 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 2
	
	update	#Previo2
	set		Desempenio = 1 
	from	#Previo2 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 1
	
	update	#Previo2
	set		Sucesion = 1
	from	#Previo2 p, Kiosco.dbo.ch_AccionesSucesion_vzt a
	where	p.Empresa = a.Empresa and
			p.EmpresaFuente = a.EmpresaFuente and
			p.Plaza = a.Plaza and
			a.Periodo = @Periodo
			
	update	#Previo2
	set		Retencion = 1 
	from	#Previo2 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 4
	------------------ Fin Acciones ------------------  

	Select	*
	From	#Previo2
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	
	order by id_Area, NombreCompleto
	
end      
else if @Division = 3      
begin      

	select  distinct ev.id_Recurso_vt,        
	ev.id,        
	ev.Empleado,        
	nomina = isnull(ev.nomina, 0),        
	ev.NombreCompleto,        
	ev.Puesto,        
	ev.Direccion,        
	id_Area = ev.idArea,        
	ev.Area,        
	ev.plaza,        
	ev.Empresa,        
	ev.EmpresaFuente,        
	o.plaza_superior,        
	o.id_nivel_puesto,        
	o.staff,        
	CodigoPlazas = isnull(np.Nivel, 0),        
	SM1    = IsNull(np.SM1, ''),        
	SM2    = IsNull(np.SM2, ''),        
	SM3    = IsNull(np.SM3, ''),        
	Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
	Semaforo  = s.Semaforo,        
	Calificacion = s.Calificacion
	
	,0 as Desarrollo
	,0 as Desempenio
	,0 as Sucesion
	,0 as Retencion
	--ev.empresa        
	Into	#Previo3
	from	VT_Organigrama o,        
	#Empleados ev,        
	Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
	Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
	Kiosco.dbo.CH_Semaforos_vzt s        
	where o.estatus = 1        
	and  	o.Publica = 1        
	and  	ev.id_Recurso_vt = o.id_Recurso_vt        
	and  	ev.empresa = o.empresa        
	and  	ev.EmpresaFuente = o.EmpresaFuente        
	--Nivel Plaza        
	and  	np.Empresa =* ev.Empresa        
	and  	np.EmpresaFuente =* ev.EmpresaFuente        
	and  	np.Plaza =* ev.Plaza        
	and  	np.Periodo >= @Periodo        
	--Nivel Recurso        
	-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
	and  	nr.id_recurso_vt = ev.id_recurso_vt        
	and  	nr.Periodo = @Periodo        
	-- Semaforo        
	and  	s.id_recurso_vt =* ev.id_recurso_vt        
	and  	s.Periodo  = Datepart(wk, getdate()-4)         
	and  	s.Anio   = Datepart(yy, getdate()-4)        
	and  	s.Tipo = 0        
	--Filtros        
	and @Entidad in (-1,ev.Entidad)     
	and (ev.Entidad in (4020))      
	--and  	(ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
	and  	(ev.idDireccion = @Direccion OR @Direccion = -1)        
	and  	(ev.idArea = @Area OR @Area = -1)        
	and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
	and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        


	and  	((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
	OR        
	(o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
	OR         
	(@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
	)        
	and  	(        
	exists (        
	select  1         
	from  #dependientes        
	Where o.Empresa = Empresa      
	and  	o.EmpresaFuente = EmpresaFuente        
	and  	o.Plaza = Plaza        
	)        
	OR @Opcion = 1        

	)        
	-- Actividades
	And	(@FechaAct = -1
	OR
	Exists(	Select	1 
	From	Kiosco.dbo.CH_Acciones_vzt ACC 
	Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
	And	((	@FechaAct					= 1
	And	ACC.Fecha_Fin					< Getdate()-1
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	)
	OR
	(	@FechaAct					= 2
	And	ACC.Fecha_Fin					< Getdate()+30
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	))
	)
	)
	    

	------------------ Ini Acciones ------------------
	update	#Previo3
	set		Desarrollo = 1 
	from	#Previo3 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 2
	
	update	#Previo3
	set		Desempenio = 1 
	from	#Previo3 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 1
	
	update	#Previo3
	set		Sucesion = 1
	from	#Previo3 p, Kiosco.dbo.ch_AccionesSucesion_vzt a
	where	p.Empresa = a.Empresa and
			p.EmpresaFuente = a.EmpresaFuente and
			p.Plaza = a.Plaza and
			a.Periodo = @Periodo
			
	update	#Previo3
	set		Retencion = 1 
	from	#Previo3 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 4
	------------------ Fin Acciones ------------------

	Select	*
	From	#Previo3
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	
	order by id_Area, NombreCompleto

end      
else if @Division = 4      
begin      

	select  distinct ev.id_Recurso_vt,        
	ev.id,        
	ev.Empleado,        
	nomina = isnull(ev.nomina, 0),        
	ev.NombreCompleto,        
	ev.Puesto,        
	ev.Direccion,        
	id_Area = ev.idArea,        
	ev.Area,        
	ev.plaza,        
	ev.Empresa,        
	ev.EmpresaFuente,        
	o.plaza_superior,        
	o.id_nivel_puesto,        
	o.staff,        
	CodigoPlazas = isnull(np.Nivel, 0),        
	SM1    = IsNull(np.SM1, ''),        
	SM2    = IsNull(np.SM2, ''),        
	SM3    = IsNull(np.SM3, ''),        
	Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
	Semaforo  = s.Semaforo,        
	Calificacion = s.Calificacion
	
	,0 as Desarrollo
	,0 as Desempenio
	,0 as Sucesion
	,0 as Retencion
		
	--ev.empresa        
	Into	#Previo4
	from	VT_Organigrama o,        
	#Empleados ev,        
	Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
	Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
	Kiosco.dbo.CH_Semaforos_vzt s        
	where o.estatus = 1        
	and  	o.Publica = 1        
	and  	ev.id_Recurso_vt = o.id_Recurso_vt        
	and  	ev.empresa = o.empresa        
	and  	ev.EmpresaFuente = o.EmpresaFuente        
	--Nivel Plaza        
	and  	np.Empresa =* ev.Empresa        
	and  	np.EmpresaFuente =* ev.EmpresaFuente        
	and  	np.Plaza =* ev.Plaza        
	and  	np.Periodo >= @Periodo        
	--Nivel Recurso        
	-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
	and  	nr.id_recurso_vt = ev.id_recurso_vt        
	and  	nr.Periodo = @Periodo        
	-- Semaforo        
	and  	s.id_recurso_vt =* ev.id_recurso_vt        
	and  	s.Periodo  = Datepart(wk, getdate()-4)         
	and  	s.Anio   = Datepart(yy, getdate()-4)        
	and  	s.Tipo = 0        
	--Filtros    
	and @Entidad in (-1,ev.Entidad)         
	and (ev.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070))      
	and (ev.Empresa not like '%9%')      
	--and  	(ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
	and  	(ev.idDireccion = @Direccion OR @Direccion = -1)        
	and  	(ev.idArea = @Area OR @Area = -1)        
	and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
	and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        


	and  	((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
	OR        
	(o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
	OR         
	(@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
	)        
	and  	(        
	exists (        
	select  1         
	from  #dependientes        
	Where o.Empresa = Empresa        
	and  	o.EmpresaFuente = EmpresaFuente        
	and  	o.Plaza = Plaza        
	)        
	OR @Opcion = 1        

	)        
	-- Actividades
	And	(@FechaAct = -1
	OR
	Exists(	Select	1 
	From	Kiosco.dbo.CH_Acciones_vzt ACC 
	Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
	And	((	@FechaAct					= 1
	And	ACC.Fecha_Fin					< Getdate()-1
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	)
	OR
	(	@FechaAct					= 2
	And	ACC.Fecha_Fin					< Getdate()+30
	And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
	And	@ID_Formato					IN (-1, ACC.ID_Formato)
	And	ACC.Periodo					= @Periodo			
	))
	)
	)
	       


	------------------ Ini Acciones ------------------
	update	#Previo4
	set		Desarrollo = 1 
	from	#Previo4 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 2
	
	update	#Previo4
	set		Desempenio = 1 
	from	#Previo4 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 1
	
	update	#Previo4
	set		Sucesion = 1
	from	#Previo4 p, Kiosco.dbo.ch_AccionesSucesion_vzt a
	where	p.Empresa = a.Empresa and
			p.EmpresaFuente = a.EmpresaFuente and
			p.Plaza = a.Plaza and
			a.Periodo = @Periodo
			
	update	#Previo4
	set		Retencion = 1 
	from	#Previo4 p, Kiosco.dbo.CH_Acciones_vzt a
	where	p.id_recurso_vt = a.id_recurso_vt and
			a.periodo = @Periodo and
			a.Id_Formato = 4
	------------------ Fin Acciones ------------------

	Select	*
	From	#Previo4
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	
	order by id_Area, NombreCompleto

end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_RepDesarrolloEmp_AGG]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- grant exec on SPQ_CH_RepDesarrolloEmp to pinuser         
CREATE	Proc [dbo].[SPQ_CH_RepDesarrolloEmp_AGG]        
	@Division  	int=-1,        
	@Direccion 	int=-1,        
	@Area     	int=-1,        
	@Codigo  	int=-1,        
	@Nombre  	varchar(60)='',        
	@id_recurso_vt 	int,        
	@Periodo 	int,        
	@Opcion  	int=1,        
	@Entidad	int=-1,
	@NivelPlaza	int=-1,
	@FechaAct	int=-1,
	@ID_Formato	int=-1
AS        
        
-- ---------------TEST        
-- --exec SPQ_CH_RepDesarrolloEmp -1, -1, -1, 0.5, 'Monsivais', 1942, 2007,0         
--         
-- Declare @Division  int,        
--   @Direccion int,        
--   @Area  int,        
--   @Codigo   int,        
--   @Nombre   varchar(80),        
--   @id_recurso_vt int,        
--   @Periodo  int,        
--   @Opcion   int        
--         
-- Set @Division  = -1        
-- Set @Direccion = 1000 ---1        
-- Set @Area = -1        
-- Set @Codigo  = -1        
-- Set @Nombre  =''        
--  set @id_recurso_vt = 1942 -- 2543 --Marco Medellin        
-- set @Periodo = 2007        
-- set @Opcion = 0        
--         
--  drop table #Dependientes        
--         
-- -- -- ---------TEST---------------        
        
        
SET NOCOUNT ON        
Select * into #Empleados from Organizacion_vzt.dbo.v_EmpleadosVerzatec   
        
 If @Codigo < 1        
  Set @Codigo = -1        
         
 --Obtener arbol del usuario por default        
 declare  @PlazaSuperior int,        
    @EmpresaSuperior int,        
    @EmpresaFuenteSuperior int        
         
 set  @PlazaSuperior =-1        
 set  @EmpresaSuperior =-1        
 set  @EmpresaFuenteSuperior =-1        
         
 if @Opcion = 1        
 begin        
   Select  @PlazaSuperior = Plaza,        
     @EmpresaSuperior = Empresa,        
     @EmpresaFuenteSuperior = EmpresaFuente        
   from vt_Organigrama        
   Where id_recurso_vt = @id_recurso_vt        
   and  Estatus = 1        
 end        
        
        
 set nocount on        
 Create  Table #Dependientes        
            (Empresa int not null,        
       EmpresaFuente int not null,        
       Plaza  int not null,        
             Nivel int not null,        
             Cadena varchar(1000) not null)        
        
if @Opcion <> 1        
begin        
-- Validar que las plazas a consultar esten dentro del arbol que tiene permisos         
-- y que no esten excluidos        
--  Generar una temporal con todos los arboles a los que tiene permisos        
--  y excluir las plazas a las que no tenga permisos        
--  Para despues excluirlas del query de consulta.        
 insert into #dependientes exec SPQ_CH_GeneraDependenciasPermisos  @id_recurso_vt        
-----        
end        
      
if @Division = 1 or @Division = -1       
begin        
	select  distinct ev.id_Recurso_vt,        
		ev.id,        
		ev.Empleado,        
		nomina = isnull(ev.nomina, 0),        
		ev.NombreCompleto,        
		ev.Puesto,        
		ev.Direccion,        
		id_Area = ev.idArea,        
		ev.Area,        
		ev.plaza,        
		ev.Empresa,        
		ev.EmpresaFuente,        
		o.plaza_superior,        
		o.id_nivel_puesto,        
		o.staff,        
		CodigoPlazas = isnull(np.Nivel, 0),        
		SM1    = IsNull(np.SM1, ''),        
		SM2    = IsNull(np.SM2, ''),        
		SM3    = IsNull(np.SM3, ''),        
		Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
		Semaforo  = s.Semaforo,        
		Calificacion = s.Calificacion        
		--ev.empresa        
	Into	#Previo1
	from  	VT_Organigrama 			o,        
		#Empleados 			ev,        
		Kiosco.dbo.CH_Nivel_Plaza_vzt 	np,        
		Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
		Kiosco.dbo.CH_Semaforos_vzt 	s        
	where	o.estatus 		= 1        
	and	o.Publica 		= 1        
	and	ev.id_Recurso_vt 	= o.id_Recurso_vt        
	and	ev.empresa 		= o.empresa        
	and	ev.EmpresaFuente 	= o.EmpresaFuente        
	--Nivel Plaza        
	and	np.Empresa 		=* ev.Empresa        
	and	np.EmpresaFuente 	=* ev.EmpresaFuente        
	and	np.Plaza 		=* ev.Plaza        
	and	np.Periodo 		>= @Periodo        
	--Nivel Recurso        
	-- and	nr.id_recurso_vt 	=* ev.id_recurso_vt        
	and	nr.id_recurso_vt 	= ev.id_recurso_vt        
	and	nr.Periodo 		= @Periodo        
	-- Semaforo        
	and	s.id_recurso_vt 	=* ev.id_recurso_vt        
	and	s.Periodo  		= Datepart(wk, getdate()-4)         
	and	s.Anio   		= Datepart(yy, getdate()-4)        
	and	s.Tipo 			= 0        
	--Filtros        
	--and	(ev.idDivision 		= @Division 	OR @Division 	= -1 or @Division = 1)        
	and	(ev.idDireccion 	= @Direccion 	OR @Direccion 	= -1)        
	and	(ev.idArea 		= @Area 	OR @Area 	= -1)        
	and	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
	and	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        

	
	and	((	o.Plaza_Superior	= @PlazaSuperior 
		  and 	o.Empresa_Superior 	= @EmpresaSuperior 
		  and 	o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
		OR        
		 (	o.Plaza 		= @PlazaSuperior 
		  and 	o.Empresa 		= @EmpresaSuperior 
		  and 	o.EmpresaFuente 	= @EmpresaFuenteSuperior )        
		OR         
		 (	@PlazaSuperior		= -1 
		  AND 	@EmpresaSuperior	= -1 
		  AND 	@EmpresaFuenteSuperior	= -1)        
		)        
	and	(exists (	select  *         
				from  	#dependientes        
				Where 	o.Empresa 	= Empresa        
				and	o.EmpresaFuente = EmpresaFuente        
				and	o.Plaza 	= Plaza        
			)        
		OR 	@Opcion = 1        
	
		)
	-- Actividades
	And	(@FechaAct = -1
		OR
		Exists(	Select	* 
			From	Kiosco.dbo.CH_Acciones_vzt ACC 
			Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
			And	((	@FechaAct					= 1
				 And	ACC.Fecha_Fin					< Getdate()-1
				 And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
				 And	@ID_Formato					IN (-1, ACC.ID_Formato)
				 And	ACC.Periodo					= @Periodo			
				)
				OR
				(	@FechaAct					= 2
				 And	ACC.Fecha_Fin					< Getdate()+30
				 And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
				 And	@ID_Formato					IN (-1, ACC.ID_Formato)
				 And	ACC.Periodo					= @Periodo			
				))
			)
		)
	--Order by  nr.Codigo, ev.NombreCompleto        
	Order by  ev.idArea, ev.NombreCompleto        

	
	Select	*
	From	#Previo1
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	
end      
else if @Division = 2      
begin      
	select  distinct ev.id_Recurso_vt,        
		ev.id,        
		ev.Empleado,        
		nomina = isnull(ev.nomina, 0),        
		ev.NombreCompleto,        
		ev.Puesto,        
		ev.Direccion,        
		id_Area = ev.idArea,        
		ev.Area,        
		ev.plaza,        
		ev.Empresa,        
		ev.EmpresaFuente,        
		o.plaza_superior,        
		o.id_nivel_puesto,        
		o.staff,        
		CodigoPlazas = isnull(np.Nivel, 0),        
		SM1    = IsNull(np.SM1, ''),        
		SM2    = IsNull(np.SM2, ''),        
		SM3    = IsNull(np.SM3, ''),        
		Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
		Semaforo  = s.Semaforo,        
		Calificacion = s.Calificacion        
		--ev.empresa        
	Into	#Previo2
	from  	VT_Organigrama			o,        
		#Empleados 			ev,        
		Kiosco.dbo.CH_Nivel_Plaza_vzt 	np,        
		Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
		Kiosco.dbo.CH_Semaforos_vzt 	s        
	where 	o.estatus 		= 1        
	and  	o.Publica 		= 1        
	and  	ev.id_Recurso_vt 	= o.id_Recurso_vt        
	and 	ev.empresa 		= o.empresa        
	and  	ev.EmpresaFuente 	= o.EmpresaFuente        
	--Nivel Plaza        
	and  	np.Empresa 		=* ev.Empresa        
	and  	np.EmpresaFuente 	=* ev.EmpresaFuente        
	and  	np.Plaza 		=* ev.Plaza        
	and  	np.Periodo 		>= @Periodo        
	--Nivel Recurso        
	-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
	and  	nr.id_recurso_vt 	= ev.id_recurso_vt        
	and  	nr.Periodo 		= @Periodo        
	-- Semaforo        
	and  	s.id_recurso_vt 	=* ev.id_recurso_vt        
	and  	s.Periodo  		= Datepart(wk, getdate()-4)         
	and  	s.Anio   		= Datepart(yy, getdate()-4)        
	and  	s.Tipo 			= 0        
	--Filtros    
	and	@Entidad 		in (-1,ev.Entidad)         
	and 	(ev.Entidad 		in (1301,2050,2041,2042,1110,1100,1000,1200,1400,1500,5000,0))      
	--and  	(ev.idDivision 		= @Division 	OR @Division 	= -1 or @Division = 1)        
	and  	(ev.idDireccion 	= @Direccion 	OR @Direccion 	= -1)        
	and  	(ev.idArea 		= @Area 	OR @Area 	= -1)        
	and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
	and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        
	
	and  	((	o.Plaza_Superior		= @PlazaSuperior 
		  and 	o.Empresa_Superior 		= @EmpresaSuperior 
		  and 	o.EmpresaFuente_Superior 	= @EmpresaFuenteSuperior)        
		OR        
	 	 (	o.Plaza 			= @PlazaSuperior 
		  and 	o.Empresa 			= @EmpresaSuperior 
		  and 	o.EmpresaFuente 		= @EmpresaFuenteSuperior )        
		OR         
		 (	@PlazaSuperior			= -1 
		  AND 	@EmpresaSuperior		= -1 
		  AND 	@EmpresaFuenteSuperior		= -1)
		)        
	and  	(exists(	select  *         
				from  	#dependientes        
				Where 	o.Empresa 	= Empresa        
				and  	o.EmpresaFuente = EmpresaFuente        
				and  	o.Plaza 	= Plaza        
			)        
		OR @Opcion = 1        
	 	)        
	-- Actividades
	And	(@FechaAct = -1
		OR
		Exists(	Select	* 
			From	Kiosco.dbo.CH_Acciones_vzt ACC 
			Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
			And	((	@FechaAct					= 1
				 And	ACC.Fecha_Fin					< Getdate()-1
				 And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
				 And	@ID_Formato					IN (-1, ACC.ID_Formato)
				 And	ACC.Periodo					= @Periodo			
				)
				OR
				(	@FechaAct					= 2
				 And	ACC.Fecha_Fin					< Getdate()+30
				 And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
				 And	@ID_Formato					IN (-1, ACC.ID_Formato)
				 And	ACC.Periodo					= @Periodo			
				))
			)
		)
	-- --Order by  nr.Codigo, ev.NombreCompleto        
	Order by  ev.idArea, ev.NombreCompleto        

	Select	*
	From	#Previo2
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	

end      
else if @Division = 3      
begin      
 select  distinct ev.id_Recurso_vt,        
   ev.id,        
   ev.Empleado,        
   nomina = isnull(ev.nomina, 0),        
   ev.NombreCompleto,        
   ev.Puesto,        
   ev.Direccion,        
   id_Area = ev.idArea,        
   ev.Area,        
   ev.plaza,        
   ev.Empresa,        
   ev.EmpresaFuente,        
   o.plaza_superior,        
   o.id_nivel_puesto,        
   o.staff,        
   CodigoPlazas = isnull(np.Nivel, 0),        
   SM1    = IsNull(np.SM1, ''),        
   SM2    = IsNull(np.SM2, ''),        
   SM3    = IsNull(np.SM3, ''),        
   Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
   Semaforo  = s.Semaforo,        
   Calificacion = s.Calificacion
   --ev.empresa        
Into	#Previo3
from	VT_Organigrama o,        
    #Empleados ev,        
   Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
   Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
   Kiosco.dbo.CH_Semaforos_vzt s        
 where o.estatus = 1        
 and  	o.Publica = 1        
 and  	ev.id_Recurso_vt = o.id_Recurso_vt        
 and  	ev.empresa = o.empresa        
 and  	ev.EmpresaFuente = o.EmpresaFuente        
 --Nivel Plaza        
and  	np.Empresa =* ev.Empresa        
 and  	np.EmpresaFuente =* ev.EmpresaFuente        
 and  	np.Plaza =* ev.Plaza        
 and  	np.Periodo >= @Periodo        
 --Nivel Recurso        
-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
 and  	nr.id_recurso_vt = ev.id_recurso_vt        
 and  	nr.Periodo = @Periodo        
 -- Semaforo        
 and  	s.id_recurso_vt =* ev.id_recurso_vt        
 and  	s.Periodo  = Datepart(wk, getdate()-4)         
 and  	s.Anio   = Datepart(yy, getdate()-4)        
 and  	s.Tipo = 0        
 --Filtros        
and @Entidad in (-1,ev.Entidad)     
and (ev.Entidad in (4020))      
 --and  	(ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
 and  	(ev.idDireccion = @Direccion OR @Direccion = -1)        
 and  	(ev.idArea = @Area OR @Area = -1)        
 and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
 and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        

        
 and  	((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
   OR        
   (o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
   OR         
   (@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
   )        
 and  	(        
   exists (        
     select  *         
     from  #dependientes        
     Where o.Empresa = Empresa      
     and  	o.EmpresaFuente = EmpresaFuente        
     and  	o.Plaza = Plaza        
     )        
   OR @Opcion = 1        
        
   )        
	-- Actividades
	And	(@FechaAct = -1
		OR
		Exists(	Select	* 
			From	Kiosco.dbo.CH_Acciones_vzt ACC 
			Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
			And	((	@FechaAct					= 1
				 And	ACC.Fecha_Fin					< Getdate()-1
				 And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
				 And	@ID_Formato					IN (-1, ACC.ID_Formato)
				 And	ACC.Periodo					= @Periodo			
				)
				OR
				(	@FechaAct					= 2
				 And	ACC.Fecha_Fin					< Getdate()+30
				 And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
				 And	@ID_Formato					IN (-1, ACC.ID_Formato)
				 And	ACC.Periodo					= @Periodo			
				))
			)
		)
-- --Order by  nr.Codigo, ev.NombreCompleto        
Order by  ev.idArea, ev.NombreCompleto        

	Select	*
	From	#Previo3
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	

end      
else if @Division = 4      
begin      
 select  distinct ev.id_Recurso_vt,        
   ev.id,        
   ev.Empleado,        
   nomina = isnull(ev.nomina, 0),        
   ev.NombreCompleto,        
   ev.Puesto,        
   ev.Direccion,        
   id_Area = ev.idArea,        
   ev.Area,        
   ev.plaza,        
   ev.Empresa,        
   ev.EmpresaFuente,        
   o.plaza_superior,        
   o.id_nivel_puesto,        
   o.staff,        
   CodigoPlazas = isnull(np.Nivel, 0),        
   SM1    = IsNull(np.SM1, ''),        
   SM2    = IsNull(np.SM2, ''),        
   SM3    = IsNull(np.SM3, ''),        
   Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,        
   Semaforo  = s.Semaforo,        
   Calificacion = s.Calificacion
   --ev.empresa        
Into	#Previo4
from	VT_Organigrama o,        
    #Empleados ev,        
   Kiosco.dbo.CH_Nivel_Plaza_vzt np,        
   Kiosco.dbo.CH_Nivel_Recurso_vzt nr,        
   Kiosco.dbo.CH_Semaforos_vzt s        
 where o.estatus = 1        
 and  	o.Publica = 1        
 and  	ev.id_Recurso_vt = o.id_Recurso_vt        
 and  	ev.empresa = o.empresa        
 and  	ev.EmpresaFuente = o.EmpresaFuente        
 --Nivel Plaza        
 and  	np.Empresa =* ev.Empresa        
 and  	np.EmpresaFuente =* ev.EmpresaFuente        
 and  	np.Plaza =* ev.Plaza        
 and  	np.Periodo >= @Periodo        
 --Nivel Recurso        
-- and  	nr.id_recurso_vt =* ev.id_recurso_vt        
 and  	nr.id_recurso_vt = ev.id_recurso_vt        
 and  	nr.Periodo = @Periodo        
 -- Semaforo        
 and  	s.id_recurso_vt =* ev.id_recurso_vt        
 and  	s.Periodo  = Datepart(wk, getdate()-4)         
 and  	s.Anio   = Datepart(yy, getdate()-4)        
 and  	s.Tipo = 0        
 --Filtros    
and @Entidad in (-1,ev.Entidad)         
and (ev.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070))      
and (ev.Empresa not like '%9%')      
 --and  	(ev.idDivision = @Division OR @Division = -1 or @Division = 1)        
 and  	(ev.idDireccion = @Direccion OR @Direccion = -1)        
 and  	(ev.idArea = @Area OR @Area = -1)        
 and  	ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'        
 and  	(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)        

        
 and  	((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)        
   OR        
   (o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )        
   OR         
   (@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)        
   )        
 and  	(        
   exists (        
     select  *         
     from  #dependientes        
     Where o.Empresa = Empresa        
     and  	o.EmpresaFuente = EmpresaFuente        
     and  	o.Plaza = Plaza        
     )        
   OR @Opcion = 1        
        
   )        
	-- Actividades
	And	(@FechaAct = -1
		OR
		Exists(	Select	* 
			From	Kiosco.dbo.CH_Acciones_vzt ACC 
			Where	ACC.ID_Recurso_vt			= O.ID_Recurso_vt 
			And	((	@FechaAct					= 1
				 And	ACC.Fecha_Fin					< Getdate()-1
				 And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
				 And	@ID_Formato					IN (-1, ACC.ID_Formato)
				 And	ACC.Periodo					= @Periodo			
				)
				OR
				(	@FechaAct					= 2
				 And	ACC.Fecha_Fin					< Getdate()+30
				 And	Kiosco.dbo.fnAvanceAccion(ACC.ID_Accion)	< 100
				 And	@ID_Formato					IN (-1, ACC.ID_Formato)
				 And	ACC.Periodo					= @Periodo			
				))
			)
		)
-- --Order by  nr.Codigo, ev.NombreCompleto        
Order by  ev.idArea, ev.NombreCompleto        

	Select	*
	From	#Previo4
	Where	(@NivelPlaza	= -1 OR CodigoPlazas = @NivelPlaza)	

end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_RepDesarrolloEmp_cpvc_270109]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Objetivo:	Consultar Reporte de Desarrollo del personal
			Capital Humano
Creado por:	Jaime Sánchez
Fecha:		18-Sept-2007
-- -- grant exec on SPQ_CH_RepDesarrolloEmp to pinuser 
*/
Create	Proc [dbo].[SPQ_CH_RepDesarrolloEmp_cpvc_270109]
	@Division 	int=-1,
	@Direccion	int=-1,
	@Area	    int=-1,
	@Codigo		int=-1,
	@Nombre		varchar(60)='',
	@id_recurso_vt	int,
	@Periodo	int,
	@Opcion 	int=1
AS

-- ---------------TEST
-- --exec SPQ_CH_RepDesarrolloEmp -1, -1, -1, 0.5, 'Monsivais', 1942, 2007,0 
-- 
-- Declare	@Division		int,
-- 		@Direccion	int,
-- 		@Area		int,
-- 		@Codigo			int,
-- 		@Nombre			varchar(80),
-- 		@id_recurso_vt	int,
-- 		@Periodo		int,
-- 		@Opcion 		int
-- 
-- Set	@Division 	= -1
-- Set	@Direccion	= 1000 ---1
-- Set	@Area	= -1
-- Set	@Codigo		= -1
-- Set	@Nombre		=''
--  set	@id_recurso_vt	= 1942 -- 2543 --Marco Medellin
-- set	@Periodo = 2007
-- set	@Opcion = 0
-- 
--  drop table #Dependientes
-- 
-- -- -- ---------TEST---------------


SET NOCOUNT ON


	If @Codigo < 1
		Set	@Codigo = -1
	
	--Obtener arbol del usuario por default
	declare		@PlazaSuperior int,
				@EmpresaSuperior int,
				@EmpresaFuenteSuperior int
	
	set		@PlazaSuperior =-1
	set		@EmpresaSuperior =-1
	set		@EmpresaFuenteSuperior =-1
	
	if @Opcion = 1
	begin
			Select 	@PlazaSuperior = Plaza,
					@EmpresaSuperior = Empresa,
					@EmpresaFuenteSuperior = EmpresaFuente
			from	vt_Organigrama
			Where	id_recurso_vt = @id_recurso_vt
			and		Estatus = 1
	end


	set nocount on
	Create  Table #Dependientes
            (Empresa int not null,
		     EmpresaFuente int not null,
		     Plaza  int not null,
             Nivel int not null,
             Cadena varchar(1000) not null)

if @Opcion <> 1
begin
--	Validar que las plazas a consultar esten dentro del arbol que tiene permisos 
--	y que no esten excluidos
-- 	Generar una temporal con todos los arboles a los que tiene permisos
-- 	y excluir las plazas a las que no tenga permisos
-- 	Para despues excluirlas del query de consulta.
	insert into #dependientes exec SPQ_CH_GeneraDependenciasPermisos  @id_recurso_vt
-----
end

	select 	distinct ev.id_Recurso_vt,
			ev.id,
			ev.Empleado,
			nomina = isnull(ev.nomina, 0),
			ev.NombreCompleto,
			ev.Puesto,
			ev.Direccion,
			id_Area = ev.idArea,
			ev.Area,
			ev.plaza,
			ev.Empresa,
			ev.EmpresaFuente,
			o.plaza_superior,
			o.id_nivel_puesto,
			o.staff,
			CodigoPlazas	= isnull(np.Nivel, 0),
			SM1				= IsNull(np.SM1, ''),
			SM2				= IsNull(np.SM2, ''),
			SM3				= IsNull(np.SM3, ''),
			Codigo			= IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,
			Semaforo		= s.Semaforo,
			Calificacion	= s.Calificacion,
			ev.empresa
	from 	VT_Organigrama o,
	 		v_EmpleadosVerzatec ev,
			Kiosco.dbo.CH_Nivel_Plaza_vzt	np,
			Kiosco.dbo.CH_Nivel_Recurso_vzt	nr,
			Kiosco.dbo.CH_Semaforos_vzt	s
	where	o.estatus = 1
	and		o.Publica = 1
	and		ev.id_Recurso_vt = o.id_Recurso_vt
	and		ev.empresa = o.empresa
	and		ev.EmpresaFuente = o.EmpresaFuente
	--Nivel Plaza
	and		np.Empresa =* ev.Empresa
	and		np.EmpresaFuente =* ev.EmpresaFuente
	and		np.Plaza =* ev.Plaza
	and		np.Periodo >= @Periodo
	--Nivel Recurso
--	and		nr.id_recurso_vt =* ev.id_recurso_vt
	and		nr.id_recurso_vt = ev.id_recurso_vt
	and		nr.Periodo = @Periodo
	-- Semaforo
	and		s.id_recurso_vt =* ev.id_recurso_vt
	and		s.Periodo		= Datepart(wk, getdate()-4) 
	And		s.Anio			= Datepart(yy, getdate()-4)
	and		s.Tipo = 0
	--Filtros
	and		(ev.idDivision = @Division OR @Division = -1 or @Division = 1)
	and		(ev.idDireccion = @Direccion OR @Direccion = -1)
	and		(ev.idArea = @Area OR @Area = -1)
	and		ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'
	and		(power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)

	and		((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and	o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)
			OR
			(o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )
			OR 
			(@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)
			)
	and		(
			exists (
					select 	* 
					from 	#dependientes
					Where	o.Empresa = Empresa
					and		o.EmpresaFuente = EmpresaFuente
					and		o.Plaza = Plaza
					)
			OR	@Opcion = 1

			)
-- --Order by  nr.Codigo, ev.NombreCompleto
Order by  ev.idArea, ev.NombreCompleto

GO
/****** Object:  StoredProcedure [dbo].[SPQ_CH_RepDesarrolloEmp_cpvc_300109]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
Objetivo: Consultar Reporte de Desarrollo del personal    
   Capital Humano    
Creado por: Jaime Sánchez    
Fecha:  18-Sept-2007    
-- -- grant exec on SPQ_CH_RepDesarrolloEmp to pinuser     
*/    
--exec SPQ_CH_RepDesarrolloEmp -1, -1, -1, -1, 'JESUS ALBERTO DIAZ DOMINGUEZ', 1942, 2008,1  
CREATE Proc [dbo].[SPQ_CH_RepDesarrolloEmp_cpvc_300109]    
 @Division  int=-1,    
 @Direccion int=-1,    
 @Area     int=-1,    
 @Codigo  int=-1,    
 @Nombre  varchar(60)='',    
 @id_recurso_vt int,    
 @Periodo int,    
 @Opcion  int=1    
AS    
    
-- ---------------TEST    
-- --exec SPQ_CH_RepDesarrolloEmp -1, -1, -1, 0.5, 'Monsivais', 1942, 2007,0     
--     
-- Declare @Division  int,    
--   @Direccion int,    
--   @Area  int,    
--   @Codigo   int,    
--   @Nombre   varchar(80),    
--   @id_recurso_vt int,    
--   @Periodo  int,    
--   @Opcion   int    
--     
-- Set @Division  = -1    
-- Set @Direccion = 1000 ---1    
-- Set @Area = -1    
-- Set @Codigo  = -1    
-- Set @Nombre  =''    
--  set @id_recurso_vt = 1942 -- 2543 --Marco Medellin    
-- set @Periodo = 2007    
-- set @Opcion = 0    
--     
--  drop table #Dependientes    
--     
-- -- -- ---------TEST---------------    
    
    
SET NOCOUNT ON    
    
    
 If @Codigo < 1    
  Set @Codigo = -1    
     
 --Obtener arbol del usuario por default    
 declare  @PlazaSuperior int,    
    @EmpresaSuperior int,    
    @EmpresaFuenteSuperior int    
     
 set  @PlazaSuperior =-1    
 set  @EmpresaSuperior =-1    
 set  @EmpresaFuenteSuperior =-1    
     
 if @Opcion = 1    
 begin    
   Select  @PlazaSuperior = Plaza,    
     @EmpresaSuperior = Empresa,    
     @EmpresaFuenteSuperior = EmpresaFuente    
   from vt_Organigrama    
   Where id_recurso_vt = @id_recurso_vt    
   and  Estatus = 1    
 end    
    
    
 set nocount on    
 Create  Table #Dependientes    
            (Empresa int not null,    
       EmpresaFuente int not null,    
       Plaza  int not null,    
             Nivel int not null,    
             Cadena varchar(1000) not null)    
    
if @Opcion <> 1    
begin    
-- Validar que las plazas a consultar esten dentro del arbol que tiene permisos     
-- y que no esten excluidos    
--  Generar una temporal con todos los arboles a los que tiene permisos    
--  y excluir las plazas a las que no tenga permisos    
--  Para despues excluirlas del query de consulta.    
 insert into #dependientes exec SPQ_CH_GeneraDependenciasPermisos  @id_recurso_vt    
-----    
end    
  
if @Division = 1 or @Division = -1   
begin    
 select  distinct ev.id_Recurso_vt,    
   ev.id,    
   ev.Empleado,    
   nomina = isnull(ev.nomina, 0),    
   ev.NombreCompleto,    
   ev.Puesto,    
   ev.Direccion,    
   id_Area = ev.idArea,    
   ev.Area,    
   ev.plaza,    
   ev.Empresa,    
   ev.EmpresaFuente,    
   o.plaza_superior,    
   o.id_nivel_puesto,    
   o.staff,    
   CodigoPlazas = isnull(np.Nivel, 0),    
   SM1    = IsNull(np.SM1, ''),    
   SM2    = IsNull(np.SM2, ''),    
   SM3    = IsNull(np.SM3, ''),    
   Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,    
   Semaforo  = s.Semaforo,    
   Calificacion = s.Calificacion,    
   ev.empresa    
 from  VT_Organigrama o,    
    v_EmpleadosVerzatec ev,    
   Kiosco.dbo.CH_Nivel_Plaza_vzt np,    
   Kiosco.dbo.CH_Nivel_Recurso_vzt nr,    
   Kiosco.dbo.CH_Semaforos_vzt s    
 where o.estatus = 1    
 and  o.Publica = 1    
 and  ev.id_Recurso_vt = o.id_Recurso_vt    
 and  ev.empresa = o.empresa    
 and  ev.EmpresaFuente = o.EmpresaFuente    
 --Nivel Plaza    
 and  np.Empresa =* ev.Empresa    
 and  np.EmpresaFuente =* ev.EmpresaFuente    
 and  np.Plaza =* ev.Plaza    
 and  np.Periodo >= @Periodo    
 --Nivel Recurso    
-- and  nr.id_recurso_vt =* ev.id_recurso_vt    
 and  nr.id_recurso_vt = ev.id_recurso_vt    
 and  nr.Periodo = @Periodo    
 -- Semaforo    
 and  s.id_recurso_vt =* ev.id_recurso_vt    
 and  s.Periodo  = Datepart(wk, getdate()-4)     
 And  s.Anio   = Datepart(yy, getdate()-4)    
 and  s.Tipo = 0    
 --Filtros    
 --and  (ev.idDivision = @Division OR @Division = -1 or @Division = 1)    
 and  (ev.idDireccion = @Direccion OR @Direccion = -1)    
 and  (ev.idArea = @Area OR @Area = -1)    
 and  ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'    
 and  (power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)    
    
 and  ((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)    
   OR    
   (o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )    
   OR     
   (@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)    
   )    
 and  (    
   exists (    
     select  *     
     from  #dependientes    
     Where o.Empresa = Empresa    
     and  o.EmpresaFuente = EmpresaFuente    
     and  o.Plaza = Plaza    
     )    
   OR @Opcion = 1    
    
   )    
-- --Order by  nr.Codigo, ev.NombreCompleto    
Order by  ev.idArea, ev.NombreCompleto    
end  
else if @Division = 2  
begin  
 select  distinct ev.id_Recurso_vt,    
   ev.id,    
   ev.Empleado,    
   nomina = isnull(ev.nomina, 0),    
   ev.NombreCompleto,    
   ev.Puesto,    
   ev.Direccion,    
   id_Area = ev.idArea,    
   ev.Area,    
   ev.plaza,    
   ev.Empresa,    
   ev.EmpresaFuente,    
   o.plaza_superior,    
   o.id_nivel_puesto,    
   o.staff,    
   CodigoPlazas = isnull(np.Nivel, 0),    
   SM1    = IsNull(np.SM1, ''),    
   SM2    = IsNull(np.SM2, ''),    
   SM3    = IsNull(np.SM3, ''),    
   Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,    
   Semaforo  = s.Semaforo,    
   Calificacion = s.Calificacion,    
   ev.empresa    
 from  VT_Organigrama o,    
    v_EmpleadosVerzatec ev,    
   Kiosco.dbo.CH_Nivel_Plaza_vzt np,    
   Kiosco.dbo.CH_Nivel_Recurso_vzt nr,    
   Kiosco.dbo.CH_Semaforos_vzt s    
 where o.estatus = 1    
 and  o.Publica = 1    
 and  ev.id_Recurso_vt = o.id_Recurso_vt    
 and  ev.empresa = o.empresa    
 and  ev.EmpresaFuente = o.EmpresaFuente    
 --Nivel Plaza    
 and  np.Empresa =* ev.Empresa    
 and  np.EmpresaFuente =* ev.EmpresaFuente    
 and  np.Plaza =* ev.Plaza    
 and  np.Periodo >= @Periodo    
 --Nivel Recurso    
-- and  nr.id_recurso_vt =* ev.id_recurso_vt    
 and  nr.id_recurso_vt = ev.id_recurso_vt    
 and  nr.Periodo = @Periodo    
 -- Semaforo    
 and  s.id_recurso_vt =* ev.id_recurso_vt    
 and  s.Periodo  = Datepart(wk, getdate()-4)     
 And  s.Anio   = Datepart(yy, getdate()-4)    
 and  s.Tipo = 0    
 --Filtros    
and (ev.Entidad in (1301,2050,2041,1110,1100,1000,1200,1400,1500,0))  
 --and  (ev.idDivision = @Division OR @Division = -1 or @Division = 1)    
 and  (ev.idDireccion = @Direccion OR @Direccion = -1)    
 and  (ev.idArea = @Area OR @Area = -1)    
 and  ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'    
 and  (power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)    
    
 and  ((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)    
   OR    
   (o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )    
   OR     
   (@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)    
   )    
 and  (    
   exists (    
     select  *     
     from  #dependientes    
     Where o.Empresa = Empresa    
     and  o.EmpresaFuente = EmpresaFuente    
     and  o.Plaza = Plaza    
     )    
   OR @Opcion = 1    
    
   )    
-- --Order by  nr.Codigo, ev.NombreCompleto    
Order by  ev.idArea, ev.NombreCompleto    
end  
else if @Division = 3  
begin  
 select  distinct ev.id_Recurso_vt,    
   ev.id,    
   ev.Empleado,    
   nomina = isnull(ev.nomina, 0),    
   ev.NombreCompleto,    
   ev.Puesto,    
   ev.Direccion,    
   id_Area = ev.idArea,    
   ev.Area,    
   ev.plaza,    
   ev.Empresa,    
   ev.EmpresaFuente,    
   o.plaza_superior,    
   o.id_nivel_puesto,    
   o.staff,    
   CodigoPlazas = isnull(np.Nivel, 0),    
   SM1    = IsNull(np.SM1, ''),    
   SM2    = IsNull(np.SM2, ''),    
   SM3    = IsNull(np.SM3, ''),    
   Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,    
   Semaforo  = s.Semaforo,    
   Calificacion = s.Calificacion,    
   ev.empresa    
 from  VT_Organigrama o,    
    v_EmpleadosVerzatec ev,    
   Kiosco.dbo.CH_Nivel_Plaza_vzt np,    
   Kiosco.dbo.CH_Nivel_Recurso_vzt nr,    
   Kiosco.dbo.CH_Semaforos_vzt s    
 where o.estatus = 1    
 and  o.Publica = 1    
 and  ev.id_Recurso_vt = o.id_Recurso_vt    
 and  ev.empresa = o.empresa    
 and  ev.EmpresaFuente = o.EmpresaFuente    
 --Nivel Plaza    
 and  np.Empresa =* ev.Empresa    
 and  np.EmpresaFuente =* ev.EmpresaFuente    
 and  np.Plaza =* ev.Plaza    
 and  np.Periodo >= @Periodo    
 --Nivel Recurso    
-- and  nr.id_recurso_vt =* ev.id_recurso_vt    
 and  nr.id_recurso_vt = ev.id_recurso_vt    
 and  nr.Periodo = @Periodo    
 -- Semaforo    
 and  s.id_recurso_vt =* ev.id_recurso_vt    
 and  s.Periodo  = Datepart(wk, getdate()-4)     
 And  s.Anio   = Datepart(yy, getdate()-4)    
 and  s.Tipo = 0    
 --Filtros    
and (ev.Entidad in (4020))  
 --and  (ev.idDivision = @Division OR @Division = -1 or @Division = 1)    
 and  (ev.idDireccion = @Direccion OR @Direccion = -1)    
 and  (ev.idArea = @Area OR @Area = -1)    
 and  ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'    
 and  (power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)    
    
 and  ((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)    
   OR    
   (o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )    
   OR     
   (@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)    
   )    
 and  (    
   exists (    
     select  *     
     from  #dependientes    
     Where o.Empresa = Empresa    
     and  o.EmpresaFuente = EmpresaFuente    
     and  o.Plaza = Plaza    
     )    
   OR @Opcion = 1    
    
   )    
-- --Order by  nr.Codigo, ev.NombreCompleto    
Order by  ev.idArea, ev.NombreCompleto    
end  
else if @Division = 4  
begin  
 select  distinct ev.id_Recurso_vt,    
   ev.id,    
   ev.Empleado,    
   nomina = isnull(ev.nomina, 0),    
   ev.NombreCompleto,    
   ev.Puesto,    
   ev.Direccion,    
   id_Area = ev.idArea,    
   ev.Area,    
   ev.plaza,    
   ev.Empresa,    
   ev.EmpresaFuente,    
   o.plaza_superior,    
   o.id_nivel_puesto,    
   o.staff,    
   CodigoPlazas = isnull(np.Nivel, 0),    
   SM1    = IsNull(np.SM1, ''),    
   SM2    = IsNull(np.SM2, ''),    
   SM3    = IsNull(np.SM3, ''),    
   Codigo   = IsNull(nr.Nivel, 0), --Case When o.plaza = @PlazaSup Then 0 Else IsNull(nr.Nivel, 0) End,    
   Semaforo  = s.Semaforo,    
   Calificacion = s.Calificacion,    
   ev.empresa    
 from  VT_Organigrama o,    
    v_EmpleadosVerzatec ev,    
   Kiosco.dbo.CH_Nivel_Plaza_vzt np,    
   Kiosco.dbo.CH_Nivel_Recurso_vzt nr,    
   Kiosco.dbo.CH_Semaforos_vzt s    
 where o.estatus = 1    
 and  o.Publica = 1    
 and  ev.id_Recurso_vt = o.id_Recurso_vt    
 and  ev.empresa = o.empresa    
 and  ev.EmpresaFuente = o.EmpresaFuente    
 --Nivel Plaza    
 and  np.Empresa =* ev.Empresa    
 and  np.EmpresaFuente =* ev.EmpresaFuente    
 and  np.Plaza =* ev.Plaza    
 and  np.Periodo >= @Periodo    
 --Nivel Recurso    
-- and  nr.id_recurso_vt =* ev.id_recurso_vt    
 and  nr.id_recurso_vt = ev.id_recurso_vt    
 and  nr.Periodo = @Periodo    
 -- Semaforo    
 and  s.id_recurso_vt =* ev.id_recurso_vt    
 and  s.Periodo  = Datepart(wk, getdate()-4)     
 And  s.Anio   = Datepart(yy, getdate()-4)    
 and  s.Tipo = 0    
 --Filtros    
and (ev.Entidad in (3030,3050,3051,3052,3053,3054,3055,4000,3070))  
and (ev.Empresa not like '%9%')  
 --and  (ev.idDivision = @Division OR @Division = -1 or @Division = 1)    
 and  (ev.idDireccion = @Direccion OR @Direccion = -1)    
 and  (ev.idArea = @Area OR @Area = -1)    
 and  ev.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'    
 and  (power(2, nr.Nivel-1) & @Codigo > 0 OR @Codigo = -1)    
    
 and  ((o.Plaza_Superior= @PlazaSuperior and o.Empresa_Superior = @EmpresaSuperior and o.EmpresaFuente_Superior = @EmpresaFuenteSuperior)    
   OR    
   (o.Plaza = @PlazaSuperior and o.Empresa = @EmpresaSuperior and o.EmpresaFuente = @EmpresaFuenteSuperior )    
   OR     
   (@PlazaSuperior=-1 AND @EmpresaSuperior=-1 AND @EmpresaFuenteSuperior=-1)    
   )    
 and  (    
   exists (    
     select  *     
     from  #dependientes    
     Where o.Empresa = Empresa    
     and  o.EmpresaFuente = EmpresaFuente    
     and  o.Plaza = Plaza    
     )    
   OR @Opcion = 1    
    
   )    
-- --Order by  nr.Codigo, ev.NombreCompleto    
Order by  ev.idArea, ev.NombreCompleto    
end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_ConsultaDependencias]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Autor: Jaime Sánchez  
 Fecha: 13/Octubre/2006  
 Objetivo:   
  Busca el empleado dentro de la nueva estructura organizacional VERZATEC  
  
 @TipoEmpleado int, --Agrupacion de la Nomina  
 @Empresas varchar(1000), --Separadas por comas  
 @Areas varchar(1000), --Separadas por comas  
 @Empleado int, --id_Recurso_vt  
 @Jefe int, --id_Recurso_vt del Jefe  
 @SinJefe int, --1 sin Jefe Asignado o 0 con Jefe Asignado  
 @PlazaVacante varchar(1000)  
  
SPQ_ConsultaDependencias 0, '-1', '-1', 0, 2679  
SPQ_ConsultaDependencias 1, ',4100,'  
  
*/  
CREATE Procedure [dbo].[SPQ_ConsultaDependencias]  
 @TipoEmpleado int = 0,  
 @Empresas varchar(1000) = '-1',   
 @Areas varchar(1000) = '-1',   
 @Empleado int = 0,   
 @Jefe int = 0,   
 @SinJefe int = 0,   
 @PlazaVacante varchar(1000) = '-1'  
AS  
  
SET NOCOUNT ON  
/*   
declare @TipoEmpleado int, --Agrupacion de la Nomina  
 @Empresas varchar(1000), --Separadas por comas  
 @Areas varchar(1000), --Separadas por comas  
 @Empleado int, --id_Recurso_vt  
 @Jefe int, --id_Recurso_vt del Jefe  
 @SinJefe int, --1 o 0  
 @PlazaVacante varchar(1000)  
  
Select @Empresas = '-1',  
 @Areas = '-1',  
 @Empleado = 0,  
 @Jefe = 0,  
 @SinJefe = 0,  
 @PlazaVacante = '-1'  
----------------  
*/  
  
  
--EN CASO DE MANDAR EL PARAMETRO @Jefe --> Mostrar todos lo que dependen de el  
declare @Plaza_Superior int,  
 @Empresa_Superior int,   
 @EmpresaFuente_Superior int  
SELECT  @Plaza_Superior = 0,  
 @Empresa_Superior = 0,   
 @EmpresaFuente_Superior = 0  
  
if @Jefe <> 0  
begin  
 Select  @Plaza_Superior = Plaza,   
  @Empresa_Superior = Empresa,   
  @EmpresaFuente_Superior = EmpresaFuente   
 from  vt_Organigrama   
 where  id_Recurso_vt = @Jefe  
end  
-----------  
  
  
select  o.id_recurso_vt,  
 Empleado = isnull(( Select  top 1 Empleado  
    from vt_RecursoEmpresa  
    Where id_recurso_vt = o.id_recurso_vt  
    and Estatus not in (2, 4) --Empleado Activo   
   ), 0),  
 Nombre = Case o.id_recurso_vt when 0 then ' ** Plaza Vacante ** '  
   else  
   isnull(( Select  Nombre+' '+Paterno+' '+Materno  
      from vt_Recursos  
    Where id_recurso_vt = o.id_recurso_vt  
   ), '')  
  END,  
 DescEmpresa = emp.Razon_Social,--emp.Descripcion,  
 o.plaza,  
 o.Empresa,  
 o.EmpresaFuente,  
 DescPublica = Case o.Publica When 1 then '<font color=green>si</font>' else '<font color=red>no</font>' end,  
 Puesto = p.Desc_esp,  
 Area = isnull(ne.Desc_esp, ''),  
 Nomina = isnull(( Select  top 1 Nomina  
    from  vt_RecursoEmpresa  
    Where id_recurso_vt = o.id_recurso_vt  
    and Estatus not in (2, 4) --Empleado Activo   
   ), 0),  
 TipoEmpleado = isnull(( Select  top 1 n.Desc_esp  
    from  vt_Nomina n,  
     vt_RecursoEmpresa re  
    Where n.Nomina = re.Nomina   
    and n.Empresa = re.Empresa  
    and n.EmpresaFuente = re.EmpresaFuente  
    and re.id_recurso_vt = o.id_recurso_vt  
    and re.Estatus not in (2, 4) --Empleado Activo   
   ), '') ,  
 NombreJefe =  isnull((  
  Select  top 1   
   CASE o2.id_recurso_vt WHEN 0 THEN Desc_esp+' ** Plaza Vacante **'  
           ELSE r2.Nombre+' '+r2.Paterno+' '+r2.Materno  
   END  
  from vt_Recursos r2,  
   vt_Organigrama o2,  
   vt_Puesto p2  
  Where r2.id_recurso_vt =* o2.id_recurso_vt  
  and o2.plaza = o.Plaza_Superior  
  and o2.Empresa = o.Empresa_Superior  
  and o2.EmpresaFuente = o.EmpresaFuente_Superior  
  and p2.id_nivel_puesto = o2.id_nivel_puesto  
  and p2.Empresa = o2.Empresa  
  and p2.EmpresaFuente = o2.EmpresaFuente  
  and o2.Estatus = 1  
  ), '** Sin Jefe Asignado **')    
into  #ConsultaTMP  
from  vt_Organigrama o,  
 vt_Puesto p,  
 VT_NivelesEstructura ne,  
 VT_Empresa emp  
where o.Estatus = 1 --Plaza Activa  
and p.id_nivel_puesto =* o.id_nivel_puesto  
and p.Empresa =* o.Empresa  
and p.EmpresaFuente =* o.EmpresaFuente  
--and ne.id_NivelEstructura =*  o.Area  
and ne.Nivel =*  o.Area  
and ne.Empresa =* o.Empresa  
and ne.EmpresaFuente =* o.EmpresaFuente
and ne.Estructura = 2   
and emp.Empresa = o.Empresa  
and emp.Estatus = 1  
 --Filtro por id  
AND (o.id_Recurso_vt = @Empleado OR @Empleado = 0)  
  
 --Filtro por Jefe Inmediato  
AND (o.plaza_superior = @plaza_superior OR @plaza_superior = 0)  
AND (o.Empresa_superior = @Empresa_superior OR @Empresa_superior = 0)  
AND (o.EmpresaFuente_superior = @EmpresaFuente_superior OR @EmpresaFuente_superior = 0)  
  
 --Filtrar x Empresa  
AND   (charindex(','+rtrim(cast(o.Empresa as char))+',' , @Empresas) > 0  
  OR   
 @Empresas = '-1'  
 )  
  
 --Filtrar x Empresa  
AND   (charindex(','+rtrim(cast(o.Area as char))+',' , @Areas) > 0  
  OR   
 @Areas = '-1'  
 )  
  
 --Filtrar los que no tengan jefe asignado  
AND o.plaza_superior = Case @SinJefe when 1 then 0 else o.plaza_superior end  
  
 --Filtrar por Plaza Vacante  
AND (rtrim(cast(o.Empresa as char))+'-'+rtrim(cast(o.EmpresaFuente as char))+'-'+rtrim(cast(o.plaza as char)) = @PlazaVacante  
 OR  
 @PlazaVacante = '-1'  
 )  
  
Order by Nombre  
  
SET NOCOUNT OFF  
  
--FILTRAR POR TIPO DE EMPLEADO  
IF @TipoEmpleado <> 0  
 select  o.*   
 from  #ConsultaTMP o,  
  VT_Nomina n  
 where n.Empresa = o.Empresa  
 and n.EmpresaFuente = o.EmpresaFuente  
 and n.Nomina = o.Nomina  
 and n.Estatus = 1  
 and (n.id_AgrupaNomina = @TipoEmpleado or @TipoEmpleado = 0)  
ELSE  
 select * from #ConsultaTMP

GO
/****** Object:  StoredProcedure [dbo].[SPQ_ConsultaDependencias_RESP_JASM_061025]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	Autor:	Jaime Sánchez
	Fecha:	13/Octubre/2006
	Objetivo: 
		Busca el empleado dentro de la nueva estructura organizacional VERZATEC

	@TipoEmpleado int, --Agrupacion de la Nomina
	@Empresas varchar(1000), --Separadas por comas
	@Areas varchar(1000), --Separadas por comas
	@Empleado int, --id_Recurso_vt
	@Jefe int, --id_Recurso_vt del Jefe
	@SinJefe int, --1 sin Jefe Asignado o 0 con Jefe Asignado
	@PlazaVacante varchar(1000)

SPQ_ConsultaDependencias 0, '-1', '-1', 3654

SPQ_ConsultaDependencias 0, ',4100,'

*/
CREATE Procedure [dbo].[SPQ_ConsultaDependencias_RESP_JASM_061025]
	@TipoEmpleado int = 0,
	@Empresas varchar(1000) = '-1', 
	@Areas varchar(1000) = '-1', 
	@Empleado int = 0, 
	@Jefe int = 0, 
	@SinJefe int = 0, 
	@PlazaVacante varchar(1000) = '-1'
AS

/*	
declare @TipoEmpleado int, --Agrupacion de la Nomina
	@Empresas varchar(1000), --Separadas por comas
	@Areas varchar(1000), --Separadas por comas
	@Empleado int, --id_Recurso_vt
	@Jefe int, --id_Recurso_vt del Jefe
	@SinJefe int, --1 o 0
	@PlazaVacante varchar(1000)

Select	@Empresas = '-1',
	@Areas = '-1',
	@Empleado = 0,
	@Jefe = 0,
	@SinJefe = 0,
	@PlazaVacante = '-1'
----------------
*/


--EN CASO DE MANDAR EL PARAMETRO @Jefe --> Mostrar todos lo que dependen de el
declare @Plaza_Superior int,
	@Empresa_Superior int, 
	@EmpresaFuente_Superior int
SELECT 	@Plaza_Superior = 0,
	@Empresa_Superior = 0, 
	@EmpresaFuente_Superior = 0

if @Jefe <> 0
begin
	Select 	@Plaza_Superior = Plaza, 
		@Empresa_Superior = Empresa, 
		@EmpresaFuente_Superior = EmpresaFuente 
	from 	vt_Organigrama 
	where 	id_Recurso_vt = @Jefe
end
-----------


select 	o.id_recurso_vt,
	Empleado = isnull((	Select 	top 1 Empleado
				from	vt_RecursoEmpresa
				Where	id_recurso_vt = o.id_recurso_vt
				and	Estatus not in (2, 4) --Empleado Activo	
			), 0),
	Nombre = Case o.id_recurso_vt when 0 then ' ** Plaza Vacante ** '
		 else
			isnull((	Select  Nombre+' '+Paterno+' '+Materno
			  	from	vt_Recursos
				Where	id_recurso_vt = o.id_recurso_vt
			), '')
		END,
	o.plaza,
	o.Empresa,
	o.EmpresaFuente,
	Puesto = p.Desc_esp,
	Area = isnull(ne.Desc_esp, ''),
	TipoEmpleado = isnull((	Select 	top 1 n.Desc_esp
				from 	vt_Nomina n,
					vt_RecursoEmpresa re
				Where	n.Nomina = re.Nomina 
				and	n.Empresa = re.Empresa
				and	n.EmpresaFuente = re.EmpresaFuente
				and	re.id_recurso_vt = o.id_recurso_vt
				and	re.Estatus not in (2, 4) --Empleado Activo	
			), '')	,
	NombreJefe = 	isnull((
		Select 	top 1 
			CASE o2.id_recurso_vt WHEN 0 THEN Desc_esp+' ** Plaza Vacante **'
					      ELSE r2.Nombre+' '+r2.Paterno+' '+r2.Materno
			END
		from	vt_Recursos r2,
			vt_Organigrama o2,
			vt_Puesto p2
		Where	r2.id_recurso_vt =* o2.id_recurso_vt
		and	o2.plaza = o.Plaza_Superior
		and	o2.Empresa = o.Empresa_Superior
		and	o2.EmpresaFuente = o.EmpresaFuente_Superior
		and	p2.id_nivel_puesto = o2.id_nivel_puesto
		and	p2.Empresa = o2.Empresa
		and	p2.EmpresaFuente = o2.EmpresaFuente
		and	o2.Estatus = 1
		), '** Sin Jefe Asignado **')		
from 	vt_Organigrama o,
	vt_Puesto p,
	VT_NivelesEstructura ne
where	o.Estatus = 1 --Plaza Activa
and	p.id_nivel_puesto =* o.id_nivel_puesto
and	p.Empresa =* o.Empresa
and	p.EmpresaFuente =* o.EmpresaFuente
and	ne.id_NivelEstructura =*  o.Area
and	ne.Empresa =* o.Empresa
and	ne.EmpresaFuente =* o.EmpresaFuente

	--Filtro por id
AND	(o.id_Recurso_vt = @Empleado OR @Empleado = 0)

	--Filtro por Jefe Inmediato
AND	(o.plaza_superior = @plaza_superior OR @plaza_superior = 0)
AND	(o.Empresa_superior = @Empresa_superior OR @Empresa_superior = 0)
AND	(o.EmpresaFuente_superior = @EmpresaFuente_superior OR @EmpresaFuente_superior = 0)

	--Filtrar x Empresa
AND  	(charindex(','+rtrim(cast(o.Empresa as char))+',' , @Empresas) > 0
		OR 
	@Empresas = '-1'
	)

	--Filtrar x Empresa
AND  	(charindex(','+rtrim(cast(o.Area as char))+',' , @Areas) > 0
		OR 
	@Areas = '-1'
	)

	--Filtrar los que no tengan jefe asignado
AND	o.plaza_superior = Case @SinJefe when 1 then 0 else o.plaza_superior end

	--Filtrar por Plaza Vacante
AND	(rtrim(cast(o.Empresa as char))+'-'+rtrim(cast(o.EmpresaFuente as char))+'-'+rtrim(cast(o.plaza as char)) = @PlazaVacante
	OR
	@PlazaVacante = '-1'
	)

Order by Nombre

GO
/****** Object:  StoredProcedure [dbo].[SPQ_ConsultaFirma_VZT]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext SPQ_ConsultaFirma_VZT

/*  
Creado por: Cecilia Cárdenas  
Fecha: Mayo 2007  
Obejtivo: Consulta los empleados que firmaron la Carta de Conflicto de Intereses  
*/   
--DROP PROCEDURE SPQ_ConsultaFirma_VZT 0,1,1  
  
  
CREATE Proc [dbo].[SPQ_ConsultaFirma_VZT]     
 @ID numeric ,  
 @IdDoc integer,  
 @Estatus integer  
  
AS     
  
  
If @ID=0  
  begin 
        if @Estatus=1  
	     begin
		 SELECT      V.id_recurso_vt as Id_Verzatec,empleado as [No.Empleado], V.NombreCompleto as Nombre,V.Division as [División],
		             T.Firmado, convert(char(10),T.FechaFirma,103) as FechaFirma  
		 FROM         dbo.v_EmpleadosVerzatec V,dbo.RH_FirmaDocumentos T  
		        Where V.id_recurso_vt = T.id_recurso_vt  
		        AND Firmado=@Estatus and id_Doc=@IdDoc 
	     end 
        else
	     begin
		SELECT id_recurso_vt as Id_Verzatec,empleado as [No.Empleado], NombreCompleto as Nombre,Division as [División], e_mail as [Email]
		FROM   v_EmpleadosVerzatec 
		Where id_recurso_vt not in 
                      (Select id_recurso_vt From RH_FirmaDocumentos Where Firmado=1 and id_Doc=@IdDoc)
		order by NombreCompleto
	     end 
  end  
else  
  begin    
	 SELECT      id_recurso_vt, NombreCompleto,Division,RFC,  
	             id_recurso_vt, convert(char(10),Fecha_Antiguedad,103)  
	 FROM         dbo.v_EmpleadosVerzatec  
	        Where id_recurso_vt = @ID  
	   
	  end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_ConsultaFirma_VZT_2009]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPQ_ConsultaFirma_VZT_2009]         
 @Empresa integer,  
 @Entidad integer,  
 @Division integer,  
 @Documento integer,      
 @Estatus integer,      
 @Periodo integer  
AS         
  
Select * into #Empleados from Organizacion_vzt.dbo.v_EmpleadosVerzatec where DescNomina not like '%Sind%'     
   
  if @Estatus=1      
   begin    
  if @Empresa = 2  
  begin  
   SELECT empleado as [No.Empleado], V.NombreCompleto as Nombre, CASE WHEN Entidad = 1301 OR
                      Entidad = 2050 OR
                      Entidad = 2041 OR
                      Entidad = 2042 OR
                      Entidad = 1110 OR
                      Entidad = 1100 OR
                      Entidad = 1000 OR
                      Entidad = 1200 OR
                      Entidad = 1400 OR
                      Entidad = 1500 OR
                      Entidad = 5000 OR
                      Entidad = 0 THEN 'Sin asignar' WHEN Entidad = 4020 THEN 'Formet' WHEN Entidad = 3030 OR
                      Entidad = 3050 OR
                      Entidad = 3051 OR
                      Entidad = 3052 OR
                      Entidad = 3053 OR
                      Entidad = 3054 OR
                      Entidad = 3055 OR
                      Entidad = 3056 OR
                      Entidad = 4000 OR
                      Entidad = 3070 THEN 'Stabilit' END AS Empresa, V.DescEntidad as [Entidad],
					v.Direccion,    
      'Sí' as Firmado, convert(char(10),T.FechaFirma,103) as FechaFirma
      ,Nomina=V.descNomina      
   FROM         #Empleados V,dbo.RH_FirmaDocumentos T      
    Where V.id_recurso_vt = T.id_recurso_vt  
    and v.entidad in (1301,2050,2041,2042,1110,1100,1000,1200,1400,1500,5000,0)    
    and @Entidad in (-1,v.entidad)   
    and @Division in (-1,v.idDireccion)  
    AND Firmado=@Estatus and id_Doc=@Documento   
    and Periodo = @Periodo  
	ORDER BY cast(T.FechaFirma as datetime) DESC
    end  
  else if @Empresa = 3  
  begin  
   SELECT      empleado as [No.Empleado], V.NombreCompleto as Nombre, CASE WHEN Entidad = 1301 OR
                      Entidad = 2050 OR
                      Entidad = 2041 OR
                      Entidad = 2042 OR
                      Entidad = 1110 OR
                      Entidad = 1100 OR
                      Entidad = 1000 OR
                      Entidad = 1200 OR
                      Entidad = 1400 OR
                      Entidad = 1500 OR
                      Entidad = 5000 OR
                      Entidad = 0 THEN 'Sin asignar' WHEN Entidad = 4020 THEN 'Formet' WHEN Entidad = 3030 OR
                      Entidad = 3050 OR
                      Entidad = 3051 OR
                      Entidad = 3052 OR
                      Entidad = 3053 OR
                      Entidad = 3054 OR
                      Entidad = 3055 OR
                      Entidad = 3056 OR
                      Entidad = 4000 OR
                      Entidad = 3070 THEN 'Stabilit' END AS Empresa, V.DescEntidad as [Entidad],
					v.Direccion, 
      'Sí' as Firmado, convert(char(10),T.FechaFirma,103) as FechaFirma      
      ,Nomina=V.descNomina 
   FROM         #Empleados V,dbo.RH_FirmaDocumentos T      
    Where V.id_recurso_vt = T.id_recurso_vt  
    and v.entidad in (4020)    
    and @Entidad in (-1,v.entidad)   
    and @Division in (-1,v.idDireccion)  
    AND Firmado=@Estatus and id_Doc=@Documento 
     and Periodo = @Periodo      
	ORDER BY cast(T.FechaFirma as datetime) DESC

    end             
   else if @Empresa = 4  
  begin  
   SELECT      empleado as [No.Empleado], V.NombreCompleto as Nombre, CASE WHEN Entidad = 1301 OR
                      Entidad = 2050 OR
                      Entidad = 2041 OR
                      Entidad = 2042 OR
                      Entidad = 1110 OR
                      Entidad = 1100 OR
                      Entidad = 1000 OR
                      Entidad = 1200 OR
                      Entidad = 1400 OR
                      Entidad = 1500 OR
					  Entidad = 5000 OR
                      Entidad = 0 THEN 'Sin asignar' WHEN Entidad = 4020 THEN 'Formet' WHEN Entidad = 3030 OR
                      Entidad = 3050 OR
                      Entidad = 3051 OR
                      Entidad = 3052 OR
                      Entidad = 3053 OR
                      Entidad = 3054 OR
                      Entidad = 3055 OR
                      Entidad = 3056 OR
                      Entidad = 4000 OR
                      Entidad = 3070 THEN 'Stabilit' END AS Empresa, V.DescEntidad as [Entidad],
					v.Direccion, 
      'Sí' as Firmado, convert(char(10),T.FechaFirma,103) as FechaFirma    
      ,Nomina=V.descNomina   
   FROM         #Empleados V,dbo.RH_FirmaDocumentos T      
    Where V.id_recurso_vt = T.id_recurso_vt  
    and v.entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070)  
    and @Entidad in (-1,v.entidad)   
    and @Division in (-1,v.idDireccion)  
    AND Firmado=@Estatus and id_Doc=@Documento  
     and Periodo = @Periodo     
	ORDER BY cast(T.FechaFirma as datetime) DESC

    end  
    else  
    begin  
       SELECT empleado as [No.Empleado], V.NombreCompleto as Nombre, CASE WHEN Entidad = 1301 OR
                      Entidad = 2050 OR
                      Entidad = 2041 OR
                      Entidad = 2042 OR
                      Entidad = 1110 OR
                      Entidad = 1100 OR
                      Entidad = 1000 OR
                      Entidad = 1200 OR
                      Entidad = 1400 OR
                      Entidad = 1500 OR
                      Entidad = 5000 OR
                      Entidad = 0 THEN 'Sin asignar' WHEN Entidad = 4020 THEN 'Formet' WHEN Entidad = 3030 OR
                      Entidad = 3050 OR
                      Entidad = 3051 OR
                      Entidad = 3052 OR
                      Entidad = 3053 OR
                      Entidad = 3054 OR
                      Entidad = 3055 OR
                      Entidad = 3056 OR
                      Entidad = 4000 OR
                      Entidad = 3070 THEN 'Stabilit' END AS Empresa, V.DescEntidad as [Entidad],
					v.Direccion, 
      'Sí' as Firmado, convert(char(10),T.FechaFirma,103) as FechaFirma  
      ,Nomina=V.descNomina     
   FROM         #Empleados V,dbo.RH_FirmaDocumentos T      
    Where V.id_recurso_vt = T.id_recurso_vt  
    and @Entidad in (-1,v.entidad)   
    and @Division in (-1,v.idDireccion)  
    AND Firmado=@Estatus and id_Doc=@Documento     
   and Periodo = @Periodo 
   	ORDER BY T.FechaFirma DESC
 
    end  
   end     
  else    
   begin    
   if @Empresa = 2  
   begin  
  SELECT empleado as [No.Empleado], V.NombreCompleto as Nombre,CASE WHEN Entidad = 1301 OR
                      Entidad = 2050 OR
                      Entidad = 2041 OR
                      Entidad = 2042 OR
                      Entidad = 1110 OR
                      Entidad = 1100 OR
                      Entidad = 1000 OR
                      Entidad = 1200 OR
                      Entidad = 1400 OR
                      Entidad = 1500 OR
                      Entidad = 5000 OR
                      Entidad = 0 THEN 'Sin asignar' WHEN Entidad = 4020 THEN 'Formet' WHEN Entidad = 3030 OR
                      Entidad = 3050 OR
                      Entidad = 3051 OR
                      Entidad = 3052 OR
                      Entidad = 3053 OR
                      Entidad = 3054 OR
                      Entidad = 3055 OR
                      Entidad = 3056 OR
                      Entidad = 4000 OR
                      Entidad = 3070 THEN 'Stabilit' END AS Empresa, V.DescEntidad as [Entidad],
					v.Direccion, 'No' as Firmado, '' as FechaFirma  
					,Nomina=V.descNomina 
  FROM   #Empleados  v   
  Where id_recurso_vt not in     
       (Select id_recurso_vt From RH_FirmaDocumentos Where Firmado=1 and id_Doc=@Documento  and Periodo = @Periodo)   
    and v.entidad in (1301,2050,2041,2042,1110,1100,1000,1200,1400,1500,5000,0)    
    and @Entidad in (-1,v.entidad)   
    and @Division in (-1,v.idDireccion)   
  order by NombreCompleto    
  end   
  else if @Empresa = 3  
   begin  
  SELECT empleado as [No.Empleado], V.NombreCompleto as Nombre, CASE WHEN Entidad = 1301 OR
                      Entidad = 2050 OR
                      Entidad = 2041 OR
                      Entidad = 2042 OR
                      Entidad = 1110 OR
                      Entidad = 1100 OR
                      Entidad = 1000 OR
                      Entidad = 1200 OR
					  Entidad = 1400 OR
                      Entidad = 1500 OR
                      Entidad = 5000 OR
                      Entidad = 0 THEN 'Sin asignar' WHEN Entidad = 4020 THEN 'Formet' WHEN Entidad = 3030 OR
                      Entidad = 3050 OR
                      Entidad = 3051 OR
                      Entidad = 3052 OR
                      Entidad = 3053 OR
                      Entidad = 3054 OR
                      Entidad = 3055 OR
                      Entidad = 3056 OR
                      Entidad = 4000 OR
                      Entidad = 3070 THEN 'Stabilit' END AS Empresa, V.DescEntidad as [Entidad],
					v.Direccion, 'No' as Firmado, '' as FechaFirma   
					,Nomina=V.descNomina 
  FROM   #Empleados  v
  Where id_recurso_vt not in     
       (Select id_recurso_vt From RH_FirmaDocumentos Where Firmado=1 and id_Doc=@Documento  and Periodo = @Periodo  )   
    and v.entidad in (4020)    
    and @Entidad in (-1,v.entidad)   
    and @Division in (-1,v.idDireccion)   
  order by NombreCompleto    
  end   
  else if @Empresa = 4  
   begin  
  SELECT empleado as [No.Empleado], V.NombreCompleto as Nombre, CASE WHEN Entidad = 1301 OR
                      Entidad = 2050 OR
                      Entidad = 2041 OR
                      Entidad = 2042 OR
                      Entidad = 1110 OR
                      Entidad = 1100 OR
                      Entidad = 1000 OR
                      Entidad = 1200 OR
                      Entidad = 1400 OR
                      Entidad = 1500 OR
                      Entidad = 5000 OR
                      Entidad = 0 THEN 'Sin asignar' WHEN Entidad = 4020 THEN 'Formet' WHEN Entidad = 3030 OR
                      Entidad = 3050 OR
                      Entidad = 3051 OR
                      Entidad = 3052 OR
                      Entidad = 3053 OR
                      Entidad = 3054 OR
                      Entidad = 3055 OR
                      Entidad = 3056 OR
                      Entidad = 4000 OR
                      Entidad = 3070 THEN 'Stabilit' END AS Empresa, V.DescEntidad as [Entidad],
					v.Direccion, 'No' as Firmado, '' as FechaFirma 
					,Nomina=V.descNomina   
  FROM   #Empleados  v   
  Where id_recurso_vt not in     
       (Select id_recurso_vt From RH_FirmaDocumentos Where Firmado=1 and id_Doc=@Documento  and Periodo = @Periodo  )   
    and v.entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070)   
    and @Entidad in (-1,v.entidad)   
    and @Division in (-1,v.idDireccion)   
  order by NombreCompleto    
  end   
  else  
  begin  
    SELECT empleado as [No.Empleado], V.NombreCompleto as Nombre, CASE WHEN Entidad = 1301 OR
                      Entidad = 2050 OR
                      Entidad = 2041 OR
                      Entidad = 2042 OR
                      Entidad = 1110 OR
                      Entidad = 1100 OR
                      Entidad = 1000 OR
                      Entidad = 1200 OR
                      Entidad = 1400 OR
                      Entidad = 1500 OR
                      Entidad = 5000 OR
                      Entidad = 0 THEN 'Sin asignar' WHEN Entidad = 4020 THEN 'Formet' WHEN Entidad = 3030 OR
                      Entidad = 3050 OR
                      Entidad = 3051 OR
                      Entidad = 3052 OR
                      Entidad = 3053 OR
                      Entidad = 3054 OR
 Entidad = 3055 OR
                      Entidad = 3056 OR
                      Entidad = 4000 OR
                      Entidad = 3070 THEN 'Stabilit' END AS Empresa, V.DescEntidad as [Entidad],
					v.Direccion, 'No' as Firmado, '' as FechaFirma  
					,Nomina=V.descNomina 
  FROM   #Empleados   v  
  Where id_recurso_vt not in     
       (Select id_recurso_vt From RH_FirmaDocumentos Where Firmado=1 and id_Doc=@Documento  and Periodo = @Periodo  )   
    and @Entidad in (-1,v.entidad)   
    and @Division in (-1,v.idDireccion)   
  order by NombreCompleto  
  end  
   end



GO
/****** Object:  StoredProcedure [dbo].[SPQ_ConsultaFirma_VZT_Emp]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*    
Creado por: Cecilia Cárdenas    
Fecha: Mayo 2007    
Obejtivo: Consulta los empleados que firmaron la Carta de Conflicto de Intereses    
*/     
    
    
CREATE Proc [dbo].[SPQ_ConsultaFirma_VZT_Emp]       
 @ID numeric  
    
AS       
   
  
SELECT	id_recurso_vt,
		NombreCompleto,
		--Division,
		Division=case Entidad when '4020' then 'Formet' else 'Stabilit' end,
		RFC,    
        id_recurso_vt,
        convert(char(10),Fecha_Antiguedad,103)    
FROM	dbo.v_EmpleadosVerzatec    
Where	id_recurso_vt = @ID    

    
    
--Select *  into #Empleado from dbo.v_EmpleadosVerzatec    
  
--SELECT      id_recurso_vt, NombreCompleto,Division,RFC,    
--          id_recurso_vt, convert(char(10),Fecha_Antiguedad,103)    
--FROM         #Empleado   
--     Where id_recurso_vt = @ID


GO
/****** Object:  StoredProcedure [dbo].[SPQ_ConsultaFirmaEmp_VZT]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Creado por: Cecilia Cárdenas
Fecha: Mayo 2007
Obejtivo: Consulta si cierto empleado ya firmó la Carta de Conflicto de Intereses
*/ 
--DROP PROCEDURE SPQ_ConsultaFirmaEmp_VZT 9853


CREATE Proc [dbo].[SPQ_ConsultaFirmaEmp_VZT]   
 @ID numeric,
 @IdDoc integer 

AS   

declare @Firma as integer

set @Firma=0

Select @Firma=Firmado From RH_FirmaDocumentos Where id_recurso_vt=@ID and id_Doc=@IdDoc 

select @Firma as Firmado

GO
/****** Object:  StoredProcedure [dbo].[SPQ_ConsultaFirmaEmp_VZT_2009]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
Creado por: Cecilia Cárdenas    
Fecha: Mayo 2007    
Obejtivo: Consulta si cierto empleado ya firmó la Carta de Conflicto de Intereses    
*/     
--DROP PROCEDURE SPQ_ConsultaFirmaEmp_VZT 9853    
    
    
CREATE Proc [dbo].[SPQ_ConsultaFirmaEmp_VZT_2009]       
 @ID numeric,    
 @IdDoc integer,  
 @Periodo integer     
    
AS       
    
  
    
Select Firmado From RH_FirmaDocumentos 
Where id_recurso_vt=@ID 
and id_Doc=@IdDoc 
AND Periodo = @Periodo

GO
/****** Object:  StoredProcedure [dbo].[SPQ_ConsultaTodasFirmasEmp_VZT]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
Creado por: Mario Páez    
Fecha: Diciembre 2009
Obejtivo: Consulta si cierto empleado ya firmó todas las Cartas de Conflicto de Intereses    
*/     
    
CREATE Proc [dbo].[SPQ_ConsultaTodasFirmasEmp_VZT]      
	@ID numeric,    
	@IdsDocs varchar(100),  
	@Periodo integer     
AS       

    
Select	Firmado
From	RH_FirmaDocumentos 
Where	id_recurso_vt	= @ID 
		and id_Doc		in( select * from DelimStrToTable(@IdsDocs, ',') )
		and Periodo		= @Periodo

GO
/****** Object:  StoredProcedure [dbo].[SPQ_ConsultaVisitaEmp_VZT_2009]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
Creado por: Cecilia Cárdenas    
Fecha: Mayo 2007    
Obejtivo: Consulta si cierto empleado ya firmó la Carta de Conflicto de Intereses    
*/     
--DROP PROCEDURE SPQ_ConsultaFirmaEmp_VZT 9853    
    
    
create Proc [dbo].[SPQ_ConsultaVisitaEmp_VZT_2009]       
 @ID numeric,    
 @IdDoc integer,  
 @Periodo integer     
    
AS       
    
  
    
Select Visto From RH_VistaDocumentos 
Where id_recurso_vt=@ID 
and id_Doc=@IdDoc 
AND Periodo = @Periodo

GO
/****** Object:  StoredProcedure [dbo].[SPQ_DatosEmpleado]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPQ_DatosEmpleado]  
	@Division  int=-1,  
	@idDireccion  varchar(100)='-1',  
	@idArea   varchar(100)='-1',  
	@Empleado   int=-1,  
	@Nombre     varchar(500)='',
	@Entidad int =-1  
AS  
  

if @Nombre <> ''
begin
  
	if @Division = 1 or @Division = -1
	begin
	
		select  *   
		from	v_EmpleadosVerzatec e  
		where	@Entidad in (-1,e.Entidad) 
				and @idDireccion in (-1, e.idDireccion)
				and @idArea in (-1,e.idArea) 
				and e.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'
				and e.Empresa not like '%9%'
		order by e.NombreCompleto
		
	end 
	else if @Division = 2
	begin
	
		select  *   
		from	v_EmpleadosVerzatec e  
		where	@Entidad in (-1,e.Entidad) 
				and @idDireccion in (-1, e.idDireccion)
				and @idArea in (-1,e.idArea) 
				and e.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'
				and e.Entidad in (1301,2050,2041,2042,1110,1100,1000,1200,1400,1500,5000,0)
				and e.Empresa not like '%9%'
		order by e.NombreCompleto

	end
	else if @Division = 3
	begin
	
		select  *   
		from	v_EmpleadosVerzatec e  
		where	@Entidad in (-1,e.Entidad) 
				and @idDireccion in (-1, e.idDireccion)
				and @idArea in (-1,e.idArea) 
				and e.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'
				and e.Entidad in (4020)
				and e.Empresa not like '%9%'
		order by e.NombreCompleto

	end
	else if @Division = 4
	begin
	
		select  *   
		from	v_EmpleadosVerzatec e  
		where	@Entidad in (-1, e.Entidad) 
				and @idDireccion in (-1, e.idDireccion)
				and @idArea in (-1,e.idArea) 
				and e.NombreCompleto like '%'+Replace(@Nombre, ' ', '%')+'%'
				and e.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070)
				and e.Empresa not like '%9%'
		order by e.NombreCompleto
	
	end
	
	
end
else
	if @Division = 1 or @Division = -1
	begin
	
		select  *   
		from	v_EmpleadosVerzatec e  
		where	@Entidad in (-1,e.Entidad) 
				and @idDireccion in (-1, e.idDireccion)
				and @idArea in (-1,e.idArea) 
				and e.Empresa not like '%9%'
		order by e.NombreCompleto
	
	end 
	else if @Division = 2
	begin
	
		select  *   
		from	v_EmpleadosVerzatec e  
		where	@Entidad in (-1,e.Entidad) 
				and @idDireccion in (-1, e.idDireccion)
				and @idArea in (-1,e.idArea) 
				and e.Entidad in (1301,2050,2041,2042,1110,1100,1000,1200,1400,1500,5000,0)
				and e.Empresa not like '%9%'
		order by e.NombreCompleto

	end
	else if @Division = 3
	begin
	
		select  *   
		from	v_EmpleadosVerzatec e  
		where	@Entidad in (-1,e.Entidad) 
				and @idDireccion in (-1, e.idDireccion)
				and @idArea in (-1,e.idArea) 
				and e.Entidad in (4020)
				and e.Empresa not like '%9%'
		order by e.NombreCompleto

	end
	else if @Division = 4
	begin
		select  *   
		from	v_EmpleadosVerzatec e  
		where	@Entidad in (-1,e.Entidad) 
				and @idDireccion in (-1, e.idDireccion)
				and @idArea in (-1,e.idArea) 
				and e.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070)
				and e.Empresa not like '%9%'
		order by e.NombreCompleto
	end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_DatosEmpleado_cpvc_300109]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- /*Objetivo: Consulta datos del empleado con filtros opcionales  
--   Los datos los obtiene de la vista v_EmpleadosVerzatec  
--   La consulta es a nivel Verzatec (todas las empresas)  
--   Creado por:  Jaime Sánchez  
--   Fecha: 22-Feb-2007  
-- */  
CREATE Proc [dbo].[SPQ_DatosEmpleado_cpvc_300109]  
 @Division  int=-1,  
 @idDireccion  varchar(100)='-1',  
 @idArea   varchar(100)='-1',  
 @Empleado   int=-1,  
 @Nombre     varchar(500)=''  
AS  
  
-- SPQ_DatosEmpleado 2,'5000','5100',-1,''   
  
-- declare  @Division  int,  
--   @idDireccion  varchar(100),  
--   @idArea   varchar(100),  
--   @Empleado   int,  
--   @Nombre     varchar(500)  
-- select @Division  =2,  
--   @idDireccion ='5000',  
--   @idArea   ='5100',  
--   @Empleado   =-1,  
--   @Nombre     =''  
  
 select  *   
 from   v_EmpleadosVerzatec e  
 where  --Filtro por Division  
   (e.Empresa in (select  distinct Case @Division when 1 then e.Empresa else Empresa end  
      from  vt_Empresa    
      where  Empresa_Padre = @Division )  
   OR  
   @Division = -1)  
  
  --Filtro por Direccion  
 and (idDireccion = @idDireccion or @idDireccion = '-1')  
  --Filtro por Area  
 and (idArea = @idArea or @idArea = '-1')  
  --Filtro por Empleado  
 and (Empleado = @Empleado or @Empleado = -1)  
         --Filtro por Nombre  
 and     nombre+' '+paterno+' '+materno like  CASE @Nombre When '' then nombre+' '+paterno+' '+materno  
                                                           Else '%'+Replace(@Nombre, ' ', '%')+'%'      
                                              END  
 Order by NombreCompleto

GO
/****** Object:  StoredProcedure [dbo].[SPQ_DatosEmpleado_RESP_JASM_070827]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
/*Objetivo:	Consulta datos del empleado con filtros opcionales
		Los datos los obtiene de la vista v_EmpleadosVerzatec
		La consulta es a nivel Verzatec (todas las empresas)
  Creado por: 	Jaime Sánchez
  Fecha:	22-Feb-2007
*/
CREATE Proc [dbo].[SPQ_DatosEmpleado_RESP_JASM_070827]
	@Empresa	int=-1,
	@idDireccion 	varchar(100)='-1',
	@idArea 	varchar(100)='-1',
	@Empleado 	int=-1,
	@Nombre   	varchar(500)=''
AS

	select 	* 
	from 	v_EmpleadosVerzatec 
	where 	--Filtro por Direccion
		(Empresa = @Empresa or @Empresa = -1)
		--Filtro por Direccion
	and	(idDireccion = @idDireccion or @idDireccion = '-1')
		--Filtro por Area
	and	(idArea = @idArea or @idArea = '-1')
		--Filtro por Empleado
	and	(Empleado = @Empleado or @Empleado = -1)
        	--Filtro por Nombre
	and     nombre+' '+paterno+' '+materno like  CASE @Nombre When '' then nombre+' '+paterno+' '+materno
        	                                                  Else '%'+Replace(@Nombre, ' ', '%')+'%'    
                	                             END
	Order by NombreCompleto

GO
/****** Object:  StoredProcedure [dbo].[SPQ_DatosEmpleadoModSupervisores]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[SPQ_DatosEmpleadoModSupervisores]  
 @Division  int=-1,  
 @idDireccion  varchar(100)='-1',  
 @idArea   varchar(100)='-1',  
 @Empleado   int=-1,  
 @Nombre     varchar(500)='',
 @Compania int=0,
 @Nomina int=0  
AS  
  
-- SPQ_DatosEmpleado 2,'5000','5100',-1,''   
  
-- declare  @Division  int,  
--   @idDireccion  varchar(100),  
--   @idArea   varchar(100),  
--   @Empleado   int,  
--   @Nombre     varchar(500)  
-- select @Division  =2,  
--   @idDireccion ='5000',  
--   @idArea   ='5100',  
--   @Empleado   =-1,  
--   @Nombre     =''  
  
 select  *   
 from   v_EmpleadosVerzatec e  
 where  --Filtro por Division  
   (e.Empresa in (select  distinct Case @Division when 1 then e.Empresa else Empresa end  
      from  vt_Empresa    
      where  Empresa_Padre = @Division )  
   OR  
   @Division = -1)  
  
  --Filtro por Direccion  
 and (idDireccion = @idDireccion or @idDireccion = '-1')  
  --Filtro por Area  
 and (idArea = @idArea or @idArea = '-1')  
  --Filtro por Empleado  
 and (Empleado = @Empleado or @Empleado = -1)  
         --Filtro por Nombre  
 and     nombre+' '+paterno+' '+materno like  CASE @Nombre When '' then nombre+' '+paterno+' '+materno  
                                                           Else '%'+Replace(@Nombre, ' ', '%')+'%'      
                                              END  
and EmpresaFuente=@Compania
and Nomina=@Nomina
 Order by NombreCompleto

GO
/****** Object:  StoredProcedure [dbo].[SPQ_DatosJefe]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Objetivo:	Consultar plaza del Jefe
Creado por:	Jaime Sánchez
Fecha:		03-Oct-2007

grant exec on SPQ_DatosJefe to pinuser
*/
CREATE proc [dbo].[SPQ_DatosJefe]
		@Empresa int,
		@EmpresaFuente int,
		@Plaza	int,
		@id_recurso_vt int
AS
-- 	

-- sp_usu 'Jaime sanchez'
-- sp_usu 'carlos moreno'
-- sp_usu 'santiago veyt'

-- declare @Empresa int,
-- 		@EmpresaFuente int,
-- 		@Plaza	int,
-- 		@id_recurso_vt int
-- select 	@Empresa = 5000,
-- 		@EmpresaFuente = 8,
-- 		@Plaza = 2,
-- 		@id_recurso_vt = 1942
-- drop table #Dependientes

	set nocount on
	Create  Table #Dependientes
            (Empresa int not null,
		     EmpresaFuente int not null,
		     Plaza  int not null,
             Nivel int not null,
             Cadena varchar(1000) not null)
	insert into #dependientes exec SPQ_CH_GeneraDependenciasPermisos  @id_recurso_vt


	select 	*
	from 	vt_Organigrama o
	where 	o.Empresa = @Empresa
	and		o.EmpresaFuente = @EmpresaFuente
	and		o.plaza = @Plaza

--Validar Permisos (excluir las plazas que tenga marcadas como Excluidas)
	and		exists (select 	* 
					from 	#dependientes
					Where	o.Empresa_Superior = Empresa
					and		o.EmpresaFuente_Superior = EmpresaFuente
					and		o.Plaza_Superior = Plaza
					)

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Direccion]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPQ_Direccion]  
	@Empresa as int = 5000,  
	@Entidad as int      
AS          
          
    
Select * into #Direcciones from Organizacion_vzt.dbo.V_EmpleadosVerzatec    
    
if @Empresa = 2    
begin    

	Select distinct idDireccion as ID_Direccion,     
			Direccion as Desc_esp,     
			Direccion as Desc_ing    
	From	#Direcciones    
	where	entidad in (1301,2050,2041,2042,1110,1100,1000,1200,1400,1500,5000,0)    
			and not idDireccion  is null   
			and @entidad in (-1,entidad)    
	Order by idDireccion    
	
end    
else if @Empresa = 3    
begin  
  
	Select distinct idDireccion as ID_Direccion,     
			Direccion as Desc_esp,     
			Direccion as Desc_ing    
	From	#Direcciones    
	where	entidad in (4020)    
			and not idDireccion  is null  
			and @entidad in (-1,entidad)     
	Order by idDireccion   
 
end    
else if @Empresa = 4    
begin

	Select distinct idDireccion as ID_Direccion,     
			Direccion as Desc_esp,     
			Direccion as Desc_ing    
	From	#Direcciones    
	where	entidad in(3030,3050,3051,3052,3053,3054,3055,3056,4000,3070)    
			and not idDireccion  is null   
			and @entidad in (-1,entidad)   
	Order by idDireccion
		 
end    
else    
begin 
   
	Select distinct idDireccion as ID_Direccion,     
			Direccion as Desc_esp,     
			Direccion as Desc_ing    
	From	#Direcciones    
	where	not idDireccion  is null  
			and @entidad in (-1,entidad)     
	Order by idDireccion
	
end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_DireccionOrganizacional]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
 Objetivo: Consutlar Direccion Matricial    
 Creado Por: Jaime Sánchez    
 Fecha: 23-Oct-06    
*/ 
--SPQ_Divisiones
--SPQ_DireccionOrganizacional 4100   
CREATE Proc [dbo].[SPQ_DireccionOrganizacional]    
@Empresa as int=5000
AS    
    
 select  distinct     
  ID_Direccion = Nivel,    
  Desc_esp,    
  Desc_ing    
 from  VT_NivelesEstructura     
 where  estructura = 2 --Estructura Matricial    
 and id_NivelSuperior = 0    
 and Estatus = 1    
 and empresa=@Empresa --cacm: 10-sep-08  
 Order by Nivel 

/*
 select  *   
 from  VT_NivelesEstructura     
 where  estructura = 2 --Estructura Matricial    
 and id_NivelSuperior = 0    
 and Estatus = 1    
--and empresafuente=1 --cacm: 4-sep-08  
 Order by Nivel 
*/

GO
/****** Object:  StoredProcedure [dbo].[SPQ_DireccionOrganizacionalVZT]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPQ_DireccionOrganizacionalVZT]      
	@Empresa as int = 5000  
AS      
      

Select * into #Direcciones from Organizacion_vzt.dbo.V_EmpleadosVerzatec

if @Empresa = 2
begin

	Select distinct idDireccion as ID_Direccion, 
			Direccion as Desc_esp, 
			Direccion as Desc_ing
	From	#Direcciones
	where	entidad in (1301,2050,2041,2042,1110,1100,1000,1200,1400,1500,5000,0)
			and not idDireccion  is null
	Order by idDireccion

end
else if @Empresa = 3
begin

	Select distinct idDireccion as ID_Direccion, 
			Direccion as Desc_esp, 
			Direccion as Desc_ing
	From	#Direcciones
	where	entidad in (4020)
			and not idDireccion  is null
	Order by idDireccion
	
end
else if @Empresa = 4
begin

	Select distinct idDireccion as ID_Direccion, 
			Direccion as Desc_esp, 
			Direccion as Desc_ing
	From	#Direcciones
	where	entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070)
			and not idDireccion  is null
	Order by idDireccion
	
end
else
begin

	Select distinct idDireccion as ID_Direccion, 
			Direccion as Desc_esp, 
			Direccion as Desc_ing
	From	#Direcciones
	where	not idDireccion  is null
	Order by idDireccion

end

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Divisiones]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Objetivo: Consultar las divisiones que agrupan a las Empresas de Verzatec
	Creado por: Jaime Sánchez
	Fecha ultima Modificación: 13-Oct-2006	
*/
CREATE Proc [dbo].[SPQ_Divisiones]
AS
	select 	* 
	from 	vt_empresa
	where	Empresa_Padre in (0, 1)
	and		Estatus = 1

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Divisiones_Mayo09]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext SPQ_Divisiones  
--sp_helptext SPQ_AreaOrganizacional_Nov08  
  
/*  
  select Distinct       
  ID_Area = Convert(int, NE.Nivel),      
  ne.desc_esp,      
  ne.desc_ing    
--select *   
 From VT_NivelesEstructura  NED,      
  VT_NivelesEstructura  NE      
 Where NED.id_NivelEstructura = NE.id_NivelSuperior      
 And NED.Empresa = NE.Empresa      
 and NE.Estructura = 2      
 And NED.Nivel ='11000' --@Direccion      
and NED.EmpresaFuente=2    
*/  
  
  
/*    
 Objetivo: Consultar las divisiones que agrupan a las Empresas de Verzatec    
 Creado por: Jaime Sánchez    
 Fecha ultima Modificación: 13-Oct-2006     
*/    
CREATE Proc [dbo].[SPQ_Divisiones_Mayo09]    
AS    
/*  
 select Empresa=case Empresa when 1 then 1  
                             when 2 then 2    
                             when 3 then 4020  
                             when 4 then 3050 else 0 end  
,Descripcion  
--select *  
 from  vt_empresa    
 where Empresa_Padre in (0, 1)    
 and  Estatus = 1    
*/  
  
--create table ##Divisiones  
--(Empresa int,  
-- Descripcion varchar(100))  
--  
--insert into ##Divisiones  
--select 1,'Verzatec'  
--  
--insert into ##Divisiones  
--select 2,'Cuprum'  
--  
--insert into ##Divisiones  
--select 4020,'Formet'  
--  
--insert into ##Divisiones  
--select 9100,'Stabilit Mty-Mx'  
--  
--insert into ##Divisiones  
--select 9500,'Bayer'  
--  
--insert into ##Divisiones  
--select 9502,'Stabilit América'  
--  
--insert into ##Divisiones  
--select 9503,'Stabilit Europa'  
--  
--select * from ##Divisiones  
--  
--drop table ##Divisiones  
  
SELECT [Empresa]
      ,[Descripcion]
      ,[razon_social]
      ,[Empresa_Padre]
      ,[Estatus]
  FROM [ORGANIZACION_VZT].[dbo].[VT_Empresa]
where  Empresa_Padre in (0,1)
and estatus = 1 
/*  
select *--Empresa,Empresafuente,nomina,division,razon_social,descnomina,entidad,descentidad  
from organizacion_vzt.dbo.v_empleadosverzatec order by entidad  
  
select distinct Empresa,Empresafuente,nomina,division,razon_social,descnomina--,entidad,descentidad  
from organizacion_vzt.dbo.v_empleadosverzatec   
where descnomina not like '%sindicaliza%'  
and empresa<>5000  
order by Empresa,Empresafuente,nomina,division,razon_social,descnomina--,entidad,descentidad  
*/

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Divisiones_Nov08]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext SPQ_Divisiones
--sp_helptext SPQ_AreaOrganizacional_Nov08

/*
  select Distinct     
  ID_Area = Convert(int, NE.Nivel),    
  ne.desc_esp,    
  ne.desc_ing  
--select * 
 From VT_NivelesEstructura  NED,    
  VT_NivelesEstructura  NE    
 Where NED.id_NivelEstructura = NE.id_NivelSuperior    
 And NED.Empresa = NE.Empresa    
 and NE.Estructura = 2    
 And NED.Nivel ='11000' --@Direccion    
and NED.EmpresaFuente=2  
*/


/*  
 Objetivo: Consultar las divisiones que agrupan a las Empresas de Verzatec  
 Creado por: Jaime Sánchez  
 Fecha ultima Modificación: 13-Oct-2006   
*/  
CREATE Proc [dbo].[SPQ_Divisiones_Nov08]  
AS  
/*
 select Empresa=case Empresa when 1 then 1
                             when 2 then 2  
                             when 3 then 4020
                             when 4 then 3050 else 0 end
,Descripcion
--select *
 from  vt_empresa  
 where Empresa_Padre in (0, 1)  
 and  Estatus = 1  
*/

create table ##Divisiones
(Empresa int,
 Descripcion varchar(100))

insert into ##Divisiones
select 1,'Verzatec'

insert into ##Divisiones
select 2,'Cuprum'

insert into ##Divisiones
select 4020,'Formet'

insert into ##Divisiones
select 9100,'Stabilit Mty-Mx'

insert into ##Divisiones
select 9500,'Bayer'

insert into ##Divisiones
select 9502,'Stabilit América'

insert into ##Divisiones
select 9503,'Stabilit Europa'

select * from ##Divisiones

drop table ##Divisiones


/*
select *--Empresa,Empresafuente,nomina,division,razon_social,descnomina,entidad,descentidad
from organizacion_vzt.dbo.v_empleadosverzatec order by entidad

select distinct Empresa,Empresafuente,nomina,division,razon_social,descnomina--,entidad,descentidad
from organizacion_vzt.dbo.v_empleadosverzatec 
where descnomina not like '%sindicaliza%'
and empresa<>5000
order by Empresa,Empresafuente,nomina,division,razon_social,descnomina--,entidad,descentidad
*/

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Empresa]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPQ_Empresa] --0
	@Empresa_Padre as int
AS
BEGIN

	SET NOCOUNT ON;

	Select * into #Empleados from Organizacion_VZT.dbo.v_verzatec ev

if @Empresa_Padre = 2 
begin
	Select distinct [Entidad] as Empresa,
					[DescEntidad] as Descripcion,
					[DescEntidad] as razon_social,
					[Empresa] as Empresa_Padre,
					1 as Estatus
	from #Empleados
	--where Empresa = 5000 and Entidad in (1301,2050,2041,2042,1110,1100,1000,1200,1400,1500,5000,0)
	where Empresa = 5000 and Entidad in (5000)
	order by Descripcion
end
else if @Empresa_Padre = 3
begin
	Select distinct [Entidad] as Empresa,
					[DescEntidad] as Descripcion,
					[DescEntidad] as razon_social,
					[Empresa] as Empresa_Padre,
					1 as Estatus
	from #Empleados
	where Empresa = 5000 and Entidad in (4020)
	order by Descripcion
end
else if @Empresa_Padre = 4
begin
	Select distinct [Entidad] as Empresa,
					[DescEntidad] as Descripcion,
					[DescEntidad] as razon_social,
					[Empresa] as Empresa_Padre,
					1 as Estatus
	from #Empleados
	where Empresa = 5000 and Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070)
	order by Descripcion
end 
else if @Empresa_Padre = 1
begin
	Select distinct [Entidad] as Empresa,
					[DescEntidad] as Descripcion,
					[DescEntidad] as razon_social,
					[Empresa] as Empresa_Padre,
					1 as Estatus
	from #Empleados
	where Empresa = 5000 
	order by Descripcion
end 

else
begin
		SELECT distinct [Empresa]
      ,[Descripcion]
      ,[razon_social]
      ,[Empresa_Padre]
      ,[Estatus]
  FROM [ORGANIZACION_VZT].[dbo].[VT_Empresa]
 where Empresa_Padre in(1) and
	   @Empresa_Padre in(0,1,Empresa) and
	   Estatus = 1 AND Empresa <> 3
end
END



GO
/****** Object:  StoredProcedure [dbo].[SPQ_Empresas]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Objetivo: Consultar las Empresas por la Division que las agrupa
	Creado por: Jaime Sánchez
	Fecha ultima Modificación: 13-Oct-2006	
*/
Create Proc [dbo].[SPQ_Empresas]
	@Empresa_Padre int
AS

set nocount on
/*
declare @Empresa_Padre int
Set @Empresa_Padre = 5
drop table #Temp
drop table #Empresas
*/

	select * into #Temp
	from 	vt_empresa
	where	Empresa_Padre = @Empresa_Padre
	and	Estatus = 1
	
	declare @Entro int
	Set	@Entro = 0
		
	While Exists(	Select *
			from 	vt_empresa
			where	Empresa_Padre in (select empresa from #temp where Estatus = 1)
			and	Estatus = 1 )
	begin	
		set @Entro = 1
	
		Select * into #Empresas
		from 	vt_empresa
		where	Empresa_Padre in (select empresa from #temp)
		and	Estatus = 1 
	
		truncate table #Temp
	
		insert into #Temp
		select 	* 
		from 	vt_empresa
		where	Empresa_Padre in (select empresa from #Empresas)
	
	end

set nocount off
	if @Entro = 0 
		Select * from #Temp
	else
		select * from #Empresas

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Fotos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPQ_Fotos]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select urlFoto as UrlAnt,
	   id_recurso_vt as IdVzt
into #EmpleadosAnt
from organizacion_vzt.dbo.v_EmpleadosVerzatec 
where Empresa = 4100 --and id_recurso_vt = 4188

Select urlFoto as UrlNew,
	   id_recurso_vt as IdVzt
into #EmpleadosNew 
from organizacion_vzt.dbo.v_EmpleadosVerzatec 
where Empresa = 5000 and Entidad = 4020 --and id_recurso_vt = 4188

Select ea.IdVzt,ea.UrlAnt,en.UrlNew
FROM #EmpleadosAnt as ea, #EmpleadosNew as en 
where ea.IdVzt = en.IdVzt

END

GO
/****** Object:  StoredProcedure [dbo].[SPQ_FotosStabilit]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[SPQ_FotosStabilit]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select urlFoto as UrlAnt,
	   id_recurso_vt as IdVzt
into #EmpleadosAnt
from organizacion_vzt.dbo.v_EmpleadosVerzatec 
where Empresa like '%9%' --and id_recurso_vt = 4188

Select urlFoto as UrlNew,
	   id_recurso_vt as IdVzt
into #EmpleadosNew 
from organizacion_vzt.dbo.v_EmpleadosVerzatec 
where  Empresa = 5000 and Entidad in(3030,3050,3051,3052,3053,3054,3055,4000,0) --and id_recurso_vt = 4188

Select ea.IdVzt,ea.UrlAnt,en.UrlNew
FROM #EmpleadosAnt as ea, #EmpleadosNew as en 
where ea.IdVzt = en.IdVzt

END

GO
/****** Object:  StoredProcedure [dbo].[SPQ_FotosStabilitMigracion]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPQ_FotosStabilitMigracion]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select urlFoto as UrlAnt,
	   id_recurso_vt as IdVzt
into #EmpleadosAnt
from organizacion_vzt.dbo.v_EmpleadosVerzatec 
where Empresa like '%9%' --and id_recurso_vt = 4188

Select urlFoto as UrlNew,
	   id_recurso_vt as IdVzt
into #EmpleadosNew 
from organizacion_vzt.dbo.v_EmpleadosVerzatec 
where  Empresa = 5000 and Entidad in(3030,3050,3051,3052,3053,3054,3055,4000,3070) --3030,3050,3051,3052,3053,3054,3055,
--and id_recurso_vt = 1942

Select ea.IdVzt,ea.UrlAnt,en.UrlNew
FROM #EmpleadosAnt as ea, #EmpleadosNew as en 
where ea.IdVzt = en.IdVzt

END

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Organigrama_Hijos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPQ_Organigrama_Hijos]
	@PlazaSuperior 	int,
	@EmpresaSuperior int,
	@EmpresaFuenteSuperior int
AS


	set nocount on

-- drop table #Hijos
-- declare @PlazaSuperior 	int,
-- 	@EmpresaSuperior int
-- 
-- select	@PlazaSuperior 	= 127,
-- 	@EmpresaSuperior = 4100

	select 	re.id,
		o.plaza,
		compania = o.Empresa,
		o.EmpresaFuente,
		o.plaza_superior,
		Nombre_Completo = r.Nombre+' '+r.Paterno+' '+r.Materno,
		o.id_nivel_puesto,
		o.staff,
		Puesto = p.Desc_esp,
		Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
				from 	VT_Organigrama 
				where 	plaza_superior = o.Plaza
				and	Empresa_Superior = o.Empresa
				and	EmpresaFuente_Superior = o.EmpresaFuente
				and	Estatus = 1
				and	Publica = 1),
		re.empleado,
		re.nomina,
		--cc='',
		r.id_Recurso_Vt,
 		ev.urlFoto	
	into	#Hijos
	from 	VT_Organigrama o,
		VT_Recursos r,
		VT_RecursoEmpresa re,
		VT_Puesto p,
 		v_EmpleadosVerzatec ev
	where	r.id_Recurso_vt = o.id_Recurso_vt
	and	re.empresa = o.empresa
	and	re.EmpresaFuente = o.EmpresaFuente
	and	re.id_Recurso_vt = o.id_Recurso_vt
	and	re.estatus not in (2, 4)
	and	p.Empresa =* o.Empresa
	and	p.EmpresaFuente =* o.EmpresaFuente
	and	p.id_nivel_puesto =* o.id_nivel_puesto
	and	o.estatus = 1
	and	o.Publica = 1

and	ev.id_Recurso_vt =* o.id_Recurso_vt
and	ev.empresa =* o.empresa
and	ev.EmpresaFuente =* o.EmpresaFuente

	and	o.Plaza_Superior= @PlazaSuperior
	and	o.Empresa_Superior = @EmpresaSuperior
	and	o.EmpresaFuente_Superior = @EmpresaFuenteSuperior


	insert into #Hijos
	select 	0,
		o.plaza,
		compania = o.Empresa,
		o.EmpresaFuente,
		o.plaza_superior,
		Nombre_Completo = 'VACANTE',
		o.id_nivel_puesto,
		o.staff,
		Puesto = p.Desc_esp,
		Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
				from 	VT_Organigrama 
				where 	plaza_superior = o.Plaza
				and	Empresa_Superior = o.Empresa
				and	EmpresaFuente_Superior = o.EmpresaFuente
				and	Estatus = 1
				and	Publica = 1),
		0,
		0,
		--cc='',
		0,
		urlFoto = ''
	from 	VT_Organigrama o,
		VT_Puesto p
	where	p.Empresa =* o.Empresa
	and	p.EmpresaFuente =* o.EmpresaFuente
	and	p.id_nivel_puesto =* o.id_nivel_puesto
	and	o.estatus = 1
	and	o.Publica = 1
	and	o.id_Recurso_vt = 0
	and	o.Plaza_Superior= @PlazaSuperior
	and	o.Empresa_Superior = @EmpresaSuperior
	and	o.EmpresaFuente_Superior = @EmpresaFuenteSuperior

	set nocount off 
	select 	* 
	from 	#Hijos
	Order by Puesto 

-- 
-- select 	re.id,
-- 	o.plaza,
-- 	compania = o.Empresa,
-- 	o.EmpresaFuente,
-- 	o.plaza_superior,
-- 	Nombre_Completo = isnull(r.Nombre+' '+r.Paterno+' '+r.Materno, 'VACANTE'),
-- 	o.id_nivel_puesto,
-- 	o.staff,
-- 	Puesto = p.Desc_esp,
-- 	Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
-- 			from 	VT_Organigrama 
-- 			where 	plaza_superior = o.Plaza
-- 			and	Empresa_Superior = o.Empresa
-- 			and	EmpresaFuente_Superior = o.EmpresaFuente
-- 			and	Estatus = 1
-- 			and	Publica = 1),
-- 	re.empleado,
-- 	re.nomina,
-- 	cc='',
-- 	r.id_Recurso_Vt	
-- from 	VT_Organigrama o,
-- 	VT_Recursos r,
-- 	VT_RecursoEmpresa re,
-- 	VT_Puesto p
-- where	r.id_Recurso_vt =* o.id_Recurso_vt
-- and	re.empresa =* o.empresa
-- and	re.EmpresaFuente =* o.EmpresaFuente
-- and	re.id_Recurso_vt =* o.id_Recurso_vt
-- and	re.estatus not in (2, 4)
-- and	p.Empresa =* o.Empresa
-- and	p.EmpresaFuente =* o.EmpresaFuente
-- and	p.id_nivel_puesto =* o.id_nivel_puesto
-- and	o.estatus = 1
-- and	o.Publica = 1
-- and	o.Plaza_Superior= @PlazaSuperior
-- and	o.Empresa_Superior = @EmpresaSuperior
-- Order by p.Desc_esp

/*
select 	re.id,
	o.plaza,
	compania = o.Empresa,
	o.EmpresaFuente,
	o.plaza_superior,
	Nombre_Completo = r.Nombre+' '+r.Paterno+' '+r.Materno,
	o.id_nivel_puesto,
	o.staff,
	Puesto = p.Desc_esp,
	Hijos = 1,
	re.empleado,
	re.nomina,
	cc=''	
from 	VT_Organigrama o,
	VT_Recursos r,
	VT_RecursoEmpresa re,
	VT_Puesto p
where	r.id_Recurso_vt = o.id_Recurso_vt
and	re.empresa = o.empresa
and	re.EmpresaFuente = o.EmpresaFuente
and	re.id_Recurso_vt = o.id_Recurso_vt
and	re.estatus not in (2, 4)
and	p.Empresa =* o.Empresa
and	p.EmpresaFuente =* o.EmpresaFuente
and	p.id_nivel_puesto =* o.id_nivel_puesto
and	o.estatus = 1
and	o.Plaza_Superior= @PlazaSuperior
and	o.Empresa_Superior = @EmpresaSuperior


--Plazas Vacantes
Union (
select	null,
	o.plaza,
	compania = o.Empresa,
	o.EmpresaFuente,
	o.plaza_superior,
	Nombre_Completo = 'VACANTE',
	o.id_nivel_puesto,
	o.staff,
	Puesto = p.Desc_esp,
	Hijos = 1,
	null,
	null,
	cc=''	
from	VT_Organigrama o, 
	VT_Puesto p
Where	p.Empresa =* o.Empresa
and	p.EmpresaFuente =* o.EmpresaFuente
and	p.id_nivel_puesto =* o.id_nivel_puesto
and	o.estatus = 1
and	o.id_recurso_vt = 0 --Vacantes
and	o.Plaza_Superior= @PlazaSuperior
and	o.Empresa_Superior = @EmpresaSuperior
)

*/

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Organigrama_Hijos_TEST]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SPQ_Organigrama_Hijos_TEST]
	@PlazaSuperior 	int,
	@EmpresaSuperior int,
	@EmpresaFuenteSuperior int
AS


	set nocount on

-- drop table #Hijos
-- declare @PlazaSuperior 	int,
-- 	@EmpresaSuperior int
-- 
-- select	@PlazaSuperior 	= 127,
-- 	@EmpresaSuperior = 4100

	select 	re.id,
		o.plaza,
		compania = o.Empresa,
		o.EmpresaFuente,
		o.plaza_superior,
		Nombre_Completo = r.Nombre+' '+r.Paterno+' '+r.Materno,
		o.id_nivel_puesto,
		o.staff,
		Puesto = p.Desc_esp,
		Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
				from 	VT_Organigrama 
				where 	plaza_superior = o.Plaza
				and	Empresa_Superior = o.Empresa
				and	EmpresaFuente_Superior = o.EmpresaFuente
				and	Estatus = 1
				and	Publica = 1),
		re.empleado,
		re.nomina,
		--cc='',
		r.id_Recurso_Vt,
 		ev.urlFoto	
	into	#Hijos
	from 	VT_Organigrama o,
		VT_Recursos r,
		VT_RecursoEmpresa re,
		VT_Puesto p,
 		v_EmpleadosVerzatec ev
	where	r.id_Recurso_vt = o.id_Recurso_vt
	and	re.empresa = o.empresa
	and	re.EmpresaFuente = o.EmpresaFuente
	and	re.id_Recurso_vt = o.id_Recurso_vt
	and	re.estatus not in (2, 4)
	and	p.Empresa =* o.Empresa
	and	p.EmpresaFuente =* o.EmpresaFuente
	and	p.id_nivel_puesto =* o.id_nivel_puesto
	and	o.estatus = 1
	and	o.Publica = 1

and	ev.id_Recurso_vt =* o.id_Recurso_vt
and	ev.empresa =* o.empresa
and	ev.EmpresaFuente =* o.EmpresaFuente

	and	o.Plaza_Superior= @PlazaSuperior
	and	o.Empresa_Superior = @EmpresaSuperior
	and	o.EmpresaFuente_Superior = @EmpresaFuenteSuperior


	insert into #Hijos
	select 	0,
		o.plaza,
		compania = o.Empresa,
		o.EmpresaFuente,
		o.plaza_superior,
		Nombre_Completo = 'VACANTE',
		o.id_nivel_puesto,
		o.staff,
		Puesto = p.Desc_esp,
		Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
				from 	VT_Organigrama 
				where 	plaza_superior = o.Plaza
				and	Empresa_Superior = o.Empresa
				and	EmpresaFuente_Superior = o.EmpresaFuente
				and	Estatus = 1
				and	Publica = 1),
		0,
		0,
		--cc='',
		0,
		urlFoto = ''
	from 	VT_Organigrama o,
		VT_Puesto p
	where	p.Empresa =* o.Empresa
	and	p.EmpresaFuente =* o.EmpresaFuente
	and	p.id_nivel_puesto =* o.id_nivel_puesto
	and	o.estatus = 1
	and	o.Publica = 1
	and	o.id_Recurso_vt = 0
	and	o.Plaza_Superior= @PlazaSuperior
	and	o.Empresa_Superior = @EmpresaSuperior
	and	o.EmpresaFuente_Superior = @EmpresaFuenteSuperior

	set nocount off 
	select 	* 
	from 	#Hijos
	Order by Puesto 

-- 
-- select 	re.id,
-- 	o.plaza,
-- 	compania = o.Empresa,
-- 	o.EmpresaFuente,
-- 	o.plaza_superior,
-- 	Nombre_Completo = isnull(r.Nombre+' '+r.Paterno+' '+r.Materno, 'VACANTE'),
-- 	o.id_nivel_puesto,
-- 	o.staff,
-- 	Puesto = p.Desc_esp,
-- 	Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
-- 			from 	VT_Organigrama 
-- 			where 	plaza_superior = o.Plaza
-- 			and	Empresa_Superior = o.Empresa
-- 			and	EmpresaFuente_Superior = o.EmpresaFuente
-- 			and	Estatus = 1
-- 			and	Publica = 1),
-- 	re.empleado,
-- 	re.nomina,
-- 	cc='',
-- 	r.id_Recurso_Vt	
-- from 	VT_Organigrama o,
-- 	VT_Recursos r,
-- 	VT_RecursoEmpresa re,
-- 	VT_Puesto p
-- where	r.id_Recurso_vt =* o.id_Recurso_vt
-- and	re.empresa =* o.empresa
-- and	re.EmpresaFuente =* o.EmpresaFuente
-- and	re.id_Recurso_vt =* o.id_Recurso_vt
-- and	re.estatus not in (2, 4)
-- and	p.Empresa =* o.Empresa
-- and	p.EmpresaFuente =* o.EmpresaFuente
-- and	p.id_nivel_puesto =* o.id_nivel_puesto
-- and	o.estatus = 1
-- and	o.Publica = 1
-- and	o.Plaza_Superior= @PlazaSuperior
-- and	o.Empresa_Superior = @EmpresaSuperior
-- Order by p.Desc_esp

/*
select 	re.id,
	o.plaza,
	compania = o.Empresa,
	o.EmpresaFuente,
	o.plaza_superior,
	Nombre_Completo = r.Nombre+' '+r.Paterno+' '+r.Materno,
	o.id_nivel_puesto,
	o.staff,
	Puesto = p.Desc_esp,
	Hijos = 1,
	re.empleado,
	re.nomina,
	cc=''	
from 	VT_Organigrama o,
	VT_Recursos r,
	VT_RecursoEmpresa re,
	VT_Puesto p
where	r.id_Recurso_vt = o.id_Recurso_vt
and	re.empresa = o.empresa
and	re.EmpresaFuente = o.EmpresaFuente
and	re.id_Recurso_vt = o.id_Recurso_vt
and	re.estatus not in (2, 4)
and	p.Empresa =* o.Empresa
and	p.EmpresaFuente =* o.EmpresaFuente
and	p.id_nivel_puesto =* o.id_nivel_puesto
and	o.estatus = 1
and	o.Plaza_Superior= @PlazaSuperior
and	o.Empresa_Superior = @EmpresaSuperior


--Plazas Vacantes
Union (
select	null,
	o.plaza,
	compania = o.Empresa,
	o.EmpresaFuente,
	o.plaza_superior,
	Nombre_Completo = 'VACANTE',
	o.id_nivel_puesto,
	o.staff,
	Puesto = p.Desc_esp,
	Hijos = 1,
	null,
	null,
	cc=''	
from	VT_Organigrama o, 
	VT_Puesto p
Where	p.Empresa =* o.Empresa
and	p.EmpresaFuente =* o.EmpresaFuente
and	p.id_nivel_puesto =* o.id_nivel_puesto
and	o.estatus = 1
and	o.id_recurso_vt = 0 --Vacantes
and	o.Plaza_Superior= @PlazaSuperior
and	o.Empresa_Superior = @EmpresaSuperior
)

*/

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Organigrama_Padre]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	SPQ_Organigrama_Padre 7167, 5000
--grant exec on SPQ_Organigrama_Padre to pinuser
CREATE Proc [dbo].[SPQ_Organigrama_Padre]
	@Plaza 	int,
	@Empresa int,
	@EmpresaFuente int
AS
	
-- 
-- declare @Plaza 	int,
-- 	@Empresa int,
-- 	@EmpresaFuente int
-- select 	@Plaza 	= 12,
-- 	@Empresa = 5000,
-- 	@EmpresaFuente = 8

	select 	o.id_recurso_vt,
			re.id,
			o.plaza,
			compania = o.Empresa,
			o.EmpresaFuente,
			o.plaza_superior,
			Nombre_Completo = isnull(r.Nombre+' '+r.Paterno+' '+r.Materno, 'VACANTE'),
			o.id_nivel_puesto,
			o.staff,
			Puesto = p.Desc_esp,
			Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
					from 	VT_Organigrama 
					where 	plaza_superior = o.Plaza
					and	Empresa_Superior = o.Empresa
					and	EmpresaFuente_Superior = o.EmpresaFuente
					and	Estatus = 1
					and	Publica = 1),
			re.empleado,
			re.nomina,
			cc='',
			ev.urlFoto	
			--o.id_recurso_vt
	from 	VT_Organigrama o,
			VT_Recursos r,
			VT_RecursoEmpresa re,
			VT_Puesto p,
			v_EmpleadosVerzatec ev
	where	r.id_Recurso_vt =* o.id_Recurso_vt
	and		re.empresa =* o.empresa
	and		re.EmpresaFuente =* o.EmpresaFuente
	and		re.id_Recurso_vt =* o.id_Recurso_vt
	and		re.estatus not in (2, 4)
	and		p.Empresa =* o.Empresa
	and		p.EmpresaFuente =* o.EmpresaFuente
	and		p.id_nivel_puesto =* o.id_nivel_puesto
	and		o.estatus = 1
	and		o.Publica = 1
	and		ev.id_Recurso_vt =* o.id_Recurso_vt
	and		ev.empresa =* o.empresa
	and		ev.EmpresaFuente =* o.EmpresaFuente
	and		o.Plaza = @Plaza
	and		o.Empresa = @Empresa
	and		o.EmpresaFuente = @EmpresaFuente
	
--	Order by p.Desc_esp asc




/*
select 	re.id,
	o.plaza,
	compania = o.Empresa,
	o.EmpresaFuente,
	o.plaza_superior,
	Nombre_Completo = r.Nombre+' '+r.Paterno+' '+r.Materno,
	o.id_nivel_puesto,
	o.staff,
	Puesto = p.Desc_esp,
	Hijos = 1,
	re.empleado,
	re.nomina,
	cc=''	
from 	VT_Organigrama o,
	VT_Recursos r,
	VT_RecursoEmpresa re,
	VT_Puesto p
where	r.id_Recurso_vt = o.id_Recurso_vt
and	re.empresa = o.empresa
and	re.EmpresaFuente = o.EmpresaFuente
and	re.id_Recurso_vt = o.id_Recurso_vt
and	re.estatus not in (2, 4)
and	p.Empresa = o.Empresa
and	p.EmpresaFuente = o.EmpresaFuente
and	p.id_nivel_puesto = o.id_nivel_puesto
and	o.estatus = 1
--and	o.Publica = 1
and	o.plaza= @Plaza
and	o.empresa= @empresa


--Plazas Vacantes
Union (
select	null,
	o.plaza,
	compania = o.Empresa,
	o.EmpresaFuente,
	o.plaza_superior,
	Nombre_Completo = 'VACANTE',
	o.id_nivel_puesto,
	o.staff,
	Puesto = p.Desc_esp,
	Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
			from 	VT_Organigrama 
			where 	plaza_superior = o.Plaza
			and	Empresa_Superior = o.Empresa
			and	EmpresaFuente_Superior = o.EmpresaFuente
			and	Estatus = 1),
	null,
	null,
	cc=''	
from	VT_Organigrama o, 
	VT_Puesto p
Where	p.Empresa = o.Empresa
and	p.EmpresaFuente = o.EmpresaFuente
and	p.id_nivel_puesto = o.id_nivel_puesto
and	o.estatus = 1
and	o.id_recurso_vt = 0 --Vacantes
and	o.Publica = 1
and	o.plaza = @Plaza
and	o.empresa= @empresa
)

*/

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Organigrama_Padre_DistribucionPlaza]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- grant exec on SPQ_Organigrama_Padre to usrjob
CREATE Proc [dbo].[SPQ_Organigrama_Padre_DistribucionPlaza]
	@Plaza as	int,
 	@Empresa as int,
 	@EmpresaFuente as int
AS
	
 
 declare --@Plaza 	int,
 	--@Empresa int,
 	--@EmpresaFuente int,
	@Division int ,
	@Entidad int,
	@Direccion int,
	@Area int,
	@Nivel_Plaza 	int,
	@Nivel_Recurso 	int

-- Datos de Felipe Muzquiz
-- select @Plaza 	= 7167,
-- 	@Empresa = 5000,
-- 	@EmpresaFuente = 2


Declare @Periodo int
set @Periodo = year(getdate())
if @Plaza 	= 7167
begin
	Delete from [kiosco].[dbo].[CH_DistribucionPuestosOrganigrama] where Periodo = @Periodo
	Delete from [kiosco].[dbo].[CH_DistribucionRecursosOrganigrama] where Periodo = @Periodo
end
-- Buscar a Felipe Muzquiz
	select 	id_Recurso_Vt = isnull(r.id_Recurso_Vt, 0),
			-------------------------------
			o.Empresa,
			o.EmpresaFuente,
			 case when o.Entidad in (1000) then 1
			     when o.Entidad in (1301,1200,2050,2041,2042,1110,1100,1400,1500,5000,0) then 2
			     when o.Entidad in (4020) then 3
			     when o.Entidad in (3030,3050,3051,3052,3053,3054,3055,3056,4000,3070) then 4 end as Division,
			o.Entidad,
			Direccion =(/*--Direccion*/SELECT Nivel
                            FROM       Organizacion_vzt.dbo.VT_NivelesEstructura
                            WHERE      id_NivelEstructura = ne.id_NivelSuperior 
					AND Empresa = ne.Empresa 
					AND EmpresaFuente = ne.EmpresaFuente 
					AND (Fecha_Vigencia_Hasta IS NULL)
                                        AND Estructura = 2), 
			o.Area,
			o.plaza, 
			o.plaza_superior,
			Puesto = o.id_nivel_puesto,
			p.id_Nivel,
			-------------------------------
			Nivel_Plaza 	= IsNull(np.nivel, 0),
			Nivel_Recurso 	= case when re.id is null then 10 Else IsNull(nr.nivel, 0) End
	into #Empleado	
	from 	VT_Organigrama o,
			VT_Recursos r,
			VT_RecursoEmpresa re,
			VT_Puesto p,
	 		v_EmpleadosVerzatec ev,
			VT_NivelesEstructura ne,
			Kiosco.dbo.CH_Nivel_Plaza_vzt	np,
			Kiosco.dbo.CH_Nivel_Recurso_vzt	nr
	where	r.id_Recurso_vt = o.id_Recurso_vt
	and		re.empresa = o.empresa
	and		re.EmpresaFuente = o.EmpresaFuente
	and		re.id_Recurso_vt = o.id_Recurso_vt
	and		re.estatus not in (2, 4)
	and		p.Empresa =* o.Empresa
	and		p.EmpresaFuente =* o.EmpresaFuente
	and		p.id_nivel_puesto =* o.id_nivel_puesto
	and		o.estatus = 1
	and		o.Publica = 1
	and		ev.id_Recurso_vt =* o.id_Recurso_vt
	and		ev.empresa =* o.empresa
	and		ev.EmpresaFuente =* o.EmpresaFuente
	and		np.Empresa =* o.Empresa
	and		np.EmpresaFuente =* o.EmpresaFuente
	and		np.Plaza =* o.Plaza
	and		np.Periodo = @Periodo
	and		nr.id_recurso_vt =* o.id_recurso_vt
	and		nr.Periodo = @Periodo
	and		ne.Nivel = o.Area 
	AND		ne.Empresa = o.Empresa 
	AND		ne.EmpresaFuente = o.EmpresaFuente 
	AND		(ne.Fecha_Vigencia_Hasta IS NULL )
	AND		ne.Estructura = 2
	and		o.Plaza= @Plaza
	and		o.Empresa = @Empresa
	and		o.EmpresaFuente = @EmpresaFuente
	Order by np.Fecha_Mod asc, nr.Fecha_Mod asc, p.Desc_esp
	
	-- Preguntar si tiene hijos
	IF EXISTS(select * 
					from 	VT_Organigrama 
					where 	plaza_superior = @Plaza
					and	Empresa_Superior = @Empresa
					and	EmpresaFuente_Superior = @EmpresaFuente
					and	Estatus = 1
					and	Publica = 1)
	BEGIN
	Declare @Nivel as int
	-- Crear nivel de puesto
	set @Nivel = 0
	while @Nivel < 4
	begin
		INSERT INTO [kiosco].[dbo].[CH_DistribucionPuestosOrganigrama]
		Select Division,Entidad,Direccion,Area,@Periodo,@Nivel,0
		from #Empleado 
		if @Plaza 	= 7167
		begin
			INSERT INTO [kiosco].[dbo].[CH_DistribucionPuestosOrganigrama]
			Select 2,Entidad,Direccion,Area,@Periodo,@Nivel,0
			from #Empleado
		end
		set @Nivel = @Nivel+1
	end
	-- Crear nivel recurso
	set @Nivel = 0
	while @Nivel < 11
	begin
		INSERT INTO [kiosco].[dbo].[CH_DistribucionRecursosOrganigrama]
		Select Division,Entidad,Direccion,Area,@Periodo,@Nivel,0
		from #Empleado 
		if @Plaza 	= 7167
		begin
			INSERT INTO [kiosco].[dbo].[CH_DistribucionRecursosOrganigrama]
			Select 2,Entidad,Direccion,Area,@Periodo,@Nivel,0
			from #Empleado
		end
		set @Nivel = @Nivel+1
	end

	--- Ir a revisar hijos
	Exec SPQ_CH_Organigrama_Hijos_DistribucionPlaza @Plaza, @Empresa, @EmpresaFuente, @Periodo
end
	--obtener informacion Padre
	Select 	@Division = Division,
	@Entidad = Entidad,
	@Direccion = Direccion,
	@Area = Area,
	@Nivel_Plaza 	= Nivel_Plaza,
	@Nivel_Recurso 	= Nivel_Recurso
	from #Empleado

	-- Actualizar tabla de Recurso
	Update [kiosco].[dbo].[CH_DistribucionRecursosOrganigrama]
	set Cantidad = Cantidad +1
	where @Division = Empresa and
	@Entidad = Entidad and
	@Direccion = Direccion and
	@Area = Area and
	@Nivel_Recurso 	= Nivel

	-- ACTUALIZAR TABLA PUESTO
	Update [kiosco].[dbo].[CH_DistribucionPuestosOrganigrama]
	set Cantidad = Cantidad +1
	where @Division = Empresa and
	@Entidad = Entidad and
	@Direccion = Direccion and
	@Area = Area and
	@Nivel_Plaza 	= Nivel
	


--Select * from [kiosco].[dbo].[CH_DistribucionRecursosOrganigrama]
--Select * from [kiosco].[dbo].[CH_DistribucionPuestosOrganigrama]

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Organigrama_Padre_TEST]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	SPQ_Organigrama_Padre 7167, 5000
--grant exec on SPQ_Organigrama_Padre to pinuser
CREATE Proc [dbo].[SPQ_Organigrama_Padre_TEST]
	@Plaza 	int,
	@Empresa int,
	@EmpresaFuente int
AS
	
-- 
-- declare @Plaza 	int,
-- 	@Empresa int,
-- 	@EmpresaFuente int
-- select 	@Plaza 	= 12,
-- 	@Empresa = 5000,
-- 	@EmpresaFuente = 8

	select 	re.id,
		o.plaza,
		compania = o.Empresa,
		o.EmpresaFuente,
		o.plaza_superior,
		Nombre_Completo = isnull(r.Nombre+' '+r.Paterno+' '+r.Materno, 'VACANTE'),
		o.id_nivel_puesto,
		o.staff,
		Puesto = p.Desc_esp,
		Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
				from 	VT_Organigrama 
				where 	plaza_superior = o.Plaza
				and	Empresa_Superior = o.Empresa
				and	EmpresaFuente_Superior = o.EmpresaFuente
				and	Estatus = 1
				and	Publica = 1),
		re.empleado,
		re.nomina,
		cc='',
		ev.urlFoto	
	from 	VT_Organigrama o,
		VT_Recursos r,
		VT_RecursoEmpresa re,
		VT_Puesto p,
		v_EmpleadosVerzatec ev
	where	r.id_Recurso_vt =* o.id_Recurso_vt
	and	re.empresa =* o.empresa
	and	re.EmpresaFuente =* o.EmpresaFuente
	and	re.id_Recurso_vt =* o.id_Recurso_vt
	and	re.estatus not in (2, 4)
	and	p.Empresa =* o.Empresa
	and	p.EmpresaFuente =* o.EmpresaFuente
	and	p.id_nivel_puesto =* o.id_nivel_puesto
	and	o.estatus = 1
	and	o.Publica = 1

and	ev.id_Recurso_vt =* o.id_Recurso_vt
and	ev.empresa =* o.empresa
and	ev.EmpresaFuente =* o.EmpresaFuente

	and	o.Plaza = @Plaza
	and	o.Empresa = @Empresa
	and	o.EmpresaFuente = @EmpresaFuente
	
--	Order by p.Desc_esp asc




/*
select 	re.id,
	o.plaza,
	compania = o.Empresa,
	o.EmpresaFuente,
	o.plaza_superior,
	Nombre_Completo = r.Nombre+' '+r.Paterno+' '+r.Materno,
	o.id_nivel_puesto,
	o.staff,
	Puesto = p.Desc_esp,
	Hijos = 1,
	re.empleado,
	re.nomina,
	cc=''	
from 	VT_Organigrama o,
	VT_Recursos r,
	VT_RecursoEmpresa re,
	VT_Puesto p
where	r.id_Recurso_vt = o.id_Recurso_vt
and	re.empresa = o.empresa
and	re.EmpresaFuente = o.EmpresaFuente
and	re.id_Recurso_vt = o.id_Recurso_vt
and	re.estatus not in (2, 4)
and	p.Empresa = o.Empresa
and	p.EmpresaFuente = o.EmpresaFuente
and	p.id_nivel_puesto = o.id_nivel_puesto
and	o.estatus = 1
--and	o.Publica = 1
and	o.plaza= @Plaza
and	o.empresa= @empresa


--Plazas Vacantes
Union (
select	null,
	o.plaza,
	compania = o.Empresa,
	o.EmpresaFuente,
	o.plaza_superior,
	Nombre_Completo = 'VACANTE',
	o.id_nivel_puesto,
	o.staff,
	Puesto = p.Desc_esp,
	Hijos = (	select 	case when count(*)>0 then 1 else 0 end 
			from 	VT_Organigrama 
			where 	plaza_superior = o.Plaza
			and	Empresa_Superior = o.Empresa
			and	EmpresaFuente_Superior = o.EmpresaFuente
			and	Estatus = 1),
	null,
	null,
	cc=''	
from	VT_Organigrama o, 
	VT_Puesto p
Where	p.Empresa = o.Empresa
and	p.EmpresaFuente = o.EmpresaFuente
and	p.id_nivel_puesto = o.id_nivel_puesto
and	o.estatus = 1
and	o.id_recurso_vt = 0 --Vacantes
and	o.Publica = 1
and	o.plaza = @Plaza
and	o.empresa= @empresa
)

*/

GO
/****** Object:  StoredProcedure [dbo].[SPQ_PeriodoRH_FirmaDocumentos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPQ_PeriodoRH_FirmaDocumentos] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT distinct Periodo from RH_FirmaDocumentos
	order by Periodo desc
END

GO
/****** Object:  StoredProcedure [dbo].[SPQ_PuestosVacantes]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Objetivo:	Obtener los puestos vacantes por nombre de puesto
			Regresando la plaza que esta ocupando
	Creado Pro:	Jaime Sánchez
	Fecha:		23-Oct-2006
*/
CREATE Proc [dbo].[SPQ_PuestosVacantes]
	@Puesto varchar(300)
AS
	select 	CamposLlave = rtrim(cast(p.Empresa as char))+'-'+rtrim(cast(p.EmpresaFuente as char))+'-'+rtrim(cast(o.plaza as char)),
		rtrim(cast(o.Plaza as char))+' -- '+p.desc_esp+' ('+rtrim(cast(e.Descripcion as char)) +')'
	from 	vt_organigrama o,
		vt_puesto p,
		vt_empresa e
	where 	p.Empresa = o.Empresa
	and	p.EmpresaFuente = o.EmpresaFuente
	and	p.id_nivel_puesto = o.id_nivel_puesto
	and	e.Empresa = p.Empresa
	and	o.id_recurso_vt = 0 
	and 	o.estatus = 1
	and	p.desc_esp like Case @Puesto When '' then p.desc_esp
						 else '%'+Replace(@Puesto, ' ', '%')+'%'
				    End
	Order by p.desc_esp

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Recibo_Detalle]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
Objetivo: Consultar detalle del Recibo de Nómina de un empleado  
Creado por: Cecilia Araceli Cárdenas Mejía    
Fecha:  Mayo-2007   
*/
CREATE Procedure [dbo].[SPQ_Recibo_Detalle]
  @IdRecibo integer  
AS   
   

	--Obtener el ultimo periodo de la nomina del recibo a consultar
	Declare @MaxPN int
	Select 	@MaxPN = Max(PeriodoNomina) 
	From 	vt_ReciboEncabezado 
	

	   SELECT 	rd.id_recibo,
			Secuencia,
			dip,
			Concepto = ltrim(rtrim(concepto)),
			id_TipoMovimiento,
			Horas_Dias,
			dipConcepto = ltrim(rtrim(cast(dip as char)))+' '+ltrim(rtrim(Concepto)),  
			Importe = convert(char(12),cast(Importe as money),1),
			Saldo_Anterior = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior as money),1) else '0' end,
			Saldo_Actual = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual as money),1) else '0' end,
			Saldo_Anterior_Fondo_Ahorro = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Fondo_Ahorro as money),1) else '0' end,
			Saldo_Actual_Fondo_Ahorro = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Fondo_Ahorro as money),1) else '0' end,
			Saldo_Anterior_Ahorro_Voluntario = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Ahorro_Voluntario as money),1) else '0' end,
			Saldo_Actual_Ahorro_Voluntario = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Ahorro_Voluntario as money),1) else '0' end,
			Saldo_Anterior_Plan_Pensiones = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Plan_Pensiones as money),1) else '0' end,
			Saldo_Actual_Plan_Pensiones = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Plan_Pensiones as money),1) else '0' end,
			Saldo_Anterior_Infonavit = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Infonavit as money),1) else '0' end,
			Saldo_Actual_Infonavit = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Infonavit as money),1) else '0' end
	   FROM  	VT_ReciboDetalle rd,
			vt_reciboencabezado re
	   WHERE	rd.id_Recibo = re.id_Recibo   
	   AND		re.id_Recibo = @IdRecibo  
	   order by dip

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Recibo_Detalle_RESP_JASM_070612]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
Objetivo: Consultar detalle del Recibo de Nómina de un empleado
Creado por: Cecilia Araceli Cárdenas Mejía  
Fecha:  Mayo-2007 

DROP PROCEDURE dbo.SP_Recibo_Detalle

*/
CREATE Procedure [dbo].[SPQ_Recibo_Detalle_RESP_JASM_070612]
	 @IdRecibo integer
AS 
 
   SELECT	*,
		dipConcepto = ltrim(rtrim(cast(dip as char)))+' '+ltrim(rtrim(Concepto))
   FROM 	VT_ReciboDetalle 
   WHERE 	id_Recibo = @IdRecibo
   order by dip

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Recibo_Detalle_RESP_JASM_070627]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
Objetivo: Consultar detalle del Recibo de Nómina de un empleado  
Creado por: Cecilia Araceli Cárdenas Mejía    
Fecha:  Mayo-2007   
  
DROP PROCEDURE dbo.SPQ_Recibo_Detalle  
  
*/  
CREATE Procedure [dbo].[SPQ_Recibo_Detalle_RESP_JASM_070627]  
  @IdRecibo integer  
AS   
   
   SELECT 	id_recibo,
		Secuencia,
		dip,
		Concepto = ltrim(rtrim(concepto)),
		id_TipoMovimiento,
		Horas_Dias,
		dipConcepto = ltrim(rtrim(cast(dip as char)))+' '+ltrim(rtrim(Concepto)),  
		convert(char(12),cast(Importe as money),1) 		            as Importe,
		convert(char(12),cast(Saldo_Anterior as money),1)                   as Saldo_Anterior,
		convert(char(12),cast(Saldo_Actual as money),1)                     as Saldo_Actual,
		convert(char(12),cast(Saldo_Anterior_Fondo_Ahorro as money),1)      as Saldo_Anterior_Fondo_Ahorro,
		convert(char(12),cast(Saldo_Actual_Fondo_Ahorro as money),1)        as Saldo_Actual_Fondo_Ahorro,
		convert(char(12),cast(Saldo_Anterior_Ahorro_Voluntario as money),1) as Saldo_Anterior_Ahorro_Voluntario,
		convert(char(12),cast(Saldo_Actual_Ahorro_Voluntario as money),1)   as Saldo_Actual_Ahorro_Voluntario,
		convert(char(12),cast(Saldo_Anterior_Plan_Pensiones as money),1)    as Saldo_Anterior_Plan_Pensiones,
		convert(char(12),cast(Saldo_Actual_Plan_Pensiones as money),1)      as Saldo_Actual_Plan_Pensiones,
		convert(char(12),cast(Saldo_Anterior_Infonavit as money),1)         as Saldo_Anterior_Infonavit,
		convert(char(12),cast(Saldo_Actual_Infonavit as money),1)           as Saldo_Actual_Infonavit

   FROM  	VT_ReciboDetalle   
   WHERE  	id_Recibo = @IdRecibo  
   order by dip

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Recibo_Detalle_Saldos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*        
Objetivo: Consultar detalle del Recibo de Nómina de un empleado      
Creado por: Cecilia Araceli Cárdenas Mejía        
Fecha:  Mayo-2007       
*/ 
CREATE Procedure [dbo].[SPQ_Recibo_Detalle_Saldos]
  @IdRecibo integer      
AS       
    
 --Obtener el ultimo periodo de la nomina del recibo a consultar    
 Declare @MaxPN int
 
 
 Select  @MaxPN = Max(PeriodoNomina)     
 From  vt_ReciboEncabezado     
 Where Anio =  (select  top 1 Anio     
     from  VT_ReciboEncabezado     
     where  id_recibo = @IdRecibo    
     )    
     
    
    SELECT  rd.id_recibo,    
   Secuencia,    
   dip,    
   Concepto = ltrim(rtrim(concepto)),    
   id_TipoMovimiento,    
   Horas_Dias,    
   dipConcepto = ltrim(rtrim(cast(dip as char)))+' '+ltrim(rtrim(Concepto)),      
   Importe = convert(char(12),cast(Importe as money),1),  
   ------Quitar saldo solo para Dip 403-------------
   /* CACM: Comentarizo 10-Abr-2012
   Saldo_Anterior =  case dip
                     when 403 then '0'
                     else
                       Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior as money),1) else '0' end
                     end,    

   Saldo_Actual =  case dip
                     when 403 then '0'
                     else 
                       Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual as money),1) else '0' end
                     end,
   */
   --CACM: Nuevas líneas 10-Abr-2012
         Saldo_Anterior = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior as money),1) else '0' end, 
         Saldo_Actual = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual as money),1) else '0' end  ,             
   -------------------------------------------------
   Saldo_Anterior_Fondo_Ahorro = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Fondo_Ahorro as money),1) else '0' end,    
   Saldo_Actual_Fondo_Ahorro = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Fondo_Ahorro as money),1) else '0' end,    
   
   ------Quitar saldo solo para Dip 401-------------
   Saldo_Anterior_Ahorro_Voluntario = case dip
                                      when 401 then '0'
                                      else
										Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Ahorro_Voluntario as money),1) else '0' end
									  end,  

   Saldo_Actual_Ahorro_Voluntario = case dip
                                      when 401 then '0'
                                      else
                                        Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Ahorro_Voluntario as money),1) else '0' end
                                    end, 
  --------------------------------------------------     
   
   Saldo_Anterior_Plan_Pensiones = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Plan_Pensiones as money),1) else '0' end,    
   Saldo_Actual_Plan_Pensiones = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Plan_Pensiones as money),1) else '0' end,    
   Saldo_Anterior_Infonavit = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Infonavit as money),1) else '0' end,    
   Saldo_Actual_Infonavit = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Infonavit as money),1) else '0' end    
    FROM   VT_ReciboDetalle rd,    
   vt_reciboencabezado re    
    WHERE rd.id_Recibo = re.id_Recibo       
    AND  re.id_Recibo = @IdRecibo      
    order by dip


GO
/****** Object:  StoredProcedure [dbo].[SPQ_Recibo_Detalle_Saldos_SIND]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[SPQ_Recibo_Detalle_Saldos_SIND]
  @IdRecibo integer      
AS       
    
 --Obtener el ultimo periodo de la nomina del recibo a consultar    
 Declare @MaxPN int
 
 
 Select  @MaxPN = Max(PeriodoNomina)     
 From  vt_ReciboEncabezado_SIND     
 Where Anio =  (select  top 1 Anio     
     from  VT_ReciboEncabezado_SIND     
     where  id_recibo = @IdRecibo    
     )    
     
    
    SELECT  rd.id_recibo,    
   Secuencia,    
   dip,    
   Concepto = ltrim(rtrim(concepto)),    
   id_TipoMovimiento,    
   Horas_Dias,    
   dipConcepto = ltrim(rtrim(cast(dip as char)))+' '+ltrim(rtrim(Concepto)),      
   Importe = convert(char(12),cast(Importe as money),1),  
   ------Quitar saldo solo para Dip 403-------------
   /* CACM: Comentarizo 10-Abr-2012
   Saldo_Anterior =  case dip
                     when 403 then '0'
                     else
                       Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior as money),1) else '0' end
                     end,    

   Saldo_Actual =  case dip
                     when 403 then '0'
                     else 
                       Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual as money),1) else '0' end
                     end,
   */
   --CACM: Nuevas líneas 10-Abr-2012
         Saldo_Anterior = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior as money),1) else '0' end, 
         Saldo_Actual = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual as money),1) else '0' end  ,             
   -------------------------------------------------
   Saldo_Anterior_Fondo_Ahorro = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Fondo_Ahorro as money),1) else '0' end,    
   Saldo_Actual_Fondo_Ahorro = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Fondo_Ahorro as money),1) else '0' end,    
   
   ------Quitar saldo solo para Dip 401-------------
   Saldo_Anterior_Ahorro_Voluntario = case dip
                                      when 401 then '0'
                                      else
										Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Ahorro_Voluntario as money),1) else '0' end
									  end,  

   Saldo_Actual_Ahorro_Voluntario = case dip
                                      when 401 then '0'
                                      else
                                        Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Ahorro_Voluntario as money),1) else '0' end
                                    end, 
  --------------------------------------------------     
   
   Saldo_Anterior_Plan_Pensiones = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Plan_Pensiones as money),1) else '0' end,    
   Saldo_Actual_Plan_Pensiones = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Plan_Pensiones as money),1) else '0' end,    
   Saldo_Anterior_Infonavit = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Anterior_Infonavit as money),1) else '0' end,    
   Saldo_Actual_Infonavit = Case re.PeriodoNomina when @MaxPN then convert(char(12),cast(Saldo_Actual_Infonavit as money),1) else '0' end    
    FROM   VT_ReciboDetalle_SIND rd,    
   vt_reciboencabezado_SIND re    
    WHERE rd.id_Recibo = re.id_Recibo       
    AND  re.id_Recibo = @IdRecibo      
    order by dip



GO
/****** Object:  StoredProcedure [dbo].[SPQ_Recibo_Encabezado]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
Objetivo: Consultar datos del Recibo de Nómina de un empleado  
Creado por: Cecilia Araceli Cárdenas Mejía    
Fecha:  Mayo-2007   
  
DROP PROCEDURE dbo.SPQ_Recibo_Encabezado  

SPQ_Recibo_Encabezado 892,1,2007,5,10
*/  
CREATE Procedure [dbo].[SPQ_Recibo_Encabezado]  
	 @IdRecurso integer,  
	 @IdTipoRecibo integer,  
	 @Anio integer,  
	 @Mes integer,  
	 @PeriodoMes integer  
AS   
  
	SELECT	Enc.id_Recibo,  
		v.Empleado,  
		v.razon_social,    --Nombre o razón social de la Empresa  
		v.RFC_Empresa,     --Rfc de la Empresa  
		v.Reg_Patronal,    --Registro Patronal al que pertenece el Empleado  
		Enc.PeriodoMes,  
		Enc.PeriodoNomina,
		Enc.Fecha_Desde,  
		Enc.Fecha_Hasta,  
		Enc.CentroCosto,  
		Nombre = v.Nombre+' '+v.Paterno+' '+v.Materno,  
		v.RFC,                  
		v.cedula_imss,     --Numero de Imss del Empleado  
		v.Fecha_Antiguedad,  
		Sueldo_Diario = convert(char(12),cast(Enc.Sueldo_Diario as money),1),  
		v.Banco,  
		v.CuentaBanco  
   	FROM	VT_ReciboEncabezado Enc,  
  		V_EmpleadosVerzatec v    
	WHERE	Enc.id_recurso_vt = V.id_recurso_vt  
		--Parámetros Entrada  
	AND  	v.Id_recurso_vt = @IdRecurso   
	AND  	Enc.id_TipoRecibo = @IdTipoRecibo   
	AND  	Enc.Anio = @Anio   
	AND  	Enc.Mes = @Mes   
	AND  	Enc.PeriodoMes = @PeriodoMes

GO
/****** Object:  StoredProcedure [dbo].[SPQ_Recibo_Encabezado_SIND]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE Procedure [dbo].[SPQ_Recibo_Encabezado_SIND]  
	 @IdRecurso integer,  
	 @IdTipoRecibo integer,  
	 @Anio integer,  
	 @Mes integer,  
	 @PeriodoMes integer  
AS   
  
	SELECT	Enc.id_Recibo,  
		v.Empleado,  
		v.razon_social,    --Nombre o razón social de la Empresa  
		v.RFC_Empresa,     --Rfc de la Empresa  
		v.Reg_Patronal,    --Registro Patronal al que pertenece el Empleado  
		Enc.PeriodoMes,  
		Enc.PeriodoNomina,
		Enc.Fecha_Desde,  
		Enc.Fecha_Hasta,  
		Enc.CentroCosto,  
		Nombre = v.Nombre+' '+v.Paterno+' '+v.Materno,  
		v.RFC,                  
		v.cedula_imss,     --Numero de Imss del Empleado  
		v.Fecha_Antiguedad,  
		Sueldo_Diario = convert(char(12),cast(Enc.Sueldo_Diario as money),1),  
		v.Banco,  
		v.CuentaBanco  
   	FROM	VT_ReciboEncabezado_SIND Enc,  
  		V_EmpleadosVerzatec v    
	WHERE	Enc.id_recurso_vt = V.id_recurso_vt  
		--Parámetros Entrada  
	AND  	v.Id_recurso_vt = @IdRecurso   
	AND  	Enc.id_TipoRecibo = @IdTipoRecibo   
	AND  	Enc.Anio = @Anio   
	AND  	Enc.Mes = @Mes   
	AND  	Enc.PeriodoMes = @PeriodoMes


GO
/****** Object:  StoredProcedure [dbo].[SPQ_RH_CatDocumentos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPQ_RH_CatDocumentos]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select id_Doc, Descripcion From RH_CatDocumentos
END

GO
/****** Object:  StoredProcedure [dbo].[SPQ_RH_CatDocumentosActivos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPQ_RH_CatDocumentosActivos]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
   SELECT * FROM RH_CatDocumentos where Activo=1
   
END

GO
/****** Object:  StoredProcedure [dbo].[SPQ_RH_CorreccionRFC]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SPQ_RH_CorreccionRFC]

as

select r.id,r.paterno,r.materno,r.nombre,e.empleado,r.curp as rfc,e.estatus
into #Emp1
from SNOMB.IMESPRO_Vzt.dbo.recursos r, SNOMB.IMESPRO_Vzt.dbo.empleados e
where r.id=e.id
and compania=2 and nomina=3

---RFC Diferente---
/*
select r.id_recurso_vt,re.Empresa,re.EmpresaFuente,re.Empleado,       
       e.nombre,e.paterno,e.materno,--,r.nombre,r.paterno,r.materno
       r.RFC as RFC_Vzt,e.rfc as RFC_Eslabon
from organizacion_vzt.dbo.VT_Recursos r,organizacion_vzt.dbo.VT_RecursoEmpresa re, #Emp1 e
where r.id_recurso_vt=re.id_recurso_vt
and e.empleado=re.empleado
and e.RFC<>r.RFC
and re.Empresa=5000
and re.estatus not in (2,4)
order by e.empleado
*/

update organizacion_vzt.dbo.VT_Recursos
set RFC=e.RFC
from organizacion_vzt.dbo.VT_Recursos r,organizacion_vzt.dbo.VT_RecursoEmpresa re, #Emp1 e
where r.id_recurso_vt=re.id_recurso_vt
and e.empleado=re.empleado
and e.RFC<>r.RFC
and re.Empresa=5000
and re.estatus not in (2,4)


--Las correcciones del nombre y apellidos se harán en automático en el job de VZT_Actualiza_Organizacion_VZT 
--cuando el RFC ya esté de la VZT sea igual al de Eslabón

drop table #Emp1


/*
--select * into VT_Recursos_Resp_20Oct09 from VT_Recursos
--select * from VT_Recursos_Resp_20Oct09
*/

/*
select * from organizacion_vzt.dbo.VT_RecursoEmpresa where empleado=46639
select * from organizacion_vzt.dbo.VT_Recursos where id_recurso_vt=7035
select * from kiosco.dbo.in_usuarios where empleado=46639
*/

/*
select * from SNOMB.IMESPRO_Vzt.dbo.empleados where empleado=46639-- compania=2 and nomina=3
select * from SNOMB.IMESPRO_Vzt.dbo.recursos where id=23313

select * from empleados where empleado=46639--compania=2 and nomina=3
select * from recursos where id=23313
*/
--select * from SNOMB.IMESPRO_Vzt.dbo.empleados

GO
/****** Object:  StoredProcedure [dbo].[SPQ_RH_Plaza]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***
Objetivo:	Consultar la compania, plaza, nomina y #Empleado dado el ID del Recurso
Creado por:	Rosa María Flores García
Fecha:		23-Octubre-2006
***/

CREATE   Proc [dbo].[SPQ_RH_Plaza]
	@ID_Recurso_VT	int
AS
	/**
	IF Exists (Select * From tmprelid where id = @ID)
	Begin
		Select 	@ID = idhd
		From	tmprelid
		Where	id = @ID
		And	st = 1
	End
	**/

	--declare	@ID_Recurso_VT	int
	--set	@ID_Recurso_VT = 1942

	Select	Compania	= RE.Empresa, 
		Plaza		= O.Plaza,
		Nomina		= RE.nomina,
		Empleado	= RE.empleado
	From	vt_RecursoEmpresa	RE,
		vt_Organigrama		O		
	Where	RE.id_recurso_vt = O.id_recurso_vt 
	And	RE.id_recurso_vt = @ID_Recurso_VT
	And	RE.estatus in (1, 3)
	And	O.estatus = 1

GO
/****** Object:  StoredProcedure [dbo].[SPU_ActualizaFirma_VZT]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Creado por: Cecilia Cárdenas
Fecha: Mayo 2007
Obejtivo: Registra la firma de los empleados que leyeron la Carta de Conflicto de Intereses
*/ 
--DROP PROCEDURE SPU_ActualizaFirma_VZT  
--SPU_ActualizaFirma 34,2

CREATE Proc [dbo].[SPU_ActualizaFirma_VZT]  
 @ID numeric,
 @IdDoc integer

AS   

declare @Busca as integer
set @Busca=0

Select @Busca=id_recurso_vt From RH_FirmaDocumentos Where id_recurso_vt=@ID and id_Doc=@IdDoc 

if @Busca<>0
   begin
	UPDATE RH_FirmaDocumentos 
	SET Firmado=1, FechaFirma=convert(char(10),getdate(),112)
	WHERE id_recurso_vt=@ID and id_Doc=@IdDoc 
   end
else
   begin
	INSERT INTO RH_FirmaDocumentos(id_recurso_vt,id_Doc,Firmado,FechaFirma) 
	VALUES (@ID,@IdDoc,1,convert(char(10),getdate(),112))
   end

GO
/****** Object:  StoredProcedure [dbo].[SPU_ActualizaFirma_VZT_2009]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
Obejtivo: Registra la firma de los empleados que leyeron la Carta de Conflicto de Intereses    
*/         
CREATE Proc [dbo].[SPU_ActualizaFirma_VZT_2009]      
 @ID numeric,    
 @IdDoc integer,    
 @Periodo integer   
AS       
    
 
if exists (Select 1 From RH_FirmaDocumentos Where id_recurso_vt = @ID and id_Doc = @IdDoc and @Periodo = Periodo)  
begin    
	UPDATE	RH_FirmaDocumentos     
	SET		Firmado		= 1,
			FechaFirma	= getdate()    
	WHERE	id_recurso_vt	= @ID and
			id_Doc			= @IdDoc and 
			@Periodo		= Periodo    
end    
else    
begin    
	INSERT INTO RH_FirmaDocumentos(id_recurso_vt, id_Doc, Firmado, FechaFirma, Periodo)     
	VALUES (@ID, @IdDoc, 1, getdate(), year(getdate()))    
end


-- Desbloquea MeRH
update	kiosco.dbo.CH_ProcesoPADE2010_BloqueadosMiErh 
set		EstatusCarta = 0 ,
		FechaActivacionCarta = getdate()
where	IdVzt = @ID

GO
/****** Object:  UserDefinedFunction [dbo].[DelimStrToTable]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- Where Campo IN (select * from DelimStrToTable(@Parametro,','))    
Create FUNCTION [dbo].[DelimStrToTable]   
(  
    -- Add the parameters for the function here  
    @delimStr varchar(8000),   
    @delimchar char  
)  
RETURNS   
@StrValTable TABLE   
(  
    -- Add the column definitions for the TABLE variable here  
    StrVal varchar(1000)          
)  
AS  
BEGIN  
    -- Fill the table variable with the rows for your result set  
    declare @strlist varchar(8000), @pos int, @delim char, @lstr varchar(1000)  
    set @strlist = @delimStr  
    set @delim = @delimchar  
  
while ((len(@strlist) > 0) and (@strlist <> ''))  
begin  
    set @pos = charindex(@delim, @strlist)  
      
    if @pos > 0  
    begin  
        set @lstr = substring(@strlist, 1, @pos-1)  
        set @strlist = ltrim(substring(@strlist,charindex(@delim, @strlist)+1, 8000))  
    end  
    else  
    begin  
        set @lstr = @strlist  
        set @strlist = ''  
    end  
    Insert @StrValTable values (@lstr)  
    --print @lstr  
end  
      
    RETURN   
END  
  
GO
/****** Object:  UserDefinedFunction [dbo].[fnCodigoPotencial]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	Function [dbo].[fnCodigoPotencial](@id_recurso_vt int, @Periodo int)
Returns int
AS
Begin

	Declare	@CodigoPotencial int

	-- Esta función se esta utilizando para obtener el código
	-- de PyD el cual se almacena en el campo "codigo"
	-- la combinación de los campos idCodigoPotencia con
	-- idCodigoDesempeno da dicho resultado
	
	--Select	@CodigoPotencial = pd.idCodigoPotencial
	Select	@CodigoPotencial = pd.codigo
	from 	DesempenoRhImsalum.dbo.tblEvaluacionPyD	pd,
		Organizacion_vzt.dbo.VT_RecursoEmpresa 	E
	where	pd.Empresa 	= E.Empresa
	and	pd.Empleado 	= E.Empleado
	and	E.estatus 	not in (2, 4)
	and	E.id_recurso_vt	= @id_recurso_vt
	and	pd.Anio 	= @Periodo

	Return @CodigoPotencial 
	
	
End



GO
/****** Object:  UserDefinedFunction [dbo].[fnGetIDRECVT]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	Function [dbo].[fnGetIDRECVT](@Nombre varchar(100))
returns int
as

Begin
	Declare	@IDRECVT int
	
	Select	@IDRECVT = r.id_recurso_vt
	From	VT_RECURSOS 		r,
		VT_RECURSOEMPRESA 	e
	where	r.id_recurso_vt = e.id_recurso_vt
	and	(e.estatus 	<> 2 			)--Or @IncBaja = 1
	And	nombre + ' ' + paterno + ' ' + materno = @Nombre

	Return @IDRECVT

End


GO
/****** Object:  UserDefinedFunction [dbo].[fnGetName]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[fnGetName](@IDRECVT int)
returns varchar(100)
as

Begin
	Declare	@Nombre varchar(100)
	
	Select	@Nombre	= nombre + ' ' + paterno + ' ' + materno
	From	VT_Recursos
	Where	id_recurso_vt = @IDRECVT 

	Return @Nombre

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnObtenAniosMesesTranscurridos]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- select dbo.fnObtenAniosMesesTranscurridos('2006-02-02', '2010-02-12')

CREATE Function [dbo].[fnObtenAniosMesesTranscurridos](@fecha datetime, @hoy datetime)
returns varchar(5)
as
Begin
	Declare	@AniosMeses varchar(5), @anios varchar(2), @meses varchar(2)
	
	Select 	@anios = convert(varchar,datediff(month, @fecha, @hoy) / 12), 	@meses = convert(varchar,(datediff(month, @fecha, @hoy) % 12))
	Select @AniosMeses = @anios + '.' + @meses

	Return @AniosMeses 
End



GO
/****** Object:  View [dbo].[v_EmpleadosVerzatec]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_EmpleadosVerzatec] as

SELECT	e.id_recurso_vt, e.Empresa, e.EmpresaFuente, 
	emp.Empresa as idDivision, emp.Descripcion as Division, div.razon_social, div.RFC as RFC_Empresa, 
	e.Empleado, e.id, r.Nombre + ' ' + r.Paterno + ' ' + r.Materno as NombreCompleto, r.Nombre, r.Paterno, r.Materno, e.Nomina, n.Desc_esp as DescNomina, r.RFC, r.CURP,
	e.Fecha_Nacimiento, e.Fecha_Antiguedad, (select dbo.fnObtenAniosMesesTranscurridos (e.Fecha_Antiguedad, getdate())) as Antiguedad_Empresa,
	e.Fecha_Baja, si.Reg_Patronal, si.Sucursal_IMSS, si.Razon_Social as Razon_Social_IMSS, e.cedula_imss, 
	ep.fecha_vigencia_desde as Fecha_Puesto, (select dbo.fnObtenAniosMesesTranscurridos (ep.fecha_vigencia_desde, getdate())) as Antiguedad_Puesto,
	p.id_nivel_puesto as idPuesto, p.Desc_esp as Puesto, dir.Nivel as idDireccion, dir.Desc_esp as Direccion, o.Area as idArea, area.Desc_esp as Area, 
	cc.Nivel as CentroCosto, cc.Desc_esp as DescCentroCosto, e.e_mail, 
	case when isnull(pBB.id_nivel_puesto,'') = '' then '' else convert(varchar,ep.fecha_vigencia_desde,120) end as Fecha_Puesto_BB,
	ep.plaza, e.Banco, e.CuentaBanco, o.Entidad, 
	CASE o.Entidad 
		WHEN 1000 THEN '1000 - Staff Aluminio' 
		WHEN 1100 THEN '1100 - Perfiles Mty' 
		WHEN 1110 THEN '1110 - Perfiles Mex' 
		WHEN 1200 THEN '1200 - Escaleras'
		WHEN 1301 THEN '1301 - Ventanas' 
		WHEN 1400 THEN '1400 - Perfiles Guadalajara ' 
		WHEN 1500 THEN '1500 - Perfiles Comercial ' 
		WHEN 2041 THEN '2041 - Tiendas Cuprum'
		WHEN 2050 THEN '2050 - Metales Díaz' 
		WHEN 3030 THEN '3030 - Bayer' 
		WHEN 3050 THEN '3050 - Stabilit Villa de García' 
		WHEN 3051 THEN '3051 - Tlanepantla' 
		WHEN 3052 THEN '3052 - Guadalajara' 
		WHEN 3053 THEN '3053 - Villahermosa' 
		WHEN 3054 THEN '3054 - Tultitlan' 
		WHEN 3055 THEN '3055 - Mexicali' 
		WHEN 3056 THEN '3056 - Stabilit America'
		WHEN 3060 THEN '3060 - Stabilit NPI'
		WHEN 3070 THEN '3070 - Stabilit Europa'
		WHEN 4000 THEN '4000 - Stabilit America' 
		WHEN 4020 THEN '4020 - Formet' 
		WHEN 5000 THEN '5000 - Staff Verzatec' 
		WHEN 2042 THEN '2042 - Staff Tiendas Cuprum & MD' 
		ELSE '0 – Louisville' 
	END as DescEntidad, 
	idUbicacion = o.Ubicacion, ub.Desc_esp as Ubicacion, 
	o.Plaza_Superior, o.Empresa_Superior, o.EmpresaFuente_Superior,  id_NivelPuesto = p.id_Nivel,
	'http://SNOMB/Fotos/' + rtrim(cast(e.Empleado AS char)) + '.jpg' as UrlFoto,
--	CASE 
--		WHEN e.Empresa > 9000 THEN -- Stabilit
--				CASE WHEN e.Nomina in (1,3,4,6) 
--							THEN 'http://SNOMB/Credenciales/Stabilit/Empleados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' 
--							ELSE 'http://SNOMB/Credenciales/Stabilit/Sindicalizados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' END 
--		WHEN e.Empresa BETWEEN 4000 AND 4999  THEN -- Formet
--				CASE WHEN e.Nomina in (2,4,5,6) 
--							THEN 'http://SNOMB/Credenciales/Formet/Empleados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' 
--							ELSE 'http://SNOMB/Credenciales/Formet/Sindicalizados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' END 
--		WHEN e.Empresa = 5000 THEN 
--				CASE WHEN e.EmpresaFuente > 3 AND e.EmpresaFuente <> 8 
--							THEN 'http://SNOMB/Credenciales/' + rtrim(cast(e.EmpresaFuente AS char)) + '/' + rtrim(cast(e.Nomina AS char)) + '/Foto/' + rtrim(cast(e.Empleado AS char))  + '.jpg' 
--							ELSE 'http://SNOMB/Credenciales/' + rtrim(cast(e.EmpresaFuente AS char)) + '/Foto/' + rtrim(cast(e.Nomina AS char)) + '/' + rtrim(cast(e.Empleado AS char)) + '.jpg' END 
--		ELSE '' END AS UrlFoto, 
		e.Estatus, 	isnull(o.APLICA_HABILIDADES,'') as APLICA_HABILIDADES
		
FROM  VT_RecursoEmpresa e 
	INNER JOIN VT_Recursos r ON r.id_recurso_vt = e.id_recurso_vt 
	INNER JOIN VT_Nomina n ON 	n.Empresa = e.Empresa AND n.EmpresaFuente = e.EmpresaFuente AND n.Nomina = e.Nomina 
	INNER JOIN VT_EmpleadosPlazas ep ON ep.Empresa = e.Empresa AND ep.EmpresaFuente = e.EmpresaFuente AND ep.id_recurso_vt = e.id_recurso_vt 
	INNER JOIN VT_Organigrama o ON o.Empresa = ep.Empresa AND o.EmpresaFuente = ep.EmpresaFuente AND o.Plaza = ep.plaza AND o.id_recurso_vt = e.id_recurso_vt
	INNER JOIN VT_Puesto p ON p.Empresa = o.Empresa AND p.EmpresaFuente = o.EmpresaFuente AND p.id_nivel_puesto = o.id_nivel_puesto  
	INNER JOIN VT_SucursalIMSS si ON si.Empresa = e.Empresa AND si.EmpresaFuente = e.EmpresaFuente AND si.Sucursal_IMSS = e.Sucursal_IMSS 
	INNER JOIN VT_Empresa div ON div.Empresa = e.Empresa  
	INNER JOIN VT_Empresa emp ON emp.Empresa = div.Empresa_Padre
	INNER JOIN VT_NivelesEstructura area ON area.Nivel = o.Area AND area.Empresa = o.Empresa AND area.EmpresaFuente = o.EmpresaFuente	 
	INNER JOIN VT_NivelesEstructura dir ON dir.id_NivelEstructura = area.id_NivelSuperior AND dir.Empresa = area.Empresa AND dir.EmpresaFuente = area.EmpresaFuente 
	INNER JOIN VT_NivelesEstructura cc ON cc.id_NivelEstructura = o.CentroCosto AND cc.Empresa = o.Empresa AND cc.EmpresaFuente = o.EmpresaFuente  
	INNER JOIN VT_NivelesEstructura ub ON ub.Estructura = o.EstructuraUbicacion AND ub.Nivel = o.Ubicacion AND ub.Empresa = o.Empresa AND ub.EmpresaFuente = o.EmpresaFuente
	LEFT JOIN VT_Puesto pBB ON pBB.Empresa = ep.Empresa and pBB.EmpresaFuente = ep.EmpresaFuente and pBB.id_nivel_puesto = p.id_nivel_puesto
WHERE	
	e.Estatus not in (2,4) 
AND ep.fecha_vigencia_hasta is null 
AND o.Estatus = 1 
AND si.Estatus = 1
AND div.Estatus = 1
AND emp.Estatus = 1
AND area.Fecha_Vigencia_Hasta is null AND area.Estructura = 2
AND dir.fecha_vigencia_hasta is null AND dir.Estructura = 2 	
AND cc.fecha_vigencia_hasta is null AND cc.Estructura = 1 
AND ub.fecha_vigencia_hasta is null 
--AND e.empleado = 42557
 --AND CHARINDEX('BLACK', pBB.Desc_esp) > 0 
--AND e.empleado IN (51554, 53108, 53127, 53235)

GO
/****** Object:  View [dbo].[v_EmpleadosVerzatec_ppgreen]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_EmpleadosVerzatec_ppgreen] as
SELECT     e.id_recurso_vt, 
e.Empresa, 
e.EmpresaFuente,
 idDivision = emp2.Empresa, 
Division = emp2.Descripcion, 
emp.razon_social, 
RFC_Empresa = emp.RFC, 
e.Empleado, 
e.id, 
NombreCompleto = r.Nombre + ' ' + r.Paterno + ' ' + r.Materno,
r.Nombre, 
r.Paterno, 
r.Materno,
e.Nomina, 
DescNomina = n.Desc_esp, 
RFC = r.RFC, 
e.Fecha_Nacimiento,
e.Fecha_Antiguedad, 
Antiguedad_Empresa = CASE E.FECHA_ANTIGUEDAD WHEN 0 THEN '0.0' ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, E.FECHA_ANTIGUEDAD, getdate()) / 30.4)) / 12) + '.' + 
CONVERT(varchar(2), (CONVERT(int, datediff(y, E.FECHA_ANTIGUEDAD, getdate()) / 30.4)) % 12) END, 
e.Fecha_Baja, 
si.Reg_Patronal, 
si.Sucursal_IMSS, 
Razon_Social_IMSS = si.Razon_Social, 
e.cedula_imss, 
Fecha_Puesto = ep.Fecha_vigencia_desde, 
Antiguedad_Puesto = CASE ep.fecha_vigencia_desde WHEN 0 THEN '0.0' ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, ep.fecha_vigencia_desde, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, ep.fecha_vigencia_desde, getdate

()) / 30.4)) % 12) END, 
idPuesto = p.id_nivel_puesto, 
Puesto = p.Desc_esp, 
idDireccion = (/*--Direccion*/ SELECT Nivel
                            FROM          VT_NivelesEstructura
                            WHERE      id_NivelEstructura = ne.id_NivelSuperior AND Empresa = ne.Empresa AND EmpresaFuente = ne.EmpresaFuente AND Fecha_Vigencia_Hasta IS NULL AND Estructura = 2), 
Direccion =  (/* --Direccion*/ SELECT Desc_esp
                            FROM          VT_NivelesEstructura
                            WHERE      id_NivelEstructura = ne.id_NivelSuperior AND Empresa = ne.Empresa AND EmpresaFuente = ne.EmpresaFuente AND Fecha_Vigencia_Hasta IS NULL AND Estructura = 2),
 idArea = o.Area, 
Area = ne.Desc_esp, 
/*idCentroCosto = o.CentroCosto,*/ 
CentroCosto = neCC.Nivel, 
DescCentroCosto = neCC.Desc_esp, 
e_mail = e.e_mail, 
Fecha_Puesto_BB = (/* -- Fecha Puesto BlackBelt		*/ SELECT isnull(min(ep2.Fecha_vigencia_desde), '')
                            FROM          VT_EmpleadosPlazas ep2, VT_Organigrama o2, VT_Puesto p2
                            WHERE      ep2.Empresa = ep.Empresa AND ep2.EmpresaFuente = ep.EmpresaFuente AND ep2.id_recurso_vt = e.id_recurso_vt AND o2.Plaza = ep2.Plaza AND p2.id_nivel_puesto = o2.id_nivel_puesto AND p2.Empresa = o2.Empresa AND p2.EmpresaFuente = o2.EmpresaFuente AND  p2.Desc_esp LIKE '%BLACK%'), 
o.plaza, 
e.Banco, 
e.CuentaBanco,
o.Entidad, 
DescEntidad = CASE o.Entidad WHEN 1000 THEN '1000 – Staff' WHEN 1100 THEN '1100 - Perfiles Mty' WHEN 1110 THEN '1110 - Perfiles Mex' WHEN 1200 THEN '1200 - Escaleras'
WHEN 1301 THEN '1301 – Ventanas' WHEN 1400 THEN '1400 – Perfiles Guadalajara ' WHEN 1500 THEN '1500 – Perfiles Comercial ' WHEN 2041 THEN '2041 - Tiendas Cuprum'
WHEN 2050 THEN '2050 - Metales Díaz' WHEN 3030 THEN '3030 - Bayer' WHEN 3050 THEN '3050 – Stabilit Villa de García' WHEN 3051 THEN '3051 - Tlanepantla' WHEN
3052 THEN '3052 - Guadalajara' WHEN 3053 THEN '3053 - Villahermosa' WHEN 3054 THEN '3054 - Tultitlan' WHEN 3055 THEN '3055 - Mexicali' WHEN 3070 THEN '3070 – Stabilit Europa'
WHEN 4000 THEN '4000 – Stabilit America' WHEN 4020 THEN '4020 – Formet' WHEN 1900 THEN '1900 – Staff Verzatec' WHEN 2042 THEN '2042 – Staff Tiendas Cuprum & MD' 
ELSE '0 – Louisville' END, 
idUbicacion = o.Ubicacion, 
Ubicacion =(/* --Ubicacion o lugar Físico*/ SELECT Desc_esp
                            FROM          VT_NivelesEstructura
                            WHERE      Nivel = o.Ubicacion AND Estructura = o.EstructuraUbicacion AND Empresa = o.Empresa AND EmpresaFuente = o.EmpresaFuente AND Fecha_Vigencia_Hasta IS NULL), 
o.Plaza_Superior, 
o.Empresa_Superior,
 o.EmpresaFuente_Superior, 
id_NivelPuesto = p.id_Nivel, 
urlFoto = CASE WHEN e.Empresa BETWEEN 9000 AND 9999 THEN /*Stabilit*/ CASE WHEN Charindex(',' + rtrim(cast(e.Nomina AS char)) + ',', ',1,3,4,6,') > 0 THEN 'http://SNOMB/Credenciales/Stabilit/Empleados/' + rtrim(cast(e.Empleado AS char)) 
+ '.jpg' ELSE 'http://SNOMB/Credenciales/Stabilit/Sindicalizados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' END WHEN e.Empresa BETWEEN 4000 AND 4999 THEN /*Formet*/ CASE WHEN Charindex(',' + rtrim(cast(e.Nomina AS char)) + ',', ',2,4,5,6,') > 0 
THEN 'http://SNOMB/Credenciales/Formet/Empleados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' ELSE 'http://SNOMB/Credenciales/Formet/Sindicalizados/' + rtrim(cast(e.Empleado AS char)) 
+ '.jpg' END WHEN e.empresa = 5000 THEN CASE WHEN e.EmpresaFuente > 3 AND e.EmpresaFuente <> 8 THEN 'http://SNOMB/Credenciales/' + rtrim(cast(e.EmpresaFuente AS char)) + '/' + rtrim(cast(e.Nomina AS char)) + '/Foto/' + rtrim(cast(e.Empleado AS char))

 + '.jpg' ELSE 'http://SNOMB/Credenciales/' + rtrim(cast(e.EmpresaFuente AS char)) + '/Foto/' + rtrim(cast(e.Nomina AS char)) + '/' + rtrim(cast(e.Empleado AS char)) + '.jpg' END ELSE '' END, e.Estatus, 
o.APLICA_HABILIDADES
FROM         VT_Recursos r, 
VT_RecursoEmpresa e, 
VT_Organigrama o, 
VT_Puesto p, 
VT_NivelesEstructura ne, 
/*Area*/ VT_NivelesEstructura neCC, 
/*Centro de Costo*/ VT_Empresa emp, 
VT_Empresa emp2, 
/*Para obtener la division*/ VT_EmpleadosPlazas ep, 
/*Historia de puestos del empleado*/ VT_SucursalIMSS si, 
VT_Nomina n
WHERE     r.id_recurso_vt = e.id_recurso_vt AND 
e.estatus NOT IN (2, 4) AND 
o.id_recurso_vt = e.id_recurso_vt AND 
o.Empresa = e.Empresa AND 
o.EmpresaFuente = e.EmpresaFuente AND 
o.Estatus = 1 /*and	
o.Fecha_Vigencia_hasta is null*/ AND 
p.Empresa =* o.Empresa AND 
p.EmpresaFuente =* o.EmpresaFuente AND 
p.id_nivel_puesto =* o.id_nivel_puesto /*Area*/ AND 
ne.Nivel =* o.Area AND 
ne.Empresa =* o.Empresa AND 
ne.EmpresaFuente =* o.EmpresaFuente AND 
ne.Fecha_Vigencia_Hasta IS NULL AND 
ne.Estructura = 2 /*Centro de Costo*/ AND 
rtrim(cast(neCC.id_NivelEstructura AS varchar)) =* o.CentroCosto AND 
neCC.Empresa =* o.Empresa AND 
neCC.EmpresaFuente =* o.EmpresaFuente AND 
neCC.Fecha_Vigencia_Hasta IS NULL AND 
neCC.Estructura = 1 /*Empleados Plazas*/ AND 
ep.Empresa = o.Empresa AND 
ep.EmpresaFuente = o.EmpresaFuente AND 
ep.Plaza = o.Plaza AND 
ep.id_Recurso_vt = o.id_Recurso_vt AND 
ep.Fecha_vigencia_hasta IS NULL /*Plaza Activa*/ AND 
emp.Empresa = e.Empresa AND 
emp.Estatus = 1 /*Para obtener la Division de la empresa*/ AND 
emp2.Empresa = emp.Empresa_Padre AND 
emp2.Estatus = 1 /*VT_SucursalIMSS vs VT_RecursoEmpresa*/ AND 
si.Empresa = e.Empresa AND 
si.EmpresaFuente = e.EmpresaFuente AND 
si.Sucursal_IMSS = e.Sucursal_IMSS AND 
si.Estatus = 1 /*VT_Nomina vs VT_RecursoEmpresa*/ AND 
n.Empresa = e.Empresa AND 
n.EmpresaFuente = e.EmpresaFuente AND n.Nomina = e.Nomina


GO
/****** Object:  View [dbo].[v_EmpleadosVerzatecNvo]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_EmpleadosVerzatecNvo] as
SELECT	e.id_recurso_vt, e.Empresa, e.EmpresaFuente, 
	emp.Empresa as idDivision, emp.Descripcion as Division, div.razon_social, div.RFC as RFC_Empresa, 
	e.Empleado, e.id, r.Nombre + ' ' + r.Paterno + ' ' + r.Materno as NombreCompleto, r.Nombre, r.Paterno, r.Materno, e.Nomina, n.Desc_esp as DescNomina, r.RFC, 
	e.Fecha_Nacimiento, e.Fecha_Antiguedad, (select dbo.fnObtenAniosMesesTranscurridos (e.Fecha_Antiguedad, getdate())) as Antiguedad_Empresa,
	e.Fecha_Baja, si.Reg_Patronal, si.Sucursal_IMSS, si.Razon_Social as Razon_Social_IMSS, e.cedula_imss, 
	ep.fecha_vigencia_desde as Fecha_Puesto, (select dbo.fnObtenAniosMesesTranscurridos (ep.fecha_vigencia_desde, getdate())) as Antiguedad_Puesto,
	p.id_nivel_puesto as idPuesto, p.Desc_esp as Puesto, dir.Nivel as idDireccion, dir.Desc_esp as Direccion, o.Area as idArea, area.Desc_esp as Area, 
	cc.Nivel as CentroCosto, cc.Desc_esp as DescCentroCosto, e.e_mail, 
	case when isnull(pBB.id_nivel_puesto,'') = '' then '' else convert(varchar,ep.fecha_vigencia_desde,120) end as Fecha_Puesto_BB,
	ep.plaza, e.Banco, e.CuentaBanco, o.Entidad, 
	CASE o.Entidad 
		WHEN 1000 THEN '1000 – Staff Aluminio' 
		WHEN 1100 THEN '1100 - Perfiles Mty' 
		WHEN 1110 THEN '1110 - Perfiles Mex' 
		WHEN 1200 THEN '1200 - Escaleras'
		WHEN 1301 THEN '1301 – Ventanas' 
		WHEN 1400 THEN '1400 – Perfiles Guadalajara ' 
		WHEN 1500 THEN '1500 – Perfiles Comercial ' 
		WHEN 2041 THEN '2041 - Tiendas Cuprum'
		WHEN 2050 THEN '2050 - Metales Díaz' 
		WHEN 3030 THEN '3030 - Bayer' 
		WHEN 3050 THEN '3050 – Stabilit Villa de García' 
		WHEN 3051 THEN '3051 - Tlanepantla' 
		WHEN 3052 THEN '3052 - Guadalajara' 
		WHEN 3053 THEN '3053 - Villahermosa' 
		WHEN 3054 THEN '3054 - Tultitlan' 
		WHEN 3055 THEN '3055 - Mexicali'
		WHEN 3055 THEN '3056 - Stabilit America'
		WHEN 3070 THEN '3070 – Stabilit Europa'
		WHEN 4000 THEN '4000 – Stabilit America' 
		WHEN 4020 THEN '4020 – Formet' 
		WHEN 5000 THEN '5000 – Staff Verzatec' 
		WHEN 2042 THEN '2042 – Staff Tiendas Cuprum & MD' 
		ELSE '0 – Louisville' 
	END as DescEntidad, 
	idUbicacion = o.Ubicacion, ub.Desc_esp as Ubicacion, 
	o.Plaza_Superior, o.Empresa_Superior, o.EmpresaFuente_Superior,  id_NivelPuesto = p.id_Nivel,

	CASE 
		WHEN e.Empresa > 9000 THEN -- Stabilit
				CASE WHEN e.Nomina in (1,3,4,6) 
							THEN 'http://SNOMB/Credenciales/Stabilit/Empleados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' 
							ELSE 'http://SNOMB/Credenciales/Stabilit/Sindicalizados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' END 
		WHEN e.Empresa BETWEEN 4000 AND 4999  THEN -- Formet
				CASE WHEN e.Nomina in (2,4,5,6) 
							THEN 'http://SNOMB/Credenciales/Formet/Empleados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' 
							ELSE 'http://SNOMB/Credenciales/Formet/Sindicalizados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' END 
		WHEN e.Empresa = 5000 THEN 
				CASE WHEN e.EmpresaFuente > 3 AND e.EmpresaFuente <> 8 
							THEN 'http://SNOMB/Credenciales/' + rtrim(cast(e.EmpresaFuente AS char)) + '/' + rtrim(cast(e.Nomina AS char)) + '/Foto/' + rtrim(cast(e.Empleado AS char))  + '.jpg' 
							ELSE 'http://SNOMB/Credenciales/' + rtrim(cast(e.EmpresaFuente AS char)) + '/Foto/' + rtrim(cast(e.Nomina AS char)) + '/' + rtrim(cast(e.Empleado AS char)) + '.jpg' END 
		ELSE '' END AS UrlFoto, 
		e.Estatus, 	isnull(o.APLICA_HABILIDADES,'') as APLICA_HABILIDADES

FROM  VT_RecursoEmpresa e, VT_Recursos r, VT_Nomina n, VT_EmpleadosPlazas ep, VT_Puesto p, VT_Organigrama o, VT_SucursalIMSS si, VT_Empresa div, VT_Empresa emp,
	 VT_NivelesEstructura area,	 VT_NivelesEstructura dir, VT_NivelesEstructura cc, VT_NivelesEstructura ub, VT_Puesto pBB

WHERE	e.Estatus not in (2,4) AND r.id_recurso_vt = e.id_recurso_vt AND
	n.Empresa = e.Empresa AND n.EmpresaFuente = e.EmpresaFuente AND n.Nomina = e.Nomina AND
	ep.Empresa = e.Empresa AND ep.EmpresaFuente = e.EmpresaFuente AND ep.id_recurso_vt = e.id_recurso_vt AND
						ep.fecha_vigencia_desde = (select max(fecha_vigencia_desde) from VT_EmpleadosPlazas where id_recurso_vt = e.id_recurso_vt) AND
	o.Empresa = ep.Empresa AND o.EmpresaFuente = ep.EmpresaFuente AND o.Plaza = ep.plaza AND o.Estatus = 1 AND o.id_recurso_vt = e.id_recurso_vt AND
	p.Empresa = o.Empresa AND p.EmpresaFuente = o.EmpresaFuente AND p.id_nivel_puesto = o.id_nivel_puesto AND
	si.Empresa = e.Empresa AND si.EmpresaFuente = e.EmpresaFuente AND si.Sucursal_IMSS = e.Sucursal_IMSS AND si.Estatus = 1 AND 
	div.Empresa = e.Empresa AND div.Estatus = 1 AND 	emp.Empresa = div.Empresa_Padre AND emp.Estatus = 1 AND 	

area.Nivel = o.Area AND area.Empresa = o.Empresa AND area.EmpresaFuente = o.EmpresaFuente AND area.Fecha_Vigencia_Hasta is null AND area.Estructura = 2 AND
dir.id_NivelEstructura = area.id_NivelSuperior AND dir.Empresa = area.Empresa AND dir.EmpresaFuente = area.EmpresaFuente AND dir.fecha_vigencia_hasta is null AND dir.Estructura = 2 	AND
cc.id_NivelEstructura = o.CentroCosto AND cc.Empresa = o.Empresa AND cc.EmpresaFuente = o.EmpresaFuente AND cc.fecha_vigencia_hasta is null AND cc.Estructura = 1 AND
ub.Estructura = o.EstructuraUbicacion AND ub.Nivel = o.Ubicacion AND ub.Empresa = o.Empresa AND ub.EmpresaFuente = o.EmpresaFuente AND ub.fecha_vigencia_hasta is null AND
pBB.id_nivel_puesto =* p.id_nivel_puesto and CHARINDEX('%BLACK%', pBB.Desc_esp) > 0 

--AND e.empleado IN (43493, 50511, 43160)


GO
/****** Object:  View [dbo].[v_EmpleadosVzt_SAVEII3]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   view [dbo].[v_EmpleadosVzt_SAVEII3]

as

SELECT     e.id_recurso_vt, e.Empresa, e.EmpresaFuente, 
           0 as IdDivision, 
           'Division' as Division,           
           c.razon_social as razon_social,--'Empresas Verzatec, S. de R.L. de C.V.' as razon_social,
           c.RFC as RFC_Empresa,--'RFC_Empresa' as RFC_Empresa,
           e.Empleado, e.id, r.Nombre + ' ' + r.Paterno + ' ' + r.Materno AS NombreCompleto, r.Nombre, r.Paterno, r.Materno, 
           e.nomina,  
           n.descripcion as DescNomina,--'DescNomina' as DescNomina,
           r.RFC, 
           r.CURP,
           e.Fecha_Nacimiento, e.Fecha_Antiguedad, 
           CASE e.fecha_antiguedad WHEN 0 THEN '0.0' ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) % 12) END AS Antiguedad_Empresa, 
           emp.Fecha_Baja, 
                      'RegPatronal' as RegPatronal,
                      0 as Sucursal_IMSS,--hoy sabado 'Sucursal_IMSS' as Sucursal_IMSS,
                      'Razon_Social_IMSS' as Razon_Social_IMSS,
                      e.cedula_imss, 
                      getdate() as Fecha_Puesto,
                      0 as Antiguedad_Puesto,
                      0 as idPuesto,
                      'Puesto Baja' as Puesto,
                      0 as idDireccion,
                      'Direccion' as Direccion,
                      0 as idArea,
                      'Area' as Area,
                      ne.id_nivel_estructura as CentroCosto,
                      ne.descripcion as DescCentroCosto,--'DescCentroCosto' as DescCentroCosto,
                      e.e_mail,  
                      0 as Plaza,--hoy sabado 'Plaza' as Plaza,
                      e.Banco, e.CuentaBanco,--,-- o.Entidad, 
                      ne.nivel as Entidad,
                      left(ne.descripcion,20) as DescEntidad,--'DescEntidad' as DescEntidad,

0 as IdUbicacion,
'Ubicacion' as Ubicacion,

0 as PlazaSuperior,
0 as EmpresaSuperior,
0 As EmpresaFuenteSuperior,

0 as idNivelPuesto,
'urlFoto' as urlFoto,
e.Estatus

FROM         dbo.VT_Recursos r,                  --Select * from dbo.VT_Recursos
             dbo.VT_RecursoEmpresa e,            --Select * from dbo.VT_RecursoEmpresa where id_recurso_vt in (12350,1942,2000)
             kiosco.dbo.companias c ,            --Select * from kiosco.dbo.companias
             kiosco.dbo.empleados emp,           --Select * from kiosco.dbo.empleados 
             kiosco.dbo.nominas n,               --Select * from kiosco.dbo.nominas
             kiosco.dbo.recursos rec,            --Select * from kiosco.dbo.recursos 
             kiosco.dbo.estructuras es,          --Select * from kiosco.dbo.estructuras
             kiosco.dbo.estructuras_empleado ee, --Select * from kiosco.dbo.estructuras_empleado
             kiosco.dbo.niveles_estructura ne    --Select * from kiosco.dbo.niveles_estructura

WHERE  r.id_recurso_vt = e.id_recurso_vt
and e.empleado=emp.empleado
and c.compania = emp.compania
and emp.compania = n.compania AND emp.nomina = n.nomina
and emp.id = rec.id
and emp.compania = es.compania
and emp.id = ee.id AND emp.fecha_baja <= ee.fecha_vigencia_hasta
and emp.compania = ne.compania AND es.estructura = ne.estructura AND ee.id_nivel_estructura = ne.id_nivel_estructura  
and emp.estatus in (2,4)

--select * from kiosco.dbo.recursos where nombre like '%Anastacio%' and paterno like '%cruz%'
--select * from kiosco.dbo.empleados where id=25266


--cacm quite 15-Sep-09--
--AND (n.descripcion LIKE '%EMPLEADO%') 
AND (es.principal = 1) AND (ne.fecha_vigencia_hasta IS NULL)  
and (emp.fecha_baja >= GETDATE() - 365)  
--and r.id_recurso_vt=8045

GO
/****** Object:  View [dbo].[v_EmpleadosVztA_SAVEII3]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_EmpleadosVztA_SAVEII3]
as

SELECT  e.id_recurso_vt, 
		e.Empresa, 
		e.EmpresaFuente,
		idDivision = emp2.Empresa, 
		Division = emp2.Descripcion, 
		emp.razon_social, 
		RFC_Empresa = emp.RFC, 
		e.Empleado, 
		e.id, 
		NombreCompleto = r.Nombre + ' ' + r.Paterno + ' ' + r.Materno,
		r.Nombre, 
		r.Paterno, 
		r.Materno,
		e.Nomina, 
		DescNomina = n.Desc_esp, 
		RFC = r.RFC, 
		CURP = r.CURP,
		e.Fecha_Nacimiento,
		e.Fecha_Antiguedad, 
		Antiguedad_Empresa = CASE E.FECHA_ANTIGUEDAD 
							WHEN 0 THEN '0.0' 
							ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, E.FECHA_ANTIGUEDAD, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, E.FECHA_ANTIGUEDAD, getdate()) / 30.4)) % 12) END, 
		e.Fecha_Baja, 
		si.Reg_Patronal, 
		si.Sucursal_IMSS, 
		Razon_Social_IMSS = si.Razon_Social, 
		e.cedula_imss, 
		Fecha_Puesto = ep.Fecha_vigencia_desde, 
		Antiguedad_Puesto = CASE ep.fecha_vigencia_desde 
							WHEN 0 THEN '0.0' 
							ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, ep.fecha_vigencia_desde, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, ep.fecha_vigencia_desde, getdate()) / 30.4)) % 12) END, 
		idPuesto = p.id_nivel_puesto, 
		Puesto = p.Desc_esp, 
		idDireccion = (/*--Direccion*/ SELECT Nivel
					FROM        VT_NivelesEstructura
					WHERE		id_NivelEstructura = ne.id_NivelSuperior AND
								Empresa = ne.Empresa AND 
								EmpresaFuente = ne.EmpresaFuente AND 
								Fecha_Vigencia_Hasta IS NULL AND Estructura = 2), 
		Direccion =  (/* --Direccion*/ SELECT Desc_esp
					FROM       VT_NivelesEstructura
					WHERE      id_NivelEstructura = ne.id_NivelSuperior AND 
								Empresa = ne.Empresa AND 
								EmpresaFuente = ne.EmpresaFuente AND 
								Fecha_Vigencia_Hasta IS NULL AND Estructura = 2),
		idArea = o.Area, 
		Area = ne.Desc_esp, 
		/*idCentroCosto = o.CentroCosto,*/ 
		CentroCosto = neCC.Nivel, 
		DescCentroCosto = neCC.Desc_esp, 
		e_mail = e.e_mail, 
		Fecha_Puesto_BB = (/* -- Fecha Puesto BlackBelt		*/ SELECT isnull(min(ep2.Fecha_vigencia_desde), '')
					FROM       VT_EmpleadosPlazas ep2, VT_Organigrama o2, VT_Puesto p2
					WHERE      ep2.Empresa = ep.Empresa AND 
								ep2.EmpresaFuente = ep.EmpresaFuente AND 
								ep2.id_recurso_vt = e.id_recurso_vt AND 
								o2.Plaza = ep2.Plaza AND 
								p2.id_nivel_puesto = o2.id_nivel_puesto AND 
								p2.Empresa = o2.Empresa AND 
								p2.EmpresaFuente = o2.EmpresaFuente AND  
								p2.Desc_esp LIKE '%BLACK%'), 
		o.plaza, 
		e.Banco, 
		e.CuentaBanco,
		o.Entidad, 
		DescEntidad = CASE o.Entidad 
					WHEN 1000 THEN '1000 – Staff Aluminio' 
					WHEN 1100 THEN '1100 - Perfiles Mty' 
					WHEN 1110 THEN '1110 - Perfiles Mex' 
					WHEN 1200 THEN '1200 - Escaleras'
					WHEN 1301 THEN '1301 – Ventanas' 
					WHEN 1400 THEN '1400 – Perfiles Guadalajara ' 
					WHEN 1500 THEN '1500 – Perfiles Comercial ' 
					WHEN 2041 THEN '2041 - Tiendas Cuprum'
					WHEN 2050 THEN '2050 - Metales Díaz' 
					WHEN 3030 THEN '3030 - Bayer' 
					WHEN 3050 THEN '3050 – Stabilit Villa de García' 
					WHEN 3051 THEN '3051 - Tlanepantla' 
					WHEN 3052 THEN '3052 - Guadalajara' 
					WHEN 3053 THEN '3053 - Villahermosa' 
					WHEN 3054 THEN '3054 - Tultitlan' 
					WHEN 3055 THEN '3055 - Mexicali'
					WHEN 3056 THEN '3055 - Stabilit America'
					WHEN 3070 THEN '3070 – Stabilit Europa'
					WHEN 4000 THEN '4000 – Stabilit America' 
					WHEN 4020 THEN '4020 – Formet'
					WHEN 5000 THEN '5000 – Staff Verzatec' 
					WHEN 2042 THEN '2042 – Staff Tiendas Cuprum & MD'
					ELSE '0 – Louisville' END, 
		idUbicacion = o.Ubicacion, 
		Ubicacion =(/* --Ubicacion o lugar Físico*/ SELECT Desc_esp
					FROM		VT_NivelesEstructura
					WHERE		Nivel = o.Ubicacion AND 
								Estructura = o.EstructuraUbicacion AND 
								Empresa = o.Empresa AND 
								EmpresaFuente = o.EmpresaFuente AND 
								Fecha_Vigencia_Hasta IS NULL), 
		o.Plaza_Superior, 
		o.Empresa_Superior,
		o.EmpresaFuente_Superior, 
		id_NivelPuesto = p.id_Nivel, 
		urlFoto = CASE WHEN e.Empresa BETWEEN 9000 AND 9999 THEN /*Stabilit*/ 
						CASE WHEN Charindex(',' + rtrim(cast(e.Nomina AS char)) + ',', ',1,3,4,6,') > 0 
								THEN 'http://SNOMB/Credenciales/Stabilit/Empleados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' 
								ELSE 'http://SNOMB/Credenciales/Stabilit/Sindicalizados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' END 
							WHEN e.Empresa BETWEEN 4000 AND 4999 
								THEN /*Formet*/ CASE WHEN Charindex(',' + rtrim(cast(e.Nomina AS char)) + ',', ',2,4,5,6,') > 0 
											THEN 'http://SNOMB/Credenciales/Formet/Empleados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' 
											ELSE 'http://SNOMB/Credenciales/Formet/Sindicalizados/' + rtrim(cast(e.Empleado AS char)) + '.jpg' END 
									WHEN e.empresa = 5000 
										THEN CASE WHEN e.EmpresaFuente > 3 AND e.EmpresaFuente <> 8 
											THEN 'http://SNOMB/Credenciales/' + rtrim(cast(e.EmpresaFuente AS char)) + '/' + rtrim(cast(e.Nomina AS char)) + '/Foto/' + rtrim(cast(e.Empleado AS char)) + '.jpg' 
											ELSE 'http://SNOMB/Credenciales/' + rtrim(cast(e.EmpresaFuente AS char)) + '/Foto/' + rtrim(cast(e.Nomina AS char)) + '/' + rtrim(cast(e.Empleado AS char)) + '.jpg' END 
									ELSE '' END, 
		e.Estatus, 
		o.APLICA_HABILIDADES
FROM	VT_Recursos r, 
		VT_RecursoEmpresa e, 
		VT_Organigrama o, 
		VT_Puesto p, 
		VT_NivelesEstructura ne, 
		/*Area*/ VT_NivelesEstructura neCC, 
		/*Centro de Costo*/ VT_Empresa emp, 
		VT_Empresa emp2, 
		/*Para obtener la division*/ VT_EmpleadosPlazas ep, 
		/*Historia de puestos del empleado*/ VT_SucursalIMSS si, 
		VT_Nomina n
WHERE   r.id_recurso_vt = e.id_recurso_vt AND 
		e.estatus NOT IN (2, 4) AND 
		o.id_recurso_vt = e.id_recurso_vt AND 
		o.Empresa = e.Empresa AND 
		o.EmpresaFuente = e.EmpresaFuente AND 
		o.Estatus = 1 /*and	
		o.Fecha_Vigencia_hasta is null*/ AND 
		p.Empresa =* o.Empresa AND 
		p.EmpresaFuente =* o.EmpresaFuente AND 
		p.id_nivel_puesto =* o.id_nivel_puesto /*Area*/ AND 
		ne.Nivel =* o.Area AND 
		ne.Empresa =* o.Empresa AND 
		ne.EmpresaFuente =* o.EmpresaFuente AND 
		ne.Fecha_Vigencia_Hasta IS NULL AND 
		ne.Estructura = 2 /*Centro de Costo*/ AND 
		rtrim(cast(neCC.id_NivelEstructura AS varchar)) =* o.CentroCosto AND 
		neCC.Empresa =* o.Empresa AND 
		neCC.EmpresaFuente =* o.EmpresaFuente AND 
		neCC.Fecha_Vigencia_Hasta IS NULL AND 
		neCC.Estructura = 1 /*Empleados Plazas*/ AND 
		ep.Empresa =* o.Empresa AND 
		ep.EmpresaFuente =* o.EmpresaFuente AND 
		ep.Plaza =* o.Plaza AND 
		ep.id_Recurso_vt =* o.id_Recurso_vt AND 
		ep.Fecha_vigencia_hasta IS NULL /*Plaza Activa*/ AND 
		emp.Empresa = e.Empresa AND 
		emp.Estatus = 1 /*Para obtener la Division de la empresa*/ AND 
		emp2.Empresa = emp.Empresa_Padre AND 
		emp2.Estatus = 1 /*VT_SucursalIMSS vs VT_RecursoEmpresa*/ AND 
		si.Empresa = e.Empresa AND 
		si.EmpresaFuente = e.EmpresaFuente AND 
		si.Sucursal_IMSS = e.Sucursal_IMSS AND 
		si.Estatus = 1 /*VT_Nomina vs VT_RecursoEmpresa*/ AND 
		n.Empresa = e.Empresa AND 
		n.EmpresaFuente = e.EmpresaFuente AND n.Nomina = e.Nomina


GO
/****** Object:  View [dbo].[v_EmpleadosVztSusp_SAVEII3]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  view [dbo].[v_EmpleadosVztSusp_SAVEII3]

as

SELECT     e.id_recurso_vt, e.Empresa, e.EmpresaFuente, 
           0 as IdDivision, 
           'Division' as Division,           
           c.razon_social as razon_social,--'Empresas Verzatec, S. de R.L. de C.V.' as razon_social,
           c.RFC as RFC_Empresa,--'RFC_Empresa' as RFC_Empresa,
           e.Empleado, e.id, r.Nombre + ' ' + r.Paterno + ' ' + r.Materno AS NombreCompleto, r.Nombre, r.Paterno, r.Materno, 
           e.nomina,  
           n.descripcion as DescNomina,--'DescNomina' as DescNomina,
           r.RFC, 
           r.CURP,
           e.Fecha_Nacimiento, e.Fecha_Antiguedad, 
           CASE e.fecha_antiguedad WHEN 0 THEN '0.0' ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) % 12) END AS Antiguedad_Empresa, 
           emp.Fecha_Baja, 
                      'RegPatronal' as RegPatronal,
                      0 as Sucursal_IMSS,--hoy sabado 'Sucursal_IMSS' as Sucursal_IMSS,
                      'Razon_Social_IMSS' as Razon_Social_IMSS,
                      e.cedula_imss, 
                      getdate() as Fecha_Puesto,
                      0 as Antiguedad_Puesto,
                      0 as idPuesto,
                      'Puesto Baja' as Puesto,
                      0 as idDireccion,
                      'Direccion' as Direccion,
                      0 as idArea,
                      'Area' as Area,
                      ne.id_nivel_estructura as CentroCosto,
                      ne.descripcion as DescCentroCosto,--'DescCentroCosto' as DescCentroCosto,
                      e.e_mail,  
                      0 as Plaza,--hoy sabado 'Plaza' as Plaza,
                      e.Banco, e.CuentaBanco,--,-- o.Entidad, 
                      ne.nivel as Entidad,
                      left(ne.descripcion,20) as DescEntidad,--'DescEntidad' as DescEntidad,

0 as IdUbicacion,
'Ubicacion' as Ubicacion,

0 as PlazaSuperior,
0 as EmpresaSuperior,
0 As EmpresaFuenteSuperior,

0 as idNivelPuesto,
'urlFoto' as urlFoto,
e.Estatus

FROM         dbo.VT_Recursos r,                  --Select * from dbo.VT_Recursos
             dbo.VT_RecursoEmpresa e,            --Select * from dbo.VT_RecursoEmpresa where id_recurso_vt in (12350,1942,2000)
             kiosco.dbo.companias c ,            --Select * from kiosco.dbo.companias
             kiosco.dbo.empleados emp,           --Select * from kiosco.dbo.empleados 
             kiosco.dbo.nominas n,               --Select * from kiosco.dbo.nominas
             kiosco.dbo.recursos rec,            --Select * from kiosco.dbo.recursos 
             kiosco.dbo.estructuras es,          --Select * from kiosco.dbo.estructuras
             kiosco.dbo.estructuras_empleado ee, --Select * from kiosco.dbo.estructuras_empleado
             kiosco.dbo.niveles_estructura ne    --Select * from kiosco.dbo.niveles_estructura

WHERE  r.id_recurso_vt = e.id_recurso_vt
and e.empleado=emp.empleado
and c.compania = emp.compania
and emp.compania = n.compania AND emp.nomina = n.nomina
and emp.id = rec.id
and emp.compania = es.compania
and emp.id = ee.id 
AND emp.fecha_baja is null--<= ee.fecha_vigencia_hasta
and emp.compania = ne.compania AND es.estructura = ne.estructura AND ee.id_nivel_estructura = ne.id_nivel_estructura  
and emp.estatus in (4)

--select * from kiosco.dbo.recursos where nombre like '%Anastacio%' and paterno like '%cruz%'
--select * from kiosco.dbo.empleados where id=25266


--cacm quite 15-Sep-09--
--AND (n.descripcion LIKE '%EMPLEADO%') 
AND (es.principal = 1) AND (ne.fecha_vigencia_hasta IS NULL)  
--and (emp.fecha_baja >= GETDATE() - 365)  
--and r.id_recurso_vt=8045

GO
/****** Object:  View [dbo].[V_EstructuraVerzatec]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_EstructuraVerzatec]
AS
SELECT	e.id_recurso_vt, e.Empresa, e.EmpresaFuente, emp2.Empresa AS idDivision,
		emp2.Descripcion AS Division, emp.razon_social, emp.RFC AS RFC_Empresa, 
		e.Empleado, e.id, r.Nombre + ' ' + r.Paterno + ' ' + r.Materno AS NombreCompleto, 
		r.Nombre, r.Paterno, r.Materno, e.nomina, n.Desc_esp AS DescNomina, r.RFC, 
		e.Fecha_Nacimiento, e.Fecha_Antiguedad, 
		CASE e.fecha_antiguedad 
			WHEN 0 THEN '0.0' 
			ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) % 12) 
		END AS Antiguedad_Empresa,
		e.Fecha_Baja, si.Reg_Patronal, si.Sucursal_IMSS, si.Razon_Social AS Razon_Social_IMSS, 
		e.cedula_imss, ep.fecha_vigencia_desde AS Fecha_Puesto, 
		CASE ep.fecha_vigencia_desde 
			WHEN 0 THEN '0.0' 
			ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, ep.fecha_vigencia_desde, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, ep.fecha_vigencia_desde, getdate()) / 30.4)) % 12) 
		END AS Antiguedad_Puesto, 
		p.id_nivel_puesto AS idPuesto, p.Desc_esp AS Puesto, dir.Nivel AS idDireccion, dir.Desc_esp AS Direccion, 
		o.Area AS idArea, ne.Desc_esp AS Area, neCC.Nivel AS CentroCosto, 
		neCC.Desc_esp AS DescCentroCosto, e.e_mail, o.Plaza, e.Banco, e.CuentaBanco, o.Entidad, 
		CASE o.Entidad 
			WHEN 1000 THEN '1000 – Staff Aluminio' 
			WHEN 1100 THEN '1100 - Perfiles Mty' 
			WHEN 1110 THEN '1110 - Perfiles Mex' 
			WHEN 1200 THEN '1200 - Escaleras' 
			WHEN 1301 THEN '1301 – Ventanas' 
			WHEN 1400 THEN '1400 – Perfiles Guadalajara ' 
			WHEN 1500 THEN '1500 – Perfiles Comercial ' 
			WHEN 2041 THEN '2041 - Tiendas Cuprum'
			WHEN 2050 THEN '2050 - Metales Díaz' 
			WHEN 3030 THEN '3030 - Bayer' 
			WHEN 3050 THEN '3050 – Stabilit Villa de García' 
			WHEN 3051 THEN '3051 - Tlanepantla' 
			WHEN 3052 THEN '3052 - Guadalajara' 
			WHEN 3053 THEN '3053 - Villahermosa' 
			WHEN 3054 THEN '3054 - Tultitlan' 
			WHEN 3055 THEN '3055 - Mexicali'
			WHEN 3056 THEN '3056 - Stabilit America' 
			WHEN 3070 THEN '3070 – Stabilit Europa'
			WHEN 4000 THEN '4000 – Stabilit America' 
			WHEN 4020 THEN '4020 – Formet' 
			WHEN 5000 THEN '5000 – Staff Verzatec' 
			WHEN 2042 THEN '2042 – Staff Tiendas Cuprum & MD'
			ELSE '0 – Louisville' 
		END AS DescEntidad, 
		o.Ubicacion AS idUbicacion, ub.Desc_esp AS Ubicacion, o.Plaza_Superior, o.Empresa_Superior, 
		o.EmpresaFuente_Superior, p.id_Nivel AS id_NivelPuesto, 
		CASE WHEN e.Empresa BETWEEN 9000 AND 9999 
			THEN CASE WHEN Charindex(',' + rtrim(CAST(e.Nomina AS char)) + ',', ',1,3,4,6,') > 0 
			THEN 'http://SNOMB/Credenciales/Stabilit/Empleados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
			ELSE 'http://SNOMB/Credenciales/Stabilit/Sindicalizados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
			END 
			WHEN e.Empresa BETWEEN 4000 AND 4999 
				THEN CASE WHEN Charindex(',' + rtrim(CAST(e.Nomina AS char)) + ',', ',2,4,5,6,') > 0 
					THEN 'http://SNOMB/Credenciales/Formet/Empleados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
					ELSE 'http://SNOMB/Credenciales/Formet/Sindicalizados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
					END 
				WHEN e.empresa = 5000 
					THEN CASE WHEN e.EmpresaFuente > 3 AND e.EmpresaFuente <> 8 
						THEN 'http://SNOMB/Credenciales/' + rtrim(CAST(e.EmpresaFuente AS char)) + '/' + rtrim(CAST(e.Nomina AS char)) + '/Foto/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
						ELSE 'http://SNOMB/Credenciales/' + rtrim(CAST(e.EmpresaFuente AS char)) + '/Foto/' + rtrim(CAST(e.Nomina AS char)) + '/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
					END 
					ELSE '' 
		END AS urlFoto, 
		e.Estatus
FROM	dbo.VT_Recursos AS r INNER JOIN
		dbo.VT_RecursoEmpresa AS e ON r.id_recurso_vt = e.id_recurso_vt INNER JOIN
		dbo.VT_Organigrama AS o ON o.id_Recurso_vt = e.id_recurso_vt AND o.Empresa = e.Empresa AND o.EmpresaFuente = e.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_Puesto AS p ON p.Empresa = o.Empresa AND p.EmpresaFuente = o.EmpresaFuente AND p.id_nivel_puesto = o.id_nivel_puesto INNER JOIN
		dbo.VT_NivelesEstructura AS ne ON ne.Nivel = o.Area AND ne.Empresa = o.Empresa AND ne.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS neCC ON RTRIM(CAST(neCC.id_NivelEstructura AS varchar)) = o.CentroCosto AND neCC.Empresa = o.Empresa AND 
		neCC.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_Empresa AS emp ON emp.Empresa = e.Empresa LEFT OUTER JOIN
		dbo.VT_Empresa AS emp2 ON emp2.Empresa = emp.Empresa_Padre LEFT OUTER JOIN
		dbo.VT_EmpleadosPlazas AS ep ON ep.Empresa = o.Empresa AND ep.EmpresaFuente = o.EmpresaFuente AND ep.Plaza = o.Plaza AND 
		ep.id_Recurso_vt = o.id_Recurso_vt LEFT OUTER JOIN
		dbo.VT_SucursalIMSS AS si ON si.Empresa = e.Empresa AND si.EmpresaFuente = e.EmpresaFuente AND si.Sucursal_IMSS = e.Sucursal_IMSS LEFT OUTER JOIN
		dbo.VT_Nomina AS n ON n.Empresa = e.Empresa AND n.EmpresaFuente = e.EmpresaFuente AND n.Nomina = e.nomina LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS ub ON ub.Nivel = o.Ubicacion AND ub.Estructura = o.EstructuraUbicacion AND ub.Empresa = o.Empresa AND 
		ub.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS dir ON dir.id_NivelEstructura = ne.id_NivelSuperior AND dir.Empresa = ne.Empresa AND dir.EmpresaFuente = ne.EmpresaFuente
WHERE   (e.Estatus NOT IN (2, 4)) AND (o.Estatus = 1) AND (ne.Fecha_Vigencia_Hasta IS NULL) AND (ne.Estructura = 2) AND (neCC.Fecha_Vigencia_Hasta IS NULL) AND 
		(neCC.Estructura = 1) AND (ep.fecha_vigencia_hasta IS NULL) AND (emp.Estatus = 1) AND (emp2.Estatus = 1) AND (si.Estatus = 1) AND 
		(ub.Fecha_Vigencia_Hasta IS NULL) AND (dir.Fecha_Vigencia_Hasta IS NULL) AND (dir.Estructura = 2)


GO
/****** Object:  View [dbo].[V_EstructuraVerzatec_2010]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_EstructuraVerzatec_2010]
AS

SELECT	e.id_recurso_vt, e.Empresa, e.EmpresaFuente, emp2.Empresa AS idDivision, 
		emp2.Descripcion AS Division, emp.razon_social, emp.RFC AS RFC_Empresa, 
		e.Empleado, e.id, r.Nombre + ' ' + r.Paterno + ' ' + r.Materno AS NombreCompleto, 
		r.Nombre, r.Paterno, r.Materno, e.nomina, n.Desc_esp AS DescNomina, r.RFC, 
		e.Fecha_Nacimiento, e.Fecha_Antiguedad, 
		CASE e.fecha_antiguedad 
			WHEN 0 THEN '0.0' 
			ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) % 12) 
		END AS Antiguedad_Empresa, 
		e.Fecha_Baja, si.Reg_Patronal, si.Sucursal_IMSS, si.Razon_Social AS Razon_Social_IMSS, 
		e.cedula_imss, ep.fecha_vigencia_desde AS Fecha_Puesto, 
		CASE ep.fecha_vigencia_desde 
			WHEN 0 THEN '0.0' 
			ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, ep.fecha_vigencia_desde, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, ep.fecha_vigencia_desde, getdate()) / 30.4)) % 12) 
		END AS Antiguedad_Puesto, 
		p.id_nivel_puesto AS idPuesto, p.Desc_esp AS Puesto, dir.Nivel AS idDireccion, dir.Desc_esp AS Direccion, 
		o.Area AS idArea, ne.Desc_esp AS Area, neCC.Nivel AS CentroCosto, 
		neCC.Desc_esp AS DescCentroCosto, e.e_mail, o.Plaza, e.Banco, e.CuentaBanco, o.Entidad, 
		CASE o.Entidad 
			WHEN 1000 THEN '1000 – Staff Aluminio' 
			WHEN 1100 THEN '1100 - Perfiles Mty' 
			WHEN 1110 THEN '1110 - Perfiles Mex' 
			WHEN 1200 THEN '1200 - Escaleras' 
			WHEN 1301 THEN '1301 – Ventanas' 
			WHEN 1400 THEN '1400 – Perfiles Guadalajara ' 
			WHEN 1500 THEN '1500 – Perfiles Comercial ' 
			WHEN 2041 THEN '2041 - Tiendas Cuprum'
			WHEN 2050 THEN '2050 - Metales Díaz' 
			WHEN 3030 THEN '3030 - Bayer' 
			WHEN 3050 THEN '3050 – Stabilit Villa de García' 
			WHEN 3051 THEN '3051 - Tlanepantla' 
			WHEN 3052 THEN '3052 - Guadalajara' 
			WHEN 3053 THEN '3053 - Villahermosa' 
			WHEN 3054 THEN '3054 - Tultitlan' 
			WHEN 3055 THEN '3055 - Mexicali' 
			WHEN 3055 THEN '3056 - Stabilit America'
			WHEN 3070 THEN '3070 – Stabilit Europa'
			WHEN 4000 THEN '4000 – Stabilit America' 
			WHEN 4020 THEN '4020 – Formet'
			WHEN 5000 THEN '5000 – Staff Verzatec' 
			WHEN 2042 THEN '2042 – Staff Tiendas Cuprum & MD' 
			ELSE '0 – Louisville' 
		END AS DescEntidad, 
		o.Ubicacion AS idUbicacion, ub.Desc_esp AS Ubicacion, o.Plaza_Superior, 
		o.Empresa_Superior, o.EmpresaFuente_Superior, p.id_Nivel AS id_NivelPuesto, 
		CASE WHEN e.Empresa BETWEEN 9000 AND 9999 
			THEN CASE WHEN Charindex(',' + rtrim(CAST(e.Nomina AS char)) + ',', ',1,3,4,6,') > 0 
				THEN 'http://SNOMB/Credenciales/Stabilit/Empleados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
				ELSE 'http://SNOMB/Credenciales/Stabilit/Sindicalizados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
				END 
			WHEN e.Empresa BETWEEN 4000 AND 4999 
				THEN CASE WHEN Charindex(',' + rtrim(CAST(e.Nomina AS char)) + ',', ',2,4,5,6,') > 0 
					THEN 'http://SNOMB/Credenciales/Formet/Empleados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
					ELSE 'http://SNOMB/Credenciales/Formet/Sindicalizados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
					END 
				WHEN e.empresa = 5000 
					THEN CASE WHEN e.EmpresaFuente > 3 AND e.EmpresaFuente <> 8 
						THEN 'http://SNOMB/Credenciales/' + rtrim(CAST(e.EmpresaFuente AS char)) + '/' + rtrim(CAST(e.Nomina AS char)) + '/Foto/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
						ELSE 'http://SNOMB/Credenciales/' + rtrim(CAST(e.EmpresaFuente AS char)) + '/Foto/' + rtrim(CAST(e.Nomina AS char)) + '/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
					END 
					ELSE '' 
		END AS urlFoto, 
		e.Estatus, r.CURP--CACM. Nuevo campo
FROM	dbo.VT_Recursos AS r INNER JOIN
		dbo.VT_RecursoEmpresa AS e ON r.id_recurso_vt = e.id_recurso_vt INNER JOIN
		dbo.VT_Organigrama AS o ON o.id_Recurso_vt = e.id_recurso_vt AND o.Empresa = e.Empresa AND o.EmpresaFuente = e.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_Puesto AS p ON p.Empresa = o.Empresa AND p.EmpresaFuente = o.EmpresaFuente AND p.id_nivel_puesto = o.id_nivel_puesto INNER JOIN
		dbo.VT_NivelesEstructura AS ne ON ne.Nivel = o.Area AND ne.Empresa = o.Empresa AND ne.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS neCC ON RTRIM(CAST(neCC.id_NivelEstructura AS varchar)) = o.CentroCosto AND neCC.Empresa = o.Empresa AND 
		neCC.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_Empresa AS emp ON emp.Empresa = e.Empresa LEFT OUTER JOIN
		dbo.VT_Empresa AS emp2 ON emp2.Empresa = emp.Empresa_Padre LEFT OUTER JOIN
		dbo.VT_EmpleadosPlazas AS ep ON ep.Empresa = o.Empresa AND ep.EmpresaFuente = o.EmpresaFuente AND ep.Plaza = o.Plaza AND 
		ep.id_Recurso_vt = o.id_Recurso_vt LEFT OUTER JOIN
		dbo.VT_SucursalIMSS AS si ON si.Empresa = e.Empresa AND si.EmpresaFuente = e.EmpresaFuente AND si.Sucursal_IMSS = e.Sucursal_IMSS LEFT OUTER JOIN
		dbo.VT_Nomina AS n ON n.Empresa = e.Empresa AND n.EmpresaFuente = e.EmpresaFuente AND n.Nomina = e.nomina LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS ub ON ub.Nivel = o.Ubicacion AND ub.Estructura = o.EstructuraUbicacion AND ub.Empresa = o.Empresa AND 
		ub.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS dir ON dir.id_NivelEstructura = ne.id_NivelSuperior AND dir.Empresa = ne.Empresa AND dir.EmpresaFuente = ne.EmpresaFuente
WHERE     (e.Estatus NOT IN (2, 4)) AND (o.Estatus = 1) AND (ne.Fecha_Vigencia_Hasta IS NULL) AND (ne.Estructura = 2) AND (neCC.Fecha_Vigencia_Hasta IS NULL) AND 
          (neCC.Estructura = 1) AND (ep.fecha_vigencia_hasta IS NULL) AND (emp.Estatus = 1) AND (emp2.Estatus = 1) AND (si.Estatus = 1) AND 
          (ub.Fecha_Vigencia_Hasta IS NULL) AND (dir.Fecha_Vigencia_Hasta IS NULL) AND (dir.Estructura = 2)


GO
/****** Object:  View [dbo].[V_EstructuraVerzatec_BajasBB]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from V_EstructuraVerzatec_ConBajas where id_recurso_vt=1942
--select * from V_EstructuraVerzatec where id_recurso_vt=2000


--CACM: Ago-09
CREATE           VIEW [dbo].[V_EstructuraVerzatec_BajasBB]
AS

--select * from VT_Puesto
--select * from kiosco.dbo.puestos

/*
SELECT     e.id_recurso_vt, e.Empresa, e.EmpresaFuente, 
           0 as IdDivision, 
           'Division' as Division,           
           c.razon_social as razon_social,--'Empresas Verzatec, S. de R.L. de C.V.' as razon_social,
           c.RFC as RFC_Empresa,--'RFC_Empresa' as RFC_Empresa,
           e.Empleado, e.id, r.Nombre + ' ' + r.Paterno + ' ' + r.Materno AS NombreCompleto, r.Nombre, r.Paterno, r.Materno, 
           e.nomina,  
           n.descripcion as DescNomina,--'DescNomina' as DescNomina,
           r.RFC, 
           e.Fecha_Nacimiento, e.Fecha_Antiguedad, 
           CASE e.fecha_antiguedad WHEN 0 THEN '0.0' ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) % 12) END AS Antiguedad_Empresa, 
           emp.Fecha_Baja, 
                      'RegPatronal' as RegPatronal,
                      0 as Sucursal_IMSS,--hoy sabado 'Sucursal_IMSS' as Sucursal_IMSS,
                      'Razon_Social_IMSS' as Razon_Social_IMSS,
                      e.cedula_imss, 
                      getdate() as Fecha_Puesto,
                      0 as Antiguedad_Puesto,
                      0 as idPuesto,
                      'Puesto Baja' as Puesto,
                      0 as idDireccion,
                      'Direccion' as Direccion,
                      0 as idArea,
                      'Area' as Area,
                      ne.id_nivel_estructura as CentroCosto,
                      ne.descripcion as DescCentroCosto,--'DescCentroCosto' as DescCentroCosto,
                      e.e_mail,  
                      0 as Plaza,--hoy sabado 'Plaza' as Plaza,
                      e.Banco, e.CuentaBanco,--,-- o.Entidad, 
                      ne.nivel as Entidad,
                      left(ne.descripcion,20) as DescEntidad,--'DescEntidad' as DescEntidad,

0 as IdUbicacion,
'Ubicacion' as Ubicacion,

0 as PlazaSuperior,
0 as EmpresaSuperior,
0 As EmpresaFuenteSuperior,

0 as idNivelPuesto,
'urlFoto' as urlFoto,
e.Estatus

FROM         dbo.VT_Recursos r,                  --Select * from dbo.VT_Recursos
             dbo.VT_RecursoEmpresa e,            --Select * from dbo.VT_RecursoEmpresa where id_recurso_vt in (12350,1942,2000)
             kiosco.dbo.companias c ,            --Select * from kiosco.dbo.companias
             kiosco.dbo.empleados emp,           --Select * from kiosco.dbo.empleados 
             kiosco.dbo.nominas n,               --Select * from kiosco.dbo.nominas
             kiosco.dbo.recursos rec,            --Select * from kiosco.dbo.recursos 
             kiosco.dbo.estructuras es,          --Select * from kiosco.dbo.estructuras
             kiosco.dbo.estructuras_empleado ee, --Select * from kiosco.dbo.estructuras_empleado
             kiosco.dbo.niveles_estructura ne    --Select * from kiosco.dbo.niveles_estructura

WHERE  r.id_recurso_vt = e.id_recurso_vt
and e.empleado=emp.empleado
and c.compania = emp.compania
and emp.compania = n.compania AND emp.nomina = n.nomina
and emp.id = rec.id
and emp.compania = es.compania
and emp.id = ee.id AND emp.fecha_baja <= ee.fecha_vigencia_hasta
and emp.compania = ne.compania AND es.estructura = ne.estructura AND ee.id_nivel_estructura = ne.id_nivel_estructura  
and (emp.estatus = 2) 
--cacm quite 15-Sep-09--
AND (n.descripcion LIKE '%EMPLEADO%') 
AND (es.principal = 1) AND (ne.fecha_vigencia_hasta IS NULL)  
and (emp.fecha_baja >= GETDATE() - 365)  */

/*

select * from kiosco.dbo.recursos where nombre like '%stefano%'
select * from  dbo.VT_Recursos where nombre like '%stefano%'
select * from  dbo.VT_RecursoEmpresa where id_recurso_vt in (10717,11281)

select * from kiosco.dbo.empleados where empleado=50334
select * from dbo.V_empleadosverzatec where  empleado=50334


select * from kiosco.dbo.EMPLEADOS_PLAZAS where id=26222
select * from kiosco.dbo.PLAZAS where plaza=9689 and compania=2
select * from kiosco.dbo.PUESTOS where id_nivel_puesto=691
*/

 select  re.Empresa,re.EmpresaFuente,          
         idDireccion=0,Direccion='Sin Direccion',
         idArea=0,Area='',                                    
         re.id_recurso_vt,re.Empleado,r.nombre+' '+r.paterno+' '+r.materno as NombreCompleto,          
         idPuesto=p.id_nivel_puesto,Puesto=descripcion,          
         re.Fecha_Antiguedad,Antiguedad_Empresa=0,            
Fecha_Puesto=ep.fecha_vigencia_desde,Fecha_Puesto_BB=ep.fecha_vigencia_desde,Antiguedad_Puesto=0,          
         Fecha_Baja=isnull(e.Fecha_Baja,''),            
CentroCosto='0',
e_mail,          
         Plaza_superior=0,EmpresaFuente_Superior=0,                
NumChampion=0,--(Select empleado from organizacion_vzt.dbo.v_empleadosverzatec where plaza=e.Plaza_Superior and EmpresaFuente=e.EmpresaFuente_Superior),             
NumMBB=0,/*case when left(e.Area,1)='1' then 42041--Humberto Rdz          
         when left(e.Area,1)='6' then 24908--Juan Aguilar Amoros --Los pongo separado por si entra otro MBB          
  	 when left(e.Area,1)='7' then 24908--Juan Aguilar Amoros          
  	 when left(e.Area,1)='8' then 24908--Juan Aguilar Amoros          
  	 when left(e.Area,1)='9' then 24908--Juan Aguilar Amoros          
  	 when left(e.Area,1)='3' then 26898--Jaime Brocker           
     	 else 0 end, */         
Champion='',--(Select NombreCompleto from organizacion_vzt.dbo.v_empleadosverzatec where plaza=e.Plaza_Superior and EmpresaFuente=e.EmpresaFuente_Superior),             
MBB='',/*case when left(e.Area,1)='1' then 'HUMBERTO RODRIGUEZ ELIZONDO'--42041--Humberto Rdz          
         when left(e.Area,1)='6' then 'JUAN ALBERTO AGUILAR AMOROS'--24908--Juan Aguilar Amoros --Los pongo separado por si entra otro MBB          
  when left(e.Area,1)='7' then 'JUAN ALBERTO AGUILAR AMOROS'--24908--Juan Aguilar Amoros          
  when left(e.Area,1)='8' then 'JUAN ALBERTO AGUILAR AMOROS'--24908--Juan Aguilar Amoros          
  when left(e.Area,1)='9' then 'JUAN ALBERTO AGUILAR AMOROS'--24908--Juan Aguilar Amoros          
  when left(e.Area,1)='3' then 'JAIME BROCKER ORTIZ'--26898--Jaime Brocker       
     else '' end */         
pl.Plaza   --16-Sep-09     

---select *                     
from  dbo.VT_Recursos rv,                  --Select * from dbo.VT_Recursos
      dbo.VT_RecursoEmpresa re,            --Select * from dbo.VT_RecursoEmpresa where id_recurso_vt in (12350,1942,2000)
   
     kiosco.dbo.recursos r,
     kiosco.dbo.EMPLEADOS e,
     kiosco.dbo.EMPLEADOS_PLAZAS ep,
     kiosco.dbo.PLAZAS pl,
     kiosco.dbo.PUESTOS p
where rv.id_recurso_vt = re.id_recurso_vt
and re.empleado=e.empleado
and r.id=e.id
and e.id=ep.id
and e.compania=ep.compania
and ep.plaza=pl.plaza
and ep.compania=pl.compania
and pl.id_nivel_puesto=p.id_nivel_puesto
and pl.compania=p.compania
and (ep.Fecha_vigencia_hasta is null 
    or ep.Fecha_vigencia_hasta in 
    (select max(fecha_vigencia_hasta) from kiosco.dbo.EMPLEADOS_PLAZAS where id=e.id and compania=e.compania)
    )
and e.estatus=2
and p.Descripcion like '%black%'


--select * from vt_organigrama where id_recurso_vt in (10717)

GO
/****** Object:  View [dbo].[V_EstructuraVerzatec_ConBajas]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from V_EstructuraVerzatec_ConBajas where id_recurso_vt=1942
--select * from V_EstructuraVerzatec where id_recurso_vt=2000


--CACM: Ago-09
CREATE            VIEW [dbo].[V_EstructuraVerzatec_ConBajas]
AS

SELECT     e.id_recurso_vt, e.Empresa, e.EmpresaFuente, 
           0 as IdDivision, 
           'Division' as Division,           
           c.razon_social as razon_social,--'Empresas Verzatec, S. de R.L. de C.V.' as razon_social,
           c.RFC as RFC_Empresa,--'RFC_Empresa' as RFC_Empresa,
           e.Empleado, e.id, r.Nombre + ' ' + r.Paterno + ' ' + r.Materno AS NombreCompleto, r.Nombre, r.Paterno, r.Materno, 
           e.nomina,  
           n.descripcion as DescNomina,--'DescNomina' as DescNomina,
           r.RFC, 
           e.Fecha_Nacimiento, e.Fecha_Antiguedad, 
           CASE e.fecha_antiguedad WHEN 0 THEN '0.0' ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) % 12) END AS Antiguedad_Empresa, 
           emp.Fecha_Baja, 
                      'RegPatronal' as RegPatronal,
                      0 as Sucursal_IMSS,--hoy sabado 'Sucursal_IMSS' as Sucursal_IMSS,
                      'Razon_Social_IMSS' as Razon_Social_IMSS,
                      e.cedula_imss, 
                      getdate() as Fecha_Puesto,
                      0 as Antiguedad_Puesto,
                      0 as idPuesto,
                      'Puesto Baja' as Puesto,
                      0 as idDireccion,
                      'Direccion' as Direccion,
                      0 as idArea,
                      'Area' as Area,
                      ne.id_nivel_estructura as CentroCosto,
                      ne.descripcion as DescCentroCosto,--'DescCentroCosto' as DescCentroCosto,
                      e.e_mail,  
                      0 as Plaza,--hoy sabado 'Plaza' as Plaza,
                      e.Banco, e.CuentaBanco,--,-- o.Entidad, 
                      ne.nivel as Entidad,
                      left(ne.descripcion,20) as DescEntidad,--'DescEntidad' as DescEntidad,

0 as IdUbicacion,
'Ubicacion' as Ubicacion,

0 as PlazaSuperior,
0 as EmpresaSuperior,
0 As EmpresaFuenteSuperior,

0 as idNivelPuesto,
'urlFoto' as urlFoto,
e.Estatus

FROM         dbo.VT_Recursos r,                  --Select * from dbo.VT_Recursos
             dbo.VT_RecursoEmpresa e,            --Select * from dbo.VT_RecursoEmpresa where id_recurso_vt in (12350,1942,2000)
             kiosco.dbo.companias c ,            --Select * from kiosco.dbo.companias
             kiosco.dbo.empleados emp,           --Select * from kiosco.dbo.empleados 
             kiosco.dbo.nominas n,               --Select * from kiosco.dbo.nominas
             kiosco.dbo.recursos rec,            --Select * from kiosco.dbo.recursos 
             kiosco.dbo.estructuras es,          --Select * from kiosco.dbo.estructuras
             kiosco.dbo.estructuras_empleado ee, --Select * from kiosco.dbo.estructuras_empleado
             kiosco.dbo.niveles_estructura ne    --Select * from kiosco.dbo.niveles_estructura

WHERE  r.id_recurso_vt = e.id_recurso_vt
and e.empleado=emp.empleado
and c.compania = emp.compania
and emp.compania = n.compania AND emp.nomina = n.nomina
and emp.id = rec.id
and emp.compania = es.compania
and emp.id = ee.id AND emp.fecha_baja <= ee.fecha_vigencia_hasta
and emp.compania = ne.compania AND es.estructura = ne.estructura AND ee.id_nivel_estructura = ne.id_nivel_estructura  
and (emp.estatus = 2) 
--cacm quite 15-Sep-09--
AND (n.descripcion LIKE '%EMPLEADO%') 
AND (es.principal = 1) AND (ne.fecha_vigencia_hasta IS NULL)  
and (emp.fecha_baja >= GETDATE() - 365)  

/*
select * from organizacion_vzt.dbo.VT_RecursoEmpresa
select * from organizacion_vzt.dbo.VT_Recursos

SELECT     c.compania AS CIA, n.nomina AS NOMINA, n.descripcion AS DESC_NOMINA, e.empleado AS EMPLEADO, e.id AS ID_ESLABON, '0' AS ID_VERZATEC,   
                      r.paterno AS PATERNO, r.materno AS MATERNO, r.nombre AS NOMBRE, ni.nivel AS CCOSTO, ni.descripcion AS DESC_CCOSTO, e.fecha_baja AS FECHA_BAJA  
SELECT c.*,e.*,n.*,r.*,es.*,ee.*,ni.*
FROM                  
                      kiosco.dbo.companias AS c INNER JOIN  
                      kiosco.dbo.empleados AS e ON c.compania = e.compania INNER JOIN  
                      kiosco.dbo.nominas AS n ON e.compania = n.compania AND e.nomina = n.nomina INNER JOIN  
                      kiosco.dbo.recursos AS r ON e.id = r.id INNER JOIN  
                      kiosco.dbo.estructuras AS es ON e.compania = es.compania INNER JOIN  
                      kiosco.dbo.estructuras_empleado AS ee ON e.id = ee.id AND e.fecha_baja <= ee.fecha_vigencia_hasta INNER JOIN  
                      kiosco.dbo.niveles_estructura AS ni ON e.compania = ni.compania AND es.estructura = ni.estructura AND ee.id_nivel_estructura = ni.id_nivel_estructura  
WHERE     (e.estatus = 2) AND (n.descripcion LIKE '%EMPLEADO%') AND (es.principal = 1) AND (ni.fecha_vigencia_hasta IS NULL)  
and (e.fecha_baja >= GETDATE() - 365)  
and nombre like '%Alejandro%' and paterno like '%lara%'

*/

GO
/****** Object:  View [dbo].[V_EstructuraVerzatec_ConBajas_Test]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from V_EstructuraVerzatec_ConBajas where id_recurso_vt=1942
--select * from V_EstructuraVerzatec where id_recurso_vt=2000


--CACM: Ago-09
CREATE              VIEW [dbo].[V_EstructuraVerzatec_ConBajas_Test]
AS

SELECT     e.id_recurso_vt, e.Empresa, e.EmpresaFuente, 
           0 as IdDivision, 
           'Division' as Division,           
           c.razon_social as razon_social,--'Empresas Verzatec, S. de R.L. de C.V.' as razon_social,
           c.RFC as RFC_Empresa,--'RFC_Empresa' as RFC_Empresa,
           e.Empleado, e.id, r.Nombre + ' ' + r.Paterno + ' ' + r.Materno AS NombreCompleto, r.Nombre, r.Paterno, r.Materno, 
           e.nomina,  
           n.descripcion as DescNomina,--'DescNomina' as DescNomina,
           r.RFC, 
           e.Fecha_Nacimiento, e.Fecha_Antiguedad, 
           CASE e.fecha_antiguedad WHEN 0 THEN '0.0' ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) % 12) END AS Antiguedad_Empresa, 
           emp.Fecha_Baja, 
                      'RegPatronal' as RegPatronal,
                      0 as Sucursal_IMSS,--hoy sabado 'Sucursal_IMSS' as Sucursal_IMSS,
                      'Razon_Social_IMSS' as Razon_Social_IMSS,
                      e.cedula_imss, 
                      getdate() as Fecha_Puesto,
                      0 as Antiguedad_Puesto,
                      0 as idPuesto,
                      'Puesto Baja' as Puesto,
                      0 as idDireccion,
                      'Direccion' as Direccion,
                      0 as idArea,
                      'Area' as Area,
                      ne.id_nivel_estructura as CentroCosto,
                      ne.descripcion as DescCentroCosto,--'DescCentroCosto' as DescCentroCosto,
                      e.e_mail,  
                      0 as Plaza,--hoy sabado 'Plaza' as Plaza,
                      e.Banco, e.CuentaBanco,--,-- o.Entidad, 
                      ne.nivel as Entidad,
                      left(ne.descripcion,20) as DescEntidad,--'DescEntidad' as DescEntidad,

0 as IdUbicacion,
'Ubicacion' as Ubicacion,

0 as PlazaSuperior,
0 as EmpresaSuperior,
0 As EmpresaFuenteSuperior,

0 as idNivelPuesto,
'urlFoto' as urlFoto,
e.Estatus

FROM         dbo.VT_Recursos r,                  --Select * from dbo.VT_Recursos
             dbo.VT_RecursoEmpresa e,            --Select * from dbo.VT_RecursoEmpresa where id_recurso_vt in (12350,1942,2000)
             kiosco.dbo.companias c ,            --Select * from kiosco.dbo.companias
             kiosco.dbo.empleados emp,           --Select * from kiosco.dbo.empleados 
             kiosco.dbo.nominas n,               --Select * from kiosco.dbo.nominas
             kiosco.dbo.recursos rec,            --Select * from kiosco.dbo.recursos 
             kiosco.dbo.estructuras es,          --Select * from kiosco.dbo.estructuras
             kiosco.dbo.estructuras_empleado ee, --Select * from kiosco.dbo.estructuras_empleado
             kiosco.dbo.niveles_estructura ne    --Select * from kiosco.dbo.niveles_estructura

WHERE  r.id_recurso_vt = e.id_recurso_vt
and e.empleado=emp.empleado
and c.compania = emp.compania
and emp.compania = n.compania AND emp.nomina = n.nomina
and emp.id = rec.id
and emp.compania = es.compania
and emp.id = ee.id AND emp.fecha_baja <= ee.fecha_vigencia_hasta
and emp.compania = ne.compania AND es.estructura = ne.estructura AND ee.id_nivel_estructura = ne.id_nivel_estructura  
and (emp.estatus = 2) 
--cacm quite 15-Sep-09--
--AND (n.descripcion LIKE '%EMPLEADO%') 
AND (es.principal = 1) AND (ne.fecha_vigencia_hasta IS NULL)  
and (emp.fecha_baja >= GETDATE() - 365)  

/*
select * from organizacion_vzt.dbo.VT_RecursoEmpresa
select * from organizacion_vzt.dbo.VT_Recursos

SELECT     c.compania AS CIA, n.nomina AS NOMINA, n.descripcion AS DESC_NOMINA, e.empleado AS EMPLEADO, e.id AS ID_ESLABON, '0' AS ID_VERZATEC,   
                      r.paterno AS PATERNO, r.materno AS MATERNO, r.nombre AS NOMBRE, ni.nivel AS CCOSTO, ni.descripcion AS DESC_CCOSTO, e.fecha_baja AS FECHA_BAJA  
SELECT c.*,e.*,n.*,r.*,es.*,ee.*,ni.*
FROM                  
                      kiosco.dbo.companias AS c INNER JOIN  
                      kiosco.dbo.empleados AS e ON c.compania = e.compania INNER JOIN  
                      kiosco.dbo.nominas AS n ON e.compania = n.compania AND e.nomina = n.nomina INNER JOIN  
                      kiosco.dbo.recursos AS r ON e.id = r.id INNER JOIN  
                      kiosco.dbo.estructuras AS es ON e.compania = es.compania INNER JOIN  
                      kiosco.dbo.estructuras_empleado AS ee ON e.id = ee.id AND e.fecha_baja <= ee.fecha_vigencia_hasta INNER JOIN  
                      kiosco.dbo.niveles_estructura AS ni ON e.compania = ni.compania AND es.estructura = ni.estructura AND ee.id_nivel_estructura = ni.id_nivel_estructura  
WHERE     (e.estatus = 2) AND (n.descripcion LIKE '%EMPLEADO%') AND (es.principal = 1) AND (ni.fecha_vigencia_hasta IS NULL)  
and (e.fecha_baja >= GETDATE() - 365)  
and nombre like '%Alejandro%' and paterno like '%lara%'


select * from v_empleadosverzatec where DescNomina like '%Sind%'
Select * from kiosco.dbo.niveles_estructura where nivel='1301'
Select * from kiosco.dbo.niveles_estructura where nivel='LEP-ALTI'
*/

GO
/****** Object:  View [dbo].[v_NuevaVista]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_NuevaVista] 
as
SELECT  distinct e.id_recurso_vt, 
e.Empresa, 
e.EmpresaFuente, 
emp2.Empresa AS idDivision, 
emp2.Descripcion AS Division, 
emp.razon_social, 
emp.RFC AS RFC_Empresa, 
e.Empleado, 
e.id, 
r.Nombre + ' ' + r.Paterno + ' ' + r.Materno AS NombreCompleto, 
r.Nombre, 
r.Paterno, 
r.Materno, 
e.nomina, 
n.Desc_esp AS DescNomina, 
r.RFC, 
e.Fecha_Nacimiento, 
e.Fecha_Antiguedad, 
CASE e.fecha_antiguedad WHEN 0 THEN '0.0' ELSE CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, 
getdate()) / 30.4)) / 12) + '.' + CONVERT(varchar(2), (CONVERT(int, datediff(y, e.fecha_antiguedad, getdate()) / 30.4)) % 12) END AS Antiguedad_Empresa, 
--e.Fecha_Baja, 
e.cedula_imss, 
p.id_nivel_puesto AS idPuesto, 
p.Desc_esp AS Puesto, 
dir.Nivel AS idDireccion, 
dir.Desc_esp AS Direccion, 
o.Area AS idArea, 
ne.Desc_esp AS Area, 
neCC.Nivel AS CentroCosto, 
neCC.Desc_esp AS DescCentroCosto, 
--e.e_mail, 
o.Plaza, 
o.Entidad, 
CASE o.Entidad WHEN 1000 THEN '1000 – Staff' WHEN 1100 THEN '1100 - Perfiles Mty' WHEN 1110 THEN '1110 - Perfiles Mex' WHEN 1200 THEN '1200 - Escaleras' WHEN
                       1301 THEN '1301 – Ventanas' WHEN 1400 THEN '1400 – Perfiles Guadalajara ' WHEN 1500 THEN '1500 – Perfiles Comercial ' WHEN 2041 THEN '2041 - Tiendas Cuprum'
                       WHEN 2050 THEN '2050 - Metales Díaz' WHEN 3030 THEN '3030 - Bayer' WHEN 3050 THEN '3050 – Stabilit Villa de García' WHEN 3051 THEN '3051 - Tlanepantla' WHEN
                       3052 THEN '3052 - Guadalajara' WHEN 3053 THEN '3053 - Villahermosa' WHEN 3054 THEN '3054 - Tultitlan' WHEN 3055 THEN '3055 - Mexicali' WHEN 3070 THEN '3070 – Stabilit Europa'
                       WHEN 4000 THEN '4000 – Stabilit America' WHEN 4020 THEN '4020 – Formet' ELSE '0 – Louisville' END AS DescEntidad, 
o.Ubicacion AS idUbicacion, 
ub.Desc_esp AS Ubicacion, 
o.Plaza_Superior, 
o.Empresa_Superior, 
o.EmpresaFuente_Superior, 
p.id_Nivel AS id_NivelPuesto--, 
--min(e.Estatus) as estatus
FROM         dbo.VT_Recursos AS r INNER JOIN
                      dbo.VT_RecursoEmpresa AS e ON r.id_recurso_vt = e.id_recurso_vt INNER JOIN
                      dbo.VT_Organigrama AS o ON o.id_Recurso_vt = e.id_recurso_vt AND o.Empresa = e.Empresa AND o.EmpresaFuente = e.EmpresaFuente LEFT OUTER JOIN
                      dbo.VT_Puesto AS p ON p.Empresa = o.Empresa AND p.EmpresaFuente = o.EmpresaFuente AND p.id_nivel_puesto = o.id_nivel_puesto INNER JOIN
                      dbo.VT_NivelesEstructura AS ne ON ne.Nivel = o.Area AND ne.Empresa = o.Empresa AND ne.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
                      dbo.VT_NivelesEstructura AS neCC ON RTRIM(CAST(neCC.id_NivelEstructura AS varchar)) = o.CentroCosto AND neCC.Empresa = o.Empresa AND 
                      neCC.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
                      dbo.VT_Empresa AS emp ON emp.Empresa = e.Empresa LEFT OUTER JOIN
                      dbo.VT_Empresa AS emp2 ON emp2.Empresa = emp.Empresa_Padre LEFT OUTER JOIN
                      dbo.VT_EmpleadosPlazas AS ep ON ep.Empresa = o.Empresa AND ep.EmpresaFuente = o.EmpresaFuente AND ep.Plaza = o.Plaza AND 
                      ep.id_Recurso_vt = o.id_Recurso_vt LEFT OUTER JOIN
                      --dbo.VT_SucursalIMSS AS si ON si.Empresa = e.Empresa AND si.EmpresaFuente = e.EmpresaFuente AND si.Sucursal_IMSS = e.Sucursal_IMSS LEFT OUTER JOIN
                      dbo.VT_Nomina AS n ON n.Empresa = e.Empresa AND n.EmpresaFuente = e.EmpresaFuente AND n.Nomina = e.nomina LEFT OUTER JOIN
                      dbo.VT_NivelesEstructura AS ub ON ub.Nivel = o.Ubicacion AND ub.Estructura = o.EstructuraUbicacion AND ub.Empresa = o.Empresa AND 
                      ub.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
                      dbo.VT_NivelesEstructura AS dir ON dir.id_NivelEstructura = ne.id_NivelSuperior AND dir.Empresa = ne.Empresa AND dir.EmpresaFuente = ne.EmpresaFuente
WHERE     (ne.Fecha_Vigencia_Hasta IS NULL) AND (ne.Estructura = 2) AND (neCC.Fecha_Vigencia_Hasta IS NULL) AND 
                      (neCC.Estructura = 1) AND (ep.fecha_vigencia_hasta IS NULL) AND (emp.Estatus = 1) AND (emp2.Estatus = 1) AND 
                      (ub.Fecha_Vigencia_Hasta IS NULL) AND (dir.Fecha_Vigencia_Hasta IS NULL) AND (dir.Estructura = 2) and o.Empresa not like '%9%'
and not ep.fecha_vigencia_desde is null
and (e.nomina <> 2 and o.entidad <> 4020)

GO
/****** Object:  View [dbo].[v_OrganigramaVerzatec]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Objetivo:	Consultar las Dependencias Organizacionales de Verzatec
	Creado por:	Jaime Sánchez
	Fecha:		12/Abril/2007
	
*/
 CREATE View [dbo].[v_OrganigramaVerzatec]
 AS
	select 	plaza,
		Empresa,
		EmpresaFuente,
		id_Recurso_vt,
		Plaza_Superior,
		Empresa_Superior,
		EmpresaFuente_Superior
	from 	vt_organigrama
	where	Estatus = 1

GO
/****** Object:  View [dbo].[V_PLAZAS_PUBLICAS]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PLAZAS_PUBLICAS] AS
SELECT PL.EMPRESAFUENTE AS COMPANIA, PL.PLAZA, --PL.ID_NIVEL_PUESTO, 
			P.PUESTO +' - '+ P.DESC_ESP AS PUESTO,
			CASE WHEN PL.ID_RECURSO_VT = 0 THEN 'VACANTE' ELSE R.NOMBRE +' '+ R.PATERNO +' '+ R.MATERNO END AS NOMBRECOMPLETO, 
			CASE WHEN PL.PUBLICA = 0 THEN 'NO' ELSE 'SI' END AS PUBLICA,
			PL.PLAZA_SUPERIOR, CASE WHEN PLJ.ID_RECURSO_VT = 0 THEN 'VACANTE' ELSE ISNULL(RJ.NOMBRE +' '+ RJ.PATERNO +' '+ RJ.MATERNO, 'NO DISPONIBLE' ) END AS NOMBRECOMPLETOJEFE
FROM VT_ORGANIGRAMA PL 
	JOIN VT_RECURSOS R ON R.ID_RECURSO_VT = PL.ID_RECURSO_VT
	LEFT JOIN VT_PUESTO P ON P.EMPRESAFUENTE = PL.EMPRESAFUENTE AND P.ID_NIVEL_PUESTO = PL.ID_NIVEL_PUESTO
	LEFT JOIN VT_ORGANIGRAMA PLJ ON PLJ.EMPRESAFUENTE = PL.EMPRESAFUENTE_SUPERIOR AND PLJ.PLAZA = PL.PLAZA_SUPERIOR AND PLJ.ESTATUS = 1
	LEFT JOIN VT_RECURSOS RJ ON RJ.ID_RECURSO_VT = PLJ.ID_RECURSO_VT
WHERE PL.ESTATUS = 1

GO
/****** Object:  View [dbo].[v_PuestosVerzatec]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE view [dbo].[v_PuestosVerzatec]
as 
SELECT  p.Empresa, p.EmpresaFuente, o.Plaza, 
		idDivision = 
						CASE WHEN Entidad = 1301 OR
								  Entidad = 2050 OR
								  Entidad = 2041 OR
								  Entidad = 2042 OR
								  Entidad = 1110 OR
								  Entidad = 1100 OR
								  Entidad = 1000 OR
								  Entidad = 1200 OR
								  Entidad = 1400 OR
								  Entidad = 1500 OR
								  Entidad = 5000 OR
								  Entidad = 0 or
								  Entidad is null 
								THEN 2
							WHEN Entidad = 4020 
								THEN 3 
							WHEN Entidad = 3030 OR
								  Entidad = 3050 OR
								  Entidad = 3051 OR
								  Entidad = 3052 OR
								  Entidad = 3053 OR
								  Entidad = 3054 OR
								  Entidad = 3055 OR
								  Entidad = 3056 OR
								  Entidad = 4000 OR
								  Entidad = 3070 
								THEN 4 
						END,
						
		Division = 
						CASE WHEN Entidad = 1301 OR
								  Entidad = 2050 OR
								  Entidad = 2041 OR
								  Entidad = 2042 OR
								  Entidad = 1110 OR
								  Entidad = 1100 OR
								  Entidad = 1000 OR
								  Entidad = 1200 OR
								  Entidad = 1400 OR
								  Entidad = 1500 OR
								  Entidad = 5000 OR
								  Entidad = 0 or
								  Entidad is null 
								THEN 'Aluminio/Staff' 
							WHEN Entidad = 4020 
								THEN 'Formet' 
							WHEN Entidad = 3030 OR
								  Entidad = 3050 OR
								  Entidad = 3051 OR
								  Entidad = 3052 OR
								  Entidad = 3053 OR
								  Entidad = 3054 OR
								  Entidad = 3055 OR
								  Entidad = 3056 OR
								  Entidad = 4000 OR
								  Entidad = 3070 
								THEN 'Stabilit' 
						END , /*Empresa  */ 
		idDireccion = isnull ((SELECT     Nivel
                              FROM         VT_NivelesEstructura
                              WHERE     id_NivelEstructura = ne.id_NivelSuperior AND Empresa = ne.Empresa AND EmpresaFuente = ne.EmpresaFuente AND Fecha_Vigencia_Hasta IS NULL 
                                                    AND Estructura = 2), ''), Direccion = isnull
                          ((/* --Direccion  */ SELECT Desc_esp
                              FROM         VT_NivelesEstructura
                              WHERE     id_NivelEstructura = ne.id_NivelSuperior AND Empresa = ne.Empresa AND EmpresaFuente = ne.EmpresaFuente AND Fecha_Vigencia_Hasta IS NULL 
                                                    AND Estructura = 2), ''), idArea = isnull(o.Area, ''), Area = isnull(ne.Desc_esp, ''), ClavePuesto = p.Puesto, idPuesto = p.id_nivel_puesto, 
                      Puesto = p.Desc_esp, o.id_recurso_vt, 
                      Empleado = isnull
                          ((SELECT DISTINCT TOP 1 Empleado
                              FROM         VT_RecursoEmpresa
                              WHERE     id_recurso_vt = o.id_recurso_vt 
                              AND Empresa=5000 --CACM: 02-Ene-2012
                              and Estatus NOT IN (2, 4)), ''), 
                     NombreEmpleado = isnull
                          ((SELECT DISTINCT TOP 1 Nombre + ' ' + Paterno + ' ' + Materno
                              FROM         VT_Recursos
                              WHERE     id_recurso_vt = o.id_recurso_vt), 'Vacante'), 
                     p.id_nivel_Puesto, isnull(o.Entidad,0) as Entidad
FROM    VT_Organigrama o, VT_Puesto p, VT_NivelesEstructura ne, /*Area  */ VT_Empresa emp, VT_Empresa emp2
		/*Para obtener la division  */ WHERE /*PUESTOS  */ p.Empresa =* o.Empresa AND p.EmpresaFuente =* o.EmpresaFuente AND 
		p.id_nivel_puesto =* o.id_nivel_puesto /*Area  */ AND ne.Nivel =* o.Area AND ne.Empresa =* o.Empresa AND ne.EmpresaFuente =* o.EmpresaFuente AND 
		ne.Fecha_Vigencia_Hasta IS NULL AND ne.Estructura = 2 /*Division  */ AND emp2.Empresa = emp.Empresa_Padre AND emp2.Estatus = 1 /*Empresa  */ AND 
		emp.Empresa = o.Empresa AND emp.Estatus = 1


GO
/****** Object:  View [dbo].[v_Verzatec]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Verzatec]
AS

SELECT	e.id_recurso_vt, e.Empresa, e.EmpresaFuente, emp2.Empresa AS idDivision, 
		emp2.Descripcion AS Division, emp.razon_social, emp.RFC AS RFC_Empresa, 
		e.Empleado, e.id, r.Nombre + ' ' + r.Paterno + ' ' + r.Materno AS NombreCompleto, 
		r.Nombre, r.Paterno, r.Materno, e.nomina, n.Desc_esp AS DescNomina, r.RFC, 
		e.Fecha_Nacimiento, e.Fecha_Antiguedad, ep.fecha_vigencia_desde AS Fecha_Puesto, 
		p.id_nivel_puesto AS idPuesto, p.Desc_esp AS Puesto, 
		dir.Nivel AS idDireccion, dir.Desc_esp AS Direccion, o.Area AS idArea, 
		ne.Desc_esp AS Area, neCC.Nivel AS CentroCosto, neCC.Desc_esp AS DescCentroCosto, 
		e.e_mail, o.Plaza, o.Entidad, 
		CASE o.Entidad 
			WHEN 1000 THEN '1000 – Staff Aluminio' 
			WHEN 1100 THEN '1100 - Perfiles Mty' 
			WHEN 1110 THEN '1110 - Perfiles Mex' 
			WHEN 1200 THEN '1200 - Escaleras' 
			WHEN 1301 THEN '1301 – Ventanas' 
			WHEN 1400 THEN '1400 – Perfiles Guadalajara ' 
			WHEN 1500 THEN '1500 – Perfiles Comercial ' 
			WHEN 2041 THEN '2041 - Tiendas Cuprum'
			WHEN 2050 THEN '2050 - Metales Díaz' 
			WHEN 3030 THEN '3030 - Bayer' 
			WHEN 3050 THEN '3050 – Stabilit Villa de García' 
			WHEN 3051 THEN '3051 - Tlanepantla' 
			WHEN 3052 THEN '3052 - Guadalajara' 
			WHEN 3053 THEN '3053 - Villahermosa' 
			WHEN 3054 THEN '3054 - Tultitlan' 
			WHEN 3055 THEN '3055 - Mexicali' 
			WHEN 3055 THEN '3055 - Stabilit America'
			WHEN 3070 THEN '3070 – Stabilit Europa' 
			WHEN 4000 THEN '4000 – Stabilit America' 
			WHEN 4020 THEN '4020 – Formet'
			WHEN 5000 THEN '5000 – Staff Verzatec' 
			WHEN 2042 THEN '2042 – Staff Tiendas Cuprum & MD'
			ELSE '0 – Louisville' 
		END AS DescEntidad, 
		o.Ubicacion AS idUbicacion, ub.Desc_esp AS Ubicacion, o.Plaza_Superior, o.Empresa_Superior, 
		o.EmpresaFuente_Superior, p.id_Nivel AS id_NivelPuesto, 
		CASE WHEN e.Empresa BETWEEN 9000 AND 9999 
			THEN CASE WHEN Charindex(',' + rtrim(CAST(e.Nomina AS char)) + ',', ',1,3,4,6,') > 0 
				THEN 'http://SNOMB/Credenciales/Stabilit/Empleados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
				ELSE 'http://SNOMB/Credenciales/Stabilit/Sindicalizados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
				END 
			WHEN e.Empresa BETWEEN 4000 AND 4999 
				THEN CASE WHEN Charindex(',' + rtrim(CAST(e.Nomina AS char)) + ',', ',2,4,5,6,') > 0 
				THEN 'http://SNOMB/Credenciales/Formet/Empleados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
				ELSE 'http://SNOMB/Credenciales/Formet/Sindicalizados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
				END 
			WHEN e.empresa = 5000 
				THEN CASE WHEN e.EmpresaFuente > 3 AND e.EmpresaFuente <> 8 
					THEN 'http://SNOMB/Credenciales/' + rtrim(CAST(e.EmpresaFuente AS char)) + '/' + rtrim(CAST(e.Nomina AS char)) + '/Foto/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
					ELSE 'http://SNOMB/Credenciales/' + rtrim(CAST(e.EmpresaFuente AS char)) + '/Foto/' + rtrim(CAST(e.Nomina AS char)) + '/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' 
					END 
				ELSE '' 
		END AS urlFoto, 
		e.Estatus, o.APLICA_HABILIDADES
FROM    dbo.VT_Recursos AS r INNER JOIN
		dbo.VT_RecursoEmpresa AS e ON r.id_recurso_vt = e.id_recurso_vt LEFT OUTER JOIN
		dbo.VT_Organigrama AS o ON o.id_Recurso_vt = e.id_recurso_vt AND o.Empresa = e.Empresa AND o.EmpresaFuente = e.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_Puesto AS p ON p.Empresa = o.Empresa AND p.EmpresaFuente = o.EmpresaFuente AND p.id_nivel_puesto = o.id_nivel_puesto INNER JOIN
		dbo.VT_NivelesEstructura AS ne ON ne.Nivel = o.Area AND ne.Empresa = o.Empresa AND ne.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS neCC ON RTRIM(CAST(neCC.id_NivelEstructura AS varchar)) = o.CentroCosto AND neCC.Empresa = o.Empresa AND 
		neCC.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_Empresa AS emp ON emp.Empresa = e.Empresa LEFT OUTER JOIN
		dbo.VT_Empresa AS emp2 ON emp2.Empresa = emp.Empresa_Padre LEFT OUTER JOIN
		dbo.VT_EmpleadosPlazas AS ep ON ep.Empresa = o.Empresa AND ep.EmpresaFuente = o.EmpresaFuente AND ep.Plaza = o.Plaza AND 
		ep.id_Recurso_vt = o.id_Recurso_vt LEFT OUTER JOIN
		dbo.VT_Nomina AS n ON n.Empresa = e.Empresa AND n.EmpresaFuente = e.EmpresaFuente AND n.Nomina = e.nomina LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS ub ON ub.Nivel = o.Ubicacion AND ub.Estructura = o.EstructuraUbicacion AND ub.Empresa = o.Empresa AND 
		ub.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS dir ON dir.id_NivelEstructura = ne.id_NivelSuperior AND dir.Empresa = ne.Empresa AND dir.EmpresaFuente = ne.EmpresaFuente
WHERE   (e.Estatus NOT IN (2, 4)) AND (o.Estatus = 1) AND (ne.Fecha_Vigencia_Hasta IS NULL) AND (ne.Estructura = 2) AND (neCC.Fecha_Vigencia_Hasta IS NULL) AND 
		(neCC.Estructura = 1) AND (ep.fecha_vigencia_hasta IS NULL) AND (emp.Estatus = 1) AND (emp2.Estatus = 1) AND (ub.Fecha_Vigencia_Hasta IS NULL) AND 
		(dir.Fecha_Vigencia_Hasta IS NULL) AND (dir.Estructura = 2)




GO
/****** Object:  View [dbo].[v_VerzatecNuevo]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_VerzatecNuevo] 
as
SELECT	e.id_recurso_vt, 
		e.Empresa, 
		e.EmpresaFuente, 
		emp2.Empresa AS idDivision, 
		emp2.Descripcion AS Division, 
		emp.razon_social, 
		emp.RFC AS RFC_Empresa, 
		e.Empleado, 
		e.id, 
		r.Nombre + ' ' + r.Paterno + ' ' + r.Materno AS NombreCompleto, 
		r.Nombre, 
		r.Paterno, 
		r.Materno, 
		e.nomina, 
		n.Desc_esp AS DescNomina, 
		r.RFC, 
		e.Fecha_Nacimiento, 
		e.Fecha_Antiguedad, 
		ep.fecha_vigencia_desde AS Fecha_Puesto, 
		p.id_nivel_puesto AS idPuesto, 
		p.Desc_esp AS Puesto, 
		dir.Nivel AS idDireccion, 
		dir.Desc_esp AS Direccion, 
		o.Area AS idArea, 
		ne.Desc_esp AS Area, 
		neCC.Nivel AS CentroCosto, 
		neCC.Desc_esp AS DescCentroCosto, 
		e.e_mail, 
		o.Plaza, 
		o.Entidad, 
		CASE o.Entidad 
			WHEN 1000 THEN '1000 – Staff Aluminio' 
			WHEN 1100 THEN '1100 - Perfiles Mty' 
			WHEN 1110 THEN '1110 - Perfiles Mex' 
			WHEN 1200 THEN '1200 - Escaleras' 
			WHEN 1301 THEN '1301 – Ventanas' 
			WHEN 1400 THEN '1400 – Perfiles Guadalajara ' 
			WHEN 1500 THEN '1500 – Perfiles Comercial ' 
			WHEN 2041 THEN '2041 - Tiendas Cuprum'
			WHEN 2050 THEN '2050 - Metales Díaz' 
			WHEN 3030 THEN '3030 - Bayer' 
			WHEN 3050 THEN '3050 – Stabilit Villa de García' 
			WHEN 3051 THEN '3051 - Tlanepantla' 
			WHEN 3052 THEN '3052 - Guadalajara' 
			WHEN 3053 THEN '3053 - Villahermosa' 
			WHEN 3054 THEN '3054 - Tultitlan' 
			WHEN 3055 THEN '3055 - Mexicali' 
			WHEN 3055 THEN '3056 - Stabilit America' 
			WHEN 3070 THEN '3070 – Stabilit Europa'
			WHEN 4000 THEN '4000 – Stabilit America' 
			WHEN 4020 THEN '4020 – Formet'
			WHEN 5000 THEN '5000 – Staff Verzatec' 
			WHEN 2042 THEN '2042 – Staff Tiendas Cuprum & MD'
			ELSE '0 – Louisville' 
		END AS DescEntidad, 
		o.Ubicacion AS idUbicacion, 
		ub.Desc_esp AS Ubicacion, 
		o.Plaza_Superior, 
		o.Empresa_Superior, 
		o.EmpresaFuente_Superior, 
		p.id_Nivel AS id_NivelPuesto, 
		CASE WHEN e.Empresa BETWEEN 
                      9000 AND 9999 THEN CASE WHEN Charindex(',' + rtrim(CAST(e.Nomina AS char)) + ',', ',1,3,4,6,') 
                      > 0 THEN 'http://SNOMB/Credenciales/Stabilit/Empleados/' + rtrim(CAST(e.Empleado AS char)) 
                      + '.jpg' ELSE 'http://SNOMB/Credenciales/Stabilit/Sindicalizados/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' END WHEN e.Empresa BETWEEN 4000 AND 
                      4999 THEN CASE WHEN Charindex(',' + rtrim(CAST(e.Nomina AS char)) + ',', ',2,4,5,6,') 
                      > 0 THEN 'http://SNOMB/Credenciales/Formet/Empleados/' + rtrim(CAST(e.Empleado AS char)) 
                      + '.jpg' ELSE 'http://SNOMB/Credenciales/Formet/Sindicalizados/' + rtrim(CAST(e.Empleado AS char)) 
                      + '.jpg' END WHEN e.empresa = 5000 THEN CASE WHEN e.EmpresaFuente > 3 AND 
                      e.EmpresaFuente <> 8 THEN 'http://SNOMB/Credenciales/' + rtrim(CAST(e.EmpresaFuente AS char)) + '/' + rtrim(CAST(e.Nomina AS char)) 
                      + '/Foto/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' ELSE 'http://SNOMB/Credenciales/' + rtrim(CAST(e.EmpresaFuente AS char)) 
                      + '/Foto/' + rtrim(CAST(e.Nomina AS char)) + '/' + rtrim(CAST(e.Empleado AS char)) + '.jpg' END ELSE '' END AS urlFoto, e.Estatus, o.APLICA_HABILIDADES
FROM    dbo.VT_Recursos AS r INNER JOIN
		dbo.VT_RecursoEmpresa AS e 
		ON r.id_recurso_vt = e.id_recurso_vt LEFT OUTER JOIN
		dbo.VT_Organigrama AS o 
		ON o.id_Recurso_vt = e.id_recurso_vt 
		AND o.Empresa = e.Empresa 
		AND o.EmpresaFuente = e.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_Puesto AS p 
		ON p.Empresa = o.Empresa 
		AND p.EmpresaFuente = o.EmpresaFuente 
		AND p.id_nivel_puesto = o.id_nivel_puesto INNER JOIN
		dbo.VT_NivelesEstructura AS ne 
		ON ne.Nivel = o.Area 
		AND ne.Empresa = o.Empresa 
		AND ne.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS neCC 
		ON RTRIM(CAST(neCC.id_NivelEstructura AS varchar)) = o.CentroCosto 
		AND neCC.Empresa = o.Empresa 
		AND neCC.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_Empresa AS emp 
		ON emp.Empresa = e.Empresa LEFT OUTER JOIN
		dbo.VT_Empresa AS emp2 
		ON emp2.Empresa = emp.Empresa_Padre LEFT OUTER JOIN
		dbo.VT_EmpleadosPlazas AS ep 
		ON ep.Empresa = o.Empresa 
		AND ep.EmpresaFuente = o.EmpresaFuente 
		AND ep.Plaza = o.Plaza 
		AND ep.id_Recurso_vt = o.id_Recurso_vt LEFT OUTER JOIN
		dbo.VT_Nomina AS n 
		ON n.Empresa = e.Empresa 
		AND n.EmpresaFuente = e.EmpresaFuente 
		AND n.Nomina = e.nomina LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS ub 
		ON ub.Nivel = o.Ubicacion 
		AND ub.Estructura = o.EstructuraUbicacion 
		AND ub.Empresa = o.Empresa 
		AND ub.EmpresaFuente = o.EmpresaFuente LEFT OUTER JOIN
		dbo.VT_NivelesEstructura AS dir 
		ON dir.id_NivelEstructura = ne.id_NivelSuperior 
		AND dir.Empresa = ne.Empresa 
		AND dir.EmpresaFuente = ne.EmpresaFuente
WHERE (ne.Fecha_Vigencia_Hasta IS NULL) 
		AND (ne.Estructura = 2) 
		AND (neCC.Fecha_Vigencia_Hasta IS NULL) 
		AND (neCC.Estructura = 1) 
		AND (ep.fecha_vigencia_hasta IS NULL) 
		AND (emp.Estatus = 1) 
		AND (emp2.Estatus = 1) 
		AND (ub.Fecha_Vigencia_Hasta IS NULL) 
		AND (dir.Fecha_Vigencia_Hasta IS NULL) 
		AND (dir.Estructura = 2)
		and o.Empresa = 5000


GO
/****** Object:  View [dbo].[ViewTest]    Script Date: 14/03/2017 10:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[ViewTest]
AS 
	SELECT * FROM dbo.vt_RecursoEmpresa

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_EmpleadosVerzatec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_EmpleadosVerzatec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 123
               Right = 415
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 243
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 126
               Left = 286
               Bottom = 243
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ne"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 363
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "neCC"
            Begin Extent = 
               Top = 246
               Left = 275
               Bottom = 363
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 483
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_EstructuraVerzatec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'End
         Begin Table = "emp2"
            Begin Extent = 
               Top = 366
               Left = 240
               Bottom = 483
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ep"
            Begin Extent = 
               Top = 486
               Left = 38
               Bottom = 603
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "si"
            Begin Extent = 
               Top = 486
               Left = 272
               Bottom = 603
               Right = 456
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "n"
            Begin Extent = 
               Top = 606
               Left = 38
               Bottom = 723
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ub"
            Begin Extent = 
               Top = 606
               Left = 249
               Bottom = 723
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dir"
            Begin Extent = 
               Top = 726
               Left = 38
               Bottom = 843
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_EstructuraVerzatec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_EstructuraVerzatec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_PuestosVerzatec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_PuestosVerzatec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 123
               Right = 415
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 243
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 17
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 126
               Left = 286
               Bottom = 243
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ne"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 363
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "neCC"
            Begin Extent = 
               Top = 246
               Left = 275
               Bottom = 363
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 483
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Verzatec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' End
         Begin Table = "emp2"
            Begin Extent = 
               Top = 366
               Left = 240
               Bottom = 483
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ep"
            Begin Extent = 
               Top = 486
               Left = 38
               Bottom = 603
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "n"
            Begin Extent = 
               Top = 486
               Left = 272
               Bottom = 603
               Right = 445
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ub"
            Begin Extent = 
               Top = 606
               Left = 38
               Bottom = 723
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dir"
            Begin Extent = 
               Top = 606
               Left = 275
               Bottom = 723
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Verzatec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Verzatec'
GO

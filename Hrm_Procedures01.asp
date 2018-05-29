<%
Sub HdrNem(Prm1, Prm2)
    HdrNid = trim(Prm1)
    HdrCid = trim(Prm2)
  
    '<!--  Buscamos la Imagen, Email y Descripcion de Puesto del Empleado Solicitado Inicio -->
    sqlNhd = "select a.Emp_EmpleadoID, a.Emp_NombreCompleto,  " & _
             "       a.Emp_Foto,       a.Emp_Email,           " & _
             "       c.Pue_Descripcion                        " & _
             "from HRM10220 a, HRM10210 c                     " & _
             "where a.Emp_CompaniaID = c.Pue_CompaniaID       " & _
             "and   a.Emp_PuestoID   = c.Pue_NivelPuestoID    " & _
             "and   a.Emp_NivelID    = c.Pue_NivelID          " & _
             "and   a.Emp_EmpleadoID = '"& HdrNid &"'         " & _
             "and   a.Emp_CompaniaID = '"& HdrCid &"'         "
    set rsNhd = dbconn.execute(sqlNhd)
'    response.write(sqlNhd)
    if not rsNhd.bof and not rsNhd.eof then
        HdrNim = trim(rsNhd("Emp_Foto"))
        HdrNmb = trim(rsNhd("Emp_NombreCompleto"))
        HdrNml = trim(rsNhd("Emp_Email"))
        HdrNpd = trim(rsNhd("Pue_Descripcion"))
    else
        HdrNim = ""
        HdrNmb = ""
        HdrNml = ""
        HdrNpd = ""
    end if
'    response.write("HdrNim : " & HdrNim & ", HdrNmb : " & HdrNmb & ", HdrNml : " & HdrNml & ", HdrNpd : " & HdrNpd)
    '<!--  Buscamos la Imagen, Email y Descripcion de Puesto del Empleado Solicitado Final -->
End Sub

Sub PrmEml()
    '<!--  Buscamos el Parametro de Envio de Email - Inicio -->
    sqlPml = "select Par_ValorInt from HRM10000 where Par_ParametroID = 'ENVIOEMAIL'  "
    set rsPml = dbconn.execute(sqlPml)
    if not rsPml.bof and not rsPml.eof then
        EnvEml = rsPml("Par_ValorInt")
    else
        EnvEml = 0
    end if
    '<!--  Buscamos el Parametro de Envio de Email - Fin -->
End Sub
%>
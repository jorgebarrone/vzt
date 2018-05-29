<%@ Language=VBScript %>
<%	response.buffer = false
	response.expires = 0
    response.ContentType = "application/vnd.ms-excel"
    Response.AddHeader "Content-Disposition", "filename=""Reporte_AccionesRetro_Pade.xls"
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Acciones de Retroalimentacion XLS</title>
  <!--#include file="procedures1.asp"-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0600' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitSec"
                TitSec = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubDiv = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb2"
                Fr1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph2"
                Fr1Ph2 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1 = trim(rsTrn("Trd_Texto"))
              Case "TbHd01"
                TbHd01 = trim(rsTrn("Trd_Texto"))
              Case "TbHd02"
                TbHd02 = trim(rsTrn("Trd_Texto"))
              Case "TbHd03"
                TbHd03 = trim(rsTrn("Trd_Texto"))
              Case "TbHd04"
                TbHd04 = trim(rsTrn("Trd_Texto"))
              Case "TbHd05"
                TbHd05  = trim(rsTrn("Trd_Texto"))
              Case "TbHd06"
                TbHd06  = trim(rsTrn("Trd_Texto"))
              Case "TbHd07"
                TbHd07  = trim(rsTrn("Trd_Texto"))
              Case "TbHd08"
                TbHd08  = trim(rsTrn("Trd_Texto"))
              Case "TbHd09"
                TbHd09 = trim(rsTrn("Trd_Texto"))
              Case "TbHd10"
                TbHd10 = trim(rsTrn("Trd_Texto"))
              Case "TbHd11"
                TbHd11 = trim(rsTrn("Trd_Texto"))
              Case "TbHd12"
                TbHd12 = trim(rsTrn("Trd_Texto"))
              Case "TbHd13"
                TbHd13  = trim(rsTrn("Trd_Texto"))
              Case "TbHd14"
                TbHd14  = trim(rsTrn("Trd_Texto"))
              Case "TbHd15"
                TbHd15  = trim(rsTrn("Trd_Texto"))
              Case "TbHd16"
                TbHd16  = trim(rsTrn("Trd_Texto"))
              Case "TbHd17"
                TbHd17  = trim(rsTrn("Trd_Texto"))
              Case "TbHd18"
                TbHd18  = trim(rsTrn("Trd_Texto"))
              Case "TbHd19"
                TbHd19  = trim(rsTrn("Trd_Texto"))
              Case "TbHd20"
                TbHd20  = trim(rsTrn("Trd_Texto"))
              Case "BxHd01"
                BxHd01  = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02  = trim(rsTrn("Trd_Texto"))
              Case "BxHd03"
                BxHd03  = trim(rsTrn("Trd_Texto"))
              Case "PrcP01"
                PrcP01  = trim(rsTrn("Trd_Texto"))
              Case "PrcP02"
                PrcP02  = trim(rsTrn("Trd_Texto"))
              Case "PrcP03"
                PrcP03  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    Dim Ejr
    Dim Ent
    Ejr = trim(Request.QueryString("EjerID"))
    Ent = trim(Request.QueryString("EntyID"))
    if Ejr = "" then
        Ejr = 0
    end if
    if Ent = "" then
        Ent = 0
    end if

    '<-- Busqueda de Parámetros PADE (Inicio) -->
    if Ejr > 0 then
        sqlEjr = "select a.Pde_Ejercicio,  a.Pde_Estatus, " & _
                 "       b.Pde_Descripcion                " & _
                 "from HRM10500 a left outer join         " & _
                 "     HRMA0500 b                         " & _
                 "on  a.Pde_Ejercicio = b.Pde_Ejercicio   " & _
                 "and b.Pde_IdiomaID  = '"& Lng &"'       " & _
                 "where a.Pde_Estatus = 'A'               "
        set rse = dbconn.execute(sqlEjr)
        if not rse.bof and not rse.eof then
            Dsc    = trim(rse("Pde_Descripcion"))
        else
            Dsc    = ""
        end if
    end if
    %>

    <% call hdr(TitSec,Dsc) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL INICIO -->



                                <div class="box box-primary">
                                    <div class="box-body table-responsive">
                                        <%
                                        if Ejr > 0 then
                                            if Ent > 0 then
                                                sqllis = "select a.Ara_Texto,           b.Rta_Texto as TipAcc,     " & _
                                                         "       c.Rta_Texto as TipPri, d.Rta_Texto as TipAre,     " & _
                                                         "	     e.Emp_CompaniaID,      e.Emp_EmpleadoID,          " & _
                                                         "	     e.Emp_NombreCompleto,  v.DescCentroCosto,         " & _
                                                         "       v.DescEntidad                                     " & _
                                                         "from HRM10551 a, HRM10550 b, HRM10550 c,                 " & _
                                                         "     HRM10550 d, HRM10220 e,                             " & _
                                                         "     ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec v          " & _
                                                         "where a.Ara_CorporativoID = e.Emp_CorporativoID          " & _
                                                         "and   a.Ara_CompaniaID    = e.Emp_CompaniaID             " & _
                                                         "and   a.Ara_EmpleadoID    = e.Emp_EmpleadoID             " & _
                                                         "and   e.Emp_CompaniaID    = v.EmpresaFuente              " & _
                                                         "and   e.Emp_EmpleadoID    = v.Empleado                   " & _
                                                         "and   a.Ara_TipoAccionID  = b.Rta_ClaveID                " & _
                                                         "and   b.Rta_TipoID        = 1                            " & _
                                                         "and   b.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                         "and   a.Ara_PrioridadID   = c.Rta_ClaveID                " & _
                                                         "and   c.Rta_TipoID        = 2                            " & _
                                                         "and   c.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                         "and   a.Ara_TipoAreaID    = d.Rta_ClaveID                " & _
                                                         "and   d.Rta_TipoID        = 3                            " & _
                                                         "and   d.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                         "and   a.Ara_Ejercicio     =  "& Ejr &"                   " & _
                                                         "and   e.Emp_NominaID      < 10                           " & _
                                                         "and   e.Emp_CompaniaID IN('2','10','11')                 " & _
                                                         "and   e.Emp_EntidadID = '"& Ent &"'                      " & _
                                                         "order by e.Emp_CompaniaID,  v.DescEntidad,               " & _
                                                         "         v.DescCentroCosto, e.Emp_NombreCompleto         "
                                            else
                                                sqllis = "select a.Ara_Texto,           b.Rta_Texto as TipAcc,     " & _
                                                         "       c.Rta_Texto as TipPri, d.Rta_Texto as TipAre,     " & _
                                                         "	     e.Emp_CompaniaID,      e.Emp_EmpleadoID,          " & _
                                                         "	     e.Emp_NombreCompleto,  v.DescCentroCosto,         " & _
                                                         "       v.DescEntidad                                     " & _
                                                         "from HRM10551 a, HRM10550 b, HRM10550 c,                 " & _
                                                         "     HRM10550 d, HRM10220 e,                             " & _
                                                         "     ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec v          " & _
                                                         "where a.Ara_CorporativoID = e.Emp_CorporativoID          " & _
                                                         "and   a.Ara_CompaniaID    = e.Emp_CompaniaID             " & _
                                                         "and   a.Ara_EmpleadoID    = e.Emp_EmpleadoID             " & _
                                                         "and   e.Emp_CompaniaID    = v.EmpresaFuente              " & _
                                                         "and   e.Emp_EmpleadoID    = v.Empleado                   " & _
                                                         "and   a.Ara_TipoAccionID  = b.Rta_ClaveID                " & _
                                                         "and   b.Rta_TipoID        = 1                            " & _
                                                         "and   b.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                         "and   a.Ara_PrioridadID   = c.Rta_ClaveID                " & _
                                                         "and   c.Rta_TipoID        = 2                            " & _
                                                         "and   c.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                         "and   a.Ara_TipoAreaID    = d.Rta_ClaveID                " & _
                                                         "and   d.Rta_TipoID        = 3                            " & _
                                                         "and   d.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                         "and   a.Ara_Ejercicio     =  "& Ejr &"                   " & _
                                                         "and   e.Emp_NominaID      < 10                           " & _
                                                         "and   e.Emp_CompaniaID IN('2','10','11')                 " & _
                                                         "order by e.Emp_CompaniaID,  v.DescEntidad,               " & _
                                                         "         v.DescCentroCosto, e.Emp_NombreCompleto         "
                                            end if
                                            'response.write(sqllis)
                                            set rsl = dbconn.execute(sqllis)
                                            if not rsl.bof and not rsl.eof then
                                                %>
                                                <table id="example1" class="table table-bordered table-striped" border="1">
                                                    <thead>
                                                    <tr style="background-color: #a20909; color: #fff">
                                                        <th><%= TbHd01 %></th>
                                                        <th><%= TbHd02 %></th>
                                                        <th><%= TbHd03 %></th>
                                                        <th><%= Fr1Lb2 %></th>
                                                        <th><%= TbHd17 %></th>
                                                        <th><%= BxHd03 %></th>
                                                        <th><%= TbHd18 %></th>
                                                        <th><%= TbHd19 %></th>
                                                        <th><%= TbHd20 %></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <%
                                                    do while not rsl.eof
                                                        %>
                                                        <tr>
                                                            <td><%= trim(rsl("Emp_CompaniaID"))     %></td>
                                                            <td><%= trim(rsl("Emp_EmpleadoID"))     %></td>
                                                            <td><%= trim(rsl("Emp_NombreCompleto")) %></td>
                                                            <td><%= trim(rsl("DescEntidad"))        %></td>
                                                            <td><%= trim(rsl("DescCentroCosto"))    %></td>
                                                            <td><%= trim(rsl("Ara_Texto"))          %></td>
                                                            <td><%= trim(rsl("TipAcc"))             %></td>
                                                            <td><%= trim(rsl("TipPri"))             %></td>
                                                            <td><%= trim(rsl("TipAre"))             %></td>
                                                        </tr>
                                                        <%
                                                        rsl.movenext
                                                    loop
                                                    %>
                                                    </tbody>
                                                </table>
                                                <%
                                            end if
                                        end if
                                        %>
                                    </div>
                                </div>



        <!-- CONTENIDO PRINCIPAL FIN -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


</div>


</body>
</html>

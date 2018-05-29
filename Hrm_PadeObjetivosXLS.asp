<%@ Language=VBScript %>
<%	response.buffer = false
	response.expires = 0
    response.ContentType = "application/vnd.ms-excel"
    Response.AddHeader "Content-Disposition", "filename=""Reporte_Objetivos.xls"
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Objetivos XLS</title>
  <!--#include file="procedures1.asp"-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0100' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    'response.write(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitPri"
                TitDiv = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubDiv = trim(rsTrn("Trd_Texto"))

              Case "BxHd01"
                BxHd01 = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02 = trim(rsTrn("Trd_Texto"))
              Case "BxHd03"
                BxHd03 = trim(rsTrn("Trd_Texto"))
              Case "BxHd04"
                BxHd04 = trim(rsTrn("Trd_Texto"))
              Case "BxHd05"
                BxHd05 = trim(rsTrn("Trd_Texto"))
              Case "BxHd06"
                BxHd06 = trim(rsTrn("Trd_Texto"))
              Case "BxFt01"
                BxFt01 = trim(rsTrn("Trd_Texto"))
              Case "BxFt02"
                BxFt02 = trim(rsTrn("Trd_Texto"))
              Case "BxFt03"
                BxFt03 = trim(rsTrn("Trd_Texto"))
              Case "Tab001"
                Tab001 = trim(rsTrn("Trd_Texto"))
              Case "Tab002"
                Tab002 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd1"
                Tb1Hd1 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd2"
                Tb1Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd3"
                Tb1Hd3 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd4"
                Tb1Hd4 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd5"
                Tb1Hd5 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd6"
                Tb1Hd6 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd7"
                Tb1Hd7 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd1"
                Tb2Hd1 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd2"
                Tb2Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd3"
                Tb2Hd3 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd4"
                Tb2Hd4 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd5"
                Tb2Hd5 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St1"
                Tb2St1 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St2"
                Tb2St2 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St3"
                Tb2St3 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St4"
                Tb2St4 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb2"
                Fr1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph2"
                Fr1Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb3"
                Fr1Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph3"
                Fr1Ph3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb4"
                Fr1Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph4"
                Fr1Ph4 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb5"
                Fr1Lb5 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph5"
                Fr1Ph5 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb6"
                Fr1Lb6 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph6"
                Fr1Ph6 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb7"
                Fr1Lb7 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph7"
                Fr1Ph7 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb8"
                Fr1Lb8 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph8"
                Fr1Ph8 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb9"
                Fr1Lb9 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph9"
                Fr1Ph9 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb10"
                Fr1Lb10 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph10"
                Fr1Ph10 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb11"
                Fr1Lb11 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph11"
                Fr1Ph11 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case "MsgAl1"
                MsgAl1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn3"
                SmBtn3  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    Dim Ejr
    Dim Eid
    Ejr = trim(Request.QueryString("EjerID"))
    Eid = trim(Request.QueryString("Eid"))
    if Ejr = "" then
        Ejr = 0
    end if
    if Ent = "" then
        Ent = 0
    end if

    sqlCia = "select Emp_CompaniaID, Emp_NombreCompleto, Emp_Foto from HRM10220 where Emp_Empleadoid = '"& Eid &"' "
    set rsCia = dbconn.execute(sqlCia)
    if not rsCia.bof and not rsCia.eof then
        Cid = trim(rsCia("Emp_CompaniaID"))
        Enm = trim(rsCia("Emp_NombreCompleto"))
        Eim = trim(rsCia("Emp_Foto"))
    else
        Cid = ""
        Enm = ""
        Eim = ""
    end if

    if Ejr = 0 then
        sqlEjr = "select a.Pde_Ejercicio,  a.Pde_Estatus, " & _
                 "       b.Pde_Descripcion                " & _
                 "from HRM10500 a left outer join         " & _
                 "     HRMA0500 b                         " & _
                 "on  a.Pde_Ejercicio = b.Pde_Ejercicio   " & _
                 "and b.Pde_IdiomaID  = '"& Lng &"'       " & _
                 "where a.Pde_Estatus = 'A'               "
    else
        sqlEjr = "select a.Pde_Ejercicio,  a.Pde_Estatus, " & _
                 "       b.Pde_Descripcion                " & _
                 "from HRM10500 a left outer join         " & _
                 "     HRMA0500 b                         " & _
                 "on  a.Pde_Ejercicio = b.Pde_Ejercicio   " & _
                 "and b.Pde_IdiomaID  = '"& Lng &"'       " & _
                 "where a.Pde_Ejercicio = "& Ejr &"       "
    end if
    set rse = dbconn.execute(sqlEjr)
    if not rse.bof and not rse.eof then
        Ejr = rse("Pde_Ejercicio")
        Dsc = trim(rse("Pde_Descripcion"))
    else
        Ejr = 0
        Dsc = ""
    end if

    %>

    <% call hdr(TitPri,Dsc) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL INICIO -->



                                <div class="box box-primary">
                                    <div class="box-body table-responsive">
                                        <%

                                            sqlObj = "select * from HRM10531                 " & _
                                                     "where Pod_CorporativoID = '5000'       " & _
                                                     "and   Pod_CompaniaID    = '"& Cid &"'  " & _
                                                     "and   Pod_EmpleadoID    = '"& Eid &"'  " & _
                                                     "and   Pod_Ejercicio     =  "& Ejr &"   " & _
                                                     "and   Pod_Tipo          = 1            " & _
                                                     "order by Pod_Partida                   "
                                            set rsO = dbconn.execute(sqlObj)
                                            if not rsO.bof and not rsO.eof then
                                                i = 0
                                                TotPnd = 0
                                                SobPnd = 0
                                                %>
                                                <div class="box box-primary">
                                                    <div class="box-header">
                                                        <h3 class="box-title">
                                                             <%= Eid & " - " & Enm  & " / " & Dsc %>
                                                        </h3>
                                                    </div>
                                                    <div class="box-body">
                                                        <table class="table table-bordered table-striped" style="border: 1">
                                                            <thead>
                                                            <tr>
                                                                <th style="background-color: #6a0303; color: #fff"><%= Tb1Hd1 %></th>
                                                                <th style="background-color: #6a0303; color: #fff"><%= Tb1Hd2 %></th>
                                                                <th style="background-color: #6a0303; color: #fff"><%= Tb1Hd7 %></th>
                                                                <th style="background-color: #6a0303; color: #fff"><%= Tb1Hd3 %></th>
                                                                <th style="background-color: #6a0303; color: #fff"><%= Tb1Hd4 %></th>
                                                                <th style="background-color: #6a0303; color: #fff"><%= Tb1Hd6 %></th>
                                                                <th style="background-color: #6a0303; color: #fff"><%= Tb1Hd5 %></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <%
                                                            do while not rsO.eof
                                                                i = i + 1
                                                                TotPnd = TotPnd + CInt(rsO("Pod_Ponderacion"))
                                                                %>
                                                                <tr>
                                                                    <td style="text-align: center"><%= rsO("Pod_Ponderacion") %></td>
                                                                    <td style="text-align: center"><%= trim(rsO("Pod_Descripcion")) %></td>
                                                                    <td style="text-align: center">&nbsp;</td>
                                                                    <td style="text-align: center"><% if trim(rsO("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %></td>
                                                                    <td style="text-align: center"><%= rsO("Pod_Meta") %></td>
                                                                    <td style="text-align: center"><%= rsO("Pod_UniMed") %></td>
                                                                    <td style="text-align: center"><%= rsO("Pod_FechaFinCalc") %></td>
                                                                </tr>
                                                                <%
                                                                sqlSob = "select * from HRM10531                 " & _
                                                                         "where Pod_CorporativoID = '5000'       " & _
                                                                         "and   Pod_CompaniaID    = '"& Cid &"'  " & _
                                                                         "and   Pod_EmpleadoID    = '"& Eid &"'  " & _
                                                                         "and   Pod_Ejercicio     =  "& Ejr &"   " & _
                                                                         "and   Pod_Tipo          = 2            " & _
                                                                         "and   Pod_Parent        = "& trim(rsO("Pod_Partida")) &"  " & _
                                                                         "order by Pod_Partida                   "
                                                                set rsS = dbconn.execute(sqlSob)
                                                                if not rsS.bof and not rsS.eof then
                                                                    do while not rsS.eof
                                                                        i = i + 1
                                                                        SobPnd = SobPnd + CInt(rsS("Pod_Ponderacion"))
                                                                        %>
                                                                        <tr>
                                                                            <td style="text-align: center"><%= rsS("Pod_Ponderacion") %></td>
                                                                            <td style="text-align: center">&nbsp;</td>
                                                                            <td style="text-align: center"><%= trim(rsS("Pod_Descripcion")) %></td>
                                                                            <td style="text-align: center"><% if trim(rsS("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %></td>
                                                                            <td style="text-align: center"><%= rsS("Pod_Meta") %></td>
                                                                            <td style="text-align: center"><%= rsS("Pod_UniMed") %></td>
                                                                            <td style="text-align: center"><%= rsS("Pod_FechaFinCalc") %></td>
                                                                        </tr>
                                                                        <%
                                                                        rsS.movenext
                                                                    loop
                                                                    rsS.close
                                                                    set rsS = Nothing
                                                                    if SobPnd = 100 then
                                                                        SobPnd = 0
                                                                    end if
                                                                end if
                                                                rsO.movenext
                                                            loop
                                                            rsO.close
                                                            set rsO = Nothing
                                                            %>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <%
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

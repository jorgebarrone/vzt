<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Administrador 11 (Reporte 360°)</title>
  <link rel="shortcut icon" href="images/favicon.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">

  <!-- daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">

  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- jsPDF-Master -->
  <script src="plugins/jsPDF-master/dist/jspdf.debug.js"></script>
  <script src="plugins/jsPDF-master/dist/jspdf.min.js"></script>
  <script src="plugins/jsPDF-master/libs/html2canvas/dist/html2canvas.js"></script>

  <!--#include file="procedures1.asp"-->

<script>
    function print01() {
        html2canvas(document.body, {
            onrendered: function (canvas) {
                var img = canvas.toDataURL("image/png");
                var doc = new jsPDF('l', 'mm', [canvas.width, canvas.height]);
                doc.addImage(img, 'JPEG', 10, 10, canvas.width, canvas.height);
                doc.save('Reporte360.pdf');
            }
        });
    }
</script>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <% 'call men() %>

  <!-- Content Wrapper. Contains page content -->

    <%

    if Lng = "ES" then
        TitPri = "Reporte 360°"
        SubTit = ""
    else
        TitPri = "360° Report"
        SubTit = ""
    end if
    %>
    <% call hdr(TitPri,SubTit) %>

    <%
    dim Elm

    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0100' and Trd_IdiomaID = '"& Lng &"'  "

    set rsTrn = dbconn.execute(sqlTrn)
    'response.write(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
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
              Case "BxHd07"
                BxHd07 = trim(rsTrn("Trd_Texto"))
              Case "BxHd08"
                BxHd08 = trim(rsTrn("Trd_Texto"))
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

    '<!-- Buscamos si se trata de una consulta de un Empleado en especifico, de lo contrario mostramos la información del Empleado que está conectado -->
     Dim Eid
     Dim Enm
     Dim Sb3
     Eid = ""
     Enm = ""
     Sb3 = ""
     Eid = trim(Request.QueryString("Eid"))
     if Eid = "" then
         Eid = trim(Request.Form("Eid"))
         if Eid = "" then
             Eid = Uid
         end if
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

     Sb3 = trim(Request.Form("Sb3"))


    '<!-- Buscamos si se trata de una consulta de un Ejercicio en especifico, de lo contrario mostramos la información del Ejercicio que esté activo -->
     Dim Ejr
     Ejr = 0
     Ejr = trim(Request.QueryString("Ejr"))
     if Ejr = "" then
         Ejr = Request.Form("Ejr")
         if Ejr = "" then
             Ejr = 0
         end if
     end if

     '<-- Busqueda de Parámetros PADE (Inicio) -->
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

     ' if Sb3 = "Sb3" then
         '<!--  Buscamos la Encuesta 360° del Ejercicio Actual Inicio -->
         sqlScr = "select Pnc_Encuesta360 from HRM10523 where Pnc_Ejercicio = "& Ejr &"   "
         set rsScr = dbconn.execute(sqlScr)
         if not rsScr.bof and not rsScr.eof then
             Sci = trim(rsScr("Pnc_Encuesta360"))
         end if
         '<!--  Buscamos la Encuesta 360° del Ejercicio Actual Final  -->

         '<!--  Buscamos las descripciones de los Temas de la Encuesta Inicio -->
         sqlTds = "select distinct(e.Scp_TemaID), t.Sct_Descripcion  " & _
                  "from HRM10303 e, HRM10302 t                       " & _
                  "where e.Scp_TemaID     = t.Sct_TemaID             " & _
                  "and   e.Scp_ScriptID   = '"& Sci &"'              " & _
                  "and   e.Scp_ReactivoID < 34                       " & _
                  "and   t.Sct_LngID      = '"& Lng &"'              " & _
                  "order by e.Scp_TemaID                             "
         set rsTds = dbconn.execute(sqlTds)
         if not rsTds.bof and not rsTds.eof then
             Frc = 0
             Dtd = ""
             do while not rsTds.eof
                 if Frc = 0 then
                     Frc = 1
                 else
                     Dtd = Dtd & ", "
                 end if
                 Dtd = Dtd & "'" & trim(LCase(rsTds("Sct_Descripcion"))) & "'"
                 rsTds.movenext
             loop
             rsTds.close
             set rsTds = Nothing
         else
             Dtd = "0,0,0,0,0,0,0,0,0"
         end if
         '<!--  Buscamos las descripciones de los Temas de la Encuesta Final -->

         sqlRjd = "select m.M36_EmpleadoID,  m.M36_EvaluadorTipo,      " & _
                  "       e.Scp_TemaID,                                " & _
                  "       AVG(isnull((r.P36_ValorNumerico * 1.0),0)) as Prom   " & _
                  "from HRM10540 m, HRM10533 r, HRM10303 e, HRM10302 t " & _
                  "where m.M36_CompaniaID  = r.P36_CompaniaID          " & _
                  "and   m.M36_Ejercicio   = r.P36_Ejercicio           " & _
                  "and   m.M36_EmpleadoID  = r.P36_EmpleadoID          " & _
                  "and   m.M36_EvaluadorID = r.P36_EvaluadorID         " & _
                  "and   r.P36_ReactivoID  = e.Scp_ReactivoID          " & _
                  "and   e.Scp_TemaID      = t.Sct_TemaID              " & _
                  "and   m.M36_Ejercicio   =  "& Ejr &"                " & _
                  "and   m.M36_CompaniaID  = '"& Cid &"'               " & _
                  "and   m.M36_EmpleadoID  = '"& Eid &"'               " & _
                  "and   r.P36_ReactivoID  < 34                        " & _
                  "and   m.M36_EvaluadorTipo = 1                       " & _
                  "and   e.Scp_ScriptID    = '"& Sci &"'               " & _
                  "and   t.Sct_LngID       = '"& Lng &"'               " & _
                  "group by m.M36_EmpleadoID, m.M36_EvaluadorTipo,     " & _
                  "      e.Scp_TemaID                                  " & _
                  "order by m.M36_EmpleadoID, m.M36_EvaluadorTipo,     " & _
                  "      e.Scp_TemaID                                  "
         set rsRjd = dbconn.execute(sqlRjd)
         if not rsRjd.bof and not rsRjd.eof then
             Frc = 0
             Djd = ""
             do while not rsRjd.eof
                 if Frc = 0 then
                     Frc = 1
                 else
                     Djd = Djd & ", "
                 end if
                 Djd = Djd & round(rsRjd("Prom"),2)
                 rsRjd.movenext
             loop
             rsRjd.close
             set rsRjd = Nothing
         else
             Djd = "0,0,0,0,0,0,0,0,0"
         end if

         sqlRcc = "select m.M36_EmpleadoID,  e.Scp_TemaID,             " & _
                  "       AVG(isnull((r.P36_ValorNumerico * 1.0),0)) as Prom   " & _
                  "from HRM10540 m, HRM10533 r, HRM10303 e, HRM10302 t " & _
                  "where m.M36_CompaniaID  = r.P36_CompaniaID          " & _
                  "and   m.M36_Ejercicio   = r.P36_Ejercicio           " & _
                  "and   m.M36_EmpleadoID  = r.P36_EmpleadoID          " & _
                  "and   m.M36_EvaluadorID = r.P36_EvaluadorID         " & _
                  "and   r.P36_ReactivoID  = e.Scp_ReactivoID          " & _
                  "and   e.Scp_TemaID      = t.Sct_TemaID              " & _
                  "and   m.M36_Ejercicio   =  "& Ejr &"                " & _
                  "and   m.M36_CompaniaID  = '"& Cid &"'               " & _
                  "and   m.M36_EmpleadoID  = '"& Eid &"'               " & _
                  "and   r.P36_ReactivoID  < 34                        " & _
                  "and   m.M36_EvaluadorTipo IN (2,3,4)                " & _
                  "and   e.Scp_ScriptID    = '"& Sci &"'               " & _
                  "and   t.Sct_LngID       = '"& Lng &"'               " & _
                  "group by m.M36_EmpleadoID, e.Scp_TemaID             " & _
                  "order by m.M36_EmpleadoID, e.Scp_TemaID             "
         set rsRcc = dbconn.execute(sqlRcc)
         if not rsRcc.bof and not rsRcc.eof then
             Frc = 0
             Dcc = ""
             do while not rsRcc.eof
                 if Frc = 0 then
                     Frc = 1
                 else
                     Dcc = Dcc & ", "
                 end if
                 Dcc = Dcc & round(rsRcc("Prom"),2)
                 rsRcc.movenext
             loop
             rsRcc.close
             set rsRcc = Nothing
         else
             Dcc = "0,0,0,0,0,0,0,0,0"
         end if

         sqlRae = "select m.M36_EmpleadoID,  e.Scp_TemaID,             " & _
                  "       AVG(isnull((r.P36_ValorNumerico * 1.0),0)) as Prom   " & _
                  "from HRM10540 m, HRM10533 r, HRM10303 e, HRM10302 t " & _
                  "where m.M36_CompaniaID  = r.P36_CompaniaID          " & _
                  "and   m.M36_Ejercicio   = r.P36_Ejercicio           " & _
                  "and   m.M36_EmpleadoID  = r.P36_EmpleadoID          " & _
                  "and   m.M36_EvaluadorID = r.P36_EvaluadorID         " & _
                  "and   r.P36_ReactivoID  = e.Scp_ReactivoID          " & _
                  "and   e.Scp_TemaID      = t.Sct_TemaID              " & _
                  "and   m.M36_Ejercicio   =  "& Ejr &"                " & _
                  "and   m.M36_CompaniaID  = '"& Cid &"'               " & _
                  "and   m.M36_EmpleadoID  = '"& Eid &"'               " & _
                  "and   r.P36_ReactivoID  < 34                        " & _
                  "and   m.M36_EvaluadorTipo = 0                       " & _
                  "and   e.Scp_ScriptID    = '"& Sci &"'               " & _
                  "and   t.Sct_LngID       = '"& Lng &"'               " & _
                  "group by m.M36_EmpleadoID, e.Scp_TemaID             " & _
                  "order by m.M36_EmpleadoID, e.Scp_TemaID             "
         set rsRae = dbconn.execute(sqlRae)
         if not rsRae.bof and not rsRae.eof then
             Frc = 0
             Dae = ""
             do while not rsRae.eof
                 if Frc = 0 then
                     Frc = 1
                 else
                     Dae = Dae & ", "
                 end if
                 Dae = Dae & round(rsRae("Prom"),2)
                 rsRae.movenext
             loop
             rsRae.close
             set rsRae = Nothing
         else
             Dae = "0,0,0,0,0,0,0,0,0"
         end if
     ' end if
    %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->

        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">

                    <div class="tab-content">
                        <div class="<%= Pan11St %>" id="main" >







                          <div class="box box-primary">
                              <div class="box-header">
                                  <h3 class="box-title">
                                      <img src="<%= Eim %>" style="height: 80px;" alt="<%= Enm %>">
                                       <%= Eid & " - " & Enm  & " / " & Dsc %>
                                  </h3>
                              </div>

                              <button class="form-control" onclick="print01();">Imprimir</button>

                              <div class="box-body">
                                <div id="container" style="width: 75%;">
                                  <canvas id="canvas"></canvas>
                                </div>
                              </div>
                          </div>

                          <!--- Comentarios pregunta 34 --->
                          <%
                          sqlP34 = "select Scp_Pregunta from HRM10303 where Scp_ScriptID = '"& Sci &"' and Scp_ReactivoID = 34 and Scp_LngID = '"& Lng &"' "
                          set rsP34 = dbconn.execute(sqlP34)
                          if not rsP34.bof and not rsP34.eof then
                              T34 = trim(rsP34("Scp_Pregunta"))
                          else
                              T34 = ""
                          end if
                          rsP34.close
                          set rsP34 = Nothing
                          %>
                          <div class="box box-primary">
                              <div class="box-header">
                                  <h3 class="box-title"><%= T34 %></h3>
                              </div>
                              <div class="box-body">
                          <%
                          sqlFrt = "select distinct(d.Scr_Descripcion)               " & _
                                   "from HRM10533 r, HRM10304 d                      " & _
                                   "where r.P36_ReactivoID    = d.Scr_ReactivoID     " & _
                                   "and   r.P36_ValorNumerico = d.Scr_ValorNumerico  " & _
                                   "and   r.P36_Ejercicio     =  "& Ejr &"           " & _
                                   "and   r.P36_EmpleadoID    = '"& Eid &"'          " & _
                                   "and   r.P36_ReactivoID    = 34                   " & _
                                   "and   d.Scr_ScriptID      = '"& Sci &"'          " & _
                                   "and   d.Scr_LngID         = '"& Lng &"'          "
                          set rsFrt = dbconn.execute(sqlFrt)
                          if not rsFrt.bof and not rsFrt.eof then
                              %><ul><%
                              do while not rsFrt.EOF
                                  %>
                                  <li><%= trim(rsFrt("Scr_Descripcion")) %></li>
                                  <%
                                  rsFrt.MoveNext
                              loop
                              rsFrt.close
                              set rsFrt = Nothing
                              %></ul>
                              </div>
                              <%
                          end if
                          %>
                          </div>

                          <!--- Comentarios pregunta 35 --->
                          <%
                          sqlP35 = "select Scp_Pregunta from HRM10303 where Scp_ScriptID = '"& Sci &"' and Scp_ReactivoID = 35 and Scp_LngID = '"& Lng &"' "
                          set rsP35 = dbconn.execute(sqlP35)
                          if not rsP35.bof and not rsP35.eof then
                              T35 = trim(rsP35("Scp_Pregunta"))
                          else
                              T35 = ""
                          end if
                          rsP35.close
                          set rsP35 = Nothing
                          %>
                          <div class="box box-primary">
                              <div class="box-header">
                                  <h3 class="box-title"><%= T35 %></h3>
                              </div>
                              <div class="box-body">
                          <%
                          sqlDeb = "select distinct(d.Scr_Descripcion)               " & _
                                   "from HRM10533 r, HRM10304 d                      " & _
                                   "where r.P36_ReactivoID    = d.Scr_ReactivoID     " & _
                                   "and   r.P36_ValorNumerico = d.Scr_ValorNumerico  " & _
                                   "and   r.P36_Ejercicio     =  "& Ejr &"           " & _
                                   "and   r.P36_EmpleadoID    = '"& Eid &"'          " & _
                                   "and   r.P36_ReactivoID    = 35                   " & _
                                   "and   d.Scr_ScriptID      = '"& Sci &"'          " & _
                                   "and   d.Scr_LngID         = '"& Lng &"'          "
                          set rsFrt = dbconn.execute(sqlDeb)
                          if not rsFrt.bof and not rsFrt.eof then
                              %><ul><%
                              do while not rsFrt.EOF
                                  %>
                                  <li><%= trim(rsFrt("Scr_Descripcion")) %></li>
                                  <%
                                  rsFrt.MoveNext
                              loop
                              rsFrt.close
                              set rsFrt = Nothing
                              %></ul>
                              </div>
                              <%
                          end if
                          %>
                          </div>

                          <!--- Comentarios pregunta 36 --->
                          <%
                          sqlP36 = "select Scp_Pregunta from HRM10303 where Scp_ScriptID = '"& Sci &"' and Scp_ReactivoID = 36 and Scp_LngID = '"& Lng &"' "
                          set rsP36 = dbconn.execute(sqlP36)
                          if not rsP36.bof and not rsP36.eof then
                              T36 = trim(rsP36("Scp_Pregunta"))
                          else
                              T36 = ""
                          end if
                          rsP36.close
                          set rsP36 = Nothing
                          %>
                          <div class="box box-primary">
                              <div class="box-header">
                                  <h3 class="box-title"><%= T36 %></h3>
                              </div>
                              <div class="box-body">
                          <%
                          sqlC36 = "select P36_ValorTexto from HRM10534  " & _
                                   "where P36_Ejercicio =  "& Ejr &"     " & _
                                   "and P36_CompaniaID  = '"& Cid &"'    " & _
                                   "and P36_EmpleadoID  = '"& Eid &"'    " & _
                                   "and P36_ReactivoID  = 36             "
                          set rsC36 = dbconn.execute(sqlC36)
                          if not rsC36.bof and not rsC36.eof then
                              %><ul><%
                              do while not rsC36.eof
                                  %>
                                  <li><%= trim(rsC36("P36_ValorTexto")) %></li>
                                  <%
                                  rsC36.MoveNext
                              loop
                              rsC36.close
                              set rsC36 = Nothing
                              %></ul>
                              </div>
                              <%
                          end if
                          %>
                          </div>

                          <!--- Comentarios pregunta 37 --->
                          <%
                          sqlP37 = "select Scp_Pregunta from HRM10303 where Scp_ScriptID = '"& Sci &"' and Scp_ReactivoID = 37 and Scp_LngID = '"& Lng &"' "
                          set rsP37 = dbconn.execute(sqlP37)
                          if not rsP37.bof and not rsP37.eof then
                              T37 = trim(rsP37("Scp_Pregunta"))
                          else
                              T37 = ""
                          end if
                          rsP37.close
                          set rsP37 = Nothing
                          %>
                          <div class="box box-primary">
                              <div class="box-header">
                                  <h3 class="box-title"><%= T37 %></h3>
                              </div>
                              <div class="box-body">
                          <%
                          sqlC37 = "select P36_ValorTexto from HRM10534  " & _
                                   "where P36_Ejercicio =  "& Ejr &"     " & _
                                   "and P36_CompaniaID  = '"& Cid &"'    " & _
                                   "and P36_EmpleadoID  = '"& Eid &"'    " & _
                                   "and P36_ReactivoID  = 37             "
                          set rsC37 = dbconn.execute(sqlC37)
                          if not rsC37.bof and not rsC37.eof then
                              %><ul><%
                              do while not rsC37.eof
                                  %>
                                  <li><%= trim(rsC37("P36_ValorTexto")) %></li>
                                  <%
                                  rsC37.MoveNext
                              loop
                              rsC37.close
                              set rsC37 = Nothing
                              %></ul>
                              </div>
                              <%
                          end if
                          %>
                          </div>


                          <!--- Comentarios pregunta 38 --->
                          <%
                          sqlP38 = "select Scp_Pregunta from HRM10303 where Scp_ScriptID = '"& Sci &"' and Scp_ReactivoID = 38 and Scp_LngID = '"& Lng &"' "
                          set rsP38 = dbconn.execute(sqlP38)
                          if not rsP38.bof and not rsP38.eof then
                              T38 = trim(rsP38("Scp_Pregunta"))
                          else
                              T38 = ""
                          end if
                          rsP38.close
                          set rsP38 = Nothing
                          %>
                          <div class="box box-primary">
                              <div class="box-header">
                                  <h3 class="box-title"><%= T38 %></h3>
                              </div>
                              <div class="box-body">
                          <%
                          sqlC38 = "select P36_ValorTexto from HRM10534  " & _
                                   "where P36_Ejercicio =  "& Ejr &"     " & _
                                   "and P36_CompaniaID  = '"& Cid &"'    " & _
                                   "and P36_EmpleadoID  = '"& Eid &"'    " & _
                                   "and P36_ReactivoID  = 38             "
                          set rsC38 = dbconn.execute(sqlC38)
                          if not rsC38.bof and not rsC38.eof then
                              %><ul><%
                              do while not rsC38.eof
                                  %>
                                  <li><%= trim(rsC38("P36_ValorTexto")) %></li>
                                  <%
                                  rsC38.MoveNext
                              loop
                              rsC38.close
                              set rsC38 = Nothing
                              %></ul>
                              </div>
                              <%
                          end if
                          %>
                          </div>



                          <!-- <script>print01();</script> -->







                        </div>
                    </div>
                </div>
            </div>
        </div>




    </section>
    <!-- /.content -->

  <% 'call footer() %>

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- ChartJS1 2.7.1 -->
<script src="plugins/chartjs1/Chart.bundle.js"></script>
<script src="plugins/chartjs1/utils.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

	<script>
		var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		var color = Chart.helpers.color;
		var barChartData = {
			labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
			datasets: [{
				label: 'Dataset 1',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				label: 'Dataset 2',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}]

		};


		var barChartData1 = {
			labels: [<%= Dtd %>],
			datasets: [{
				label: 'Jefe',
        backgroundColor: 'rgba(0, 136, 206, 0.5)',
				borderColor: 'rgba(0, 136, 206, 1)',
				borderWidth: 1,
				data: [<%= Djd %>]
			},
      {
				label: 'Clientes, Colaterales, Colaboradores',
        backgroundColor: 'rgba(134, 132, 131, 0.5)',
				borderColor: 'rgba(134, 132, 131, 1)',
				borderWidth: 1,
				data: [<%= Dcc %>]
			},
      {
				label: 'Autoevaluacion',
				backgroundColor: 'rgba(165, 49, 72, 0.5)',
				borderColor: 'rgba(165, 49, 72, 1)',
				borderWidth: 1,
				data: [<%= Dae %>]
			}]

		};


		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData1,
				options: {
					responsive: true,
          showTooltips : true,

                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true
                                }
                                }]
                    },

					legend: {
						position: 'top',
					},
					title: {
						display: true,
						text: 'Resultados Generales Evaluacion 360°'
					}
				}
			});

		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			var zero = Math.random() < 0.2 ? true : false;
			barChartData.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return zero ? 0.0 : randomScalingFactor();
				});

			});
			window.myBar.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var colorName = colorNames[barChartData.datasets.length % colorNames.length];
			var dsColor = window.chartColors[colorName];
			var newDataset = {
				label: 'Dataset ' + barChartData.datasets.length,
				backgroundColor: color(dsColor).alpha(0.5).rgbString(),
				borderColor: dsColor,
				borderWidth: 1,
				data: []
			};

			for (var index = 0; index < barChartData.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());
			}

			barChartData.datasets.push(newDataset);
			window.myBar.update();
		});

		document.getElementById('addData').addEventListener('click', function() {
			if (barChartData.datasets.length > 0) {
				var month = MONTHS[barChartData.labels.length % MONTHS.length];
				barChartData.labels.push(month);

				for (var index = 0; index < barChartData.datasets.length; ++index) {
					// window.myBar.addData(randomScalingFactor(), index);
					barChartData.datasets[index].data.push(randomScalingFactor());
				}

				window.myBar.update();
			}
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			barChartData.datasets.splice(0, 1);
			window.myBar.update();
		});

		document.getElementById('removeData').addEventListener('click', function() {
			barChartData.labels.splice(-1, 1); // remove the label first

			barChartData.datasets.forEach(function(dataset) {
				dataset.data.pop();
			});

			window.myBar.update();
		});
	</script>

</body>
</html>

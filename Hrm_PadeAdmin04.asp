<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Administrador 04</title>
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

  <!--#include file="procedures.asp"-->
  <!--#include file="Hrm_PadeAdmin_Tabs.asp"-->

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <% call men() %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

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
    %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->

        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <% call MnuTabs() %>
                    </ul>
                    <div class="tab-content">
                        <div class="<%= Pan4St %>" id="main" >
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#Listado" data-toggle="tab"><%= BxHd05 %></a></li>
                                <li><a href="Hrm_PadeObjetivosXls.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&EjerID=" & Ejr & "&Eid=" & Eid & "&Sid=" & Sid %>"><%= BxHd06 %></a></li>
                            </ul>
                            
                            <div class="tab-content">

                                <!-- Listado de Movimientos -->
                                <div class="tab-pane active" id="Listado" >


                                    <div class="box box-success">
                                        <form action="Hrm_PadeAdmin04.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=4" & "&Sid=" & Sid %>" name="form1" method="post">
                                            <!-- form start -->
                                            <div class="box-body">
                                                <div class="row fontawesome-icon-list">
                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                                                            <select class="form-control" size="1" id="Eid" name="Eid" required>
                                                                <option class="form-control" value=""><%= Fr1Ph1 %></option>
                                                                <%
                                                                sqlEmp = "select Emp_EmpleadoID, Emp_NombreCompleto  " & _
                                                                         "from HRM10220 order by Emp_NombreCompleto  "
                                                                set rsE = dbconn.execute(sqlEmp)
                                                                if not rsE.bof and not rsE.eof then
                                                                    do while not rsE.eof
                                                                        %>
                                                                        <option class="form-control" value="<%= rsE("Emp_EmpleadoID") %>"><%= trim(rsE("Emp_NombreCompleto")) %></option>
                                                                        <%
                                                                        rsE.movenext
                                                                    loop
                                                                    rsE.close
                                                                    set rsE = Nothing
                                                                end if
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                            
                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb2 %></label>
                                                            <select class="form-control" size="1" id="Ejr" name="Ejr" required>
                                                                <option class="form-control" value=""><%= Fr1Ph2 %></option>
                                                                <%
                                                                sqlEjc = "select Pde_Ejercicio                    " & _
                                                                         "from HRM10500                           " & _
                                                                         "order by Pde_Ejercicio desc             "
                                                                set rsJ = dbconn.execute(sqlEjc)
                                                                if not rsJ.bof and not rsJ.eof then
                                                                    do while not rsJ.eof
                                                                        %>
                                                                        <option class="form-control" value="<%= rsJ("Pde_Ejercicio") %>"><%= trim(rsJ("Pde_Ejercicio")) %></option>
                                                                        <%
                                                                        rsJ.movenext
                                                                    loop
                                                                    rsJ.close
                                                                    set rsJ = Nothing
                                                                end if
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label style="color: #f00"><%= FrLgn1 %></label>
                                                            <br/>
                                                            <button type="submit" class="btn btn-primary" name="Sb3" id="Sb3" value="Sb3"><%= SmBtn3 %></button>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                            <!-- /.box-body -->
                                        </form>


                                        <%
                                        if Sb3 = "Sb3" then
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
                                                            <img src="<%= Eim %>" style="height: 80px;" alt="<%= Nmb %>">
                                                             <%= Eid & " - " & Enm  & " / " & Dsc %>
                                                        </h3>
                                                    </div>
                                                    <div class="box-body">
                                                        <table class="table table-bordered table-striped">
                                                            <thead>
                                                            <tr>
                                                                <th><%= Tb1Hd1 %></th>
                                                                <th><%= Tb1Hd2 %></th>
                                                                <th><%= Tb1Hd7 %></th>
                                                                <th><%= Tb1Hd3 %></th>
                                                                <th><%= Tb1Hd4 %></th>
                                                                <th><%= Tb1Hd6 %></th>
                                                                <th><%= Tb1Hd5 %></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <%
                                                            do while not rsO.eof
                                                                i = i + 1
                                                                TotPnd = TotPnd + CInt(rsO("Pod_Ponderacion"))
                                                                %>
                                                                <tr>
                                                                    <td><%= rsO("Pod_Ponderacion") %></td>
                                                                    <td><%= trim(rsO("Pod_Descripcion")) %></td>
                                                                    <td>&nbsp;</td>
                                                                    <td><% if trim(rsO("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %></td>
                                                                    <td><%= rsO("Pod_Meta") %></td>
                                                                    <td><%= rsO("Pod_UniMed") %></td>
                                                                    <td><%= rsO("Pod_FechaFinCalc") %></td>
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
                                                                            <td style="text-align: right"><%= rsS("Pod_Ponderacion") %></td>
                                                                            <td>&nbsp;</td>
                                                                            <td><%= trim(rsS("Pod_Descripcion")) %></td>
                                                                            <td><% if trim(rsS("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %></td>
                                                                            <td><%= rsS("Pod_Meta") %></td>
                                                                            <td><%= rsS("Pod_UniMed") %></td>
                                                                            <td><%= rsS("Pod_FechaFinCalc") %></td>
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
                                        end if
                                        %>



                                    </div>

                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <% call footer() %>

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>

</body>
</html>

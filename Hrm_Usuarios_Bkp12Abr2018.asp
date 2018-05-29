<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Acceso Empleados</title>
  <link rel="shortcut icon" href="images/favicon.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!--#include file="procedures.asp"-->

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
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'CnfGrl0100' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitPri"
                TitPri = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubTit = trim(rsTrn("Trd_Texto"))
              Case "Tab001"
                Tab001 = trim(rsTrn("Trd_Texto"))
              Case "Tab002"
                Tab002 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd1"
                Tb1Hd1 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd2"
                Tb1Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd2a"
                Tb1Hd2a = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd3"
                Tb1Hd3 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd4"
                Tb1Hd4 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd5"
                Tb1Hd5 = trim(rsTrn("Trd_Texto"))
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

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    else
        TitPri = ""
        SubTit = ""
        Tab001 = ""
        Tab002 = ""
        Tb1Hd1 = ""
        Tb1Hd2 = ""
        Tb1Hd2a = ""
        Tb1Hd3 = ""
        Tb1Hd4 = ""
        Tb1Hd5 = ""
        Fr1Lb1 = ""
        Fr1Ph1 = ""
        Fr1Lb2 = ""
        Fr1Ph2 = ""
        Fr1Lb3 = ""
        Fr1Ph3 = ""
        Fr1Lb4 = ""
        Fr1Ph4 = ""
        Fr1Lb5 = ""
        Fr1Ph5 = ""
        Fr1Lb6 = ""
        Fr1Ph6 = ""
        Fr1Lb7 = ""
        Fr1Ph7 = ""
        Fr1Lb8 = ""
        Fr1Ph8 = ""
        Fr1Lb9 = ""
        Fr1Ph9 = ""
        Fr1Lb10 = ""
        Fr1Ph10 = ""
        Fr1Lb11 = ""
        Fr1Ph11 = ""
        SmBtn1 = ""
        FrLgn1 = ""
        MsgAl1 = ""
        Tb1Hd0 = ""
    end if
    %>

    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL AQUI -->
        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#activos" data-toggle="tab"><%= Tab001 %></a>
                        </li>
                        <li>
                            <a href="#agregar" data-toggle="tab"><%= Tab003 %></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        
                        <!-- Listado de Usuarios Activos -->
                        <div class="tab-pane active" id="activos" >
                            <section id="Activos">
                                <div class="box box-primary">
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th><%= Tb1Hd1 %></th>
                                                    <th><%= Tb1Hd2 %></th>
                                                    <th><%= Tb1Hd2a %></th>
                                                    <th><%= Tb1Hd3 %></th>
                                                    <th><%= Tb1Hd4 %></th>
                                                    <th><%= Tb1Hd5 %></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                sqlCpy = "select a.Emp_CompaniaID,  a.Emp_NombreCompleto,  " & _
                                                         "       a.Emp_EmpleadoID,  b.Cpy_RazonSocial,     " & _
                                                         "       c.Pue_Descripcion                         " & _
                                                         "from HRM10220 a, HRM10201 b, HRM10210 c          " & _
                                                         "where a.Emp_CompaniaID = b.Cpy_CompaniaID        " & _
                                                         "and   a.Emp_CompaniaID = c.Pue_CompaniaID        " & _
                                                         "and   a.Emp_PuestoID   = c.Pue_NivelPuestoID     " & _
                                                         "order by a.Emp_CompaniaID, a.Emp_NombreCompleto  "
                                                set rs = dbconn.Execute(sqlCpy)
                                                'response.write(sqlCpy)
                                                if not rs.bof and not rs.eof then
                                                    do while not rs.eof
                                                    %>
                                                    <tr><td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><%= trim(rs("Emp_CompaniaID")) %></a></td>
                                                        <td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><%= trim(rs("Cpy_RazonSocial")) %></a></td>
                                                        <td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><%= trim(rs("Emp_EmpleadoID")) %></a></td>
                                                        <td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><%= trim(rs("Emp_NombreCompleto")) %></a></td>
                                                        <td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><%= trim(rs("Pue_Descripcion")) %></a></td>
                                                        <td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><i class="fa fa-key"></i></a></td>
                                                    </tr>
                                                    <%
                                                    rs.movenext
                                                    loop
                                                end if
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </section>
                        </div>

                            
                        <!-- Usuarios Inactivos -->
                        <div class="tab-pane" id="agregar" >

                            <section id="Inactivos">
                                <div class="box box-danger">
                                    <div class="box-body">
                                        <table id="example2" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th><%= Tb1Hd1 %></th>
                                                    <th><%= Tb1Hd2 %></th>
                                                    <th><%= Tb1Hd2a %></th>
                                                    <th><%= Tb1Hd3 %></th>
                                                    <th><%= Tb1Hd4 %></th>
                                                    <th><%= Tb1Hd5 %></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                sqlCpy = "select a.Emp_CompaniaID,  a.Emp_NombreCompleto,  " & _
                                                         "       a.Emp_EmpleadoID,  b.Cpy_RazonSocial,     " & _
                                                         "       c.Pue_Descripcion                         " & _
                                                         "from HRM10220 a, HRM10201 b, HRM10210 c          " & _
                                                         "where a.Emp_CompaniaID = b.Cpy_CompaniaID        " & _
                                                         "and   a.Emp_CompaniaID = c.Pue_CompaniaID        " & _
                                                         "and   a.Emp_PuestoID   = c.Pue_NivelPuestoID     " & _
                                                         "and   a.Emp_Estatus    = 'I'                     " & _
                                                         "order by a.Emp_CompaniaID, a.Emp_NombreCompleto  "
                                                set rs = dbconn.Execute(sqlCpy)
                                                'response.write(sqlCpy)
                                                if not rs.bof and not rs.eof then
                                                    do while not rs.eof
                                                    %>
                                                    <tr>
                                                        <td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><%= trim(rs("Emp_CompaniaID")) %></a></td>
                                                        <td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><%= trim(rs("Cpy_RazonSocial")) %></a></td>
                                                        <td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><%= trim(rs("Emp_EmpleadoID")) %></a></td>
                                                        <td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><%= trim(rs("Emp_NombreCompleto")) %></a></td>
                                                        <td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><%= trim(rs("Pue_Descripcion")) %></a></td>
                                                        <td><a href="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Emp_CompaniaID")) & "&Eid=" & trim(rs("Emp_EmpleadoID")) %>"><i class="fa fa-key"></i></a></td>
                                                    </tr>
                                                    <%
                                                    rs.movenext
                                                    loop
                                                end if
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </section>

                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

        <!-- CONTENIDO PRINCIPAL FIN -->

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
<!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true
    });
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true
    });
  });
</script>

</body>
</html>

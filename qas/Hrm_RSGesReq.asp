<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | RecSel | Gestion de Requisiciones</title>
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
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
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
    <!-- Content Header (Page header) -->
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'RecSel0100c' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    'response.write(sqlTrn)
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
              Case "Tab003"
                Tab003 = trim(rsTrn("Trd_Texto"))
              Case "Tab004"
                Tab004 = trim(rsTrn("Trd_Texto"))
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
        Tab003 = ""
        Tb1Hd1 = ""
        Tb1Hd2 = ""
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

    MenErr = ""
    EstOrg = 0

    %>

    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->
        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#captadas" data-toggle="tab"><%= Tab001 %></a>
                        </li>
                        <li>
                            <a href="#asignadas" data-toggle="tab"><%= Tab003 %></a>
                        </li>
                        <li>
                            <a href="#cerradas" data-toggle="tab"><%= Tab002 %></a>
                        </li>
                        <li>
                            <a href="#canceladas" data-toggle="tab"><%= Tab004 %></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="captadas" >
                            
                            <div class="box box-warning">
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th><%= Tb1Hd1 %></th>
                                            <th><%= Tb1Hd2 %></th>
                                            <th><%= Tb1Hd3 %></th>
                                            <th><%= Tb1Hd4 %></th>
                                            <th><%= Tb1Hd5 %></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                        sqlLis = "select a.Rps_Folio,       a.Rps_FecSolicitud,       " & _
                                                 "       b.Cpy_RazonSocial, c.Emp_NombreCompleto,     " & _
                                                 "       d.Pue_Descripcion                            " & _
                                                 "from HRM10251 a, HRM10201 b, HRM10220 c, HRM10210 d " & _
                                                 "where a.Rps_CompaniaID    = b.Cpy_CompaniaID        " & _
                                                 "and   a.Rps_CompaniaID    = c.Emp_CompaniaID        " & _
                                                 "and   a.Rps_SolicitanteID = c.Emp_EmpleadoID        " & _
                                                 "and   a.Rps_CompaniaID    = d.Pue_CompaniaID        " & _
                                                 "and   a.Rps_NivelPuestoID = d.Pue_NivelPuestoID     " & _
                                                 "and   a.Rps_ReclutadorID  = '"& Uid &"'             " & _
                                                 "and   a.Rps_Estatus       = 'N'                     " & _
                                                 "order by a.Rps_CompaniaID, a.Rps_Folio              "
                                        set rs = dbconn.Execute(sqlLis)
                                        'response.write(sqlLis)
                                        if not rs.bof and not rs.eof then
                                            do while not rs.eof
                                                %>
                                                <tr><td><a href="Hrm_RSGesReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Rps_Folio")) %></a></td>
                                                    <td><a href="Hrm_RSGesReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Rps_FecSolicitud")) %></a></td>
                                                    <td><a href="Hrm_RSGesReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Cpy_RazonSocial")) %></a></td>
                                                    <td><a href="Hrm_RSGesReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Pue_Descripcion")) %></a></td>
                                                    <td><a href="Hrm_RSGesReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Emp_NombreCompleto")) %></a></td>
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

                        </div>


                        <div class="tab-pane" id="asignadas" >
                            
                            <div class="box box-primary">
                                <div class="box-body">
                                    <table id="example3" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th><%= Tb1Hd1 %></th>
                                            <th><%= Tb1Hd2 %></th>
                                            <th><%= Tb1Hd3 %></th>
                                            <th><%= Tb1Hd4 %></th>
                                            <th><%= Tb1Hd5 %></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                        sqlLis = "select a.Rps_Folio,       a.Rps_FecSolicitud,       " & _
                                                 "       b.Cpy_RazonSocial, c.Emp_NombreCompleto,     " & _
                                                 "       d.Pue_Descripcion                            " & _
                                                 "from HRM10251 a, HRM10201 b, HRM10220 c, HRM10210 d " & _
                                                 "where a.Rps_CompaniaID    = b.Cpy_CompaniaID        " & _
                                                 "and   a.Rps_CompaniaID    = c.Emp_CompaniaID        " & _
                                                 "and   a.Rps_SolicitanteID = c.Emp_EmpleadoID        " & _
                                                 "and   a.Rps_CompaniaID    = d.Pue_CompaniaID        " & _
                                                 "and   a.Rps_NivelPuestoID = d.Pue_NivelPuestoID     " & _
                                                 "and   a.Rps_ReclutadorID  = '"& Uid &"'             " & _
                                                 "and   a.Rps_Estatus       = 'G'                     " & _
                                                 "order by a.Rps_CompaniaID, a.Rps_Folio              "
                                        set rs = dbconn.Execute(sqlLis)
                                        'response.write(sqlLis)
                                        if not rs.bof and not rs.eof then
                                            do while not rs.eof
                                                %>
                                                <tr><td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Rps_Folio")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Rps_FecSolicitud")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Cpy_RazonSocial")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Pue_Descripcion")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Emp_NombreCompleto")) %></a></td>
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

                        </div>



                        <div class="tab-pane" id="cerradas" >
                            
                            <div class="box box-success">
                                <div class="box-body">
                                    <table id="example2" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th><%= Tb1Hd1 %></th>
                                            <th><%= Tb1Hd2 %></th>
                                            <th><%= Tb1Hd3 %></th>
                                            <th><%= Tb1Hd4 %></th>
                                            <th><%= Tb1Hd5 %></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                        sqlLis = "select a.Rps_Folio,       a.Rps_FecSolicitud,       " & _
                                                 "       b.Cpy_RazonSocial, c.Emp_NombreCompleto,     " & _
                                                 "       d.Pue_Descripcion                            " & _
                                                 "from HRM10251 a, HRM10201 b, HRM10220 c, HRM10210 d " & _
                                                 "where a.Rps_CompaniaID    = b.Cpy_CompaniaID        " & _
                                                 "and   a.Rps_CompaniaID    = c.Emp_CompaniaID        " & _
                                                 "and   a.Rps_SolicitanteID = c.Emp_EmpleadoID        " & _
                                                 "and   a.Rps_CompaniaID    = d.Pue_CompaniaID        " & _
                                                 "and   a.Rps_NivelPuestoID = d.Pue_NivelPuestoID     " & _
                                                 "and   a.Rps_Estatus       = 'A'                     " & _
                                                 "order by a.Rps_CompaniaID, a.Rps_Folio              "
                                        set rs = dbconn.Execute(sqlLis)
                                        'response.write(sqlLis)
                                        if not rs.bof and not rs.eof then
                                            do while not rs.eof
                                                %>
                                                <tr><td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Rps_Folio")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Rps_FecSolicitud")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Cpy_RazonSocial")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Pue_Descripcion")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Emp_NombreCompleto")) %></a></td>
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
                        </div>

                        <div class="tab-pane" id="canceladas" >
                            
                            <div class="box box-danger">
                                <div class="box-body">
                                    <table id="example4" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th><%= Tb1Hd1 %></th>
                                            <th><%= Tb1Hd2 %></th>
                                            <th><%= Tb1Hd3 %></th>
                                            <th><%= Tb1Hd4 %></th>
                                            <th><%= Tb1Hd5 %></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                        sqlLis = "select a.Rps_Folio,       a.Rps_FecSolicitud,       " & _
                                                 "       b.Cpy_RazonSocial, c.Emp_NombreCompleto,     " & _
                                                 "       d.Pue_Descripcion                            " & _
                                                 "from HRM10251 a, HRM10201 b, HRM10220 c, HRM10210 d " & _
                                                 "where a.Rps_CompaniaID    = b.Cpy_CompaniaID        " & _
                                                 "and   a.Rps_CompaniaID    = c.Emp_CompaniaID        " & _
                                                 "and   a.Rps_SolicitanteID = c.Emp_EmpleadoID        " & _
                                                 "and   a.Rps_CompaniaID    = d.Pue_CompaniaID        " & _
                                                 "and   a.Rps_NivelPuestoID = d.Pue_NivelPuestoID     " & _
                                                 "and   a.Rps_Estatus       = 'C'                     " & _
                                                 "order by a.Rps_CompaniaID, a.Rps_Folio              "
                                        set rs = dbconn.Execute(sqlLis)
                                        'response.write(sqlLis)
                                        if not rs.bof and not rs.eof then
                                            do while not rs.eof
                                                %>
                                                <tr><td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Rps_Folio")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Rps_FecSolicitud")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Cpy_RazonSocial")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Pue_Descripcion")) %></a></td>
                                                    <td><a href="Hrm_RecSelConReq1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Fol=" & trim(rs("Rps_Folio")) %>"><%= trim(rs("Emp_NombreCompleto")) %></a></td>
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
    $("#example1").DataTable();
    $("#example3").DataTable();
    $("#example4").DataTable();
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

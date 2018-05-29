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
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

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

    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'CnfGrl0103' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elmx
        do while not rsTrn.eof
            Elmx = trim(rsTrn("Trd_ElementoID"))
            Select Case Elmx
              Case "Tb1Hd2"
                Tb1Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd3"
                Tb1Hd3 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

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
              Case "Tab003"
                Tab003 = trim(rsTrn("Trd_Texto"))
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

    Tab1St = ""
    Tab2St = ""
    Pan1St = "tab-pane"
    Pan2St = "tab-pane"

    Prm = trim(Request.Querystring("Prm"))
    Select Case Prm
        Case "1"
            Tab1St = "class='active'"
            Pan1St = "tab-pane active"
        Case "2"
            Tab2St = "class='active'"
            Pan2St = "tab-pane active"
        Case else
            Tab1St = "class='active'"
            Pan1St = "tab-pane active"
    End Select

    Sbt1 = trim(Request.Form("Sbt1"))

    if Sbt1 = "Sbt1" then
        Ind = Request.Form("Ind")

        for j = 1 to Ind
            Modl = Request.Form("Modl"&j)
            Tran = Request.Form("Tran"&j)
            
            if Request.Form("check"&j) = "on" then
                sqlexs = "Select Prf_ModuloID from HRM10007           " & _
                         "where  Prf_ModuloID      = '" & Modl & "'   " & _
                         "and    Prf_TransaccionID = '" & Tran & "'   " & _
                         "and    Prf_PerfilID      = 'DefUsr'         "
                set rsE = dbconn.Execute (sqlexs)
                if rsE.bof and rsE.eof then
                    sqlins = "insert into HRM10007      " & _
	          	             "values ('DefUsr',         " & _
                             "        '" & Modl & "',   " & _
                             "        '" & Tran & "')   "
		 	        set rsI = dbconn.Execute (sqlins)
                end if
            else
                sqldel = "delete from HRM10007                     " & _
                         "where Prf_ModuloID      = '" & Modl & "' " & _
                         "and   Prf_TransaccionID = '" & Tran & "' " & _
                         "and   Prf_PerfilID      = 'DefUsr'       "
                set rsD = dbconn.Execute (sqldel)
            end if
        next
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
                        <li <%= Tab1St %>>
                            <a href="#activos" data-toggle="tab"><%= Tab001 %></a>
                        </li>
                        <li <%= Tab2St %>>
                            <a href="#default" data-toggle="tab"><%= Tab003 %></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        
                        <!-- Listado de Usuarios Activos -->
                        <div class="<%= Pan1St %>" id="activos" >
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
                        <div class="<%= Pan2St %>" id="default" >

                            <form action="Hrm_Usuarios.asp?Mdl=<%= Mdl & "&Trn=" & "&Prm=2" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
                                <div class="box box-primary">
                                    <div class="box-body">
                                        <table id="example2" class="table table-bordered table-striped">
                                            <thead>
                                            <tr>
                                                <th></th>
                                                <th><%= Tb1Hd1 %></th>
                                                <th><%= Tb1Hd2 %></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                sql = "Select a.Mdl_ModuloID,                       " & _
                                                      "       b.Trd_Texto as Mdl_Descripcion,       " & _
                                                      "       c.Trn_TransaccionID,                  " & _
                                                      "       d.Trd_Texto as Trn_Descripcion        " & _
                                                      "from HRM10003 a, HRM10002 b,                 " & _
                                                      "     HRM10004 c, HRM10002 d                  " & _
                                                      "where a.Mdl_ModuloID      = b.Trd_ElementoID " & _
                                                      "and   b.Trd_TransaccionID = 'MenMdl'         " & _
                                                      "and   b.Trd_IdiomaID      = '"& Lng &"'      " & _
                                                      "and   a.Mdl_ModuloID      = c.Trn_ModuloID   " & _
                                                      "and   c.Trn_TransaccionID = d.Trd_ElementoID " & _
                                                      "and   d.Trd_TransaccionID = 'MenTrn'         " & _
                                                      "and   d.Trd_IdiomaID      = '"& Lng &"'      " & _
                                                      "order by Mdl_Descripcion, Trn_Descripcion    "
                                                set rs = dbconn.Execute(sql)
                                                'response.write(sql)
                                                if not rs.bof and not rs.eof then
                                                    do while not rs.eof
                                                    i  = i  + 1
                                                    %>
                                                    <tr>
                                                        <td style="vertical-align: middle; text-align: center">
                                                            <input type="hidden" name="<%= "Modl" &i %>" value="<%= rs("Mdl_ModuloID") %>" />
                                                            <input type="hidden" name="<%= "Tran" &i %>" value="<%= rs("Trn_TransaccionID") %>" />
                                                            <%
                                                            sqlC = "Select Prf_ModuloID from HRM10007                                 " & _
                                                                   "where Prf_ModuloID      = '" & trim(rs("Mdl_ModuloID"))      & "' " & _
                                                                   "and   Prf_TransaccionID = '" & trim(rs("Trn_TransaccionID")) & "' " & _
                                                                   "and   Prf_PerfilID      = 'DefUsr'                                "
                                                            'response.write(sqlC)
                                                            'response.write("<br/>")
                                                            set rsC = dbconn.execute(sqlC)
                                                            if not rsC.bof and not rsC.eof then
                                                                %><div class="checkbox"><input type="checkbox" checked="checked" name="<%= "check" &i %>" /></input></div><%
                                                            else
                                                                %><div class="checkbox"><input type="checkbox" name="<%= "check" &i %>" /></input></div><%
                                                            end if
                                                            %>
                                                        </td>
                                                        <td>
                                                            <%= trim(rs("Mdl_Descripcion")) %>
                                                        </td>
                                                        <td>
                                                            <%= trim(rs("Trn_Descripcion")) %>
                                                        </td>
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
                                    <div class="box-footer" style="text-align: center">
                                        <input type="hidden" name="Ind" id="ind" value="<%= i   %>" /></input>
                                        <button type="submit" class="btn btn-primary" name="Sbt1" value="Sbt1"><%= SmBtn1 %></button>
                                    </div>
                                </div>
                                <!-- /.box -->
                            </form>

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
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>

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

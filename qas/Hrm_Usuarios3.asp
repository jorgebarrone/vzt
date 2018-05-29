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
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitPri"
                TitPri = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubTit = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd1"
                Tb1Hd1 = trim(rsTrn("Trd_Texto"))
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
    else
        TitPri = ""
        SubTit = ""
        Tb1Hd1 = ""
        Tb1Hd2 = ""
        Tb1Hd3 = ""
        SmBtn1 = ""
        Tb1Hd0 = ""
    end if

    Dim Cid
    Dim Eid
    Dim Sbt
    Cid = trim(Request.QueryString("Cid"))
    Eid = trim(Request.QueryString("Eid"))
    Sbt = trim(Request.Form("Sbt"))

    if Sbt = "Sbt" then
        Cid = trim(Request.Form("Cid"))
        Eid = trim(Request.Form("Eid"))
        Ind = Request.Form("Ind")

        for j = 1 to Ind
            Modl = Request.Form("Modl"&j)
            Tran = Request.Form("Tran"&j)
            
            if Request.Form("check"&j) = "on" then
                sqlexs = "Select Prm_ModuloID from HRM10006      " & _
                         "where  Prm_ModuloID      = '" & Modl & "'   " & _
                         "and    Prm_TransaccionID = '" & Tran & "'   " & _
                         "and    Prm_UserID        = '" & Eid  & "'   "
                set rsE = dbconn.Execute (sqlexs)
                if rsE.bof and rsE.eof then
                    sqlins = "insert into HRM10006      " & _
	          	             "values ('" & Modl & "',   " & _
                             "        '" & Tran & "',   " & _
                             "        '" & Eid  & "')   "
		 	        set rsI = dbconn.Execute (sqlins)
                end if
            else
                sqldel = "delete from HRM10006                     " & _
                         "where Prm_ModuloID      = '" & Modl & "' " & _
                         "and   Prm_TransaccionID = '" & Tran & "' " & _
                         "and   Prm_UserID        = '" & Eid  & "' "
                set rsD = dbconn.Execute (sqldel)
            end if
        next
    end if

    sqlNmp = "Select Emp_NombreCompleto from HRM10220 where Emp_CompaniaID = '"& Cid &"' and Emp_EmpleadoID = '"& Eid &"'  "
    set rsNmp = dbconn.execute(sqlNmp)
    if not rsNmp.eof and not rsNmp.bof then
        SubTit = trim(rsNmp("Emp_NombreCompleto"))
    end if
    rsNmp.close
    set rsNmp = Nothing
    %>

    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL AQUI -->        
        <form action="Hrm_Usuarios3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
            <div class="box box-primary">
                <div class="box-body">
                    <table id="example1" class="table table-bordered table-striped">
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
                                        sqlC = "Select Prm_ModuloID from HRM10006                                 " & _
                                               "where Prm_ModuloID      = '" & trim(rs("Mdl_ModuloID"))      & "' " & _
                                               "and   Prm_TransaccionID = '" & trim(rs("Trn_TransaccionID")) & "' " & _
                                               "and   Prm_UserID        = '" & Eid & "'                           "
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
                    <input type="hidden" name="Cid" id="Cid" value="<%= Cid %>" /></input>
                    <input type="hidden" name="Eid" id="Eid" value="<%= Eid %>" /></input>
                    <button type="submit" class="btn btn-primary" name="Sbt" value="Sbt"><%= SmBtn1 %></button>
                </div>
            </div>
            <!-- /.box -->
        </form>
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
    $("#example1").DataTable();
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

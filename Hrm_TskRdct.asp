<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Tarea/Task Redireccionador</title>
  <link rel="shortcut icon" href="images/favicon.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">

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
    Dim Uem
    Dim Obs
    Uem = request.querystring("Uem")
    Obs = request.querystring("Obs")

    '<!-- Alta de Registros (Inicio) -->
    if Uem > "" then
        sqlTsk = "select * from HRM10400 where Tsk_EmpleadoID = '"& Uid &"' and Tsk_UserID = '"& Uem &"' and Tsk_Estatus = 'A' "
        set rs = dbconn.execute(sqlTsk)
        if not rs.bof and not rs.eof then
            do until rs.eof
                if trim(rs("Tsk_Observaciones")) = Obs then
                    TskScr = trim(rs("Tsk_Script")) & "&Sid=" & Sid
                    sqlDTs = "delete HRM10400 where Tsk_EmpleadoID = '"& Uid &"' and Tsk_UserID = '"& Uem &"' and Tsk_Estatus = 'A' and Tsk_Observaciones = '"& trim(rs("Tsk_Observaciones")) &"' "
                    set rsD = dbconn.execute(sqlDTs)
                    response.redirect TskScr
                end if
                rs.movenext
            loop
            rs.close
            set rs = Nothing
        else
            response.redirect "index.asp?Sid=" & Sid
        end if
    end if
    '<!-- Alta de Registros (Final)  -->
    %>
    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- Main Content - Inicio -->
        <!-- Main Content - Final  -->
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
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

</body>
</html>
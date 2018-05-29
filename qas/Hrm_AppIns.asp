<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Accesos a Aplicaciones Institucionales</title>
  <link rel="shortcut icon" href="images/favicon.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">  
    
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'AppIns0100' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    'response.write(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitPri"
                TitPri = trim(rsTrn("Trd_Texto"))
              Case "TitSec"
                TitSec = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubTit = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if


    cnV = "Provider=SQLOLEDB;Server=172.28.100.11;Database=ORGANIZACION_VZT;Uid=usrjob;Password=Vztjob2010;"
    set dbconnV = server.CreateObject("ADODB.Connection")
    dbconnV.open cnV

    sqlCid = "select Emp_CompaniaID from HRM10220 where Emp_EmpleadoID = '"& Uid &"' "
    set rsCid = dbconn.execute(sqlCid)
    if not rsCid.bof and not rsCid.eof then
        Cid = trim(rsCid("Emp_CompaniaID"))
    else
        Cid = ""
    end if

    sqlRid = "select id_recurso_vt from v_EmpleadosVerzatec where EmpresaFuente = "& Cid &" and Empleado = "& Uid &"  "
    set rsRid = dbconnV.execute(sqlRid)
    if not rsRid.bof and not rsRid.eof then
        Rid = rsRid("id_recurso_vt")
    else
        Rid = ""
    end if
    %>

    <% call hdr("Acceso a Aplicaciones Institucionales","") %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL AQUI -->
        <!-- social buttons -->
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">
                </h3>
            </div>
            <div class="box-body">
                <a class="btn btn-block btn-social btn-bitbucket" style="background-color: #A53148" href="../../SkandiaNetLogin/Default.aspx?eli=<%= Rid %>" target="_blank">
                    <i class="fa fa-money"></i> Caja de Ahorro - OldMutual
                </a>
                <a class="btn btn-block btn-social btn-bitbucket" style="background-color: #868483" href="http://172.28.100.8/ImpulsaNet/SS_ListaxObjAnalisis.asp?TipoProy=-1&Clave=15" target="_blank">
                    <i class="fa fa-bullseye"></i> Impulsa
                </a>
                <a class="btn btn-block btn-social btn-bitbucket" style="background-color: #A53148" href="http://vzt2k314.gpovzt.com/C8/Administración del conocimient/default.aspx" target="_blank">
                    <i class="fa fa-graduation-cap"></i> Base de Conocimiento
                </a>
                <a class="btn btn-block btn-social btn-bitbucket" style="background-color: #868483" href="http://172.28.100.8/helpdesk/default.asp?depto_sistemas=0" target="_blank">
                    <i class="fa fa-print"></i> Help Desk (IT)
                </a>
                <a class="btn btn-block btn-social btn-bitbucket" style="background-color: #A53148" href="http://online.verzatec.com/HelpDesk_Mtto/default.asp?depto_sistemas=0" target="_blank">
                    <i class="fa fa-wrench"></i> Ordenes de Servicio de Mantenimiento
                </a>
                <a class="btn btn-block btn-social btn-bitbucket" style="background-color: #868483" href="http://172.28.100.8/helpdeskSS/default.asp" target="_blank">
                    <i class="fa fa-exclamation-triangle"></i> Reporta Condiciones Inseguras
                </a>
                <a class="btn btn-block btn-social btn-bitbucket" style="background-color: #A53148" href="http://172.28.100.8/SolicitudFondos/SF_Solicitudes.asp?op=1" target="_blank">
                    <i class="fa fa-cloud-upload"></i> Solicitud de Fondos y Comprobacion de Gastos
                </a>
                <a class="btn btn-block btn-social btn-bitbucket" style="background-color: #868483" href="http://172.28.100.8/QVerzatec/sol/pendientes.aspx?idMod=1" target="_blank">
                    <i class="fa fa-file-text"></i> QVerzatec
                </a>
              <br>
            </div>
        </div>
        <!-- /.box -->

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
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Tablero de Control 01</title>
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
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'IndDes0100' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "Tb1Hd1"
                Tb1Hd1 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd2"
                Tb1Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd3"
                Tb1Hd3 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd4"
                Tb1Hd4 = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    else
        TitPri = ""
        SubTit = ""
        Tab001 = ""
        Tb1Hd1 = ""
        Tb1Hd2 = ""
        Tb1Hd3 = ""
        Tb1Hd4 = ""
        Tb1Hd0 = ""
    end if

    sqlRcp = "select isnull(Count(Rps_Folio),0) as Rcp from HRM10251 where Rps_Estatus = 'N' "
    set rs = dbconn.execute(sqlRcp)
    Rcp = rs("Rcp")
    rs.close
    sqlAsg = "select isnull(Count(Rps_Folio),0) as Asg from HRM10251 where Rps_Estatus = 'G' "
    set rs = dbconn.execute(sqlAsg)
    Asg = rs("Asg")
    rs.close
    sqlCan = "select isnull(Count(Rps_Folio),0) as Can from HRM10251 where Rps_Estatus = 'C' "
    set rs = dbconn.execute(sqlCan)
    Can = rs("Can")
    rs.close
    sqlCat = "select isnull(Count(Rps_Folio),0) as Cat from HRM10251 where Rps_Estatus = 'A' "
    set rs = dbconn.execute(sqlCat)
    Cat = rs("Cat")
    rs.close

    %>

    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL Inicio -->
        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#recsel" data-toggle="tab"><%= Tab001 %></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="recsel" >

                            <div class="row">
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <a href="Hrm_RecSelConReq.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Prm=1" %>"><span class="info-box-icon bg-aqua"><i class="ion ion-person-stalker"></i></span></a>
                    
                                        <div class="info-box-content">
                                            <span class="info-box-text"><%= Tb1Hd1 %></span>
                                            <span class="info-box-number"><%= Rcp %></span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->

                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <a href="Hrm_RecSelConReq.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid& "&Prm=2" %>"><span class="info-box-icon bg-orange"><i class="ion ion-person-stalker"></i></span></a>
                    
                                        <div class="info-box-content">
                                            <span class="info-box-text"><%= Tb1Hd3 %></span>
                                            <span class="info-box-number"><%= Asg %></span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->

                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <a href="Hrm_RecSelConReq.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid& "&Prm=3" %>"><span class="info-box-icon bg-red"><i class="ion ion-person-stalker"></i></span></a>
                    
                                        <div class="info-box-content">
                                            <span class="info-box-text"><%= Tb1Hd4 %></span>
                                            <span class="info-box-number"><%= Can %></span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->

                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <a href="Hrm_RecSelConReq.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid& "&Prm=4" %>"><span class="info-box-icon bg-green"><i class="ion ion-person-add"></i></span></a>
                    
                                        <div class="info-box-content">
                                            <span class="info-box-text"><%= Tb1Hd2 %></span>
                                            <span class="info-box-number"><%= Cat %></span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                            </div>
                            <!-- /.row -->

                        </div>
                    </div>
                 </div>
            </div>
        </div>
        <!-- CONTENIDO PRINCIPAL Fin -->

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

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Panel Principal</title>
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
  <!--<link rel="stylesheet" href="plugins/datatables/media/css/dataTables.bootstrap.css">-->
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
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'PanPri0000' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "Tb1Lb1"
                Tb1Lb1  = trim(rsTrn("Trd_Texto"))
              Case "BoxHd1"
                BoxHd1  = trim(rsTrn("Trd_Texto"))

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
        Tb1Hd3 = ""
        Tb1Hd4 = ""
        Tb1Hd5 = ""
        Tb1Lb1 = ""
        BoxHd1 = ""
        Tb1Hd0 = ""
    end if
    %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
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
                            <a href="#panpri" data-toggle="tab"><%= Tab001 %></a>
                        </li>
                        <li>
                            <a href="#taract" data-toggle="tab"><%= Tab002 %></a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="panpri" >

                          <div class="box box-solid">
                            <!-- /.box-header -->
                            <div class="box-body">
                              <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                  <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                                  <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                                  <li data-target="#carousel-example-generic" data-slide-to="3" class=""></li>
                                  <li data-target="#carousel-example-generic" data-slide-to="4" class=""></li>
                                  <li data-target="#carousel-example-generic" data-slide-to="5" class=""></li>
                                  <li data-target="#carousel-example-generic" data-slide-to="6" class=""></li>
                                </ol>
                                <div class="carousel-inner">
                                  <div class="item active">
                                    <img src="images/banners/Banner01.jpg" alt="First slide">
                                    <div class="carousel-caption">
                                    </div>
                                  </div>
                                  <div class="item">
                                    <img src="images/banners/Banner02.jpg" alt="Second slide">
                                    <div class="carousel-caption">
                                    </div>
                                  </div>
                                  <div class="item">
                                    <img src="images/banners/Banner03.jpg" alt="Third slide">
                                    <div class="carousel-caption">
                                    </div>
                                  </div>

                                  <div class="item">
                                    <img src="images/banners/Banner04.jpg" alt="Fouth slide">
                                    <div class="carousel-caption">
                                    </div>
                                  </div>
                                  <div class="item">
                                    <img src="images/banners/Banner05.jpg" alt="Fifth slide">
                                    <div class="carousel-caption">
                                    </div>
                                  </div>
                                  <div class="item">
                                    <img src="images/banners/Banner06.jpg" alt="Sixth slide">
                                    <div class="carousel-caption">
                                    </div>
                                  </div>
                                  <div class="item">
                                    <img src="images/banners/Banner07.jpg" alt="Seventh slide">
                                    <div class="carousel-caption">
                                    </div>
                                  </div>

                                </div>
                                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                  <span class="fa fa-angle-left"></span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                  <span class="fa fa-angle-right"></span>
                                </a>
                              </div>
                            </div>
                            <!-- /.box-body -->
                          </div>
                          <!-- /.box -->

                        </div>

                        <div class="tab-pane" id="taract" >
                            <!-- Actividades Pendientes -->
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><%= BoxHd1 %></h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
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
                                            sqlTsk = "select * from HRM10400 where Tsk_EmpleadoID = '"& Uid &"' and Tsk_Estatus = 'A'  "
                                            set rsT = dbconn.execute(sqlTsk)
                                            if not rsT.eof and not rsT.bof then
                                                Do while not rsT.eof
                                                    TskScr = trim(rsT("Tsk_Script")) & "&Sid=" & Sid 
                                                    %>
                                                    <tr>
                                                        <td><a href="Hrm_TskRdct.asp?Uem=<%= trim(rsT("Tsk_UserID")) & "&Obs=" & trim(rsT("Tsk_Observaciones")) & "&Sid=" & Sid  %>"><%= trim(rsT("Tsk_FolioID")) %></a></td>
                                                        <td><a href="Hrm_TskRdct.asp?Uem=<%= trim(rsT("Tsk_UserID")) & "&Obs=" & trim(rsT("Tsk_Observaciones")) & "&Sid=" & Sid  %>"><%= rsT("Tsk_FechaIni") %></a></td>
                                                        <td><a href="Hrm_TskRdct.asp?Uem=<%= trim(rsT("Tsk_UserID")) & "&Obs=" & trim(rsT("Tsk_Observaciones")) & "&Sid=" & Sid  %>"><%= rsT("Tsk_Descripcion") %></a></td>
                                                        <td><a href="Hrm_TskRdct.asp?Uem=<%= trim(rsT("Tsk_UserID")) & "&Obs=" & trim(rsT("Tsk_Observaciones")) & "&Sid=" & Sid  %>"><%= rsT("Tsk_Observaciones") %></a></td>
                                                        <td><a href="Hrm_TskRdct.asp?Uem=<%= trim(rsT("Tsk_UserID")) & "&Obs=" & trim(rsT("Tsk_Observaciones")) & "&Sid=" & Sid  %>"><span class="label label-warning"><%= Tb1Lb1 %></span></a></td>
                                                    </tr>
                                                    <%
                                                    rsT.movenext
                                                Loop
                                                rsT.close
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
<!--<script src="plugins/datatables/media/js/jquery.dataTables.min.js"></script>-->
<!--<script src="plugins/datatables/media/js/dataTables.bootstrap.min.js"></script>-->
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
    $('#example2').DataTable({
      "bProcessing": true,
      "bDeferRender": true,
      "paging": true,
      "lengthChange": true,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": true
    });
  });
</script>

</body>
</html>

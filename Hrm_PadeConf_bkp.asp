<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Proceso PADE Configuracion</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'DisOrg0100' and Trd_IdiomaID = '"& Lng &"'  "
    
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

    '<!-- Alta de Registros (inicio) -->
    Sbt = trim(request.form("Sbt"))
    if Sbt > "" then
        sqlval = "select Cpy_CompaniaID from HRM10201                        " & _
                 "where  Cpy_CompaniaID = '"& trim(request.form("Cid")) &"'  "
        set rsv = dbconn.execute(sqlval)
        
        if not rsv.eof and not rsv.bof then
            %>
            <script>
                alert('<%= MsgAl1 %>');
            </script>
            <%            
        else
            sqlins = "insert into HRM10201                        " & _
                     "values ('"& trim(request.form("Cid")) &"',  " & _
                     "        '"& trim(request.form("Nvl")) &"',  " & _
                     "        '"& trim(request.form("Rsc")) &"',  " & _
                     "        '"& trim(request.form("Rfc")) &"',  " & _
                     "        '',                                 " & _
                     "        '"& trim(request.form("Dr1")) &"',  " & _
                     "        '"& trim(request.form("Dr2")) &"',  " & _
                     "        '"& trim(request.form("Cps")) &"',  " & _
                     "        '"& trim(request.form("Mcp")) &"',  " & _
                     "        '"& trim(request.form("Ciu")) &"',  " & _
                     "        '"& trim(request.form("Edo")) &"',  " & _
                     "        '"& trim(request.form("Pai")) &"')  "
            'response.write(sqlins)
            set rsi = dbconn.execute(sqlins)
        end if
    end if
    '<!-- Alta de Registros (fin) -->
    TitPri = "Configuración Proceso PADE"
    SubTit = "Evaluación del Desempeño 2009 VERZATEC"
    %>
    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        
        <!-- Main Content - Inicio -->
        <div class="box box-success">
            <form action="#" name="form1" method="post">
                <div class="box-header with-border">
                    <h3 class="box-title"><i class="fa fa-calendar"></i>&nbsp;Evaluación Empleados</h3>
                </div>
                <!-- form start -->
                <div class="box-body">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label for="Mcp">No. Objetivos Mínimo</label>
                                <input type="text" class="form-control" id="Mcp" name="Mcp" placeholder="No. Objetivos Mínimo" maxlength="90" />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label for="Ciu">No. Objetivos Máximo</label>
                                <input type="text" class="form-control" id="Ciu" name="Ciu" placeholder="No. Objetivos Máximo" maxlength="90" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label for="Edo">PASO 1 - Fechas</label>
                                <input type="text" class="form-control" id="reservation01" placeholder="mm/dd/yyy - mm/dd/yyyy" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label for="Edo">PASO 2 - Fechas</label>
                                <input type="text" class="form-control" id="reservation02" placeholder="mm/dd/yyy - mm/dd/yyyy" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label for="Edo">PASO 3 - Fechas</label>
                                <input type="text" class="form-control" id="reservation03" placeholder="mm/dd/yyy - mm/dd/yyyy" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label for="Edo">PASO 4 - Fechas</label>
                                <input type="text" class="form-control" id="reservation04" placeholder="mm/dd/yyy - mm/dd/yyyy" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label for="Edo">MATRICES - Fechas</label>
                                <input type="text" class="form-control" id="reservation05" placeholder="mm/dd/yyy - mm/dd/yyyy" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00"><%= FrLgn1 %></label>
                                </br>
                                <button type="submit" class="btn btn-primary" name="BtnAdd" id="BtnAdd" value="A"><%= SmBtn1 %></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </form>


            <div class="box box-primary">

                <form action="#" name="form2" method="post">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-calendar"></i>&nbsp;Evaluación Ejecutivos</h3>
                    </div>
                    <!-- form start -->
                    <div class="box-body">
                        <div class="row fontawesome-icon-list">
                            <div class="col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label style="color: #f00">* &nbsp;</label><label for="Mcp">No. Objetivos Mínimo</label>
                                    <input type="text" class="form-control" id="Mcp" name="Mcp" placeholder="No. Objetivos Mínimo" maxlength="90" />
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label style="color: #f00">* &nbsp;</label><label for="Ciu">No. Objetivos Máximo</label>
                                    <input type="text" class="form-control" id="Ciu" name="Ciu" placeholder="No. Objetivos Máximo" maxlength="90" required />
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label style="color: #f00">* &nbsp;</label><label for="Edo">PASO 1 - Fechas</label>
                                    <input type="text" class="form-control" id="reservation06" placeholder="mm/dd/yyy - mm/dd/yyyy" required />
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label style="color: #f00">* &nbsp;</label><label for="Edo">PASO 2 - Fechas</label>
                                    <input type="text" class="form-control" id="reservation07" placeholder="mm/dd/yyy - mm/dd/yyyy" required />
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label style="color: #f00">* &nbsp;</label><label for="Edo">PASO 3 - Fechas</label>
                                    <input type="text" class="form-control" id="reservation08" placeholder="mm/dd/yyy - mm/dd/yyyy" required />
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label style="color: #f00">* &nbsp;</label><label for="Edo">PASO 4 - Fechas</label>
                                    <input type="text" class="form-control" id="reservation09" placeholder="mm/dd/yyy - mm/dd/yyyy" required />
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label style="color: #f00">* &nbsp;</label><label for="Edo">MATRICES - Fechas</label>
                                    <input type="text" class="form-control" id="reservation10" placeholder="mm/dd/yyy - mm/dd/yyyy" required />
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label style="color: #f00"><%= FrLgn1 %></label>
                                    </br>
                                    <button type="submit" class="btn btn-primary" name="BtnAdd" id="BtnAdd" value="A"><%= SmBtn1 %></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </form>
            </div>


            <div class="box box-warning">

                <form action="#" name="form3" method="post">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-balance-scale"></i>&nbsp;Evaluaciones</h3>
                    </div>
                    <!-- form start -->
                    <div class="box-body">
                        <a class="btn btn-app" href="Hrm_PadeEmpObj.asp?Prm=1&Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>">
                            <i class="fa fa-user"></i> Desempeño Empleados
                        </a>
                        <a class="btn btn-app" href="Hrm_PadeEvlEje.asp?Prm=1&Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>">
                            <i class="fa fa-suitcase"></i> Desempeño Ejecutivos
                        </a>
                        <a class="btn btn-app">
                            <i class="fa fa-rotate-right"></i> Encuesta 360°
                        </a>
                        <a class="btn btn-app">
                            <i class="fa fa-wrench"></i> Encuesta Habilidades
                        </a>
                        <a class="btn btn-app">
                            <i class="fa fa-comments"></i> Retroalimentación
                        </a>
                    </div>
                    <!-- /.box-body -->
                </form>
            </div>


            <div class="box box-danger">

                <form action="#" name="form4" method="post">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-user"></i>&nbsp;Empleados</h3>
                    </div>
                    <!-- form start -->
                    <div class="box-body">
                        <a class="btn btn-app">
                            <i class="fa fa-street-view"></i> Creación Matriz 360°
                        </a>
                        <a class="btn btn-app">
                            <i class="fa fa-wrench"></i> Empleados Habilidades
                        </a>
                        <a class="btn btn-app">
                            <i class="fa fa-comments"></i> Empleados Retroalimentación
                        </a>
                    </div>
                    <!-- /.box-body -->
                </form>
            </div>

            <div class="box box-danger" style="border-top-color: #83AE9B">

                <form action="#" name="form4" method="post">
                    <!-- form start -->
                    <div class="box-body">

                    </div>
                    <div class="box-footer" style="text-align: center">
                        <button type="submit" class="btn btn-primary" name="Sbt" id="Sbt" value="Sbt">Liberar PADE</button>
                    </div>
                    <!-- /.box-body -->
                </form>
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
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
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

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    $('#reservation01').daterangepicker();
    $('#reservation02').daterangepicker();
    $('#reservation03').daterangepicker();
    $('#reservation04').daterangepicker();
    $('#reservation05').daterangepicker();
    $('#reservation06').daterangepicker();
    $('#reservation07').daterangepicker();
    $('#reservation08').daterangepicker();
    $('#reservation09').daterangepicker();
    $('#reservation10').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
</script>

</body>
</html>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Fechas PADE (Pasos 1 - 4)</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0051' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "BxHd01"
                BxHd01 = trim(rsTrn("Trd_Texto"))
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
        BxHd01 = ""
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
        SmBtn1 = ""
        FrLgn1 = ""
        MsgAl1 = ""
        Tb1Hd0 = ""
    end if

    '<!-- Alta de Registros (inicio) -->
    Sbt = trim(request.form("Sbt"))
    if Sbt > "" then
        sqlval = "select Pde_Ejercicio from HRM10501                      " & _
                 "where  Pde_Ejercicio = "& trim(request.form("Ejr")) &"  "
        set rsv = dbconn.execute(sqlval)
        
        if not rsv.eof and not rsv.bof then
            P1FecIni = Mid(trim(request.form("P1Fecs")),7,4)  & "-" & Mid(trim(request.form("P1Fecs")),1,2)  & "-" & Mid(trim(request.form("P1Fecs")),4,2)
            P1FecFin = Mid(trim(request.form("P1Fecs")),20,4) & "-" & Mid(trim(request.form("P1Fecs")),14,2) & "-" & Mid(trim(request.form("P1Fecs")),17,2)
            P2FecIni = Mid(trim(request.form("P2Fecs")),7,4)  & "-" & Mid(trim(request.form("P2Fecs")),1,2)  & "-" & Mid(trim(request.form("P2Fecs")),4,2)
            P2FecFin = Mid(trim(request.form("P2Fecs")),20,4) & "-" & Mid(trim(request.form("P2Fecs")),14,2) & "-" & Mid(trim(request.form("P2Fecs")),17,2)
            P3FecIni = Mid(trim(request.form("P3Fecs")),7,4)  & "-" & Mid(trim(request.form("P3Fecs")),1,2)  & "-" & Mid(trim(request.form("P3Fecs")),4,2)
            P3FecFin = Mid(trim(request.form("P3Fecs")),20,4) & "-" & Mid(trim(request.form("P3Fecs")),14,2) & "-" & Mid(trim(request.form("P3Fecs")),17,2)
            P4FecIni = Mid(trim(request.form("P4Fecs")),7,4)  & "-" & Mid(trim(request.form("P4Fecs")),1,2)  & "-" & Mid(trim(request.form("P4Fecs")),4,2)
            P4FecFin = Mid(trim(request.form("P4Fecs")),20,4) & "-" & Mid(trim(request.form("P4Fecs")),14,2) & "-" & Mid(trim(request.form("P4Fecs")),17,2)
            MtFecIni = Mid(trim(request.form("P5Fecs")),7,4)  & "-" & Mid(trim(request.form("P5Fecs")),1,2)  & "-" & Mid(trim(request.form("P5Fecs")),4,2)
            MtFecFin = Mid(trim(request.form("P5Fecs")),20,4) & "-" & Mid(trim(request.form("P5Fecs")),14,2) & "-" & Mid(trim(request.form("P5Fecs")),17,2)
            sqlupd = "update HRM10501                                        " & _
                     "set Pde_P1FecIni = '"& P1FecIni &"',                   " & _
                     "    Pde_P1FecFin = '"& P1FecFin &"',                   " & _
                     "    Pde_P2FecIni = '"& P2FecIni &"',                   " & _
                     "    Pde_P2FecFin = '"& P2FecFin &"',                   " & _
                     "    Pde_P3FecIni = '"& P3FecIni &"',                   " & _
                     "    Pde_P3FecFin = '"& P3FecFin &"',                   " & _
                     "    Pde_P4FecIni = '"& P4FecIni &"',                   " & _
                     "    Pde_P4FecFin = '"& P4FecFin &"',                   " & _
                     "    Pde_MtFecIni = '"& MtFecIni &"',                   " & _
                     "    Pde_MtFecFin = '"& MtFecFin &"'                    " & _
                     "where Pde_Ejercicio = "& trim(request.form("Ejr")) &"  "
            set rsu = dbconn.execute(sqlupd)
        else
            Ejerc    = trim(request.form("Ejr"))
            P1FecIni = Mid(trim(request.form("P1Fecs")),7,4)  & "-" & Mid(trim(request.form("P1Fecs")),1,2)  & "-" & Mid(trim(request.form("P1Fecs")),4,2)
            P1FecFin = Mid(trim(request.form("P1Fecs")),20,4) & "-" & Mid(trim(request.form("P1Fecs")),14,2) & "-" & Mid(trim(request.form("P1Fecs")),17,2)
            P2FecIni = Mid(trim(request.form("P2Fecs")),7,4)  & "-" & Mid(trim(request.form("P2Fecs")),1,2)  & "-" & Mid(trim(request.form("P2Fecs")),4,2)
            P2FecFin = Mid(trim(request.form("P2Fecs")),20,4) & "-" & Mid(trim(request.form("P2Fecs")),14,2) & "-" & Mid(trim(request.form("P2Fecs")),17,2)
            P3FecIni = Mid(trim(request.form("P3Fecs")),7,4)  & "-" & Mid(trim(request.form("P3Fecs")),1,2)  & "-" & Mid(trim(request.form("P3Fecs")),4,2)
            P3FecFin = Mid(trim(request.form("P3Fecs")),20,4) & "-" & Mid(trim(request.form("P3Fecs")),14,2) & "-" & Mid(trim(request.form("P3Fecs")),17,2)
            P4FecIni = Mid(trim(request.form("P4Fecs")),7,4)  & "-" & Mid(trim(request.form("P4Fecs")),1,2)  & "-" & Mid(trim(request.form("P4Fecs")),4,2)
            P4FecFin = Mid(trim(request.form("P4Fecs")),20,4) & "-" & Mid(trim(request.form("P4Fecs")),14,2) & "-" & Mid(trim(request.form("P4Fecs")),17,2)
            MtFecIni = Mid(trim(request.form("P5Fecs")),7,4)  & "-" & Mid(trim(request.form("P5Fecs")),1,2)  & "-" & Mid(trim(request.form("P5Fecs")),4,2)
            MtFecFin = Mid(trim(request.form("P5Fecs")),20,4) & "-" & Mid(trim(request.form("P5Fecs")),14,2) & "-" & Mid(trim(request.form("P5Fecs")),17,2)
            sqlins = "insert into HRM10501       " & _
                     "values ( "& Ejerc    &" ,  " & _
                     "        '"& P1FecIni &"',  " & _
                     "        '"& P1FecFin &"',  " & _
                     "        '"& P2FecIni &"',  " & _
                     "        '"& P2FecFin &"',  " & _
                     "        '"& P3FecIni &"',  " & _
                     "        '"& P3FecFin &"',  " & _
                     "        '"& P4FecIni &"',  " & _
                     "        '"& P4FecFin &"',  " & _
                     "        '"& MtFecIni &"',  " & _
                     "        '"& MtFecFin &"')  "
            'response.write(sqlins)
            set rsi = dbconn.execute(sqlins)
        end if
    end if
    '<!-- Alta de Registros (fin) -->
    Ejr = trim(request.Querystring("Ejr"))
    Dsc = trim(request.Querystring("Dsc"))
    if Ejr = "" then
        Ejr = trim(request.Form("Ejr"))
        Dsc = trim(request.Form("Dsc"))
    end if
    SubTit = Dsc
    
    sqlexs = "select * from HRM10501 where Pde_Ejercicio = "& Ejr &"  "
    set rse = dbconn.execute(sqlexs)
    if not rse.bof and not rse.eof then
        WvAno1 = Mid(CStr(trim(rse("Pde_P1FecIni"))),1,4)
        WvMes1 = Mid(CStr(trim(rse("Pde_P1FecIni"))),6,2)
        WvDia1 = Mid(CStr(trim(rse("Pde_P1FecIni"))),9,2)
        WvAno2 = Mid(CStr(trim(rse("Pde_P1FecFin"))),1,4)
        WvMes2 = Mid(CStr(trim(rse("Pde_P1FecFin"))),6,2)
        WvDia2 = Mid(CStr(trim(rse("Pde_P1FecFin"))),9,2)
        P1Fecs = WvMes1 & "/" & WvDia1 & "/" & WvAno1 & " - " & WvMes2 & "/" & WvDia2 & "/" & WvAno2

        WvAno1 = Mid(CStr(trim(rse("Pde_P2FecIni"))),1,4)
        WvMes1 = Mid(CStr(trim(rse("Pde_P2FecIni"))),6,2)
        WvDia1 = Mid(CStr(trim(rse("Pde_P2FecIni"))),9,2)
        WvAno2 = Mid(CStr(trim(rse("Pde_P2FecFin"))),1,4)
        WvMes2 = Mid(CStr(trim(rse("Pde_P2FecFin"))),6,2)
        WvDia2 = Mid(CStr(trim(rse("Pde_P2FecFin"))),9,2)
        P2Fecs = WvMes1 & "/" & WvDia1 & "/" & WvAno1 & " - " & WvMes2 & "/" & WvDia2 & "/" & WvAno2

        WvAno1 = Mid(CStr(trim(rse("Pde_P3FecIni"))),1,4)
        WvMes1 = Mid(CStr(trim(rse("Pde_P3FecIni"))),6,2)
        WvDia1 = Mid(CStr(trim(rse("Pde_P3FecIni"))),9,2)
        WvAno2 = Mid(CStr(trim(rse("Pde_P3FecFin"))),1,4)
        WvMes2 = Mid(CStr(trim(rse("Pde_P3FecFin"))),6,2)
        WvDia2 = Mid(CStr(trim(rse("Pde_P3FecFin"))),9,2)
        P3Fecs = WvMes1 & "/" & WvDia1 & "/" & WvAno1 & " - " & WvMes2 & "/" & WvDia2 & "/" & WvAno2

        WvAno1 = Mid(CStr(trim(rse("Pde_P4FecIni"))),1,4)
        WvMes1 = Mid(CStr(trim(rse("Pde_P4FecIni"))),6,2)
        WvDia1 = Mid(CStr(trim(rse("Pde_P4FecIni"))),9,2)
        WvAno2 = Mid(CStr(trim(rse("Pde_P4FecFin"))),1,4)
        WvMes2 = Mid(CStr(trim(rse("Pde_P4FecFin"))),6,2)
        WvDia2 = Mid(CStr(trim(rse("Pde_P4FecFin"))),9,2)
        P4Fecs = WvMes1 & "/" & WvDia1 & "/" & WvAno1 & " - " & WvMes2 & "/" & WvDia2 & "/" & WvAno2

        WvAno1 = Mid(CStr(trim(rse("Pde_MtFecIni"))),1,4)
        WvMes1 = Mid(CStr(trim(rse("Pde_MtFecIni"))),6,2)
        WvDia1 = Mid(CStr(trim(rse("Pde_MtFecIni"))),9,2)
        WvAno2 = Mid(CStr(trim(rse("Pde_MtFecFin"))),1,4)
        WvMes2 = Mid(CStr(trim(rse("Pde_MtFecFin"))),6,2)
        WvDia2 = Mid(CStr(trim(rse("Pde_MtFecFin"))),9,2)
        P5Fecs = WvMes1 & "/" & WvDia1 & "/" & WvAno1 & " - " & WvMes2 & "/" & WvDia2 & "/" & WvAno2
    else
        P1Fecs = ""
        P2Fecs = ""
        P3Fecs = ""
        P4Fecs = ""
        P5Fecs = ""
    end if
    %>
    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        
        <!-- Main Content - Inicio -->
        <div class="box box-success">
            <form action="Hrm_PadeFechas.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" name="form1" method="post">
                <input type="hidden" name="Ejr" id="Ejr" value="<%= Ejr %>" />
                <input type="hidden" name="Dsc" id="Dsc" value="<%= Dsc %>" />
                <div class="box-header with-border">
                    <h3 class="box-title"><i class="fa fa-calendar"></i>&nbsp;<%= BxHd01 %></h3>
                </div>
                <!-- form start -->
                <div class="box-body">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                                <input type="text" class="form-control" name="P1Fecs" id="P1Fecs" value="<%= P1Fecs %>" placeholder="<%= Fr1Ph1 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb2 %></label>
                                <input type="text" class="form-control" name="P2Fecs" id="P2Fecs" value="<%= P2Fecs %>" placeholder="<%= Fr1Ph2 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb3 %></label>
                                <input type="text" class="form-control" name="P3Fecs" id="P3Fecs" value="<%= P3Fecs %>" placeholder="<%= Fr1Ph3 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb4 %></label>
                                <input type="text" class="form-control" name="P4Fecs" id="P4Fecs" value="<%= P4Fecs %>" placeholder="<%= Fr1Ph4 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb5 %></label>
                                <input type="text" class="form-control" name="P5Fecs" id="P5Fecs" value="<%= P5Fecs %>" placeholder="<%= Fr1Ph5 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00"><%= FrLgn1 %></label>
                                </br>
                                <button type="submit" class="btn btn-primary" name="Sbt" id="Sbt" value="A"><%= SmBtn1 %></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </form>

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
    $('#P1Fecs').daterangepicker();
    $('#P2Fecs').daterangepicker();
    $('#P3Fecs').daterangepicker();
    $('#P4Fecs').daterangepicker();
    $('#P5Fecs').daterangepicker();
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
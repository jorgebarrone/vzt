<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Proceso PADE Configuracion Evaluación Habilides</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0090' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "BxHd02"
                BxHd02 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd1"
                Tb1Hd1 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd2"
                Tb1Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd3"
                Tb1Hd3 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn2"
                SmBtn2  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case "MsgAl1"
                MsgAl1  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    Ejr = trim(request.querystring("Ejr"))
    Dsc = trim(request.querystring("Dsc"))

'<!----------------------------------------------------------->
'<!--         ALTA DE REGISTROS         (INICIO)            -->
'<!----------------------------------------------------------->

    Sbt1 = trim(Request.Form("Sbt1"))
    if Sbt1 = "Sbt1" then
        sqlval = "select Peh_Ejercicio from HRM10524                            " & _
                 "where  Peh_Ejercicio  =  "& Ejr &"                            " & _
                 "and    Peh_EmpleadoID = '"& trim(request.form("NumEmp")) &"'  "
        set rsv = dbconn.execute(sqlval)
        
        if not rsv.eof and not rsv.bof then
            sqlupd = "update HRM10524                                              " & _
                     "set Peh_Ejercicio    =  "& Ejr &"                            " & _
                     "where Peh_Ejercicio  =  "& Ejr &"                            " & _
                     "and   Peh_EmpleadoID = '"& trim(request.form("NumEmp")) &"'  "
            set rsu = dbconn.execute(sqlupd)
        else
            sqlCia = "select Emp_CompaniaID from HRM10220 where Emp_EmpleadoID = '"& trim(request.form("NumEmp")) &"'  "
            set rsCia = dbconn.execute(sqlCia)
            if not rsCia.bof and not rsCia.eof then Cia = trim(rsCia("Emp_CompaniaID")) else Cia = "" end if
            sqlins = "insert into HRM10524                    " & _
                     "values ('5000',                         " & _
                     "         "& Ejr &",                     " & _
                     "        '"& request.form("NumEmp") &"', " & _
                     "        '"& Cia &"')                    "
            'response.write(sqlins)
            set rsi = dbconn.execute(sqlins)
        end if
    end if

    Dbt1a = trim(Request.Form("Dbt1a"))
    if Dbt1a = "Dbt1a" then
        Ind = request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                NumEmp = trim(Request.Form("NumEmp"&i))
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete HRM10524                            " & _
                             "where Peh_CorporativoID = '5000'           " & _
                             "and   Peh_EmpleadoID    = '"& NumEmp &"'   "
                    set rsd = dbconn.execute(sqldel)
                end if
            next
        end if
    end if

'<!----------------------------------------------------------->
'<!--         ALTA DE REGISTROS           (FIN)             -->
'<!----------------------------------------------------------->
    %>
    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- Main Content - Inicio -->
        <div class="box box-success">
            <div class="box-header with-border">
                <h3 class="box-title"><%= BxHd01 %></h3>
            </div>
            <div class="box-body">
                <form action="Hrm_PadeEmpHab.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form1" method="post">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                                <select class="form-control" size="1" id="NumEmp" name="NumEmp" required>
                                    <option class="form-control" value=""><%= Fr1Ph1 %></option>
                                    <%
                                    sqlEmp = "select Emp_CompaniaID, Emp_EmpleadoID, Emp_NombreCompleto from HRM10220 where Emp_CorporativoID = '5000' order by Emp_NombreCompleto "
                                    set rsEm = dbconn.execute(sqlEmp)
                                    if not rsEm.eof and not rsEm.bof then
                                        do while not rsEm.eof
                                            %>
                                            <option class="form-control" value="<%= trim(rsEm("Emp_EmpleadoID")) %>"><%= trim(rsEm("Emp_NombreCompleto")) & " - " & trim(rsEm("Emp_CompaniaID")) %></option>
                                            <%
                                            rsEm.movenext
                                        loop
                                        rsEm.close
                                        set rsEm = Nothing
                                    end if
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00"><%= FrLgn1 %></label>
                                <br/>
                                <button type="submit" class="btn btn-primary" name="Sbt1" id="Sbt1" value="Sbt1"><%= SmBtn1 %></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <%
            sqlLgr = "select a.Peh_EmpleadoID, b.Emp_NombreCompleto    " & _
                     "from HRM10524 a, HRM10220 b                      " & _
                     "where a.Peh_CorporativoID = '5000'               " & _
                     "and   a.Peh_CompaniaID    = b.Emp_CompaniaID     " & _
                     "and   a.Peh_EmpleadoID    = b.Emp_EmpleadoID     " & _
                     "and   a.Peh_Ejercicio     = "& Ejr &"            "
            set rsG = dbconn.execute(sqlLgr)
            if not rsG.bof and not rsG.eof then
                %>
                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3 class="box-title"><%= BxHd02 %></h3>
                    </div>
                    <div class="box-body">
                        <form action="Hrm_PadeEmpHab.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form1a" method="post">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th><%= Tb1Hd1 %></th>
                                    <th><%= Tb1Hd2 %></th>
                                    <th><%= Tb1Hd3 %></th>
                                    <th style="text-align: center; color: red; font-weight: bold">X</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                i = 0
                                do while not rsG.eof
                                    i = i + 1
                                    %>
                                    <tr>
                                        <td>
                                            <input type="hidden" name="<%= "NumEmp"&i %>" id="<%= "NumEmp"&i %>" value="<%= trim(rsG("Peh_EmpleadoID")) %>" />
                                            <%= Ejr %>
                                        </td>
                                        <td><%= trim(rsG("Peh_EmpleadoID")) %></td>
                                        <td><%= trim(rsG("Emp_NombreCompleto")) %></td>
                                        <td style="text-align: center">
                                            <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                        </td>
                                    </tr>
                                    <%
                                    rsG.movenext
                                loop
                                rsG.close
                                set rsG = Nothing
                                %>
                                </tbody>
                            </table>
                            <div class="box-footer" style="text-align: center">
                                <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                <button type="submit" class="btn btn-primary" style="background-color: red " name="Dbt1a" id="Dbt1a" value="Dbt1a"><%= SmBtn2 %></button>
                            </div>
                        </form>
                    </div>
                </div>
                <%
            end if
            %>
        </div>
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
    $("#example2").DataTable();
    $('#example3').DataTable({
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
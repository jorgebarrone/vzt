<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Requisicion de Personal (Creación de Folios)</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'RecSel0102' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
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
        SmBtn1 = ""
        MsgAl1 = ""
        Tb1Hd0 = ""
    end if

    MenErr = ""

    Dim Plz
    Dim Pui
    Dim Pnp
    Dim Pci
    Dim Fhy
    Dim Rid
    Dim Gid
    Dim Emi
    Dim Ema
    Dim Igr
    Pzi = trim(Request.Form("Pzi"))
    Pui = trim(Request.Form("Pui"))
    Pnp = trim(Request.Form("Pnp"))
    Pci = trim(Request.Form("Pci"))
    Fhy = year(date) & "-" & month(date) & "-" & day(date)
    Rid = trim(Request.Form("Rid"))
    Gid = trim(Request.Form("Gid"))
    Emi = Request.Form("Emi")
    Ema = Request.Form("Ema")
    Igr = trim(Request.Form("Igr"))


    '<!-- Busqueda Parametros (inicio) -->
    sqlprf = "select * from HRM10000                " & _
             "where Par_ParametroID = 'RSPREFIREQ'  "
    set rs = dbconn.execute(sqlprf)
    if not rs.eof and not rs.bof then
        Prf = trim(rs("Par_ValorTxt"))
    else
        Prf = ""
    end if
    '<!-- Busqueda Parametros (fin) -->
  

    '<!-- Alta de Registros (inicio) -->
    Dim Fol
    Fol = 0
    
    sqlfol = "select * from HRM10000                " & _
             "where Par_ParametroID = 'RSFOLIOREQ'  "
    set rs = dbconn.execute(sqlfol)
'   response.write(sqlfol)
    if not rs.eof and not rs.bof then
        Fol = rs("Par_ValorInt")
        Fol = Fol + 1
'        response.write("Fol : ")
'        response.write(Fol)
        sqlufl = "update HRM10000 set Par_ValorInt = "& Fol &" where Par_ParametroID = 'RSFOLIOREQ'  "
        set rsufl = dbconn.execute(sqlufl)
    else
        Fol = 1
        sqlifl = "insert into HRM10000 values('RSFOLIOREQ',1,0,'') "
        set rsifl = dbconn.execute(sqlifl)
    end if
    Fol = CStr(Fol)
    Fol = string(8 - Len(Fol), "0") & Fol
    Fol = Prf & Fol
    
    sqlihd = "insert into HRM10251 " & _
             "values('"& Pci &"',  " & _
             "       '"& Fol &"',  " & _
             "       '"& Uid &"',  " & _
             "       '"& Rid &"',  " & _
             "       '"& Pzi &"',  " & _
             "       '"& Pui &"',  " & _
             "       '"& Pnp &"',  " & _
             "       '"& Fhy &"',  " & _
             "       '"& Gid &"',  " & _
             "        "& Emi &",   " & _
             "        "& Ema &",   " & _
             "       'N',          " & _
             "       '"& Igr &"')  "
'   response.write(sqlihd)
    set rsihd = dbconn.execute(sqlihd)

  '<!-- Alta de Registros (fin) -->


    %>

    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL INICIO -->


        <!-- Alta de Requisiciones de Personal -->
        <div class="box box-success">
            <div class="box-body">
                <div class="form-group">
                    </br>
                    <%= MsgAl1 & "&nbsp;" %><label><%= Fol %></label>
                </div>
            </div>
            <div class="box-footer" style="text-align: center">
                <a href="Hrm_RequisicionRS.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>">
                    <button type="submit" class="btn btn-primary"><%= SmBtn1 %></button>
                </a>
            </div>
            <!-- /.box-body -->
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
  });
</script>

</body>
</html>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Consulta Matriz 360°</title>
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
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!--#include file="procedures.asp"-->
  <!--#include file="Hrm_Procedures01.asp"-->

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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0230' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "TitTer"
                TitTer = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubTit = trim(rsTrn("Trd_Texto"))
              Case "BxHd01"
                BxHd01 = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02 = trim(rsTrn("Trd_Texto"))
              Case "Fr0lb1"
                Fr0lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr0lb2"
                Fr0lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))

              Case "Fr1Lb2"
                Fr1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph2"
                Fr1Ph2 = trim(rsTrn("Trd_Texto"))

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
              Case "Tb1Hd6"
                Tb1Hd6 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn2"
                SmBtn2  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn3"
                SmBtn3  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn4"
                SmBtn4  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn5"
                SmBtn5  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn6"
                SmBtn6  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case "MsgAl1"
                MsgAl1  = trim(rsTrn("Trd_Texto"))
              Case "MsEr01"
                MsEr01  = trim(rsTrn("Trd_Texto"))
              Case "MsEr02"
                MsEr02  = trim(rsTrn("Trd_Texto"))
              Case "MsEr03"
                MsEr03  = trim(rsTrn("Trd_Texto"))
              Case "MsEr04"
                MsEr04  = trim(rsTrn("Trd_Texto"))
              Case "TskTx1"
                TskTx1  = trim(rsTrn("Trd_Texto"))
              Case "TskTx2"
                TskTx2  = trim(rsTrn("Trd_Texto"))
              Case "TskTx3"
                TskTx3  = trim(rsTrn("Trd_Texto"))
              Case "TskTx4"
                TskTx4  = trim(rsTrn("Trd_Texto"))
              
              Case "Fr1Sl0"
                Fr1Sl0 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl1"
                Fr1Sl1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl2"
                Fr1Sl2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl3"
                Fr1Sl3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl4"
                Fr1Sl4 = trim(rsTrn("Trd_Texto"))
              
              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    MenErr = ""
    EstOrg = 0
    Dim Dsc
    Dim Ejr
    Dim Sbt5
    Dim Sbt6


    Dsc = Request.Querystring("Dsc")
    Ejr = Request.Querystring("Ejr")
    Nem = Request.Querystring("Nem")
    Nmb = Request.Querystring("Nmb")
    Cid = Request.Querystring("Cid")


    '<!--  Llamamos la Funcion de Datos del Empleado - Inicio -->
    dim HdrNid
    dim HdrCid
    dim HdrNim
    dim HdrNmb
    dim HdrNml
    dim HdrNpd
    call HdrNem(Nem,Cid)
    '<!--  Llamamos la Funcion de Datos del Empleado - Final -->


    Sbt5 = Request.Form("Sbt5")
    Sbt6 = Request.Form("Sbt6")
    Subtit = Dsc & " - " & Nmb

    %>

    <% call hdr(TitTer,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->
        <div class="box box-success">
            <div class="box-header">
                <div class="box-header with-border">
                    <h3 class="box-title">
                        <img src="<%= HdrNim %>" style="height: 80px;" alt="<%= HdrNmb %>">
                        <%= Nem & " - " & HdrNmb & " - " & HdrNpd%>
                    </h3>
                </div>
            </div>
            <%
            sqlEvl = "select a.*,        b.Emp_NombreCompleto,           " & _
                     "      c.Otm_Plaza, d.Pue_Descripcion               " & _
                     "from   HRM10540 a, HRM10220 b,                     " & _
                     "       HRM10100 c, HRM10210 d                      " & _
                     "where a.M36_EvaluadorID     = b.Emp_EmpleadoID     " & _
                     "and   c.Otm_Empleado        = b.Emp_EmpleadoID     " & _
                     "and   c.Otm_id_nivel_puesto = d.Pue_NivelPuestoID  " & _
                     "and   c.Otm_EmpresaFuente   = d.Pue_CompaniaID     " & _
                     "and   c.Otm_Plaza           = b.Emp_PlazaID        " & _
                     "and   a.M36_Ejercicio       =  "& Ejr &"           " & _
                     "and   a.M36_EmpleadoID      = '"& Nem &"'          "
            set rsO = dbconn.execute(sqlEvl)
            if not rsO.bof and not rsO.eof then
                i = 0
                TotEvl = 0
                %>
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title"><%= BxHd02 %></h3>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th><%= Tb1Hd1 %></th>
                                <th><%= Tb1Hd2 %></th>
                                <th><%= Tb1Hd4 %></th>
                                <th><%= Tb1Hd5 %></th>
                                <th><%= Tb1Hd6 %></th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                            do while not rsO.eof
                                i = i + 1
                                TotEvl = TotEvl + 1
                                EvlSts = CInt(rsO("M36_Estatus"))
                                %>
                                <tr>
                                    <td>
                                        <input type="hidden" name="<%= "Evl"&i %>" id="<%= "Evl"&i %>" value="<%= trim(rsO("M36_EvaluadorID")) %>" />
                                        <%= trim(rsO("Pue_Descripcion")) %>
                                    </td>
                                    <td><%= trim(rsO("Emp_NombreCompleto")) %></td>
                                    <td style="text-align: center"><% if EvlSts  = 2 then %><i class="fa fa-circle text-red"></i><%else %><i class="fa fa-circle text-gray"></i><% end if %></td>
                                    <td style="text-align: center"><% if EvlSts >= 3 then %><i class="fa fa-circle text-green"></i><%else %><i class="fa fa-circle text-gray"></i><% end if %></td>
                                    <td style="text-align: center"><% if EvlSts  = 4 then %><i class="fa fa-circle text-blue"></i><%else %><i class="fa fa-circle text-gray"></i><% end if %></td>
                                </tr>
                                <%
                                rsO.movenext
                            loop
                            rsO.close
                            set rsO = Nothing
                            %>
                            </tbody>
                        </table>
                    </div>
                
                </div>
                <%
            end if
            %>


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

    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });

  });
</script>

</body>
</html>

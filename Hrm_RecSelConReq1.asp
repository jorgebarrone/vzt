<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Consulta de Requisicion de Personal </title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'RecSel0101c' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb2"
                Fr1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb3"
                Fr1Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb4"
                Fr1Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb5"
                Fr1Lb5 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb6"
                Fr1Lb6 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb7"
                Fr1Lb7 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb8"
                Fr1Lb8 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb9"
                Fr1Lb9 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb10"
                Fr1Lb10 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb11"
                Fr1Lb11 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb12"
                Fr1Lb12 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb20"
                Fr1Lb20 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb21"
                Fr1Lb21 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb22"
                Fr1Lb22 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb23"
                Fr1Lb23 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb24"
                Fr1Lb24 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb18"
                Fr1Lb18 = trim(rsTrn("Trd_Texto"))
              Case "GenOp1"
                GenOp1 = trim(rsTrn("Trd_Texto"))
              Case "GenOp2"
                GenOp2 = trim(rsTrn("Trd_Texto"))
              Case "GenOp3"
                GenOp3 = trim(rsTrn("Trd_Texto"))
              Case "EstOp1"
                EstOp1 = trim(rsTrn("Trd_Texto"))
              Case "EstOp2"
                EstOp2 = trim(rsTrn("Trd_Texto"))
              Case "EstOp3"
                EstOp3 = trim(rsTrn("Trd_Texto"))
              Case "EstOp4"
                EstOp4 = trim(rsTrn("Trd_Texto"))
              Case "EstOp5"
                EstOp5 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Bh1"
                Fr1Bh1 = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    else
        TitPri = ""
        SubTit = ""
        Fr1Lb1 = ""
        Fr1Lb2 = ""
        Fr1Lb3 = ""
        Fr1Lb4 = ""
        Fr1Lb5 = ""
        Fr1Lb6 = ""
        Fr1Lb7 = ""
        Fr1Lb8 = ""
        Fr1Lb9 = ""
        Fr1Lb10 = ""
        Fr1Lb11 = ""
        Fr1Lb12 = ""
        Fr1Lb20 = ""
        Fr1Lb21 = ""
        Fr1Lb22 = ""
        Fr1Lb23 = ""
        Fr1Lb24 = ""
        Fr1Lb18 = ""
        GenOp1 = ""
        GenOp2 = ""
        GenOp3 = ""
        EstOp1 = ""
        EstOp2 = ""
        EstOp3 = ""
        EstOp4 = ""
        EstOp5 = ""
        Fr1Bh1 = ""
        
        Tb1Hd0 = ""
    end if

    Dim Fol
    Fol = trim(Request.QueryString("Fol"))

    sqlinf = "select a.*,               b.Cpy_RazonSocial,     " & _
             "       c.Emp_NombreCompleto as Solicitante,      " &_
             "       d.Pue_Descripcion,                        " & _
             "       e.Emp_NombreCompleto as Reclutador        " & _
             "from HRM10251 a, HRM10201 b, HRM10220 c,         " & _
             "     HRM10210 d, HRM10220 e                      " & _
             "where a.Rps_CompaniaID    = b.Cpy_CompaniaID     " & _
             "and   a.Rps_SolicitanteID = c.Emp_EmpleadoID     " & _
             "and   a.Rps_CompaniaID    = d.Pue_CompaniaID     " & _
             "and   a.Rps_NivelPuestoID = d.Pue_NivelPuestoID  " & _
             "and   a.Rps_ReclutadorID  = e.Emp_EmpleadoID     " & _
             "and   a.Rps_Folio         = '"& Fol &"'          "

    set rs = dbconn.execute(sqlinf)
'    response.write(sqlinf)
    if not rs.eof and not rs.bof then
        Pci = trim(rs("Rps_CompaniaID"))
        Pui = trim(rs("Rps_PuestoID"))
        Rsc = trim(rs("Cpy_RazonSocial"))
        Fsl = trim(rs("Rps_FecSolicitud"))
        Plz = trim(rs("Rps_PlazaID"))
        Pue = trim(rs("Pue_Descripcion"))
        Pnp = trim(rs("Rps_NivelPuestoID"))
        Sol = trim(rs("Solicitante"))
        Rcl = trim(rs("Reclutador"))
        Gen = trim(rs("Rps_Genero"))
        Emi = rs("Rps_EdadMin")
        Ema = rs("Rps_EdadMax")
        Est = trim(rs("Rps_Estatus"))
        Obs = trim(rs("Rps_Observaciones"))
    else
        Pci = ""
        Pui = ""
        Rsc = ""
        Fsl = ""
        Plz = ""
        Pue = ""
        Pnp = ""
        Sol = ""
        Rcl = ""
        Gen = ""
        Emi = ""
        Ema = ""
        Est = ""
        Obs = ""
    end if

    if Gen = "F" then
        Gen = GenOp1
    else
        if Gen = "M" then
            Gen = GenOp2
        else
            Gen = GenOp3
        end if
    end if

    if Est = "N" then
        Est = EstOp1
    else
        if Est = "A" then
            Est = EstOp2
        else
            if Est = "T" then
                Est = EstOp3
            else
                if Est = "X" then
                    Est = EstOp4
                else
                    Est = EstOp5
                end if
            end if
        end if
    end if

    %>

    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->

            <div class="box box-success">
                <!-- form start -->
                <div class="box-body">

                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb1 %></label>
                                </br><%= Fol %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb2 %></label>
                                </br><%= Fsl %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb3 %></label>
                                </br><%= Sol %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb4 %></label>
                                </br><%= Rcl %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb5 %></label>
                                </br><%= Rsc %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb6 %></label>
                                </br><%= Plz %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb7 %></label>
                                </br><%= Pue %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb8 %></label>
                                </br><%= Est %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb9 %></label>
                                </br><%= Emi %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb10 %></label>
                                </br><%= Ema %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb11 %></label>
                                </br><%= Gen %>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label><%= Fr1Lb12 %></label>
                        </br><%= Obs %>
                    </div>
                </div>
            </div>

            <div class="box box-primary">
                <div class="box-header">
                  <i class="fa fa-edit"></i>
                  <h3 class="box-title"><%= Fr1Bh1 %></h3>
                </div>
                <!-- form start -->
                <div class="box-body">
                    <%
                    sqlDps = "Select * from HRM10211              " & _
                             "where Dps_CompaniaID = '"& Pci &"'  " & _
                             "and   Dps_PuestoID   = '"& Pui &"'  "
                    set rsDps = dbconn.execute(sqlDps)
                    'response.write(sqlDps)
                    if not rsDps.eof and not rsDps.bof then
                        DP_Msn = trim(rsDps("Dps_Mision"))
                        DP_Frm = trim(rsDps("Dps_Formacion"))
                        DP_Edu = trim(rsDps("Dps_Educacion"))
                        DP_Exp = trim(rsDps("Dps_Experiencia"))
                        DP_Hab = trim(rsDps("Dps_Habilidades"))
                    else
                        
                    end if
                    rsDps.close
                    set rsDps = Nothing
                    %>
                    <div class="row invoice-info">
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb20 %></label></br><%= DP_Frm %>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb21 %></label></br><%= DP_Edu %>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb22 %></label></br><%= DP_Exp %>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb23 %></label></br><%= DP_Hab %>
                        </div>
                    </div>
                    <div class="form-group">
                        <label><%= Fr1Lb24 %></label></br><%= DP_Msn %>
                    </div>

                </div>
                <!-- /.box-body -->

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

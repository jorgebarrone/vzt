<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Contestar Encuesta Habilidades</title>
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
  '<!-- Busqueda Parametros (inicio) -->
  Sci = "2017"
  '<!-- Busqueda Parametros (fin) -->

  %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <% call hdr("PADE","Contestar Encuesta de Habilidades - 54548 - FERNANDO LADRON DE GUEVARA PEREZ") %>

    <!-- Main content -->
    <section class="content">

    <!-- CONTENIDO PRINCIPAL INICIO -->

        <!-- Alta de Casos - Encabezado -->
        


            <!-- Alta de Casos - Script -->
            <div class="box box-info">
                <div class="box-body">
                    <%
                    sqlscr = "select a.*, b.Sct_Descripcion        " & _
                             "from HRM10303 a, HRM10302 b          " & _
                             "where a.Scp_TemaID   = b.Sct_TemaID  " & _
                             "and   a.Scp_ScriptID = '"& Sci &"'   " & _
                             "order by a.Scp_TemaID,               " & _
                             "         a.Scp_ReactivoID            "
                    set rs = dbconn.execute(sqlscr)
                    if not rs.eof and not rs.bof then
                        tant = ""
                        tact = ""
                        i    = 0
                        do while not rs.eof
                            i  = i  + 1
                            tact = trim(rs("Sct_Descripcion"))
                            if tact <> tant then
                                %>
                                <div class="box-header">
                                    <h3 class="box-title"><%= trim(rs("Sct_Descripcion")) %></h3>
                                </div><!-- /.box-header -->
                                <%
                                tant = tact
                            end if
                            %>
                            <div class="form-group">
                                <span class="badge bg-green"><%= trim(rs("Scp_ReactivoID")) %></span>
                                <input type="hidden" name="ReactivoID<%= i %>" value="<%= trim(rs("Scp_ReactivoID")) %>">
                                <label><%= trim(rs("Scp_Pregunta")) %></label>
                            </div>
                            <%
                            sqlV = "select Scr_Descripcion, Scr_ValorNumerico                    " & _
                                   "from HRM10304                                                " & _
                                   "where Scr_ScriptID   = '" & Sci  & "'                        " & _
                                   "and   Scr_ReactivoID =  " & trim(rs("Scp_ReactivoID")) & "   " & _
                                   "order by Scr_ValorNumerico desc                              "
                            set rsV = dbconn.execute(sqlV)
                            if not rsV.bof and not rsV.eof then
                                %>
                                <div class="row fontawesome-icon-list">
                                <%
                                do while not rsV.eof
                                    %>
                                    <div class="col-md-3 col-sm-4">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <input type="radio" name="ReactivoVL<%= i %>" id="ReactivoVL<%= i %>" value="<%= rsV("Scr_ValorNumerico") %>" required>
                                                </span>
                                                <input type="text" class="form-control" value="<%= trim(rsV("Scr_Descripcion")) %>" />
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                    rsV.movenext
                                loop
                                rsV.close
                                set rsV = Nothing
                                %>
                                </div>
                                <%
                            end if
                            rs.movenext
                        loop
                    end if
                    %>
                </div>

            </div>
            
            <div class="box-footer" style="text-align: center">
                <input type="hidden" name="Sci" id="Sci" value="<%= Sci %>" />
                <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                <button type="submit" class="btn btn-primary" name="BtnAdd" id="BtnAdd" value="A">Emviar</button>
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

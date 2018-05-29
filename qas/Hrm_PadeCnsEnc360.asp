<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Consultar Encuesta Habilidades</title>
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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0400' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "TskTx1"
                TskTx1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case else
                Tb0Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

   '<!-- Busqueda Parametros (inicio) -->
    Dim Ejr
    Dim Eja
    Dim Dsc
    Dim Nem
    Dim Nmb
    Dim Cid

    Ejr = CInt(Request.QueryString("Ejr"))
    Dsc = Request.QueryString("Dsc")
    Nem = Request.QueryString("Nem")
    Nmb = Request.QueryString("Nmb")
    Cid = Request.QueryString("Cid")
    Scr = ""
    Eja = Ejr - 1


'    Response.write(Tpts)

    '<!--  Buscamos la Encuesta de Habilidades del Ejercicio Anterior Inicio -->
    sqlScr = "select Pnc_EncuestaHab from HRM10523 where Pnc_Ejercicio = "& Eja &"   "
    set rsScr = dbconn.execute(sqlScr)
    if not rsScr.bof and not rsScr.eof then
        Sci = trim(rsScr("Pnc_EncuestaHab"))
    end if
    '<!--  Buscamos la Encuesta de Habilidades del Ejercicio Anterior Final  -->

    '<!--  Buscamos la Imagen del Empleado Encuestado Inicio -->
    sqlImg = "select Emp_Foto from HRM10220 where Emp_EmpleadoID = '"& Nem &"' and Emp_CompaniaID = '"& Cid &"'   "
    set rsImg = dbconn.execute(sqlImg)
    if not rsImg.bof and not rsImg.eof then
        Eim = trim(rsImg("Emp_Foto"))
    end if
    '<!--  Buscamos la Imagen del Empleado Encuestado Final  -->

    '<!--  Buscamos El Resultado Final Inicio -->
    sqlRfn = "select isnull(Evh_ResCalc,0) as Evh_ResCalc  " & _
             "from HRM10525                                " & _
             "where Evh_CorporativoID = '5000'             " & _
             "and   Evh_CompaniaID    = '"& Cid &"'        " & _
             "and   Evh_EmpleadoID    = '"& Nem &"'        " & _
             "and   Evh_Ejercicio     =  "& Eja &"         " & _
             "and   Evh_TipoEval      = 3                  "
    set rsRfn = dbconn.execute(sqlRfn)
    Rfn = 0
    if not rsRfn.bof and not rsRfn.eof then
        Rfn = formatnumber(rsRfn("Evh_ResCalc"),2)
    end if
    '<!--  Buscamos el Resultado Final Final  -->


    '<!-- Busqueda Parametros (fin) -->

    Subtit = Nem & " - " & Nmb & " / " & Dsc
    %>

    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">

    <!-- CONTENIDO PRINCIPAL INICIO -->

            <!-- Se muestra la Encuesta - Inicio -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">
                        <img src="<%= Eim %>" style="height: 80px;" alt="<%= Nmb %>">
                         <%= Nem & " - " & Nmb  & " / " & Rfn%>
                    </h3>
                </div>
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
                        Tpts = 0
                        Mpts = 0
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
                                
                            sqlR = "select Phb_ValorNumerico from HRM10532   " & _
                                   "where Phb_CorporativoID = '5000'         " & _
                                   "and   Phb_CompaniaID    = '"& Cid &"'    " & _
                                   "and   Phb_EmpleadoID    = '"& Nem &"'    " & _
                                   "and   Phb_Ejercicio     =  "& Eja &"     " & _
                                   "and   Phb_ReactivoID    =  "& rs("Scp_ReactivoID") &"  "
                            set rsR = dbconn.execute(sqlR)
                            if not rsR.eof and not rsR.bof then
                                Rvn = rsR("Phb_ValorNumerico")
                            else
                                Rvn = ""
                            end if

                            sqlV = "select Scr_Descripcion, Scr_ValorNumerico                    " & _
                                   "from HRM10304                                                " & _
                                   "where Scr_ScriptID   = '" & Sci  & "'                        " & _
                                   "and   Scr_ReactivoID =  " & trim(rs("Scp_ReactivoID")) & "   " & _
                                   "order by Scr_ValorNumerico desc                              "
                            set rsV = dbconn.execute(sqlV)
                            if not rsV.bof and not rsV.eof then
                                Mpts = 0
                                %>
                                <div class="row fontawesome-icon-list">
                                <%
                                do while not rsV.eof
                                    if rsV("Scr_ValorNumerico") > Mpts then
                                        Mpts = rsV("Scr_ValorNumerico")
                                    end if
                                    %>
                                    <div class="col-md-3 col-sm-4">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <%
                                                    if rsV("Scr_ValorNumerico") = Rvn then
                                                        %>
                                                        <input type="radio" name="ReactivoVL<%= i %>" id="ReactivoVL<%= i %>" value="<%= rsV("Scr_ValorNumerico") %>" checked="checked">
                                                        <%
                                                    else
                                                        %>
                                                        <input type="radio" name="ReactivoVL<%= i %>" id="ReactivoVL<%= i %>" value="<%= rsV("Scr_ValorNumerico") %>">
                                                        <%
                                                    end if
                                                    %>
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
                            Tpts = Tpts + Mpts
                            rs.movenext
                        loop
                    end if
                    %>
                </div>
            </div>
            
            <!-- Se muestra la Encuesta - Final  -->

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

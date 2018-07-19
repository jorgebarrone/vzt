<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Contestar Encuesta Competencias Laborales</title>
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
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'CnfGrl0200' and Trd_IdiomaID = '"& Lng &"'  "

    set rsTrn = dbconn.execute(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitTer"
                TitTer = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubTit = trim(rsTrn("Trd_Texto"))
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
              Case "Fr1Sb1"
                Fr1Sb1  = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sb2"
                Fr1Sb2  = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sb6"
                Fr1Sb6  = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lg1"
                Fr1Lg1  = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lg2"
                Fr1Lg2  = trim(rsTrn("Trd_Texto"))
              Case "MsgAl1"
                MsgAl1  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

   '<!-- Busqueda Parametros (inicio) -->
    Dim Sci
    Dim Dsc
    Dim Ten

    Dsc = Request.QueryString("Dsc")
    Sci = Request.QueryString("Sci")
    Ten = Request.QueryString("Ten")

    '<!-- Busqueda Parametros (fin) -->

    Subtit = Dsc
    %>

    <!-- Content Header (Page header) -->
    <% call hdr(Fr1Sb6,SubTit) %>

    <!-- Main content -->
    <section class="content">

    <!-- CONTENIDO PRINCIPAL INICIO -->
        <form action="Hrm_CapEncuestas4.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form1" method="post">
            <!-- Se muestra la Encuesta - Inicio -->
            <div class="box box-info">
                <div class="box-body">
                    <%
                    sqlTpt = "select Scr_ReactivoID, Scr_ValorNumerico  " & _
                             "from HRM10354                             " & _
                             "where Scr_ScriptID = '"& Sci &"'          " & _
                             "order by Scr_ReactivoID                   "
                    set rsT = dbconn.execute(sqlTpt)
                    if not rsT.bof and not rsT.eof then
                        Tnc = 0
                        Mpt = 0
                        ran = ""
                        rac = ""
                        do while not rsT.eof
                            rac = rsT("Scr_ReactivoID")
                            if rac <> ran then
                                Tnc = cdbl(Tnc) + cdbl(Mpt)
                                ran = rac
                            else
                                if cdbl(rsT("Scr_ValorNumerico")) > cdbl(Mpt) then
                                    Mpt = cdbl(rsT("Scr_ValorNumerico"))
                                end if
                            end if
                            rsT.movenext
                        loop
                        Tnc = cdbl(Tnc) + cdbl(Mpt)
                        rsT.close
                        set rsT = Nothing
                    end if

                    sqlscr = "select a.*, b.Sct_Descripcion        " & _
                             "from HRM10353 a, HRM10352 b          " & _
                             "where a.Scp_TemaID   = b.Sct_TemaID  " & _
                             "and   a.Scp_ScriptID = '"& Sci &"'   " & _
                             "and   a.Scp_LngID    = '"& Lng &"'   " & _
                             "and   b.Sct_LngID    = '"& Lng &"'   " & _
                             "order by a.Scp_TemaID,               " & _
                             "         a.Scp_ReactivoID            "
                    set rs = dbconn.execute(sqlscr)
                    if not rs.eof and not rs.bof then
                        tant = ""
                        tact = ""
                        Tmpt = 0
                        i    = 0
                        Tpts = 0
                        Mpts = 0
                        do while not rs.eof
                            i  = i  + 1
                            tact = trim(rs("Sct_Descripcion"))
                            if tact <> tant then
'                                response.write("Tmpt : " & Tmpt & "  Tnc : " & Tnc)
                                if Tmpt > 0 and Tnc > 0 then
                                    Tpnd = (cdbl(Tmpt) / cdbl(Tnc)) * 100
                                    %>
                                    <label style="text-align: left"><%= "Puntos Max : " & formatnumber(Tmpt,2) & " Ponderacion : " & formatnumber(Tpnd,2) & " %" %></label>
                                    <%
                                    Tmpt = 0
                                end if
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
                                   "from HRM10354                                                " & _
                                   "where Scr_ScriptID   = '" & Sci  & "'                        " & _
                                   "and   Scr_ReactivoID =  " & trim(rs("Scp_ReactivoID")) & "   " & _
                                   "and   Scr_LngID      = '" & Lng & "'                         " & _
                                   "order by Scr_Secuencia                                       "
                            set rsV = dbconn.execute(sqlV)
                            if not rsV.bof and not rsV.eof then
                                Mpts = 0
                                %>
                                <div class="row fontawesome-icon-list">
                                <%
                                do while not rsV.eof
                                    if cdbl(rsV("Scr_ValorNumerico")) > cdbl(Mpts) then
                                        Mpts = rsV("Scr_ValorNumerico")
                                    end if
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
                            Tpts = cdbl(Tpts) + cdbl(Mpts)
                            Tmpt = cdbl(Tmpt) + cdbl(Mpts)
                            rs.movenext
                        loop
                        if Tmpt > 0 and Tnc > 0 then
                            Tpnd = (cdbl(Tmpt) / cdbl(Tnc)) * 100
                            %>
                            <label style="text-align: left"><%= "Puntos Max : " & formatnumber(Tmpt,2) & " Ponderacion : " & formatnumber(Tpnd,2) & " %" %></label>
                            <%
                            Tmpt = 0
                        end if
                    end if
                    %>
                </div>
            </div>
            
            <div class="box-footer" style="text-align: center">
                <input type="hidden" name="Sci"  id="Sci"  value="<%= Sci %>" />
                <input type="hidden" name="Tpts" id="Tpts" value="<%= Tpts %>" />
                <input type="hidden" name="Ind"  id="Ind"  value="<%= i %>" />
            </div>
            <!-- Se muestra la Encuesta - Final  -->
        </form>
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

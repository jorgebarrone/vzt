<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Encuesta 360° - Alta de Reactivos</title>
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
  '<!-- Alta de Registros (inicio) -->
  Dim Ind
  Dim Bta
  Dim Btm
  Ind = request.Form("Ind")
  Bta = trim(request.Form("BtnAdd"))
  Btm = trim(request.Form("BtnMdf"))

  if Bta = "A" then
      sqlptd = "select isnull(max(Scp_ReactivoID), 0) as ptd            " & _
               "from HRM10303                                           " & _
               "where Scp_ScriptID = '"& trim(Request.Form("Sci")) &"'  "
      set rsptd = dbconn.execute(sqlptd)
      if not rsptd.eof and not rsptd.bof then
          ptd = cint(rsptd("ptd")) + 1
      else
          ptd = 1
      end if
      sqlins = "insert into HRM10303                        " & _
               "values ('"& trim(request.form("Sci")) &"',  " & _
               "        '"& trim(request.form("Tid")) &"',  " & _
               "         "& ptd &",                         " & _
               "        '"& trim(request.form("Rds")) &"')  "
      'response.write(sqlins)
      set rsi = dbconn.execute(sqlins)
  end if

  if Btm = "M" then
      for e = 1 to Ind
          if request.Form("elm"&e) = "on" then
              sqldel = "delete from HRM10303                                   " & _
                       "where Scp_ScriptID   = '"& Request.Form("Lsci"&e) &"'  " & _
                       "and   Scp_ReactivoID =  "& Request.Form("Lrei"&e) &"   "
              set rs = dbconn.Execute (sqldel)
              sqldel = "delete from HRM10304                                   " & _
                       "where Scr_ScriptID   = '"& Request.Form("Lsci"&e) &"'  " & _
                       "and   Scr_ReactivoID =  "& Request.Form("Lrei"&e) &"   "
              set rs = dbconn.Execute (sqldel)
              'response.write(sqldel)
   		  end if
	  next
      sqlnum = "select Scp_ReactivoID from HRM10303 where Scp_ScriptID = '"& Request.Form("Sci") &"' order by Scp_ReactivoID "
      set rsnum = dbconn.execute(sqlnum)
      if not rsnum.eof and not rsnum.bof then
          ptd = 0
          do while not rsnum.eof
              ptd = ptd + 1
              sqlupd = "update HRM10303                                         " & _
                       "set   Scp_ReactivoID =  "& ptd                     &"   " & _
                       "where Scp_ScriptID   = '"& Request.Form("Sci")     &"'  " &_
                       "and   Scp_ReactivoID =  "& rsnum("Scp_ReactivoID") &"   "
              set rsupd = dbconn.execute(sqlupd)
              rsnum.movenext
          loop
          rsnum.close
          set rsnum = Nothing
      end if
  end if

  Dim Sci
  Sci = trim(Request.QueryString("Sci"))

  if Sci = "" then
      Sci = trim(Request.Form("Sci"))
      Tid = trim(Request.Form("Tid"))
  else
      Tid = ""
  end if

  '<!-- Alta de Registros (fin) -->

  %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <% call hdr("PADE","Encuesta 360° - Alta de Preguntas/Reactivos") %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL INICIO -->

        <!-- Agregar Scripts -->
        <div class="box box-success">
            <form action="Hrm_PadeEnc3601.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">

                <!-- form start -->
                <div class="box-body">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Encuesta</label>
                                <input type="hidden" name="Sci" id="Sci" value="<%= Sci %>" />
                                <input type="text" class="form-control" name="Scid" id="Scid" placeholder="Encuesta" value="<%= Sci %>" maxlength="50" disabled />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Factor</label>
                                <select class="form-control" size="1" id="Tid" name="Tid" required>
                                    <option class="form-control" value="">Seleccione el Factor</option>
                                    <%
                                    sqlT = "select * from HRM10302 order by Sct_Descripcion   "
                                    set rsT = dbconn.execute(sqlT)
                                    'response.write(sqlT)
                                    if not rsT.eof and not rsT.bof then
                                        do while not rsT.eof
                                            if trim(rsT("Sct_TemaID")) = Tid then
                                                %>
                                                <option class="form-control" value="<%= trim(rsT("Sct_TemaID")) %>" selected >
                                                    <%= trim(rsT("Sct_Descripcion")) %>
                                                </option>
                                                <%
                                            else
                                                %>
                                                <option class="form-control" value="<%= trim(rsT("Sct_TemaID")) %>" >
                                                    <%= trim(rsT("Sct_Descripcion")) %>
                                                </option>
                                                <%
                                            end if
                                            rsT.moveNext
                                        loop
                                    end if
                                    rsT.close
                                    set rsT = Nothing
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Pregunta / Reactivo</label>
                                <input type="text" class="form-control" name="Rds" id="Rds" placeholder="Ingrese la Pregunta / Reactivo" maxlength="300" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label>&nbsp;</label>
                                <br/>
                                <button type="submit" class="btn btn-primary" name="BtnAdd" id="BtnAdd" value="A">Agregar</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4">
                        <label style="color: #f00">Requerido</label>
                    </div>
                    
                </div>
                <!-- /.box-body -->
            </form>
        </div>
        <%
        sqlLis = "select * from HRM10303 where Scp_ScriptID = '"& Sci &"' "
            
        set rs = dbconn.Execute(sqlLis)
        'response.write(sqlLis)
        if not rs.bof and not rs.eof then
            %>
            <div class="box box-primary">
                <form action="Hrm_PadeEnc3601.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form2" method="post">
                    <div class="box-header">
                      <h3 class="box-title">Registrados</h3>
                    </div>
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Factor</th>
                                    <th>Pregunta / Reactivo</th>
                                    <th style="text-align: center; color: red; font-weight: bold">X</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                i = 0
                                do while not rs.eof
                                    i = i + 1
                                    %>
                                    <tr>
                                        <td>
                                            <input type="hidden" name="<%= "Lsci"&i %>" id="<%= "Lsci"&i %>" value="<%= trim(rs("Scp_ScriptID")) %>" />
                                            <input type="hidden" name="<%= "Lrei"&i %>" id="<%= "Lrei"&i %>" value="<%= trim(rs("Scp_ReactivoID")) %>" />
                                            <a href="Hrm_PadeEnc3602.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sci=" & trim(rs("Scp_ScriptID")) & "&Sri=" & trim(rs("Scp_ReactivoID")) %>">
                                                <%= trim(rs("Scp_ReactivoID")) %>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="Hrm_PadeEnc3602.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sci=" & trim(rs("Scp_ScriptID")) & "&Sri=" & trim(rs("Scp_ReactivoID")) %>">
                                                <%= trim(rs("Scp_TemaID")) %>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="Hrm_PadeEnc3602.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sci=" & trim(rs("Scp_ScriptID")) & "&Sri=" & trim(rs("Scp_ReactivoID")) %>">
                                                <%= trim(rs("Scp_Pregunta")) %>
                                            </a>
                                        </td>
                                        <td style="text-align: center">
                                            <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                        </td>
                                    </tr>
                                    <%
                                    rs.movenext
                                loop
                                %>
                            </tbody>
                        </table>
                        <div class="box-footer" style="text-align: center">
                            <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                            <input type="hidden" name="Sci" id="Sci" value="<%= Sci %>" />
                            <input type="hidden" name="Tid" id="Tid" value="<%= Tid %>" />
                            <button type="submit" class="btn btn-primary" style="background-color: red " name="BtnMdf" id="BtnMdf" value="M">Eliminar líneas seleccionadas</button>
                        </div>
                    </div>
                </form>
            </div>
            <%
            rs.close
            set rs = Nothing
        end if
        %>

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

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Encuesta Habilidades - Alta de Respuestas a Reactivos</title>
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
      sqlptd = "select Scr_ScriptID  from HRM10304                           " & _
               "where Scr_ScriptID      = '"& trim(Request.Form("Sci")) &"'  " & _
               "and   Scr_ReactivoID    =  "& Request.Form("Sri")       &"   " & _
               "and   Scr_ValorNumerico =  "& Request.Form("Rvn")       &"   "
'      response.write(sqlptd)
      set rsptd = dbconn.execute(sqlptd)
      if not rsptd.eof and not rsptd.bof then
          sqlupd = "update HRM10304                                             " & _
                   "set Scr_ValorNumerico   =  "& trim(Request.Form("Rvn")) &"  " & _
                   "where Scr_ScriptID      = '"& trim(Request.Form("Sci")) &"' " & _
                   "and   Scr_ReactivoID    =  "& trim(Request.Form("Sri")) &"  " & _
                   "and   Scr_ValorNumerico =  "& trim(Request.Form("Rvn")) &"  "
      else
          sqlins = "insert into HRM10304                        " & _
                   "values ('"& trim(request.form("Sci")) &"',  " & _
                   "         "& trim(request.form("Sri")) &",   " & _
                   "         "& trim(request.form("Rvn")) &",   " & _
                   "        '"& trim(request.form("Rds")) &"')  "
          'response.write(sqlins)
          set rsi = dbconn.execute(sqlins)
      end if
  end if

  if Btm = "M" then
      for e = 1 to Ind
          if request.Form("elm"&e) = "on" then
              sqldel = "delete from HRM10304                                      " & _
                       "where Scr_ScriptID      = '"& Request.Form("Lsci"&e) &"'  " & _
                       "and   Scr_ReactivoID    =  "& Request.Form("Lrei"&e) &"   " & _
                       "and   Scr_ValorNumerico =  "& Request.Form("Lrvn"&e) &"   "
              set rs = dbconn.Execute (sqldel)
'              response.write(sqldel)
   		  end if
	  next
  end if

  Dim Sci
  Dim Sri
  Sci = trim(Request.QueryString("Sci"))
  Sri = trim(Request.QueryString("Sri"))

  
  if Sci = "" then
      Sci = trim(Request.Form("Sci"))
      Sri = trim(Request.Form("Sri"))
  end if

  sqlrds = "select a.Scp_ReactivoID, a.Scp_Pregunta,  " & _
           "       b.Sct_Descripcion                  " & _
           "from HRM10303 a, HRM10302 b               " & _
           "where a.Scp_TemaID     = b.Sct_TemaID     " & _
           "and   a.Scp_ScriptID   = '"& Sci &"'      " & _
           "and   a.Scp_ReactivoID =  "& Sri &"       "
'  response.write(sqlrds)
  set rsrds = dbconn.execute(sqlrds)
  if not rsrds.eof and not rsrds.bof then
      Srd = trim(rsrds("Scp_Pregunta"))
      Std = trim(rsrds("Sct_Descripcion"))
  else
      Srd = ""
      Std = ""
  end if
  rsrds.close
  set rsrds = Nothing

  '<!-- Alta de Registros (fin) -->

  %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <% call hdr("PADE","Encuesta de Habilidades") %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL INICIO -->
    <!-- CONTENIDO PRINCIPAL INICIO -->

        <!-- Agregar Scripts -->
        <div class="box box-success">
            <form action="Hrm_PadeEncHab2.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">

                <!-- form start -->
                <div class="box-body">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <input type="hidden" name="Sci" id="Sci" value="<%= Sci %>" />
                                <input type="hidden" name="Sri" id="Sri" value="<%= Sri %>" />
                                <label>Encuesta</label>
                                <input type="text" class="form-control" name="Scid" id="Scid" placeholder="Encuesta" value="<%= Sci %>" disabled />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label>Factor</label>
                                <input type="text" class="form-control" name="Stdd" id="Stdd" placeholder="Factor" value="<%= Std %>" disabled />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label>No Pregunta/Reactivo</label>
                                <input type="text" class="form-control" name="Srid" id="Srid" placeholder="No Pregunta/Reactivo" value="<%= Sri %>" disabled />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label>Pregunta/Reactivo</label>
                                <input type="text" class="form-control" name="Srdd" id="Srdd" placeholder="Pregunta/Reactivo" value="<%= Srd %>" disabled />
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Respuesta</label>
                                <input type="text" class="form-control" name="Rds" id="Rds" placeholder="Ingrese la(s) Posible(s) Respuesta(s)" maxlength="300" required />
                            </div>
                        </div>


                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Valor Numerico</label>
                                <input type="number" class="form-control" name="Rvn" id="Rvn" placeholder="<%= Fr1Ph6 %>" required />
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
        sqlLis = "select * from HRM10304              " & _
                 "where Scr_ScriptID   = '"& Sci &"'  " &_
                 "and   Scr_ReactivoID =  "& Sri &"   " &_
                 "order by Scr_ValorNumerico          "
            
        set rs = dbconn.Execute(sqlLis)
        'response.write(sqlLis)
        if not rs.bof and not rs.eof then
            %>
            <div class="box box-primary">
                <form action="Hrm_PadeEncHab2.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form2" method="post">
                    <div class="box-header">
                      <h3 class="box-title">Registrados</h3>
                    </div>
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Respuesta</th>
                                    <th>Valor Numerico</th>
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
                                            <input type="hidden" name="<%= "Lsci"&i %>" id="<%= "Lsci"&i %>" value="<%= trim(rs("Scr_ScriptID")) %>" />
                                            <input type="hidden" name="<%= "Lrei"&i %>" id="<%= "Lrei"&i %>" value="<%= trim(rs("Scr_ReactivoID")) %>" />
                                            <input type="hidden" name="<%= "Lrvn"&i %>" id="<%= "Lrvn"&i %>" value="<%= trim(rs("Scr_ValorNumerico")) %>" />
                                            <%= trim(rs("Scr_Descripcion")) %>
                                        </td>
                                        <td>
                                            <%= trim(rs("Scr_ValorNumerico")) %>
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
                            <input type="hidden" name="Sci" id="Sci" value="<%= Sci %>" />
                            <input type="hidden" name="Sri" id="Sri" value="<%= Sri %>" />
                            <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                            <button type="submit" class="btn btn-primary" style="background-color: red " name="BtnMdf" id="BtnMdf" value="M">Eliminar Líneas Seleccionadas</button>
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

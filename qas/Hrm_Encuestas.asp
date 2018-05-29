<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Encuestas - Alta de Encabezado</title>
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

  MsgAl1 = "El registro ya existe ..."

  if Bta = "A" then
      sqlval = "select Sch_ScriptID from HRM10301                        " & _
               "where  Sch_ScriptID = '"& trim(request.form("Sci")) &"'  " & _
               "and    Sch_Tipo     = '"& trim(request.form("Ten")) &"'  "
      set rsv = dbconn.execute(sqlval)
      
      if not rsv.eof and not rsv.bof then
          %>
          <script>
              alert('<%= MsgAl1 %>');
          </script>
          <%            
      else
          sqlins = "insert into HRM10301                        " & _
                   "values ('"& trim(request.form("Sci")) &"',  " & _
                   "        '"& trim(request.form("Ten")) &"',  " & _
                   "        '"& trim(request.form("Scd")) &"')  "
          'response.write(sqlins)
          set rsi = dbconn.execute(sqlins)
      end if
  end if

  if Btm = "M" then
      for e = 1 to Ind
          if request.Form("elm"&e) = "on" then
              sqldel = "delete from HRM10301                                   " & _
                       "where Sch_ScriptID = '" & Request.Form("Lsci"&e) & "'  " & _
                       "and   Sch_Tipo     = '" & Request.Form("Lten"&e) & "'  "
              set rs = dbconn.Execute (sqldel)
              'response.write(sqldel)
   		  end if
	  next
  end if

  '<!-- Alta de Registros (fin) -->
  %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <% call hdr("Encuestas","Alta de Encuestas") %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL INICIO -->

        <!-- Agregar Scripts -->
        <div class="box box-success">
            <form action="Hrm_Encuestas.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">

                <!-- form start -->
                <div class="box-body">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Clave de la Encuesta</label>
                                <input type="text" class="form-control" name="Sci" id="Sci" placeholder="Clave de la Encuesta" maxlength="50" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Descripción</label>
                                <input type="text" class="form-control" id="Scd" name="Scd" placeholder="Descripción de la Encuesta" maxlength="300" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label>Tipo</label>

                                <select class="form-control" size="1" id="Ten" name="Ten" required>
                                    <option class="form-control" value="">Seleccione el Tipo de Encuesta</option>
                                    <option class="form-control" value="360">360°</option>
                                    <option class="form-control" value="HAB">Habilidades</option>
                                </select>
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
        sqlLis = "select * from HRM10301 order by Sch_Tipo, Sch_Descripcion"
            
        set rs = dbconn.Execute(sqlLis)
        'response.write(sqlLis)
        if not rs.bof and not rs.eof then
            %>
            <div class="box box-primary">
                <form action="Hrm_Encuestas.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form2" method="post">
                    <div class="box-header">
                      <h3 class="box-title">Registrados</h3>
                    </div>
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Clave</th>
                                    <th>Descripción</th>
                                    <th>Tipo</th>
                                    <th style="text-align: center; color: red; font-weight: bold">X</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                i = 0
                                do while not rs.eof
                                    i = i + 1
                                    Tenc = ""
                                    if trim(rs("Sch_Tipo")) = "360" then
                                        Tenc = "360°"
                                    else
                                        if trim(rs("Sch_Tipo")) = "HAB" then
                                            Tenc = "Habilidades"
                                        else
                                            Tenc = "No definida"
                                        end if
                                    end if
                                    %>
                                    <tr>
                                        <td>
                                            <input type="hidden" name="<%= "Lsci"&i %>" id="<%= "Lsci"&i %>" value="<%= trim(rs("Sch_ScriptID")) %>" />
                                            <input type="hidden" name="<%= "Lten"&i %>" id="<%= "Lten"&i %>" value="<%= trim(rs("Sch_Tipo")) %>" />
                                            <a href="Hrm_Encuestas1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sci=" & trim(rs("Sch_ScriptID")) & "&Dsc=" & trim(rs("Sch_Descripcion")) & "&Ten=" & trim(rs("Sch_Tipo")) %>">
                                                <%= trim(rs("Sch_ScriptID")) %>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="Hrm_Encuestas1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sci=" & trim(rs("Sch_ScriptID")) & "&Dsc=" & trim(rs("Sch_Descripcion")) & "&Ten=" & trim(rs("Sch_Tipo")) %>">
                                                <%= trim(rs("Sch_Descripcion")) %>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="Hrm_Encuestas1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sci=" & trim(rs("Sch_ScriptID")) & "&Dsc=" & trim(rs("Sch_Descripcion")) & "&Ten=" & trim(rs("Sch_Tipo")) %>">
                                                <%= Tenc %>
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

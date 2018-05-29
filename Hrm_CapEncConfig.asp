<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Capacitacion Encuestas Configuracion</title>
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
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

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


    Tab1St = ""
    Tab2St = ""
    Tab3St = ""
    Pan1St = "tab-pane"
    Pan2St = "tab-pane"
    Pan3St = "tab-pane"

    Prm = trim(Request.Querystring("Prm"))
    if Prm = "" then
      Prm = 1
    end if
    Select Case Prm
        Case "1"
            Tab1St = "class='active'"
            Pan1St = "tab-pane active"
        Case "2"
            Tab2St = "class='active'"
            Pan2St = "tab-pane active"
        Case "3"
            Tab3St = "class='active'"
            Pan3St = "tab-pane active"
        Case else
            Tab1St = "class='active'"
            Pan1St = "tab-pane active"
    End Select

    ' response.write(Prm & " Tab2St : " & Tab2St &  " Pan2St : " & Pan2St )

    Sbt1  = trim(Request.Form("Sbt1"))
    Sbt1a = trim(Request.Form("Sbt1a"))
    Sbt2  = trim(Request.Form("Sbt2"))
    Sbt2a = trim(Request.Form("Sbt2a"))

    if Sbt1 = "Sbt1" then
      Tenc = trim(Request.Form("EncTip"))
      Denc = trim(Request.Form("EncDsc"))
      sqlexs = "Select Tpe_EncuestaID from HRM10360      " & _
               "where  Tpe_EncuestaID = '" & Tenc & "'   "
      set rsE = dbconn.Execute (sqlexs)
      if rsE.bof and rsE.eof then
        sqlins = "insert into HRM10360      " & _
                 "values ('" & Tenc & "',   " & _
                 "        '" & Denc & "')   "
        set rsI = dbconn.Execute (sqlins)
      else
        sqlupd = "update HRM10360                      " & _
                 "set Tpe_Descripcion  = '"& Denc &"'  " & _
                 "where Tpe_EncuestaID = '"& Tenc &"'  "
        set rsU = dbconn.execute(sqlupd)
      end if
    end if

    if Sbt1a = "Sbt1a" then
      Ind = Request.Form("Ind1")
        for j = 1 to Ind
          Tenc = Request.Form("Ltpei"&j)
          if Request.Form("elm"&j) = "on" then
            sqldel = "delete from HRM10360                  " & _
                     "where Tpe_EncuestaID = '" & Tenc & "' "
            set rsD = dbconn.Execute (sqldel)
          end if
        next
    end if


    if Sbt2 = "Sbt2" then
      Fcti = trim(Request.Form("FactID"))
      Fctl = trim(Request.Form("FacLng"))
      Fctd = trim(Request.Form("FacDsc"))
      sqlexs = "Select Sct_TemaID from HRM10352    " & _
               "where  Sct_TemaID = '"& Fcti &"'   " & _
               "and    Sct_LngID  = '"& Fctl &"'   "
      set rsE = dbconn.Execute (sqlexs)
      if rsE.bof and rsE.eof then
        sqlins = "insert into HRM10352      " & _
                 "values ('" & Fcti & "',   " & _
                 "        '" & Fctl & "',   " & _
                 "        '" & Fctd & "')   "
        set rsI = dbconn.Execute (sqlins)
      else
        sqlupd = "update HRM10352                      " & _
                 "set Sct_Descripcion  = '"& Fctd &"'  " & _
                 "where Sct_TemaID     = '"& Fcti &"'  " & _
                 "and   Sct_LngID      = '"& Fctl &"'  "
        set rsU = dbconn.execute(sqlupd)
      end if
    end if

    if Sbt2a = "Sbt2a" then
      Ind = Request.Form("Ind2")
        for j = 1 to Ind
          Lscti = trim(Request.Form("Lscti"&j))
          Llngi = trim(Request.Form("Llngi"&j))
          if Request.Form("elm"&j) = "on" then
            sqldel = "delete from HRM10352               " & _
                     "where Sct_TemaID = '" & Lscti & "' " & _
                     "and   Sct_LngID  = '" & Llngi &"'  "
            set rsD = dbconn.Execute (sqldel)
          end if
        next
    end if
    %>

    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL AQUI -->
        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li <%= Tab1St %>>
                            <a href="#tipenc" data-toggle="tab">Tipos</a>
                        </li>
                        <li <%= Tab2St %>>
                            <a href="#factor" data-toggle="tab">Factores</a>
                        </li>
                        <li <%= Tab3St %>>
                            <a href="#public" data-toggle="tab">Publicar</a>
                        </li>
                    </ul>
                    <div class="tab-content">

                        <!-- Listado de Usuarios Activos -->
                        <div class="<%= Pan1St %>" id="tipenc" >
                            <section id="TipoEncuesta">

                              <div class="box box-success">
                                  <form action="Hrm_CapEncConfig.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Prm=1" %>" name="form1" method="post">
                                    <div class="box-body">
                                      <div class="row fontawesome-icon-list">
                                        <div class="col-md-3 col-sm-4">
                                          <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label>Tipo de Encuesta</label>
                                            <input type="text" class="form-control" name="EncTip" id="EncTip" placeholder="Tipo de Encuesta" maxlength="20" required />
                                          </div>
                                        </div>
                                        <div class="col-md-3 col-sm-4">
                                          <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label>Descripción</label>
                                            <input type="text" class="form-control" id="EncDsc" name="EncDsc" placeholder="Descripción de la Encuesta" maxlength="300" required />
                                          </div>
                                        </div>
                                        <div class="col-md-3 col-sm-4">
                                          <div class="form-group">
                                            <label style="color: #f00">* Requerido</label>
                                            <br/>
                                            <button type="submit" class="btn btn-primary" name="Sbt1" id="Sbt1" value="Sbt1">Agregar</button>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <!-- /.box-body -->
                                  </form>
                              </div>

                              <%
                              sqlLis = "select * from HRM10360 order by Tpe_EncuestaID, Tpe_Descripcion"

                              set rs = dbconn.Execute(sqlLis)
                              'response.write(sqlLis)
                              if not rs.bof and not rs.eof then
                                %>
                                <div class="box box-primary">
                                  <form action="Hrm_CapEncConfig.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Prm=1" %>" name="form1a" method="post">
                                    <div class="box-header">
                                      <h3 class="box-title">Registrados</h3>
                                    </div>
                                    <div class="box-body">
                                      <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                          <tr>
                                            <th>ID</th>
                                            <th>Descripción</th>
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
                                              <input type="hidden" name="<%= "Ltpei"&i %>" id="<%= "Ltpei"&i %>" value="<%= trim(rs("Tpe_EncuestaID")) %>" />
                                              <%= trim(rs("Tpe_EncuestaID")) %>
                                            </td>
                                            <td>
                                              <%= trim(rs("Tpe_Descripcion")) %>
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
                                        <input type="hidden" name="Ind1" id="Ind1" value="<%= i %>" />
                                        <button type="submit" class="btn btn-primary" style="background-color: red " name="Sbt1a" id="Sbt1a" value="Sbt1a">Eliminar líneas seleccionadas</button>
                                      </div>
                                    </div>
                                  </form>
                                </div>
                                <%
                                rs.close
                                set rs = Nothing
                              end if
                              %>
                            </section>
                        </div>


                        <!-- Usuarios Inactivos -->
                        <div class="<%= Pan2St %>" id="factor" >

                          <section id="AFactores">

                            <div class="box box-success">
                                <form action="Hrm_CapEncConfig.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Prm=2" %>" name="form1" method="post">
                                  <div class="box-body">
                                    <div class="row fontawesome-icon-list">
                                      <div class="col-md-3 col-sm-4">
                                        <div class="form-group">
                                          <label style="color: #f00">* &nbsp;</label><label>Factor ID</label>
                                          <input type="text" class="form-control" name="FactID" id="FactID" placeholder="Factor a Evaluar" maxlength="45" required />
                                        </div>
                                      </div>
                                      <div class="col-md-3 col-sm-4">
                                        <div class="form-group">
                                          <label style="color: #f00">* &nbsp;</label><label>Descripción</label>
                                          <input type="text" class="form-control" id="FacDsc" name="FacDsc" placeholder="Descripción del Factor" maxlength="300" required />
                                        </div>
                                      </div>
                                      <div class="col-md-3 col-sm-4">
                                        <div class="form-group">
                                          <label style="color: #f00">* &nbsp;</label><label>Idioma</label>
                                          <select class="form-control" size="1" id="FacLng" name="FacLng" required>
                                            <option class="form-control" value="">Seleccione el Idioma</option>
                                            <%
                                            sqlLng = "select * from HRM10001 order by Idm_Descripcion"
                                            set rsLng = dbconn.execute(sqlLng)
                                            if not rsLng.bof and not rsLng.eof then
                                              Do while not rsLng.eof
                                                %>
                                                <option class="form-control" value="<%= trim(rsLng("Idm_IdiomaID")) %>"><%= trim(rsLng("Idm_Descripcion")) %></option>
                                                <%
                                                rsLng.movenext
                                              Loop
                                              rsLng.close
                                              set rsLng = Nothing
                                            end if
                                            %>
                                          </select>
                                        </div>
                                      </div>
                                      <div class="col-md-3 col-sm-4">
                                        <div class="form-group">
                                          <label style="color: #f00">* Requerido</label>
                                          <br/>
                                          <button type="submit" class="btn btn-primary" name="Sbt2" id="Sbt2" value="Sbt2">Agregar</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- /.box-body -->
                                </form>
                            </div>

                            <%
                            sqlLis = "select * from HRM10352 order by Sct_LngID, Sct_TemaID, Sct_Descripcion"

                            set rs = dbconn.Execute(sqlLis)
                            'response.write(sqlLis)
                            if not rs.bof and not rs.eof then
                              %>
                              <div class="box box-primary">
                                <form action="Hrm_CapEncConfig.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Prm=2" %>" name="form2a" method="post">
                                  <div class="box-header">
                                    <h3 class="box-title">Registrados</h3>
                                  </div>
                                  <div class="box-body">
                                    <table id="example2" class="table table-bordered table-striped">
                                      <thead>
                                        <tr>
                                          <th>Idioma ID</th>
                                          <th>Factor ID</th>
                                          <th>Descripción</th>
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
                                            <input type="hidden" name="<%= "Lscti"&i %>" id="<%= "Lscti"&i %>" value="<%= trim(rs("Sct_TemaID")) %>" />
                                            <input type="hidden" name="<%= "Llngi"&i %>" id="<%= "Llngi"&i %>" value="<%= trim(rs("Sct_LngID")) %>" />
                                            <%= trim(rs("Sct_LngID")) %>
                                          </td>
                                          <td>
                                            <%= trim(rs("Sct_TemaID")) %>
                                          </td>
                                          <td>
                                            <%= trim(rs("Sct_Descripcion")) %>
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
                                      <input type="hidden" name="Ind2" id="Ind2" value="<%= i %>" />
                                      <button type="submit" class="btn btn-primary" style="background-color: red " name="Sbt2a" id="Sbt2a" value="Sbt2a">Eliminar líneas seleccionadas</button>
                                    </div>
                                  </div>
                                </form>
                              </div>
                              <%
                              rs.close
                              set rs = Nothing
                            end if
                            %>
                          </section>

                        </div>

                    </div>
                </div>
            </div>
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
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>

<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true
    });
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true
    });
  });
</script>

</body>
</html>

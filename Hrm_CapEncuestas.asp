<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Capacitacion - Encuestas - Alta de Encabezado</title>
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
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'CnfGrl0200' and Trd_IdiomaID = '"& Lng &"'  "

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

              Case "Fr1Sb1"
                Fr1Sb1  = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sb2"
                Fr1Sb2  = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sb3"
                Fr1Sb3  = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sb5"
                Fr1Sb5  = trim(rsTrn("Trd_Texto"))
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

    '<!-- Alta de Registros (inicio) -->
    Dim Ind
    Dim Bta
    Dim Btm
    Ind = request.Form("Ind")
    Bta = trim(request.Form("BtnAdd"))
    Btm = trim(request.Form("BtnMdf"))

    MsgAl1 = "El registro ya existe ..."

    if Bta = "A" then
        sqlval = "select Sch_ScriptID from HRM10351                        " & _
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
            sqlins = "insert into HRM10351                        " & _
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
                sqldel = "delete from HRM10351                                   " & _
                         "where Sch_ScriptID = '" & Request.Form("Lsci"&e) & "'  " & _
                         "and   Sch_Tipo     = '" & Request.Form("Lten"&e) & "'  "
                set rs = dbconn.Execute (sqldel)
                'response.write(sqldel)
     		  end if
  	  next
    end if
    '<!-- Alta de Registros (fin) -->

    %>
    <% call hdr("Encuestas","Alta de Encuestas") %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL INICIO -->

        <div class="box box-success">
            <form action="Hrm_CapEncuestas.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
                <!-- form start -->
                <div class="box-body">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                                <input type="text" class="form-control" name="Sci" id="Sci" placeholder="<%= Fr1Ph1 %>" maxlength="50" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb2 %></label>
                                <input type="text" class="form-control" name="Scd" id="Scd" placeholder="<%= Fr1Ph2 %>" maxlength="300" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb3 %></label>
                                <select class="form-control" size="1" id="Ten" name="Ten" required>
                                    <option class="form-control" value=""><%= Fr1Ph3 %></option>
                                    <%
                                    sqlTen = "select * from HRM10360 order by Tpe_Descripcion"
                                    set rsTen = dbconn.execute(sqlTen)
                                    if not rsTen.bof and not rsTen.eof then
                                        do while not rsTen.eof
                                            %>
                                            <option class="form-control" value="<%= trim(rsTen("Tpe_EncuestaID")) %>"><%= trim(rsTen("Tpe_Descripcion")) %></option>
                                            <%
                                            rsTen.movenext
                                        Loop
                                        rsTen.close
                                        set rsTen = Nothing
                                    end if
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00"><%= Fr1Lg1 %></label>
                                <br/>
                                <button type="submit" class="btn btn-primary" name="BtnAdd" id="BtnAdd" value="A"><%= Fr1Sb1 %></button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <%
            sqlLis = "select e.*, d.Tpe_Descripcion       " & _
                    "from HRM10351 e, HRM10360 d         " & _
                    "where e.Sch_Tipo = d.Tpe_EncuestaID " &_
                    "order by Sch_Tipo, Sch_Descripcion  "
            set rs = dbconn.Execute(sqlLis)
            'response.write(sqlLis)
            if not rs.bof and not rs.eof then
                %>
                <div class="box box-primary">
                    <form action="Hrm_CapEncuestas.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form2" method="post">
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                    <th><%= Fr1Lb3 %></th>
                                    <th><%= Fr1Lb1 %></th>
                                    <th><%= Fr1Lb2 %></th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
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
                                                <input type="hidden" name="<%= "Lsci"&i %>" id="<%= "Lsci"&i %>" value="<%= trim(rs("Sch_ScriptID")) %>" />
                                                <input type="hidden" name="<%= "Lten"&i %>" id="<%= "Lten"&i %>" value="<%= trim(rs("Sch_Tipo")) %>" />
                                                <%= trim(rs("Tpe_Descripcion")) %>
                                            </td>
                                            <td>
                                                <%= trim(rs("Sch_ScriptID")) %>
                                            </td>
                                            <td>
                                                <%= trim(rs("Sch_Descripcion")) %>
                                            </td>
                                            <td>
                                                <a href="Hrm_CapEncuestas1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sci=" & trim(rs("Sch_ScriptID")) & "&Dsc=" & trim(rs("Sch_Descripcion")) & "&Ten=" & trim(rs("Sch_Tipo")) %>" >
                                                    <%= Fr1Sb3 %>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="Hrm_CapEncuestas4.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sci=" & trim(rs("Sch_ScriptID")) & "&Dsc=" & trim(rs("Sch_Descripcion")) & "&Ten=" & trim(rs("Sch_Tipo")) %>" >
                                                    <%= Fr1Sb6 %>
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
                                <button type="submit" class="btn btn-primary" style="background-color: red " name="BtnMdf" id="BtnMdf" value="M"><%= Fr1Sb2 %></button>
                            </div>
                        </div>
                    </form>
                </div>
                <%
                rs.close
                set rs = Nothing
            end if
            %>
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
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
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

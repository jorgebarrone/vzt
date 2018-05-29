<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Compañías</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'DisOrg0100' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "Tab001"
                Tab001 = trim(rsTrn("Trd_Texto"))
              Case "Tab002"
                Tab002 = trim(rsTrn("Trd_Texto"))
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
              Case "Fr1Lb11"
                Fr1Lb11 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph11"
                Fr1Ph11 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case "MsgAl1"
                MsgAl1  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    else
        TitPri = ""
        SubTit = ""
        Tab001 = ""
        Tab002 = ""
        Tb1Hd1 = ""
        Tb1Hd2 = ""
        Tb1Hd3 = ""
        Tb1Hd4 = ""
        Tb1Hd5 = ""
        Fr1Lb1 = ""
        Fr1Ph1 = ""
        Fr1Lb2 = ""
        Fr1Ph2 = ""
        Fr1Lb3 = ""
        Fr1Ph3 = ""
        Fr1Lb4 = ""
        Fr1Ph4 = ""
        Fr1Lb5 = ""
        Fr1Ph5 = ""
        Fr1Lb6 = ""
        Fr1Ph6 = ""
        Fr1Lb7 = ""
        Fr1Ph7 = ""
        Fr1Lb8 = ""
        Fr1Ph8 = ""
        Fr1Lb9 = ""
        Fr1Ph9 = ""
        Fr1Lb10 = ""
        Fr1Ph10 = ""
        Fr1Lb11 = ""
        Fr1Ph11 = ""
        SmBtn1 = ""
        FrLgn1 = ""
        MsgAl1 = ""
        Tb1Hd0 = ""
    end if

    '<!-- Alta de Registros (inicio) -->
    Sbt = trim(request.form("Sbt"))
    if Sbt > "" then
        sqlval = "select Cpy_CompaniaID from HRM10201                        " & _
                 "where  Cpy_CompaniaID = '"& trim(request.form("Cid")) &"'  "
        set rsv = dbconn.execute(sqlval)
        
        if not rsv.eof and not rsv.bof then
            %>
            <script>
                alert('<%= MsgAl1 %>');
            </script>
            <%            
        else
            sqlins = "insert into HRM10201                        " & _
                     "values ('"& trim(request.form("Cid")) &"',  " & _
                     "        '"& trim(request.form("Nvl")) &"',  " & _
                     "        '"& trim(request.form("Rsc")) &"',  " & _
                     "        '"& trim(request.form("Rfc")) &"',  " & _
                     "        '',                                 " & _
                     "        '"& trim(request.form("Dr1")) &"',  " & _
                     "        '"& trim(request.form("Dr2")) &"',  " & _
                     "        '"& trim(request.form("Cps")) &"',  " & _
                     "        '"& trim(request.form("Mcp")) &"',  " & _
                     "        '"& trim(request.form("Ciu")) &"',  " & _
                     "        '"& trim(request.form("Edo")) &"',  " & _
                     "        '"& trim(request.form("Pai")) &"')  "
            'response.write(sqlins)
            set rsi = dbconn.execute(sqlins)
        end if
    end if
    '<!-- Alta de Registros (fin) -->

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
                        <li class="active">
                            <a href="#activos" data-toggle="tab"><%= Tab001 %></a>
                        </li>
                        <li>
                            <a href="#agregar" data-toggle="tab"><%= Tab002 %></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        
                        <!-- Listado de Companias Registradas -->
                        <div class="tab-pane active" id="activos" >
                            <section id="clientes">
                                <div class="box box-primary">
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th><%= Tb1Hd1 %></th>
                                                    <th><%= Tb1Hd2 %></th>
                                                    <th><%= Tb1Hd3 %></th>
                                                    <th><%= Tb1Hd4 %></th>
                                                    <th><%= Tb1Hd5 %></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                sqlCpy = "select Cpy_CompaniaID, Cpy_RazonSocial,   " & _
                                                         "       Cpy_Nivel,      Cpy_Ciudad,        " & _
                                                         "       Cpy_Estado,     Cpy_Pais           " & _
                                                         "from HRM10201 order by Cpy_Nivel          "
                                                set rs = dbconn.Execute(sqlCpy)
                                                'response.write(sqlUsr)
                                                if not rs.bof and not rs.eof then
                                                    do while not rs.eof
                                                    %>
                                                    <tr>
                                                        <td>
                                                           <a href="Hrm_Companias1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Cpy_CompaniaID")) %>">
                                                               <%= rs("Cpy_Nivel") %>
                                                           </a>
                                                        </td>
                                                        <td>
                                                            <a href="Hrm_Companias1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Cpy_CompaniaID")) %>">
                                                                <%= trim(rs("Cpy_RazonSocial")) %>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="Hrm_Companias1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Cpy_CompaniaID")) %>">
                                                                <%= trim(rs("Cpy_Ciudad")) %>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="Hrm_Companias1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Cpy_CompaniaID")) %>">
                                                                <%= trim(rs("Cpy_Estado")) %>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="Hrm_Companias1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Cpy_CompaniaID")) %>">
                                                                <%= trim(rs("Cpy_Pais")) %>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                    rs.movenext
                                                    loop
                                                end if
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </section>
                        </div>

                            
                        <!-- Agregar Compañías -->
                        <div class="tab-pane" id="agregar" >
                            <form action="Hrm_Companias.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
                                <div class="box box-success">
                                    <!-- form start -->
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label for="Cid"><%= Fr1Lb1 %></label>
                                            <input type="text" class="form-control" id="Cid" name="Cid" placeholder="<%= Fr1Ph1 %>" maxlength="18" required />
                                        </div>
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label for="Rsc"><%= Fr1Lb3 %></label>
                                            <input type="text" class="form-control" id="Rsc" name="Rsc" placeholder="<%= Fr1Ph3 %>" maxlength="180" required />
                                        </div>
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label for="Dr1"><%= Fr1Lb5 %></label>
                                            <input type="text" class="form-control" id="Dr1" name="Dr1" placeholder="<%= Fr1Ph5 %>" maxlength="90" required />
                                        </div>
                                        <div class="form-group">
                                            <label for="Dr2"><%= Fr1Lb6 %></label>
                                            <input type="text" class="form-control" id="Dr2" name="Dr2" placeholder="<%= Fr1Ph6 %>" maxlength="90" />
                                        </div>
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Nvl"><%= Fr1Lb2 %></label>
                                                    <select class="form-control" size="1" name="Nvl" id="Nvl" required>
                                                        <option value="0"><%= Fr1Ph2 %></option>
                                                        <%
                                                        sqlCps = "select Cpy_CompaniaID,  " & _
                                                                 "       Cpy_RazonSocial  " & _
                                                                 "from HRM10201           " & _
                                                                 "order by Cpy_CompaniaID "
                                                        set rsC = dbconn.execute(sqlCps)
                                                        if not rsC.eof and not rsC.bof then
                                                            do while not rsC.eof
                                                                %>
                                                                <option value="<%= trim(rsC("Cpy_CompaniaID")) %>"><%= trim(rsC("Cpy_CompaniaID")) & " - " & trim(rsC("Cpy_RazonSocial")) %></option>
                                                                <%
                                                                rsC.movenext
                                                            loop
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Rfc"><%= Fr1Lb4 %></label>
                                                    <input type="text" class="form-control" id="Rfc" name="Rfc" placeholder="<%= Fr1Ph4 %>" maxlength="20" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Cps"><%= Fr1Lb7 %></label>
                                                    <input type="text" class="form-control" id="Cps" name="Cps" placeholder="<%= Fr1Ph7 %>" maxlength="9" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label for="Mcp"><%= Fr1Lb8 %></label>
                                                    <input type="text" class="form-control" id="Mcp" name="Mcp" placeholder="<%= Fr1Ph8 %>" maxlength="90" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Ciu"><%= Fr1Lb9 %></label>
                                                    <input type="text" class="form-control" id="Ciu" name="Ciu" placeholder="<%= Fr1Ph9 %>" maxlength="90" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Edo"><%= Fr1Lb10 %></label>
                                                    <input type="text" class="form-control" id="Edo" name="Edo" placeholder="<%= Fr1Ph10 %>" maxlength="90" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Pai"><%= Fr1Lb11 %></label>
                                                    <input type="text" class="form-control" id="Pai" name="Pai" placeholder="<%= Fr1Ph11 %>" maxlength="90" required />
                                                </div>
                                            </div>
                                        </div>
                                        <label style="color: #f00"><%= FrLgn1 %></label>
                                    </div>
                                    <!-- /.box-body -->
                                </div>

                                <div class="box-footer">
                                    <button type="submit" class="btn btn-primary" name="Sbt" id="Sbt" value="Sbt"><%= SmBtn1 %></button>
                                </div>
                            </form>

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
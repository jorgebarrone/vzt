<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Descripciones de Puesto</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'DisOrg0800' and Trd_IdiomaID = '"& Lng &"'  "

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
              Case "Fr1Lb12"
                Fr1Lb12 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph12"
                Fr1Ph12 = trim(rsTrn("Trd_Texto"))
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
    end if

    '<!-- Alta de Registros (inicio) -->
    Sbt = trim(request.form("Sbt"))
    if Sbt > "" then
        sqlval = "select Dps_CompaniaID from HRM10211                        " & _
                 "where  Dps_CompaniaID = '"& trim(request.form("Cid")) &"'  " & _
                 "and    Dps_PuestoID   = '"& trim(request.form("Pid")) &"'  "
        set rsv = dbconn.execute(sqlval)

        if not rsv.eof and not rsv.bof then
            %>
            <script>
                alert('<%= MsgAl1 %>');
            </script>
            <%
        else
            sqlins = "insert into HRM10211                        " & _
                     "values ('"& trim(request.form("Cpy")) &"',  " & _
                     "        '"& trim(request.form("Pid")) &"',  " & _
                     "        '"& trim(request.form("Msn")) &"',  " & _
                     "        '"& trim(request.form("Fmc")) &"',  " & _
                     "        '"& trim(request.form("Edc")) &"',  " & _
                     "        '"& trim(request.form("Exp")) &"',  " & _
                     "        '"& trim(request.form("Hbl")) &"',  " & _
                     "        '"& trim(request.form("Cpt")) &"',  " & _
                     "        '','','','','','','','','','')      "
            'response.write(sqlins)
            set rsi = dbconn.execute(sqlins)
        end if
    end if
    '<!-- Alta de Registros (fin) -->

    Cpy = trim(Request.Form("Cpy"))
    if Cpy > "" then
        Mn1 = ""
        Mn2 = " class='active'"
        Tb1 = ""
        Tb2 = " active"
    else
        Mn1 = " class='active'"
        Mn2 = ""
        Tb1 = " active"
        Tb2 = ""
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
                        <li<%= Mn1 %>><a href="#activos" data-toggle="tab"><%= Tab001 %></a></li>
                        <li<%= Mn2 %>><a href="#agregar" data-toggle="tab"><%= Tab002 %></a></li>
                    </ul>
                    <div class="tab-content">

                        <!-- Listado de Descripciones Registradas -->
                        <div class="tab-pane<%= Tb1 %>" id="activos" >
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
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                sqlCpy = "select a.Dps_CompaniaID,  a.Dps_PuestoID,    " & _
                                                         "       b.Cpy_RazonSocial, c.Pue_Descripcion  " & _
                                                         "from HRM10211 a, HRM10201 b, HRM10210 c      " & _
                                                         "where a.Dps_CompaniaID = b.Cpy_CompaniaID    " & _
                                                         "and   a.Dps_CompaniaID = c.Pue_CompaniaID    " & _
                                                         "and   a.Dps_PuestoID   = c.Pue_PuestoID      " & _
                                                         "order by Dps_CompaniaID                      "
                                                set rs = dbconn.Execute(sqlCpy)
'                                                response.write(sqlCpy)
                                                if not rs.bof and not rs.eof then
                                                    do while not rs.eof
                                                    %>
                                                    <tr>
                                                        <td>
                                                            <a href="Hrm_DescPuestos1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Dps_CompaniaID")) & "&Pid=" & trim(rs("Dps_PuestoID")) %>">
                                                                <%= rs("Dps_CompaniaID") %>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="Hrm_DescPuestos1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Dps_CompaniaID")) & "&Pid=" & trim(rs("Dps_PuestoID")) %>">
                                                                <%= trim(rs("Cpy_RazonSocial")) %>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="Hrm_DescPuestos1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Dps_CompaniaID")) & "&Pid=" & trim(rs("Dps_PuestoID")) %>">
                                                                <%= trim(rs("Dps_PuestoID")) %>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="Hrm_DescPuestos1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Dps_CompaniaID")) & "&Pid=" & trim(rs("Dps_PuestoID")) %>">
                                                                <%= trim(rs("Pue_Descripcion")) %>
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

                        <!-- Agregar Descripciones -->
                        <div class="tab-pane<%= Tb2 %>" id="agregar" >
                            <form action="Hrm_DescPuestos.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
                                <div class="box box-success">
                                    <!-- form start -->
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                                            <select class="form-control" size="1" id="Cpy" name="Cpy" required onchange="submit()">
                                                <option class="form-control" value=""><%= Fr1Ph1 %></option>
                                                <%
                                                sqlCpy = "select Cpy_CompaniaID, Cpy_RazonSocial from HRM10201 where Cpy_Tipo = '2' order by Cpy_RazonSocial   "
                                                set rsc = dbconn.execute(sqlCpy)
                                                'response.write(sqlCpy)
                                                if not rsc.eof and not rsc.bof then
                                                    do while not rsc.eof
                                                        if Cpy = trim(rsc("Cpy_CompaniaID")) then
                                                            %>
                                                            <option class="form-control" value="<%= trim(rsc("Cpy_CompaniaID")) %>" selected >
                                                                <%= (trim(rsc("Cpy_CompaniaID") & " - " & rsc("Cpy_RazonSocial"))) %>
                                                            </option>
                                                            <%
                                                        else
                                                            %>
                                                            <option class="form-control" value="<%= trim(rsc("Cpy_CompaniaID")) %>" >
                                                                <%= (trim(rsc("Cpy_CompaniaID") & " - " & rsc("Cpy_RazonSocial"))) %>
                                                            </option>
                                                            <%
                                                        end if
                                                        rsc.moveNext
                                                    loop
                                                end if
                                                rsc.close
                                                %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb2 %></label>
                                            <select class="form-control" size="1" id="Pid" name="Pid" required>
                                                <option class="form-control" value=""><%= Fr1Ph2 %></option>
                                                <%
                                                if Cpy > "" then
                                                    sqlPue = "select Pue_PuestoID, Pue_Descripcion from HRM10210 where Pue_CompaniaID = '"& Cpy &"' order by Pue_Descripcion  "
                                                    set rsp = dbconn.execute(sqlPue)
                                                    'response.write(sqlPue)
                                                    if not rsp.eof and not rsp.bof then
                                                        do while not rsp.eof
                                                            %>
                                                            <option class="form-control" value="<%= trim(rsp("Pue_PuestoID")) %>" >
                                                                <%= (trim(rsp("Pue_Descripcion") & " - " & rsp("Pue_PuestoID"))) %>
                                                            </option>
                                                            <%
                                                            rsp.moveNext
                                                        loop
                                                    end if
                                                    rsp.close
                                                end if
                                                %>
                                            </select>
                                        </div>

                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb3 %></label>
                                                    <textarea name="Fmc" id="Fmc" rows="4" class="form-control" placeholder="<%= Fr1Ph3 %>" required></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb4 %></label>
                                                    <textarea name="Edc" id="Edc" rows="4" class="form-control" placeholder="<%= Fr1Ph4 %>" required></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb5 %></label>
                                                    <textarea name="Exp" id="Exp" rows="4" class="form-control" placeholder="<%= Fr1Ph5 %>" required></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb6 %></label>
                                                    <textarea name="Hbl" id="Hbl" rows="4" class="form-control" placeholder="<%= Fr1Ph6 %>" required></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb12 %></label>
                                            <textarea name="Cpt" id="Cpt" rows="3" class="form-control" placeholder="<%= Fr1Ph12 %>" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb7 %></label>
                                            <textarea name="Msn" id="Msn" rows="3" class="form-control" placeholder="<%= Fr1Ph7 %>" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb8 %></label>
                                            <textarea name="Ctb" id="Ctb" rows="2" class="form-control" placeholder="<%= Fr1Ph8 %>" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb9 %></label>
                                            <textarea name="Fnc" id="Fnc" rows="4" class="form-control" placeholder="<%= Fr1Ph9 %>" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb10 %></label>
                                            <textarea name="Dsc" id="Dsc" rows="4" class="form-control" placeholder="<%= Fr1Ph10 %>" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb11 %></label>
                                            <textarea name="Cpj" id="Cpj" rows="4" class="form-control" placeholder="<%= Fr1Ph11 %>" required></textarea>
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

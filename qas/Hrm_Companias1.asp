<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Modificación de Compañías</title>
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
              Case "MsgAl2"
                MsgAl2  = trim(rsTrn("Trd_Texto"))
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
        MsgAl2 = ""
        Tb1Hd0 = ""
    end if

    '<!-- Actualizacion de Registros (inicio) -->
    Cid = trim(request.QueryString("Cid"))
    if Cid = "" then
        Cid = trim(request.Form("Cid"))
    end if

    Sbt = trim(request.form("Sbt"))
    if Sbt > "" then
         sqlupd = "update HRM10201                                            " & _
                  "set Cpy_Nivel        = '"& trim(request.form("Nvl")) &"',  " & _
                  "    Cpy_RazonSocial  = '"& trim(request.form("Rsc")) &"',  " & _
                  "    Cpy_RFC          = '"& trim(request.form("Rfc")) &"',  " & _
                  "    Cpy_Direccion1   = '"& trim(request.form("Dr1")) &"',  " & _
                  "    Cpy_Direccion2   = '"& trim(request.form("Dr2")) &"',  " & _
                  "    Cpy_CodigoPostal = '"& trim(request.form("Cps")) &"',  " & _
                  "    Cpy_Municipio    = '"& trim(request.form("Mcp")) &"',  " & _
                  "    Cpy_Ciudad       = '"& trim(request.form("Ciu")) &"',  " & _
                  "    Cpy_Estado       = '"& trim(request.form("Edo")) &"',  " & _
                  "    Cpy_Pais         = '"& trim(request.form("Pai")) &"'   " & _
                  "where Cpy_CompaniaID = '"& trim(request.form("Cid")) &"'   "
'        response.write(sqlupd)
        set rsu = dbconn.execute(sqlupd)
    end if
    '<!-- Actualizacion de Registros (fin) -->

    sqlval = "select * from HRM10201               " & _
             "where  Cpy_CompaniaID = '"& Cid &"'  "
    set rsv = dbconn.execute(sqlval)
'    response.write(sqlval)
    if not rsv.eof and not rsv.bof then
        Nvl = trim(rsv("Cpy_Nivel"))
        Rsc = trim(rsv("Cpy_RazonSocial"))
        Rfc = trim(rsv("Cpy_RFC"))
        Dr1 = trim(rsv("Cpy_Direccion1"))
        Dr2 = trim(rsv("Cpy_Direccion2"))
        Cps = trim(rsv("Cpy_CodigoPostal"))
        Mcp = trim(rsv("Cpy_Municipio"))
        Ciu = trim(rsv("Cpy_Ciudad"))
        Edo = trim(rsv("Cpy_Estado"))
        Pai = trim(rsv("Cpy_Pais"))
    else
        Nvl = ""
        Rsc = ""
        Rfc = ""
        Dr1 = ""
        Dr2 = ""
        Cps = ""
        Mcp = ""
        Ciu = ""
        Edo = ""
        Pai = ""
        %>
        <script>
            alert('<%= MsgAl2 %>');
        </script>
        <%            
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

                    <div class="tab-content">
                        
                        <form action="Hrm_Companias1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
                            <div class="box box-success">
                                <!-- form start -->
                                <div class="box-body">
                                    <div class="form-group">
                                        <label style="color: #f00">* &nbsp;</label><label for="Cid"><%= Fr1Lb1 %></label>
                                        <input type="text" class="form-control" id="Cid1" name="Cid1" placeholder="<%= Fr1Ph1 %>" maxlength="18" readonly=""  value="<%= Cid %>"/>
                                        <input type="hidden" id="Cid" name="Cid" value="<%= Cid %>"></input>
                                    </div>
                                    <div class="form-group">
                                        <label style="color: #f00">* &nbsp;</label><label for="Rsc"><%= Fr1Lb3 %></label>
                                        <input type="text" class="form-control" id="Rsc" name="Rsc" placeholder="<%= Fr1Ph3 %>" maxlength="180" required value="<%= Rsc %>" />
                                    </div>
                                    <div class="form-group">
                                        <label style="color: #f00">* &nbsp;</label><label for="Dr1"><%= Fr1Lb5 %></label>
                                        <input type="text" class="form-control" id="Dr1" name="Dr1" placeholder="<%= Fr1Ph5 %>" maxlength="90" required value="<%= Dr1 %>" />
                                    </div>
                                    <div class="form-group">
                                        <label for="Dr2"><%= Fr1Lb6 %></label>
                                        <input type="text" class="form-control" id="Dr2" name="Dr2" placeholder="<%= Fr1Ph6 %>" maxlength="90" value="<%= Dr2 %>" />
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
                                                            if trim(rsC("Cpy_CompaniaID")) = Nvl then
                                                                %>
                                                                <option value="<%= trim(rsC("Cpy_CompaniaID")) %>" selected><%= trim(rsC("Cpy_CompaniaID")) & " - " & trim(rsC("Cpy_RazonSocial")) %></option>
                                                                <%
                                                            else
                                                                %>
                                                                <option value="<%= trim(rsC("Cpy_CompaniaID")) %>"><%= trim(rsC("Cpy_CompaniaID")) & " - " & trim(rsC("Cpy_RazonSocial")) %></option>
                                                                <%
                                                            end if
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
                                                <input type="text" class="form-control" id="Rfc" name="Rfc" placeholder="<%= Fr1Ph4 %>" maxlength="20" required value="<%= Rfc %>" />
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-4">
                                            <div class="form-group">
                                                <label style="color: #f00">* &nbsp;</label><label for="Cps"><%= Fr1Lb7 %></label>
                                                <input type="text" class="form-control" id="Cps" name="Cps" placeholder="<%= Fr1Ph7 %>" maxlength="9" required value="<%= Cps %>" />
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-4">
                                            <div class="form-group">
                                                <label for="Mcp"><%= Fr1Lb8 %></label>
                                                <input type="text" class="form-control" id="Mcp" name="Mcp" placeholder="<%= Fr1Ph8 %>" maxlength="90" value="<%= Mcp %>" />
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-4">
                                        <div class="form-group">
                                                <label style="color: #f00">* &nbsp;</label><label for="Ciu"><%= Fr1Lb9 %></label>
                                                <input type="text" class="form-control" id="Ciu" name="Ciu" placeholder="<%= Fr1Ph9 %>" maxlength="90" required value="<%= Ciu %>" />
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-4">
                                            <div class="form-group">
                                                <label style="color: #f00">* &nbsp;</label><label for="Edo"><%= Fr1Lb10 %></label>
                                                <input type="text" class="form-control" id="Edo" name="Edo" placeholder="<%= Fr1Ph10 %>" maxlength="90" required value="<%= Edo %>" />
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-4">
                                            <div class="form-group">
                                                <label style="color: #f00">* &nbsp;</label><label for="Pai"><%= Fr1Lb11 %></label>
                                                <input type="text" class="form-control" id="Pai" name="Pai" placeholder="<%= Fr1Ph11 %>" maxlength="90" required value="<%= Pai %>" />
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
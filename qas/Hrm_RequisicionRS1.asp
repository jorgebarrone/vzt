<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Requisicion de Personal </title>
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
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'RecSel0101' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "Fr1Lb13"
                Fr1Lb13 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph13"
                Fr1Ph13 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb14"
                Fr1Lb14 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph14"
                Fr1Ph14 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb15"
                Fr1Lb15 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph15"
                Fr1Ph15 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb16"
                Fr1Lb16 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph16"
                Fr1Ph16 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb17"
                Fr1Lb17 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph17"
                Fr1Ph17 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb18"
                Fr1Lb18 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph18"
                Fr1Ph18 = trim(rsTrn("Trd_Texto"))
              Case "Fr1So1"
                Fr1So1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1So2"
                Fr1So2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1So3"
                Fr1So3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Bh1"
                Fr1Bh1 = trim(rsTrn("Trd_Texto"))
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
        Fr1Lb12 = ""
        Fr1Ph12 = ""
        Fr1Lb13 = ""
        Fr1Ph13 = ""
        Fr1Lb14 = ""
        Fr1Ph14 = ""
        Fr1Lb15 = ""
        Fr1Ph15 = ""
        Fr1Lb16 = ""
        Fr1Ph16 = ""
        Fr1Lb17 = ""
        Fr1Ph17 = ""
        Fr1Lb18 = ""
        Fr1Ph18 = ""
        Fr1So1 = ""
        Fr1So2 = ""
        Fr1So3 = ""
        Fr1Bh1 = ""
        SmBtn1 = ""
        FrLgn1 = ""
        MsgAl1 = ""
        Tb1Hd0 = ""
    end if

    MenErr = ""
    Fhy = date
    Plz = trim(request.Querystring("Plz"))

    set dbconn1 = server.CreateObject("ADODB.Connection")
    dbconn1.open vt

    sqlPid = "select b.Puesto, b.Desc_esp, b.EmpresaFuente, " & _
             "       b.id_nivel_puesto                      " & _
             "from VT_Organigrama a inner join VT_Puesto b  " & _
             "on a.id_nivel_puesto = b.id_nivel_puesto      " & _
             "where a.Plaza = "& Plz &"                     "
    set rs = dbconn1.execute(sqlPid)
    if not rs.eof and not rs.bof then
        Pui = trim(rs("Puesto"))
        Pds = trim(rs("Desc_esp"))
        Pci = trim(rs("EmpresaFuente"))
        Pnp = trim(rs("id_nivel_puesto"))
    else
        Pui = ""
        Pds = ""
        Pci = ""
        Pnp = ""
    end if

    %>

    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->
        <form action="Hrm_RequisicionRS2.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
            <div class="box box-success">
                <!-- form start -->
                <div class="box-body">

                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb1 %></label>
                                <input type="text" class="form-control" name="Fold" id="Fold" disabled value="" maxlength="10" placeholder="<%= Fr1Ph1 %>" />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb2 %></label>
                                <select class="form-control" size="1" id="Rid" name="Rid" required>
                                    <option class="form-control" value=""><%= Fr1Ph2 %></option>
                                    <%
                                    sqlRcl = "select * from HRM10250 order by Crs_CompaniaID, Crs_UserID  "
                                    set rsR = dbconn.execute(sqlRcl)
                                    'response.write(sqlRcl)
                                    if not rsR.eof and not rsR.bof then
                                        do while not rsR.eof
                                            sqlNrc = "select NombreCompleto from v_EmpleadosVerzatec where Empleado = "& rsR("Crs_UserID") &"  "
                                            set rsN = dbconn1.execute(sqlNrc)
                                            if not rsN.eof and not rsN.bof then
                                                Nrc = trim(rsN("NombreCompleto"))
                                            else
                                                Nrc = ""
                                            end if
                                            %>
                                            <option class="form-control" value="<%= rsR("Crs_UserID") %>" >
                                                <%= trim(rsR("Crs_CompaniaID")) & " - " & Nrc %>
                                            </option>
                                            <%
                                            rsR.moveNext
                                        loop
                                    end if
                                    rsR.close
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb3 %></label>
                                <input type="text" class="form-control" name="Pzid" id="Pzid" value="<%= Plz %>" placeholder="<%= Fr1Ph3 %>" />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label><%= Fr1Lb4 %></label>
                                <input type="text" class="form-control" name="Puid" id="Puid" value="<%= Pui & " - " & Pds %>" placeholder="<%= Fr1Ph4 %>" />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb5 %></label>
                                <input type="text" class="form-control" name="Fhyd" id="Fhyd" value="<%= Fhy %>" placeholder="<%= Fr1Ph5 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb6 %></label>
                                <select class="form-control" size="1" id="Gid" name="Gid" required>
                                    <option class="form-control" value=""><%= Fr1Ph6 %></option>
                                    <option class="form-control" value="M"><%= Fr1So1 %></option>
                                    <option class="form-control" value="F"><%= Fr1So2 %></option>
                                    <option class="form-control" value="I"><%= Fr1So3 %></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb7 %></label>
                                <input type="number" class="form-control" name="Emi" id="Emi" value="18" placeholder="<%= Fr1Ph7 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb8 %></label>
                                <input type="number" class="form-control" name="Ema" id="Ema" value="" placeholder="<%= Fr1Ph8 %>" required />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb9 %></label>
                        <textarea name="Igr" id="Igr" rows="2" class="form-control" placeholder="<%= Fr1Ph9 %>" required></textarea>
                    </div>
                    <label style="color: #f00"><%= FrLgn1 %></label>
                </div>
            </div>

            <div class="box box-primary">
                <div class="box-header">
                  <i class="fa fa-edit"></i>
                  <h3 class="box-title"><%= Fr1Bh1 %></h3>
                </div>
                <!-- form start -->
                <div class="box-body">
                    <%
                    sqlDps = "Select * from HRM10211              " & _
                             "where Dps_CompaniaID = '"& Pci &"'  " & _
                             "and   Dps_PuestoID   = '"& Pui &"'  "
                    set rsDps = dbconn.execute(sqlDps)
                    'response.write(sqlDps)
                    if not rsDps.eof and not rsDps.bof then
                        DP_Msn = trim(rsDps("Dps_Mision"))
                        DP_Frm = trim(rsDps("Dps_Formacion"))
                        DP_Edu = trim(rsDps("Dps_Educacion"))
                        DP_Exp = trim(rsDps("Dps_Experiencia"))
                        DP_Hab = trim(rsDps("Dps_Habilidades"))
                    else
                        
                    end if
                    rsDps.close
                    set rsDps = Nothing
                    %>
                    <div class="row invoice-info">
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb10 %></label></br><%= DP_Frm %>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb11 %></label></br><%= DP_Edu %>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb12 %></label></br><%= DP_Exp %>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <label><%= Fr1Lb13 %></label></br><%= DP_Hab %>
                        </div>
                    </div>
                    <div class="form-group">
                        <label><%= Fr1Lb14 %></label></br><%= DP_Msn %>
                    </div>

                </div>
                <!-- /.box-body -->
                <div class="box-footer" style="text-align: center">
                    <input type="hidden" name="Fol" id="Fol" value="0" />
                    <input type="hidden" name="Pzi" id="Pzi" value="<%= Plz %>" />
                    <input type="hidden" name="Pui" id="Pui" value="<%= Pui %>" />
                    <input type="hidden" name="Pci" id="Pci" value="<%= Pci %>" />
                    <input type="hidden" name="Pnp" id="Pnp" value="<%= Pnp %>" />
                    <button type="submit" class="btn btn-primary" name="Sbt" id="Sbt" value="Sbt"><%= SmBtn1 %></button>
                </div>

            </div>
        </form>

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

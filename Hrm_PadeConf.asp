<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Configuración</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0040' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "BoxHd1"
                BoxHd1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb0"
                Fr1Lb0 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn2"
                SmBtn2  = trim(rsTrn("Trd_Texto"))
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
        BoxHd1 = ""
        Fr1Lb0 = ""
        Fr1Lb1 = ""
        Fr1Ph1 = ""
        SmBtn1 = ""
        SmBtn2 = ""
        FrLgn1 = ""
        MsgAl1 = ""
        Tb1Hd0 = ""
    end if

    '<!-- Alta y Baja de Registros (inicio) -->
    Sbt = trim(request.form("Sbt"))
    Dbt = trim(request.form("BtnMdf"))
    if Sbt > "" then
        Ind = request.Form("Ind")
        Cid = trim(request.Form("Cid"))
        sqldel = "delete HRM105A1 where Pcy_CorporativoID = '5000' and Pcy_CompaniaID = '"& Cid &"'  "
        set rsd = dbconn.execute(sqldel)
        
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                SemafID = trim(request.form("SemafID"&i))
                if request.form("check"&i) = "on" then
                    sqli = "insert into HRM105A1        " & _
                            "values('5000',             " & _
                            "       '" & Cid     & "',  " & _
                            "       '" & SemafID & "')  "
                    set rsi = dbconn.execute(sqli)
                end if
            next
        end if
    end if

    if Dbt > "" then
        Ind = request.form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
	        for e = 1 to Ind
		        if request.Form("elm"&e) = "on" then
	 		        sqldel = "delete from HRM105A1                                        " & _
			  		         "where Pcy_CorporativoID = '5000'                            " & _
                             "and   Pcy_CompaniaID    = '" & Request.Form("Lcpy"&e) & "'  "
     		        set rs = dbconn.Execute (sqldel)
                    'response.write(sqldel)
   		        end if
	        next
        end if
    end if

    '<!-- Alta y Baja de Registros (fin) -->

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
                                        <%
                                        sqlLis = "select distinct(Pcy_CompaniaID) as Pcy_CompaniaID, " & _
                                                 "                Cpy_RazonSocial                    " & _
                                                 "from HRM105A1, HRM10201                            " & _
                                                 "where Pcy_CorporativoID = Cpy_CorporativoID        " & _
                                                 "and   Pcy_CompaniaID    = Cpy_CompaniaID           "
                                        set rs = dbconn.Execute(sqlLis)
                                        'response.write(sqlLis)
                                        if not rs.bof and not rs.eof then
                                            j = 0
                                            %>
                                            <form action="Hrm_PadeConf.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form2" method="post">
                                                <table id="example1" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th><%= Tb1Hd1 %></th>
                                                            <th><%= Tb1Hd2 %></th>
                                                            <th><%= Tb1Hd3 %></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <%
                                                    do while not rs.eof
                                                        j = j + 1
                                                        %>
                                                        <tr>
                                                            <td>
                                                                <input type="hidden" name="<%= "Lcpy"&j %>" id="<%= "Lcpy"&j %>" value="<%= trim(rs("Pcy_CompaniaID")) %>" />
                                                                <a href="Hrm_PadeConf1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Pcy_CompaniaID")) & "&Rsc=" & trim(rs("Cpy_RazonSocial")) %>">
                                                                    <%= rs("Pcy_CompaniaID") %>
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <a href="Hrm_PadeConf1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & trim(rs("Pcy_CompaniaID")) & "&Rsc=" & trim(rs("Cpy_RazonSocial")) %>">
                                                                    <%= trim(rs("Cpy_RazonSocial")) %>
                                                                </a>
                                                            </td>
                                                            <td style="text-align: center">
                                                                <input type="checkbox" name="<%= "elm"&j %>" id="<%= "elm"&j %>"  />
                                                            </td>
                                                        </tr>
                                                        <%
                                                        rs.movenext
                                                    loop
                                                    rs.close
                                                    set rs = Nothing
                                                    %>
                                                    </tbody>
                                                </table>
                                                <div class="box-footer" style="text-align: center">
                                                    <input type="hidden" name="Ind" id="Ind" value="<%= j %>" />
                                                    <button type="submit" class="btn btn-primary" style="background-color: red " name="BtnMdf" id="BtnMdf" value="M"><%= SmBtn2 %></button>
                                                </div>
                                            </form>
                                            <%
                                        end if
                                        %>
                                    </div>
                                </div>
                            </section>
                        </div>

                            
                        <!-- Agregar Configuración PADE -->
                        <div class="tab-pane" id="agregar" >
                            <form action="Hrm_PadeConf.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
                                <div class="box box-success">
                                    <!-- form start -->
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                                            <select class="form-control" size="1" name="Cid" id="Cid" required>
                                                <option value=""><%= Fr1Ph1 %></option>
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
                                        
                                        <div class="box box-success">
                                            <div class="box-header">
                                                <h3 class="box-title"><%= BoxHd1 %></h3>
                                            </div>
                                            <div class="box-body">
                                                <%
                                                sqlsmf = "select a.Psf_NumPaso, a.Psf_ParametroID,         " & _
                                                         "       b.Trd_Texto as Trd_Seccion,               " & _
                                                         "       c.Trd_Texto                               " & _
                                                         "from HRM105A0 a, HRM10002 b, HRM10002 c          " & _
                                                         "where a.Psf_RegistroID  = b.Trd_TransaccionID    " & _
                                                         "and   a.Psf_Seccion     = b.Trd_ElementoID       " & _
                                                         "and   a.Psf_RegistroID  = c.Trd_TransaccionID    " & _
                                                         "and   a.Psf_ParametroID = c.Trd_ElementoID       " & _
                                                         "and   b.Trd_IdiomaID    = '"& Lng &"'            " & _
                                                         "and   c.Trd_IdiomaID    = '"& Lng &"'            " & _
                                                         "and   a.Psf_RegistroID  = 'PADESEMAFOROS'        " & _
                                                         "order by a.Psf_NumPaso,    a.Psf_Secuencia1,     " & _
                                                         "         a.Psf_Secuencia2                        "
                                                set rsf = dbconn.execute(sqlsmf)
                                                'response.write(sqlsmf)
                                                if not rsf.bof and not rsf.eof then
                                                    tant = ""
                                                    tact = ""
                                                    fr   = 0
                                                    i    = 0
                                                    do while not rsf.eof
                                                        i  = i  + 1
                                                        tact = trim(rsf("Trd_Seccion"))
                                                        if tact <> tant then
                                                            if fr = 0 then
                                                                %>
                                                                <div class="box-header">
                                                                    <h3 class="box-title"><%= Fr1Lb0 & " " & rsf("Psf_NumPaso") & " - " & trim(rsf("Trd_Seccion")) %></h3>
                                                                </div><!-- /.box-header -->
                                                                <div class="row fontawesome-icon-list">
                                                                <%
                                                                fr = 1
                                                            else
                                                                %>
                                                                </div>
                                                                <div class="box-header">
                                                                    <h3 class="box-title"><%= Fr1Lb0 & " " & rsf("Psf_NumPaso") & " - " & trim(rsf("Trd_Seccion")) %></h3>
                                                                </div><!-- /.box-header -->
                                                                <div class="row fontawesome-icon-list">
                                                                <%
                                                            end if
                                                            tant = tact
                                                        end if
                                                        %>
                                                        <div class="col-md-3 col-sm-4">
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">
                                                                        <input type="hidden"   name="<%= "SemafID" & i %>" value="<%= rsf("Psf_ParametroID") %>" />
                                                                        <input type="checkbox" name="<%= "check"   & i %>" id="<%= "check"   & i %>" />
                                                                    </span>
                                                                    <input type="text" class="form-control" value="<%= trim(rsf("Trd_Texto")) %>" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%
                                                        rsf.movenext
                                                    loop
                                                    rsf.close
                                                    set rsf = Nothing
                                                end if
                                                %>
                                            </div>
                                        </div>

                                        <label style="color: #f00"><%= FrLgn1 %></label>
                                    </div>
                                    <!-- /.box-body -->
                                </div>

                                    <div class="box-footer">
                                        <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                        <button type="submit" class="btn btn-primary" name="Sbt" id="Sbt" value="Sbt"><%= SmBtn1 %></button>
                                    </div>
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
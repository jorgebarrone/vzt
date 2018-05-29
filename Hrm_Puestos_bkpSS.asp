<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Puestos </title>
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
  <!--<link rel="stylesheet" href="plugins/datatables/media/css/dataTables.bootstrap.css">-->
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'DisOrg0700' and Trd_IdiomaID = '"& Lng &"'  "
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
              Case "SmBtn0"
                SmBtn0  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn2"
                SmBtn2  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case "MsgAl1"
                MsgAl1  = trim(rsTrn("Trd_Texto"))
              Case "BoxHd1"
                BoxHd1  = trim(rsTrn("Trd_Texto"))

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
        SmBtn0 = ""
        SmBtn1 = ""
        SmBtn2 = ""
        FrLgn1 = ""
        MsgAl1 = ""
        BoxHd1 = ""
        Tb1Hd0 = ""
    end if

    Dim Ind
    Dim Bta
    Dim Btm
    Dim Cpy
    Ind = request.Form("Ind")
    Bta = trim(request.Form("BtnAdd"))
    Btm = trim(request.Form("BtnMdf"))
    Cpy = trim(request.Form("Cpy"))

    if Bta = "A" then
        Cpy = request.Form("Cpy")
        Pid = request.Form("Pid")
        Dvi = request.Form("Dvi")
        Dri = request.Form("Dri")
        Aid = request.Form("Aid")
        Jid = request.Form("Jid")
        Nid = request.Form("Nid")
        Pds = request.Form("Pds")
            
        sqlexs = "select Pue_CompaniaID from HRM10210      " & _
                 "where  Pue_CompaniaID  = '" & Cpy & "'   " & _
                 "and    Pue_PuestoID    = '" & Pid & "'   "
        set rs = dbconn.Execute (sqlexs)
        if rs.eof and rs.bof then
            sqlins = "insert into HRM10210                  " & _
                     "values ('" & Cpy & "', '" & Pid & "', " & _
                     "        '" & Dvi & "', '" & Dri & "', " & _
                     "        '" & Aid & "', '" & Jid & "', " & _
                     "        '" & Nid & "', '" & Pds & "') "
            set rsi = dbconn.Execute (sqlins)
        end if
     end if

     if Btm = "M" then
	    for e = 1 to Ind
		    if request.Form("elm"&e) = "on" then
	 		    sqldel = "delete from HRM10210                                      " & _
			  		     "where Pue_CompaniaID  = '" & Request.Form("Lcpy"&e) & "'  " & _
			  		     "and   Pue_PuestoID    = '" & Request.Form("Ldid"&e) & "'  "
     		    set rs = dbconn.Execute (sqldel)
                'response.write(sqldel)
   		    end if
	    next
    end if
    %>

    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">

        <!-- CONTENIDO PRINCIPAL Inicio -->

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

                        <!-- Listado de Puestos Registrados -->
                        <div class="tab-pane active" id="activos" >
                            <div class="box box-primary">
                                
                                
                                
                                <div class="box-header">
                                    <h3 class="box-title"><%= BoxHd1 %></h3>
                                </div>
                                <div class="box-body">
                                    <table id="example2" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th><%= Tb1Hd3 %></th>
                                                <th><%= Tb1Hd4 %></th>
                                            </tr>
                                        </thead>


                                    </table>
                                </div>



                            </div>
                        </div>



                        <!-- Agregar Puestos -->
                        <div class="tab-pane" id="agregar" >
                            <form action="Hrm_Puestos.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
                                <div class="box box-success">
                                    <!-- form start -->
                                    <div class="box-body">
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Cpy"><%= Fr1Lb1 %></label>
                                                    <select class="form-control" size="1" id="Cpy" name="Cpy" required>
                                                        <option class="form-control" value=""><%= Fr1Ph1 %></option>
                                                        <%
                                                        sqlCpy = "select Cpy_CompaniaID, Cpy_RazonSocial from HRM10201 where Cpy_Tipo = '2' order by Cpy_RazonSocial   "
                                                        set rsc = dbconn.execute(sqlCpy)
                                                        'response.write(sqlCpy)
                                                        if not rsc.eof and not rsc.bof then
                                                            do while not rsc.eof
                                                                %>
                                                                <option class="form-control" value="<%= trim(rsc("Cpy_CompaniaID")) %>" >
                                                                    <%= (trim(rsc("Cpy_CompaniaID") & " - " & rsc("Cpy_RazonSocial"))) %>
                                                                </option>
                                                                <%
                                                                rsc.moveNext
                                                            loop
                                                        end if
                                                        rsc.close
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Pid"><%= Fr1Lb2 %></label>
                                                    <input type="text" class="form-control" id="Pid" name="Pid" placeholder="<%= Fr1Ph2 %>" maxlength="20" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Dvi"><%= Fr1Lb3 %></label>
                                                    <select class="form-control" size="1" id="Dvi" name="Dvi" required>
                                                        <option class="form-control" value=""><%= Fr1Ph3 %></option>
                                                        <%
                                                        sqlDiv = "select * from HRM10202 order by Div_Descripcion   "
                                                        set rsDv = dbconn.execute(sqlDiv)
                                                        'response.write(sqlDiv)
                                                        if not rsDv.eof and not rsDv.bof then
                                                            do while not rsDv.eof
                                                                %>
                                                                <option class="form-control" value="<%= trim(rsDv("Div_DivisionID")) %>" >
                                                                    <%= (trim(rsDv("Div_DivisionID") & " - " & rsDv("Div_Descripcion"))) %>
                                                                </option>
                                                                <%
                                                                rsDv.moveNext
                                                            loop
                                                        end if
                                                        rsDv.close
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Dri"><%= Fr1Lb4 %></label>
                                                    <select class="form-control" size="1" id="Dri" name="Dri" required>
                                                        <option class="form-control" value=""><%= Fr1Ph4 %></option>
                                                        <%
                                                        sqlDir = "select * from HRM10203 order by Dir_Descripcion   "
                                                        set rsDr = dbconn.execute(sqlDir)
                                                        'response.write(sqlDir)
                                                        if not rsDr.eof and not rsDr.bof then
                                                            do while not rsDr.eof
                                                                %>
                                                                <option class="form-control" value="<%= trim(rsDr("Dir_DireccionID")) %>" >
                                                                    <%= (trim(rsDr("Dir_DireccionID") & " - " & rsDr("Dir_Descripcion"))) %>
                                                                </option>
                                                                <%
                                                                rsDr.moveNext
                                                            loop
                                                        end if
                                                        rsDr.close
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Aid"><%= Fr1Lb5 %></label>
                                                    <select class="form-control" size="1" id="Aid" name="Aid" required>
                                                        <option class="form-control" value=""><%= Fr1Ph5 %></option>
                                                        <%
                                                        sqlAre = "select * from HRM10204 order by Are_Descripcion   "
                                                        set rsAr = dbconn.execute(sqlAre)
                                                        'response.write(sqlAre)
                                                        if not rsAr.eof and not rsAr.bof then
                                                            do while not rsAr.eof
                                                                %>
                                                                <option class="form-control" value="<%= trim(rsAr("Are_AreaID")) %>" >
                                                                    <%= (trim(rsAr("Are_AreaID") & " - " & rsAr("Are_Descripcion"))) %>
                                                                </option>
                                                                <%
                                                                rsAr.moveNext
                                                            loop
                                                        end if
                                                        rsAr.close
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Jid"><%= Fr1Lb6 %></label>
                                                    <select class="form-control" size="1" id="Jid" name="Jid" required>
                                                        <option class="form-control" value=""><%= Fr1Ph6 %></option>
                                                        <%
                                                        sqlJer = "select * from HRM10205 order by Jer_Descripcion   "
                                                        set rsJr = dbconn.execute(sqlJer)
                                                        'response.write(sqlJer)
                                                        if not rsJr.eof and not rsJr.bof then
                                                            do while not rsJr.eof
                                                                %>
                                                                <option class="form-control" value="<%= trim(rsJr("Jer_JerarquiaID")) %>" >
                                                                    <%= (trim(rsJr("Jer_JerarquiaID") & " - " & rsJr("Jer_Descripcion"))) %>
                                                                </option>
                                                                <%
                                                                rsJr.moveNext
                                                            loop
                                                        end if
                                                        rsJr.close
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label for="Nid"><%= Fr1Lb7 %></label>
                                                    <select class="form-control" size="1" id="Nid" name="Nid" required>
                                                        <option class="form-control" value=""><%= Fr1Ph7 %></option>
                                                        <%
                                                        sqlNiv = "select * from HRM10206 order by Nvl_Descripcion   "
                                                        set rsNv = dbconn.execute(sqlNiv)
                                                        'response.write(sqlNiv)
                                                        if not rsNv.eof and not rsNv.bof then
                                                            do while not rsNv.eof
                                                                %>
                                                                <option class="form-control" value="<%= trim(rsNv("Nvl_NivelID")) %>" >
                                                                    <%= (trim(rsNv("Nvl_NivelID") & " - " & rsNv("Nvl_Descripcion"))) %>
                                                                </option>
                                                                <%
                                                                rsNv.moveNext
                                                            loop
                                                        end if
                                                        rsNv.close
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label style="color: #f00">* &nbsp;</label><label for="Pds"><%= Fr1Lb8 %></label>
                                            <textarea name="Pds" id="Pds" rows="2" class="form-control" required><%= Fr1Ph8 %></textarea>
                                        </div>
                                        <div class="box-footer" style="text-align: center">
                                            <button type="submit" class="btn btn-primary" name="BtnAdd" id="BtnAdd" value="A"><%= SmBtn1 %></button>
                                        </div>
                    
                                        <label style="color: #f00"><%= FrLgn1 %></label>
                    
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <!-- CONTENIDO PRINCIPAL Fin -->

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
<!--<script src="plugins/datatables/media/js/jquery.dataTables.min.js"></script>-->
<!--<script src="plugins/datatables/media/js/dataTables.bootstrap.min.js"></script>-->
<!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
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
    $("#example1").DataTable();
    $('#example2').DataTable({
      "processing": true,
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

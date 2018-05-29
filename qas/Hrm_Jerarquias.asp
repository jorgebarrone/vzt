<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Jerarquias </title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'DisOrg0500' and Trd_IdiomaID = '"& Lng &"'  "
    
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
    Ind = request.Form("Ind")
    Bta = trim(request.Form("BtnAdd"))
    Btm = trim(request.Form("BtnMdf"))

    if Bta = "A" then
        Cpy = request.Form("Cpy")
        Did = request.Form("Did")
        Ddv = request.Form("Ddv")
            
        sqlexs = "select Jer_CompaniaID from HRM10205      " & _
                 "where  Jer_CompaniaID  = '" & Cpy & "'   " & _
                 "and    Jer_JerarquiaID = '" & Did & "'   "
        set rs = dbconn.Execute (sqlexs)
        if rs.eof and rs.bof then
            sqlins = "insert into HRM10205                  " & _
                     "values ('" & Cpy & "', '" & Did & "', " & _
                     "        '" & Ddv & "')                "
            set rsi = dbconn.Execute (sqlins)
        end if
     end if

     if Btm = "M" then
	    for e = 1 to Ind
		    if request.Form("elm"&e) = "on" then
	 		    sqldel = "delete from HRM10205                                      " & _
			  		     "where Jer_CompaniaID  = '" & Request.Form("Lcpy"&e) & "'  " & _
			  		     "and   Jer_JerarquiaID = '" & Request.Form("Ldid"&e) & "'  "
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

        <!-- Agregar Divisiones -->
        <form action="Hrm_Jerarquias.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
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
                                    sqlCpy = "select Cpy_CompaniaID, Cpy_RazonSocial from HRM10201 order by Cpy_RazonSocial   "
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
                                <label style="color: #f00">* &nbsp;</label><label for="Did"><%= Fr1Lb2 %></label>
                                <input type="text" class="form-control" id="Did" name="Did" placeholder="<%= Fr1Ph2 %>" maxlength="20" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label for="Ddv"><%= Fr1Lb3 %></label>
                                <input type="text" class="form-control" id="Ddv" name="Ddv" placeholder="<%= Fr1Ph3 %>" maxlength="90" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label>&nbsp;</label>
                                <br/>
                                <button type="submit" class="btn btn-primary" name="BtnAdd" id="BtnAdd" value="A"><%= SmBtn1 %></button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4">
                        <label style="color: #f00"><%= FrLgn1 %></label>
                    </div>
                    
                </div>
                <!-- /.box-body -->
            </div>
        </form>

        <%
        sqlLis = "select a.*,  b.Cpy_RazonSocial             " & _
                 "from HRM10205 a, HRM10201 b                " & _
                 "where a.Jer_CompaniaID = b.Cpy_CompaniaID  " & _
                 "order by a.Jer_CompaniaID                  "
            
        set rs = dbconn.Execute(sqlLis)
        'response.write(sqlLis)
        if not rs.bof and not rs.eof then
            %>
            <form action="Hrm_Jerarquias.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form2" method="post">
                <div class="box box-primary">
                    <div class="box-header">
                      <h3 class="box-title"><%= BoxHd1 %></h3>
                    </div>
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th><%= Tb1Hd1 %></th>
                                    <th><%= Tb1Hd2 %></th>
                                    <th><%= Tb1Hd3 %></th>
                                    <th><%= Tb1Hd4 %></th>
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
                                            <input type="hidden" name="<%= "Lcpy"&i %>" id="<%= "Lcpy"&i %>" value="<%= trim(rs("Jer_CompaniaID")) %>" />
                                            <input type="hidden" name="<%= "Ldid"&i %>" id="<%= "Ldid"&i %>" value="<%= trim(rs("Jer_JerarquiaID")) %>" />
                                            <%= trim(rs("Jer_CompaniaID")) %>
                                        </td>
                                        <td><%= trim(rs("Cpy_RazonSocial")) %></td>
                                        <td><%= trim(rs("Jer_JerarquiaID")) %></td>
                                        <td><%= trim(rs("Jer_Descripcion")) %></td>
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
                            <button type="submit" class="btn btn-primary" style="background-color: red " name="BtnMdf" id="BtnMdf" value="M"><%= SmBtn2 %></button>
                        </div>
                    </div>
                </div>
            </form>
            <%
            rs.close
            set rs = Nothing
        end if
        %>

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

</body>
</html>

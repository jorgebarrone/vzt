<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | WorkFlows Alta de Actividades - (Reclutamiento) </title>
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
  sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'RecSel0201' and Trd_IdiomaID = '"& Lng &"'  "

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

            Case "BoxHd1"
              BoxHd1 = trim(rsTrn("Trd_Texto"))
            Case "SmBtn1"
              SmBtn1  = trim(rsTrn("Trd_Texto"))
            Case "SmBtn2"
              SmBtn2  = trim(rsTrn("Trd_Texto"))
            Case "FrLgn1"
              FrLgn1  = trim(rsTrn("Trd_Texto"))
             Case else
              Tb1Hd0 = trim(rsTrn("Trd_Texto"))
          End Select
          rsTrn.movenext
      loop
  else
      TitPri = ""
      SubTit = ""
      Tb1Hd1 = ""
      Tb1Hd2 = ""
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
      Tb1Hd1 = ""
      Tb1Hd2 = ""
      Tb1Hd3 = ""
      Tb1Hd4 = ""
      Tb1Hd5 = ""
      BoxHd1 = ""
      SmBtn1 = ""
      SmBtn2 = ""
      FrLgn1 = ""
      Tb1Hd0 = ""
  end if

  '<!-- Alta de Registros (inicio) -->
  Dim Wfi
  Dim Ind
  Dim Bta
  Dim Btm
  Wfi = trim(Request.QueryString("Wfi"))
  Ind = request.Form("Ind")
  Bta = trim(request.Form("BtnAdd"))
  Btm = trim(request.Form("BtnMdf"))

  if Wfi = "" then
      Wfi = trim(Request.Form("Wfi"))
  end if

  if Bta = "A" then
      Nid = Request.Form("Nid")
      Rid = trim(Request.Form("Rid"))
      Aid = trim(Request.Form("Aid"))
      Cob = trim(Request.Form("Cob"))
      sqlptd = "select isnull(max(Dwf_Partida), 0) as ptd  " & _
               "from HRM10151                              " & _
               "where Dwf_ModuloID = 'RecSel'              " & _
               "and   Dwf_UserID   = '"& Uid &"'           " & _
               "and   Dwf_Nombre   = '"& Wfi &"'           "
      set rsptd = dbconn.execute(sqlptd)
      if not rsptd.eof and not rsptd.bof then
          ptd = cint(rsptd("ptd")) + 1
      else
          ptd = 1
      end if
      sqlins = "insert into HRM10151  " & _
               "values ('RecSel',     " & _
               "        '"& Uid &"',  " & _
               "        '"& Wfi &"',  " & _
               "         "& ptd &",   " & _
               "        '"& Nid &"',  " & _
               "        '"& Rid &"',  " & _
               "        '"& Aid &"',  " & _
               "        '"& Cob &"')  "
      'response.write(sqlins)
      set rsi = dbconn.execute(sqlins)
  end if

  if Btm = "M" then
      for e = 1 to Ind
          if request.Form("elm"&e) = "on" then
              sqldel = "delete from HRM10151                                   " & _
                       "where Dwf_ModuloID = 'RecSel'                          " & _
                       "and   Dwf_UserID   = '"& Uid &"'                       " & _
                       "and   Dwf_Nombre   = '"& Wfi &"'                       " & _
                       "and   Dwf_Partida  =  "& Request.Form("Lpti"&e) &"     "
              set rs = dbconn.Execute (sqldel)
              'response.write(sqldel)
   		  end if
	  next
      sqlnum = "select Dwf_Partida from HRM10151      " & _
               "where Dwf_ModuloID = 'RecSel'         " & _
               "and   Dwf_UserID   = '"& Uid &"'      " & _
               "and   Dwf_Nombre   = '"& Wfi &"'      " & _
               "order by Dwf_Partida                  "
      set rsnum = dbconn.execute(sqlnum)
      if not rsnum.eof and not rsnum.bof then
          ptd = 0
          do while not rsnum.eof
              ptd = ptd + 1
              sqlupd = "update HRM10151                                   " & _
                       "set   Dwf_Partida  =  "& ptd &"                   " & _
                       "where Dwf_ModuloID = 'RecSel'                     " & _
                       "and   Dwf_UserID   = '"& Uid &"'                  " & _
                       "and   Dwf_Nombre   = '"& Wfi &"'                  " & _
                       "and   Dwf_Partida  =  "& rsnum("Dwf_Partida") &"  "
              set rsupd = dbconn.execute(sqlupd)
              rsnum.movenext
          loop
          rsnum.close
          set rsnum = Nothing
      end if
  end if
  '<!-- Alta de Registros (fin) -->

  %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL - Inicio -->
        <!-- Agregar Actividades -->
        <div class="box box-success">
            <form action="Hrm_DefWF1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">

                <!-- form start -->
                <div class="box-body">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <input type="hidden" name="Wfi" id="Wfi" value="<%= Wfi %>" />
                                <label><%= Fr1Lb1 %></label></br><%= Wfi %>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb2 %></label>
                                <input type="number" class="form-control" name="Nid" id="Nid" placeholder="<%= Fr1Ph2 %>" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb3 %></label>
                                <select class="form-control" size="1" id="Rid" name="Rid" required>
                                    <option class="form-control" value=""><%= Fr1Ph3 %></option>
                                    <%
                                    sqlR = "select Emp_EmpleadoID, Emp_NombreCompleto from HRM10220 order by Emp_NombreCompleto   "
                                    set rsR = dbconn.execute(sqlR)
                                    'response.write(sqlR)
                                    if not rsR.eof and not rsR.bof then
                                        do while not rsR.eof
                                            if trim(rsR("Emp_EmpleadoID")) = Rid then
                                                %>
                                                <option class="form-control" value="<%= trim(rsR("Emp_EmpleadoID")) %>" selected >
                                                    <%= trim(rsR("Emp_NombreCompleto")) %>
                                                </option>
                                                <%
                                            else
                                                %>
                                                <option class="form-control" value="<%= trim(rsR("Emp_EmpleadoID")) %>" >
                                                    <%= trim(rsR("Emp_NombreCompleto")) %>
                                                </option>
                                                <%
                                            end if
                                            rsR.moveNext
                                        loop
                                    end if
                                    rsR.close
                                    set rsR = Nothing
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb4 %></label>
                                <input type="text" class="form-control" name="Aid" id="Aid" placeholder="<%= Fr1Ph4 %>" required />
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label><%= Fr1Lb5 %></label>
                        <textarea name="Cob" id="Cob" rows="2" class="form-control" placeholder="<%= Fr1Ph5 %>" ></textarea>
                    </div>
                    <label style="color: #f00"><%= FrLgn1 %></label>
                    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary" name="BtnAdd" id="BtnAdd" value="A"><%= SmBtn1 %></button>
                    </div>

                </div>
                <!-- /.box-body -->
            </form>
        </div>
        <%
        sqlLis = "select a.*, b.Emp_NombreCompleto          " & _
                 "from HRM10151 a, HRM10220 b               " & _
                 "where a.Dwf_EmpleadoID = b.Emp_EmpleadoID " & _
                 "and   a.Dwf_ModuloID = 'RecSel'           " & _
                 "and   a.Dwf_UserID   = '"& Uid &"'        " & _
                 "and   a.Dwf_Nombre   = '"& Wfi &"'        " & _
                 "order by a.Dwf_Partida                    "
        set rs = dbconn.Execute(sqlLis)
        'response.write(sqlLis)
        if not rs.bof and not rs.eof then
            %>
            <div class="box box-primary">
                <form action="Hrm_DefWF1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form2" method="post">
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
                                    <th><%= Tb1Hd5 %></th>
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
                                            <input type="hidden" name="<%= "Lpti"&i %>" id="<%= "Lpti"&i %>" value="<%= trim(rs("Dwf_Partida")) %>" />
                                            <%= trim(rs("Dwf_Partida")) %>
                                        </td>
                                        <td>
                                            <%= trim(rs("Dwf_Nivel")) %>
                                        </td>
                                        <td>
                                            <%= trim(rs("Emp_NombreCompleto")) %>
                                        </td>
                                        <td>
                                            <%= trim(rs("Dwf_Descripcion")) %>
                                        </td>
                                        <td>
                                            <%= trim(rs("Dwf_Observaciones")) %>
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
                            <input type="hidden" name="Wfi" id="Wfi" value="<%= Wfi %>" />
                            <button type="submit" class="btn btn-primary" style="background-color: red " name="BtnMdf" id="BtnMdf" value="M"><%= SmBtn2 %></button>
                        </div>
                    </div>
                </form>
            </div>
            <%
            rs.close
            set rs = Nothing
        end if
        %>
        <!-- CONTENIDO PRINCIPAL - Fin -->

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
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "bProcessing": true,
      "bDeferRender": true,
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

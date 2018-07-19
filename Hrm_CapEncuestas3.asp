<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>HRM Verzatec | Capacitacion Encuestas - Asignacion de Puestos</title>
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
  <!-- Content Header (Page header) -->
  <%
  sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'CnfGrl0200' and Trd_IdiomaID = '"& Lng &"'  "

  set rsTrn = dbconn.execute(sqlTrn)
  if not rsTrn.eof and not rsTrn.bof then
      dim Elm
      do while not rsTrn.eof
          Elm = trim(rsTrn("Trd_ElementoID"))
          Select Case Elm
            Case "TitSec"
              TitSec = trim(rsTrn("Trd_Texto"))
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

            Case "Fr1Sb1"
              Fr1Sb1  = trim(rsTrn("Trd_Texto"))
            Case "Fr1Sb2"
              Fr1Sb2  = trim(rsTrn("Trd_Texto"))
            Case "Fr1Sb4"
              Fr1Sb4  = trim(rsTrn("Trd_Texto"))
            Case "Fr1Sb5"
              TitCrt  = trim(rsTrn("Trd_Texto"))
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
  Dim Sci
  Dim Ten
  Dim Dsc
  Sci = trim(Request.QueryString("Sci"))
  Ten = trim(Request.QueryString("Ten"))
  Dsc = trim(Request.QueryString("Dsc"))

  if Sci = "" then
      Sci = trim(Request.Form("Sci"))
      Ten = trim(Request.Form("Ten"))
      Dsc = trim(Request.Form("Dsc"))
      Tid = trim(Request.Form("Tid"))
  else
      Tid = ""
  end if

  Dim Ind
  Dim Bta
  Dim Btm
  Dim Lid
  Dim Nid
  Ind = request.Form("Ind")
  Bta = trim(request.Form("BtnAdd"))
  Btm = trim(request.Form("BtnMdf"))
  Lid = trim(request.Form("Lid"))
  Nid = request.Form("Nid")

  if Bta = "A" then
      ' sqlptd = "select isnull(max(Scp_ReactivoID), 0) as ptd            " & _
      '          "from HRM10353                                           " & _
      '          "where Scp_ScriptID = '"& trim(Request.Form("Sci")) &"'  "
      ' set rsptd = dbconn.execute(sqlptd)
      ' if not rsptd.eof and not rsptd.bof then
      '     ptd = cint(rsptd("ptd")) + 1
      ' else
      '     ptd = 1
      ' end if
      sqlins = "insert into HRM10353                        " & _
               "values ('"& trim(request.form("Sci")) &"',  " & _
               "        '"& trim(request.form("Tid")) &"',  " & _
               "         "& Nid &",                         " & _
               "        '"& Lid &"',                        " & _
               "        '"& trim(request.form("Rds")) &"')  "
'      response.write(sqlins)
      set rsi = dbconn.execute(sqlins)
  end if

  if Btm = "M" then
      for e = 1 to Ind
          if request.Form("elm"&e) = "on" then
              sqldel = "delete from HRM10353                                   " & _
                       "where Scp_ScriptID   = '"& Request.Form("Lsci"&e) &"'  " & _
                       "and   Scp_LngID      = '"& Request.Form("Llng"&e) &"'  " & _
                       "and   Scp_ReactivoID =  "& Request.Form("Lrei"&e) &"   "
              set rs = dbconn.Execute (sqldel)
              sqldel = "delete from HRM10354                                   " & _
                       "where Scr_ScriptID   = '"& Request.Form("Lsci"&e) &"'  " & _
                       "and   Scr_LngID      = '"& Request.Form("Llng"&e) &"'  " & _
                       "and   Scr_ReactivoID =  "& Request.Form("Lrei"&e) &"   "
              set rs = dbconn.Execute (sqldel)
              'response.write(sqldel)
        end if
    next
      ' sqlnum = "select Scp_ReactivoID from HRM10353 where Scp_ScriptID = '"& Request.Form("Sci") &"' order by Scp_ReactivoID "
      ' set rsnum = dbconn.execute(sqlnum)
      ' if not rsnum.eof and not rsnum.bof then
      '     ptd = 0
      '     do while not rsnum.eof
      '         ptd = ptd + 1
      '         sqlupd = "update HRM10353                                         " & _
      '                  "set   Scp_ReactivoID =  "& ptd                     &"   " & _
      '                  "where Scp_ScriptID   = '"& Request.Form("Sci")     &"'  " &_
      '                  "and   Scp_ReactivoID =  "& rsnum("Scp_ReactivoID") &"   " & _
      '         set rsupd = dbconn.execute(sqlupd)
      '         rsnum.movenext
      '     loop
      '     rsnum.close
      '     set rsnum = Nothing
      ' end if
  end if
    '<!-- Alta de Registros (fin) -->
  %>


  <% SubTit = " - " & Dsc %>
  <% call hdr(TitCrt, SubTit) %>

  <!-- Main content -->
  <section class="content">

      <!-- CONTENIDO PRINCIPAL INICIO -->
      <div class="box box-success">
          <form action="Hrm_CapEncuestas3.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
              <!-- form start -->
              <div class="box-body">
                  <div class="row fontawesome-icon-list">
                      <div class="col-md-3 col-sm-4">
                          <div class="form-group">
                              <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                              <input type="hidden" name="Sci" id="Sci" value="<%= Sci %>" />
                              <input type="hidden" name="Ten" id="Ten" value="<%= Ten %>" />
                              <input type="text" class="form-control" name="Scid" id="Scid" placeholder="<%= Fr1Ph1 %>" value="<%= Sci & " - " & Dsc %>" maxlength="50" disabled />
                          </div>
                      </div>
                      <div class="col-md-3 col-sm-4">
                          <div class="form-group">
                              <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb4 %></label>
                              <select class="form-control" size="1" id="Tid" name="Tid" required>
                                  <option class="form-control" value=""><%= Fr1Ph4 %></option>
                                  <%
                                  sqlT = "select * from HRM10352 order by Sct_TemaID, Sct_Descripcion   "
                                  set rsT = dbconn.execute(sqlT)
                                  'response.write(sqlT)
                                  if not rsT.eof and not rsT.bof then
                                      do while not rsT.eof
                                          if trim(rsT("Sct_TemaID")) = Tid then
                                              %>
                                              <option class="form-control" value="<%= trim(rsT("Sct_TemaID")) %>" selected >
                                                  <%= trim(rsT("Sct_TemaID")) & " - " & trim(rsT("Sct_Descripcion")) %>
                                              </option>
                                              <%
                                          else
                                              %>
                                              <option class="form-control" value="<%= trim(rsT("Sct_TemaID")) %>" >
                                                  <%=  trim(rsT("Sct_TemaID")) & " - " & trim(rsT("Sct_Descripcion")) %>
                                              </option>
                                              <%
                                          end if
                                          rsT.moveNext
                                      loop
                                  end if
                                  rsT.close
                                  set rsT = Nothing
                                  %>
                              </select>
                          </div>
                      </div>

                      <div class="col-md-3 col-sm-4">
                          <div class="form-group">
                              <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb5 %></label>
                              <select class="form-control" size="1" id="Lid" name="Lid" required>
                                  <option class="form-control" value=""><%= Fr1Ph5 %></option>
                                  <%
                                  sqlLid = "select * from HRM10001 order by Idm_Descripcion "
                                  set rsLid = dbconn.execute(sqlLid)
                                  if not rsLid.eof and not rsLid.bof then
                                      do while not rsLid.eof
                                          %>
                                          <option class="form-control" value="<%= trim(rsLid("Idm_IdiomaID")) %>"><%= trim(rsLid("Idm_Descripcion")) %></option>
                                          <%
                                          rsLid.movenext
                                      loop
                                      rsLid.close
                                      set rsLid = Nothing
                                  end if
                                  %>
                              </select>
                          </div>
                      </div>

                      <div class="col-md-3 col-sm-4">
                          <div class="form-group">
                              <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb6 %></label>
                              <input class="form-control" type="number" min="0" name="Nid" id="Nid" required />
                          </div>
                      </div>

                      <div class="col-md-3 col-sm-4">
                          <div class="form-group">
                              <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb7 %></label>
                              <input type="text" class="form-control" name="Rds" id="Rds" placeholder="<%= Fr1Ph7 %>" maxlength="300" required />
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
              <!-- /.box-body -->
          </form>
      </div>
      <%
      sqlLis = "select r.*, t.Sct_Descripcion        " & _
               "from HRM10353 r, HRM10352 t          " & _
               "where r.Scp_TemaID   = t.Sct_TemaID  " & _
               "and   r.Scp_LngID    = t.Sct_LngID   " & _
               "and   r.Scp_ScriptID = '"& Sci &"'   "
      set rs = dbconn.Execute(sqlLis)
      'response.write(sqlLis)
      if not rs.bof and not rs.eof then
          %>
          <div class="box box-primary">
              <form action="Hrm_CapEncuestas1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form2" method="post">
                  <div class="box-header">
                      <h3 class="box-title"><%= Fr1Lg2 %></h3>
                  </div>
                  <div class="box-body">
                      <table id="example1" class="table table-bordered table-striped">
                          <thead>
                              <tr>
                                  <th><%= Fr1Lb6 %></th>
                                  <th><%= Fr1Lb4 %></th>
                                  <th><%= Fr1Lb5 %></th>
                                  <th><%= Fr1Lb7 %></th>
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
                                          <input type="hidden" name="<%= "Lsci"&i %>" id="<%= "Lsci"&i %>" value="<%= trim(rs("Scp_ScriptID")) %>" />
                                          <input type="hidden" name="<%= "Llng"&i %>" id="<%= "Llng"&i %>" value="<%= trim(rs("Scp_LngID")) %>" />
                                          <input type="hidden" name="<%= "Lrei"&i %>" id="<%= "Lrei"&i %>" value="<%= trim(rs("Scp_ReactivoID")) %>" />
                                          <%= trim(rs("Scp_ReactivoID")) %>
                                      </td>
                                      <td>
                                          <%= trim(rs("Sct_Descripcion")) %>
                                      </td>
                                      <td>
                                          <%= trim(rs("Scp_LngID")) %>
                                      </td>
                                      <td>
                                          <%= trim(rs("Scp_Pregunta")) %>
                                      </td>
                                      <td>
                                          <a href="Hrm_CapEncuestas2.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sci=" & trim(rs("Scp_ScriptID")) & "&Dsc=" & Dsc & "&Sri=" & trim(rs("Scp_ReactivoID")) %>" target="_blank">
                                              <%= Fr1Sb4 %>
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
                          <input type="hidden" name="Sci" id="Sci" value="<%= Sci %>" />
                          <input type="hidden" name="Tid" id="Tid" value="<%= Tid %>" />
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

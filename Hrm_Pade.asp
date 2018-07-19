<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Alta de Procesos PADE</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0050' and Trd_IdiomaID = '"& Lng &"'  "

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
              Case "BxHd01"
                BxHd01 = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02 = trim(rsTrn("Trd_Texto"))
              Case "DsEstI"
                DsEstI = trim(rsTrn("Trd_Texto"))
              Case "DsEstA"
                DsEstA = trim(rsTrn("Trd_Texto"))
              Case "DsEstC"
                DsEstC = trim(rsTrn("Trd_Texto"))
              Case "Tb1Lb1"
                Tb1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Lb2"
                Tb1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Lb3"
                Tb1Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Lb4"
                Tb1Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Lb5"
                Tb1Lb5 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Lb6"
                Tb1Lb6 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Lb7"
                Tb1Lb7 = trim(rsTrn("Trd_Texto"))
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
        Tb1Hd1 = ""
        Tb1Hd2 = ""
        Tb1Hd3 = ""
        Tb1Hd4 = ""
        Fr1Lb1 = ""
        Fr1Ph1 = ""
        Fr1Lb2 = ""
        Fr1Ph2 = ""
        DsEstI = ""
        DsEstA = ""
        DsEstC = ""
        Tb1Lb1 = ""
        Tb1Lb2 = ""
        Tb1Lb3 = ""
        Tb1Lb4 = ""
        Tb1Lb5 = ""
        Tb1Lb6 = ""
        SmBtn1 = ""
        FrLgn1 = ""
        MsgAl1 = ""
        Tb1Hd0 = ""
    end if

    '<!-- Alta de Registros (inicio) -->
    Sbt = trim(request.form("Sbt"))
    if Sbt > "" then
        sqlval = "select Pde_Ejercicio from HRM10500                        " & _
                 "where  Pde_Ejercicio = "& trim(request.form("Ejr")) &"    "
        set rsv = dbconn.execute(sqlval)
        if not rsv.eof and not rsv.bof then
            sqlvl1 = "select Pde_Ejercicio from HRMA0500                         " & _
                     "where  Pde_Ejercicio =  "& trim(request.form("Ejr")) &"    " & _
                     "and    Pde_IdiomaID  = '"& trim(request.form("Lid")) &"'   "
            set rsv1 = dbconn.execute(sqlvl1)
            if not rsv1.bof and not rsv1.eof then
                sqlupd = "update HRMA0500                                            " & _
                         "set   Pde_Descripcion = '"& trim(request.form("Dsc")) &"'  " & _
                         "where Pde_Ejercicio   =  "& trim(request.form("Ejr")) &"   " & _
                         "and   Pde_IdiomaID    = '"& trim(request.form("Lid")) &"'  "
                set rsu = dbconn.execute(sqlupd)
            else
                sqlins = "insert into HRMA0500                        " & _
                         "values ( "& trim(request.form("Ejr")) &" ,  " & _
                         "        '"& trim(request.form("Lid")) &"',  " & _
                         "        '"& trim(request.form("Dsc")) &"')                                "
                set rsi = dbconn.execute(sqlins)
            end if
        else
            sqlins = "insert into HRM10500                        " & _
                     "values ( "& trim(request.form("Ejr")) &" ,  " & _
                     "        'I')                                "
            set rsi = dbconn.execute(sqlins)
            sqlins = "insert into HRMA0500                        " & _
                     "values ( "& trim(request.form("Ejr")) &" ,  " & _
                     "        '"& trim(request.form("Lid")) &"',  " & _
                     "        '"& trim(request.form("Dsc")) &"')                                "
            set rsi = dbconn.execute(sqlins)
            sqlcmd = "exec HRM_PADE_Semaforos  " & trim(request.form("Ejr"))
            Set rsp = dbconn.execute(sqlcmd)
        end if
    end if
    '<!-- Alta de Registros (fin) -->

    %>
    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <div class="box box-success">
            <form action="Hrm_Pade.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
                <div class="box-header with-border">
                    <h3 class="box-title"><%= BxHd01 %></h3>
                </div>
                <!-- form start -->
                <div class="box-body">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                                <input type="number" class="form-control" id="Ejr" name="Ejr" placeholder="<%= Fr1Ph1 %>" maxlength="4" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb2 %></label>
                                <input type="text" class="form-control" id="Dsc" name="Dsc" placeholder="<%= Fr1Ph2 %>" maxlength="100" required />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb3 %></label>
                                <select class="form-control" size="1" id="Lid" name="Lid" required>
                                    <option class="form-control" value=""><%= Fr1Ph3 %></option>
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
                                <label style="color: #f00"><%= FrLgn1 %></label>
                                <br/>
                                <button type="submit" class="btn btn-primary" name="Sbt" id="Sbt" value="A"><%= SmBtn1 %></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </form>

            <form action="#" name="form2" method="post">
                <div class="box box-primary">
                    <div class="box-header">
                      <h3 class="box-title"><%= BxHd02 %></h3>
                    </div>
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
                                sqllis = "select a.Pde_Ejercicio,  a.Pde_Estatus, " & _
                                         "       b.Pde_Descripcion                " & _
                                         "from HRM10500 a left outer join         " & _
                                         "     HRMA0500 b                         " & _
                                         "on  a.Pde_Ejercicio = b.Pde_Ejercicio   " & _
                                         "and b.Pde_IdiomaID  = '"& Lng &"'       "
                                set rsl = dbconn.execute(sqllis)
                                if not rsl.bof and not rsl.eof then
                                    do while not rsl.eof
                                        select case rsl("Pde_Estatus")
                                            case "I" estatus = DsEstI
                                            case "A" estatus = DsEstA
                                            case "C" estatus = DsEstC
                                        end select
                                        %>
                                        <tr>
                                            <td><a href="#"><%= rsl("Pde_Ejercicio") %></a></td>
                                            <td><a href="#"><%= trim(rsl("Pde_Descripcion")) %></a></td>
                                            <td><a href="#"><%= estatus %></a></td>
                                            <td>
                                                <a class="btn btn-app" href="Hrm_PadeFechas.asp?Prm=1&Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Ejr=" & trim(rsl("Pde_Ejercicio")) & "&Dsc=" & trim(rsl("Pde_Descripcion")) %>">
                                                    <i class="fa fa-calendar"></i> <%= Tb1Lb1 %>
                                                </a>
                                                <a class="btn btn-app" href="Hrm_PadeConfEvlEmp.asp?Prm=1&Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Ejr=" & trim(rsl("Pde_Ejercicio")) & "&Dsc=" & trim(rsl("Pde_Descripcion")) %>">
                                                    <i class="fa fa-user"></i> <%= Tb1Lb2 %>
                                                </a>
                                                <a class="btn btn-app" href="Hrm_PadeConfEvlEjc.asp?Prm=1&Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Ejr=" & trim(rsl("Pde_Ejercicio")) & "&Dsc=" & trim(rsl("Pde_Descripcion")) %>">
                                                    <i class="fa fa-suitcase"></i> <%= Tb1Lb3 %>
                                                </a>
                                                <a class="btn btn-app" href="Hrm_PadeConfEnc.asp?Prm=1&Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Ejr=" & trim(rsl("Pde_Ejercicio")) & "&Dsc=" & trim(rsl("Pde_Descripcion")) %>">
                                                    <i class="fa fa-question-circle"></i> <%= Tb1Lb4 %>
                                                </a>
                                                <a class="btn btn-app" href="Hrm_PadeEmpHab.asp?Prm=1&Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Ejr=" & trim(rsl("Pde_Ejercicio")) & "&Dsc=" & trim(rsl("Pde_Descripcion")) %>">
                                                    <i class="fa fa-wrench"></i> <%= Tb1Lb5 %>
                                                </a>
                                                <a class="btn btn-app">
                                                    <i class="fa fa-comments"></i> <%= Tb1Lb6 %>
                                                </a>
<!--
                                                <a class="btn btn-app" href="Hrm_PadeLib.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Ejr=" & trim(rsl("Pde_Ejercicio")) & "&Dsc=" & trim(rsl("Pde_Descripcion")) %>">
                                                    <i class="fa fa-check-circle"></i> <%= Tb1Lb7 %>
                                                </a>
-->
                                            </td>
                                        </tr>
                                        <%
                                        rsl.movenext
                                    loop
                                end if
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
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

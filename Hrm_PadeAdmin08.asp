<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Administrador 08</title>
  <link rel="shortcut icon" href="images/favicon.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">  

  <!-- daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">

  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!--#include file="procedures.asp"-->
  <!--#include file="Hrm_PadeAdmin_Tabs.asp"-->

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
    <% call hdr(TitPri,SubTit) %>

    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0600' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitPri"
                TitDiv = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubDiv = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb2"
                Fr1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph2"
                Fr1Ph2 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1 = trim(rsTrn("Trd_Texto"))
              Case "TbHd01"
                TbHd01 = trim(rsTrn("Trd_Texto"))
              Case "TbHd02"
                TbHd02 = trim(rsTrn("Trd_Texto"))
              Case "TbHd03"
                TbHd03 = trim(rsTrn("Trd_Texto"))
              Case "TbHd04"
                TbHd04 = trim(rsTrn("Trd_Texto"))
              Case "TbHd05"
                TbHd05  = trim(rsTrn("Trd_Texto"))
              Case "TbHd06"
                TbHd06  = trim(rsTrn("Trd_Texto"))
              Case "TbHd07"
                TbHd07  = trim(rsTrn("Trd_Texto"))
              Case "TbHd08"
                TbHd08  = trim(rsTrn("Trd_Texto"))
              Case "TbHd09"
                TbHd09 = trim(rsTrn("Trd_Texto"))
              Case "TbHd10"
                TbHd10 = trim(rsTrn("Trd_Texto"))
              Case "TbHd11"
                TbHd11 = trim(rsTrn("Trd_Texto"))
              Case "TbHd12"
                TbHd12 = trim(rsTrn("Trd_Texto"))
              Case "TbHd13"
                TbHd13  = trim(rsTrn("Trd_Texto"))
              Case "TbHd14"
                TbHd14  = trim(rsTrn("Trd_Texto"))
              Case "TbHd15"
                TbHd15  = trim(rsTrn("Trd_Texto"))
              Case "TbHd16"
                TbHd16  = trim(rsTrn("Trd_Texto"))
              Case "TbHd17"
                TbHd17  = trim(rsTrn("Trd_Texto"))
              Case "TbHd18"
                TbHd18  = trim(rsTrn("Trd_Texto"))
              Case "TbHd19"
                TbHd19  = trim(rsTrn("Trd_Texto"))
              Case "TbHd20"
                TbHd20  = trim(rsTrn("Trd_Texto"))
              Case "BxHd01"
                BxHd01  = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02  = trim(rsTrn("Trd_Texto"))
              Case "BxHd03"
                BxHd03  = trim(rsTrn("Trd_Texto"))
              Case "PrcP01"
                PrcP01  = trim(rsTrn("Trd_Texto"))
              Case "PrcP02"
                PrcP02  = trim(rsTrn("Trd_Texto"))
              Case "PrcP03"
                PrcP03  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    Dim Ejr
    Dim Ent
    Ejr = trim(Request.Form("EjerID"))
    Ent = trim(Request.Form("EntyID"))
    if Ejr = "" then
        Ejr = 0
    end if
    if Ent = "" then
        Ent = 0
    end if

    '<-- Busqueda de Parámetros PADE (Inicio) -->
    if Ejr > 0 then
        sqlEjr = "select a.Pde_Ejercicio,  a.Pde_Estatus, " & _
                 "       b.Pde_Descripcion                " & _
                 "from HRM10500 a left outer join         " & _
                 "     HRMA0500 b                         " & _
                 "on  a.Pde_Ejercicio = b.Pde_Ejercicio   " & _
                 "and b.Pde_IdiomaID  = '"& Lng &"'       " & _
                 "where a.Pde_Estatus = 'A'               "
        set rse = dbconn.execute(sqlEjr)
        if not rse.bof and not rse.eof then
            Dsc    = trim(rse("Pde_Descripcion"))
        else
            Dsc    = ""
        end if
    end if
    %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->

        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <% call MnuTabs() %>
                    </ul>
                    <div class="tab-content">
                        <div class="<%= Pan8St %>" id="main" >
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#Listado" data-toggle="tab"><%= BxHd03 %></a></li>
                                <li><a href="Hrm_PadeAdmin08Xls.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&EjerID=" & Ejr & "&EntyID=" & Ent & "&Sid=" & Sid %>"><%= BxHd02 %></a></li>
                            </ul>
                            
                            <div class="tab-content">

                                <!-- Listado de Movimientos -->
                                <div class="tab-pane active" id="Listado" >


                                    <div class="box box-success">
                                        <form action="Hrm_PadeAdmin08.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=8" & "&Sid=" & Sid %>" name="form1" method="post">
                                            <!-- form start -->
                                            <div class="box-body">
                                                <div class="row fontawesome-icon-list">
                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label><%= Fr1Lb1 %></label>
                                                            <select class="form-control" size="1" id="EjerID" name="EjerID" required>
                                                                <option class="form-control" value=""><%= Fr1Ph1 %></option>
                                                                <%
                                                                sqlEjr = "select distinct(Psm_Ejercicio) as EjerID from HRM10502 order by EjerID desc "
                                                                set rsEjr = dbconn.execute(sqlEjr)
                                                                if not rsEjr.eof and not rsEjr.bof then
                                                                    do while not rsEjr.eof
                                                                        if trim(rsEjr("EjerID")) = Ejr then
                                                                            %>
                                                                            <option class="form-control" value="<%= rsEjr("EjerID") %>" selected><%= rsEjr("EjerID") %></option>
                                                                            <%
                                                                        else
                                                                            %>
                                                                            <option class="form-control" value="<%= rsEjr("EjerID") %>"><%= rsEjr("EjerID") %></option>
                                                                            <%
                                                                        end if
                                                                        rsEjr.movenext
                                                                    loop
                                                                    rsEjr.close
                                                                    set rsEjr = Nothing
                                                                end if
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label><%= Fr1Lb2 %></label>
                                                            <select class="form-control" size="1" id="EntyID" name="EntyID">
                                                                <option class="form-control" value=""><%= Fr1Ph2 %></option>
                                                                <%
                                                                sqlEnt = "select e.Emp_EntidadID, d.DescEntidad              " & _
                                                                         "from HRM10220 e, ORGANIZACION_VZT.dbo.VT_Entidad d " & _
                                                                         "where e.Emp_EntidadID = d.Entidad                  " & _
                                                                         "group by e.Emp_EntidadID, d.DescEntidad            "
                                                                set rsEnt = dbconn.execute(sqlEnt)
                                                                if not rsEnt.eof and not rsEnt.bof then
                                                                    do while not rsEnt.eof
                                                                        if trim(rsEnt("Emp_EntidadID")) = Ent then
                                                                            %>
                                                                            <option class="form-control" value="<%= rsEnt("Emp_EntidadID") %>" selected><%= rsEnt("DescEntidad") %></option>
                                                                            <%
                                                                        else
                                                                            %>
                                                                            <option class="form-control" value="<%= rsEnt("Emp_EntidadID") %>"><%= rsEnt("DescEntidad") %></option>
                                                                            <%
                                                                        end if
                                                                        rsEnt.movenext
                                                                    loop
                                                                    rsEnt.close
                                                                    set rsEnt = Nothing
                                                                end if
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label style="color: #f00">&nbsp;</label>
                                                            <br/>
                                                            <button type="submit" class="btn btn-primary" name="SmBtn1" id="SmBtn1" value="SmBtn1"><%= SmBtn1 %></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.box-body -->
                                        </form>

                                        <div class="box box-primary">
                                            <div class="box-body table-responsive">
                                                <%
                                                if Ejr > 0 then
                                                    if Ent > 0 then
                                                        sqllis = "select a.Ara_Texto,           b.Rta_Texto as TipAcc,     " & _
                                                                 "       c.Rta_Texto as TipPri, d.Rta_Texto as TipAre,     " & _
                                                                 "	     e.Emp_CompaniaID,      e.Emp_EmpleadoID,          " & _
                                                                 "	     e.Emp_NombreCompleto,  v.DescCentroCosto,         " & _
                                                                 "       v.DescEntidad                                     " & _
                                                                 "from HRM10551 a, HRM10550 b, HRM10550 c,                 " & _
                                                                 "     HRM10550 d, HRM10220 e,                             " & _
                                                                 "     ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec v          " & _
                                                                 "where a.Ara_CorporativoID = e.Emp_CorporativoID          " & _
                                                                 "and   a.Ara_CompaniaID    = e.Emp_CompaniaID             " & _
                                                                 "and   a.Ara_EmpleadoID    = e.Emp_EmpleadoID             " & _
                                                                 "and   e.Emp_CompaniaID    = v.EmpresaFuente              " & _
                                                                 "and   e.Emp_EmpleadoID    = v.Empleado                   " & _
                                                                 "and   a.Ara_TipoAccionID  = b.Rta_ClaveID                " & _
                                                                 "and   b.Rta_TipoID        = 1                            " & _
                                                                 "and   b.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                                 "and   a.Ara_PrioridadID   = c.Rta_ClaveID                " & _
                                                                 "and   c.Rta_TipoID        = 2                            " & _
                                                                 "and   c.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                                 "and   a.Ara_TipoAreaID    = d.Rta_ClaveID                " & _
                                                                 "and   d.Rta_TipoID        = 3                            " & _
                                                                 "and   d.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                                 "and   a.Ara_Ejercicio     =  "& Ejr &"                   " & _
                                                                 "and   e.Emp_NominaID      < 10                           " & _
                                                                 "and   e.Emp_CompaniaID IN('2','10','11')                 " & _
                                                                 "and   e.Emp_EntidadID = '"& Ent &"'                      " & _
                                                                 "order by e.Emp_CompaniaID,  v.DescEntidad,               " & _
                                                                 "         v.DescCentroCosto, e.Emp_NombreCompleto         "
                                                    else
                                                        sqllis = "select a.Ara_Texto,           b.Rta_Texto as TipAcc,     " & _
                                                                 "       c.Rta_Texto as TipPri, d.Rta_Texto as TipAre,     " & _
                                                                 "	     e.Emp_CompaniaID,      e.Emp_EmpleadoID,          " & _
                                                                 "	     e.Emp_NombreCompleto,  v.DescCentroCosto,         " & _
                                                                 "       v.DescEntidad                                     " & _
                                                                 "from HRM10551 a, HRM10550 b, HRM10550 c,                 " & _
                                                                 "     HRM10550 d, HRM10220 e,                             " & _
                                                                 "     ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec v          " & _
                                                                 "where a.Ara_CorporativoID = e.Emp_CorporativoID          " & _
                                                                 "and   a.Ara_CompaniaID    = e.Emp_CompaniaID             " & _
                                                                 "and   a.Ara_EmpleadoID    = e.Emp_EmpleadoID             " & _
                                                                 "and   e.Emp_CompaniaID    = v.EmpresaFuente              " & _
                                                                 "and   e.Emp_EmpleadoID    = v.Empleado                   " & _
                                                                 "and   a.Ara_TipoAccionID  = b.Rta_ClaveID                " & _
                                                                 "and   b.Rta_TipoID        = 1                            " & _
                                                                 "and   b.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                                 "and   a.Ara_PrioridadID   = c.Rta_ClaveID                " & _
                                                                 "and   c.Rta_TipoID        = 2                            " & _
                                                                 "and   c.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                                 "and   a.Ara_TipoAreaID    = d.Rta_ClaveID                " & _
                                                                 "and   d.Rta_TipoID        = 3                            " & _
                                                                 "and   d.Rta_IdiomaID      = '"& Lng &"'                  " & _
                                                                 "and   a.Ara_Ejercicio     =  "& Ejr &"                   " & _
                                                                 "and   e.Emp_NominaID      < 10                           " & _
                                                                 "and   e.Emp_CompaniaID IN('2','10','11')                 " & _
                                                                 "order by e.Emp_CompaniaID,  v.DescEntidad,               " & _
                                                                 "         v.DescCentroCosto, e.Emp_NombreCompleto         "
                                                    end if
                                                    'response.write(sqllis)
                                                    set rsl = dbconn.execute(sqllis)
                                                    if not rsl.bof and not rsl.eof then
                                                        %>
                                                        <table id="example1" class="table table-bordered table-striped">
                                                            <thead>
                                                            <tr>
                                                                <th><%= TbHd01 %></th>
                                                                <th><%= TbHd02 %></th>
                                                                <th><%= TbHd03 %></th>
                                                                <th><%= Fr1Lb2 %></th>
                                                                <th><%= TbHd17 %></th>
                                                                <th><%= BxHd03 %></th>
                                                                <th><%= TbHd18 %></th>
                                                                <th><%= TbHd19 %></th>
                                                                <th><%= TbHd20 %></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <%
                                                        do while not rsl.eof
                                                            %>
                                                            <tr>
                                                                <td><%= trim(rsl("Emp_CompaniaID"))     %></td>
                                                                <td><%= trim(rsl("Emp_EmpleadoID"))     %></td>
                                                                <td><%= trim(rsl("Emp_NombreCompleto")) %></td>
                                                                <td><%= trim(rsl("DescEntidad"))        %></td>
                                                                <td><%= trim(rsl("DescCentroCosto"))    %></td>
                                                                <td><%= trim(rsl("Ara_Texto"))          %></td>
                                                                <td><%= trim(rsl("TipAcc"))             %></td>
                                                                <td><%= trim(rsl("TipPri"))             %></td>
                                                                <td><%= trim(rsl("TipAre"))             %></td>
                                                            </tr>
                                                            <%
                                                            rsl.movenext
                                                        loop
                                                        %>
                                                            </tbody>
                                                        </table>
                                                        <%
                                                    end if
                                                end if
                                                %>
                                            </div>
                                        </div>

                                    </div>

                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
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

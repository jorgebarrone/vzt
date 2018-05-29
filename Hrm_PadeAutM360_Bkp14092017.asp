<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Autorización Matriz 360°</title>
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
    <!-- Content Header (Page header) -->
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0230' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "BxHd01"
                BxHd01 = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd1"
                Tb1Hd1 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd2"
                Tb1Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd3"
                Tb1Hd3 = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn2"
                SmBtn2  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn3"
                SmBtn3  = trim(rsTrn("Trd_Texto"))
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

    MenErr = ""
    EstOrg = 0
    Dim Dsc
    Dim Ejr
    Dim Sbt2
    Dim Sbt3

    Dsc = Request.Querystring("Dsc")
    Ejr = Request.Querystring("Ejr")
    Nem = Request.Querystring("Nem")
    Nmb = Request.Querystring("Nmb")
    Cid = Request.Querystring("Cid")

    Sbt2 = Request.Form("Sbt2")
    Sbt3 = Request.Form("Sbt3")
    Subtit = Dsc & " - " & Nmb

    '<-- Para Modificarse -->


    if Sbt2 = "Sbt2" then
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = 0             " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Nem &"'   " & _
                 "and   Psm_SemaforoID    = 'MAT3600010'  "
        set rsu = dbconn.execute(sqlupd)
'        response.write(sqlupd)
'        response.write("</br>")
        response.redirect "Hrm_EmpPade.asp?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid 
    end if

    if Sbt3 = "Sbt3" then
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = 3             " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Nem &"'   " & _
                 "and   Psm_SemaforoID    = 'MAT3600010'  "
        set rsu = dbconn.execute(sqlupd)
        response.redirect "Hrm_EmpPade.asp?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid 
    end if

    %>

    <% call hdr(TitSec,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->
        <div class="box box-primary">
            <form action="Hrm_PadeAutM360.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid & "&Nem=" & Nem & "&Nmb=" & Nmb & "&Cid=" & Cid %>" name="form1" method="post">
                <div class="box-header with-border">
                    <h3 class="box-title"><%= BxHd02 %></h3>
                </div>
                <!-- form start -->
                <div class="box-body">
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
                        i = 0
                        sqlPlz = "select Emp_PlazaID, Emp_PlazaSuperior from HRM10220 where Emp_EmpleadoID = '"& Nem &"' "
                        'sqlPlz = "select plaza from v_EmpleadosVerzatec where Empleado = "& Uid &" " 
                        'sqlPlz = "select plaza from v_EmpleadosVerzatec where Empleado = 52380 " 
                        set rsP = dbconn.execute(sqlPlz)
                        'response.write(sqlPlz)
                        if not rsP.eof and not rsP.bof then
                            EstOrg = 1
                            PlzSup = trim(rsP("Emp_PlazaSuperior"))
                            PlzInf = trim(rsP("Emp_PlazaID"))
    '                   else
    '                       MenErr = MenErr & MsgAl1
                        end if
                        
                        if EstOrg = 1 then
                            sqlpri = "select a.Otm_Plaza,          a.Otm_Plaza_Superior,                " & _
                                     "       isnull(b.Emp_NombreCompleto,'Vacante') as NombreCompleto,  " & _
                                     "       isnull(b.Emp_Foto,'images/emp/silueta.jpg') as UrlFoto,    " & _
                                     "       isnull(b.Emp_EmpleadoID,'0') as Emp_EmpleadoID,            " & _
                                     "       c.Pue_Descripcion                                          " & _
                                     "from HRM10100 a left outer join HRM10220 b                        " & _
                                     "     on a.Otm_Empleado = b.Emp_EmpleadoID                         " & _
                                     "                      left outer join HRM10210 c                  " & _
                                     "     on a.Otm_id_nivel_puesto = c.Pue_NivelPuestoID               " & _
                                     "    and a.Otm_EmpresaFuente   = c.Pue_CompaniaID                  " & _
                                     "where a.Otm_Plaza          = '"& PlzSup &"'                       " & _
                                     "and   a.Otm_Publica        = 1                                    " & _
                                     "and   a.Otm_Estatus        = 1                                    "
                            set rs1 = dbconn.execute(sqlpri)
   '                        response.write(sqlpri)
                            if not rs1.eof and not rs1.bof then
                                do while not rs1.eof
                                    i  = i  + 1
                                    %>
                                    <tr>
                                        <td><%= trim(rs1("Pue_Descripcion")) %></td>
                                        <td><%= trim(rs1("NombreCompleto"))  %></td>
                                        <td style="vertical-align: middle; text-align: center">
                                            <input type="hidden" name="<%= "Nemp" &i %>" value="<%= trim(rs1("Emp_EmpleadoID")) %>" />
                                            <%
                                            sqlexs = "select M36_EvaluadorID                    " & _
                                                     "from HRM10540                             " & _
                                                     "where  M36_Ejercicio     = '"& Ejr  &"'   " & _
                                                     "and    M36_CorporativoID = '5000'         " & _
                                                     "and    M36_CompaniaID    = '"& Cid  &"'   " & _
                                                     "and    M36_EmpleadoID    = '"& Nem  &"'   " & _
                                                     "and    M36_EvaluadorID   = '"& trim(rs1("Emp_EmpleadoID")) &"'   "
                                            set rsExs = dbconn.execute(sqlExs)
                                            if not rsExs.eof and not rsExs.bof then
                                                %><input type="checkbox" class="checkbox" name="<%= "check" &i %>" checked /><%
                                            else
                                                %><input type="checkbox" class="checkbox" name="<%= "check" &i %>" /><%
                                            end if
                                            %>
                                        </td>
                                    </tr>
                                    <%
                                    rs1.movenext
                                loop
                                rs1.close
                            end if
                        else
                            response.write(MenErr)
                        end if
                    
                        sqlseg = "select a.Otm_Plaza,          a.Otm_Plaza_Superior,                " & _
                                 "       isnull(b.Emp_NombreCompleto,'Vacante') as NombreCompleto,  " & _
                                 "       isnull(b.Emp_Foto,'images/emp/silueta.jpg') as UrlFoto,    " & _
                                 "       isnull(b.Emp_EmpleadoID,'0') as Emp_EmpleadoID,            " & _
                                 "       c.Pue_Descripcion                                          " & _
                                 "from HRM10100 a left outer join HRM10220 b                        " & _
                                 "     on a.Otm_Empleado = b.Emp_EmpleadoID                         " & _
                                 "                      left outer join HRM10210 c                  " & _
                                 "     on a.Otm_id_nivel_puesto = c.Pue_NivelPuestoID               " & _
                                 "    and a.Otm_EmpresaFuente   = c.Pue_CompaniaID                  " & _
                                 "where a.Otm_Plaza_Superior = '"& PlzSup &"'                       " & _
                                 "and   a.Otm_Publica        = 1                                    " & _
                                 "and   a.Otm_Estatus        = 1                                    "
                        set rs2 = dbconn.execute(sqlseg)
                        'response.write(sqlseg)
                        if not rs2.eof and not rs2.bof then
                            do while not rs2.eof
                                i = i + 1
                                %>
                                <tr>
                                    <td><%= trim(rs2("Pue_Descripcion")) %></td>
                                    <td><%= trim(rs2("NombreCompleto")) %></td>
                                    <td style="vertical-align: middle; text-align: center">
                                        <input type="hidden" name="<%= "Nemp" &i %>" value="<%= trim(rs2("Emp_EmpleadoID")) %>" />
                                        <%
                                        sqlexs = "select M36_EvaluadorID                    " & _
                                                 "from HRM10540                             " & _
                                                 "where  M36_Ejercicio     = '"& Ejr  &"'   " & _
                                                 "and    M36_CorporativoID = '5000'         " & _
                                                 "and    M36_CompaniaID    = '"& Cid  &"'   " & _
                                                 "and    M36_EmpleadoID    = '"& Nem  &"'   " & _
                                                 "and    M36_EvaluadorID   = '"& trim(rs2("Emp_EmpleadoID")) &"'   "
                                        set rsExs = dbconn.execute(sqlExs)
                                        if not rsExs.eof and not rsExs.bof then
                                            %><input type="checkbox" class="checkbox" name="<%= "check" &i %>" checked /><%
                                        else
                                            %><input type="checkbox" class="checkbox" name="<%= "check" &i %>" /><%
                                        end if
                                        %>
                                    </td>
                                </tr>
                                <%
                                rs2.movenext
                            loop
                            rs2.close
                        end if
                        sqlter = "select a.Otm_Plaza,          a.Otm_Plaza_Superior,                " & _
                                 "       isnull(b.Emp_NombreCompleto,'Vacante') as NombreCompleto,  " & _
                                 "       isnull(b.Emp_Foto,'images/emp/silueta.jpg') as UrlFoto,    " & _
                                 "       isnull(b.Emp_EmpleadoID,'0') as Emp_EmpleadoID,            " & _
                                 "       c.Pue_Descripcion                                          " & _
                                 "from HRM10100 a left outer join HRM10220 b                        " & _
                                 "     on a.Otm_Empleado = b.Emp_EmpleadoID                         " & _
                                 "                      left outer join HRM10210 c                  " & _
                                 "     on a.Otm_id_nivel_puesto = c.Pue_NivelPuestoID               " & _
                                 "    and a.Otm_EmpresaFuente   = c.Pue_CompaniaID                  " & _
                                 "where a.Otm_Plaza_Superior = '"& PlzInf &"'                       " & _
                                 "and   a.Otm_Publica        = 1                                    " & _
                                 "and   a.Otm_Estatus        = 1                                    "
                        set rs3 = dbconn.execute(sqlter)
                        'response.write(sqlter)
                        if not rs3.eof and not rs3.bof then
                            do while not rs3.eof
                                i = i + 1
                                %>
                                <tr>
                                    <td><%= trim(rs3("Pue_Descripcion")) %></td>
                                    <td><%= trim(rs3("NombreCompleto")) %></td>
                                    <td style="vertical-align: middle; text-align: center">
                                        <input type="hidden" name="<%= "Nemp" &i %>" value="<%= trim(rs3("Emp_EmpleadoID")) %>" />
                                        <%
                                        sqlexs = "select M36_EvaluadorID                    " & _
                                                 "from HRM10540                             " & _
                                                 "where  M36_Ejercicio     = '"& Ejr  &"'   " & _
                                                 "and    M36_CorporativoID = '5000'         " & _
                                                 "and    M36_CompaniaID    = '"& Cid  &"'   " & _
                                                 "and    M36_EmpleadoID    = '"& Nem  &"'   " & _
                                                 "and    M36_EvaluadorID   = '"& trim(rs3("Emp_EmpleadoID")) &"'   "
                                        set rsExs = dbconn.execute(sqlExs)
                                        if not rsExs.eof and not rsExs.bof then
                                            %><input type="checkbox" class="checkbox" name="<%= "check" &i %>" checked /><%
                                        else
                                            %><input type="checkbox" class="checkbox" name="<%= "check" &i %>" /><%
                                        end if
                                        %>
                                    </td>
                                </tr>
                                <%
                                rs3.movenext
                            loop
                            rs3.close
                        end if
                        %>
                        </tbody>
                    </table>
                
                    <div class="box-footer" style="text-align: center">
                        <input type="hidden" name="Ind" id="ind" value="<%= i %>" /></input>
                        <button type="submit" class="btn btn-primary" name="Sbt2" id="Sbt2" value="Sbt2" style="background-color: #f00"  ><%= SmBtn2 %></button>&nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-primary" name="Sbt3" id="Sbt3" value="Sbt3" style="background-color: green" ><%= SmBtn3 %></button>
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
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>

<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true
    });

    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });

  });
</script>

</body>
</html>

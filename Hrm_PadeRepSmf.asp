<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Repara Semaforos</title>
  <link rel="shortcut icon" href="images/favicon.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">
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
    <% call hdr("Repara Semaforos","") %>

    <%
    '<-- Busqueda de Objetivos cerrados del año anterior solo para las compañías 2 y 11 -->
    sqlOaa = "select Pod_CompaniaID, Pod_EmpleadoID,      " & _
             "isnull(sum(Pod_ResultadoCalc),0) as TotCal, " & _
             "isnull(sum(Pod_Ponderacion),0) as TotPnd    " & _
             "from HRM10531                               " & _
             "where Pod_CompaniaID IN ('2', '11')         " & _
             "and Pod_Ejercicio = 2017                    " & _
             "and Pod_Tipo = 1                            " & _
             "group by Pod_CompaniaID, Pod_EmpleadoID     "
    set rsOaa = dbconn.execute(sqlOaa)
    if not rsOaa.bof and not rsOaa.eof then
        do while not rsOaa.eof
            if CDbl(rsOaa("TotCal")) > 0 then
                sqlSmf = "select * from HRM10502            " & _
                         "where Psm_Ejercicio = 2018        " & _
                         "and   Psm_CompaniaID = '"& trim(rsOaa("Pod_CompaniaID")) &"'   " & _
                         "and   Psm_EmpleadoID = '"& trim(rsOaa("Pod_EmpleadoID")) &"'   " & _
                         "and   Psm_SemaforoID = 'OBJHAB0010'                            "
                set rsSmf = dbconn.execute(sqlSmf)
                if not rsSmf.bof and not rsSmf.eof then
                    do while not rsSmf.eof
                        if CInt(rsSmf("Psm_Estatus")) < 3 then
                            response.write(rsSmf & "<br>")
                        end if
                        rsSmf.movenext
                    loop
                    rsSmf.close
                    set rsSmf = nothing
                end if
            end if
            rsOaa.movenext
        loop
        rsOaa.close
        set rsOaa = nothing
    end if

    '<-- Busqueda de Encuestas de Habilidades cerrados del año anterior solo para las compañías 2 y 11 -->
    sqlHaa = "select Phb_CompaniaID, Phb_EmpleadoID    " & _
             "from HRM10532                            " & _
             "where Phb_Ejercicio = 2017               " & _
             "and Phb_CompaniaID IN ('2', '11')        " & _
             "group by Phb_CompaniaID, Phb_EmpleadoID  "
    set rsHaa = dbconn.execute(sqlHaa)
    if not rsHaa.bof and not rsHaa.eof then
        do while not rsHaa.eof
            sqlSmf = "select * from HRM10502            " & _
                     "where Psm_Ejercicio = 2018        " & _
                     "and   Psm_CompaniaID = '"& trim(rsHaa("Phb_CompaniaID")) &"'   " & _
                     "and   Psm_EmpleadoID = '"& trim(rsHaa("Phb_EmpleadoID")) &"'   " & _
                     "and   Psm_SemaforoID = 'OBJHAB0010'                            "
            set rsSmf = dbconn.execute(sqlSmf)
            if not rsSmf.bof and not rsSmf.eof then
                do while not rsSmf.eof
                    if CInt(rsSmf("Psm_Estatus")) < 3 then
                        sqlUpd = "update HRM10502 set Psm_Estatus = 3   " & _
                                 "where Psm_Ejercicio = 2018            " & _
                                 "and   Psm_CompaniaID = '"& trim(rsHaa("Phb_CompaniaID")) &"'   " & _
                                 "and   Psm_EmpleadoID = '"& trim(rsHaa("Phb_EmpleadoID")) &"'   " & _
                                 "and   Psm_SemaforoID = 'OBJHAB0010'                            "
                        response.write(sqlUpd & "<br>")
'                        set rsUpd = dbconn.execute(sqlUpd)
                    end if
                    rsSmf.movenext
                loop
                rsSmf.close
                set rsSmf = nothing
            end if
            rsHaa.movenext
        loop
        rsHaa.close
        set rsHaa = nothing
    end if

    '<-- Busqueda de Acciones de Retroalimentacion del Ejercicio 2018 solo para las compañías 2 y 11 -->
    sqlAaa = "select Ara_CompaniaID, Ara_EmpleadoID    " & _
             "from HRM10551                            " & _
             "where Ara_Ejercicio = 2018               " & _
             "and   Ara_CompaniaID IN ('2','11')       " & _
             "group by Ara_CompaniaID, Ara_EmpleadoID  "
    set rsAaa = dbconn.execute(sqlAaa)
    if not rsAaa.bof and not rsAaa.eof then
        do while not rsAaa.eof
            sqlSmf = "select * from HRM10502            " & _
                     "where Psm_Ejercicio = 2018        " & _
                     "and   Psm_CompaniaID = '"& trim(rsAaa("Ara_CompaniaID")) &"'   " & _
                     "and   Psm_EmpleadoID = '"& trim(rsAaa("Ara_EmpleadoID")) &"'   " & _
                     "and   Psm_SemaforoID = 'RETALM0010'                            "
            set rsSmf = dbconn.execute(sqlSmf)
            if not rsSmf.bof and not rsSmf.eof then
                do while not rsSmf.eof
                    if CInt(rsSmf("Psm_Estatus")) < 3 then
                        sqlUpd = "update HRM10502 set Psm_Estatus = 3   " & _
                                 "where Psm_Ejercicio = 2018            " & _
                                 "and   Psm_CompaniaID = '"& trim(rsAaa("Ara_CompaniaID")) &"'   " & _
                                 "and   Psm_EmpleadoID = '"& trim(rsAaa("Ara_EmpleadoID")) &"'   " & _
                                 "and   Psm_SemaforoID = 'RETALM0010'                            "
                        response.write(sqlUpd & "<br>")
'                        set rsUpd = dbconn.execute(sqlUpd)
                    end if
                    rsSmf.movenext
                loop
                rsSmf.close
                set rsSmf = nothing
            end if
            rsAaa.movenext
        loop
        rsAaa.close
        set rsAaa = nothing
    end if

    '<-- Busqueda de Encuestas 360° Contestadas del Ejercicio 2018 solo para las compañías 2 y 11 -->
    sql360 = "select P36_CompaniaID, P36_EmpleadoID   " & _
             "from HRM10533                           " & _
             "where P36_CompaniaID IN ('2','11')      " & _
             "and   P36_Ejercicio = 2018              " & _
             "group by P36_CompaniaID, P36_EmpleadoID " & _
             "order by P36_CompaniaID, P36_EmpleadoID "
    set rs360 = dbconn.execute(sql360)
    if not rs360.bof and not rs360.eof then
        do while not rs360.eof
            sqlSmf = "select * from HRM10502            " & _
                     "where Psm_Ejercicio = 2018        " & _
                     "and   Psm_CompaniaID = '"& trim(rs360("P36_CompaniaID")) &"'   " & _
                     "and   Psm_EmpleadoID = '"& trim(rs360("P36_EmpleadoID")) &"'   " & _
                     "and   Psm_SemaforoID = 'MAT3600010'                            "
            set rsSmf = dbconn.execute(sqlSmf)
            if not rsSmf.bof and not rsSmf.eof then
                do while not rsSmf.eof
                    if CInt(rsSmf("Psm_Estatus")) < 3 then
                        sqlUpd = "update HRM10502 set Psm_Estatus = 3   " & _
                                 "where Psm_Ejercicio = 2018            " & _
                                 "and   Psm_CompaniaID = '"& trim(rs360("P36_CompaniaID")) &"'   " & _
                                 "and   Psm_EmpleadoID = '"& trim(rs360("P36_EmpleadoID")) &"'   " & _
                                 "and   Psm_SemaforoID = 'MAT3600010'                            "
                        response.write(sqlUpd & "<br>")
'                        set rsUpd = dbconn.execute(sqlUpd)
                    end if
                    rsSmf.movenext
                loop
                rsSmf.close
                set rsSmf = nothing
            end if
            rs360.movenext
        loop
        rs360.close
        set rs360 = nothing
    end if

'<-- Busqueda de Objetivos creados del Ejercicio 2018 que suman 100% solo para las compañías 2 y 11 -->
    sqlApo = "select Pod_CompaniaID, Pod_EmpleadoID,   " & _
             "isnull(sum(Pod_Ponderacion),0) as TotPnd " & _
             "from HRM10531                            " & _
             "where Pod_CompaniaID IN ('2', '11')      " & _
             "and Pod_Ejercicio = 2018                 " & _
             "and Pod_Tipo = 1                         " & _
             "group by Pod_CompaniaID, Pod_EmpleadoID  " & _
             "order by Pod_CompaniaID, Pod_EmpleadoID  "
    set rsApo = dbconn.execute(sqlApo)
    if not rsApo.bof and not rsApo.eof then
        do while not rsApo.eof
            if CDbl(rsApo("TotPnd")) = 100 then
                sqlSmf = "select * from HRM10502            " & _
                        "where Psm_Ejercicio = 2018        " & _
                        "and   Psm_CompaniaID = '"& trim(rsApo("Pod_CompaniaID")) &"'   " & _
                        "and   Psm_EmpleadoID = '"& trim(rsApo("Pod_EmpleadoID")) &"'   " & _
                        "and   Psm_SemaforoID = 'APROBJ0010'                            "
                set rsSmf = dbconn.execute(sqlSmf)
                if not rsSmf.bof and not rsSmf.eof then
                    do while not rsSmf.eof
                        if CInt(rsSmf("Psm_Estatus")) < 3 then
                            sqlUpd = "update HRM10502 set Psm_Estatus = 3   " & _
                                    "where Psm_Ejercicio = 2018            " & _
                                    "and   Psm_CompaniaID = '"& trim(rsApo("Pod_CompaniaID")) &"'   " & _
                                    "and   Psm_EmpleadoID = '"& trim(rsApo("Pod_EmpleadoID")) &"'   " & _
                                    "and   Psm_SemaforoID = 'APROBJ0010'                            "
                            response.write(sqlUpd & "<br>")
    '                        set rsUpd = dbconn.execute(sqlUpd)
                        end if
                        rsSmf.movenext
                    loop
                    rsSmf.close
                    set rsSmf = nothing
                end if
            end if
            rsApo.movenext
        loop
        rsApo.close
        set rsApo = nothing
    end if

    %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->
        <div>Hello World!</div>
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

<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Administrador 05</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0100' and Trd_IdiomaID = '"& Lng &"'  "

    set rsTrn = dbconn.execute(sqlTrn)
    'response.write(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitPri"
                TitDiv = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubDiv = trim(rsTrn("Trd_Texto"))

              Case "BxHd01"
                BxHd01 = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02 = trim(rsTrn("Trd_Texto"))
              Case "BxHd03"
                BxHd03 = trim(rsTrn("Trd_Texto"))
              Case "BxHd04"
                BxHd04 = trim(rsTrn("Trd_Texto"))
              Case "BxFt01"
                BxFt01 = trim(rsTrn("Trd_Texto"))
              Case "BxFt02"
                BxFt02 = trim(rsTrn("Trd_Texto"))
              Case "BxFt03"
                BxFt03 = trim(rsTrn("Trd_Texto"))
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
              Case "Tb2Hd1"
                Tb2Hd1 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd2"
                Tb2Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd3"
                Tb2Hd3 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd4"
                Tb2Hd4 = trim(rsTrn("Trd_Texto"))
              Case "Tb2Hd5"
                Tb2Hd5 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St1"
                Tb2St1 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St2"
                Tb2St2 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St3"
                Tb2St3 = trim(rsTrn("Trd_Texto"))
              Case "Tb2St4"
                Tb2St4 = trim(rsTrn("Trd_Texto"))
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
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case "MsgAl1"
                MsgAl1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn3"
                SmBtn3  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

   '<!-- Buscamos si se trata de una consulta de un Empleado en especifico, de lo contrario mostramos la información del Empleado que está conectado -->
    Dim Eid
    Dim Enm
    Dim Sb3
    Eid = ""
    Enm = ""
    Sb3 = ""
    Eid = trim(Request.QueryString("Eid"))
    if Eid = "" then
        Eid = trim(Request.Form("Eid"))
        if Eid = "" then
            Eid = Uid
        end if
    end if

    Sb3 = trim(Request.Form("Sb3"))


   '<!-- Buscamos si se trata de una consulta de un Ejercicio en especifico, de lo contrario mostramos la información del Ejercicio que esté activo -->
    Dim Ejr
    Ejr = 0
    Ejr = trim(Request.QueryString("Ejr"))
    if Ejr = "" then
        Ejr = Request.Form("Ejr")
        if Ejr = "" then
            Ejr = 0
        end if
    end if


    MenErr = ""
    EstOrg = 0
    '<-- Busqueda de Parámetros PADE (Inicio) -->
    if Ejr = 0 then
        sqlEjr = "select a.Pde_Ejercicio,  a.Pde_Estatus, " & _
                 "       b.Pde_Descripcion                " & _
                 "from HRM10500 a left outer join         " & _
                 "     HRMA0500 b                         " & _
                 "on  a.Pde_Ejercicio = b.Pde_Ejercicio   " & _
                 "and b.Pde_IdiomaID  = '"& Lng &"'       " & _
                 "where a.Pde_Estatus = 'A'               "
    else
        sqlEjr = "select a.Pde_Ejercicio,  a.Pde_Estatus, " & _
                 "       b.Pde_Descripcion                " & _
                 "from HRM10500 a left outer join         " & _
                 "     HRMA0500 b                         " & _
                 "on  a.Pde_Ejercicio = b.Pde_Ejercicio   " & _
                 "and b.Pde_IdiomaID  = '"& Lng &"'       " & _
                 "where a.Pde_Ejercicio = "& Ejr &"       "
    end if
    set rse = dbconn.execute(sqlEjr)
    if not rse.bof and not rse.eof then
        Ejr = rse("Pde_Ejercicio")
        Dsc = trim(rse("Pde_Descripcion"))
    else
        Ejr = 0
        Dsc = ""
    end if
'    response.write("Dsc : " & Dsc)
    if Ejr > 0 then
        sqlFec = "select * from HRM10501 where Pde_Ejercicio = "& Ejr &"   "
        set rsF = dbconn.execute(sqlFec)
        if not rsF.bof and not rsF.eof then
            P1FecIni = trim(rsF("Pde_P1FecIni"))
            P1FecFin = trim(rsF("Pde_P1FecFin"))
            P2FecIni = trim(rsF("Pde_P2FecIni"))
            P2FecFin = trim(rsF("Pde_P2FecFin"))
            P3FecIni = trim(rsF("Pde_P3FecIni"))
            P3FecFin = trim(rsF("Pde_P3FecFin"))
            P4FecIni = trim(rsF("Pde_P4FecIni"))
            P4FecFin = trim(rsF("Pde_P4FecFin"))
            MtFecIni = trim(rsF("Pde_MtFecIni"))
            MtFecFin = trim(rsF("Pde_MtFecFin"))

            P1FecIniD = CDate(rsF("Pde_P1FecIni"))
            P1FecFinD = CDate(rsF("Pde_P1FecFin"))
            P2FecIniD = CDate(rsF("Pde_P2FecIni"))
            P2FecFinD = CDate(rsF("Pde_P2FecFin"))
            P3FecIniD = CDate(rsF("Pde_P3FecIni"))
            P3FecFinD = CDate(rsF("Pde_P3FecFin"))
            P4FecIniD = CDate(rsF("Pde_P4FecIni"))
            P4FecFinD = CDate(rsF("Pde_P4FecFin"))
            MtFecIniD = CDate(rsF("Pde_MtFecIni"))
            MtFecFinD = CDate(rsF("Pde_MtFecFin"))
        else
            P1FecIni = ""
            P1FecFin = ""
            P2FecIni = ""
            P2FecFin = ""
            P3FecIni = ""
            P3FecFin = ""
            P4FecIni = ""
            P4FecFin = ""
            MtFecIni = ""
            MtFecFin = ""
        end if
    end if

    P1Est = 0
    P2Est = 0
    P3Est = 0

    sqlCia = "select Emp_CompaniaID, Emp_NombreCompleto, Emp_Foto from HRM10220 where Emp_Empleadoid = '"& Eid &"' "
    set rsCia = dbconn.execute(sqlCia)
    if not rsCia.bof and not rsCia.eof then
        Cid = trim(rsCia("Emp_CompaniaID"))
        Enm = trim(rsCia("Emp_NombreCompleto"))
        Eim = trim(rsCia("Emp_Foto"))
    else
        Cid = ""
        Enm = ""
        Eim = ""
    end if

    '<-- Busqueda de Parámetros PADE (Fin)    -->
    SubTit = Dsc
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
                        <div class="<%= Pan5St %>" id="main" >

                            <div class="box box-primary">
                                <div class="box-body">
                                    <form action="Hrm_PadeAdmin05.asp?Prm=5&Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                                                    <select class="form-control" size="1" id="Eid" name="Eid" required>
                                                        <option class="form-control" value=""><%= Fr1Ph1 %></option>
                                                        <%
                                                        sqlEmp = "select Emp_EmpleadoID, Emp_NombreCompleto  " & _
                                                                 "from HRM10220 order by Emp_NombreCompleto  "
                                                        set rsE = dbconn.execute(sqlEmp)
                                                        if not rsE.bof and not rsE.eof then
                                                            do while not rsE.eof
                                                                %>
                                                                <option class="form-control" value="<%= rsE("Emp_EmpleadoID") %>"><%= trim(rsE("Emp_NombreCompleto")) %></option>
                                                                <%
                                                                rsE.movenext
                                                            loop
                                                            rsE.close
                                                            set rsE = Nothing
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb2 %></label>
                                                    <select class="form-control" size="1" id="Ejr" name="Ejr" required>
                                                        <option class="form-control" value=""><%= Fr1Ph2 %></option>
                                                        <%
                                                        sqlEjc = "select Pde_Ejercicio                    " & _
                                                                 "from HRM10500                           " & _
                                                                 "order by Pde_Ejercicio desc             "
                                                        set rsJ = dbconn.execute(sqlEjc)
                                                        if not rsJ.bof and not rsJ.eof then
                                                            do while not rsJ.eof
                                                                %>
                                                                <option class="form-control" value="<%= rsJ("Pde_Ejercicio") %>"><%= trim(rsJ("Pde_Ejercicio")) %></option>
                                                                <%
                                                                rsJ.movenext
                                                            loop
                                                            rsJ.close
                                                            set rsJ = Nothing
                                                        end if
                                                        %>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00"><%= FrLgn1 %></label>
                                                    <br/>
                                                    <button type="submit" class="btn btn-primary" name="Sb3" id="Sb3" value="Sb3"><%= SmBtn3 %></button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        <%
                        if Sb3 = "Sb3" then
                            %>
                            <!-- CONTENIDO PRINCIPAL Inicio -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">
                                        <img src="<%= Eim %>" style="height: 80px;" alt="<%= Nmb %>">
                                         <%= Eid & " - " & Enm  & " / " & Dsc %>
                                    </h3>
                                </div>
                                <div class="box-body">

                                    <!-- ============= EJERCICIO PADE ==================  -->
                                    <div class="row">

                                        <!-- Paso 1 Inicio -->
                                        <div class="col-md-3 col-sm-6 col-xs-12">
                                            <div class="box" style="border-top-color: #fff">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title"><i class="fa fa-file-text"></i>&nbsp;&nbsp;<%= BxHd01 %></h3>
                                                </div>
                                                <div class="box" style="border-top-color: #d99898; border-top-width: thick">
                                                    <div class="box-body">
                                                        <section class="sidebar">
                                                            <ul class="sidebar-menu">
                                                                <!--  ***************** Matriz 360° Inicio *****************  -->
                                                                <%
                                                                sqlM3 = "select a.*,      b.Psm_Estatus,               " & _
                                                                        "       c.Trd_Texto as Trd_Seccion,            " & _
                                                                        "       d.Trd_Texto                            " & _
                                                                        "from HRM105A0 a, HRM10502 b,                  " & _
                                                                        "     HRM10002 c, HRM10002 d                   " & _
                                                                        "where a.Psf_ParametroID = b.Psm_SemaforoID    " & _
                                                                        "and   a.Psf_Seccion     = c.Trd_ElementoID    " & _
                                                                        "and   a.Psf_ParametroID = d.Trd_ElementoID    " & _
                                                                        "and   a.Psf_NumPaso     = 1                   " & _
                                                                        "and   a.Psf_Seccion     = 'MAT360'            " & _
                                                                        "and   b.Psm_EmpleadoID  = '"& Eid &"'         " & _
                                                                        "and   b.Psm_Ejercicio   =  "& Ejr &"          " & _
                                                                        "and   c.Trd_IdiomaID    = '"& Lng &"'         " & _
                                                                        "and   d.Trd_IdiomaID    = '"& Lng &"'         " & _
                                                                        "order by a.Psf_NumPaso,   a.Psf_Secuencia1,   " & _
                                                                        "         a.Psf_Secuencia2                     "
                                                                set rsM3 = dbconn.execute(sqlM3)
                                                                'response.write(sqlM3)
                                                                if not rsM3.bof and not rsM3.eof then
                                                                    fr   = 0
                                                                    sqlest = "select a.Psm_Estatus                         " & _
                                                                             "from HRM10502 a, HRM105A0 b                  " & _
                                                                             "where  a.Psm_SemaforoID = b.Psf_ParametroID  " & _
                                                                             "and    b.Psf_NumPaso    = 1                  " & _
                                                                             "and    b.Psf_Seccion    = 'MAT360'           " & _
                                                                             "and    a.Psm_EmpleadoID = '"& Eid &"'        " & _
                                                                             "and    a.Psm_Ejercicio  =  "& Ejr &"         " & _
                                                                             "and    a.Psm_Estatus    = 0                  "
                                                                    set rsE = dbconn.execute(sqlest)
                                                                    if not rsE.bof and not rsE.eof then
                                                                        semsec = "red"
                                                                    else
                                                                        semsec = "green"
                                                                    end if
                                                                    sqlPlz = "select Emp_PlazaID from HRM10220 where Emp_EmpleadoID = '"& Eid &"'  "
                                                                    set rsPlz = dbconn.execute(sqlPlz)
                                                                    if not rsPlz.bof and not rsPlz.eof then
                                                                        PlzSup = trim(rsPlz("Emp_PlazaID"))
                                                                        sqlest = "select b.Psm_Estatus                           " & _
                                                                                 "from HRM105A0 a, HRM10502 b, HRM10220 c        " & _
                                                                                 "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                 "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                 "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                 "and   a.Psf_NumPaso       = 1                  " & _
                                                                                 "and   a.Psf_Seccion       = 'MAT360'           " & _
                                                                                 "and   c.Emp_PlazaSuperior = '"& PlzSup &"'     " & _
                                                                                 "and   c.Emp_CompaniaID    = '"&  Cid   &"'     " & _
                                                                                 "and   b.Psm_Estatus       = 0                  " & _
                                                                                 "and   b.Psm_Ejercicio     =  "& Ejr &"         "
                                                                        set rsE = dbconn.execute(sqlest)
                                                                        if not rsE.bof and not rsE.eof then
                                                                            semsec = "red"
                                                                        end if
                                                                        '<!-- Buscamos si alguna Plaza asignada está vacante para asignar la Estructura de Colaboradores -->
                                                                        sqlVcn = "select Otm_Plaza from HRM10100 where Otm_Plaza_Superior = "& PlzSup &" and Otm_Empleado = 0 "
                                                                        set rsVcn = dbconn.execute(sqlVcn)
                                                                        if not rsVcn.bof and not rsVcn.eof then
                                                                            do while not rsVcn.eof
                                                                                PlzVcn = trim(rsVcn("Otm_Plaza"))
                                                                                sqlEvc = "select b.Psm_Estatus                           " & _
                                                                                         "from HRM105A0 a, HRM10502 b, HRM10220 c        " & _
                                                                                         "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                         "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                         "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                         "and   a.Psf_NumPaso       = 1                  " & _
                                                                                         "and   a.Psf_Seccion       = 'MAT360'           " & _
                                                                                         "and   c.Emp_PlazaSuperior = '"& PlzVcn &"'     " & _
                                                                                         "and   b.Psm_Estatus       = 0                  " & _
                                                                                         "and   b.Psm_Ejercicio     =  "& Ejr &"         "
                                                                                set rsEvc = dbconn.execute(sqlEvc)
                                                                                if not rsEvc.bof and not rsEvc.eof then
                                                                                    semsec = "red"
                                                                                end if
                                                                                rsVcn.movenext
                                                                            loop
                                                                        end if
                                                                        rsVcn.close
                                                                        set rsVcn = nothing
                                                                        '<!-- Termina Busqueda de Plazas Vacantes -->
                                                                    end if
                                                                    %>
                                                                    <li class="treeview">
                                                                    <%
                                                                    Do while not rsM3.eof
                                                                        if fr = 0 then
                                                                            %>
                                                                            <a href="#"><i class="fa fa-circle text-<%= semsec %>"></i>&nbsp;<%= rsM3("Trd_Seccion") %></a>
                                                                            <ul class="treeview-menu">
                                                                            <%
                                                                            fr = 1
                                                                        end if
                                                                        if date >= P1FecIniD and date <= P1FecFinD then
                                                                            if CInt(rsM3("Psm_Estatus")) = 0 then
                                                                                P1Est = P1Est + 1
                                                                                semelm = "red"
                                                                                %>
                                                                                <li><a href="Hrm_PadeEnc3604.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsM3("Trd_Texto") %></a></li>
                                                                                <%
                                                                            else
                                                                                if CInt(rsM3("Psm_Estatus")) = 1 then
                                                                                    P1Est = P1Est + 1
                                                                                    semelm = "yellow"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeEnc3604.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsM3("Trd_Texto") %></a></li>
                                                                                    <%
                                                                                else
                                                                                    semelm = "green"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & Cid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsM3("Trd_Texto") %></a></li>
                                                                                    <%
                                                                                end if
                                                                            end if
                                                                        else
                                                                            if CInt(rsM3("Psm_Estatus")) = 0 then
                                                                                P1Est = P1Est + 1
                                                                                semelm = "red"
                                                                                %>
                                                                                <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & Cid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsM3("Trd_Texto") %></a></li>
                                                                                <%
                                                                            else
                                                                                if CInt(rsM3("Psm_Estatus")) = 1 then
                                                                                    P1Est = P1Est + 1
                                                                                    semelm = "yellow"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & Cid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsM3("Trd_Texto") %></a></li>
                                                                                    <%
                                                                                else
                                                                                    semelm = "green"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Cid=" & Cid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsM3("Trd_Texto") %></a></li>
                                                                                    <%
                                                                                end if
                                                                            end if
                                                                        end if
                                                                        rsM3.movenext
                                                                    Loop
                                                                    rsM3.close
                                                                    set rsM3 = Nothing

                                                                    sqlClb = "select b.Psm_Estatus,        c.Emp_EmpleadoID, " & _
                                                                             "       c.Emp_NombreCompleto, c.Emp_CompaniaID  " & _
                                                                             "from HRM105A0 a, HRM10502 b, HRM10220 c        " & _
                                                                             "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                             "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                             "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                             "and   a.Psf_NumPaso       = 1                  " & _
                                                                             "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                             "and   a.Psf_Seccion       = 'MAT360'           " & _
                                                                             "and   c.Emp_PlazaSuperior = '"& PlzSup &"'     " & _
                                                                             "and   c.Emp_CompaniaID    = '"&  Cid   &"'     "
                                                                    set rsClb = dbconn.execute(sqlClb)
                                                                    if not rsClb.bof and not rsClb.eof then
                                                                        do while not rsClb.eof
                                                                            if date >= P1FecIniD and date <= P1FecFinD then
                                                                                if rsClb("Psm_Estatus") = 0 then
                                                                                    P1Est = P1Est + 1
                                                                                    semelm = "red"
                                                                                    %>
                                                                                    <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                    <%
                                                                                else
                                                                                    if rsClb("Psm_Estatus") = 1 then
                                                                                        P1Est = P1Est + 1
                                                                                        semelm = "yellow"
                                                                                        %>
                                                                                        <li style="font-size: x-small"><a href="Hrm_PadeAutM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsClb("Emp_NombreCompleto") %></a></li>
                                                                                        <%
                                                                                    else
                                                                                        semelm = "green"
                                                                                        %>
                                                                                        <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                        <%
                                                                                    end if
                                                                                end if
                                                                            else
                                                                                if rsClb("Psm_Estatus") = 0 then
                                                                                    P1Est = P1Est + 1
                                                                                    semelm = "red"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                    <%
                                                                                else
                                                                                    if rsClb("Psm_Estatus") = 1 then
                                                                                        P1Est = P1Est + 1
                                                                                        semelm = "yellow"
                                                                                        %>
                                                                                        <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                        <%
                                                                                    else
                                                                                        semelm = "green"
                                                                                        %>
                                                                                        <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                        <%
                                                                                    end if
                                                                                end if
                                                                            end if
                                                                            rsClb.movenext
                                                                        loop
                                                                        rsClb.close
                                                                        set rsClb = Nothing
                                                                    end if

                                                                    '<!-- Buscamos si alguna Plaza asignada está vacante para asignar la Estructura de Colaboradores -->
                                                                    sqlVcn = "select Otm_Plaza from HRM10100 where Otm_Plaza_Superior = "& PlzSup &" and Otm_Empleado = 0 "
                                                                    set rsVcn = dbconn.execute(sqlVcn)
                                                                    if not rsVcn.bof and not rsVcn.eof then
                                                                        do while not rsVcn.eof
                                                                            PlzVcn = trim(rsVcn("Otm_Plaza"))
                                                                            sqlClv = "select b.Psm_Estatus,        c.Emp_EmpleadoID, " & _
                                                                                     "       c.Emp_NombreCompleto, c.Emp_CompaniaID  " & _
                                                                                     "from HRM105A0 a, HRM10502 b, HRM10220 c        " & _
                                                                                     "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                     "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                     "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                     "and   a.Psf_NumPaso       = 1                  " & _
                                                                                     "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                     "and   a.Psf_Seccion       = 'MAT360'           " & _
                                                                                     "and   c.Emp_PlazaSuperior = '"& PlzVcn &"'     "
                                                                            set rsClv = dbconn.execute(sqlClv)
                                                                            if not rsClv.bof and not rsClv.eof then
                                                                                do while not rsClv.eof
                                                                                    if date >= P1FecIniD and date <= P1FecFinD then
                                                                                        if rsClv("Psm_Estatus") = 0 then
                                                                                            P1Est = P1Est + 1
                                                                                            semelm = "red"
                                                                                            %>
                                                                                            <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        else
                                                                                            if rsClv("Psm_Estatus") = 1 then
                                                                                                P1Est = P1Est + 1
                                                                                                semelm = "yellow"
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeAutM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            else
                                                                                                semelm = "green"
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            end if
                                                                                        end if
                                                                                    else
                                                                                        if rsClv("Psm_Estatus") = 0 then
                                                                                            P1Est = P1Est + 1
                                                                                            semelm = "red"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        else
                                                                                            if rsClv("Psm_Estatus") = 1 then
                                                                                                P1Est = P1Est + 1
                                                                                                semelm = "yellow"
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            else
                                                                                                semelm = "green"
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsM360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            end if
                                                                                        end if
                                                                                    end if
                                                                                    rsClv.movenext
                                                                                loop
                                                                            end if
                                                                            rsClv.close
                                                                            set rsClv = nothing
                                                                            rsVcn.movenext
                                                                        loop
                                                                    end if
                                                                    rsVcn.close
                                                                    set rsVcn = nothing
                                                                    '<!-- Termina Busqueda de Plazas Vacantes -->
                                                                    %>
                                                                    </ul>
                                                                    </li>
                                                                <%
                                                                end if
                                                                %>
                                                                <!--  ***************** Matriz 360° Fin    *****************  -->

                                                                <!--  ***************** Aceptar Encuestas 360° Inicio *****************  -->

                                                                <%
                                                                sqlEnc = "select a.*, b.Emp_NombreCompleto, c.Psm_Estatus          " & _
                                                                         "from HRM10540 a, HRM10220 b, HRM10502 c                  " & _
                                                                         "where a.M36_EmpleadoID  = b.Emp_EmpleadoID               " & _
                                                                         "and   a.M36_EmpleadoID  = c.Psm_EmpleadoID               " & _
                                                                         "and   a.M36_Ejercicio   = c.Psm_Ejercicio                " & _
                                                                         "and   a.M36_Ejercicio   =  "& Ejr &"                     " & _
                                                                         "and   M36_CorporativoID = '5000'                         " & _
                                                                         "and   M36_EvaluadorID   = '"& Eid &"'                    " & _
                                                                         "and   M36_Estatus       = 1                              " & _
                                                                         "and   c.Psm_SemaforoID  = 'MAT3600010'                   " & _
                                                                         "and   c.Psm_Estatus     > 2                              "
                                                                set rsEnc = dbconn.execute(sqlEnc)
                                                                if not rsEnc.bof and not rsEnc.eof then
                                                                    fr   = 0
                                                                    sqlest = "select a.*, b.Emp_NombreCompleto, c.Psm_Estatus          " & _
                                                                             "from HRM10540 a, HRM10220 b, HRM10502 c                  " & _
                                                                             "where a.M36_EmpleadoID  = b.Emp_EmpleadoID               " & _
                                                                             "and   a.M36_EmpleadoID  = c.Psm_EmpleadoID               " & _
                                                                             "and   a.M36_Ejercicio   = c.Psm_Ejercicio                " & _
                                                                             "and   a.M36_Ejercicio   =  "& Ejr &"                     " & _
                                                                             "and   M36_CorporativoID = '5000'                         " & _
                                                                             "and   M36_EvaluadorID   = '"& Eid &"'                    " & _
                                                                             "and   M36_Estatus       = 1                              " & _
                                                                             "and   c.Psm_SemaforoID  = 'MAT3600010'                   " & _
                                                                             "and   c.Psm_Estatus     = 3                              "
                                                                    set rsE = dbconn.execute(sqlest)
                                                                    if not rsE.bof and not rsE.eof then
                                                                        semsec = "red"
                                                                    else
                                                                        semsec = "green"
                                                                    end if
                                                                    %>
                                                                    <li class="treeview">
                                                                    <%
                                                                    Do while not rsEnc.eof
                                                                        if fr = 0 then
                                                                            %>
                                                                            <a href="#"><i class="fa fa-circle text-<%= semsec %>"></i>&nbsp;Aceptar Evaluaciones</a>
                                                                            <ul class="treeview-menu">
                                                                            <%
                                                                            fr = 1
                                                                        end if
                                                                        if CInt(rsEnc("Psm_Estatus")) = 3 then
                                                                            P1Est = P1Est + 1
                                                                            semelm = "red"
                                                                        else
                                                                            if CInt(rsEnc("Psm_Estatus")) = 1 then
                                                                                P1Est = P1Est + 1
                                                                                semelm = "yellow"
                                                                            else
                                                                                semelm = "green"
                                                                            end if
                                                                        end if
                                                                        if date >= P1FecIniD and date <= P1FecFinD then
                                                                            %>
                                                                            <li><a href="Hrm_PadeAutEnc.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsEnc("Emp_NombreCompleto") %></label></a></li>
                                                                            <%
                                                                        else
                                                                            %>
                                                                            <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsEnc("Emp_NombreCompleto") %></label></a></li>
                                                                            <%
                                                                        end if
                                                                        rsEnc.movenext
                                                                    Loop
                                                                    rsEnc.close
                                                                    set rsEnc = Nothing
                                                                    %>
                                                                    </ul>
                                                                    </li>
                                                                <%
                                                                end if
                                                                %>
                                                                <!--  ***************** Aceptar Encuestas 360° Fin    *****************  -->

                                                                <!--  ***************** Contestar Encuestas 360° Inicio *****************  -->
                                                                <%
                                                                sqlEnc = "select a.*, b.Emp_NombreCompleto, b.Emp_CompaniaID       " & _
                                                                         "from HRM10540 a, HRM10220 b                              " & _
                                                                         "where a.M36_EmpleadoID    = b.Emp_EmpleadoID             " & _
                                                                         "and   a.M36_Ejercicio     =  "& Ejr &"                   " & _
                                                                         "and   a.M36_CorporativoID = '5000'                       " & _
                                                                         "and   a.M36_EvaluadorID   = '"& Eid &"'                  " & _
                                                                         "and   a.M36_Estatus       > 2                            "
                                                                set rsEnc = dbconn.execute(sqlEnc)
                                                                if not rsEnc.bof and not rsEnc.eof then
                                                                    fr   = 0
                                                                    sqlest = "select a.*, b.Emp_NombreCompleto, b.Emp_CompaniaID       " & _
                                                                             "from HRM10540 a, HRM10220 b                              " & _
                                                                             "where a.M36_EmpleadoID    = b.Emp_EmpleadoID             " & _
                                                                             "and   a.M36_Ejercicio     =  "& Ejr &"                   " & _
                                                                             "and   a.M36_CorporativoID = '5000'                       " & _
                                                                             "and   a.M36_EvaluadorID   = '"& Eid &"'                  " & _
                                                                             "and   a.M36_Estatus       = 3                            "
                                                                    set rsE = dbconn.execute(sqlest)
                                                                    if not rsE.bof and not rsE.eof then
                                                                        semsec = "red"
                                                                    else
                                                                        semsec = "green"
                                                                    end if
                                                                    %>
                                                                    <li class="treeview">
                                                                    <%
                                                                    Do while not rsEnc.eof
                                                                        if fr = 0 then
                                                                            %>
                                                                            <a href="#"><i class="fa fa-circle text-<%= semsec %>"></i>&nbsp;Contestar Evaluaciones</a>
                                                                            <ul class="treeview-menu">
                                                                            <%
                                                                            fr = 1
                                                                        end if
                                                                        if date >= P1FecIniD and date <= P1FecFinD then
                                                                            if CInt(rsEnc("M36_Estatus")) = 3 then
                                                                                P1Est = P1Est + 1
                                                                                semelm = "red"
                                                                                %>
                                                                                <li><a href="Hrm_PadeEnc3603.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Nem=" & trim(rsEnc("M36_EmpleadoID")) & "&Nmb=" & trim(rsEnc("Emp_NombreCompleto")) & "&Cid=" & trim(rsEnc("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= trim(rsEnc("Emp_NombreCompleto")) %></label></a></li>
                                                                                <%
                                                                            else
                                                                                semelm = "green"
                                                                                %>
                                                                                <li><a href="Hrm_PadeCns360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Nem=" & trim(rsEnc("M36_EmpleadoID")) & "&Nmb=" & trim(rsEnc("Emp_NombreCompleto")) & "&Cid=" & trim(rsEnc("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= trim(rsEnc("Emp_NombreCompleto")) %></label></a></li>
                                                                                <%
                                                                            end if
                                                                        else
                                                                            if CInt(rsEnc("M36_Estatus")) = 3 then
                                                                                P1Est = P1Est + 1
                                                                                semelm = "red"
                                                                                %>
                                                                                <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= trim(rsEnc("Emp_NombreCompleto")) %></label></a></li>
                                                                                <%
                                                                            else
                                                                                semelm = "green"
                                                                                %>
                                                                                <li><a href="Hrm_PadeCns360.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Nem=" & trim(rsEnc("M36_EmpleadoID")) & "&Nmb=" & trim(rsEnc("Emp_NombreCompleto")) & "&Cid=" & trim(rsEnc("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= trim(rsEnc("Emp_NombreCompleto")) %></label></a></li>
                                                                                <%
                                                                            end if
                                                                        end if
                                                                        rsEnc.movenext
                                                                    Loop
                                                                    rsEnc.close
                                                                    set rsEnc = Nothing
                                                                    %>
                                                                    </ul>
                                                                    </li>
                                                                    <%
                                                                end if
                                                                %>
                                                                <!--  ***************** Contestar Encuestas 360° Fin    *****************  -->


                                                                <!--  ***************** Apertura Objetivos Inicio *****************  -->
                                                                <%
                                                                sqlTvl = "select Evh_TipoEval                    " & _
                                                                         "from HRM10525                          " & _
                                                                         "where Evh_CorporativoID = '5000'       " & _
                                                                         "and   Evh_EmpleadoID    = '"& Eid &"'  " & _
                                                                         "and   Evh_Ejercicio     =  "& Ejr &"   "
                                                                set rsT = dbconn.execute(sqlTvl)
                                                                if not rsT.bof and not rsT.eof then
                                                                    Tvl = rsT("Evh_TipoEval")
                                                                else
                                                                    Tvl = 0
                                                                end if
                                                                if Tvl < 3 then
                                                                    sqlP3 = "select a.*,      b.Psm_Estatus,               " & _
                                                                            "       c.Trd_Texto as Trd_Seccion,            " & _
                                                                            "       d.Trd_Texto                            " & _
                                                                            "from HRM105A0 a, HRM10502 b,                  " & _
                                                                            "     HRM10002 c, HRM10002 d                   " & _
                                                                            "where a.Psf_ParametroID = b.Psm_SemaforoID    " & _
                                                                            "and   a.Psf_Seccion     = c.Trd_ElementoID    " & _
                                                                            "and   a.Psf_ParametroID = d.Trd_ElementoID    " & _
                                                                            "and   a.Psf_NumPaso     = 1                   " & _
                                                                            "and   a.Psf_Seccion     = 'APROBJ'            " & _
                                                                            "and   b.Psm_EmpleadoID  = '"& Eid &"'         " & _
                                                                            "and   b.Psm_Ejercicio   =  "& Ejr &"          " & _
                                                                            "and   c.Trd_IdiomaID    = '"& Lng &"'         " & _
                                                                            "and   d.Trd_IdiomaID    = '"& Lng &"'         " & _
                                                                            "order by a.Psf_NumPaso,   a.Psf_Secuencia1,   " & _
                                                                            "         a.Psf_Secuencia2                     "
                                                                    set rsP3 = dbconn.execute(sqlP3)
                                                                    'response.write(sqlP3)
                                                                    if not rsP3.bof and not rsP3.eof then
                                                                        fr   = 0
                                                                        sqlest = "select a.Psm_Estatus                         " & _
                                                                                 "from HRM10502 a, HRM105A0 b                  " & _
                                                                                 "where  a.Psm_SemaforoID = b.Psf_ParametroID  " & _
                                                                                 "and    b.Psf_NumPaso    = 1                  " & _
                                                                                 "and    b.Psf_Seccion    = 'APROBJ'           " & _
                                                                                 "and    a.Psm_EmpleadoID = '"& Eid &"'        " & _
                                                                                 "and    a.Psm_Ejercicio  =  "& Ejr &"         " & _
                                                                                 "and    a.Psm_Estatus    = 0                  "
                                                                        set rsE = dbconn.execute(sqlest)
                                                                        if not rsE.bof and not rsE.eof then
                                                                            semsec = "red"
                                                                        else
                                                                            semsec = "green"
                                                                        end if
                                                                        sqlPlz = "select Emp_PlazaID from HRM10220 where Emp_EmpleadoID = '"& Eid &"'  "
                                                                        set rsPlz = dbconn.execute(sqlPlz)
                                                                        if not rsPlz.bof and not rsPlz.eof then
                                                                            PlzSup = trim(rsPlz("Emp_PlazaID"))
                                                                            sqlest = "select b.Psm_Estatus                           " & _
                                                                                     "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                                     "     HRM10525 d                                " & _
                                                                                     "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                     "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                     "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                     "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                                     "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                                     "and   a.Psf_NumPaso       = 1                  " & _
                                                                                     "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                     "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                                     "and   a.Psf_Seccion       = 'APROBJ'           " & _
                                                                                     "and   c.Emp_PlazaSuperior = '"& PlzSup &"'     " & _
                                                                                     "and   c.Emp_CompaniaID    = '"&  Cid   &"'     " & _
                                                                                     "and   d.Evh_TipoEval      < 3                  " & _
                                                                                     "and   b.Psm_Estatus       = 0                  "
                                                                            set rsE = dbconn.execute(sqlest)
                                                                            if not rsE.bof and not rsE.eof then
                                                                                semsec = "red"
                                                                            end if
                                                                            '<!-- Buscamos si alguna Plaza asignada está vacante para asignar la Estructura de Colaboradores -->
                                                                            sqlVcn = "select Otm_Plaza from HRM10100 where Otm_Plaza_Superior = "& PlzSup &" and Otm_Empleado = 0 "
                                                                            set rsVcn = dbconn.execute(sqlVcn)
                                                                            if not rsVcn.bof and not rsVcn.eof then
                                                                                do while not rsVcn.eof
                                                                                    PlzVcn = trim(rsVcn("Otm_Plaza"))
                                                                                    sqlEvc = "select b.Psm_Estatus                           " & _
                                                                                             "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                                             "     HRM10525 d                                " & _
                                                                                             "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                             "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                             "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                             "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                                             "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                                             "and   a.Psf_NumPaso       = 1                  " & _
                                                                                             "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                             "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                                             "and   a.Psf_Seccion       = 'APROBJ'           " & _
                                                                                             "and   c.Emp_PlazaSuperior = '"& PlzVcn &"'     " & _
                                                                                             "and   d.Evh_TipoEval      < 3                  " & _
                                                                                             "and   b.Psm_Estatus       = 0                  "
                                                                                    set rsEvc = dbconn.execute(sqlEvc)
                                                                                    if not rsEvc.bof and not rsEvc.eof then
                                                                                        semsec = "red"
                                                                                    end if
                                                                                    rsVcn.movenext
                                                                                loop
                                                                            end if
                                                                            rsVcn.close
                                                                            set rsVcn = nothing
                                                                            '<!-- Termina Busqueda de Plazas Vacantes -->
                                                                        end if
                                                                        %>
                                                                        <li class="treeview">
                                                                        <%
                                                                        Do while not rsP3.eof
                                                                            if fr = 0 then
                                                                                %>
                                                                                <a href="#"><i class="fa fa-circle text-<%= semsec %>"></i>&nbsp;<%= rsP3("Trd_Seccion") %></a>
                                                                                <ul class="treeview-menu">
                                                                                <%
                                                                                fr = 1
                                                                            end if
                                                                            if CInt(rsP3("Psm_Estatus")) = 0 then
                                                                                P1Est = P1Est + 1
                                                                                semelm = "red"
                                                                            else
                                                                                if CInt(rsP3("Psm_Estatus")) = 1 then
                                                                                    P1Est = P1Est + 1
                                                                                    semelm = "yellow"
                                                                                else
                                                                                    semelm = "green"
                                                                                end if
                                                                            end if
                                                                            if date >= P1FecIniD and date <= P1FecFinD then
                                                                                if CInt(rsP3("Psm_Estatus")) = 0 then
                                                                                    P1Est = P1Est + 1
                                                                                    semelm = "red"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeAprObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                    <%
                                                                                else
                                                                                    if CInt(rsP3("Psm_Estatus")) = 1 then
                                                                                        P1Est = P1Est + 1
                                                                                        semelm = "yellow"
                                                                                        %>
                                                                                        <li><a href="Hrm_PadeAprObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                        <%
                                                                                    else
                                                                                        semelm = "green"
                                                                                        %>
                                                                                        <li><a href="Hrm_PadeCnsAprObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Cid=" & Eid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                        <%
                                                                                    end if
                                                                                end if
                                                                            else
                                                                                if CInt(rsP3("Psm_Estatus")) = 0 then
                                                                                    P1Est = P1Est + 1
                                                                                    semelm = "red"
                                                                                    %>
                                                                                    <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                    <%
                                                                                else
                                                                                    if CInt(rsP3("Psm_Estatus")) = 1 then
                                                                                        P1Est = P1Est + 1
                                                                                        semelm = "yellow"
                                                                                        %>
                                                                                        <li><a href="Hrm_PadeCnsAprObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Cid=" & Eid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                        <%
                                                                                    else
                                                                                        semelm = "green"
                                                                                        %>
                                                                                        <li><a href="Hrm_PadeCnsAprObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Cid=" & Eid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                        <%
                                                                                    end if
                                                                                end if
                                                                            end if
                                                                            rsP3.movenext
                                                                        Loop
                                                                        rsP3.close
                                                                        set rsP3 = Nothing

                                                                        sqlClb = "select b.Psm_Estatus,        c.Emp_EmpleadoID, " & _
                                                                                 "       c.Emp_NombreCompleto, c.Emp_CompaniaID  " & _
                                                                                 "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                                 "     HRM10525 d                                " & _
                                                                                 "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                 "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                 "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                 "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                                 "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                                 "and   a.Psf_NumPaso       = 1                  " & _
                                                                                 "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                 "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                                 "and   a.Psf_Seccion       = 'APROBJ'           " & _
                                                                                 "and   c.Emp_PlazaSuperior = '"& PlzSup &"'     " & _
                                                                                 "and   c.Emp_CompaniaID    = '"&  Cid   &"'     " & _
                                                                                 "and   d.Evh_TipoEval      < 3                  "
                                                                        set rsClb = dbconn.execute(sqlClb)
                                                                        if not rsClb.bof and not rsClb.eof then
                                                                            do while not rsClb.eof
                                                                                if date >= P1FecIniD and date <= P1FecFinD then
                                                                                    if rsClb("Psm_Estatus") = 0 then
                                                                                        P1Est = P1Est + 1
                                                                                        semelm = "red"
                                                                                        %>
                                                                                        <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                        <%
                                                                                    else
                                                                                        if rsClb("Psm_Estatus") = 1 then
                                                                                            P1Est = P1Est + 1
                                                                                            semelm = "yellow"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeAutObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        else
                                                                                            semelm = "green"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCnsAprObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & trim(rsClb("Emp_EmpleadoID")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        end if
                                                                                    end if
                                                                                else
                                                                                    if rsClb("Psm_Estatus") = 0 then
                                                                                        P1Est = P1Est + 1
                                                                                        semelm = "red"
                                                                                        %>
                                                                                        <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                        <%
                                                                                    else
                                                                                        if rsClb("Psm_Estatus") = 1 then
                                                                                            P1Est = P1Est + 1
                                                                                            semelm = "yellow"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCnsAprObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & trim(rsClb("Emp_EmpleadoID")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        else
                                                                                            semelm = "green"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCnsAprObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & trim(rsClb("Emp_EmpleadoID")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        end if
                                                                                    end if
                                                                                end if
                                                                                rsClb.movenext
                                                                            loop
                                                                            rsClb.close
                                                                            set rsClb = Nothing
                                                                        end if

                                                                        '<!-- Buscamos si alguna Plaza asignada está vacante para asignar la Estructura de Colaboradores -->
                                                                        sqlVcn = "select Otm_Plaza from HRM10100 where Otm_Plaza_Superior = "& PlzSup &" and Otm_Empleado = 0 "
                                                                        set rsVcn = dbconn.execute(sqlVcn)
                                                                        if not rsVcn.bof and not rsVcn.eof then
                                                                            do while not rsVcn.eof
                                                                                PlzVcn = trim(rsVcn("Otm_Plaza"))
                                                                                sqlClv = "select b.Psm_Estatus,        c.Emp_EmpleadoID, " & _
                                                                                         "       c.Emp_NombreCompleto, c.Emp_CompaniaID  " & _
                                                                                         "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                                         "     HRM10525 d                                " & _
                                                                                         "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                         "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                         "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                         "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                                         "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                                         "and   a.Psf_NumPaso       = 1                  " & _
                                                                                         "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                         "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                                         "and   a.Psf_Seccion       = 'APROBJ'           " & _
                                                                                         "and   c.Emp_PlazaSuperior = '"& PlzVcn &"'     " & _
                                                                                         "and   d.Evh_TipoEval      < 3                  "
                                                                                set rsClv = dbconn.execute(sqlClv)
                                                                                if not rsClv.bof and not rsClv.eof then
                                                                                    do while not rsClv.eof
                                                                                        if date >= P1FecIniD and date <= P1FecFinD then
                                                                                            if rsClv("Psm_Estatus") = 0 then
                                                                                                P1Est = P1Est + 1
                                                                                                semelm = "red"
                                                                                                %>
                                                                                                <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            else
                                                                                                if rsClv("Psm_Estatus") = 1 then
                                                                                                    P1Est = P1Est + 1
                                                                                                    semelm = "yellow"
                                                                                                    %>
                                                                                                    <li><a href="Hrm_PadeAutObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                    <%
                                                                                                else
                                                                                                    semelm = "green"
                                                                                                    %>
                                                                                                    <li><a href="Hrm_PadeCnsAprObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                    <%
                                                                                                end if
                                                                                            end if
                                                                                        else
                                                                                            if rsClv("Psm_Estatus") = 0 then
                                                                                                P1Est = P1Est + 1
                                                                                                semelm = "red"
                                                                                                %>
                                                                                                <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            else
                                                                                                if rsClv("Psm_Estatus") = 1 then
                                                                                                    P1Est = P1Est + 1
                                                                                                    semelm = "yellow"
                                                                                                    %>
                                                                                                    <li><a href="Hrm_PadeCnsAprObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                    <%
                                                                                                else
                                                                                                    semelm = "green"
                                                                                                    %>
                                                                                                    <li><a href="Hrm_PadeCnsAprObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                    <%
                                                                                                end if
                                                                                            end if
                                                                                        end if
                                                                                        rsClv.movenext
                                                                                    loop
                                                                                end if
                                                                                rsClv.close
                                                                                set rsClv = nothing
                                                                                rsVcn.movenext
                                                                            loop
                                                                        end if
                                                                        rsVcn.close
                                                                        set rsVcn = nothing
                                                                        '<!-- Termina Busqueda de Plazas Vacantes -->

                                                                        %>
                                                                        </ul>
                                                                        </li>
                                                                    <%
                                                                    end if
                                                                end if
                                                                %>
                                                                <!--  ***************** Apertura Objetivos Fin    *****************  -->

                                                            </ul>
                                                        </section>
                                                        <div class="box-footer" style="background-color: #808080; color: #fff; text-align: center">
                                                            <%= BxFt01 & "  " & P1FecIni %>
                                                            </br>
                                                            <%= BxFt02 & "  " & P1FecFin %>
                                                        </div>
                                                        <div class="box-footer" style="text-align: center">
                                                            <%= BxFt03 %>&nbsp;
                                                            <%
                                                            if date >= P1FecIniD and date <= P1FecFinD then
                                                                if P1Est = 0 then
                                                                    %><span class="label label-success">En Tiempo</span><%
                                                                else
                                                                    %><span class="label label-danger">En Curso</span><%
                                                                end if
                                                            else
                                                                if date > P1FecFinD then
                                                                    if P1Est = 0 then
                                                                        %><span class="label label-success">Concluida En Tiempo</span><%
                                                                    else
                                                                        %><span class="label label-danger">Retraso</span><%
                                                                    end if
                                                                else
                                                                    if date < P1FecIniD then
                                                                        %><span class="label label-primary">No Iniciada</span><%
                                                                    end if
                                                                end if
                                                            end if
                                                            %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Paso 1 Fin -->

                                        <!-- Paso 2 Inicio -->
                                        <div class="col-md-3 col-sm-6 col-xs-12">
                                            <div class="box" style="border-top-color: #fff">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title"><i class="fa fa-check-circle"></i>&nbsp;&nbsp;<%= BxHd02 %></h3>
                                                </div>
                                                <div class="box" style="border-top-color: #bb6262; border-top-width: thick">
                                                    <div class="box-body">
                                                        <section class="sidebar">
                                                            <ul class="sidebar-menu">

                                                                <!--  ***************** Cierre Objetivos Ini *****************  -->
                                                                <%
                                                                Eja = Ejr - 1
                                                                sqlTvl = "select Evh_TipoEval                    " & _
                                                                         "from HRM10525                          " & _
                                                                         "where Evh_CorporativoID = '5000'       " & _
                                                                         "and   Evh_EmpleadoID    = '"& Eid &"'  " & _
                                                                         "and   Evh_Ejercicio     =  "& Eja &"   "
                                                                set rsT = dbconn.execute(sqlTvl)
                                                                if not rsT.bof and not rsT.eof then
                                                                    Tvl = rsT("Evh_TipoEval")
                                                                else
                                                                    Tvl = 0
                                                                end if
                                                                if Tvl <= 3 then
                                                                    sqlP3 = "select a.*,      b.Psm_Estatus,               " & _
                                                                            "       c.Trd_Texto as Trd_Seccion,            " & _
                                                                            "       d.Trd_Texto                            " & _
                                                                            "from HRM105A0 a, HRM10502 b,                  " & _
                                                                            "     HRM10002 c, HRM10002 d                   " & _
                                                                            "where a.Psf_ParametroID = b.Psm_SemaforoID    " & _
                                                                            "and   a.Psf_Seccion     = c.Trd_ElementoID    " & _
                                                                            "and   a.Psf_ParametroID = d.Trd_ElementoID    " & _
                                                                            "and   a.Psf_NumPaso     = 2                   " & _
                                                                            "and   a.Psf_Seccion     = 'OBJHAB'            " & _
                                                                            "and   a.Psf_Secuencia1  = 10                  " & _
                                                                            "and   b.Psm_EmpleadoID  = '"& Eid &"'         " & _
                                                                            "and   b.Psm_Ejercicio   =  "& Ejr &"          " & _
                                                                            "and   c.Trd_IdiomaID    = '"& Lng &"'         " & _
                                                                            "and   d.Trd_IdiomaID    = '"& Lng &"'         " & _
                                                                            "order by a.Psf_NumPaso,   a.Psf_Secuencia1,   " & _
                                                                            "         a.Psf_Secuencia2                     "
                                                                    set rsP3 = dbconn.execute(sqlP3)
                                                                    'response.write(sqlP3)
                                                                    if not rsP3.bof and not rsP3.eof then
                                                                        fr   = 0
                                                                        sqlest = "select a.Psm_Estatus                         " & _
                                                                                 "from HRM10502 a, HRM105A0 b                  " & _
                                                                                 "where  a.Psm_SemaforoID = b.Psf_ParametroID  " & _
                                                                                 "and    b.Psf_NumPaso    = 2                  " & _
                                                                                 "and    b.Psf_Seccion    = 'OBJHAB'           " & _
                                                                                 "and    b.Psf_Secuencia1 = 10                 " & _
                                                                                 "and    a.Psm_EmpleadoID = '"& Eid &"'        " & _
                                                                                 "and    a.Psm_Ejercicio  =  "& Ejr &"         " & _
                                                                                 "and    a.Psm_Estatus    = 0                  "
                                                                        set rsE = dbconn.execute(sqlest)
                                                                        if not rsE.bof and not rsE.eof then
                                                                            semsec = "red"
                                                                        else
                                                                            semsec = "green"
                                                                        end if
                                                                        sqlPlz = "select Emp_PlazaID from HRM10220 where Emp_EmpleadoID = '"& Eid &"'  "
                                                                        set rsPlz = dbconn.execute(sqlPlz)
                                                                        if not rsPlz.bof and not rsPlz.eof then
                                                                            PlzSup = trim(rsPlz("Emp_PlazaID"))
                                                                            sqlest = "select b.Psm_Estatus                           " & _
                                                                                     "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                                     "     HRM10525 d                                " & _
                                                                                     "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                     "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                     "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                     "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                                     "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                                     "and   a.Psf_NumPaso       = 2                  " & _
                                                                                     "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                     "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                                     "and   a.Psf_Seccion       = 'OBJHAB'           " & _
                                                                                     "and   a.Psf_Secuencia1    = 10                 " & _
                                                                                     "and   c.Emp_PlazaSuperior = '"& PlzSup &"'     " & _
                                                                                     "and   c.Emp_CompaniaID    = '"&  Cid   &"'     " & _
                                                                                     "and   b.Psm_Estatus       = 0                  "
                                                                            set rsE = dbconn.execute(sqlest)
                                                                            if not rsE.bof and not rsE.eof then
                                                                                semsec = "red"
                                                                            end if
                                                                            '<!-- Buscamos si alguna Plaza asignada está vacante para asignar la Estructura de Colaboradores -->
                                                                            sqlVcn = "select Otm_Plaza from HRM10100 where Otm_Plaza_Superior = "& PlzSup &" and Otm_Empleado = 0 "
                                                                            set rsVcn = dbconn.execute(sqlVcn)
                                                                            if not rsVcn.bof and not rsVcn.eof then
                                                                                do while not rsVcn.eof
                                                                                    PlzVcn = trim(rsVcn("Otm_Plaza"))
                                                                                    sqlEvc = "select b.Psm_Estatus                           " & _
                                                                                             "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                                             "     HRM10525 d                                " & _
                                                                                             "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                             "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                             "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                             "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                                             "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                                             "and   a.Psf_NumPaso       = 2                  " & _
                                                                                             "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                             "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                                             "and   a.Psf_Seccion       = 'OBJHAB'           " & _
                                                                                             "and   a.Psf_Secuencia1    = 10                 " & _
                                                                                             "and   c.Emp_PlazaSuperior = '"& PlzVcn &"'     " & _
                                                                                             "and   b.Psm_Estatus       = 0                  "
                                                                                    set rsEvc = dbconn.execute(sqlEvc)
                                                                                    if not rsEvc.bof and not rsEvc.eof then
                                                                                        semsec = "red"
                                                                                    end if
                                                                                    rsVcn.movenext
                                                                                loop
                                                                            end if
                                                                            rsVcn.close
                                                                            set rsVcn = nothing
                                                                            '<!-- Termina Busqueda de Plazas Vacantes -->
                                                                        end if
                                                                        %>
                                                                        <li class="treeview">
                                                                        <%
                                                                        Do while not rsP3.eof
                                                                            if fr = 0 then
                                                                                %>
                                                                                <a href="#"><i class="fa fa-circle text-<%= semsec %>"></i>&nbsp;<%= rsP3("Trd_Seccion") %></a>
                                                                                <ul class="treeview-menu">
                                                                                <%
                                                                                fr = 1
                                                                            end if
                                                                            if Tvl < 3 then
                            '                                                   <!-- Revisamos si el Empleado tiene Objetivos del año anterior de lo contrario abrimos la posibilidad de que cierre por Habilidades-->
                                                                                sqlOaa = "select Pod_Partida from HRM10531       " & _
                                                                                         "where Pod_CorporativoID = '5000'       " & _
                                                                                         "and   Pod_EmpleadoID    = '"& Eid &"'  " & _
                                                                                         "and   Pod_Ejercicio     =  "& Eja &"   "
                            '                                                   response.write(sqlOaa)
                                                                                set rsOaa = dbconn.execute(sqlOaa)
                                                                                if not rsOaa.bof and not rsOaa.eof then
                                                                                    CieHab = 0
                                                                                else
                                                                                    CieHab = 1
                                                                                end if
                                                                                if date >= P2FecIniD and date <= P2FecFinD then
                                                                                    if CInt(rsP3("Psm_Estatus")) = 0 then
                                                                                        P2Est = P2Est + 1
                                                                                        semelm = "red"
                                                                                        if CieHab = 1 then
                                                                                            %>
                                                                                            <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                            <%
                                                                                        else
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                            <%
                                                                                        end if
                                                                                    else
                                                                                        if CInt(rsP3("Psm_Estatus")) = 1 then
                                                                                            P2Est = P2Est + 1
                                                                                            semelm = "yellow"
                                                                                            if CieHab = 1 then
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                                <%
                                                                                            else
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                                <%
                                                                                            end if
                                                                                        else
                                                                                            semelm = "green"
                                                                                            if CieHab = 1 then
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                                <%
                                                                                            else
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                                <%
                                                                                            end if
                                                                                        end if
                                                                                    end if
                                                                                else
                                                                                    if CInt(rsP3("Psm_Estatus")) = 0 then
                                                                                        P2Est = P2Est + 1
                                                                                        semelm = "red"
                                                                                        %>
                                                                                        <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                        <%
                                                                                    else
                                                                                        if CInt(rsP3("Psm_Estatus")) = 1 then
                                                                                            P2Est = P2Est + 1
                                                                                            semelm = "yellow"
                                                                                            if CieHab = 1 then
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                                <%
                                                                                            else
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                                <%
                                                                                            end if
                                                                                        else
                                                                                            semelm = "green"
                                                                                            if CieHab = 1 then
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                                <%
                                                                                            else
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                                <%
                                                                                            end if
                                                                                        end if
                                                                                    end if
                                                                                end if
                                                                            else
                                                                                if date >= P2FecIniD and date <= P2FecFinD then
                                                                                    if CInt(rsP3("Psm_Estatus")) = 0 then
                                                                                        P2Est = P2Est + 1
                                                                                        semelm = "red"
                                                                                        %>
                                                                                        <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                        <%
                                                                                    else
                                                                                        if CInt(rsP3("Psm_Estatus")) = 1 then
                                                                                            P2Est = P2Est + 1
                                                                                            semelm = "yellow"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                            <%
                                                                                        else
                                                                                            semelm = "green"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                            <%
                                                                                        end if
                                                                                    end if
                                                                                else
                                                                                    if CInt(rsP3("Psm_Estatus")) = 0 then
                                                                                        P2Est = P2Est + 1
                                                                                        semelm = "red"
                                                                                        %>
                                                                                        <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                        <%
                                                                                    else
                                                                                        if CInt(rsP3("Psm_Estatus")) = 1 then
                                                                                            P2Est = P2Est + 1
                                                                                            semelm = "yellow"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                            <%
                                                                                        else
                                                                                            semelm = "green"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP3("Trd_Texto") %></a></li>
                                                                                            <%
                                                                                        end if
                                                                                    end if
                                                                                end if
                                                                            end if
                                                                            rsP3.movenext
                                                                        Loop
                                                                        rsP3.close
                                                                        set rsP3 = Nothing

                                                                        sqlClb = "select b.Psm_Estatus,        c.Emp_EmpleadoID, " & _
                                                                                 "       c.Emp_NombreCompleto, c.Emp_CompaniaID, " & _
                                                                                 "       d.Evh_TipoEval                          " & _
                                                                                 "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                                 "     HRM10525 d                                " & _
                                                                                 "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                 "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                 "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                 "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                                 "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                                 "and   a.Psf_NumPaso       = 2                  " & _
                                                                                 "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                 "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                                 "and   a.Psf_Seccion       = 'OBJHAB'           " & _
                                                                                 "and   a.Psf_Secuencia1    = 10                 " & _
                                                                                 "and   c.Emp_PlazaSuperior = '"& PlzSup &"'     " & _
                                                                                 "and   c.Emp_CompaniaID    = '"&  Cid   &"'     "
                                                                        set rsClb = dbconn.execute(sqlClb)
                                        '                                  response.write(sqlClb)
                                                                        if not rsClb.bof and not rsClb.eof then
                                                                            do while not rsClb.eof
                                                                                if rsClb("Evh_TipoEval") < 3 then
                            '                                                       <!-- Revisamos si el Empleado tiene Objetivos del año anterior de lo contrario abrimos la posibilidad de que cierre por Habilidades-->
                                                                                    sqlOaa = "select Pod_Partida from HRM10531                                 " & _
                                                                                             "where Pod_CorporativoID = '5000'                                 " & _
                                                                                             "and   Pod_EmpleadoID    = '"& trim(rsClb("Emp_EmpleadoID")) &"'  " & _
                                                                                             "and   Pod_Ejercicio     =  "& Eja &"                             "
                            '                                                       response.write(sqlOaa)
                                                                                    set rsOaa = dbconn.execute(sqlOaa)
                                                                                    if not rsOaa.bof and not rsOaa.eof then
                                                                                        CieHab = 0
                                                                                    else
                                                                                        CieHab = 1
                                                                                    end if
                                                                                    if date >= P2FecIniD and date <= P2FecFinD then
                                                                                        if rsClb("Psm_Estatus") = 0 then
                                                                                            P2Est = P2Est + 1
                                                                                            semelm = "red"
                                                                                            if CieHab = 0 then
                                                                                                %>
                                                                                                <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            else
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            end if
                                                                                        else
                                                                                            if rsClb("Psm_Estatus") = 1 then
                                                                                                P2Est = P2Est + 1
                                                                                                semelm = "yellow"
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeAutCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            else
                                                                                                semelm = "green"
                                                                                                if CieHab = 0 then
                                                                                                    %>
                                                                                                    <li><a href="Hrm_PadeCnsCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                                    <%
                                                                                                else
                                                                                                    %>
                                                                                                    <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                                    <%
                                                                                                end if
                                                                                            end if
                                                                                        end if
                                                                                    else
                                                                                        if rsClb("Psm_Estatus") = 0 then
                                                                                            P2Est = P2Est + 1
                                                                                            semelm = "red"
                                                                                            %>
                                                                                            <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        else
                                                                                            if rsClb("Psm_Estatus") = 1 then
                                                                                                P2Est = P2Est + 1
                                                                                                semelm = "yellow"
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            else
                                                                                                semelm = "green"
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            end if
                                                                                        end if
                                                                                    end if
                                                                                else
                                                                                    if date >= P2FecIniD and date <= P2FecFinD then
                                                                                        if rsClb("Psm_Estatus") = 0 then
                                                                                            P2Est = P2Est + 1
                                                                                            semelm = "red"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        else
                                                                                            semelm = "green"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        end if
                                                                                    else
                                                                                        if rsClb("Psm_Estatus") = 0 then
                                                                                            P2Est = P2Est + 1
                                                                                            semelm = "red"
                                                                                            %>
                                                                                            <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        else
                                                                                            semelm = "green"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        end if
                                                                                    end if
                                                                                end if
                                                                                rsClb.movenext
                                                                            loop
                                                                            rsClb.close
                                                                            set rsClb = Nothing
                                                                        end if

                                                                        '<!-- Buscamos si alguna Plaza asignada está vacante para asignar la Estructura de Colaboradores -->
                                                                        sqlVcn = "select Otm_Plaza from HRM10100 where Otm_Plaza_Superior = "& PlzSup &" and Otm_Empleado = 0 "
                                                                        set rsVcn = dbconn.execute(sqlVcn)
                                                                        if not rsVcn.bof and not rsVcn.eof then
                                                                            do while not rsVcn.eof
                                                                                PlzVcn = trim(rsVcn("Otm_Plaza"))
                                                                                sqlClv = "select b.Psm_Estatus,        c.Emp_EmpleadoID, " & _
                                                                                         "       c.Emp_NombreCompleto, c.Emp_CompaniaID, " & _
                                                                                         "       d.Evh_TipoEval                          " & _
                                                                                         "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                                         "     HRM10525 d                                " & _
                                                                                         "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                         "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                         "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                         "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                                         "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                                         "and   a.Psf_NumPaso       = 2                  " & _
                                                                                         "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                         "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                                         "and   a.Psf_Seccion       = 'OBJHAB'           " & _
                                                                                         "and   c.Emp_PlazaSuperior = '"& PlzVcn &"'     "
                                                                                set rsClv = dbconn.execute(sqlClv)

                                                                                if not rsClv.bof and not rsClv.eof then
                                                                                    do while not rsClv.eof
                                                                                        if rsClv("Evh_TipoEval") < 3 then
                                                                                            if date >= P2FecIniD and date <= P2FecFinD then
                                                                                                if rsClv("Psm_Estatus") = 0 then
                                                                                                    P2Est = P2Est + 1
                                                                                                    semelm = "red"
                                    '                                                               <!-- Revisamos si el Empleado tiene Objetivos del año anterior de lo contrario abrimos la posibilidad de que cierre por Habilidades-->
                                                                                                    sqlOaa = "select Pod_Partida from HRM10531                                 " & _
                                                                                                             "where Pod_CorporativoID = '5000'                                 " & _
                                                                                                             "and   Pod_EmpleadoID    = '"& trim(rsClv("Emp_EmpleadoID")) &"'  " & _
                                                                                                             "and   Pod_Ejercicio     =  "& Eja &"                             "
                            '                                                                        response.write(sqlOaa)
                                                                                                    set rsOaa = dbconn.execute(sqlOaa)
                                                                                                    if not rsOaa.bof and not rsOaa.eof then
                                                                                                        %>
                                                                                                        <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                        <%
                                                                                                    else
                                                                                                        %>
                                                                                                        <li><a href="Hrm_PadeCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                        <%
                                                                                                    end if
                                                                                                else
                                                                                                    if rsClv("Psm_Estatus") = 1 then
                                                                                                        P2Est = P2Est + 1
                                                                                                        semelm = "yellow"
                                                                                                        %>
                                                                                                        <li><a href="Hrm_PadeAutCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                        <%
                                                                                                    else
                                                                                                        semelm = "green"
                                                                                                        %>
                                                                                                        <li><a href="Hrm_PadeCnsCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                        <%
                                                                                                    end if
                                                                                                end if
                                                                                            else
                                                                                                if rsClv("Psm_Estatus") = 0 then
                                                                                                    P2Est = P2Est + 1
                                                                                                    semelm = "red"
                                                                                                    %>
                                                                                                    <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                    <%
                                                                                                else
                                                                                                    if rsClv("Psm_Estatus") = 1 then
                                                                                                        P2Est = P2Est + 1
                                                                                                        semelm = "yellow"
                                                                                                        %>
                                                                                                        <li><a href="Hrm_PadeCnsCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                        <%
                                                                                                    else
                                                                                                        semelm = "green"
                                                                                                        %>
                                                                                                        <li><a href="Hrm_PadeCnsCieObj.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                        <%
                                                                                                    end if
                                                                                                end if
                                                                                            end if
                                                                                        else
                                                                                            if date >= P2FecIniD and date <= P2FecFinD then
                                                                                                if rsClv("Psm_Estatus") = 0 then
                                                                                                    P2Est = P2Est + 1
                                                                                                    semelm = "red"
                                                                                                    %>
                                                                                                    <li><a href="Hrm_PadeCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                    <%
                                                                                                else
                                                                                                    semelm = "green"
                                                                                                    %>
                                                                                                    <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                    <%
                                                                                                end if
                                                                                            else
                                                                                                if rsClv("Psm_Estatus") = 0 then
                                                                                                    P2Est = P2Est + 1
                                                                                                    semelm = "red"
                                                                                                    %>
                                                                                                    <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                    <%
                                                                                                else
                                                                                                    semelm = "green"
                                                                                                    %>
                                                                                                    <li><a href="Hrm_PadeCnsCieHab.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                    <%
                                                                                                end if
                                                                                            end if
                                                                                        end if
                                                                                        rsClv.movenext
                                                                                    loop
                                                                                end if
                                                                                rsClv.close
                                                                                set rsClv = nothing
                                                                                rsVcn.movenext
                                                                            loop
                                                                        end if
                                                                        rsVcn.close
                                                                        set rsVcn = nothing
                                                                        '<!-- Termina Busqueda de Plazas Vacantes -->
                                                                        %>
                                                                        </ul>
                                                                        </li>
                                                                    <%
                                                                    end if
                                                                end if
                                                                %>
                                                                <!--  ***************** Cierre Objetivos Fin *****************  -->

                                                                <!--  ***************** Retroalimentación Inicio *****************  -->
                                                                <%
                                                                sqlP4 = "select a.*,      b.Psm_Estatus,               " & _
                                                                        "       c.Trd_Texto as Trd_Seccion,            " & _
                                                                        "       d.Trd_Texto                            " & _
                                                                        "from HRM105A0 a, HRM10502 b,                  " & _
                                                                        "     HRM10002 c, HRM10002 d                   " & _
                                                                        "where a.Psf_ParametroID = b.Psm_SemaforoID    " & _
                                                                        "and   a.Psf_Seccion     = c.Trd_ElementoID    " & _
                                                                        "and   a.Psf_ParametroID = d.Trd_ElementoID    " & _
                                                                        "and   a.Psf_NumPaso     = 2                   " & _
                                                                        "and   a.Psf_Seccion     = 'RETALM'            " & _
                                                                        "and   a.Psf_Secuencia1  = 20                  " & _
                                                                        "and   b.Psm_EmpleadoID  = '"& Eid &"'         " & _
                                                                        "and   b.Psm_Ejercicio   =  "& Ejr &"          " & _
                                                                        "and   c.Trd_IdiomaID    = '"& Lng &"'         " & _
                                                                        "and   d.Trd_IdiomaID    = '"& Lng &"'         " & _
                                                                        "order by a.Psf_NumPaso,   a.Psf_Secuencia1,   " & _
                                                                        "         a.Psf_Secuencia2                     "
                                                                set rsP4 = dbconn.execute(sqlP4)
                                                                'response.write(sqlP4)
                                                                if not rsP4.bof and not rsP4.eof then
                                                                    fr   = 0
                                                                    sqlest = "select a.Psm_Estatus                         " & _
                                                                             "from HRM10502 a, HRM105A0 b                  " & _
                                                                             "where  a.Psm_SemaforoID = b.Psf_ParametroID  " & _
                                                                             "and    b.Psf_NumPaso    = 2                  " & _
                                                                             "and    b.Psf_Seccion    = 'RETALM'           " & _
                                                                             "and    b.Psf_Secuencia1 = 20                 " & _
                                                                             "and    a.Psm_EmpleadoID = '"& Eid &"'        " & _
                                                                             "and    a.Psm_Ejercicio  =  "& Ejr &"         " & _
                                                                             "and    a.Psm_Estatus    = 0                  "
                                                                    set rsE = dbconn.execute(sqlest)
                                                                    if not rsE.bof and not rsE.eof then
                                                                        semsec = "red"
                                                                    else
                                                                        semsec = "green"
                                                                    end if
                                                                    sqlPlz = "select Emp_PlazaID from HRM10220 where Emp_EmpleadoID = '"& Eid &"'  "
                                                                    set rsPlz = dbconn.execute(sqlPlz)
                                                                    if not rsPlz.bof and not rsPlz.eof then
                                                                        PlzSup = trim(rsPlz("Emp_PlazaID"))
                                                                        sqlest = "select b.Psm_Estatus                           " & _
                                                                                 "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                                 "     HRM10525 d                                " & _
                                                                                 "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                 "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                 "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                 "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                                 "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                                 "and   a.Psf_NumPaso       = 2                  " & _
                                                                                 "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                 "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                                 "and   a.Psf_Seccion       = 'RETALM'           " & _
                                                                                 "and   a.Psf_Secuencia1    = 20                 " & _
                                                                                 "and   c.Emp_PlazaSuperior = '"& PlzSup &"'     " & _
                                                                                 "and   c.Emp_CompaniaID    = '"&  Cid   &"'     " & _
                                                                                 "and   b.Psm_Estatus       = 0                  "
                                                                        set rsE = dbconn.execute(sqlest)
                                                                        if not rsE.bof and not rsE.eof then
                                                                            semsec = "red"
                                                                        end if
                                                                        '<!-- Buscamos si alguna Plaza asignada está vacante para asignar la Estructura de Colaboradores -->
                                                                        sqlVcn = "select Otm_Plaza from HRM10100 where Otm_Plaza_Superior = "& PlzSup &" and Otm_Empleado = 0 "
                                                                        set rsVcn = dbconn.execute(sqlVcn)
                                                                        if not rsVcn.bof and not rsVcn.eof then
                                                                            do while not rsVcn.eof
                                                                                PlzVcn = trim(rsVcn("Otm_Plaza"))
                                                                                sqlEvc = "select b.Psm_Estatus                           " & _
                                                                                         "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                                         "     HRM10525 d                                " & _
                                                                                         "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                         "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                         "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                         "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                                         "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                                         "and   a.Psf_NumPaso       = 2                  " & _
                                                                                         "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                         "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                                         "and   a.Psf_Seccion       = 'RETALM'           " & _
                                                                                         "and   a.Psf_Secuencia1    = 20                 " & _
                                                                                         "and   c.Emp_PlazaSuperior = '"& PlzVcn &"'     " & _
                                                                                         "and   b.Psm_Estatus       = 0                  "
                                                                                set rsEvc = dbconn.execute(sqlEvc)
                                                                                if not rsEvc.bof and not rsEvc.eof then
                                                                                    semsec = "red"
                                                                                end if
                                                                                rsVcn.movenext
                                                                            loop
                                                                        end if
                                                                        rsVcn.close
                                                                        set rsVcn = nothing
                                                                        '<!-- Termina Busqueda de Plazas Vacantes -->
                                                                    end if

                                                                    %>
                                                                    <li class="treeview">
                                                                    <%
                                                                    Do while not rsP4.eof
                                                                        if fr = 0 then
                                                                            %>
                                                                            <a href="#"><i class="fa fa-circle text-<%= semsec %>"></i>&nbsp;<%= rsP4("Trd_Seccion") %></a>
                                                                            <ul class="treeview-menu">
                                                                            <%
                                                                            fr = 1
                                                                        end if
                                                                        if date >= P2FecIniD and date <= P2FecFinD then
                                                                            if CInt(rsP4("Psm_Estatus")) = 0 then
                                                                                P2Est = P2Est + 1
                                                                                semelm = "red"
                                                                                %>
                                                                                <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sgn=2" %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP4("Trd_Texto") %></a></li>
                                                                                <%
                                                                            else
                                                                                if CInt(rsP4("Psm_Estatus")) = 1 then
                                                                                    P2Est = P2Est + 1
                                                                                    semelm = "yellow"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sgn=2"%>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP4("Trd_Texto") %></a></li>
                                                                                     <%
                                                                                else
                                                                                    semelm = "green"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sgn=2" %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP4("Trd_Texto") %></a></li>
                                                                                    <%
                                                                                end if
                                                                            end if
                                                                        else
                                                                            if CInt(rsP4("Psm_Estatus")) = 0 then
                                                                                P2Est = P2Est + 1
                                                                                semelm = "red"
                                                                                %>
                                                                                <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP4("Trd_Texto") %></a></li>
                                                                                <%
                                                                            else
                                                                                if CInt(rsP4("Psm_Estatus")) = 1 then
                                                                                    P2Est = P2Est + 1
                                                                                    semelm = "yellow"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP4("Trd_Texto") %></a></li>
                                                                                     <%
                                                                                else
                                                                                    semelm = "green"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Unm & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP4("Trd_Texto") %></a></li>
                                                                                    <%
                                                                                end if
                                                                            end if
                                                                        end if
                                                                        rsP4.movenext
                                                                    Loop
                                                                    rsP4.close
                                                                    set rsP4 = Nothing
                                                                    sqlClb = "select b.Psm_Estatus,        c.Emp_EmpleadoID, " & _
                                                                             "       c.Emp_NombreCompleto, c.Emp_CompaniaID, " & _
                                                                             "       d.Evh_TipoEval                          " & _
                                                                             "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                             "     HRM10525 d                                " & _
                                                                             "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                             "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                             "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                             "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                             "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                             "and   a.Psf_NumPaso       = 2                  " & _
                                                                             "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                             "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                             "and   a.Psf_Seccion       = 'RETALM'           " & _
                                                                             "and   a.Psf_Secuencia1    = 20                 " & _
                                                                             "and   c.Emp_PlazaSuperior = '"& PlzSup &"'     " & _
                                                                             "and   c.Emp_CompaniaID    = '"&  Cid   &"'     "
                                                                    set rsClb = dbconn.execute(sqlClb)
                                        '                           response.write(sqlClb)
                                                                    if not rsClb.bof and not rsClb.eof then
                                                                        do while not rsClb.eof
                                                                            if date >= P2FecIniD and date <= P2FecFinD then
                                                                                if rsClb("Psm_Estatus") = 0 then
                                                                                    P2Est = P2Est + 1
                                                                                    semelm = "red"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sgn=1" %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                    <%
                                                                                else
                                                                                    if rsClb("Psm_Estatus") = 1 then
                                                                                        P2Est = P2Est + 1
                                                                                        semelm = "yellow"
                                                                                        %>

                                                                                        <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                        <%
                                                                                    else
                                                                                        semelm = "green"
                                                                                        %>
                                                                                        <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                        <%
                                                                                    end if
                                                                                end if
                                                                            else
                                                                                if rsClb("Psm_Estatus") = 0 then
                                                                                    P2Est = P2Est + 1
                                                                                    semelm = "red"
                                                                                    %>
                                                                                    <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                    <%
                                                                                else
                                                                                    if rsClb("Psm_Estatus") = 1 then
                                                                                        P2Est = P2Est + 1
                                                                                        semelm = "yellow"
                                                                                        %>
                                                                                        <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                        <%
                                                                                    else
                                                                                        semelm = "green"
                                                                                        %>
                                                                                        <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClb("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClb("Emp_NombreCompleto")) & "&Cid=" & trim(rsClb("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClb("Emp_NombreCompleto") %></label></a></li>
                                                                                        <%
                                                                                    end if
                                                                                end if
                                                                            end if
                                                                            rsClb.movenext
                                                                        loop
                                                                        rsClb.close
                                                                        set rsClb = Nothing
                                                                    end if

                                                                    '<!-- Buscamos si alguna Plaza asignada está vacante para asignar la Estructura de Colaboradores -->
                                                                    sqlVcn = "select Otm_Plaza from HRM10100 where Otm_Plaza_Superior = "& PlzSup &" and Otm_Empleado = 0 "
                                                                    set rsVcn = dbconn.execute(sqlVcn)
                                                                    if not rsVcn.bof and not rsVcn.eof then
                                                                        do while not rsVcn.eof
                                                                            PlzVcn = trim(rsVcn("Otm_Plaza"))
                                                                            sqlClv = "select b.Psm_Estatus,        c.Emp_EmpleadoID, " & _
                                                                                     "       c.Emp_NombreCompleto, c.Emp_CompaniaID, " & _
                                                                                     "       d.Evh_TipoEval                          " & _
                                                                                     "from HRM105A0 a, HRM10502 b, HRM10220 c,       " & _
                                                                                     "     HRM10525 d                                " & _
                                                                                     "where a.Psf_ParametroID   = b.Psm_SemaforoID   " & _
                                                                                     "and   b.Psm_CompaniaID    = c.Emp_CompaniaID   " & _
                                                                                     "and   b.Psm_EmpleadoID    = c.Emp_EmpleadoID   " & _
                                                                                     "and   c.Emp_CompaniaID    = d.Evh_CompaniaID   " & _
                                                                                     "and   c.Emp_EmpleadoID    = d.Evh_EmpleadoID   " & _
                                                                                     "and   a.Psf_NumPaso       = 2                  " & _
                                                                                     "and   b.Psm_Ejercicio     =  "& Ejr &"         " & _
                                                                                     "and   d.Evh_Ejercicio     =  "& Ejr &"         " & _
                                                                                     "and   a.Psf_Seccion       = 'RETALM'           " & _
                                                                                     "and   a.Psf_Secuencia1    = 20                 " & _
                                                                                     "and   c.Emp_PlazaSuperior = '"& PlzVcn &"'     "
                                                                            set rsClv = dbconn.execute(sqlClv)
                                                                            if not rsClv.bof and not rsClv.eof then
                                                                                do while not rsClv.eof
                                                                                    if date >= P2FecIniD and date <= P2FecFinD then
                                                                                        if rsClv("Psm_Estatus") = 0 then
                                                                                            P2Est = P2Est + 1
                                                                                            semelm = "red"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Sgn=1" %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        else
                                                                                            if rsClv("Psm_Estatus") = 1 then
                                                                                                P2Est = P2Est + 1
                                                                                                semelm = "yellow"
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            else
                                                                                                semelm = "green"
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            end if
                                                                                        end if
                                                                                    else
                                                                                        if rsClv("Psm_Estatus") = 0 then
                                                                                            P2Est = P2Est + 1
                                                                                            semelm = "red"
                                                                                            %>
                                                                                            <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                            <%
                                                                                        else
                                                                                            if rsClv("Psm_Estatus") = 1 then
                                                                                                P2Est = P2Est + 1
                                                                                                semelm = "yellow"
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            else
                                                                                                semelm = "green"
                                                                                                %>
                                                                                                <li><a href="Hrm_PadeCnsRetAlm.asp?Ejr=<%= Ejr & "&Dsc=" & Dsc & "&Nem=" & trim(rsClv("Emp_EmpleadoID")) & "&Nmb=" & trim(rsClv("Emp_NombreCompleto")) & "&Cid=" & trim(rsClv("Emp_CompaniaID")) & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<label style="font-size: x-small"><%= rsClv("Emp_NombreCompleto") %></label></a></li>
                                                                                                <%
                                                                                            end if
                                                                                        end if
                                                                                    end if
                                                                                    rsClv.movenext
                                                                                loop
                                                                            end if
                                                                            rsClv.close
                                                                            set rsClv = nothing
                                                                            rsVcn.movenext
                                                                        loop
                                                                    end if
                                                                    rsVcn.close
                                                                    set rsVcn = nothing
                                                                    '<!-- Termina Busqueda de Plazas Vacantes -->

                                                                    %>
                                                                    </ul>
                                                                    </li>
                                                                    <%
                                                                end if
                                                                %>
                                                                <!--  ***************** Retroalimentación  Fin   *****************  -->

                                                            </ul>
                                                        </section>
                                                        <div class="box-footer" style="background-color: #808080; color: #fff; text-align: center">
                                                            <%= BxFt01 & "  " & P2FecIni %>
                                                            </br>
                                                            <%= BxFt02 & "  " & P2FecFin %>
                                                        </div>
                                                        <div class="box-footer" style="text-align: center">
                                                            <%= BxFt03 %>&nbsp;
                                                            <%
                                                            if date >= P2FecIniD and date <= P2FecFinD then
                                                                if P2Est = 0 then
                                                                    %><span class="label label-success">En Tiempo</span><%
                                                                else
                                                                    %><span class="label label-danger">En Curso</span><%
                                                                end if
                                                            else
                                                                if date > P2FecFinD then
                                                                    if P2Est = 0 then
                                                                        %><span class="label label-success">Concluida En Tiempo</span><%
                                                                    else
                                                                        %><span class="label label-danger">Retraso</span><%
                                                                    end if
                                                                else
                                                                    if date < P2FecIniD then
                                                                        %><span class="label label-primary">No Iniciada</span><%
                                                                    end if
                                                                end if
                                                            end if
                                                            %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Paso 2 Fin -->

                                        <!-- Paso 3 Inicio -->
                                        <div class="col-md-3 col-sm-6 col-xs-12">
                                            <div class="box" style="border-top-color: #fff">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title"><i class="fa fa-crosshairs"></i> &nbsp;&nbsp;<%= BxHd03 %></h3>
                                                </div>
                                                <div class="box" style="border-top-color: #9d3434; border-top-width: thick">
                                                    <div class="box-body">
                                                        <section class="sidebar">
                                                            <ul class="sidebar-menu">

                                                                <!--  ***************** Datos Generales Inicio *****************  -->
                                                                <%
                                                                sqlP1 = "select a.*,      b.Psm_Estatus,               " & _
                                                                        "       c.Trd_Texto as Trd_Seccion,            " & _
                                                                        "       d.Trd_Texto                            " & _
                                                                        "from HRM105A0 a, HRM10502 b,                  " & _
                                                                        "     HRM10002 c, HRM10002 d                   " & _
                                                                        "where a.Psf_ParametroID = b.Psm_SemaforoID    " & _
                                                                        "and   a.Psf_Seccion     = c.Trd_ElementoID    " & _
                                                                        "and   a.Psf_ParametroID = d.Trd_ElementoID    " & _
                                                                        "and   a.Psf_NumPaso     = 3                   " & _
                                                                        "and   a.Psf_Seccion     = 'DATGEN'            " & _
                                                                        "and   b.Psm_EmpleadoID  = '"& Eid &"'         " & _
                                                                        "and   b.Psm_Ejercicio   =  "& Ejr &"          " & _
                                                                        "and   c.Trd_IdiomaID    = '"& Lng &"'         " & _
                                                                        "and   d.Trd_IdiomaID    = '"& Lng &"'         " & _
                                                                        "order by a.Psf_NumPaso,   a.Psf_Secuencia1,   " & _
                                                                        "         a.Psf_Secuencia2                     "
                                                                set rsP1 = dbconn.execute(sqlP1)
                                                                if not rsP1.bof and not rsP1.eof then
                                                                    fr   = 0
                                                                    sqlest = "select a.Psm_Estatus                         " & _
                                                                             "from HRM10502 a, HRM105A0 b                  " & _
                                                                             "where  a.Psm_SemaforoID = b.Psf_ParametroID  " & _
                                                                             "and    b.Psf_NumPaso    = 3                  " & _
                                                                             "and    b.Psf_Seccion    = 'DATGEN'           " & _
                                                                             "and    a.Psm_EmpleadoID = '"& Eid &"'        " & _
                                                                             "and    a.Psm_Ejercicio  =  "& Ejr &"         " & _
                                                                             "and    a.Psm_Estatus    = 0                  "
                                                                    set rsE = dbconn.execute(sqlest)
                                                                    if not rsE.bof and not rsE.eof then
                                                                        semsec = "red"
                                                                    else
                                                                        semsec = "green"
                                                                    end if
                                                                    %>
                                                                    <li class="treeview">
                                                                        <%
                                                                        Do while not rsP1.eof
                                                                            if fr = 0 then
                                                                                %>
                                                                                <a href="#"><i class="fa fa-circle text-<%= semsec %>"></i>&nbsp;<%= rsP1("Trd_Seccion") %></a>
                                                                                <ul class="treeview-menu">
                                                                                <%
                                                                                fr = 1
                                                                            end if
                                                                            if rsP1("Psm_Estatus") = 0 then
                                                                                P3Est = P3Est + 1
                                                                                semelm = "red"
                                                                            else
                                                                                  semelm = "green"
                                                                            end if
                                                                            select case trim(rsP1("Psf_ParametroID"))
                                                                                case "DATGEN0010" Prm = 1
                                                                                case "DATGEN0020" Prm = 2
                                                                                case "DATGEN0030" Prm = 3
                                                                                case "DATGEN0040" Prm = 4
                                                                                case "DATGEN0050" Prm = 5
                                                                                case "DATGEN0060" Prm = 6
                                                                                case "DATGEN0070" Prm = 7
                                                                                case "DATGEN0080" Prm = 8
                                                                                case "DATGEN0090" Prm = 9
                                                                            end select
                                                                            if date >= P3FecIniD and date <= P3FecFinD then
                                                                                %>
                                                                                <li><a href="Hrm_PadeP1DG.asp?Prm=<%= Prm & "&Ejr=" & Ejr & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid %>" target="_blank"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP1("Trd_Texto") %></a></li>
                                                                                <%
                                                                            else
                                                                                %>
                                                                                <li><a href="#"><i class="fa fa-arrow-circle-right text-<%= semelm %>"></i>&nbsp;<%= rsP1("Trd_Texto") %></a></li>
                                                                                <%
                                                                            end if
                                                                            rsP1.movenext
                                                                        Loop
                                                                        rsP1.close
                                                                        set rsP1 = Nothing
                                                                        %>
                                                                        </ul>
                                                                    </li>
                                                                    <%
                                                                end if
                                                                %>
                                                                <!--  ***************** Datos Generales Fin    *****************  -->

                                                            </ul>
                                                        </section>
                                                        <div class="box-footer" style="background-color: #808080; color: #fff; text-align: center">
                                                            <%= BxFt01 & "  " & P3FecIni %>
                                                            </br>
                                                            <%= BxFt02 & "  " & P3FecFin %>
                                                        </div>
                                                        <div class="box-footer" style="text-align: center">
                                                            <%= BxFt03 %>&nbsp;
                                                            <%
                                                            if date >= P3FecIniD and date <= P3FecFinD then
                                                                if P3Est = 0 then
                                                                    %><span class="label label-success">En Tiempo</span><%
                                                                else
                                                                    %><span class="label label-danger">En Curso</span><%
                                                                end if
                                                            else
                                                                if date > P3FecFinD then
                                                                    if P3Est = 0 then
                                                                        %><span class="label label-success">Concluida En Tiempo</span><%
                                                                    else
                                                                        %><span class="label label-danger">Retraso</span><%
                                                                    end if
                                                                else
                                                                    if date < P3FecIniD then
                                                                        %><span class="label label-primary">No Iniciada</span><%
                                                                    end if
                                                                end if
                                                            end if
                                                            %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Paso 3 Fin -->


                                    </div>
                                    <!-- ============= EJERCICIO PADE ==================  -->
                                </div>
                            </div>
                            <%
                        end if
                        %>
                        <!-- CONTENIDO PRINCIPAL Fin    -->

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

<%@ Language=VBScript %>
<%	response.buffer = false
'	response.expires = 0
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Administrador 12 (Excepciones de Tiempo)</title>
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
              Case "BxHd05"
                BxHd05 = trim(rsTrn("Trd_Texto"))
              Case "BxHd06"
                BxHd06 = trim(rsTrn("Trd_Texto"))
              Case "BxHd07"
                BxHd07 = trim(rsTrn("Trd_Texto"))
              Case "BxHd08"
                BxHd08 = trim(rsTrn("Trd_Texto"))
              Case "BxHd09"
                BxHd09 = trim(rsTrn("Trd_Texto"))
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
              Case "Tb1Hd6"
                Tb1Hd6 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd7"
                Tb1Hd7 = trim(rsTrn("Trd_Texto"))
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
              Case "Tb2Hd6"
                Tb2Hd6 = trim(rsTrn("Trd_Texto"))
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
              Case "SmBtn4"
                SmBtn4  = trim(rsTrn("Trd_Texto"))

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
    Dim Sb2
    dim Smf
    Eid = ""
    Enm = ""
    Sb3 = ""
    Sb2 = ""
    Smf = ""

    Smf = trim(Request.Form("Smf"))
    FecIni = Mid(trim(request.form("FecExp")),7,4)  & "-" & Mid(trim(request.form("FecExp")),1,2)  & "-" & Mid(trim(request.form("FecExp")),4,2)
    FecFin = Mid(trim(request.form("FecExp")),20,4) & "-" & Mid(trim(request.form("FecExp")),14,2) & "-" & Mid(trim(request.form("FecExp")),17,2)

    Eid = trim(Request.QueryString("Eid"))
    if Eid = "" then
        Eid = trim(Request.Form("Eid"))
        if Eid = "" then
            Eid = Uid
        end if
    end if

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

    Sb3 = trim(Request.Form("Sb3"))
    Sb2 = trim(Request.Form("Sb2"))


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

    if Sb3 = "Sb3" then
        '<!--  Agregamos las excepciones de tiempo seleccionadas -->
        sqlExs = "select Exp_EmpleadoID from HRM10560  " & _
                 "where Exp_Ejercicio  =  "& Ejr &"    " & _
                 "and   Exp_CompaniaID = '"& Cid &"'   " & _
                 "and   Exp_EmpleadoID = '"& Eid &"'   " & _
                 "and   Exp_SemaforoID = '"& Smf &"'   "
        set rsExs = dbconn.execute(sqlExs)
        if not rsExs.bof and not rsExs.eof then
            sqlUpd = "update HRM10560                    " & _
                     "set Exp_FecIni = '"& FecIni &"',   " & _
                     "    Exp_FecFin = '"& FecFin &"'    " & _
                     "where Exp_Ejercicio  =  "& Ejr &"  " & _
                     "and   Exp_CompaniaID = '"& Cid &"' " & _
                     "and   Exp_EmpleadoID = '"& Eid &"' " & _
                     "and   Exp_SemaforoID = '"& Smf &"' "
            set rsUpd = dbconn.execute(sqlUpd)
        else
            sqlIns = "insert into HRM10560               " & _
                     "values( "& Ejr &",                 " & _
                     "        '5000',                    " & _
                     "        '"& Cid &"',               " & _
                     "        '"& Eid &"',               " & _
                     "        '"& Smf &"',               " & _
                     "        '"& FecIni &"',            " & _
                     "        '"& FecFin &"',            " & _
                     "        0,'')                      "
            set rsIns = dbconn.execute(sqlIns)
        end if
    end if

    if Sb2 = "Sb2" then
        Ind = Request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                Ptd = trim(Request.Form("Ptd"&i))
                Ejri = Request.Form("Ejr"&i)
                Cidi = trim(Request.Form("Cid"&i))
                Eidi = trim(Request.Form("Eid"&i))
                Smfi = trim(Request.Form("Smf"&i))
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete HRM10560                         " & _
                             "where Exp_CorporativoID = '5000'        " & _
                             "and   Exp_CompaniaID    = '"& Cidi &"'  " & _
                             "and   Exp_EmpleadoID    = '"& Eidi &"'  " & _
                             "and   Exp_Ejercicio     =  "& Ejri &"   " & _
                             "and   Exp_SemaforoID    = '"& Smfi &"'  "
                    set rsd = dbconn.execute(sqldel)
                    ' response.Write(sqldel)
                end if
            next
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
                        <div class="<%= Pan12St %>" id="main" >

                            <div class="tab-content">

                                <!-- Listado de Movimientos -->
                                <div class="tab-pane active" id="Listado" >

                                    <div class="box box-success">
                                        <form action="Hrm_PadeAdmin12.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=12" & "&Sid=" & Sid %>" name="form1" method="post">
                                            <!-- form start -->
                                            <div class="box-body">
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
                                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb3 %></label>
                                                            <input type="text" class="form-control" name="FecExp" id="FecExp" placeholder="<%= Fr1Ph3 %>" required />
                                                        </div>
                                                    </div>

                                                    <div class="col-md-3 col-sm-4">
                                                        <div class="form-group">
                                                            <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb4 %></label>
                                                            <select class="form-control" size="1" id="Smf" name="Smf" required>
                                                                <option class="form-control" value=""><%= Fr1Ph4 %></option>
                                                                <%
                                                                sqlSmf = "select a.Psf_ParametroID,  b.Trd_Texto as Trd_Seccion,  " & _
                                                                         "       c.Trd_Texto                                      " & _
                                                                         "from HRM105A0 a, HRM10002 b, HRM10002 c                 " & _
                                                                         "where a.Psf_RegistroID  = b.Trd_TransaccionID           " & _
                                                                         "and   a.Psf_Seccion     = b.Trd_ElementoID              " & _
                                                                         "and   a.Psf_RegistroID  = c.Trd_TransaccionID           " & _
                                                                         "and   a.Psf_ParametroID = c.Trd_ElementoID              " & _
                                                                         "and   b.Trd_IdiomaID    = '"& Lng &"'                   " & _
                                                                         "and   c.Trd_IdiomaID    = '"& Lng &"'                   " & _
                                                                         "and   a.Psf_RegistroID  = 'PADESEMAFOROS'               " & _
                                                                         "order by a.Psf_NumPaso,    a.Psf_Secuencia1,            " & _
                                                                         "         a.Psf_Secuencia2                               "
                                                                set rsSmf = dbconn.execute(sqlSmf)
                                                                if not rsSmf.bof and not rsSmf.eof then
                                                                    do while not rsSmf.eof
                                                                        %>
                                                                        <option class="form-control" value="<%= rsSmf("Psf_ParametroID") %>"><%= trim(rsSmf("Trd_Seccion")) & " - " & trim(rsSmf("Trd_Texto")) %></option>
                                                                        <%
                                                                        rsSmf.movenext
                                                                    loop
                                                                    rsSmf.close
                                                                    set rsSmf = Nothing
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
                                            </div>
                                            <!-- /.box-body -->
                                        </form>
                                        <%
                                        sqlExc = "select x.*, e.Emp_NombreCompleto, d.Trd_Texto     " & _
                                                 "from   HRM10560 x, HRM10220 e, HRM10002 d         " & _
                                                 "where  x.Exp_CorporativoID = e.Emp_CorporativoID  " & _
                                                 "and    x.Exp_CompaniaID    = e.Emp_CompaniaID     " & _
                                                 "and    x.Exp_EmpleadoID    = e.Emp_EmpleadoID     " & _
                                                 "and    x.Exp_SemaforoID    = d.Trd_ElementoID     " & _
                                                 "and    d.Trd_TransaccionID = 'PADESEMAFOROS'      " & _
                                                 "and    d.Trd_IdiomaID      = '"& Lng &"'          " & _
                                                 "order by x.Exp_CompaniaID, x.Exp_EmpleadoID,      " & _
                                                 "         x.Exp_Ejercicio                          "
                                        set rsX = dbconn.execute(sqlExc)
                                        ' response.write(sqlExc)
                                        if not rsX.bof and not rsX.eof then
                                            i = 0
                                            %>
                                            <div class="box box-primary">
                                                <form action="Hrm_PadeAdmin12.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Prm=12" & "&Sid=" & Sid %>" name="form1a" method="post">
                                                    <div class="box-header">
                                                        <h3 class="box-title">Registrados</h3>
                                                    </div>
                                                    <div class="box-body">
                                                        <table class="table table-bordered table-striped" id="example1" >
                                                            <thead>
                                                            <tr>
                                                                <th><%= Tb2Hd1 %></th>
                                                                <th><%= Tb2Hd2 %></th>
                                                                <th><%= Tb2Hd3 %></th>
                                                                <th><%= Tb2Hd4 %></th>
                                                                <th><%= Tb2Hd5 %></th>
                                                                <th><%= Tb2Hd6 %></th>
                                                                <th style="text-align: center; color: red; font-weight: bold">X</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <%
                                                            do while not rsX.eof
                                                                i = i + 1
                                                                %>
                                                                <tr>
                                                                    <td>
                                                                        <input type="hidden" name="<%= "Ejr"&i %>" id="<%= "Ejr"&i %>" value="<%= rsX("Exp_Ejercicio") %>" />
                                                                        <input type="hidden" name="<%= "Cid"&i %>" id="<%= "Cid"&i %>" value="<%= rsX("Exp_CompaniaID") %>" />
                                                                        <input type="hidden" name="<%= "Eid"&i %>" id="<%= "Eid"&i %>" value="<%= rsX("Exp_EmpleadoID") %>" />
                                                                        <input type="hidden" name="<%= "Smf"&i %>" id="<%= "Smf"&i %>" value="<%= rsX("Exp_SemaforoID") %>" />
                                                                        <%= rsX("Exp_Ejercicio") %>
                                                                    </td>
                                                                    <td>
                                                                        <%= trim(rsx("Exp_CompaniaID")) %>
                                                                    </td>
                                                                    <td>
                                                                        <%= trim(rsx("Exp_EmpleadoID")) %>
                                                                    </td>
                                                                    <td>
                                                                        <%= trim(rsx("Emp_NombreCompleto")) %>
                                                                    </td>
                                                                    <td>
                                                                        <%= trim(rsx("Trd_Texto")) %>
                                                                    </td>
                                                                    <td>
                                                                        <%= trim(rsx("Exp_FecIni")) & " / " & trim(rsx("Exp_FecFin")) %>
                                                                    </td>
                                                                    <td style="text-align: center">
                                                                        <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                                                    </td>
                                                                </tr>
                                                                <%
                                                                rsX.movenext
                                                            loop
                                                            rsX.close
                                                            set rsX = Nothing
                                                            %>
                                                            </tbody>
                                                        </table>
                                                        <div class="box-footer" style="text-align: center">
                                                            <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                                            <button type="submit" class="btn btn-primary" name="Sb2" id="Sb2" value="Sb2" style="background-color: red" ><%= SmBtn4 %></button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <%
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
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="plugins/daterangepicker/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
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

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#FecExp').daterangepicker();
    $('#P2Fecs').daterangepicker();
    $('#P3Fecs').daterangepicker();
    $('#P4Fecs').daterangepicker();
    $('#P5Fecs').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
</script>


</body>
</html>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE Estatus</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0600' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))
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
              Case "BxHd01"
                BxHd01  = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02  = trim(rsTrn("Trd_Texto"))

              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    Dim Ejr
    Ejr    = trim(Request.Form("EjerID"))
    if Ejr = "" then
        Ejr = 0
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

    <% call hdr(TitPri,Dsc) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL INICIO -->

        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#Listado" data-toggle="tab"><%= BxHd01 %></a></li>
                        <li><a href="Hrm_PadeEstatusXls.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&EjerID=" & Ejr & "&Sid=" & Sid %>"><%= BxHd02 %></a></li>
                    </ul>
                      
                    <div class="tab-content">

                        <!-- Listado de Movimientos -->
                        <div class="tab-pane active" id="Listado" >


                            <div class="box box-success">
                                <form action="Hrm_PadeEstatus.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid %>" name="form1" method="post">
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
                                                                if rsEjr("EjerID") = Ejr then
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
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                            <tr>
                                                <th><%= TbHd01 %></th>
                                                <th><%= TbHd02 %></th>
                                                <th><%= TbHd03 %></th>
                                                <th><%= TbHd17 %></th>
                                                <th><%= TbHd04 %></th>
                                                <th><%= TbHd05 %></th>
                                                <th><%= TbHd06 %></th>
                                                <th><%= TbHd07 %></th>
                                                <th><%= TbHd08 %></th>
                                                <th><%= TbHd09 %></th>
                                                <th><%= TbHd10 %></th>
                                                <th><%= TbHd11 %></th>
                                                <th><%= TbHd12 %></th>
                                                <th><%= TbHd13 %></th>
                                                <th><%= TbHd14 %></th>
                                                <th><%= TbHd15 %></th>
                                                <th><%= TbHd16 %></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                if Ejr > 0 then
                                                    sqllis = "select e.Emp_CompaniaID,     e.Emp_EmpleadoID,   " & _
                                                             "       e.Emp_NombreCompleto, v.DescCentroCosto,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'MAT3600010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'MAT3600010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P1M360,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'APROBJ0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'APROBJ0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P1APOB,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'OBJHAB0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'OBJHAB0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P2OBJH,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'RETALM0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'RETALM0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P2RTAL,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0010' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT1,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0020' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0020' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT2,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0030' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0030' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT3,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0040' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0040' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT4,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0050' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0050' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT5,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0060' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0060' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT6,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0070' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0070' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT7,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0080' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0080' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT8,  " & _
                                                             "	     Case When exists (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0090' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) then (select b.Psm_Estatus from HRM10220 a, HRM10502 b where a.Emp_CompaniaID = b.Psm_CompaniaID and a.Emp_EmpleadoID = b.Psm_EmpleadoID and b.Psm_SemaforoID = 'DATGEN0090' and b.Psm_Ejercicio = "& Ejr &" and a.Emp_EmpleadoID = e.Emp_EmpleadoID) else -1 end as P3DAT9   " & _
                                                             "from   HRM10220 e, ORGANIZACION_VZT.dbo.v_EmpleadosVerzatec v  " & _
                                                             "where  e.Emp_CompaniaID = v.EmpresaFuente                      " & _
                                                             "and    e.Emp_EmpleadoID = v.Empleado                           " & _
                                                             "and    e.Emp_NominaID < 10                                     " & _
                                                             "and    e.Emp_CompaniaID IN('2','10','11')                      " & _
                                                             "order by e.Emp_CompaniaID, e.Emp_NombreCompleto                "
                                                    set rsl = dbconn.execute(sqllis)
                                                    if not rsl.bof and not rsl.eof then
                                                        do while not rsl.eof
                                                            %>
                                                            <tr>
                                                                <td><a href="#"><%= trim(rsl("Emp_CompaniaID")) %></a></td>
                                                                <td><a href="#"><%= trim(rsl("Emp_EmpleadoID")) %></a></td>
                                                                <td><a href="#"><%= trim(rsl("Emp_NombreCompleto")) %></a></td>
                                                                <td><a href="#"><%= trim(rsl("DescCentroCosto")) %></a></td>
                                                                <td style="text-align: center"><% if rsl("P1M360") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P1M360") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P1M360") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P1APOB") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P1APOB") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P1APOB") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P2OBJH") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P2OBJH") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P2OBJH") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P2RTAL") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P2RTAL") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P2RTAL") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P3DAT1") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P3DAT1") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P3DAT1") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P3DAT2") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P3DAT2") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P3DAT2") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P3DAT3") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P3DAT3") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P3DAT3") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P3DAT4") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P3DAT4") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P3DAT4") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P3DAT5") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P3DAT5") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P3DAT5") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P3DAT6") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P3DAT6") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P3DAT6") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P3DAT7") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P3DAT7") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P3DAT7") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P3DAT8") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P3DAT8") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P3DAT8") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                                <td style="text-align: center"><% if rsl("P3DAT9") < 0 then %><i class="fa fa-circle text-gray"></i><%else if rsl("P3DAT9") = 0 then %><i class="fa fa-circle text-red"></i><% else if rsl("P3DAT9") = 1 then %><i class="fa fa-circle text-yellow"></i><%else%><i class="fa fa-circle text-green"></i><%end if end if end if %></td>
                                                            </tr>
                                                            <%
                                                            rsl.movenext
                                                        loop
                                                    end if
                                                end if
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>

                        </div>


                    </div>
                </div>
            </div>
        </div>



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

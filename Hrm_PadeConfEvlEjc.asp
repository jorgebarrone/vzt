<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Proceso PADE Configuracion Evaluación Ejecutivos</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0070' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "Tab001"
                Tab001 = trim(rsTrn("Trd_Texto"))
              Case "Tab002"
                Tab002 = trim(rsTrn("Trd_Texto"))
              Case "Tab003"
                Tab003 = trim(rsTrn("Trd_Texto"))
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
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb2"
                Fr1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Ph2"
                Fr2Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Lb1"
                Fr2Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Ph1"
                Fr2Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Lb2"
                Fr2Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Ph2"
                Fr2Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Lb3"
                Fr2Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Ph3"
                Fr2Ph3 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Lb4"
                Fr2Lb4 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Ph4"
                Fr2Ph4 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Lb5"
                Fr2Lb5 = trim(rsTrn("Trd_Texto"))
              Case "Fr2Ph5"
                Fr2Ph5 = trim(rsTrn("Trd_Texto"))
              Case "Fr3Lb1"
                Fr3Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr3Ph1"
                Fr3Ph1 = trim(rsTrn("Trd_Texto"))
              Case "Fr3Lb2"
                Fr3Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr3Ph2"
                Fr3Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr3Lb3"
                Fr3Lb3 = trim(rsTrn("Trd_Texto"))
              Case "Fr3Ph3"
                Fr3Ph3 = trim(rsTrn("Trd_Texto"))
              Case "Tb3Hd1"
                Tb3Hd1 = trim(rsTrn("Trd_Texto"))
              Case "Tb3Hd2"
                Tb3Hd2 = trim(rsTrn("Trd_Texto"))
              Case "Tb3Hd3"
                Tb3Hd3 = trim(rsTrn("Trd_Texto"))



              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn2"
                SmBtn2  = trim(rsTrn("Trd_Texto"))
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

    Ejr = trim(request.querystring("Ejr"))
    Dsc = trim(request.querystring("Dsc"))
    Prm = trim(request.querystring("Prm"))

'<!----------------------------------------------------------->
'<!--         ALTA DE REGISTROS         (INICIO)            -->
'<!----------------------------------------------------------->

'<!-- FORMA 01 - OBJETIVOS Y GRUPOS   (INICIO) -->

'    Response.Write("Sbt1 : ")
 '   Response.Write(trim(Request.Form("Sbt1")))
  '  Response.Write(", ")
   ' Response.Write("Sbt2 : ")
    'Response.Write(trim(Request.Form("Sbt2")))

    Sbt1 = trim(Request.Form("Sbt1"))
    if Sbt1 = "Sbt1" then
'        Response.Write("</br>")
'        response.write("Si entra Sbt1")
        sqlval = "select Nmx_Ejercicio from HRM105A2  " & _
                 "where  Nmx_Ejercicio = "& Ejr &"    " & _
                 "and    Nmx_Tipo      = 2            "
        set rsv = dbconn.execute(sqlval)
        
        if not rsv.eof and not rsv.bof then
            sqlupd = "update HRM105A2                              " & _
                     "set Nmx_Minimo = "& request.form("Omn") &",  " & _
                     "    Nmx_Maximo = "& request.form("Omx") &"   " & _
                     "where Nmx_Ejercicio = "& Ejr &"              " & _
                     "and    Nmx_Tipo      = 2                     "
            set rsu = dbconn.execute(sqlupd)
        else
            sqlins = "insert into HRM105A2                " & _
                     "values ("& Ejr &",                  " & _
                     "        2,                          " & _
                     "        "& request.form("Omn") &",  " & _
                     "        "& request.form("Omx") &")  "
            'response.write(sqlins)
            set rsi = dbconn.execute(sqlins)
        end if
    end if

'<!-- FORMA 01 - OBJETIVOS Y GRUPOS   (FIN)    -->

'<!-- FORMA 02 - GRUPOS DE EJECUTIVOS (INICIO) -->
    Sbt2  = trim(request.form("Sbt2"))
    Dbt2a = trim(request.form("Dbt2a"))
    if Sbt2 > "" then
        sqlval = "select Gre_CorporativoID from HRM10520  " & _
                 "where  Gre_Nombre = '"& trim(Request.Form("GrpNmb")) &"' and Gre_Estatus = 1  "
        set rsv = dbconn.execute(sqlval)
        
        if not rsv.eof and not rsv.bof then
            sqlupd = "update HRM10520                                               " & _
                     "set Gre_UAFIRPond     =  "& Request.Form("UafPnd") &",        " & _
                     "    Gre_UAFIRNivAnt   =  "& Request.Form("UafNan") &",        " & _
                     "    Gre_UAFIRMinimo   =  "& Request.Form("UafMin") &",        " & _
                     "    Gre_UAFIRObjetivo =  "& Request.Form("UafObj") &"         " & _
                     "where  Gre_Nombre     = '"& trim(Request.Form("GrpNmb")) &"'  " & _
                     "and Gre_Estatus = 1                                           "
            set rsu = dbconn.execute(sqlupd)
        else
            sqlins = "insert into HRM10520                            " & _
                     "values ('5000',                                 " & _
                     "        '"& trim(Request.Form("GrpNmb")) &"',   " & _
                     "         "&      Request.Form("UafPnd")  &",    " & _
                     "         "&      Request.Form("UafNan")  &",    " & _
                     "         "&      Request.Form("UafMin")  &",    " & _
                     "         "&      Request.Form("UafObj")  &",    " & _
                     "         1)                                     "
            set rsi = dbconn.execute(sqlins)
            'response.write(sqlins)
        end if
    end if

    if Dbt2a = "Dbt2a" then
        Ind = request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                GrpNmb = trim(Request.Form("GrpNmb"&i))
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete HRM10520                            " & _
                             "where Gre_CorporativoID = '5000'           " & _
                             "and   Gre_Nombre        = '"& GrpNmb &"'   "
                    set rsd = dbconn.execute(sqldel)
'                    response.write(sqldel)
                end if
            next
        end if
    end if
'<!-- FORMA 02 - GRUPOS DE EJECUTIVOS  (FIN)   -->

'<!-- FORMA 03 - INTEGRANTES GRUPOS   (INICIO) -->
    Sbt3  = trim(request.form("Sbt3"))
    Dbt3a = trim(request.form("Dbt3a"))
    if Sbt3 > "" then
        sqlval = "select Gei_EmpleadoID from HRM10521                           " & _
                 "where  Gei_EmpleadoID = '"& trim(Request.Form("NumEmp")) &"'  "
        set rsv = dbconn.execute(sqlval)
        
        if not rsv.eof and not rsv.bof then
            sqlupd = "update HRM10521                                                  " & _
                     "set Gei_GrupoEjecutivo = '"& Request.Form("GrpNmb") &"',         " & _
                     "where  Gei_CorporativoID = '5000'                                " & _
                     "and    Gei_EmpleadoID    = '"& trim(Request.Form("NumEmp")) &"'  "
            set rsu = dbconn.execute(sqlupd)
        else
            sqlDem = "select Emp_CompaniaID from HRM10220 where Emp_EmpleadoID = '"& trim(Request.Form("NumEmp")) &"'  "
            set rsE = dbconn.execute(sqlDem)
            if not rsE.bof and not rsE.eof then Ciaemp = trim(rsE("Emp_CompaniaID")) else Ciaemp = "" end if
            sqlins = "insert into HRM10521                            " & _
                     "values ('"& trim(Request.Form("GrpNmb")) &"',   " & _
                     "        '5000',                                 " & _
                     "         "& Ciaemp                       &",    " & _
                     "         "& trim(Request.Form("NumEmp")) &")    "
            set rsi = dbconn.execute(sqlins)
'            response.write(sqlins)
        end if
    end if

    if Dbt3a = "Dbt3a" then
        Ind = request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                GrpNmb = trim(Request.Form("GrpNmb"&i))
                NumEmp = trim(Request.Form("NumEmp"&i))
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete HRM10521                             " & _
                             "where Gei_CorporativoID  = '5000'           " & _
                             "and   Gei_GrupoEjecutivo = '"& GrpNmb &"'   " & _
                             "and   Gei_EmpleadoID     = '"& NumEmp &"'   "
                    set rsd = dbconn.execute(sqldel)
'                    response.write(sqldel)
                end if
            next
        end if
    end if
'<!-- FORMA 03 - INTEGRANTES GRUPOS    (FIN)   -->

'<!----------------------------------------------------------->
'<!--         ALTA DE REGISTROS           (FIN)             -->
'<!----------------------------------------------------------->

    sqlreg = "select * from HRM105A2 where Nmx_Ejercicio = "& Ejr &" and Nmx_Tipo = 2 "
    set rsR = dbconn.execute(sqlreg)
    if not rsR.bof and not rsR.eof then
        Omn = rsR("Nmx_Minimo")
        Omx = rsR("Nmx_Maximo")
    else
        Omn = ""
        Omx = ""
    end if
    SubTit = Dsc

    Tab1St = ""
    Tab2St = ""
    Tab3St = ""
    Pan1St = "tab-pane"
    Pan2St = "tab-pane"
    Pan3St = "tab-pane"

    Select Case Prm
        Case "1"
            Tab1St = "class='active'"
            Pan1St = "tab-pane active"
        Case "2"
            Tab2St = "class='active'"
            Pan2St = "tab-pane active"
        Case "3"
            Tab3St = "class='active'"
            Pan3St = "tab-pane active"
    End Select

    %>
    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">

        <!-- Main Content - Inicio -->
        <div class='row'>
            <div class='col-xs-12'>
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li <%= Tab1St %>>
                            <a href="#objetiv" data-toggle="tab"><%= Tab001 %></a>
                        </li>
                        <li <%= Tab2St %>>
                            <a href="#grupose" data-toggle="tab"><%= Tab002 %></a>
                        </li>
                        <li <%= Tab3St %>>
                            <a href="#integrt" data-toggle="tab"><%= Tab003 %></a>
                        </li>
                    </ul>
                    <div class="tab-content">

                        <!-- Objetivos Máximos y Mínimos -->
                        <div class="<%= Pan1St %>" id="objetiv" >
                            
                            <div class="box box-success">
                                <form action="Hrm_PadeConfEvlEjc.asp?Prm=1&Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form1" method="post">
                                    <div class="box-header with-border">
                                        <h3 class="box-title"><%= BxHd01 %></h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="row fontawesome-icon-list">
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                                                    <input type="number" class="form-control" id="Omn" name="Omn" value="<%= Omn %>" placeholder="<%= Fr1Ph1 %>" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb2 %></label>
                                                    <input type="number" class="form-control" id="Omx" name="Omx" value="<%= Omx %>" placeholder="<%= Fr1Ph2 %>" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <label style="color: #f00"><%= FrLgn1 %></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                

                                    <div class="box-footer" style="text-align: center">
                                        <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                        <button type="submit" class="btn btn-primary" name="Sbt1" id="Sbt1" value="Sbt1"><%= SmBtn1 %></button>&nbsp;&nbsp;&nbsp;
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="<%= Pan2St %>" id="grupose" >
                            
                            <div class="box box-success">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><%= BxHd03 %></h3>
                                </div>
                                    <div class="box-body">
                                        <form action="Hrm_PadeConfEvlEjc.asp?Prm=2&Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form2" method="post">
                                            <div class="row fontawesome-icon-list">
                                                <div class="col-md-3 col-sm-4">
                                                    <div class="form-group">
                                                        <label style="color: #f00">* &nbsp;</label><label><%= Fr2Lb1 %></label>
                                                        <input type="text" class="form-control" id="GrpNmb" name="GrpNmb" placeholder="<%= Fr2Ph1 %>" required />
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-4">
                                                    <div class="form-group">
                                                        <label style="color: #f00">* &nbsp;</label><label><%= Fr2Lb2 %></label>
                                                        <input type="text" class="form-control" id="UafPnd" name="UafPnd" placeholder="<%= Fr2Ph2 %>" required />
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-4">
                                                    <div class="form-group">
                                                        <label style="color: #f00">* &nbsp;</label><label><%= Fr2Lb3 %></label>
                                                        <input type="text" class="form-control" id="UafNan" name="UafNan" placeholder="<%= Fr2Ph3 %>" required />
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-4">
                                                    <div class="form-group">
                                                        <label style="color: #f00">* &nbsp;</label><label><%= Fr2Lb4 %></label>
                                                        <input type="text" class="form-control" id="UafMin" name="UafMin" placeholder="<%= Fr2Ph4 %>" required />
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-4">
                                                    <div class="form-group">
                                                        <label style="color: #f00">* &nbsp;</label><label><%= Fr2Lb5 %></label>
                                                        <input type="text" class="form-control" id="UafObj" name="UafObj" placeholder="<%= Fr2Ph5 %>" required />
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-4">
                                                    <div class="form-group">
                                                        <label style="color: #f00"><%= FrLgn1 %></label>
                                                        <br/>
                                                        <button type="submit" class="btn btn-primary" name="Sbt2" id="Sbt2" value="Sbt2"><%= SmBtn1 %></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                
                                    <%
                                    sqlLgr = "select * from HRM10520 where Gre_CorporativoID = '5000' and Gre_Estatus = 1"
                                    set rsG = dbconn.execute(sqlLgr)
                                    if not rsG.bof and not rsG.eof then
                                    %>    
                                    <div class="box box-success">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><%= BxHd04 %></h3>
                                        </div>
                                        <div class="box-body">
                                            <form action="Hrm_PadeConfEvlEjc.asp?Prm=2&Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form2a" method="post">
                                                <table id="example2" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th><%= Fr2Lb1 %></th>
                                                            <th><%= Fr2Lb2 %></th>
                                                            <th><%= Fr2Lb3 %></th>
                                                            <th><%= Fr2Lb4 %></th>
                                                            <th><%= Fr2Lb5 %></th>
                                                            <th style="text-align: center; color: red; font-weight: bold">X</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                        i = 0
                                                        do while not rsG.eof
                                                            i = i + 1
                                                            %>
                                                            <tr>
                                                                <td>
                                                                    <input type="hidden" name="<%= "GrpNmb"&i %>" id="<%= "GrpNmb"&i %>" value="<%= trim(rsG("Gre_Nombre")) %>" />
                                                                    <%= trim(rsG("Gre_Nombre")) %>
                                                                </td>
                                                                <td><%= trim(rsG("Gre_UAFIRPond")) %></td>
                                                                <td><%= trim(rsG("Gre_UAFIRNivAnt")) %></td>
                                                                <td><%= trim(rsG("Gre_UAFIRMinimo")) %></td>
                                                                <td><%= trim(rsG("Gre_UAFIRObjetivo")) %></td>
                                                                <td style="text-align: center">
                                                                    <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                                                </td>
                                                            </tr>
                                                            <%
                                                            rsG.movenext
                                                        loop
                                                        rsG.close
                                                        set rsG = Nothing
                                                        %>
                                                    </tbody>
                                                </table>
                                                <div class="box-footer" style="text-align: center">
                                                    <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                                    <button type="submit" class="btn btn-primary" style="background-color: red " name="Dbt2a" id="Dbt2a" value="Dbt2a"><%= SmBtn2 %></button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <%
                                    end if
                                    %>

                            </div>
                        </div>

                        <div class="<%= Pan3St %>" id="integrt" >
                            
                            <div class="box box-success">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><%= BxHd05 %></h3>
                                </div>
                                    <div class="box-body">
                                        <form action="Hrm_PadeConfEvlEjc.asp?Prm=3&Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form3" method="post">
                                            <div class="row fontawesome-icon-list">
                                                <div class="col-md-3 col-sm-4">
                                                    <div class="form-group">
                                                        <label style="color: #f00">* &nbsp;</label><label><%= Fr3Lb1 %></label>
                                                        <select class="form-control" size="1" id="GrpNmb" name="GrpNmb" required>
                                                            <option class="form-control" value=""><%= Fr3Ph1 %></option>
                                                            <%
                                                            sqlGrp = "select * from HRM10520 where Gre_CorporativoID = '5000' order by Gre_Nombre "
                                                            set rsGr = dbconn.execute(sqlGrp)
                                                            if not rsGr.eof and not rsGr.bof then
                                                                do while not rsGr.eof
                                                                    %>
                                                                    <option class="form-control" value="<%= trim(rsGr("Gre_Nombre")) %>"><%= trim(rsGr("Gre_Nombre")) %></option>
                                                                    <%
                                                                    rsGr.movenext
                                                                loop
                                                                rsGr.close
                                                                set rsGr = Nothing
                                                            end if
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-4">
                                                    <div class="form-group">
                                                        <label style="color: #f00">* &nbsp;</label><label><%= Fr3Lb2 %></label>
                                                        <select class="form-control" size="1" id="NumEmp" name="NumEmp" required>
                                                            <option class="form-control" value=""><%= Fr3Ph2 %></option>
                                                            <%
                                                            sqlEmp = "select Emp_CompaniaID, Emp_EmpleadoID, Emp_NombreCompleto from HRM10220 where Emp_CorporativoID = '5000' order by Emp_NombreCompleto "
                                                            set rsEm = dbconn.execute(sqlEmp)
                                                            if not rsEm.eof and not rsEm.bof then
                                                                do while not rsEm.eof
                                                                    %>
                                                                    <option class="form-control" value="<%= trim(rsEm("Emp_EmpleadoID")) %>"><%= trim(rsEm("Emp_NombreCompleto")) & " - " & trim(rsEm("Emp_CompaniaID")) %></option>
                                                                    <%
                                                                    rsEm.movenext
                                                                loop
                                                                rsEm.close
                                                                set rsEm = Nothing
                                                            end if
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-4">
                                                    <div class="form-group">
                                                        <label style="color: #f00"><%= FrLgn1 %></label>
                                                        <br/>
                                                        <button type="submit" class="btn btn-primary" name="Sbt3" id="Sbt3" value="Sbt3"><%= SmBtn1 %></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                
                                    <%
                                    sqlLgr = "select a.Gei_GrupoEjecutivo, a.Gei_EmpleadoID,   " & _
                                             "       b.Emp_NombreCompleto                      " & _
                                             "from HRM10521 a, HRM10220 b                      " & _
                                             "where a.Gei_CorporativoID = '5000'               " & _
                                             "and   a.Gei_CorporativoID = b.Emp_CorporativoID  " & _
                                             "and   a.Gei_CompaniaID    = b.Emp_CompaniaID     " & _
                                             "and   a.Gei_EmpleadoID    = b.Emp_EmpleadoID     "
                                    set rsG = dbconn.execute(sqlLgr)
                                    if not rsG.bof and not rsG.eof then
                                    %>    
                                    <div class="box box-success">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><%= BxHd04 %></h3>
                                        </div>
                                        <div class="box-body">
                                            <form action="Hrm_PadeConfEvlEjc.asp?Prm=3&Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form3a" method="post">
                                                <table id="example3" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th><%= Tb3Hd1 %></th>
                                                            <th><%= Tb3Hd2 %></th>
                                                            <th><%= Tb3Hd3 %></th>
                                                            <th style="text-align: center; color: red; font-weight: bold">X</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                        i = 0
                                                        do while not rsG.eof
                                                            i = i + 1
                                                            %>
                                                            <tr>
                                                                <td>
                                                                    <input type="hidden" name="<%= "GrpNmb"&i %>" id="<%= "GrpNmb"&i %>" value="<%= trim(rsG("Gei_GrupoEjecutivo")) %>" />
                                                                    <input type="hidden" name="<%= "NumEmp"&i %>" id="<%= "NumEmp"&i %>" value="<%= trim(rsG("Gei_EmpleadoID")) %>" />
                                                                    <%= trim(rsG("Gei_GrupoEjecutivo")) %>
                                                                </td>
                                                                <td><%= trim(rsG("Gei_EmpleadoID")) %></td>
                                                                <td><%= trim(rsG("Emp_NombreCompleto")) %></td>
                                                                <td style="text-align: center">
                                                                    <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                                                </td>
                                                            </tr>
                                                            <%
                                                            rsG.movenext
                                                        loop
                                                        rsG.close
                                                        set rsG = Nothing
                                                        %>
                                                    </tbody>
                                                </table>
                                                <div class="box-footer" style="text-align: center">
                                                    <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                                    <button type="submit" class="btn btn-primary" style="background-color: red " name="Dbt3a" id="Dbt3a" value="Dbt3a"><%= SmBtn2 %></button>
                                                </div>
                                            </form>
                                        </div>
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
        <!-- Main Content - Final  -->

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $("#example2").DataTable();
    $('#example3').DataTable({
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
    $('#reservation').daterangepicker();
    $('#reservation01').daterangepicker();
    $('#reservation02').daterangepicker();
    $('#reservation03').daterangepicker();
    $('#reservation04').daterangepicker();
    $('#reservation05').daterangepicker();
    $('#reservation06').daterangepicker();
    $('#reservation07').daterangepicker();
    $('#reservation08').daterangepicker();
    $('#reservation09').daterangepicker();
    $('#reservation10').daterangepicker();
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
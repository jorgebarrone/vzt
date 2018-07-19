<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Creación Matriz 360°</title>
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
  <!--#include file="Hrm_Procedures01.asp"-->

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
              Case "Fr0lb1"
                Fr0lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr0lb2"
                Fr0lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))

              Case "Fr1Lb2"
                Fr1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph2"
                Fr1Ph2 = trim(rsTrn("Trd_Texto"))

              Case "Fr1Sl0"
                Fr1Sl0 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl1"
                Fr1Sl1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl2"
                Fr1Sl2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl3"
                Fr1Sl3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl4"
                Fr1Sl4 = trim(rsTrn("Trd_Texto"))

              Case "EstHdr"
                EstHdr = trim(rsTrn("Trd_Texto"))
              Case "EstLg0"
                EstLg0 = trim(rsTrn("Trd_Texto"))
              Case "EstLg1"
                EstLg1 = trim(rsTrn("Trd_Texto"))
              Case "EstLg2"
                EstLg2 = trim(rsTrn("Trd_Texto"))
              Case "EstLg3"
                EstLg3 = trim(rsTrn("Trd_Texto"))
              Case "EstLg4"
                EstLg4 = trim(rsTrn("Trd_Texto"))

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
              Case "SmBtn4"
                SmBtn4  = trim(rsTrn("Trd_Texto"))
              Case "FrLgn1"
                FrLgn1  = trim(rsTrn("Trd_Texto"))
              Case "MsgAl1"
                MsgAl1  = trim(rsTrn("Trd_Texto"))
              Case "MsEr01"
                MsEr01  = trim(rsTrn("Trd_Texto"))
              Case "MsEr02"
                MsEr02  = trim(rsTrn("Trd_Texto"))
              Case "MsEr03"
                MsEr03  = trim(rsTrn("Trd_Texto"))
              Case "MsEr04"
                MsEr04  = trim(rsTrn("Trd_Texto"))
              Case "TskTx1"
                TskTx1  = trim(rsTrn("Trd_Texto"))
              Case "EmMs01"
                EmMs01  = trim(rsTrn("Trd_Texto"))
              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    MenErr = ""
    EstOrg = 0
    Dim Eid
    Dim Dsc
    Dim Ejr
    Dim Sbt1
    Dim Cid

    Dsc = Request.Querystring("Dsc")
    Ejr = Request.Querystring("Ejr")
    Eid = Request.Querystring("Eid")
    Cid = Request.Querystring("Cid")
    Sbt1 = Request.Form("Sbt1")
    Sbt2 = Request.Form("Sbt2")
    Sbt4 = Request.Form("Sbt4")

' <!-- Validamos que la Matriz se encuentre sin Autorización de lo contrario lo Redireccionamos a la Consulta -->
    sqlVst = "select Psm_Estatus from HRM10502        " & _
             "where Psm_Ejercicio     =  "& Ejr &"    " & _
             "and   Psm_CorporativoID = '5000'        " & _
             "and   Psm_CompaniaID    = '"& Cid &"'   " & _
             "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
             "and   Psm_SemaforoID    = 'MAT3600010'  "
    set rsVst = dbconn.execute(sqlVst)
    if not rsVst.bof and not rsVst.eof then
        if rsVst("Psm_Estatus") = 3 then
            Response.Redirect "Hrm_PadeCnsM360.asp?Ejr=" & Ejr & "&Dsc=" & Dsc & "&Nem=" & Eid & "&Nmb=" & Nmb & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid
        end if
    end if

    sqlCia = "select Emp_CompaniaID, Emp_PlazaID, Emp_PlazaSuperior, Emp_NombreCompleto, Emp_Email from HRM10220 where Emp_Empleadoid = '"& Eid &"' "
    set rsCia = dbconn.execute(sqlCia)
    if not rsCia.bof and not rsCia.eof then
        Cid = trim(rsCia("Emp_CompaniaID"))
        Pzs = trim(rsCia("Emp_PlazaSuperior"))
        Plz = trim(rsCia("Emp_PlazaID"))
        Uem = trim(rsCia("Emp_Email"))
        Enm = trim(rsCia("Emp_NombreCompleto"))
        sqlPzs = "select Otm_Plaza_Superior, Otm_EmpresaFuente, Otm_Empleado from HRM10100 where Otm_EmpresaFuente = "& rsCia("Emp_CompaniaID") &" and Otm_Plaza = "& rsCia("Emp_PlazaSuperior") &"  "
        set rsPzs = dbconn.execute(sqlPzs)
        if not rsPzs.bof and not rsPzs.eof then
            if rsPzs("Otm_Empleado") > 0 then
                sqlJin = "select Emp_EmpleadoID, Emp_Email from HRM10220 where Emp_PlazaID = '"& Pzs &"' "
            else
                sqlJin = "select Emp_EmpleadoID, Emp_Email from HRM10220 where Emp_PlazaID = '"& rsPzs("Otm_Plaza_Superior") &"' "
            end if
            set rsJin = dbconn.execute(sqlJin)
            if not rsJin.bof and not rsJin.eof then
                Jin = trim(rsJin("Emp_EmpleadoID"))
                Jem = trim(rsJin("Emp_Email"))
            else
                Jin = ""
                Jem = ""
            end if
        else
            Jin = ""
            Jem = ""
        end if
    else
        Cid = ""
        Pzs = ""
        Plz = ""
        Uem = ""
        Enm = ""
    end if

    Omn = 4
    Omx = 8
    Emx = 15

    '<!--  Buscamos si está activado el Parametro de Envio de Emails - Inicio -->
    dim EnvEml
    call PrmEml()
    '<!--  Buscamos si está activado el Parametro de Envio de Emails - Fin -->

    '<-- Para Modificarse -->
    if Sbt1 = "Sbt1" then
        sqlTev = "select isnull(count(M36_EmpleadoID),0) as TotEvl " & _
                 "from HRM10540                                    " & _
                 "where  M36_Ejercicio     = '"& Ejr  &"'          " & _
                 "and    M36_CorporativoID = '5000'                " & _
                 "and    M36_CompaniaID    = '"& Cid  &"'          " & _
                 "and    M36_EmpleadoID    = '"& Eid  &"'          " & _
                 "and    M36_Estatus IN(0,1,3,4)                   "
        set rsT = dbconn.execute(sqlTev)
        TotEvl = CInt(rsT("TotEvl")) + 1
        if TotEvl > Omx then
            %>
            <script type="text/javascript">
                alert("<%= MsEr02 %>");
            </script>
            <%
        else
            Nemp = Request.Form("EvalID")
            Tevl = Request.Form("TipoID")
            sqlEmx = "select isnull(count(M36_EmpleadoID),0) as TotEmx " & _
                     "from HRM10540                                    " & _
                     "where  M36_Ejercicio     =  "& Ejr  &"           " & _
                     "and    M36_CorporativoID = '5000'                " & _
                     "and    M36_EvaluadorID   = '"& Nemp &"'          " & _
                     "and    M36_Estatus      >= 3                     "
            set rsEmx = dbconn.execute(sqlEmx)
            if CInt(rsEmx("TotEmx")) > 16 then
                %>
                <script type="text/javascript">
                    alert("<%= MsEr03 %>");
                </script>
                <%
            else
                '<-- Validamos si existe la AutoEvaluacion de lo contrario la Grabamos en Automático -->
                sqlAut = "select M36_EmpleadoID from HRM10540       " & _
                         "where  M36_Ejercicio     = '"& Ejr  &"'   " & _
                         "and    M36_CorporativoID = '5000'         " & _
                         "and    M36_CompaniaID    = '"& Cid  &"'   " & _
                         "and    M36_EmpleadoID    = '"& Eid  &"'   " & _
                         "and    M36_EvaluadorID   = '"& Eid &"'   "
                set rsAut = dbconn.Execute (sqlAut)
                if rsAut.bof and rsAut.eof then
                    sqlins = "insert into HRM10540    " & _
                             "values ( "& Ejr  &" ,   " & _
                             "        '5000',         " & _
                             "        '"& Cid  &"',   " & _
                             "        '"& Eid  &"',   " & _
                             "        '"& Eid  &"',   " & _
                             "        0,              " & _
                             "        0,              " & _
                             "        0)              "
                    set rsI = dbconn.Execute (sqlins)
                end if
                sqlexs = "select M36_EmpleadoID from HRM10540       " & _
                         "where  M36_Ejercicio     = '"& Ejr  &"'   " & _
                         "and    M36_CorporativoID = '5000'         " & _
                         "and    M36_CompaniaID    = '"& Cid  &"'   " & _
                         "and    M36_EmpleadoID    = '"& Eid  &"'   " & _
                         "and    M36_EvaluadorID   = '"& Nemp &"'   "
                set rsE = dbconn.Execute (sqlexs)
                if rsE.bof and rsE.eof then
                    sqlins = "insert into HRM10540    " & _
                             "values ( "& Ejr  &" ,   " & _
                             "        '5000',         " & _
                             "        '"& Cid  &"',   " & _
                             "        '"& Eid  &"',   " & _
                             "        '"& Nemp &"',   " & _
                             "         "& Tevl &",    " & _
                             "        0,              " & _
                             "        0)              "
                    set rsI = dbconn.Execute (sqlins)
                end if
            end if
        end if
    end if

    if Sbt2 = "Sbt2" then
        Ind = Request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                Nemp = Request.Form("Evl"&i)
                if Request.Form("elm"&i) = "on" then
                    sqldel = "delete from HRM10540                      " & _
                             "where  M36_Ejercicio     = '"& Ejr  &"'   " & _
                             "and    M36_CorporativoID = '5000'         " & _
                             "and    M36_CompaniaID    = '"& Cid  &"'   " & _
                             "and    M36_EmpleadoID    = '"& Eid  &"'   " & _
                             "and    M36_EvaluadorID   = '"& Nemp &"'   " & _
                             "and    M36_Estatus      <= 2              "
                    set rsD = dbconn.Execute (sqldel)
                    'response.write(sqldel)
                end if
            next
        end if
    end if

    Dim Jef
    Dim Clt
    Dim Clb

    sqlJin = "select isnull(count(a.M36_EvaluadorID),0) as Num  " & _
             "from HRM10540 a, HRM10220 b                       " & _
             "where a.M36_EvaluadorID   = b.Emp_EmpleadoID      " & _
             "and   a.M36_Ejercicio     =  "& Ejr &"            " & _
             "and   a.M36_CorporativoID = '5000'                " & _
             "and   a.M36_CompaniaID    = '"& Cid &"'           " & _
             "and   a.M36_EmpleadoID    = '"& Eid &"'           " & _
             "and   b.Emp_PlazaID       = '"& Pzs &"'           "
    set rsJin = dbconn.execute(sqlJin)
    if not rsJin.bof and not rsJin.eof then
        Jef = Cint(rsJin("Num"))
    else
        Jef = 0
    end if

    sqlClt = "select isnull(count(a.M36_EvaluadorID),0) as Num  " & _
             "from HRM10540 a, HRM10220 b                       " & _
             "where a.M36_EvaluadorID   = b.Emp_EmpleadoID      " & _
             "and   a.M36_Ejercicio     =  "& Ejr &"            " & _
             "and   a.M36_CorporativoID = '5000'                " & _
             "and   a.M36_CompaniaID    = '"& Cid &"'           " & _
             "and   a.M36_EmpleadoID    = '"& Eid &"'           " & _
             "and   b.Emp_PlazaSuperior = '"& Pzs &"'           "
    set rsClt = dbconn.execute(sqlClt)
    if not rsClt.bof and not rsClt.eof then
        Clt = Cint(rsClt("Num"))
    else
        Clt = 0
    end if

    sqlClb = "select isnull(count(a.M36_EvaluadorID),0) as Num  " & _
             "from HRM10540 a, HRM10220 b                       " & _
             "where a.M36_EvaluadorID   = b.Emp_EmpleadoID      " & _
             "and   a.M36_Ejercicio     =  "& Ejr &"            " & _
             "and   a.M36_CorporativoID = '5000'                " & _
             "and   a.M36_CompaniaID    = '"& Cid &"'           " & _
             "and   a.M36_EmpleadoID    = '"& Eid &"'           " & _
             "and   b.Emp_PlazaSuperior = '"& Plz &"'           "
    set rsClb = dbconn.execute(sqlClb)
    if not rsClb.bof and not rsClb.eof then
        Clb = Cint(rsClb("Num"))
    else
        Clb = 0
    end if

    if Sbt4 = "Sbt4" then
        Tst = 0
'        if Jef > 0 then
 '           Tst = Tst + 1
  '      end if
   '     if Clt > 0 then
    '        Tst = Tst + 1
     '   end if
      '  if Tst < 2 then
            %>
<!--            <script type="text/javascript">
                alert("<%= MsEr04 %>");
            </script>
-->
            <%
'        else
            sqlTev = "select isnull(count(M36_EmpleadoID),0) as TotEvl " & _
                     "from HRM10540                                    " & _
                     "where  M36_Ejercicio     = '"& Ejr  &"'          " & _
                     "and    M36_CorporativoID = '5000'                " & _
                     "and    M36_CompaniaID    = '"& Cid  &"'          " & _
                     "and    M36_EmpleadoID    = '"& Eid  &"'          " & _
                     "and    M36_Estatus IN(0,1,3,4)                   "
            set rsT = dbconn.execute(sqlTev)
            TotEvl = CInt(rsT("TotEvl"))
            if TotEvl < Omn then
                %>
                <script type="text/javascript">
                    alert("<%= MsEr01 %>");
                </script>
                <%
            else
                sqlupd = "update HRM10502                         " & _
                         "set Psm_Estatus         = 1             " & _
                         "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                         "and   Psm_CorporativoID = '5000'        " & _
                         "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                         "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                         "and   Psm_SemaforoID    = 'MAT3600010'  "
                set rsu = dbconn.execute(sqlupd)
                Fhy = year(date) & "-" & month(date) & "-" & day(date)
                TskScr = "Hrm_PadeAutM360.asp?Mdl=" & Mdl &  "&Trn=" & Trn & "&Ejr=" & Ejr & "&Nem=" & Eid & "&Nmb=" & Unm & "&Dsc=" & Dsc & "&Cid=" & Cid
                TskDsc = Dsc & " - " & TskTx1
                sqlins = "insert into HRM10400                    " & _
                         "values('PADE',                          " & _
                         "       '',                              " & _
                         "       '"& Eid &"',                     " & _
                         "       '',                              " & _
                         "       1,                               " & _
                         "       1,                               " & _
                         "       '"& Jin &"',                     " & _
                         "       '"& Dsc &"',                     " & _
                         "       '"& Fhy &"',                     " & _
                         "       '',                              " & _
                         "       'A',                             " & _
                         "       '"& TskScr &"',                  " & _
                         "       '"& TskDsc &"')                  "
                set rsi = dbconn.execute(sqlins)
                'response.write(sqlins)

                '<!-- Validamos si el Envio de Emails está activado -->
                if EnvEml = 1 then
                    '<!-- Validamos si el Jefe Directo del Solicitante tiene Email -->
			        if trim(Jem) <> "" then
                        Dim myMail
                        Set myMail=CreateObject("CDO.Message")
                        myMail.Subject = TskDsc
                        msgtext = Unm & "  " & EmMs01 & "</br></br><p>" & lnki & "</br></br><p>" & lnke
    	                myMail.From = Emc
	                    myMail.To = Jem
                        myMail.Cc = Uem
                        myMail.Bcc = "jorge.barron@eryseg.com"
        '                myMail.AddAttachment "C:\inetpub\wwwroot\Hrm\reports\Attch01.txt"
		                myMail.HTMLBody = msgtext
                        myMail.Configuration.Fields.Item _
                        ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
                        myMail.Configuration.Fields.Item _
                        ("http://schemas.microsoft.com/cdo/configuration/smtpserver")=Ems
                        myMail.Configuration.Fields.Item _
                        ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=Emp
                        myMail.Configuration.Fields.Update
                        myMail.Send
                        set myMail=nothing
	    	        end if
                end if
                if trim(Trn) = "Hrm_PadeAdmin01.asp" then
                    %><script>window.close();</script><%
                else
                    response.redirect Trn & "?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Ejr=" & Ejr
                end if
            end if
'        end if
    end if
    SubTit = Dsc & " - " & Enm
    %>

    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
    <!-- CONTENIDO PRINCIPAL AQUI -->
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><%= BxHd01 %><label style="font-size: small">&nbsp;&nbsp;(Min : <%= Omn %>, Max: <%= Omx %>)</label></h3>
                <br>&nbsp;</br>
                <div class="row fontawesome-icon-list">
                    <div class="col-md-3 col-sm-4">
                        <div class="form-group">
                            <label><%= Fr0lb1 & " : " %></label>&nbsp;&nbsp;<%= formatnumber(Jef,0) %></br>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4">
                        <div class="form-group">
                            <label><%= Fr0lb2 & " : " %></label>&nbsp;&nbsp;<%= formatnumber(Clt,0) %></br>
                        </div>
                    </div>
                </div>
            </div>

            <form action="Hrm_PadeEnc3604.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form1" method="post">
                <!-- form start -->
                <div class="box-body">
                    <div class="row fontawesome-icon-list">
                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00">* &nbsp;</label><label><%= Fr1Lb1 %></label>
                                <select class="form-control" size="1" id="EvalID" name="EvalID" required>
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
                                <select class="form-control" size="1" id="TipoID" name="TipoID" required>
                                    <option class="form-control" value=""><%= Fr1Ph2 %></option>
                                    <option class="form-control" value="0"><%= Fr1Sl0 %></option><!-- Auto Evaluacion -->
                                    <option class="form-control" value="1"><%= Fr1Sl1 %></option><!-- Jefe Directo -->
                                    <option class="form-control" value="2"><%= Fr1Sl2 %></option><!-- Colateral    -->
                                    <option class="form-control" value="3"><%= Fr1Sl3 %></option><!-- Colaborador  -->
                                    <option class="form-control" value="4"><%= Fr1Sl4 %></option><!-- Cliente      -->
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="form-group">
                                <label style="color: #f00"><%= FrLgn1 %></label>
                                <br/>
                                <button type="submit" class="btn btn-primary" name="Sbt1" id="Sbt1" value="Sbt1"><%= SmBtn1 %></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </form>

            <%
            sqlEvl = "select a.*,        b.Emp_NombreCompleto,           " & _
                     "      c.Otm_Plaza, d.Pue_Descripcion               " & _
                     "from   HRM10540 a, HRM10220 b,                     " & _
                     "       HRM10100 c, HRM10210 d                      " & _
                     "where a.M36_EvaluadorID     = b.Emp_EmpleadoID     " & _
                     "and   c.Otm_Empleado        = b.Emp_EmpleadoID     " & _
                     "and   c.Otm_id_nivel_puesto = d.Pue_NivelPuestoID  " & _
                     "and   c.Otm_EmpresaFuente   = d.Pue_CompaniaID     " & _
                     "and   c.Otm_Plaza           = b.Emp_PlazaID        " & _
                     "and   a.M36_Ejercicio       =  "& Ejr &"           " & _
                     "and   a.M36_EmpleadoID      = '"& Eid &"'          "
            set rsO = dbconn.execute(sqlEvl)
'            response.write(sqlEvl)
            if not rsO.bof and not rsO.eof then
                i = 0
                TotEvl = 0
                %>
                <div class="box box-primary">
                    <form action="Hrm_PadeEnc3604.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form1a" method="post">
                        <div class="box-body">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th><%= Tb1Hd1 %></th>
                                    <th><%= Tb1Hd2 %></th>
                                    <th><%= Fr1Lb2 %></th>
                                    <th><%= EstHdr %></th>
                                    <th style="text-align: center; color: red; font-weight: bold">X</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                do while not rsO.eof
                                    i = i + 1
                                    if rsO("M36_Estatus") <> 2 then
                                        TotEvl = TotEvl + 1
                                    end if
                                    if rsO("M36_EvaluadorTipo") = 1 then
                                        Dvl = Fr1Sl1
                                    else
                                        if rsO("M36_EvaluadorTipo") = 2 then
                                            Dvl = Fr1Sl2
                                        else
                                            if rsO("M36_EvaluadorTipo") = 3 then
                                                Dvl = Fr1Sl3
                                            else
                                                if rsO("M36_EvaluadorTipo") = 4 then
                                                    Dvl = Fr1Sl4
                                                else
                                                    Dvl = Fr1Sl0
                                                end if
                                            end if
                                        end if
                                    end if
                                    EstEvl = rsO("M36_Estatus")
                                    Select Case EstEvl
                                      Case 0
                                        EstTxt = EstLg0
                                      Case 1
                                        EstTxt = EstLg1
                                      Case 2
                                        EstTxt = EstLg2
                                      Case 3
                                        EstTxt = EstLg3
                                      Case 4
                                        EstTxt = EstLg4
                                      Case else
                                        EstTxt = EstLg0
                                    End Select
                                    %>
                                    <tr>
                                        <td>
                                            <input type="hidden" name="<%= "Evl"&i %>" id="<%= "Evl"&i %>" value="<%= trim(rsO("M36_EvaluadorID")) %>" />
                                            <%= trim(rsO("Pue_Descripcion")) %>
                                        </td>
                                        <td><%= trim(rsO("Emp_NombreCompleto")) %></td>
                                        <td><%= Dvl %></td>
                                        <td><%= EstTxt %></td>
                                        <td style="text-align: center">
                                            <input type="checkbox" name="<%= "elm"&i %>" id="<%= "elm"&i %>"  />
                                        </td>
                                    </tr>
                                    <%
                                    rsO.movenext
                                loop
                                rsO.close
                                set rsO = Nothing
                                %>
                                </tbody>
                            </table>
                            <div class="box-footer" style="text-align: center">
                                <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                <button type="submit" class="btn btn-primary" name="Sbt2" id="Sbt2" value="Sbt2" style="background-color: red" ><%= SmBtn2 %></button>&nbsp;&nbsp;&nbsp;
                                <%
                                if TotEvl >= Omn then
                                    %>
                                    <button type="submit" class="btn btn-primary" name="Sbt3" id="Sbt3" value="Sbt3"><%= SmBtn3 %></button>&nbsp;&nbsp;&nbsp;
                                    <button type="submit" class="btn btn-primary" name="Sbt4" id="Sbt4" value="Sbt4" style="background-color: green" ><%= SmBtn4 %></button>
                                    <%
                                else
                                    %>
                                    <button type="submit" class="btn btn-primary" name="Sbt3" id="Sbt3" value="Sbt3" disabled><%= SmBtn3 %></button>&nbsp;&nbsp;&nbsp;
                                    <button type="submit" class="btn btn-primary" name="Sbt4" id="Sbt4" value="Sbt4" style="background-color: green" disabled ><%= SmBtn4 %></button>
                                    <%
                                end if
                                %>
                            </div>
                        </div>
                    </form>
                </div>
                <%
            end if
            %>
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

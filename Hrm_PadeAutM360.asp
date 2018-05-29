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
              Case "TitSec"
                TitSec = trim(rsTrn("Trd_Texto"))
              Case "SubTit"
                SubTit = trim(rsTrn("Trd_Texto"))
              Case "BxHd01"
                BxHd01 = trim(rsTrn("Trd_Texto"))
              Case "BxHd02"
                BxHd02 = trim(rsTrn("Trd_Texto"))
              Case "Fr0lb1"
                Fr0lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr0lb2"
                Fr0lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb1"
                Fr1Lb1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph1"
                Fr1Ph1 = trim(rsTrn("Trd_Texto"))
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
              Case "SmBtn5"
                SmBtn5  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn6"
                SmBtn6  = trim(rsTrn("Trd_Texto"))
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
              Case "TskTx2"
                TskTx2  = trim(rsTrn("Trd_Texto"))
              Case "TskTx3"
                TskTx3  = trim(rsTrn("Trd_Texto"))
              Case "TskTx4"
                TskTx4  = trim(rsTrn("Trd_Texto"))

              Case "Fr1Lb2"
                Fr1Lb2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph2"
                Fr1Ph2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Lb3"
                Fr1Lb3 = trim(rsTrn("Trd_Texto"))
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

              Case "EmMs01"
                EmMs01  = trim(rsTrn("Trd_Texto"))
              Case "EmMs02"
                EmMs02  = trim(rsTrn("Trd_Texto"))
              Case "EmMs03"
                EmMs03  = trim(rsTrn("Trd_Texto"))
              Case "EmMs04"
                EmMs04  = trim(rsTrn("Trd_Texto"))

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
    Dim Sbt5
    Dim Sbt6
    Dim myMail
    Dim Eml
    Dim Eid
    Dim Nem
    Dim Nmb
    Dim Cid

    Dsc = Request.Querystring("Dsc")
    Ejr = Request.Querystring("Ejr")
    Eid = Request.Querystring("Eid")
    Nem = Request.Querystring("Nem")
    Nmb = Request.Querystring("Nmb")
    Cid = Request.Querystring("Cid")

' <!-- Validamos que la Matriz se encuentre sin Autorización de lo contrario lo Redireccionamos a la Consulta -->
    sqlVst = "select Psm_Estatus from HRM10502        " & _
             "where Psm_Ejercicio     =  "& Ejr &"    " & _
             "and   Psm_CorporativoID = '5000'        " & _
             "and   Psm_CompaniaID    = '"& Cid &"'   " & _
             "and   Psm_EmpleadoID    = '"& Nem &"'   " & _
             "and   Psm_SemaforoID    = 'MAT3600010'  "
    set rsVst = dbconn.execute(sqlVst)
    if not rsVst.bof and not rsVst.eof then
        if rsVst("Psm_Estatus") = 3 then
            Response.Redirect "Hrm_PadeCnsM360.asp?Ejr=" & Ejr & "&Dsc=" & Dsc & "&Nem=" & Nem & "&Nmb=" & Nmb & "&Cid=" & Cid & "&Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid
        end if
    end if


    Sbt5 = Request.Form("Sbt5")
    Sbt6 = Request.Form("Sbt6")
    Cmt  = trim(Request.Form("Cmt"))
    Subtit = Dsc & " - " & Nmb

    '<!--  Llamamos la Funcion de Datos del Empleado - Inicio -->
    dim HdrNid
    dim HdrCid
    dim HdrNim
    dim HdrNmb
    dim HdrNml
    dim HdrNpd
    call HdrNem(Nem,Cid)
    '<!--  Llamamos la Funcion de Datos del Empleado - Final -->

    '<!--  Buscamos si está activado el Parametro de Envio de Emails - Inicio -->
    dim EnvEml
    call PrmEml()
'    response.write("EnvEml : " & EnvEml)
    '<!--  Buscamos si está activado el Parametro de Envio de Emails - Fin -->

    '<!--  Buscamos el Email del Autorizador Inicio -->
    sqlEml = "select Emp_Email from HRM10220 where Emp_EmpleadoID = '"& Eid &"' "
    set rsEml = dbconn.execute(sqlEml)
    if not rsEml.bof and not rsEml.eof then
        Eml = trim(rsEml("Emp_Email"))
    else
        Eml = ""
    end if
    '<!--  Buscamos el Email del Autorizador Final  -->

    Omn = 3
    Omx = 8
    Emx = 15

    '<-- Para Modificarse -->

    if Sbt5 = "Sbt5" then
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = 0             " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Nem &"'   " & _
                 "and   Psm_SemaforoID    = 'MAT3600010'  "
        set rsu = dbconn.execute(sqlupd)

'        sqlupd = "update HRM10540                         " & _
 '                "set M36_Estatus = 0                     " & _
  '               "where M36_Ejercicio     =  "& Ejr &"    " & _
   '              "and   M36_CorporativoID = '5000'        " & _
    '             "and   M36_EmpleadoID    = '"& Nem &"'   "
     '   set rsu = dbconn.execute(sqlupd)

'        response.write(sqlupd)
'        response.write("</br>")
        Fhy = year(date) & "-" & month(date) & "-" & day(date)
        TskScr = "Hrm_PadeEnc3604.asp?Mdl=" & Mdl &  "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc
        TskDsc = Dsc & " - " & TskTx2
        sqlins = "insert into HRM10400                    " & _
                 "values('PADE',                          " & _
                 "       '',                              " & _
                 "       '"& Eid &"',                     " & _
                 "       '',                              " & _
                 "       1,                               " & _
                 "       1,                               " & _
                 "       '"& Nem &"',                     " & _
                 "       '"& Dsc &"',                     " & _
                 "       '"& Fhy &"',                     " & _
                 "       '',                              " & _
                 "       'A',                             " & _
                 "       '"& TskScr &"',                  " & _
                 "       '"& TskDsc &"')                  "
        set rsi = dbconn.execute(sqlins)

        '<!-- Validamos si el Envio de Emails está activado -->
        if EnvEml = 1 then
            '<!-- Validamos si el Solicitante tiene Email -->
	        if trim(HdrNml) <> "" then
                msgtext = "<b>" & EmMs02 & "</b></br><p><b>" & Fr1Lb3 & "</b><p>" & Cmt & "</br></br><p>" & lnki & "</br></br><p>" & lnke 
                Set myMail=CreateObject("CDO.Message")
                myMail.Subject = TskDsc
                myMail.From = Emc
                myMail.To = HdrNml
                myMail.Cc = Eml
                myMail.Bcc = "jorge.barron@eryseg.com"
    '            myMail.AddAttachment "C:\inetpub\wwwroot\Hrm\reports\Attch01.txt"
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
            if trim(Trn) = "Hrm_PadeAdmin01.asp" then
                %><script>window.close();</script><%
            else
                response.redirect Trn & "?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid
            end if
        end if
    end if

    if Sbt6 = "Sbt6" then
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = 3             " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Nem &"'   " & _
                 "and   Psm_SemaforoID    = 'MAT3600010'  "
        set rsu = dbconn.execute(sqlupd)
        '<!-- Aceptamos la AutoEvaluacion para que no le solicite Aceptar/Rechazar al Encuestado -->
        sqlupd = "update HRM10540                         " & _
                 "set M36_Estatus = 3                     " & _
                 "where M36_Ejercicio     =  "& Ejr &"    " & _
                 "and   M36_CorporativoID = '5000'        " & _
                 "and   M36_EmpleadoID    = '"& Nem &"'   " & _
                 "and   M36_EvaluadorID   = '"& Nem &"'   " & _
                 "and   M36_Estatus       = 0             "
        set rsu = dbconn.execute(sqlupd)

'        sqlupd = "update HRM10540                         " & _
'                 "set M36_Estatus = 1                     " & _
'                 "where M36_Ejercicio     =  "& Ejr &"    " & _
'                 "and   M36_CorporativoID = '5000'        " & _
'                 "and   M36_EmpleadoID    = '"& Nem &"'   "
        '<!-- Se modifica la Actualización de Estatus de Evaluadores para que solamente se cambien a Estatus 1 (Autorizado) los Evaluadores recién agregados -->
        '<!-- con ésto evitamos volver a enviar notificaciones a Evaluadores que ya aceptaron/contestaron la Encuesta 360°                                   -->
        sqlupd = "update HRM10540                         " & _
                 "set M36_Estatus = 1                     " & _
                 "where M36_Ejercicio     =  "& Ejr &"    " & _
                 "and   M36_CorporativoID = '5000'        " & _
                 "and   M36_EmpleadoID    = '"& Nem &"'   " & _
                 "and   M36_Estatus       = 0             "
        set rsu = dbconn.execute(sqlupd)
        Fhy = year(date) & "-" & month(date) & "-" & day(date)
        TskScr = "#"
        TskDsc = Dsc & " - " & TskTx3
        sqlins = "insert into HRM10400                    " & _
                 "values('PADE',                          " & _
                 "       '',                              " & _
                 "       '"& Eid &"',                     " & _
                 "       '',                              " & _
                 "       1,                               " & _
                 "       1,                               " & _
                 "       '"& Nem &"',                     " & _
                 "       '"& Dsc &"',                     " & _
                 "       '"& Fhy &"',                     " & _
                 "       '',                              " & _
                 "       'A',                             " & _
                 "       '"& TskScr &"',                  " & _
                 "       '"& TskDsc &"')                  "
        set rsi = dbconn.execute(sqlins)

        '<!-- Validamos si el Envio de Emails está activado -->
        if EnvEml = 1 then
            '<!-- Validamos si el Solicitante tiene Email -->
	        if trim(HdrNml) <> "" then
                msgtext = "<b>" & EmMs03 & "</b></br><p><b>" & Fr1Lb3 & "</b><p>" & Cmt & "</br></br><p>" & lnki & "</br></br><p>" & lnke 
                Set myMail=CreateObject("CDO.Message")
                myMail.Subject = TskDsc
                myMail.From = Emc
                myMail.To = HdrNml
                myMail.Cc = Eml
                myMail.Bcc = "jorge.barron@eryseg.com"
    '            myMail.AddAttachment "C:\inetpub\wwwroot\Hrm\reports\Attch01.txt"
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

        '<!-- Solo se les enviarán Notificaciones a los Evaluadores recién agregados (M36_Estatus = 1) -->
        sqlNev = "select a.M36_EvaluadorID, b.Emp_Email         " & _
                 "from HRM10540 a, HRM10220 b                   " & _
                 "where a.M36_CompaniaID    = b.Emp_CompaniaID  " & _
                 "and   a.M36_EvaluadorID   = b.Emp_EmpleadoID  " & _
                 "and   a.M36_Ejercicio     =  "& Ejr &"        " & _
                 "and   a.M36_CorporativoID = '5000'            " & _
                 "and   a.M36_EmpleadoID    = '"& Nem &"'       " & _
                 "and   a.M36_Estatus       = 1                 "
        set rsNev = dbconn.execute(sqlNev)
        if not rsNev.bof and not rsNev.eof then
            do while not rsNev.eof
                TskScr = "Hrm_PadeAutEnc.asp?Mdl=" & Mdl &  "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc
                TskDsc = Dsc & " - " & TskTx4
                Evl    = trim(rsNev("M36_EvaluadorID"))
                EvlEm  = trim(rsNev("Emp_Email"))
                response.write("EvlEm : " & EvlEm & "</br>")
                sqlins = "insert into HRM10400                    " & _
                         "values('PADE',                          " & _
                         "       '',                              " & _
                         "       '"& Nem &"',                     " & _
                         "       '',                              " & _
                         "       1,                               " & _
                         "       1,                               " & _
                         "       '"& Evl &"',                     " & _
                         "       '"& Dsc &"',                     " & _
                         "       '"& Fhy &"',                     " & _
                         "       '',                              " & _
                         "       'A',                             " & _
                         "       '"& TskScr &"',                  " & _
                         "       '"& TskDsc &"')                  "
                set rsi = dbconn.execute(sqlins)

                '<!-- Validamos si el Envio de Emails está activado -->
                if EnvEml = 1 then
                    '<!-- Validamos si el Evaluador tiene Email -->
	                if trim(EvlEm) <> "" then
                        msgtext = "<b>" & Nmb & "  " & EmMs04 & "</b>" & "</br></br><p>" & lnki & "</br></br><p>" & lnke 
                        Set myMail=CreateObject("CDO.Message")
                        myMail.Subject = TskDsc
                        myMail.From = Emc
                        myMail.To = EvlEm
    '                    myMail.Cc = HdrNml
                        myMail.Bcc = "jorge.barron@eryseg.com"
            '            myMail.AddAttachment "C:\inetpub\wwwroot\Hrm\reports\Attch01.txt"
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
                rsNev.movenext
            loop
            rsNev.close
            set rsNev = nothing
        end if
        if trim(Trn) = "Hrm_PadeAdmin01.asp" then
            %><script>window.close();</script><%
        else
            response.redirect Trn & "?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid
        end if
    end if
    %>

    <% call hdr(TitSec,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL AQUI -->
        <div class="box box-success">
            <div class="box-header">
                <div class="box-header with-border">
                    <h3 class="box-title">
                        <img src="<%= HdrNim %>" style="height: 80px;" alt="<%= HdrNmb %>">
                         <%= Nem & " - " & HdrNmb & " - " & HdrNpd%>
                    </h3>
                </div>
            </div>
            <form action="Hrm_PadeAutM360.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid & "&Eid=" & Eid & "&Nem=" & Nem & "&Nmb=" & Nmb & "&Cid=" & Cid %>" name="form1" method="post">
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
                     "and   a.M36_EmpleadoID      = '"& Nem &"'          "

            set rsO = dbconn.execute(sqlEvl)
            if not rsO.bof and not rsO.eof then
                i = 0
                TotEvl = 0
                dim EstEvl
                %>
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title"><%= BxHd02 %></h3>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th><%= Tb1Hd1 %></th>
                                <th><%= Tb1Hd2 %></th>
                                <th><%= Fr1Lb2 %></th>
                                <th><%= EstHdr %></th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                            do while not rsO.eof
                                i = i + 1
                                TotEvl = TotEvl + 1
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
                                </tr>
                                <%
                                rsO.movenext
                            loop
                            rsO.close
                            set rsO = Nothing
                            %>
                            </tbody>
                        </table>
                        </br>
                        <div class="form-group">
                            <label><%= Fr1Lb3 %></label>
                            <textarea class="form-control" id="Cmt" name="Cmt" rows="2"></textarea>
                        </div>
                        
                        <div class="box-footer" style="text-align: center">
                            <input type="hidden" name="Ind" id="ind" value="<%= i %>" /></input>
                            <button type="submit" class="btn btn-primary" name="Sbt5" id="Sbt5" value="Sbt5" style="background-color: #f00"  ><%= SmBtn5 %></button>&nbsp;&nbsp;&nbsp;
                            <button type="submit" class="btn btn-primary" name="Sbt6" id="Sbt6" value="Sbt6" style="background-color: green" ><%= SmBtn6 %></button>
                        </div>
                    </div>
                
                </div>
                <%
            end if
            %>
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

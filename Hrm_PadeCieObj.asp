<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Cierre de Objetivos Empleados PADE</title>
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
    <%
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0300' and Trd_IdiomaID = '"& Lng &"'  "
    
    set rsTrn = dbconn.execute(sqlTrn)
    if not rsTrn.eof and not rsTrn.bof then
        dim Elm
        do while not rsTrn.eof
            Elm = trim(rsTrn("Trd_ElementoID"))
            Select Case Elm
              Case "TitPri"
                TitPri = trim(rsTrn("Trd_Texto"))
              Case "TitCie"
                TitCie = trim(rsTrn("Trd_Texto"))
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
              Case "Tb1Hd4"
                Tb1Hd4 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd5"
                Tb1Hd5 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd6"
                Tb1Hd6 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd7"
                Tb1Hd7 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd8"
                Tb1Hd8 = trim(rsTrn("Trd_Texto"))
              Case "Tb1Hd9"
                Tb1Hd9 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl1"
                Fr1Sl1 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl2"
                Fr1Sl2 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl3"
                Fr1Sl3 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl4"
                Fr1Sl4 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl5"
                Fr1Sl5 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Sl6"
                Fr1Sl6 = trim(rsTrn("Trd_Texto"))
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
              Case "Fr1Lb12"
                Fr1Lb12 = trim(rsTrn("Trd_Texto"))
              Case "Fr1Ph12"
                Fr1Ph12 = trim(rsTrn("Trd_Texto"))
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
              Case "MsEr01"
                MsEr01  = trim(rsTrn("Trd_Texto"))
              Case "MsEr02"
                MsEr02  = trim(rsTrn("Trd_Texto"))
              Case "MsEr03"
                MsEr03  = trim(rsTrn("Trd_Texto"))
              Case "TskTx1"
                TskTx1  = trim(rsTrn("Trd_Texto"))
              Case "TskTx2"
                TskTx2  = trim(rsTrn("Trd_Texto"))
              Case "TskTx3"
                TskTx3  = trim(rsTrn("Trd_Texto"))
              Case "TskTx4"
                TskTx4  = trim(rsTrn("Trd_Texto"))
              Case "EmMs04"
                EmMs04  = trim(rsTrn("Trd_Texto"))
              Case else
                Tb0Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    '<!-- Alta de Registros (inicio) -->

    Dim Eid
    Dim Ejr
    Dim Dsc
    Dim Sbt4
    Eid = ""
    Ejr = ""
    Dsc = ""
    Eid = trim(Request.QueryString("Eid"))
    Ejr = CInt(Request.QueryString("Ejr"))
    Eja = Ejr - 1
    Dsc = Request.Querystring("Dsc")
    Sbt4 = Request.Form("Sbt4")

    sqlCia = "select Emp_CompaniaID, Emp_PlazaSuperior, Emp_Email from HRM10220 where Emp_Empleadoid = '"& Eid &"' "
    set rsCia = dbconn.execute(sqlCia)
    if not rsCia.bof and not rsCia.eof then
        Cid = trim(rsCia("Emp_CompaniaID"))
        Pzs = rsCia("Emp_PlazaSuperior")
        Uem = trim(rsCia("Emp_Email"))

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
        Uem = ""
        Jin = ""
        Jem = ""
    end if

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
    
    if Tvl = 2 then
        response.redirect "Hrm_PadeCieObjE.asp?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc
    end if

    '<!--  Llamamos la Funcion de Datos del Empleado - Inicio -->
    dim HdrNid
    dim HdrCid
    dim HdrNim
    dim HdrNmb
    dim HdrNml
    dim HdrNpd
    call HdrNem(Eid,Cid)
'    response.write("HdrNim : " & HdrNim & ", HdrNmb : " & HdrNmb & ", HdrNml : " & HdrNml & ", HdrNpd : " & HdrNpd)
    '<!--  Llamamos la Funcion de Datos del Empleado - Final -->

    '<!--  Buscamos si está activado el Parametro de Envio de Emails - Inicio -->
    dim EnvEml
    call PrmEml()
    '<!--  Buscamos si está activado el Parametro de Envio de Emails - Fin -->

    if Sbt4 = "Sbt4" then
        Ind = Request.Form("Ind")
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                Ptd = trim(Request.Form("Ptd"&i))
                Tob = trim(Request.Form("Tob"&i))
                Pnt = trim(Request.Form("Pnt"&i))
                Ffn = trim(Request.Form("FecFin"&i))
                Rfn = trim(Request.Form("ObjRfn"&i))
                if Ffn > "" then
                    Ffn = Mid(trim(Ffn),7,4)  & "-" & Mid(trim(Ffn),1,2)  & "-" & Mid(trim(Ffn),4,2)
                    '<!-- Buscamos el Resultado Objetivo -->
                    sqlRob = "select Pod_Meta,        Pod_Direccion,  " & _
                             "       Pod_Ponderacion                  " & _
                             "from HRM10531                           " & _
                             "where Pod_CorporativoID = '5000'        " & _
                             "and   Pod_CompaniaID    = '"& Cid &"'   " & _
                             "and   Pod_EmpleadoID    = '"& Eid &"'   " & _
                             "and   Pod_Ejercicio     =  "& Eja &"    " & _
                             "and   Pod_Partida       =  "& Ptd &"    "
                    set rsRob = dbconn.execute(sqlRob)
                    if not rsRob.eof and not rsRob.bof then
                        if trim(rsRob("Pod_Direccion")) = "D" then
                            if CDbl(rsRob("Pod_Meta")) <> 0 then
                                if CDbl(Rfn) <> 0 then
                                    Rcl = CDbl(rsRob("Pod_Meta")) / CDbl(Rfn)
                                    if Rcl < 0 then
                                        Rcl = Rcl * -1
                                    end if
                                    if Rcl > 1.5 then
                                        Rcl = 1.5
                                    end if
                                    Rcl = Rcl * CDbl(rsRob("Pod_Ponderacion"))
                                else
                                    if CDbl(Rfn) > CDbl(rsRob("Pod_Meta")) then
                                        Rcl = 0
                                    else
                                        Rcl = CDbl(rsRob("Pod_Ponderacion"))
                                    end if
                                end if
                            else
                                if CDbl(Rfn) = 0 then
                                    Rcl = CDbl(rsRob("Pod_Ponderacion"))
                                else
                                    if CDbl(Rfn) > CDbl(rsRob("Pod_Meta")) then
                                        Rcl = 0
                                    else
                                        Rcl = CDbl(rsRob("Pod_Ponderacion"))
                                    end if
                                end if
                            end if
                        else
                            if CDbl(rsRob("Pod_Meta")) <> 0 then
                                if CDbl(Rfn) <> 0 then
                                    Rcl = CDbl(Rfn) / CDbl(rsRob("Pod_Meta"))
                                    if Rcl > 1.5 then
                                        Rcl = 1.5 * CDbl(rsRob("Pod_Ponderacion"))
                                    end if
                                    Rcl = Rcl * CDbl(rsRob("Pod_Ponderacion"))
                                else
                                    if CDbl(Rfn) = 0 then
                                        if CDbl(Rfn) >= CDbl(rsRob("Pod_Meta")) then
                                            Rcl = CDbl(rsRob("Pod_Ponderacion"))
                                        else
                                            Rcl = 0
                                        end if
                                    else
                                        Rcl = CDbl(Rfn) / CDbl(rsRob("Pod_Meta"))
                                    end if
                                end if
                            else
                                if CDbl(Rfn) >= CDbl(rsRob("Pod_Meta")) then
                                    Rcl = CDbl(rsRob("Pod_Ponderacion"))
                                else
                                    Rcl = 0
                                end if
                            end if
                        end if
                        sqlUpd = "update HRM10531                         " & _
                                 "set Pod_FechaFinReal   = '"& Ffn &"',   " & _
                                 "    Pod_ResultadoFinal =  "& Rfn &",    " & _
                                 "    Pod_ResultadoCalc  =  "& Rcl &"     " & _
                                 "where Pod_CorporativoID = '5000'        " & _
                                 "and   Pod_CompaniaID    = '"& Cid &"'   " & _
                                 "and   Pod_EmpleadoID    = '"& Eid &"'   " & _
                                 "and   Pod_Ejercicio     =  "& Eja &"    " & _
                                 "and   Pod_Partida       =  "& Ptd &"    "
                        set rsUpd = dbconn.execute(sqlUpd)
                    end if
                end if
            next
            '<!-- Actualizamos los Resultados de los Objetivos que tienen SubObjetivos (Inicio) -->
            sqlSob = "select sum(Pod_ResultadoCalc) as Tot,   " & _
                     "       Pod_Parent                       " & _
                     "from HRM10531                           " & _
                     "where Pod_CorporativoID = '5000'        " & _
                     "and   Pod_CompaniaID    = '"& Cid &"'   " & _
                     "and   Pod_EmpleadoID    = '"& Eid &"'   " & _
                     "and   Pod_Ejercicio     =  "& Eja &"    " & _
                     "and   Pod_Parent        > 0             " & _
                     "group by Pod_Parent                     "
            set rsSob = dbconn.execute(sqlSob)
            if not rsSob.bof and not rsSob.eof then
                do while not rsSob.eof
                    Ptd = trim(rsSob("Pod_Parent"))
                    sqlPnd = "select Pod_Ponderacion                  " & _
                             "from HRM10531                           " & _
                             "where Pod_CorporativoID = '5000'        " & _
                             "and   Pod_CompaniaID    = '"& Cid &"'   " & _
                             "and   Pod_EmpleadoID    = '"& Eid &"'   " & _
                             "and   Pod_Ejercicio     =  "& Eja &"    " & _
                             "and   Pod_Partida       =  "& Ptd &"    "
                    set rsPnd = dbconn.execute(sqlPnd)
                    if not rsPnd.bof and not rsPnd.eof then
                        if trim(rsSob("Tot")) > "0" then
                            Tot = (CDbl(rsSob("Tot")) / 100) * CInt(rsPnd("Pod_Ponderacion"))
                            sqlUpd = "update HRM10531                         " & _
                                     "set Pod_ResultadoCalc  =  "& Tot &"     " & _
                                     "where Pod_CorporativoID = '5000'        " & _
                                     "and   Pod_CompaniaID    = '"& Cid &"'   " & _
                                     "and   Pod_EmpleadoID    = '"& Eid &"'   " & _
                                     "and   Pod_Ejercicio     =  "& Eja &"    " & _
                                     "and   Pod_Partida       =  "& Ptd &"    "
                            set rsUpd = dbconn.execute(sqlUpd)
                        end if
                    end if
                    rsSob.movenext
                loop
                rsSob.close
                set rsSob = Nothing
            end if
            '<!-- Actualizamos los Resultados de los Objetivos que tienen SubObjetivos (Final)  -->

            '<!-- Actualizamos los Resultados de los Objetivos que tienen SubObjetivos (Inicio) -->
            sqlCal = "select sum(Pod_ResultadoCalc) as Tot    " & _
                     "from HRM10531                           " & _
                     "where Pod_CorporativoID = '5000'        " & _
                     "and   Pod_CompaniaID    = '"& Cid &"'   " & _
                     "and   Pod_EmpleadoID    = '"& Eid &"'   " & _
                     "and   Pod_Ejercicio     =  "& Eja &"    " & _
                     "and   Pod_Parent        = 0             " & _
                     "group by Pod_Parent                     "
            set rsCal = dbconn.execute(sqlCal)
            if not rsCal.bof and not rsCal.eof then
                Tcl = CDbl(rsCal("Tot"))
            else
                Tcl = 0
            end if
            '<!-- Actualizamos los Resultados de los Objetivos que tienen SubObjetivos (Final)  -->

            '<!-- Actualizamos Semaforos y Enviamos Notificación de Autorización (Inicio) -->
            sqlupd = "update HRM10525                        " & _
                     "set Evh_Estatus = 1,                   " & _
                     "    Evh_ResCalc = "& Tcl &"            " & _
                     "where Evh_CorporativoID = '5000'       " & _
                     "and   Evh_CompaniaID    = '"& Cid &"'  " & _
                     "and   Evh_EmpleadoID    = '"& Eid &"'  " & _
                     "and   Evh_Ejercicio     =  "& Eja &"   "
            set rsu = dbconn.execute(sqlupd)
            sqlupd = "update HRM10502                         " & _
                     "set Psm_Estatus         = 1             " & _
                     "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                     "and   Psm_CorporativoID = '5000'        " & _
                     "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                     "and   Psm_EmpleadoID    = '"& Eid &"'   " & _
                     "and   Psm_SemaforoID    = 'OBJHAB0010'  "
            set rsu = dbconn.execute(sqlupd)

            Fhy = year(date) & "-" & month(date) & "-" & day(date)
            TskScr = "Hrm_PadeAutCieObj.asp?Mdl=" & Mdl &  "&Trn=" & Trn & "&Ejr=" & Ejr & "&Nem=" & Eid & "&Nmb=" & Unm & "&Dsc=" & Dsc & "&Cid=" & Cid
            TskDsc = Dsc & " - " & TskTx4
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
                '<!-- Validamos si el Solicitante tiene Email -->
			    if trim(Jem) <> "" then
                    Dim myMail
                    Set myMail=CreateObject("CDO.Message")
                    myMail.Subject = TskDsc
                    msgtext = Unm & "  " & EmMs04 & "</br></br><p>" & lnki & "</br></br><p>" & lnke 
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
                response.redirect Trn & "?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid
            end if
            '<!-- Actualizamos Semaforos y Enviamos Notificación de Autorización (Final)  -->
        end if
    end if

    '<!-- Alta de Registros (fin) -->
    SubTit = Dsc
    %>
    <!-- Content Header (Page header) -->
    <% call hdr(TitCie,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <div class="box box-success">
            <form action="Hrm_PadeCieObj.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form1" method="post">
                <div class="box-header with-border">
                    <h3 class="box-title">
                        <img src="<%= HdrNim %>" style="height: 45px;" alt="<%= HdrNmb %>">
                        <%= Eid & " - " & HdrNmb & " - " & HdrNpd%>
                    </h3>
                </div>
                <!-- form start -->
                <div class="box-body">
                <%
                sqlObj = "select * from HRM10531                 " & _
                         "where Pod_CorporativoID = '5000'       " & _
                         "and   Pod_CompaniaID    = '"& Cid &"'  " & _
                         "and   Pod_EmpleadoID    = '"& Eid &"'  " & _
                         "and   Pod_Ejercicio     =  "& Eja &"   " & _
                         "and   Pod_Tipo          = 1            " & _
                         "order by Pod_Partida                   "
                set rsO = dbconn.execute(sqlObj)
                if not rsO.bof and not rsO.eof then
                    i = 0
                    TotPnd = 0
                    %>
                    <div class="box box-primary">
                        <form action="Hrm_PadeCieObj.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid %>" name="form1a" method="post">
<!--
                            <div class="box-header">
                                <h3 class="box-title">Registrados</h3>
                            </div>
-->
                            <div class="box-body">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th><%= Tb1Hd1 %></th>
                                        <th><%= Tb1Hd2 %></th>
                                        <th><%= Tb1Hd7 %></th>
                                        <th><%= Tb1Hd3 %></th>
                                        <th><%= Tb1Hd4 %></th>
                                        <th><%= Tb1Hd6 %></th>
                                        <th><%= Tb1Hd5 %></th>
                                        <th><%= Tb1Hd8 %></th>
                                        <th><%= Tb1Hd9 %></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                    do while not rsO.eof
                                        i = i + 1
                                        TotPnd = TotPnd + CInt(rsO("Pod_Ponderacion"))
                                        if trim(rsO("Pod_FechaFinCalc")) > "" then
                                            FFcl = Mid(CStr(trim(rsO("Pod_FechaFinCalc"))),6,2) & "/" & Mid(CStr(trim(rsO("Pod_FechaFinCalc"))),9,2) & "/" & Mid(CStr(trim(rsO("Pod_FechaFinCalc"))),1,4)
                                        else
                                            FFcl = ""
                                        end if
                                        if trim(rsO("Pod_FechaFinReal")) > "1900-01-01" then
                                            FFrl = Mid(CStr(trim(rsO("Pod_FechaFinReal"))),6,2) & "/" & Mid(CStr(trim(rsO("Pod_FechaFinReal"))),9,2) & "/" & Mid(CStr(trim(rsO("Pod_FechaFinReal"))),1,4)
                                        else
                                            FFrl = ""
                                        end if
                                        if CInt(rsO("Pod_ResultadoFinal")) > "" then
                                            RSfl = CDbl(rsO("Pod_ResultadoFinal"))
                                        else
                                            RSfl = ""
                                        end if
                                        '<!-- Validamos si existen Subobjetivos para mostrar solo en Display el Objetivo Padre -->
                                        sqlSob = "select * from HRM10531                 " & _
                                                 "where Pod_CorporativoID = '5000'       " & _
                                                 "and   Pod_CompaniaID    = '"& Cid &"'  " & _
                                                 "and   Pod_EmpleadoID    = '"& Eid &"'  " & _
                                                 "and   Pod_Ejercicio     =  "& Eja &"   " & _
                                                 "and   Pod_Tipo          = 2            " & _
                                                 "and   Pod_Parent        = "& trim(rsO("Pod_Partida")) &"  " & _
                                                 "order by Pod_Partida                   "
                                        set rsS = dbconn.execute(sqlSob)
                                        if not rsS.bof and not rsS.eof then
                                            %>
                                            <tr>
                                                <td>
                                                    <input type="hidden" name="<%= "Ptd"&i %>" id="<%= "Ptd"&i %>" value="<%= rsO("Pod_Partida") %>" />
                                                    <input type="hidden" name="<%= "Tob"&i %>" id="<%= "Tob"&i %>" value="<%= rsO("Pod_Tipo") %>" />
                                                    <input type="hidden" name="<%= "Pnt"&i %>" id="<%= "Pnt"&i %>" value="<%= rsO("Pod_Parent") %>" />
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <%= rsO("Pod_Ponderacion") %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <%= trim(rsO("Pod_Descripcion")) %>
                                                    </a>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <% if trim(rsO("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <%= rsO("Pod_Meta") %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <%= rsO("Pod_UniMed") %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <%= FFcl %>
                                                    </a>
                                                </td>
                                                <td style="text-align: center">
                                                    <input type="hidden" class="form-control" id="<%= "datepicker"&i %>" name="<%= "FecFin"&i %>" placeholder="<%= Tb1Hd8 %>" disabled="disabled" />
                                                </td>
                                                <td style="text-align: center">
                                                    <input type="hidden" class="form-control" id="<%= "ObjRfn"&i %>" name="<%= "ObjRfn"&i %>" placeholder="<%= Tb1Hd9 %>" disabled="disabled" />
                                                </td>
                                            </tr>
                                            <%
                                            do while not rsS.eof
                                                if trim(rsS("Pod_FechaFinCalc")) > "" then
                                                    FFcl = Mid(CStr(trim(rsS("Pod_FechaFinCalc"))),6,2) & "/" & Mid(CStr(trim(rsS("Pod_FechaFinCalc"))),9,2) & "/" & Mid(CStr(trim(rsS("Pod_FechaFinCalc"))),1,4)
                                                else
                                                    FFcl = ""
                                                end if
                                                if trim(rsS("Pod_FechaFinReal")) > "1900-01-01" then
                                                    FFrl = Mid(CStr(trim(rsS("Pod_FechaFinReal"))),6,2) & "/" & Mid(CStr(trim(rsS("Pod_FechaFinReal"))),9,2) & "/" & Mid(CStr(trim(rsS("Pod_FechaFinReal"))),1,4)
                                                else
                                                    FFrl = ""
                                                end if
                                                if CInt(rsS("Pod_ResultadoFinal")) > "" then
                                                    RSfl = CDbl(rsS("Pod_ResultadoFinal"))
                                                else
                                                    RSfl = ""
                                                end if
                                                i = i + 1
                                                %>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <input type="hidden" name="<%= "Ptd"&i %>" id="<%= "Ptd"&i %>" value="<%= rsS("Pod_Partida") %>" />
                                                        <input type="hidden" name="<%= "Tob"&i %>" id="<%= "Tob"&i %>" value="<%= rsS("Pod_Tipo") %>" />
                                                        <input type="hidden" name="<%= "Pnt"&i %>" id="<%= "Pnt"&i %>" value="<%= rsS("Pod_Parent") %>" />
                                                        <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                            <%= rsS("Pod_Ponderacion") %>
                                                        </a>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                            <%= trim(rsS("Pod_Descripcion")) %>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                            <% if trim(rsS("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                            <%= rsS("Pod_Meta") %>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                            <%= rsS("Pod_UniMed") %>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsS("Pod_Partida") %>">
                                                            <%= FFcl %>
                                                        </a>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <input type="text" class="form-control" id="<%= "datepicker"&i %>" name="<%= "FecFin"&i %>" placeholder="<%= Tb1Hd8 %>" value="<%= FFrl %>" required />
                                                    </td>
                                                    <td style="text-align: center">
                                                        <input type="number" step=".001" class="form-control" style="text-align: right" id="<%= "ObjRfn"&i %>" name="<%= "ObjRfn"&i %>" placeholder="<%= Tb1Hd9 %>" value="<%= formatnumber(RSfl,4) %>" required />
                                                    </td>
                                                </tr>
                                                <%      
                                                rsS.movenext
                                            loop
                                            rsS.close
                                            set rsS = Nothing
                                        else
                                            %>
                                            <tr>
                                                <td>
                                                    <input type="hidden" name="<%= "Ptd"&i %>" id="<%= "Ptd"&i %>" value="<%= rsO("Pod_Partida") %>" />
                                                    <input type="hidden" name="<%= "Tob"&i %>" id="<%= "Tob"&i %>" value="<%= rsO("Pod_Tipo") %>" />
                                                    <input type="hidden" name="<%= "Pnt"&i %>" id="<%= "Pnt"&i %>" value="<%= rsO("Pod_Parent") %>" />
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <%= rsO("Pod_Ponderacion") %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <%= trim(rsO("Pod_Descripcion")) %>
                                                    </a>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <% if trim(rsO("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <%= rsO("Pod_Meta") %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <%= rsO("Pod_UniMed") %>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="Hrm_PadeCnsCieObj1.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Eja & "&Dsc=" & Dsc & "&Ptd=" & rsO("Pod_Partida") %>">
                                                        <%= Ffcl %>
                                                    </a>
                                                </td>
                                                <td style="text-align: center">
                                                    <input type="text" class="form-control" id="<%= "datepicker"&i %>" name="<%= "FecFin"&i %>" placeholder="<%= Tb1Hd8 %>" value="<%= FFrl %>" required />
                                                </td>
                                                <td style="text-align: center">
                                                    <input type="number" step=".001" class="form-control" style="text-align: right" id="<%= "ObjRfn"&i %>" name="<%= "ObjRfn"&i %>" placeholder="<%= Tb1Hd9 %>" value="<%= formatnumber(RSfl,4) %>" required />
                                                </td>
                                            </tr>
                                            <%
                                        end if
                                        '<!-- Fin de la Validación -->
                                        rsO.movenext
                                    loop
                                    rsO.close
                                    set rsO = Nothing
                                    %>
                                    </tbody>
                                </table>
                                <div class="box-footer" style="text-align: center">
                                    <input type="hidden" name="Ind" id="Ind" value="<%= i %>" />
                                    <%
                                    if TotPnd = 100 then
                                    %>
                                    <button type="submit" class="btn btn-primary" name="Sbt4" id="Sbt4" value="Sbt4" style="background-color: green" ><%= SmBtn4 %></button>
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
                <!-- /.box-body -->
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
    $("#datepicker1").datepicker();
    $("#datepicker2").datepicker();
    $("#datepicker3").datepicker();
    $("#datepicker4").datepicker();
    $("#datepicker5").datepicker();
    $("#datepicker6").datepicker();
    $("#datepicker7").datepicker();
    $("#datepicker8").datepicker();
    $("#datepicker9").datepicker();
    $("#datepicker10").datepicker();
    $("#datepicker11").datepicker();
    $("#datepicker12").datepicker();
    $("#datepicker13").datepicker();
    $("#datepicker14").datepicker();
    $("#datepicker15").datepicker();
    $("#datepicker16").datepicker();
    $("#datepicker17").datepicker();
    $("#datepicker18").datepicker();
    $("#datepicker19").datepicker();
    $("#datepicker20").datepicker();
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
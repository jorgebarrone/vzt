<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | Autorización de Objetivos Empleados PADE</title>
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
              Case "SubTit"
                SubTit = trim(rsTrn("Trd_Texto"))
              Case "TitSec"
                TitSec = trim(rsTrn("Trd_Texto"))
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
              Case "SmBtn5"
                SmBtn5  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn6"
                SmBtn6  = trim(rsTrn("Trd_Texto"))
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
              Case "EmMs01"
                EmMs01  = trim(rsTrn("Trd_Texto"))
              Case "EmMs02"
                EmMs02  = trim(rsTrn("Trd_Texto"))
              Case "EmMs03"
                EmMs03  = trim(rsTrn("Trd_Texto"))
              Case else
                Tb1Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

    '<!-- Alta de Registros (inicio) -->

    Dim Eid
    Dim Ejr
    Dim Dsc
    Dim Nem
    Dim Nmb
    Dim Cid
    Dim Sbt1
    Dim Sbt2
    Dim Sbt3
    Dim Sbt4
    Dim Cmt
    Dim myMail
    Eid = ""
    Ejr = ""
    Dsc = ""
    Eid = Request.Querystring("Eid")
    Ejr = Request.Querystring("Ejr")
    Dsc = Request.Querystring("Dsc")
    Nem = Request.Querystring("Nem")
    Nmb = Request.Querystring("Nmb")
    Cid = Request.Querystring("Cid")
    Sbt1 = Request.Form("Sbt1")
    Sbt2 = Request.Form("Sbt2")
    Cmt  = Request.Form("CmtJfe")

    sqlTvl = "select Evh_TipoEval                    " & _
             "from HRM10525                          " & _
             "where Evh_CorporativoID = '5000'       " & _
             "and   Evh_EmpleadoID    = '"& Nem &"'  " & _
             "and   Evh_CompaniaID    = '"& Cid &"'  " & _
             "and   Evh_Ejercicio     =  "& Ejr &"   "
    set rsT = dbconn.execute(sqlTvl)
    if not rsT.bof and not rsT.eof then
        Tvl = rsT("Evh_TipoEval")
    else
        Tvl = 0
    end if
    
    if Tvl = 2 then
        response.redirect "Hrm_PadeAutObjE.asp?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid & "&Eid=" & Eid & "&Ejr=" & Ejr & "&Nem=" & Nem & "&Nmb=" & Nmb & "&Dsc=" & Dsc & "&Cid=" & Cid
    end if

    '<!--  Llamamos la Funcion de Datos del Empleado - Inicio -->
    dim HdrNid
    dim HdrCid
    dim HdrNim
    dim HdrNmb
    dim HdrNml
    dim HdrNpd
    call HdrNem(Nem,Cid)
'    response.write("HdrNim : " & HdrNim & ", HdrNmb : " & HdrNmb & ", HdrNml : " & HdrNml & ", HdrNpd : " & HdrNpd)
    '<!--  Llamamos la Funcion de Datos del Empleado - Final -->

    '<!--  Buscamos si está activado el Parametro de Envio de Emails - Inicio -->
    dim EnvEml
    call PrmEml()
    '<!--  Buscamos si está activado el Parametro de Envio de Emails - Fin -->
    
    '<!--  Buscamos el Email del Autorizador Inicio -->
    sqlEml = "select Emp_Email from HRM10220 where Emp_EmpleadoID = '"& Eid &"' "
    set rsEml = dbconn.execute(sqlEml)
    if not rsEml.bof and not rsEml.eof then
        Aml = trim(rsEml("Emp_Email"))
    else
        Aml = ""
    end if
    '<!--  Buscamos el Email del Autorizador Final  -->
    
    if Sbt1 = "Sbt1" then
        sqlupd = "update HRM10525                        " & _
                 "set Evh_Estatus = 0                    " & _
                 "where Evh_CorporativoID = '5000'       " & _
                 "and   Evh_CompaniaID    = '"& Cid &"'  " & _
                 "and   Evh_EmpleadoID    = '"& Nem &"'  " & _
                 "and   Evh_Ejercicio     =  "& Ejr &"   "
        set rsu = dbconn.execute(sqlupd)
'        response.write(sqlupd)
'        response.write("</br>")
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = 0             " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Nem &"'   " & _
                 "and   Psm_SemaforoID    = 'APROBJ0010'  "
        set rsu = dbconn.execute(sqlupd)
'        response.write(sqlupd)
'        response.write("</br>")

        Fhy = year(date) & "-" & month(date) & "-" & day(date)
        TskScr = "Hrm_PadeAprObj.asp?Mdl=" & Mdl &  "&Trn=" & Trn & "&Ejr=" & Ejr & "&Nem=" & Eid & "&Nmb=" & Unm & "&Dsc=" & Dsc & "&Cid=" & Cid
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
        'response.write(sqlins)

        '<!-- Validamos si el Envio de Emails está activado -->
        if EnvEml = 1 then
            '<!-- Validamos si el Solicitante tiene Email -->
	        if trim(Eml) <> "" then
                msgtext = "<b>" & EmMs02 & "</b></br><p><b>" & Fr1Lb12 & "</b><p>" & Cmt & "</br></br><p>" & lnki & "</br></br><p>" & lnke 
                Set myMail=CreateObject("CDO.Message")
                myMail.Subject = TskDsc
                myMail.From = Emc
                myMail.To = Eml
                myMail.Cc = Aml
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
        if trim(Trn) = "Hrm_PadeAdmin01.asp" then
            %><script>window.close();</script><%
        else
            response.redirect Trn & "?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid
        end if
    end if

    if Sbt2 = "Sbt2" then
        sqlupd = "update HRM10525                        " & _
                 "set Evh_Estatus = 3                    " & _
                 "where Evh_CorporativoID = '5000'       " & _
                 "and   Evh_CompaniaID    = '"& Cid &"'  " & _
                 "and   Evh_EmpleadoID    = '"& Nem &"'  " & _
                 "and   Evh_Ejercicio     =  "& Ejr &"   "
        set rsu = dbconn.execute(sqlupd)
        sqlupd = "update HRM10502                         " & _
                 "set Psm_Estatus         = 3             " & _
                 "where Psm_Ejercicio     = "&  Ejr   &"  " & _
                 "and   Psm_CorporativoID = '5000'        " & _
                 "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                 "and   Psm_EmpleadoID    = '"& Nem &"'   " & _
                 "and   Psm_SemaforoID    = 'APROBJ0010'  "
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
        'response.write(sqlins)

        '<!-- Validamos si el Envio de Emails está activado -->
        if EnvEml = 1 then
            '<!-- Validamos si el Solicitante tiene Email -->
	        if trim(Eml) <> "" then
                msgtext = "<b>" & EmMs03 & "</b></br><p><b>" & Fr1Lb12 & "</b><p>" & Cmt & "</br></br><p>" & lnki & "</br></br><p>" & lnke 
                Set myMail=CreateObject("CDO.Message")
                myMail.Subject = TskDsc
                myMail.From = Emc
                myMail.To = Eml
                myMail.Cc = Aml
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
        if trim(Trn) = "Hrm_PadeAdmin01.asp" then
            %><script>window.close();</script><%
        else
            response.redirect Trn & "?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid
        end if
    end if

    '<!-- Alta de Registros (fin) -->
    SubTit = Dsc
    %>
    <!-- Content Header (Page header) -->
    <% call hdr(TitSec,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <div class="box box-success">
            <form action="Hrm_PadeAutObj.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Sid=" & Sid & "&Eid=" & Eid & "&Nem=" & Nem & "&Nmb=" & Nmb & "&Cid=" & Cid %>" name="form1" method="post">
                <div class="box-header with-border">
                    <h3 class="box-title">
                        <img src="<%= HdrNim %>" style="height: 45px;" alt="<%= HdrNmb %>">
                        <%= Nem & " - " & HdrNmb & " - " & HdrNpd%>
                    </h3>
                </div>
                <!-- form start -->
                <div class="box-body">
                <%
                EstNeg = "EST" & Ejr
                sqlObj = "select * from HRM10531                 " & _
                         "where Pod_CorporativoID = '5000'       " & _
                         "and   Pod_CompaniaID    = '"& Cid &"'  " & _
                         "and   Pod_EmpleadoID    = '"& Nem &"'  " & _
                         "and   Pod_Ejercicio     =  "& Ejr &"   " & _
                         "and   Pod_Tipo          = 1            " & _
                         "order by Pod_Partida                   "


                'response.write()
                set rsO = dbconn.execute(sqlObj)
                if not rsO.bof and not rsO.eof then
                    i = 0
                    TotPnd = 0
                    %>
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
                        </tr>
                        </thead>
                        <tbody>
                        <%
                        do while not rsO.eof
                            i = i + 1
                            TotPnd = TotPnd + CInt(rsO("Pod_Ponderacion"))
                            %>
                            <tr>
                                <td><%= rsO("Pod_Ponderacion") %></td>
                                <td><%= rsO("Pod_Descripcion") %></td>
                                <td>&nbsp;</td>
                                <td><% if trim(rsO("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %></td>
                                <td><%= rsO("Pod_Meta") %></td>
                                <td><%= rsO("Pod_UniMed") %></td>
                                <td><%= rsO("Pod_FechaFinCalc") %></td>
                            </tr>
                            <%
                            sqlSob = "select * from HRM10531                 " & _
                                     "where Pod_CorporativoID = '5000'       " & _
                                     "and   Pod_CompaniaID    = '"& Cid &"'  " & _
                                     "and   Pod_EmpleadoID    = '"& Nem &"'  " & _
                                     "and   Pod_Ejercicio     =  "& Ejr &"   " & _
                                     "and   Pod_Tipo          = 2            " & _
                                     "and   Pod_Parent        = "& trim(rsO("Pod_Partida")) &"  " & _
                                     "order by Pod_Partida                   "
                            set rsS = dbconn.execute(sqlSob)
                            if not rsS.bof and not rsS.eof then
                                do while not rsS.eof
                                    i = i + 1
                                    %>
                                    <tr>
                                        <td style="text-align: right"><%= rsS("Pod_Ponderacion") %></td>
                                        <td><%= rsO("Pod_Descripcion") %></td>
                                        <td><%= rsS("Pod_Descripcion") %></td>
                                        <td><% if trim(rsS("Pod_Direccion")) = "I" then response.write(Fr1Sl5) else response.write(Fr1Sl6) end if  %></td>
                                        <td><%= rsS("Pod_Meta") %></td>
                                        <td><%= rsS("Pod_UniMed") %></td>
                                        <td><%= rsS("Pod_FechaFinCalc") %></td>
                                    </tr>
                                    <%
                                    rsS.movenext
                                loop
                                rsS.close
                                set rsS = Nothing
                            end if
                            rsO.movenext
                        loop
                        rsO.close
                        set rsO = Nothing
                        %>
                        </tbody>
                    </table>
                    <div class="form-group">
                        <label><%= Fr1Lb12 %></label>
                        <textarea class="form-control" rows="2" name="CmtJfe" id="CmtJfe" placeholder="<%= Fr1Ph12 %>"></textarea>
                    </div>
                    <div class="box-footer" style="text-align: center">
                    <%
                    if TotPnd = 100 then
                        %>
                        <button type="submit" class="btn btn-primary" name="Sbt1" id="Sbt1" value="Sbt1" style="background-color: #f00"  ><%= SmBtn5 %></button>&nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-primary" name="Sbt2" id="Sbt2" value="Sbt2" style="background-color: green" ><%= SmBtn6 %></button>
                        <%
                    end if
                    %>
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
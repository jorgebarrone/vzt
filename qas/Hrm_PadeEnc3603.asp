<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Contestar Encuesta 360°</title>
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
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0500' and Trd_IdiomaID = '"& Lng &"'  "
    
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
              Case "TskTx1"
                TskTx1  = trim(rsTrn("Trd_Texto"))
              Case "SmBtn1"
                SmBtn1  = trim(rsTrn("Trd_Texto"))
              Case "EmMs01"
                EmMs01  = trim(rsTrn("Trd_Texto"))
              Case else
                Tb0Hd0 = trim(rsTrn("Trd_Texto"))
            End Select
            rsTrn.movenext
        loop
    end if

   '<!-- Busqueda Parametros (inicio) -->
    Dim Ejr

    Dim Dsc
    Dim Nem
    Dim Nmb
    Dim Cid
    Dim Sbt1
    Dim Tpts
    Dim Sci
    Dim Ind
    Ejr = CInt(Request.QueryString("Ejr"))
    Dsc = Request.QueryString("Dsc")
    Nem = Request.QueryString("Nem")
    Nmb = Request.QueryString("Nmb")
    Cid = Request.QueryString("Cid")
    Scr = ""

    Sci = Request.Form("Sci")
    Ind = Request.Form("Ind")
    Sbt1 = Request.Form("Sbt1")
    Tpts = Request.Form("Tpts")

'    Response.write(Tpts)

    '<!--  Buscamos la Encuesta 360° del Ejercicio Actual Inicio -->
    sqlScr = "select Pnc_Encuesta360 from HRM10523 where Pnc_Ejercicio = "& Ejr &"   "
    set rsScr = dbconn.execute(sqlScr)
    if not rsScr.bof and not rsScr.eof then
        Sci = trim(rsScr("Pnc_Encuesta360"))
    end if
    '<!--  Buscamos la Encuesta 360° del Ejercicio Actual Final  -->

    '<!--  Buscamos la Imagen del Empleado Encuestado Inicio -->
    sqlImg = "select Emp_Foto, Emp_Email from HRM10220 where Emp_EmpleadoID = '"& Nem &"' and Emp_CompaniaID = '"& Cid &"'   "
    set rsImg = dbconn.execute(sqlImg)
    if not rsImg.bof and not rsImg.eof then
        Eim = trim(rsImg("Emp_Foto"))
        Eml = trim(rsImg("Emp_Email"))
    end if
    '<!--  Buscamos la Imagen del Empleado Encuestado Final  -->

    '<!--  Buscamos el Email del Evaluador Inicio -->
    sqlEml = "select Emp_Email from HRM10220 where Emp_EmpleadoID = '"& Uid &"' "
    set rsEml = dbconn.execute(sqlEml)
    if not rsEml.bof and not rsEml.eof then
        Vml = trim(rsEml("Emp_Email"))
    else
        Vml = ""
    end if
    '<!--  Buscamos el Email del Evaluador Final  -->

    '<!--  Procesamos Encuesta Inicio  -->
    if Sbt1 = "Sbt1" then
        Tot = 0
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                if i <= 33 then
                    RactID = Cint(request.form("ReactivoID"&i))
                    RactVL = Cint(request.form("ReactivoVL"&i))
                    Tot    = Tot + RactVL
                    if RactID > 0 then
                        sqlV = "select P36_ReactivoID      " & _
                               "from HRM10533              " & _
                               "where  P36_CorporativoID = '5000'          " & _
                               "and    P36_CompaniaID    = '"& Cid    &"'  " & _
                               "and    P36_EmpleadoID    = '"& Nem    &"'  " & _
                               "and    P36_EvaluadorID   = '"& Uid    &"'  " & _
                               "and    P36_Ejercicio     =  "& Ejr    &"   " & _
                               "and    P36_ReactivoID    =  "& RactID &"   "
                        set rsV = dbconn.execute(sqlV)
                        if not rsV.bof and not rsV.eof then
                            sqlU = "update HRM10533                            " & _
                                   "set    P36_ValorNumerico =  "& RactVL &"   " & _
                                   "where  P36_CorporativoID = '5000'          " & _
                                   "and    P36_CompaniaID    = '"& Cid    &"'  " & _
                                   "and    P36_EmpleadoID    = '"& Nem    &"'  " & _
                                   "and    P36_EvaluadorID   = '"& Uid    &"'  " & _
                                   "and    P36_Ejercicio     =  "& Ejr    &"   " & _
                                   "and    P36_ReactivoID    =  "& RactID &"   "
                            set rsU = dbconn.execute(sqlU)
                        else
                            sqli = "insert into HRM10533       " & _
                                   "values('5000',             " & _
                                   "       '"& Cid    &"',     " & _
                                   "       '"& Nem    &"',     " & _
                                   "       '"& Uid    &"',     " & _
                                   "        "& Ejr    &",      " & _
                                   "        "& RactID &",      " & _
                                   "        "& RactVL &")      "
                            set rsi = dbconn.execute(sqli)
        '                   response.write("Sql : ")
        '                   response.write(sqli)
        '                   response.write("</br>")
                        end if
                    end if
                else
                    if i = 34 or i = 35 then
                        RactID = Cint(request.form("ReactivoID"&i))
                        
                        sqlD = "delete HRM10533                            " & _
                               "where  P36_CorporativoID = '5000'          " & _
                               "and    P36_CompaniaID    = '"& Cid    &"'  " & _
                               "and    P36_EmpleadoID    = '"& Nem    &"'  " & _
                               "and    P36_EvaluadorID   = '"& Uid    &"'  " & _
                               "and    P36_Ejercicio     =  "& Ejr    &"   " & _
                               "and    P36_ReactivoID    =  "& RactID &"   "
                        set rsD = dbconn.execute(sqlD)

                        for j=1 to Request.Form("ReactivoVL"&i).Count
                            RactVL = CInt(Request.Form("ReactivoVL"&i)(j))

                            sqli = "insert into HRM10533       " & _
                                   "values('5000',             " & _
                                   "       '"& Cid    &"',     " & _
                                   "       '"& Nem    &"',     " & _
                                   "       '"& Uid    &"',     " & _
                                   "        "& Ejr    &",      " & _
                                   "        "& RactID &",      " & _
                                   "        "& RactVL &")      "
                            set rsi = dbconn.execute(sqli)
'                           response.write("Sql : ")
 '                          response.write(sqli)
  '                         response.write("</br>")
                        next
                    else
                        RactID = Cint(request.form("ReactivoID"&i))
                        RactVL = trim(Request.Form("ReactivoVL"&i))

                        if RactVL > "" then

                            sqlV = "select P36_ReactivoID      " & _
                                   "from HRM10534              " & _
                                   "where  P36_CorporativoID = '5000'          " & _
                                   "and    P36_CompaniaID    = '"& Cid    &"'  " & _
                                   "and    P36_EmpleadoID    = '"& Nem    &"'  " & _
                                   "and    P36_EvaluadorID   = '"& Uid    &"'  " & _
                                   "and    P36_Ejercicio     =  "& Ejr    &"   " & _
                                   "and    P36_ReactivoID    =  "& RactID &"   "
                            set rsV = dbconn.execute(sqlV)
                            if not rsV.bof and not rsV.eof then
                                sqlU = "update HRM10534                            " & _
                                       "set    P36_ValorTexto    = '"& RactVL &"'  " & _
                                       "where  P36_CorporativoID = '5000'          " & _
                                       "and    P36_CompaniaID    = '"& Cid    &"'  " & _
                                       "and    P36_EmpleadoID    = '"& Nem    &"'  " & _
                                       "and    P36_EvaluadorID   = '"& Uid    &"'  " & _
                                       "and    P36_Ejercicio     =  "& Ejr    &"   " & _
                                       "and    P36_ReactivoID    =  "& RactID &"   "
                                set rsU = dbconn.execute(sqlU)
                            else
                                sqli = "insert into HRM10534       " & _
                                       "values('5000',             " & _
                                       "       '"& Cid    &"',     " & _
                                       "       '"& Nem    &"',     " & _
                                       "       '"& Uid    &"',     " & _
                                       "        "& Ejr    &",      " & _
                                       "        "& RactID &",      " & _
                                       "       '"& RactVL &"')     "
                                set rsi = dbconn.execute(sqli)
    '                           response.write("Sql : ")
     '                          response.write(sqli)
      '                         response.write("</br>")
                            end if

                        end if

                    end if
                end if
            next
            Tot = (Tot / Tpts) * 100
            sqlUpd = "update HRM10540                         " & _
                     "set   M36_Puntuacion    = "& Tot &",    " & _
                     "      M36_Estatus       = 4             " & _
                     "where M36_CorporativoID = '5000'        " & _
                     "and   M36_CompaniaID    = '"& Cid &"'   " & _
                     "and   M36_EmpleadoID    = '"& Nem &"'   " & _
                     "and   M36_Ejercicio     =  "& Ejr &"    " & _
                     "and   M36_EvaluadorID   = '"& Uid &"'   "
            set rsUpd = dbconn.execute(sqlUpd)
            
'<!-- VALIDAR SI SE DEBE ACTUALIZAR EL SEMAFORO DEL ENCUESTADO  -->

'            sqlUpd = "update HRM10502                         " & _
'                     "set Psm_Estatus         = 4             " & _
'                     "where Psm_Ejercicio     =  "& Ejr &"    " & _
'                     "and   Psm_CorporativoID = '5000'        " & _
'                     "and   Psm_CompaniaID    = '"& Cid &"'   " & _
'                     "and   Psm_EmpleadoID    = '"& Nem &"'   " & _
'                     "and   Psm_SemaforoID    = 'MAT3600010'  "
'            set rsUpd = dbconn.execute(sqlUpd)
'           response.write(sqlupd)

            Fhy = year(date) & "-" & month(date) & "-" & day(date)
            TskScr = "Hrm_PadeCnsm360.asp?Mdl=" & Mdl &  "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Cid=" & Cid
            TskDsc = Dsc & " - " & TskTx1
            sqlins = "insert into HRM10400                    " & _
                     "values('PADE',                          " & _
                     "       '',                              " & _
                     "       '"& Uid &"',                     " & _
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

'<!-- Aqui evitamos el error de envio de Emails en ambiente Local de Pruebas -->
'            Eml = ""
'<!-- -->
			if trim(Eml) <> "" then
'                response.write(deml)
                Dim myMail
                Set myMail=CreateObject("CDO.Message")
                myMail.Subject = TskDsc
                msgtext = "<b>" & EmMs01 & "</b>" & "</br></br><p>" & lnki & "</br></br><p>" & lnke 
    	        myMail.From = Emc
	            myMail.To = Eml
	            myMail.Cc = Vml
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

            response.redirect "Hrm_EmpPade.asp?Mdl=" & Mdl & "&Trn=" & Trn & "&Sid=" & Sid 

        end if
    end if
    '<!--  Procesamos Encuesta Inicio  -->


    '<!-- Busqueda Parametros (fin) -->

    Subtit = Nem & " - " & Nmb & " / " & Dsc
    %>


    <!-- Content Header (Page header) -->
    <% call hdr(TitPri,SubTit) %>

    <!-- Main content -->
    <section class="content">
        <!-- CONTENIDO PRINCIPAL INICIO -->
        <form action="Hrm_PadeEnc3603.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Nem=" & Nem & "&Nmb=" & Nmb & "&Cid=" & Cid & "&Sid=" & Sid %>" name="form1" onsubmit="return validate();" method="post">
            <!-- Se muestra la Encuesta - Inicio -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">
                        <img src="<%= Eim %>" style="height: 80px;" alt="<%= Nmb %>">
                         <%= Nem & " - " & Nmb %>
                    </h3>
                </div>
                <div class="box-body">
                    <%
                    sqlscr = "select a.*, b.Sct_Descripcion        " & _
                             "from HRM10303 a, HRM10302 b          " & _
                             "where a.Scp_TemaID   = b.Sct_TemaID  " & _
                             "and   a.Scp_ScriptID = '"& Sci &"'   " & _
                             "and   a.Scp_LngID    = '"& Lng &"'   " & _
                             "and   b.Sct_LngID    = '"& Lng &"'   " & _
                             "order by a.Scp_TemaID,               " & _
                             "         a.Scp_ReactivoID            "
                    set rs = dbconn.execute(sqlscr)
                    if not rs.eof and not rs.bof then
                        tant = ""
                        tact = ""
                        i    = 0
                        Tpts = 0
                        Mpts = 0
                        do while not rs.eof
                            i  = i  + 1
                            tact = trim(rs("Sct_Descripcion"))
                            if tact <> tant then
                                %>
                                <div class="box-header">
                                    <h3 class="box-title"><%= trim(rs("Sct_Descripcion")) %></h3>
                                </div><!-- /.box-header -->
                                <%
                                tant = tact
                            end if
                            %>
                            <div class="form-group">
                                <span class="badge bg-green"><%= trim(rs("Scp_ReactivoID")) %></span>
                                <input type="hidden" name="ReactivoID<%= i %>" value="<%= trim(rs("Scp_ReactivoID")) %>">
                                <label><%= trim(rs("Scp_Pregunta")) %></label>
                            </div>
                            <%
                            if rs("Scp_ReactivoID") <= 35 then 
                                sqlV = "select Scr_Descripcion, Scr_ValorNumerico                    " & _
                                       "from HRM10304                                                " & _
                                       "where Scr_ScriptID   = '" & Sci  & "'                        " & _
                                       "and   Scr_ReactivoID =  " & trim(rs("Scp_ReactivoID")) & "   " & _
                                       "and   Scr_LngID      = '" & Lng & "'                         " & _
                                       "order by Scr_ValorNumerico desc, Scr_Descripcion             "
                                set rsV = dbconn.execute(sqlV)
                                if not rsV.bof and not rsV.eof then
                                    if rs("Scp_ReactivoID") = 34 or rs("Scp_ReactivoID") = 35 then
                                        %>
                                        <div>
                                            <div class="form-group">
                                                <select class="form-control select2" name="ReactivoVL<%= i %>" id="ReactivoVL<%= i %>" multiple="multiple" data-placeholder="" required  >
                                        <%
                                        Mpts = 0
                                        j = 0
                                        do while not rsV.eof

                                            sqlR = "select P36_ValorNumerico from HRM10533                    " & _
                                                   "where P36_CorporativoID = '5000'                          " & _
                                                   "and   P36_CompaniaID    = '"& Cid &"'                     " & _
                                                   "and   P36_EmpleadoID    = '"& Nem &"'                     " & _
                                                   "and   P36_EvaluadorID   = '"& Uid &"'                     " & _
                                                   "and   P36_Ejercicio     =  "& Ejr &"                      " & _
                                                   "and   P36_ReactivoID    =  "& rs("Scp_ReactivoID") &"     " & _
                                                   "and   P36_ValorNumerico =  "& rsV("Scr_ValorNumerico") &" "
                                            set rsR = dbconn.execute(sqlR)
                                            if not rsR.eof and not rsR.bof then
                                                Rvn = rsR("P36_ValorNumerico")
                                            else
                                                Rvn = ""
                                            end if

                                            j = j + 1
                                            if rsV("Scr_ValorNumerico") > Mpts then
                                                Mpts = rsV("Scr_ValorNumerico")
                                            end if
                                            if rsV("Scr_ValorNumerico") = Rvn then
                                                %>
                                                <option id="ReactivoVL<%= i & j %>" value="<%= trim(rsV("Scr_ValorNumerico")) %>" selected><%= trim(rsV("Scr_Descripcion")) %></option>
                                                <%
                                            else
                                                %>
                                                <option id="ReactivoVL<%= i & j %>" value="<%= trim(rsV("Scr_ValorNumerico")) %>"><%= trim(rsV("Scr_Descripcion")) %></option>
                                                <%
                                            end if
                                            rsV.movenext
                                        loop
                                        rsV.close
                                        set rsV = Nothing
                                        %>
                                                </select>
                                            </div>
                                        </div>
                                        <%
                                    else
                                        sqlR = "select P36_ValorNumerico from HRM10533   " & _
                                               "where P36_CorporativoID = '5000'         " & _
                                               "and   P36_CompaniaID    = '"& Cid &"'    " & _
                                               "and   P36_EmpleadoID    = '"& Nem &"'    " & _
                                               "and   P36_EvaluadorID   = '"& Uid &"'    " & _
                                               "and   P36_Ejercicio     =  "& Ejr &"     " & _
                                               "and   P36_ReactivoID    =  "& rs("Scp_ReactivoID") &"  "
                                        set rsR = dbconn.execute(sqlR)
                                        if not rsR.eof and not rsR.bof then
                                            Rvn = rsR("P36_ValorNumerico")
                                        else
                                            Rvn = ""
                                        end if

                                        Mpts = 0
                                        %>
                                        <div class="row fontawesome-icon-list">
                                        <%
                                        do while not rsV.eof
                                            if rsV("Scr_ValorNumerico") > Mpts then
                                                Mpts = rsV("Scr_ValorNumerico")
                                            end if
                                            %>
                                            <div class="col-md-3 col-sm-4">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <%
                                                            if rsV("Scr_ValorNumerico") = Rvn then
                                                                %>
                                                                <input type="radio" name="ReactivoVL<%= i %>" id="ReactivoVL<%= i %>" value="<%= rsV("Scr_ValorNumerico") %>" checked="checked" required >
                                                                <%
                                                            else
                                                                %>
                                                                <input type="radio" name="ReactivoVL<%= i %>" id="ReactivoVL<%= i %>" value="<%= rsV("Scr_ValorNumerico") %>" required >
                                                                <%
                                                            end if
                                                            %>
                                                        </span>
                                                        <input type="text" class="form-control" value="<%= trim(rsV("Scr_Descripcion")) %>" />
                                                    </div>
                                                </div>
                                            </div>
                                            <%
                                            rsV.movenext
                                        loop
                                        rsV.close
                                        set rsV = Nothing
                                        %>
                                        </div>
                                        <%
                                    end if
                                end if
                            else
                                sqlR = "select P36_ValorTexto from HRM10534      " & _
                                       "where P36_CorporativoID = '5000'         " & _
                                       "and   P36_CompaniaID    = '"& Cid &"'    " & _
                                       "and   P36_EmpleadoID    = '"& Nem &"'    " & _
                                       "and   P36_EvaluadorID   = '"& Uid &"'    " & _
                                       "and   P36_Ejercicio     =  "& Ejr &"     " & _
                                       "and   P36_ReactivoID    =  "& rs("Scp_ReactivoID") &"  "
                                set rsR = dbconn.execute(sqlR)
                                if not rsR.eof and not rsR.bof then
                                    Rvn = rsR("P36_ValorTexto")
                                else
                                    Rvn = ""
                                end if
                                %>
                                <div class="form-group">
                                    <textarea class="form-control" name="ReactivoVL<%= i %>" id="ReactivoVL<%= i %>" rows="2"><%= Rvn %></textarea>
                                </div>
                                <%
                            end if
                            Tpts = Tpts + Mpts
                            rs.movenext
                        loop
                    end if
                    %>
                </div>
            </div>
            
            <div class="box-footer" style="text-align: center">
                <input type="hidden" name="Sci"  id="Sci"  value="<%= Sci %>" />
                <input type="hidden" name="Tpts" id="Tpts" value="<%= Tpts %>" />
                <input type="hidden" name="Ind"  id="Ind"  value="<%= i %>" />
                <button type="submit" class="btn btn-primary" name="Sbt1" id="Sbt1" value="Sbt1"><%= SmBtn1 %></button>
            </div>
            <!-- Se muestra la Encuesta - Final  -->
        </form>
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
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
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
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });

    //Initialize Select2 Elements
    $(".select2").select2();

  });
</script>

<script>
    function validate() {

        var i = document.getElementById("ReactivoVL34").length;
        var n34 = 0;
        var j = document.getElementById("ReactivoVL35").length;
        var n35 = 0;


        for (x = 1; x <= i; x++) {
            if (document.getElementById("ReactivoVL34" + x)) {
                opcion34 = document.getElementById("ReactivoVL34" + x);
                if (opcion34.selected) {
                    n34 = n34 + 1
                }
            }
        }
        if (n34 < 3) {
            alert('Debe seleccionar 3 Fortalezas / Please select 3 strengths');
            return false;
        }
        if (n34 > 3) {
            alert('Debe seleccionar solamente 3 Fortalezas / Select only 3 strengths');
            return false;
        }



        for (y = 1; y <= j; y++) {
            if (document.getElementById("ReactivoVL35" + y)) {
                opcion35 = document.getElementById("ReactivoVL35" + y);
                if (opcion35.selected) {
                    n35 = n35 + 1
                }
            }
        }
        if (n35 < 3) {
            alert('Debe seleccionar 3 Areas de Oportunidad / Please select 3 weaknesses');
            return false;
        }
        if (n35 > 3) {
            alert('Debe seleccionar solamente 3 Areas de Oportunidad / Select only 3 weaknesses' );
            return false;
        }

    }
</script>

</body>
</html>

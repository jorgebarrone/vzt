<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HRM Verzatec | PADE - Contestar Encuesta Habilidades</title>
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
    sqlTrn = "select Trd_ElementoID, Trd_Texto from HRM10002 where Trd_TransaccionID = 'EvPADE0400' and Trd_IdiomaID = '"& Lng &"'  "
    
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
    Dim Eid
    Dim Ejr
    Dim Eja
    Dim Dsc
    Dim Nem
    Dim Nmb
    Dim Cid
    Dim Sbt1
    Dim Tpts
    Dim Sci
    Dim Ind
    Eid = trim(Request.QueryString("Eid"))
    Ejr = CInt(Request.QueryString("Ejr"))
    Dsc = Request.QueryString("Dsc")
    Nem = Request.QueryString("Nem")
    Nmb = Request.QueryString("Nmb")
    Cid = Request.QueryString("Cid")
    Scr = ""
    Eja = Ejr - 1
    Sci = Request.Form("Sci")
    Ind = Request.Form("Ind")
    Sbt1 = Request.Form("Sbt1")
    Tpts = Request.Form("Tpts")

'    Response.write(Tpts)

    '<!--  Buscamos la Encuesta de Habilidades del Ejercicio Anterior Inicio -->
    sqlScr = "select Pnc_EncuestaHab from HRM10523 where Pnc_Ejercicio = "& Eja &"   "
    set rsScr = dbconn.execute(sqlScr)
    if not rsScr.bof and not rsScr.eof then
        Sci = trim(rsScr("Pnc_EncuestaHab"))
    end if
    '<!--  Buscamos la Encuesta de Habilidades del Ejercicio Anterior Final  -->

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

    '<!--  Procesamos Encuesta Inicio  -->
    if Sbt1 = "Sbt1" then
        Tot = 0
        if Ind > "" then
            Ind = Cint(Ind)
            for i = 1 to Ind
                RactID = Cint(request.form("ReactivoID"&i))
                RactVL = Cint(request.form("ReactivoVL"&i))
                Tot    = Tot + RactVL
                if RactID > 0 then
                    sqlV = "select Phb_ReactivoID      " & _
                           "from HRM10532              " & _
                           "where  Phb_CorporativoID = '5000'          " & _
                           "and    Phb_CompaniaID    = '"& Cid    &"'  " & _
                           "and    Phb_EmpleadoID    = '"& Nem    &"'  " & _
                           "and    Phb_Ejercicio     =  "& Eja    &"   " & _
                           "and    Phb_ReactivoID    =  "& RactID &"   "
                    set rsV = dbconn.execute(sqlV)
                    if not rsV.bof and not rsV.eof then
                        sqlU = "update HRM10532                            " & _
                               "set    Phb_ValorNumerico =  "& RactVL &"   " & _
                               "where  Phb_CorporativoID = '5000'          " & _
                               "and    Phb_CompaniaID    = '"& Cid    &"'  " & _
                               "and    Phb_EmpleadoID    = '"& Nem    &"'  " & _
                               "and    Phb_Ejercicio     =  "& Eja    &"   " & _
                               "and    Phb_ReactivoID    =  "& RactID &"   "
                        set rsU = dbconn.execute(sqlU)
                    else
                        sqli = "insert into HRM10532       " & _
                               "values('5000',             " & _
                               "       '"& Cid    &"',     " & _
                               "       '"& Nem    &"',     " & _
                               "        "& Eja    &",      " & _
                               "        "& RactID &",      " & _
                               "        "& RactVL &")      "
                        set rsi = dbconn.execute(sqli)
    '                   response.write("Sql : ")
    '                   response.write(sqli)
    '                   response.write("</br>")
                    end if
                end if
            next
            Tot = (Tot / Tpts) * 100
            sqlUpd = "update HRM10525                         " & _
                     "set   Evh_ResCalc       = "& Tot &",    " & _
                     "      Evh_Estatus       = 3             " & _
                     "where Evh_CorporativoID = '5000'        " & _
                     "and   Evh_CompaniaID    = '"& Cid &"'   " & _
                     "and   Evh_EmpleadoID    = '"& Nem &"'   " & _
                     "and   Evh_Ejercicio     =  "& Eja &"    " & _
                     "and   Evh_TipoEval      = 3             "
            set rsUpd = dbconn.execute(sqlUpd)
            
            sqlUpd = "update HRM10502                         " & _
                     "set Psm_Estatus         = 2             " & _
                     "where Psm_Ejercicio     =  "& Ejr &"    " & _
                     "and   Psm_CorporativoID = '5000'        " & _
                     "and   Psm_CompaniaID    = '"& Cid &"'   " & _
                     "and   Psm_EmpleadoID    = '"& Nem &"'   " & _
                     "and   Psm_SemaforoID    = 'OBJHAB0010'  "
            set rsUpd = dbconn.execute(sqlUpd)
'           response.write(sqlupd)

            Fhy = year(date) & "-" & month(date) & "-" & day(date)
            TskScr = "Hrm_PadeCnsCieHab.asp?Mdl=" & Mdl &  "&Trn=" & Trn & "&Ejr=" & Ejr & "&Nem=" & Nem & "&Nmb=" & Nmb & "&Dsc=" & Dsc & "&Cid=" & Cid
            TskDsc = Dsc & " - " & TskTx1
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
			    if trim(HdrNml) <> "" then
    '                response.write(deml)
                    Dim myMail
                    Set myMail=CreateObject("CDO.Message")
                    myMail.Subject = TskDsc
                    msgtext = "<b>" & EmMs01 & "</b>" & "</br></br><p>" & lnki & "</br></br><p>" & lnke 
    	            myMail.From = Emc
	                myMail.To = HdrNml
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
        <form action="Hrm_PadeCieHab.asp?Mdl=<%= Mdl & "&Trn=" & Trn & "&Ejr=" & Ejr & "&Dsc=" & Dsc & "&Eid=" & Eid & "&Nem=" & Nem & "&Nmb=" & Nmb & "&Cid=" & Cid & "&Sid=" & Sid %>" name="form1" method="post">
            <!-- Se muestra la Encuesta - Inicio -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">
                        <img src="<%= HdrNim %>" style="height: 45px;" alt="<%= HdrNmb %>">
                        <%= Nem & " - " & HdrNmb & " - " & HdrNpd%>
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
                            sqlV = "select Scr_Descripcion, Scr_ValorNumerico                    " & _
                                   "from HRM10304                                                " & _
                                   "where Scr_ScriptID   = '" & Sci  & "'                        " & _
                                   "and   Scr_ReactivoID =  " & trim(rs("Scp_ReactivoID")) & "   " & _
                                   "and   Scr_LngID      = '" & Lng & "'                         " & _
                                   "order by Scr_ValorNumerico desc                              "
                            set rsV = dbconn.execute(sqlV)
                            if not rsV.bof and not rsV.eof then
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
                                                    <input type="radio" name="ReactivoVL<%= i %>" id="ReactivoVL<%= i %>" value="<%= rsV("Scr_ValorNumerico") %>" required>
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
  });
</script>

</body>
</html>
